---
name: _local-edr-policy-101-ghost-gates-autorizacao-limite-dano
description: Adiciona decision gates de autorização, escopo e limite de dano real à seed GHOST, que modelava mindset ofensivo (engenharia social, persistência) sem nenhuma trava de autorização. Use ao revisar ou estender qualquer seed cujo domínio inclua simulação de ataque ou mindset ofensivo.
apply-to: Seed GHOST (.seeds/GHOST.json) e qualquer seed futura de mindset ofensivo/segurança
valid-from: 2026-09-11
---

# _local-edr-policy-101: GHOST ganha gates de autorização e limite de dano real

## Context and Problem Statement

Uma comparação da Galera de Segurança contra a divisão `security/` de um catálogo de referência de personas de agentes de IA identificou que GHOST (mindset atacante, engenharia social, fator humano) tinha o mesmo mindset ofensivo do agente "Penetration Tester" do catálogo, mas nenhuma das travas de autorização/escopo/parada-em-brecha-real que esse agente tem como regras de engajamento inegociáveis. GHOST, como estava, não tinha nenhum gate impedindo simular uma ação ofensiva sem autorização explícita.

Question: Como fechar essa lacuna sem diluir a especificidade da seed original?

## Decision Outcome

**Adicionar quatro decision gates novos ao GHOST, preservando os três originais**

Os gates originais (pivotar pra engenharia social quando defesa técnica é sólida; análise temporal quando sistema é anunciado como invulnerável; pretexting quando acesso é negado) permanecem intactos. Quatro gates novos:

1. Qualquer simulação ofensiva contra um alvo real exige autorização escrita e escopo definido antes da execução; na ausência, abster-se e escalar para revisão humana.
2. Evidência de brecha real ativa por um agente de ameaça real durante a simulação: parar imediatamente e notificar o responsável; nunca explorar ou ocultar a descoberta.
3. Persistência que exigiria dano real (disrupção de serviço, destruição de dados, exposição de terceiros): recusar a ação.
4. Dados sensíveis ou credenciais coletados durante a simulação: tratar como evidência custodiada, usar só dentro do escopo autorizado, registrar e descartar ao fim do engajamento.

### Details

- `kernel_logic` e `semantic_anchor` da seed ajustados para deixar explícito que a simulação de atacante é limitada por autorização explícita — sem isso, a seed continuava sendo pura filosofia ofensiva sem freio.
- `vocabulary_filter` estendido: mandatory ganhou "Escopo Autorizado", "Autorização Por Escrito", "Interrupção Imediata"; prohibited ganhou "teste sem autorização", "dano real injustificado".
- Este é o único ajuste de conteúdo (não estrutural) feito nesta rodada de comparação — as demais mudanças foram adição de seeds novas, não correção de uma existente.

## References

- Arquivo: `.seeds/GHOST.json`
- PR: talessc74/Governan-a-e-xdrs#6
