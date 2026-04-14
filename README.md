# Sites Knowledge Base

Local clones of Rob's content/business sites, all deployed on Cloudflare Pages.

## Site Directory

### theindependenthome.com
- **Directory:** `the-independent-home/`
- **Repo:** [wink-/the-independent-home](https://github.com/wink-/the-independent-home)
- **Branch:** master
- **Stack:** Hugo + Ananke theme
- **Admin:** [/admin/](https://theindependenthome.com/admin/) (Sveltia CMS)
- **About:** Personal independence blog -- solar, energy, food, money, skills. Written in authentic first-person voice with real numbers and honest progress reports.

### ai-independence.com
- **Directory:** `ai-independence/`
- **Repo:** [wink-/ai-independence](https://github.com/wink-/ai-independence)
- **Branch:** master
- **Stack:** Hugo + Terminal theme (cyberpunk green-on-black aesthetic)
- **Admin:** [/admin/](https://ai-independence.com/admin/) (Sveltia CMS)
- **About:** Using AI tools for personal independence. Terminal-styled UI with command-line prompts.

### ai-sovereignty.com
- **Directory:** `ai-sovereignty/`
- **Repo:** [wink-/ai-sovereignty](https://github.com/wink-/ai-sovereignty)
- **Branch:** main
- **Stack:** Hugo + Terminal theme (red color scheme)
- **Admin:** [/admin/](https://ai-sovereignty.com/admin/) (Sveltia CMS)
- **About:** Maintaining human agency in an AI-driven world. Resistance-focused with sovereign:~$ persona.

### radianthomesolutions.com
- **Directory:** `radiant-home-solutions/`
- **Repo:** [wink-/radiant-home-solutions](https://github.com/wink-/radiant-home-solutions)
- **Branch:** master
- **Stack:** Hugo + Ananke theme
- **Admin:** [/admin/](https://radianthomesolutions.com/admin/) (Sveltia CMS)
- **About:** Local handyman / small job services site. Service-focused content with local SEO.

### opensourceapocalypse.com
- **Directory:** `open-source-apocalypse/`
- **Repo:** [wink-/open-source-apocalypse](https://github.com/wink-/open-source-apocalypse)
- **Branch:** master
- **Stack:** Hugo + Terminal theme (cyberpunk aesthetic)
- **Admin:** [/admin/](https://opensourceapocalypse.com/admin/) (Sveltia CMS)
- **About:** DIY/maker projects with terminal aesthetic. Categories: woodworking, solar, upcycling, electronics, water-systems, communication. Build plans with difficulty ratings and material lists.

### winkkyfarms.com
- **Directory:** `winkky-farms/`
- **Repo:** [wink-/winkky-farms](https://github.com/wink-/winkky-farms)
- **Branch:** master
- **Stack:** Hugo + custom winkky-farm theme (based on Ananke)
- **Admin:** [/admin/](https://winkkyfarms.com/admin/) (Sveltia CMS)
- **About:** Family farm blog. Three generations of farming wisdom, seasonal stories, crops, livestock, and rural life.

### terminalschool.com
- **Directory:** `terminalschool/`
- **Repo:** [wink-/terminalschool](https://github.com/wink-/terminalschool)
- **Branch:** main
- **Stack:** Static HTML (Bootstrap 5 + custom JS). No build step.
- **Admin:** [/admin/](https://terminalschool.com/admin/) (Sveltia CMS)
- **About:** Interactive terminal course teaching command-line skills, tmux, neovim, AI assistants, git, and parallel agent orchestration. Course content in `course/` as Markdown, front-end is a single-page app.

---

## Editing Content

Every site has **Sveltia CMS** at `/admin/`. Open the site URL + `/admin/`, paste your GitHub personal access token, and edit content in the browser. Changes commit directly to the repo and Cloudflare Pages auto-deploys.

Same token works across all sites.

## Building Locally

Hugo sites:
```bash
cd <site-directory>
hugo server -D
```

Terminalschool: just open `index.html` in a browser. No build step.

## Authentication

- **GitHub:** `gh` CLI authenticated as user `wink-`
- **Google Workspace:** OAuth token at `~/.hermes/google_token.json` (rob@winkky.com)
