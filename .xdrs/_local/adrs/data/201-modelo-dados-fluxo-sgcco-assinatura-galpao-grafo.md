---
name: _local-adr-policy-201-modelo-dados-fluxo-sgcco-assinatura-galpao-grafo
description: Estabelece três extensões aditivas ao modelo de dados do SGCCCO surgidas da revisão do fluxo operacional pós-visita técnica — assinatura de conclusão em toda etapa (não só em conteúdo científico), um novo nível de localização (Galpão) acima da hierarquia Sala > Estante > Prateleira > Caixa com evento formal de custódia, e um agente de grafo de conhecimento construído incrementalmente ao longo do fluxo. Use ao implementar o modelo de dados do fluxo operacional do SGCCCO ou ao revisar o mecanismo de custódia e assinatura.
apply-to: Modelo de dados e fluxo operacional do SGCCCO (Sistema de Gestão Curatorial e Científica de Coleções Osteológicas), documentado em "SGCCCO — Fases e Agentes de IA"
valid-from: 2026-09-23
---

# _local-adr-policy-201: Modelo de dados do fluxo SGCCCO — assinatura universal, Galpão e Agente Grafo incremental

## Context and Problem Statement

A especificação original do SGCCCO (v3.2) reserva assinatura formal (`Assinatura_Cientifica`: hash, papel do assinante, possibilidade de revogação) apenas a conteúdo científico — inventário, perfil biológico, patologias, laudos, versões aprovadas. Etapas puramente operacionais do fluxo de 12 etapas (§6) — recebimento, limpeza, armazenamento — tinham só "registro de responsáveis, datas e aprovações" genérico, sem o mesmo padrão de responsabilidade formal.

Além disso, a especificação define localização física só até o nível Sala (Sala > Estante > Prateleira > Caixa), sem um nível acima pra um depósito/galpão fisicamente separado — confirmado como existente na visita técnica ao ambiente real.

E o "Agente Grafo" (conectar os dados do acervo pra busca e localização futura, no padrão do Mapa Vivo DITEC) foi inicialmente desenhado como processo em lote, rodando só depois que todo o fluxo de um Conjunto termina — o que o tornaria inútil como base de comparação durante a própria Curadoria (ver `_local-adr-policy-103`).

Question: como fechar essas três lacunas sem contradizer a especificação original nem esperar uma reescrita completa dela?

## Decision Outcome

**Estender o modelo com três adições aditivas: assinatura universal por etapa, nível Galpão com evento de custódia, e Agente Grafo incremental.**

- **Assinatura universal** — toda etapa do fluxo operacional (as 12 do §6, não só as de conteúdo científico) fecha com assinatura de quem executou (responsável + timestamp), marcando responsabilidade e liberando a etapa seguinte.
- **Nível Galpão** — novo nível de localização acima de Sala (Galpão > Sala > Estante > Prateleira > Caixa). A chegada de uma caixa ao Galpão é um evento formal de `Cadeia_Custodia` (`usuario_origem_id`/`usuario_destino_id`, `data_entrega`/`data_aceite`, `hash_termo`), não apenas um registro de local.
- **Agente Grafo incremental** — o grafo de conhecimento nasce na Fase 1 (o NIC vira o primeiro nó) e cresce a cada fase que adiciona dado novo (indivíduos e associações na Fase 4, patologias na Fase 5), fechando quando a caixa chega ao Galpão (Fase 6). Fica disponível como base viva de consulta durante o processo, não só depois que ele termina — inclusive para o Busca de Referência da Curadoria.

### Details

- Nenhuma das três adições remove ou contradiz uma regra existente da especificação v3.2 — são extensões aditivas sobre o modelo já definido; não há conflito com policy ativa.
- Assinatura universal amplia o padrão de `Assinatura_Cientifica`/registro de responsáveis já existente; não substitui a assinatura científica formal onde ela já se aplica.
- Agente Grafo não assina nem aprova nada — só conecta dado já oficial (aprovado e assinado na fase que o gerou), incrementalmente.
- Critério de aceitação verificável: toda etapa concluída no fluxo carrega um responsável e um timestamp de fechamento; toda caixa que chega ao Galpão tem `data_entrega` e `data_aceite` registradas; o grafo é consultável a partir da Fase 4, não só após a Fase 6.
- Documento de referência: "SGCCCO — Fases e Agentes de IA" (seção "Decisões tomadas na revisão pós-visita" e seção "Agente Grafo").

## References

- `_local-adr-policy-103` — Redesenho dos agentes de IA da Fase de Curadoria
- `_local-adr-policy-401` — Arquitetura de captura por voz do SGCCCO (POP verbal)
