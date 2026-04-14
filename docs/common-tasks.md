# Common Tasks

Quick reference for things you do more than once.

## Add a new blog post (Hugo sites)

```bash
cd ~/sites-knowledge-base/<site-directory>
hugo new posts/my-post-title.md
# Edit the file, then:
hugo server -D   # preview locally
git add -A && git commit -m "Add: post title"
git push
```

Or use Sveltia CMS: go to `https://<site>.com/admin/`, paste token, create post.

## Check if Cloudflare build succeeded

Go to Cloudflare Dashboard > Pages > [site name] > Deployments. Or just visit the site and see if changes are live (usually 1-2 minutes).

## Fix a failed Cloudflare build

1. Check the build log in Cloudflare Dashboard
2. Common issues: Hugo version mismatch, broken frontmatter, missing theme
3. Fix locally, push again

## Update a domain or DNS

Cloudflare Dashboard > [domain] > DNS. All domains are on Cloudflare.

## Pull latest changes for a site

```bash
cd ~/sites-knowledge-base/<site-directory>
git pull
```

## Process a YouTube video for inspiration

Give the URL to Hermes (this agent). It will:
1. Fetch the transcript
2. Summarize key points
3. Save to `media/inspiration/` as a markdown file with ideas

## Add a PDF or photo

Drop files in the right subfolder under `media/`:
- `media/solar/` — solar array docs, specs, photos
- `media/site-photos/` — photos for site content
- `media/inspiration/` — anything that sparked an idea

Then tell the agent what it is so it can be referenced later.
