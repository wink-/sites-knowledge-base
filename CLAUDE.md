# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a multi-site content management system for seven interconnected websites, serving as a centralized knowledge base for research, content planning, and site management. The primary focus includes independence/self-reliance content sites targeting $12K annual revenue through content marketing, affiliate programs, digital products, and consulting services, plus professional business sites and personal projects.

## Architecture Pattern

**Multi-Site Knowledge Base**: Each site is a separate project within the parent directory, designed as individual git repositories that can be managed collectively. This enables:
- Shared development workflows via automation scripts
- Individual site deployment to Cloudflare Pages
- Cross-site content promotion and audience sharing
- Centralized business strategy documentation
- Research and content planning across all projects

## The Sites - github, link, tech stack, subject matter, revenue target
### See SITES.md for more detailed information on each site.

### Content Revenue Sites  
- **ai-independence** (`ai-independence.com`): (Hugo Site - Terminal Theme - Hacker Aesthetic) Technical privacy/surveillance resistance - $3000/year target 
- **ai-sovereignty** (`ai-sovereignty.com`): (Hugo Site - Terminal Theme - Hacker Aesthetic) Political resistance to AI control - $3500/year target
- **the-independent-home** (`theindependenthome.com`): (Hugo Site - ananke theme ) Practical independence guides - $5500/year target

### Business Sites
- **radiant-home-solutions** (`radianthomesolutions.com`): (Hugo Site - ananke theme) Primary handyman business landing page and portfolio
- **radiant-gardens** (`radiantgardens.co`): (static html, css) New business idea for building gardens

### Hobby Sites
- **open-source-apocalypse**: (`opensourceapocalypse.com`): (Hugo Site) Maker/DIY projects with cyberpunk aesthetic (terminal theme)
- **winkky-farms**: (`winkkyfarms.com`): (Hugo Site - custom theme) Personal farm blog for authenticity (ananke theme)

## Development Workflow

### ⚠️ CRITICAL WORKFLOW RULES - READ BEFORE STARTING ANY WORK

**MANDATORY: Always sync repositories before starting work**

Before making any changes, you MUST ensure all submodules are up-to-date with their remotes. This prevents conflicts and ensures you're working on the latest code.

```bash
# ALWAYS run this first before any work
git pull --recurse-submodules

# Then check each submodule individually
git submodule foreach 'git pull origin main || git pull origin master'

# Verify all submodules are clean
git submodule status
git submodule foreach 'git status'
```

**MANDATORY: Always work in a branch or worktree**

NEVER commit directly to the main/master branch of any submodule. Always create a branch first:

```bash
# Navigate to the site you'll work on
cd [site-directory]

# Option 1: Create a feature branch (recommended for single tasks)
git checkout -b feature/descriptive-task-name

# Option 2: Create a worktree (recommended for parallel work)
cd ..
git worktree add [site-directory]-taskname [branch-name]
cd [site-directory]-taskname

# After completing work:
# - Merge or create PR for branch
# - Or delete worktree when done: git worktree remove [worktree-path]
```

**Why this matters:**
- Submodules can be behind their remotes (as we discovered)
- Pushing without pulling first causes conflicts
- Working on main/master makes rollback difficult
- Branches isolate changes and enable safe experimentation

**Pre-work checklist:**
1. ✅ Ran `git pull --recurse-submodules`
2. ✅ Ran `git submodule foreach 'git pull'` on each site
3. ✅ Confirmed `git status` shows clean or expected changes
4. ✅ Created feature branch or worktree for new work
5. ✅ Verified branch with `git branch`

### Initial Setup (New Computer)
```bash
# Clone the repository with all submodules
git clone --recurse-submodules https://github.com/wink-/sites-knowledge-base.git
cd sites-knowledge-base

# Run the setup script (first time only)
./setup.sh
```

### Daily Workflow (Any Computer)
```bash
# Quick start for daily work
./quick-start.sh

# Or manually update everything
git pull --recurse-submodules
```

