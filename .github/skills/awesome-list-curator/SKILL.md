---
name: awesome-list-curator
description: "Research, evaluate, and systematically document tools/resources for an awesome-<purpose> curated list, then publish to a public GitHub repo. Use when: building or expanding an awesome list (e.g. awesome-llm-token-reduction); finding tools, libraries, papers, or datasets on a topic; auditing an existing list for dead links or duplicates; standardizing entry format; opening a PR to share additions. Sources: web search, GitHub repo search, arXiv, and existing awesome lists. DO NOT USE FOR: general coding tasks; non-list documentation."
argument-hint: "<purpose/topic of the awesome list, e.g. 'LLM token reduction'>"
---

# Awesome List Curator

Turn a topic into a high-quality, well-formatted awesome list and ship it to GitHub.

## When to Use

- Bootstrapping a new `awesome-<purpose>` repo (no README yet).
- Finding new tools/libraries/papers/datasets to add to an existing list.
- Auditing a list for dead links, duplicates, or inconsistent formatting.
- Preparing a clean PR that follows the awesome-list conventions.

## Inputs to Confirm First

Before researching, establish:

1. **Purpose** — the exact topic/scope (e.g. "techniques and tools that reduce LLM token usage").
2. **Categories** — the top-level sections (see [format spec](./references/format-spec.md)). If unknown, propose 4–8 categories from initial research and confirm.
3. **Inclusion bar** — minimum quality (e.g. maintained in last 12 months, >100 stars, peer-reviewed, or "notably influential"). Default bar in [format spec](./references/format-spec.md).
4. **Repo target** — owner/name and whether you are adding to your own repo (push) or contributing upstream (fork + PR).

## Procedure

### 1. Plan the taxonomy
- Run 2–4 broad discovery queries to learn the landscape (see [discovery sources](./references/discovery-sources.md)).
- Draft the category tree. Keep categories mutually exclusive and collectively exhaustive.
- Confirm categories with the user before deep research — re-categorizing later is expensive.

### 2. Discover candidates
- Work **one category at a time**. For each, query across all four source types in parallel:
  web search/fetch, GitHub repo search, arXiv, and cross-referencing peer awesome lists.
- Capture for every candidate: name, canonical URL, one-line description, signal (stars/date/citations), category.
- Collect generously now; filter in the next step. See [discovery sources](./references/discovery-sources.md) for query patterns.

### 3. Evaluate and filter
- Apply the inclusion bar. Drop anything unmaintained, broken, off-topic, or a near-duplicate.
- Prefer the canonical/original source over mirrors and aggregators.
- Verify each surviving URL resolves (the publish step also runs [check-links.sh](./scripts/check-links.sh)).

### 4. Document systematically
- Write or update `README.md` using the exact entry and section format in [format spec](./references/format-spec.md).
- Use [entry-template.md](./assets/entry-template.md) for new sections so formatting stays identical.
- Keep entries alphabetical (or by relevance if the list declares so) and descriptions ≤ ~120 chars, present tense, no trailing period.
- Ensure the Table of Contents, `awesome` badge, and Contributing section exist (template provides these).

### 5. Validate
- Run the link checker:
  ```bash
  bash .github/skills/awesome-list-curator/scripts/check-links.sh README.md
  ```
- Fix or remove any broken links. Confirm: no duplicate URLs, consistent formatting, TOC matches headings.

### 6. Publish to GitHub
- Stage and commit with a conventional message (e.g. `docs: add <category> tools`).
- Push the branch and open a PR with `gh`. **Use `--body-file` with a heredoc, never inline `--body` with backticks** (zsh command-substitution hazard).
  ```bash
  git checkout -b add-<category>-tools
  git add README.md
  git commit -m "docs: add <category> tools"
  git push -u origin add-<category>-tools
  gh pr create --title "Add <category> tools" --body-file <(cat <<'EOF'
  Adds N curated entries under <category>.

  - Source types: web, GitHub, arXiv, peer lists
  - All links verified with check-links.sh
  EOF
  )
  ```
- If pushing directly to your own list's default branch, confirm with the user first (publishing is visible to others).

## Completion Checklist

- [ ] Categories agreed and stable
- [ ] Every entry has: name, working link, concise description, correct category
- [ ] Inclusion bar applied; no dead/duplicate/off-topic entries
- [ ] Format matches [format spec](./references/format-spec.md) exactly
- [ ] `check-links.sh` passes
- [ ] Committed, pushed, and PR opened (or explicitly prepared-only)

## Resources

- [Discovery sources & query patterns](./references/discovery-sources.md)
- [Format specification](./references/format-spec.md)
- [Section/entry template](./assets/entry-template.md)
- [Link checker script](./scripts/check-links.sh)
