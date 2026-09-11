---
name: _local-adr-policy-102-expansao-galera-codigo-confiabilidade-escopo
description: Decisão de expandir a Galera do Código com duas seeds novas (VIGIL, SURGEON) para cobrir confiabilidade em produção e disciplina de escopo/diff mínimo. Use ao revisar a composição da Galera do Código ou ao decidir se uma nova seed de engenharia deve ser adicionada.
apply-to: Estrutura de seeds e protocolo ARGUS deste repositório (argus-xdrs-governance)
valid-from: 2026-09-11
---

# _local-adr-policy-102: Expansão da Galera do Código com confiabilidade e disciplina de escopo

## Context and Problem Statement

A mesma comparação estruturada (ver [_local-adr-policy-101](101-expansao-galera-design-anti-generico.md)) foi repetida para a Galera do Código (4 seeds: SCOUT, FLUX, LITERATE, RIVERRAID) contra a divisão `engineering/` do catálogo de referência (64 agentes). Nenhuma das 4 seeds cobre o que acontece depois que o código vai pra produção, nem disciplina o quanto uma mudança deveria tocar no código existente — dois buracos reais e praticamente relevantes, já que projetos consumidores desta governança (`Copiloto-Financeiro`, `radiokactus`) são aplicações reais em produção.

Question: A Galera do Código deveria incorporar confiabilidade operacional e disciplina de escopo como seeds novas?

## Decision Outcome

**Adicionar duas seeds novas à Galera do Código: VIGIL, SURGEON**

- **VIGIL** (`SEED_CODE_RELIABILITY_001`): confiabilidade é um orçamento mensurável, não um acidente de boa intenção — SLOs, orçamento de erro, rollout progressivo, cultura sem culpa em post-mortem.
- **SURGEON** (`SEED_CODE_SCOPE_002`): o menor diff que resolve o problema é o diff correto — três ocorrências antes de abstrair, nunca tocar arquivo fora do escopo pedido, nunca "já que estou aqui, aproveito e...".

### Details

- Galera do Código passa de 4 para 6 seeds; total do sistema passa de 28 para 30 seeds nesta mudança.
- SURGEON tensiona deliberadamente com um gate existente de FLUX (*"se adicionar feature causa fricção, reestruturar antes de implementar"*). A tensão é intencional — o protocolo de deliberação do ARGUS resolve caso a caso, não uma seed vencendo a outra por padrão.
- `ARGUS.md` atualizado: hierarquia de impasse (posições 7-8, logo após FLUX, renumerando o restante), duas novas linhas na tabela de convocação por contexto ("Produção, incidente, confiabilidade, deploy" e "Diff cirúrgico, correção pontual, evitar scope creep"), comando `"Argus, chama a galera do código"`, inventário completo.
- Dois outros candidatos do catálogo (Git Workflow Master, Software Architect) foram avaliados e descartados por serem mais mecânicos ou redundantes com FLUX — decisão documentada em [_local-bdr-policy-601](../../bdrs/product/601-comparacao-periodica-catalogos-agentes-externos.md).
- Arquivos: `.seeds/VIGIL.json`, `.seeds/SURGEON.json`.

## References

- [_local-adr-policy-101 - Expansão da Galera do Design](101-expansao-galera-design-anti-generico.md)
- [_local-bdr-policy-601 - Comparação periódica com catálogos externos de agentes](../../bdrs/product/601-comparacao-periodica-catalogos-agentes-externos.md)
- PR: talessc74/Governan-a-e-xdrs#10
