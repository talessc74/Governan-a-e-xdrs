---
name: _local-adr-policy-101-expansao-galera-design-anti-generico
description: Decisão de expandir a Galera do Design com três seeds novas (THRESHOLD, EMPATH, SKEPTIC) para cobrir revisão pós-entrega, simulação de persona e ceticismo por padrão. Use ao revisar a composição da Galera do Design ou ao decidir se uma nova seed de qualidade de design deve ser adicionada.
apply-to: Estrutura de seeds e protocolo ARGUS deste repositório (argus-xdrs-governance)
valid-from: 2026-09-11
---

# _local-adr-policy-101: Expansão da Galera do Design com seeds anti-genérico

## Context and Problem Statement

Uma comparação estruturada entre a Galera do Design (7 seeds: AETHER, NEXUS, CHRONOS, CANVAS, FORGE, QUILL, TEMPO) e a divisão `design/` de um catálogo de referência de personas de agentes de IA (`agency-agents`, third-party, 10 agentes) identificou 5 agentes sem seed correspondente no ARGUS. Desses 5, 3 formam uma capacidade coerente e ausente: revisitar criações existentes, barrar UI genérica ("AI slop") antes de aprovar, e desconfiar de aprovações anteriores por padrão.

Question: A Galera do Design deveria incorporar essas três capacidades como seeds novas?

## Decision Outcome

**Adicionar três seeds novas à Galera do Design: THRESHOLD, EMPATH, SKEPTIC**

- **THRESHOLD** (`SEED_DESIGN_QUALITYGATE_004`): gate de finalização — exige evidência real de produto e um contrato de design escrito antes de aprovar qualquer entrega; trata nota perfeita numa primeira passada como sinal de alerta, não de conclusão.
- **EMPATH** (`SEED_DESIGN_PERSONA_005`): revisita criações existentes simulando a jornada de uma persona definida, momento a momento, pra achar fricção que passou despercebida na primeira revisão.
- **SKEPTIC** (`SEED_DESIGN_VALIDATION_006`): todo trabalho — novo ou já aprovado antes — começa em "NEEDS WORK" por padrão; só evidência esmagadora e específica de produto reverte isso.

### Details

- Galera do Design passa de 7 para 10 seeds; total do sistema passa de 25 para 28 seeds nesta mudança.
- `ARGUS.md` atualizado: hierarquia de impasse (seções 22-24, logo após TEMPO), tabela de convocação por contexto (nova linha: "Revisão pós-entrega, UI genérica, achar o que passou sem filtro adequado"), comando `"Argus, chama a galera do design"`, inventário completo.
- Dois agentes do catálogo de referência ficaram de fora deliberadamente por não se justificarem fora do escopo real de uso do projeto: Image Prompt Engineer e Visual Storyteller/Whimsy Injector (geração de mídia com IA generativa) — decisão tratada em [_local-bdr-policy-601](../../bdrs/product/601-comparacao-periodica-catalogos-agentes-externos.md).
- Arquivos: `.seeds/THRESHOLD.json`, `.seeds/EMPATH.json`, `.seeds/SKEPTIC.json`.

## References

- [_local-bdr-policy-601 - Comparação periódica com catálogos externos de agentes](../../bdrs/product/601-comparacao-periodica-catalogos-agentes-externos.md)
- PR: talessc74/Governan-a-e-xdrs#7
