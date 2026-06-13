# Awesome List Format Specification

Follows the widely-adopted [Awesome](https://github.com/sindresorhus/awesome) conventions so the list can earn the badge and feel familiar to readers.

## File: `README.md`

Required structure, in order:

1. **Title** — `# Awesome <Purpose>` followed by the awesome badge:
   ```markdown
   # Awesome <Purpose> [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

   > One-sentence description of the list's scope.
   ```
2. **Table of Contents** — bullet links to every top-level section. Must stay in sync with headings.
3. **Sections** — one `##` heading per category. Optional `###` sub-categories.
4. **Contributing** — link to `CONTRIBUTING.md` or inline guidance.
5. **License** — typically CC0; a `LICENSE` file referenced here.

## Entry format

Each entry is a single bullet:

```markdown
- [Name](https://canonical-url) - Concise description of what it does.
```

Rules:
- Exactly one space around the hyphen separator: `) - `.
- Description: present tense, ≤ ~120 chars, **no trailing period is acceptable** but be consistent across the whole list (pick one and keep it).
- Optional metadata badges (stars, paper) may follow the description, e.g. ` [[paper]](https://arxiv.org/abs/...)`.
- Order entries **alphabetically** within a section unless the list explicitly states "ordered by relevance".

## Quality / inclusion bar (default)

Include an item only if it meets at least one strong signal and none of the rejects:

**Strong signals (need ≥1):**
- Actively maintained (commit/release within ~12 months), OR
- Peer-reviewed or widely-cited paper, OR
- Notable adoption (meaningful stars, used in production/research).

**Reject if:**
- Link is dead or behind a paywall with no public info.
- Off-topic or only tangentially related to `<purpose>`.
- Duplicate/mirror of an entry already present.
- Pure marketing page with no substance.

## Consistency checks before publishing

- Every TOC link points to an existing heading anchor.
- No duplicate URLs across the whole file.
- Entry formatting identical everywhere (use the template).
- Section ordering is intentional and documented if non-alphabetical.
