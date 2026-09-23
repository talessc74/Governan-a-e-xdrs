# _local Scope Overview

## Overview

Project-local decisions created through ARGUS deliberations. All policies in this scope
were produced by seed deliberation, structured by SCRIBE, timestamped by HERALD, and
validated by a human before archiving.

This scope stays in this workspace only and is never distributed to other contexts.
Decisions here override all other scopes.

## Content

### ADRs — Architectural Decisions (6 documents)

Expansion of the Galera do Design and Galera do Código with new seeds, the
single-source-of-truth distribution architecture (npm + npm-free installer),
and the SGCCCO operational-flow decisions: AI agent redesign for the
Curadoria phase, the data model extensions (universal signature, Galpão
tier, incremental knowledge graph), and the voice-capture integration
architecture (third-party ASR/TTS + LLM extraction only).

### EDRs — Engineering Decisions (1 document)

Authorization and harm-boundary gates added to the GHOST seed.

### BDRs — Business Decisions (1 document)

Policy for periodically comparing the ARGUS seed roster against external agent
catalogs to identify real capability gaps.

## How to add a policy

1. Trigger an ARGUS deliberation on the topic
2. Reach convergence with seed signatures
3. SCRIBE structures the document — HERALD defines valid-from
4. Human validates the draft
5. Policy is saved under the appropriate type and subject below

## Type Indexes

- [ADRs Index](adrs/index.md) - Architectural and technical decisions
- [BDRs Index](bdrs/index.md) - Business process and strategy decisions
- [EDRs Index](edrs/index.md) - Engineering workflow and tooling decisions