### Key Commands
```bash
# Update all git repositories in subdirectories
./update-sites.sh

# Interactive post creation with VS Code integration (Hugo sites only)
./new-post.sh

# Start all development servers at once
./dev-servers.sh

# Individual site development (Hugo sites)
cd [site-directory]
hugo server -D

# Production build with optimization (Hugo sites)
cd [site-directory] 
hugo --gc --minify

# Static HTML site development
cd [static-site-directory]
# Use live-server or similar for local development
python -m http.server 8000  # or npx live-server

# Quick development server on specific port
hugo server -D -p 1314

# Git submodule operations
git submodule update --init --recursive    # Initialize submodules
git pull --recurse-submodules              # Update parent & submodules
git submodule status                       # Check submodule states
git submodule summary                      # See submodule changes
```

### Development Server Ports
| Site | Port | Type | Command |
|------|------|------|---------|
| the-independent-home | 1313 | Hugo | `hugo server -D -p 1313` |
| ai-independence | 1314 | Hugo | `hugo server -D -p 1314` |
| ai-sovereignty | 1315 | Hugo | `hugo server -D -p 1315` |
| radiant-home-solutions | 1316 | Hugo | `hugo server -D -p 1316` |
| open-source-apocalypse | 1317 | Hugo | `hugo server -D -p 1317` |
| winkky-farms | 1318 | Hugo | `hugo server -D -p 1318` |
| radiant-gardens | 8000 | Static | `python -m http.server 8000` |

### Content Production Schedule
- **Total Output**: 6-8 posts/week across all sites
- **Batch Creation**: Structured weekly workflow with AI-assisted writing
- **Publishing Pattern**: Monday through Friday with weekend preparation

### Site Development Workflow
1. **Make changes in submodule**: Navigate to site directory, edit content, commit & push
2. **Update parent repository**: Add submodule changes, commit with descriptive message
3. **Local development**: Use `hugo server -D` for draft preview
4. **Production**: Remove `draft: true` from front matter, build with `hugo --gc --minify`

## Site Architecture

### Hugo Sites Structure (ai-independence, ai-sovereignty, the-independent-home, radiant-home-solutions, open-source-apocalypse, winkky-farms)
```
site-directory/
├── hugo.toml              # Site configuration
├── content/
│   ├── posts/            # Blog posts
│   └── about.md          # Static pages
├── static/
│   └── lead-magnets/     # Digital products
├── themes/
│   ├── terminal/         # Hacker aesthetic theme
│   └── ananke/           # Clean blog theme
├── layouts/
│   └── partials/
│       └── email-capture.html  # Custom email capture
└── public/               # Generated site (build output)
```

### Static HTML Sites Structure (radiant-gardens)
```
site-directory/
├── index.html            # Main landing page
├── css/
│   └── styles.css        # Site styles
├── js/
│   └── main.js           # Site functionality
├── images/               # Site images
└── pages/                # Additional HTML pages
```

### Key Configuration Files

**Hugo Configuration** (`hugo.toml`):
- Site-specific settings (baseURL, title, theme)
- Menu structure and navigation
- Theme-specific parameters
- Content organization rules

**Cloudflare Pages Configuration**:
- Build command: `hugo --gc --minify` (Hugo sites) or no build (static sites)
- Output directory: `public` (Hugo) or root directory (static)
- Hugo version: 0.147.9 (set in environment variables for Hugo sites)
- Environment-specific builds (production, preview, branch)

## Business Model Integration

### Monetization Architecture
- **Affiliate Marketing**: VPNs, solar equipment, privacy tools
- **Digital Products**: Courses, guides, toolkits ($47-$197 each)
- **Consulting Services**: $200-$500/hour, system design packages
- **Lead Magnets**: Email capture integrated via custom partials

### Revenue Targets (documented in MASTER-SITE-GUIDE.md)
- **6-month goal**: $1K/month combined
- **Traffic target**: 5K visitors/month
- **Email subscribers**: 500 total
- **Product sales**: 20+ units/month

## Content Strategy

### Site-Specific Content Focus
- **AI Independence**: Tuesday tutorials, Friday countermeasures
- **AI Sovereignty**: Monday analysis, Thursday action guides  
- **Independent Home**: Monday energy, Wednesday finance, Friday food
- **Radiant Home Solutions**: Project showcases, before/after galleries, service offerings
- **Radiant Gardens**: Garden design portfolios, client testimonials, service packages
- **Supporting sites**: Variable schedules supporting main sites

