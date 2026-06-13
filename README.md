# Awesome LLM Token Reduction [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated list of techniques, tools, and research for reducing LLM token usage — with a focus on AI coding assistants like Claude Code, OpenAI Codex, and GitHub Copilot.

Every prompt and response costs tokens, and coding agents burn through them fast: large files, tool output, logs, and long sessions all inflate the context window. This list collects the drop-in tools, libraries, data formats, and papers that cut tokens while keeping answers intact.

## Contents

- [Awesome LLM Token Reduction ](#awesome-llm-token-reduction-)
  - [Contents](#contents)
  - [Surveys \& Background](#surveys--background)
  - [Coding-Assistant Token Savers](#coding-assistant-token-savers)
  - [Prompt Compression Libraries](#prompt-compression-libraries)
  - [Token-Efficient Data Formats](#token-efficient-data-formats)
  - [Context \& Memory Management](#context--memory-management)
  - [Output Compression](#output-compression)
  - [Research \& Methods](#research--methods)
  - [Contributing](#contributing)
  - [License](#license)

## Surveys & Background

> Start here for the lay of the land before picking a technique.

- [Prompt Compression for Large Language Models: A Survey](https://arxiv.org/abs/2410.12388) - Taxonomy of hard- and soft-prompt compression methods, mechanisms, and open problems

## Coding-Assistant Token Savers

> Drop-in proxies, plugins, hooks, and MCP servers that cut tokens for Claude Code, Codex, Copilot, Cursor, and Aider.

- [ClaudeShrink](https://github.com/g-akshay/ClaudeShrink) - Claude Code skill that shrinks large prompts and files with LLMLingua to save tokens ![Stars](https://img.shields.io/github/stars/g-akshay/ClaudeShrink?style=social)
- [claude-rolling-context](https://github.com/NodeNestor/claude-rolling-context) - Claude Code plugin that compresses old messages while keeping recent context verbatim ![Stars](https://img.shields.io/github/stars/NodeNestor/claude-rolling-context?style=social)
- [claude-shorthand](https://github.com/gladehq/claude-shorthand) - LLMLingua-2 prompt-compression hook for Claude Code ![Stars](https://img.shields.io/github/stars/gladehq/claude-shorthand?style=social)
- [engram](https://github.com/pythondatascrape/engram) - Local-first context compression for AI coding tools, deduping redundant tokens across calls ![Stars](https://img.shields.io/github/stars/pythondatascrape/engram?style=social)
- [entroly](https://github.com/juyterman1000/entroly) - Local proxy that compresses context for Claude Code, Codex, Cursor, and Aider ![Stars](https://img.shields.io/github/stars/juyterman1000/entroly?style=social)
- [headroom](https://github.com/chopratejas/headroom) - Compresses tool output, logs, files, and RAG chunks before they reach the LLM ![Stars](https://img.shields.io/github/stars/chopratejas/headroom?style=social)
- [llmtrim](https://github.com/fkiene/llmtrim) - Provider-agnostic Rust proxy that compresses input, output, and cache with no extra model calls ![Stars](https://img.shields.io/github/stars/fkiene/llmtrim?style=social)
- [rtk](https://github.com/rtk-ai/rtk) - CLI proxy that cuts LLM token use 60-90% on common dev commands, single Rust binary ![Stars](https://img.shields.io/github/stars/rtk-ai/rtk?style=social)
- [sigmap](https://github.com/manojmallick/sigmap) - Zero-dependency MCP server for AST-based code context reduction across 31 languages ![Stars](https://img.shields.io/github/stars/manojmallick/sigmap?style=social)
- [tokless](https://github.com/HoangP8/tokless) - Unified CLI to install and update token-saving plugins for Claude Code, Codex, and OpenCode ![Stars](https://img.shields.io/github/stars/HoangP8/tokless?style=social)
- [token-optimizer-mcp](https://github.com/ooples/token-optimizer-mcp) - Claude Code MCP server reaching 95%+ token reduction through caching and optimization ![Stars](https://img.shields.io/github/stars/ooples/token-optimizer-mcp?style=social)
- [token-reducer](https://github.com/Madhan230205/token-reducer) - Local-first Claude Code context compression using hybrid RAG and AST chunking ![Stars](https://img.shields.io/github/stars/Madhan230205/token-reducer?style=social)
- [TokenTamer](https://github.com/borhen68/TokenTamer) - Drop-in proxy that compresses bloated code context in real time to cut API costs ![Stars](https://img.shields.io/github/stars/borhen68/TokenTamer?style=social)

## Prompt Compression Libraries

> General-purpose SDKs you call directly to compress prompts in any LLM app.

- [claw-compactor](https://github.com/open-compress/claw-compactor) - 14-stage reversible, AST-aware pipeline for LLM token compression with zero inference cost ![Stars](https://img.shields.io/github/stars/open-compress/claw-compactor?style=social)
- [leanctx](https://github.com/jia-gao/leanctx) - Drop-in prompt-compression SDK for production LLM apps, built on LLMLingua-2 ![Stars](https://img.shields.io/github/stars/jia-gao/leanctx?style=social)
- [LLMLingua](https://github.com/microsoft/LLMLingua) - Microsoft toolkit compressing prompts and KV-cache up to 20x with minimal quality loss ![Stars](https://img.shields.io/github/stars/microsoft/LLMLingua?style=social)
- [llmlingua-2-js](https://github.com/atjsh/llmlingua-2-js) - JavaScript/TypeScript implementation of LLMLingua-2 for browser and Node ![Stars](https://img.shields.io/github/stars/atjsh/llmlingua-2-js?style=social)

## Token-Efficient Data Formats

> Compact, LLM-friendly encodings that pass the same data in fewer tokens than JSON.

- [TOON](https://github.com/toon-format/toon) - Token-Oriented Object Notation, a lossless JSON encoding that cuts tokens ~30-60% for uniform data ![Stars](https://img.shields.io/github/stars/toon-format/toon?style=social)
- [Tooner](https://github.com/chaindead/tooner) - MCP proxy that converts JSON tool responses to TOON before they reach the model ![Stars](https://img.shields.io/github/stars/chaindead/tooner?style=social)

## Context & Memory Management

> Persist and retrieve only what matters, so sessions stay short instead of replaying everything.

- [codex-agent-mem](https://github.com/MarceloCaporale/codex-agent-mem) - Local-first MCP memory layer for Codex and Claude with compact, token-saving context packs ![Stars](https://img.shields.io/github/stars/MarceloCaporale/codex-agent-mem?style=social)
- [mnemosyne](https://github.com/castnettech/mnemosyne) - Zero-dependency knowledge compression, ingestion, and hybrid retrieval engine ![Stars](https://img.shields.io/github/stars/castnettech/mnemosyne?style=social)
- [Zep](https://github.com/getzep/zep) - Context engineering platform that assembles relationship-aware context from a temporal knowledge graph ![Stars](https://img.shields.io/github/stars/getzep/zep?style=social)

## Output Compression

> Reduce generation tokens — the part you pay the most for — without losing the answer.

- [caveman](https://github.com/JuliusBrussee/caveman) - Claude Code skill that rewrites output in terse "caveman speak" to cut ~65% of tokens ![Stars](https://img.shields.io/github/stars/JuliusBrussee/caveman?style=social)
- [scrooge-mode](https://github.com/Kir93/scrooge-mode) - Output-compression skill for Claude Code and Codex measured on real session output tokens ![Stars](https://img.shields.io/github/stars/Kir93/scrooge-mode?style=social)
- [squeez](https://github.com/KRLabsOrg/squeez) - Squeezes verbose LLM agent tool output down to only the relevant lines ![Stars](https://img.shields.io/github/stars/KRLabsOrg/squeez?style=social)

## Research & Methods

> Foundational papers behind the tools above.

- [Adapting Language Models to Compress Contexts](https://arxiv.org/abs/2305.14788) - AutoCompressors that summarize long contexts into compact summary vectors
- [In-Context Autoencoder for Context Compression](https://arxiv.org/abs/2307.06945) - ICAE encodes long context into a few memory slots for a frozen LLM
- [Learning to Compress Prompts with Gist Tokens](https://arxiv.org/abs/2304.08467) - Gisting trains an LM to compress prompts into reusable "gist" tokens, up to 26x
- [LLMLingua](https://arxiv.org/abs/2310.05736) - Coarse-to-fine prompt compression using a small LM to drop low-information tokens
- [LLMLingua-2](https://arxiv.org/abs/2403.12968) - Task-agnostic prompt compression via token classification distilled from GPT-4
- [LLoCO: Learning Long Contexts Offline](https://arxiv.org/abs/2404.07979) - Offline context compression plus LoRA finetuning for efficient long-context inference
- [LongLLMLingua](https://arxiv.org/abs/2310.06839) - Prompt compression that mitigates "lost in the middle" and boosts RAG with fewer tokens

## Contributing

Contributions are welcome! Please read the [contribution guidelines](CONTRIBUTING.md) first. In short: one entry per pull request line, keep descriptions concise and present tense, verify the link resolves, and place the entry alphabetically within its section.

## License

[![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](LICENSE)

To the extent possible under law, the authors have waived all copyright and related or neighboring rights to this work. See [LICENSE](LICENSE).
