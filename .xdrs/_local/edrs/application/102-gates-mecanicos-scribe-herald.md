---
name: _local-edr-policy-102-gates-mecanicos-para-scribe-e-herald
description: Adiciona três decision gates a SCRIBE e HERALD, fechando lacunas encontradas num experimento pareado que comparou a skill determinística do xdrs-core com a governança ARGUS na mesma tarefa. Use ao revisar ou estender o comportamento de SCRIBE/HERALD na fase de persistência de uma policy XDRS.
apply-to: Seeds SCRIBE e HERALD (.seeds/SCRIBE.json, .seeds/HERALD.json) e o protocolo de arquivamento descrito em .seeds/ARGUS.md Seção IV
valid-from: 2026-09-20
---

# _local-edr-policy-102: Gates mecânicos para SCRIBE e HERALD

## Context and Problem Statement

Um experimento pareado rodou a mesma tarefa (registrar uma decisão de retenção de dados para uma simulação do GHOST) em duas condições isoladas: só a skill determinística do `xdrs-core`, e a governança ARGUS completa (SCRIBE/HERALD + Galera de Segurança). As duas chegaram ao mesmo julgamento de fundo, mas a condição ARGUS cometeu dois erros que a skill sozinha evitou: (1) declarou o `name` do frontmatter por convenção lembrada em vez de conferir contra a regra de lint real, introduzindo um erro novo e evitável; (2) reivindicou o gate de SCRIBE ("bloquear arquivamento enquanto lint reportar erros") e o violou sem critério explícito para separar dívida pré-existente de erro novo. Além disso, HERALD editou uma policy já arquivada (`_local-edr-policy-101`) como efeito colateral de arquivar a nova decisão, sem qualquer checagem de disciplina de diff.

Question: Como fechar essas três lacunas sem enfraquecer o papel de SCRIBE e HERALD na fase de persistência?

## Decision Outcome

**Três gates novos: verificação mecânica de nome e bloqueio qualificado por erro novo em SCRIBE; consulta obrigatória a SURGEON em HERALD antes de editar policy já arquivada**

### Details

1. **SCRIBE — bloqueio qualificado por erro novo.** O gate de lint deixa de bloquear por qualquer erro reportado e passa a bloquear apenas por erro **novo**, atribuível ao documento ou à edição em curso. Erro preexistente no repositório não bloqueia, mas também não é ignorado: é registrado como débito rastreado e sinalizado a HERALD.
2. **SCRIBE — verificação mecânica do `name`.** O campo `name` do frontmatter deixa de ser definido por analogia a documentos anteriores. SCRIBE deve derivar o nome esperado rodando o lint real (ou inspecionando a regra de slugificação da versão de `xdrs-core` instalada) antes de declarar o documento pronto.
3. **HERALD — SURGEON antes de editar policy arquivada.** Quando persistir uma nova decisão exigir editar o conteúdo de uma policy já arquivada (referência cruzada, qualificação de gate existente), HERALD consulta SURGEON antes de aplicar a edição. SURGEON avalia se o diff é o mínimo necessário e não é scope-creep da tarefa original. A policy editada preserva seu `valid-from` original.

`vocabulary_filter` de ambas as seeds foi estendido: SCRIBE ganhou "erro novo" e "débito de lint registrado" (mandatory), "nome por convenção lembrada" e "bloquear por dívida alheia sem registrar" (prohibited); HERALD ganhou "diff mínimo em policy existente" (mandatory) e "editar policy arquivada sem revisão de escopo" (prohibited). `.seeds/ARGUS.md` Seção IV ganhou uma frase convocando SURGEON na fase de persistência quando ela exigir editar uma policy já arquivada. Versão do protocolo avançou de 1.6.1 para 1.6.2 (sem seeds novas — só refinamento de gates existentes).

Este é o mesmo padrão de mudança da `_local-edr-policy-101` (adição de gates a uma seed existente, sem alterar sua jurisdição central) — aqui aplicado a duas seeds da Galera de Governança em vez de uma seed de Segurança.

## References

- Arquivos: `.seeds/SCRIBE.json`, `.seeds/HERALD.json`, `.seeds/ARGUS.md`
- [_local-edr-policy-101 - GHOST ganha gates de autorização e limite de dano real](101-ghost-gates-autorizacao-limite-dano.md) — precedente do mesmo tipo de mudança (gates novos numa seed existente)
