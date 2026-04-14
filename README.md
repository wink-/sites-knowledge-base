# Sites Knowledge Base

A knowledge database for Rob's content sites. All deployed on Cloudflare Pages. Point an agent here for full context.

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
- **About:** DIY/maker projects with terminal aesthetic. Categories: woodworking, solar, upcycling, electronics, water-systems, communication.

### winkkyfarms.com
- **Directory:** `winkky-farms/`
- **Repo:** [wink-/winkky-farms](https://github.com/wink-/winkky-farms)
- **Branch:** master
- **Stack:** Hugo + custom winkky-farm theme (based on Ananke)
- **Admin:** [/admin/](https://winkkyfarms.com/admin/) (Sveltia CMS)
- **About:** Family farm blog. Three generations of farming wisdom, seasonal stories, crops, livestock.

### terminalschool.com
- **Directory:** `terminalschool/`
- **Repo:** [wink-/terminalschool](https://github.com/wink-/terminalschool)
- **Branch:** main
- **Stack:** Static HTML (Bootstrap 5 + custom JS). No build step.
- **Admin:** [/admin/](https://terminalschool.com/admin/) (Sveltia CMS)
- **About:** Interactive terminal course — command-line, tmux, neovim, AI assistants, git, agent orchestration.

---

## Documentation (`docs/`)

| File | What it tracks |
|------|---------------|
| `accounts.md` | Where domains, hosting, services are registered |
| `revenue-targets.md` | Per-site income goals and monetization status |
| `publishing-log.md` | What content has been published and when |
| `common-tasks.md` | How-to reference for recurring operations |

## Media (`media/`)

Local files for reference and content creation. Heavy files are gitignored.

| Directory | What goes here |
|-----------|---------------|
| `media/solar/` | Solar array PDFs, specs, installation photos |
| `media/inspiration/` | YouTube/video transcripts, ideas sparked by content |
| `media/site-photos/` | Photos for use in site content |

### YouTube inspiration workflow

Give an agent a YouTube URL and context ("this video about X made me think about Y"). The agent will:
1. Fetch the transcript
2. Summarize key points
3. Save to `media/inspiration/` with ideas tied to your sites

---

## Editing Content

Every site has **Sveltia CMS** at `/admin/`. Open `https://<site>.com/admin/`, paste your GitHub personal access token, and edit in the browser. Changes commit directly and Cloudflare Pages auto-deploys.

## Building Locally

Hugo sites: `cd <site-dir> && hugo server -D`
Terminalschool: open `index.html` in a browser
