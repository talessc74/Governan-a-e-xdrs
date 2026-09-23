---
name: _local-adr-policy-302-redesenho-agentes-curadoria-sgcco
description: Substitui três agentes de IA autônomos da Fase de Curadoria do SGCCCO (Sugestão de Associação, Leitura de Imagem/DICOM, Simulador de Impacto) por dois agentes de apoio (Captura de Curadoria, Busca de Referência), depois que uma visita técnica confirmou que a identificação física de cada osso é sempre feita pelo Curador. Use ao revisar o desenho de agentes de IA de qualquer fase do SGCCCO que dependa de julgamento científico humano.
apply-to: Fluxo operacional do SGCCCO (Sistema de Gestão Curatorial e Científica de Coleções Osteológicas) e o desenho de agentes de IA da Fase de Curadoria, documentado em "SGCCCO — Fases e Agentes de IA"
valid-from: 2026-09-23
---

# _local-adr-policy-302: Redesenho dos agentes de IA da Fase de Curadoria do SGCCCO

## Context and Problem Statement

O desenho inicial da Fase de Curadoria (montagem do esqueleto, perfil biológico, decisões de fusão/separação de indivíduos) propôs três agentes de IA operando de forma autônoma: Sugestão de Associação (adivinhar de qual indivíduo é cada osso, com grau de confiança), Leitura de Imagem/DICOM (estimar sexo/idade/estatura sozinho a partir de imagem) e Simulador de Impacto (mostrar a consequência de uma fusão/separação de indivíduos antes de confirmar).

Uma revisão do processo real, baseada numa visita técnica ao ambiente do SGCCCO, mostrou que a identificação física de cada elemento ósseo é sempre feita pelo Curador, pela sua expertise — ele leva o material pra sala de estudo, monta o esqueleto na mesa, identifica cada osso e vai montando o relatório de completude com observações. A IA nunca fez esse julgamento de fato; o desenho original supunha uma capacidade de estimativa autônoma que não corresponde ao processo real.

Question: os agentes de IA da Curadoria deveriam continuar propondo estimativas autônomas, ou a IA deveria se limitar a documentar o que o Curador já decide e apoiar a busca de referência?

## Decision Outcome

**Substituir os três agentes autônomos por dois agentes de apoio: Captura de Curadoria e Busca de Referência.**

- **Captura de Curadoria** — reaplica o mesmo mecanismo de captura por voz já usado no Recebimento (Fase 1): o Curador narra enquanto identifica e monta o esqueleto; o agente estrutura a fala no relatório de completude (campos fixos) e nas observações (campos abertos). A identificação em si continua sendo sempre do Curador.
- **Busca de Referência** — quando o Curador precisa comparar o que está vendo (uma patologia, um traço de perfil biológico) contra casos catalogados, o agente busca referências comparáveis no Agente Grafo (ver `_local-adr-policy-303`). A classificação final é sempre do Curador.

### Details

- "Sugestão de Associação" é removido do desenho: a associação osso↔indivíduo é feita fisicamente pelo Curador; a IA documenta, não decide.
- "Leitura de Imagem/DICOM" deixa de estimar sexo/idade/estatura de forma autônoma; a capacidade é absorvida pelo Busca de Referência como busca comparativa contra o grafo, não geração de estimativa.
- "Simulador de Impacto" (mostrar o que seria afetado por uma fusão/separação de indivíduos) deixa de ser tratado como agente de IA — é majoritariamente uma consulta/travessia determinística sobre registros já existentes (associações, versões científicas, patologias vinculadas), não um problema que exige julgamento de um modelo de linguagem. Rebaixado a recurso de sistema.
- Busca de Referência é reaplicado na fase seguinte (Completude dos Formulários da Curadoria) para classificação de patologias, no mesmo espírito: o Curador descreve ou mostra a alteração, o agente busca referências comparáveis, a classificação final é do Curador.
- Critério de aceitação verificável: nenhum agente de IA da Curadoria produz uma associação, classificação ou estimativa científica como fato — toda saída é rascunho ou referência de comparação, sujeita a aceite explícito do Curador.
- Documento de referência: "SGCCCO — Fases e Agentes de IA" (Fase 4 e Fase 5).

## References

- `_local-adr-policy-303` — Modelo de dados do fluxo SGCCCO: assinatura universal, Galpão e Agente Grafo incremental
- `_local-adr-policy-304` — Arquitetura de captura por voz do SGCCCO (POP verbal)
