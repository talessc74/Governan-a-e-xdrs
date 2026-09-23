---
name: _local-adr-policy-401-arquitetura-captura-voz-pop-verbal
description: Define a arquitetura de integração do agente de captura conversacional ("POP verbal") usado nas Fases 1, 2, 4 e 6 do fluxo SGCCCO — separa a transcrição/narração de voz (camada de terceiro) da extração estruturada de dados (LLM), e descarta o NotebookLM como base para essa função. Use ao implementar ou avaliar qualquer agente de captura por voz do SGCCCO.
apply-to: Agente de Captura Conversacional do SGCCCO (Fases 1, 2, 4 e 6), documentado em "SGCCCO — Fases e Agentes de IA"
valid-from: 2026-09-23
---

# _local-adr-policy-401: Arquitetura de captura por voz do SGCCCO — ASR/TTS de terceiro + LLM só para extração

## Context and Problem Statement

O agente de captura conversacional ("POP verbal") precisa narrar um roteiro em voz, ouvir a fala do técnico ou Curador com as mãos ocupadas no material, transcrever essa fala, e estruturar o resultado num formulário-alvo (A.1, A.2, relatório de completude da Curadoria). Cogitou-se usar o NotebookLM (Google) como base, por já ter um recurso de áudio.

Question: qual arquitetura de voz usar, e o NotebookLM serve pra essa função?

## Decision Outcome

**Separar a captura de voz (ASR/TTS de terceiro) da extração estruturada (LLM); descartar o NotebookLM para esta função.**

- Uma API de transcrição/narração de terceiro (ASR/TTS — ex. AssemblyAI, Deepgram) faz a conversão áudio ↔ texto e a narração do roteiro.
- O LLM entra só na extração estruturada: recebe o texto já transcrito (e a foto, quando houver) e mapeia pros campos do formulário-alvo — fixos e observações abertas. Nunca faz a transcrição em si.
- A confirmação verbal do usuário ("próximo", "confirmado") avança a etapa.

### Details

- NotebookLM descartado para esta função: não tem API pública de consumo (só uma API empresarial, pra operações de notebook/audio-overview, não streaming de voz ao vivo); e seu recurso de áudio ("Audio Overview") vai na direção oposta do que se precisa — texto/documento → áudio narrado, não áudio ao vivo → texto estruturado.
- Este agente é reaplicado, com a mesma arquitetura de duas camadas, em quatro momentos: Fase 1 (Recebimento), Fase 2 (Limpeza até Secagem), Fase 4 (Captura de Curadoria — ver `_local-adr-policy-103`) e Fase 6 (fechamento de custódia no Galpão — ver `_local-adr-policy-201`).
- Critério de aceitação verificável: em nenhum ponto do fluxo um LLM recebe áudio bruto diretamente para transcrição — a entrada do LLM é sempre texto já transcrito por uma API de terceiro dedicada.
- Documento de referência: "SGCCCO — Fases e Agentes de IA".

## References

- `_local-adr-policy-103` — Redesenho dos agentes de IA da Fase de Curadoria
- `_local-adr-policy-201` — Modelo de dados do fluxo SGCCCO