### Content Production Tools
- **new-post.sh**: Interactive post creation with VS Code auto-launch (Hugo sites only)
- **VS Code integration**: Automatic editor opening for new posts
- **Hugo server**: Auto-starts development server during post creation
- **Static site development**: Live-server or Python HTTP server for local development

## Deployment & Hosting

### Cloudflare Pages Integration
- **Automatic deployment**: Git-based builds on push
- **Hugo version**: 0.147.9 (specified in environment variables)
- **Build optimization**: `--gc --minify` flags
- **Environment handling**: Production, preview, and branch deploys
- **CDN**: Global edge network for fast content delivery
- **SSL**: Automatic HTTPS with Cloudflare certificates

### Development Environment
- **Prerequisites**: Hugo 0.147.9+ (for Hugo sites), Git, VS Code, Python/Node.js (for static sites)
- **Local development**: `hugo server -D` for draft content (Hugo sites)
- **Static site development**: Live-server, Python HTTP server, or VS Code Live Server extension
- **Theme management**: Terminal (hacker) and Ananke (clean) themes for Hugo sites
- **Asset handling**: Lead magnets and email capture forms
- **Content management**: Direct file editing (no CMS dependency)

## Key Business Documents

- **MASTER-SITE-GUIDE.md**: Complete business strategy, revenue projections, content calendars
- **content-workflow.md**: Publishing schedules and content creation guidelines  
- **monetization-examples.md**: Specific affiliate and product examples
- **content-ideas.md**: Content planning and topic research

## Git Submodule Architecture

This repository uses **git submodules** for each site, allowing individual site management while maintaining centralized coordination. Each site directory is a separate git repository:

### Working with Submodules
```bash
# Clone with all submodules
git clone --recurse-submodules https://github.com/wink-/sites-knowledge-base

# Update a specific submodule after changes
cd ai-independence
git add . && git commit -m "Update content" && git push
cd ..
git add ai-independence && git commit -m "Update ai-independence submodule"

# Sync after team changes
git pull --recurse-submodules

# Check submodule status
git submodule foreach 'echo $name: && git status'
```

### Publishing Workflow
1. **Local development**: Edit content, use `hugo server -D` for preview
2. **Content ready**: Remove `draft: true` from front matter
3. **Build & test**: Run `hugo --gc --minify` to verify build
4. **Deploy**: Push to submodule repository (triggers Cloudflare Pages deployment)
5. **Update parent**: Add submodule changes to parent repository

## Development Notes

### Current Issues (as of 2025-01-19)
- **Theme Submodules**: Some sites have uninitialized theme submodules (resolved during site fixes)
  - ai-independence, ai-sovereignty, open-source-apocalypse needed terminal theme init
  - winkky-farms, radiant-home-solutions needed ananke theme init
  - All themes now properly initialized and building
- **Submodule Sync**: Submodules can become out of sync with remotes
  - Always run `git pull --recurse-submodules` before any work
  - Always check `git submodule foreach 'git status'` for unpushed changes
- **Branch Hygiene**: No enforced branching strategy
  - Always work in feature branches or worktrees
  - Never commit directly to main/master in submodules
- **Path Dependencies**: Some scripts contain hardcoded paths that may need updating
- **Script Maintenance**: new-post.sh uses dynamic paths but may need site-specific updates
- **Multi-Technology Setup**: Need to develop workflows for both Hugo and static HTML sites

### Architecture Strengths
- **Scalable Content Production**: Automated workflows support high-volume publishing
- **Professional Deployment**: Cloudflare Pages integration with global CDN and proper environment handling
- **Business Integration**: Revenue tracking and monetization built into content strategy
- **Cross-Site Promotion**: Shared audiences while maintaining distinct site voices
- **Performance**: Cloudflare's global edge network ensures fast content delivery worldwide
- **Multi-Technology Flexibility**: Support for both Hugo and static HTML sites
- **Centralized Knowledge Base**: Research, planning, and documentation in one place