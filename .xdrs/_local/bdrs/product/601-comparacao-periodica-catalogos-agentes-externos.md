---
name: _local-bdr-policy-601-comparacao-periodica-catalogos-agentes-externos
description: Estabelece a comparação estruturada do roster de seeds do ARGUS contra catálogos externos de agentes de IA como prática de evolução pontual (health-check), não um processo contínuo obrigatório. Use ao decidir se uma galera precisa de seeds novas, ou ao avaliar se uma seed existente ainda é suficiente por si só.
apply-to: Evolução do roster de seeds deste repositório (argus-xdrs-governance)
valid-from: 2026-09-11
---

# _local-bdr-policy-601: Comparação periódica com catálogos externos de agentes

## Context and Problem Statement

Sem um critério explícito, fica arbitrário decidir quando uma galera do ARGUS "precisa" de uma seed nova. Comparar contra um catálogo de referência de personas de agentes de IA (`agency-agents`, third-party, ~280 agentes) se mostrou um método eficaz: de 6 galeras comparadas, 2 (Design, Código) tinham buracos reais e ganharam 5 seeds novas; as outras 4 (Segurança — exceto GHOST —, QA, UX, Governança) já estavam mais completas que o catálogo externo no recorte comparado.

Question: Esse tipo de comparação deveria virar prática recorrente, e sob qual critério uma seed é ou não adicionada?

## Decision Outcome

**Comparação vale como health-check pontual, não hábito constante — e só justifica seed nova quando o catálogo externo tem algo que o ARGUS não tem**

A direção da comparação importa: uma seed do ARGUS sem par no catálogo externo não é um problema a corrigir — é o ARGUS estando à frente naquele ponto. Só o inverso (catálogo externo com uma disciplina real e ausente no ARGUS) justifica considerar uma seed nova.

### Details

- Gatilhos razoáveis para repetir a comparação: aparição de um catálogo de agentes novo e relevante; mudança no escopo de uso do ARGUS (ex: passar a governar um tipo de projeto bem diferente dos já atendidos); ou decisão manual do time.
- Critério de aceitação de uma seed nova candidata: a lacuna precisa ser uma disciplina real e estabelecida (ex: confiabilidade em produção, disciplina de escopo), não uma tecnologia específica (ex: "WordPress Developer") nem um papel decorativo por completude.
- Candidatas descartadas nesta rodada e por quê:
  - Design: Image Prompt Engineer, Visual Storyteller, Inclusive Visuals Specialist (geração de mídia com IA generativa — fora do escopo real de uso hoje, que não envolve geração de imagem/vídeo).
  - Código: Git Workflow Master (mais mecânico que filosófico), Software Architect e Code Reviewer (redundantes com FLUX e SCOUT respectivamente).
  - QA: PROBE (teste exploratório) ficou sem par no catálogo — lacuna do lado do catálogo externo, não do ARGUS; nada a importar.
  - UX e Governança: nenhuma seed nova justificada — nos 6 seeds comparados (COMPASS, EMPIRICUS, POLARBEAR, FEW, SCRIBE, HERALD), o catálogo externo trata os mesmos temas de forma mais rasa ou dispersa, nunca mais completa.

## References

- [_local-adr-policy-101 - Expansão da Galera do Design](../../adrs/application/101-expansao-galera-design-anti-generico.md)
- [_local-adr-policy-102 - Expansão da Galera do Código](../../adrs/application/102-expansao-galera-codigo-confiabilidade-escopo.md)
- PRs: talessc74/Governan-a-e-xdrs#6, #7, #10
