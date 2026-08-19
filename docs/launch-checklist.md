# Site Launch Checklist

The standard pre-launch gate for any site in the fleet. Developed from the ai-independence.com launch pilot (August 2026). Run every item before pushing to the deploy branch — **pushing to the deploy branch IS the production deploy** (Cloudflare Pages auto-deploys).

Quick automated pass: `scripts/check-site.sh <site-directory>` covers items marked **[auto]**. The rest need human/agent judgment.

## 1. Build Verification **[auto]**

- [ ] Hugo extended installed (`hugo version` shows `+extended`)
- [ ] Theme submodule checked out: `git submodule update --init --recursive` (an empty `themes/<theme>/` dir means the site CANNOT build — this ships silently if nobody builds locally)
- [ ] Clean production build: `hugo --printPathWarnings` exits 0, no `ERROR`/`WARN` lines
- [ ] Inline HTML actually renders (Goldmark `unsafe = true` configured if content uses raw HTML — otherwise the HTML is silently stripped)
- [ ] No deprecated config keys (e.g. `languageCode` → `locale` on recent Hugo)

## 2. Placeholder & Fabrication Sweep **[auto for strings]**

- [ ] No placeholder endpoints in built HTML (`your-email-service.com`, `example.com`, `CHANGE_ME`, `TODO`)
- [ ] Email capture: either wired to a REAL provider endpoint, or disabled site-wide. Never ship a form that POSTs to nothing. Prefer a param gate (e.g. `enableEmailCapture` + `emailCaptureEndpoint`) so enabling requires both flags
- [ ] No fabricated social proof: invented download counts, "4.9/5 rating", fake testimonials, fake user numbers
- [ ] No fake urgency: countdown timers that count to nothing, "expires in 47:23", "limited time" on evergreen freebies
- [ ] No invented stats presented as fact (made-up percentages, "$X trillion", precise personal data from a nonexistent experiment). Illustrative math must be labeled illustrative
- [ ] Structured data is truthful: no `sameAs` to accounts that don't exist, no boilerplate FAQ schema, no SearchAction pointing at a search feature the site doesn't have
- [ ] Income/earnings claims are evergreen and hedged, with an "illustrative, not a promise" note where numbers appear

## 3. Affiliate & Link Hygiene **[auto for internal links]**

- [ ] No invented affiliate slugs (e.g. `amzn.to/made-up-slug`) — either real tracked IDs (with a disclosure page) or plain vendor links
- [ ] Every vendor link goes somewhere real (official product/vendor pages, not fabricated shortlinks)
- [ ] All internal links resolve in `public/` (the check script does this)
- [ ] External links don't leak affiliate params the site doesn't own

## 4. Navigation & Taxonomy **[auto]**

- [ ] Every menu entry resolves to a generated page (classic failure: menu links to `/categories/x/` but no content sets `categories` frontmatter → 404)
- [ ] Menu count matches theme cap (`showMenuItems` in terminal theme)
- [ ] About page exists, is not a draft, and has actual content

## 5. Required Pages

- [ ] **About** — real content, honest positioning, no fake team/history
- [ ] **Privacy policy** — must match reality (if the site claims "no analytics", verify none is installed). Template: `project-manager/templates/legal-pages/privacy-policy.md`
- [ ] **Affiliate disclosure** — required if any monetization exists or may exist. Template: `project-manager/templates/legal-pages/affiliate-disclosure.md`
- [ ] **Contact** — a channel that actually works (GitHub issues is fine; don't publish an unmonitored email)
- [ ] Legal pages linked from the footer on every page
- [ ] Lead magnet/landing pages: claims reviewed for accuracy, download works without a working email provider if capture is disabled

## 6. Assets & SEO **[auto for missing files]**

- [ ] `og-image.png` (1200×630) exists in `static/` — otherwise every page ships a broken `og:image`
- [ ] Favicon exists and is linked in `<head>`
- [ ] No preloads/fonts/CSS references to files that don't exist
- [ ] `robots.txt` sitemap URL matches the real domain
- [ ] Per-post `description` frontmatter present (that's the meta description / OG description)
- [ ] Cover images referenced by frontmatter actually exist (or the field is empty)

## 7. Content Frontmatter Consistency **[auto for schema drift]**

- [ ] One author convention across all posts (e.g. `ai-free`), one date format (unquoted TOML datetime)
- [ ] Titles don't contradict dates (no "2024 Guide" on a 2025 post)
- [ ] `categories` used consistently where menus depend on them
- [ ] Draft status intentional: list `hugo list all` drafts and confirm each should be a draft

## 8. CMS (Sveltia) **[auto for config presence]**

- [ ] `static/admin/config.yml` repo/branch matches the deploy branch (`master` vs `main` — check per site)
- [ ] CMS media folder exists (`static/images/uploads/` or configured equivalent)
- [ ] CMS schema fields match the frontmatter posts actually use (a `draft` field in the summary template but not the schema breaks the admin UI)

## 9. Deploy & Verify

- [ ] Work merged to the deploy branch only AFTER items 1-8 pass
- [ ] Post-push: homepage 200, a category/post page 200, `sitemap.xml` 200, `robots.txt` 200
- [ ] View-source on live homepage: placeholder sweep strings absent
- [ ] Cloudflare Dashboard > Pages > site > Deployments: build green (per `common-tasks.md`)

## Fleet Notes

- Fleet directory, repos, branches, and admin URLs: see the [Site Directory](../README.md) in this repo's README
- Known-good example of each fixed pattern: the `ai-independence` repo, launch commit series (Aug 2026)
- After launch, log it in `publishing-log.md` and update the site's own `docs/status.md`
