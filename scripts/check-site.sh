#!/usr/bin/env bash
# check-site.sh — automated pre-launch checks for fleet Hugo sites.
# Covers the [auto] items in docs/launch-checklist.md. Usage:
#   scripts/check-site.sh <site-directory> [--keep-build]
#
# Builds the site (hugo extended required), then checks:
#   1. build succeeds without warnings
#   2. no placeholder strings in built HTML
#   3. all internal links resolve to built files
#   4. referenced static assets exist (og-image, favicon)
#   5. menu/category 404s (links to /categories/* pages that don't exist)
#   6. Sveltia CMS media folder exists
#
# Exit code 0 = all checks pass. Any FAIL line = fix before launch.

set -u

SITE_DIR="${1:?usage: check-site.sh <site-directory> [--keep-build]}"
KEEP_BUILD="${2:-}"

cd "$SITE_DIR" || { echo "FAIL: cannot cd into $SITE_DIR"; exit 1; }

ERRORS=0
fail() { echo "FAIL: $*"; ERRORS=$((ERRORS + 1)); }
pass() { echo "  ok: $*"; }

echo "== check-site: $SITE_DIR =="

# --- 0. toolchain & theme ---
if ! command -v hugo >/dev/null; then
  fail "hugo not installed (need hugo extended)"
  exit 1
fi
hugo version | grep -q "+extended" || fail "hugo is not the extended build (SCSS themes need it)"

if [ -f .gitmodules ] && [ -n "$(git config --file .gitmodules --get-regexp 'submodule\..*\.path' 2>/dev/null)" ]; then
  git config --file .gitmodules --get-regexp 'submodule\..*\.path' | while read -r _ path; do
    [ -n "$(ls -A "$path" 2>/dev/null)" ] || fail "submodule $path is empty — run: git submodule update --init --recursive"
  done
fi

# --- 1. build ---
echo "-- build --"
BUILD_LOG=$(mktemp)
if ! hugo --printPathWarnings --cleanDestinationDir >"$BUILD_LOG" 2>&1; then
  fail "hugo build failed:"; sed 's/^/    /' "$BUILD_LOG"
  exit 1
fi
if grep -qE "^WARN|^ERROR" "$BUILD_LOG"; then
  fail "build produced warnings:"
  grep -E "^WARN|^ERROR" "$BUILD_LOG" | sed 's/^/    /'
else
  pass "clean build, no warnings"
fi
rm -f "$BUILD_LOG"

[ -d public ] || { fail "no public/ output"; exit 1; }

# --- 2. placeholder sweep ---
echo "-- placeholder sweep --"
PLACEHOLDER_RE='your-email-service\.com|example\.com/subscribe|CHANGE_ME|YOUR_API_KEY|lorem ipsum'
HITS=$(grep -rlE "$PLACEHOLDER_RE" public/ --include="*.html" 2>/dev/null || true)
if [ -n "$HITS" ]; then
  echo "$HITS" | while read -r f; do fail "placeholder string in $f"; done
else
  pass "no placeholder strings in built HTML"
fi

# --- 3. internal link resolution ---
echo "-- internal links --"
MISSING_LINKS=0
grep -rhoE 'href="/[a-zA-Z0-9/_.-]*"' public/ --include="*.html" \
  | sed 's/href=//;s/"//g' | sort -u | while read -r p; do
    case "$p" in
      *".xml"|*".json"|*".css"|*".js"|*".ico"|*".png"|*".jpg"|*".svg"|*".woff2"|*".md"|*".txt"|*".webmanifest")
        [ -f "public${p}" ] || echo "MISSING:$p" ;;
      *) [ -f "public${p}index.html" ] || [ -f "public${p%/}" ] || echo "MISSING:$p" ;;
    esac
  done | (MISSING=0; while read -r line; do
    [ "${line#MISSING:}" != "$line" ] && { fail "unresolved link ${line#MISSING:}"; MISSING=1; }
  done; exit $MISSING) || MISSING_LINKS=1
[ $MISSING_LINKS -eq 0 ] && pass "all internal links resolve"

# --- 4. key assets ---
echo "-- assets --"
BASEURL=$(hugo config 2>/dev/null | grep -E '^baseURL' | head -1 | sed 's/.*= *"//;s/".*//')
for asset in og-image.png favicon.ico; do
  [ -f "static/$asset" ] || fail "static/$asset missing (broken og:image / favicon)"
done
if grep -rq 'fonts/.*\.woff2' layouts/ 2>/dev/null; then
  grep -rhoE '/fonts/[a-zA-Z0-9._-]+\.woff2' layouts/ | sort -u | while read -r f; do
    [ -f "static${f}" ] || fail "layout references ${f} but static file missing"
  done
fi
pass "asset references checked"

# --- 5. menu / taxonomy 404s ---
echo "-- menu vs taxonomy --"
if grep -rq '/categories/' hugo.toml config.toml config/ 2>/dev/null; then
  MENUCATS=$(grep -hoE '/categories/[a-z-]+/' hugo.toml config.toml config/*.* 2>/dev/null | sort -u)
  for caturl in $MENUCATS; do
    [ -f "public${caturl}index.html" ] || fail "menu links to ${caturl} but that taxonomy page doesn't exist (add categories frontmatter or fix menu)"
  done
  pass "menu category links checked"
else
  pass "no category menu links"
fi

# --- 6. CMS ---
echo "-- CMS --"
if [ -f static/admin/config.yml ]; then
  MEDIA=$(grep -E '^media_folder:' static/admin/config.yml | sed 's/.*: *//')
  [ -n "$MEDIA" ] && [ ! -d "$MEDIA" ] && fail "CMS media_folder '$MEDIA' does not exist"
  pass "CMS config present"
else
  pass "no CMS (static/admin/config.yml absent)"
fi

# --- summary ---
echo "== result: $ERRORS failure(s) =="
[ "$KEEP_BUILD" != "--keep-build" ] && rm -rf public
exit $ERRORS
