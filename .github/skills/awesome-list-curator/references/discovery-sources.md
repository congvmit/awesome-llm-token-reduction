# Discovery Sources & Query Patterns

Use all four source types for each category. Run queries in parallel, then merge and dedupe by canonical URL.

## 1. Web search + fetch
Good for: official docs, blog posts announcing tools, benchmark write-ups, surveys.

Query patterns (substitute `<purpose>` and category):
- `best <purpose> tools 2025`
- `<purpose> open source library`
- `<category> <purpose> benchmark comparison`
- `<purpose> survey` (often links to many primary sources at once)

After finding a promising page, fetch it to extract the canonical project/paper URL and a factual one-line description. Do not paraphrase marketing copy — describe what it does.

## 2. GitHub repo search
Good for: libraries, CLIs, frameworks, reference implementations.

Signals to record: stars, last commit date, open-issue health, license.

Query patterns:
- Topic search: `topic:<purpose-keyword>` (e.g. `topic:llm` `topic:prompt-compression`)
- Keyword + sort: `<purpose> in:name,description,readme sort:stars`
- Recency filter: `<purpose> pushed:>2025-01-01`

Inclusion hint: prefer repos with a real README, a license, and activity within ~12 months. Note (but usually exclude) archived/abandoned repos unless historically important.

## 3. arXiv / academic papers
Good for: techniques, methods, and the papers behind tools.

Signals to record: title, authors, year, arXiv ID, citation count (if available), and whether code is released.

Query patterns:
- Search arXiv listings/abstracts for `<purpose>` and method names.
- For each method, check for an official code repo (links back into GitHub search).
- Prefer the published/abstract page (`arxiv.org/abs/...`) as the canonical link.

## 4. Existing awesome lists (cross-reference)
Good for: completeness and discovering categories you missed.

Patterns:
- Search GitHub for `awesome <purpose>` and `awesome <adjacent-topic>`.
- Scan their tables of contents to validate/refine your taxonomy.
- Pull entries that fit your scope — but re-verify each link and re-write the description in your list's voice. Never blind-copy.

## Merge rules
- Deduplicate by canonical URL (collapse mirrors, forks, and `/blob/` vs repo root).
- When two sources describe the same tool, keep the most authoritative link.
- Tag each surviving candidate with exactly one category before writing.
