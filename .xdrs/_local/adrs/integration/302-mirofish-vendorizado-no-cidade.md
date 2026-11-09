---
name: _local-adr-policy-302-mirofish-vendorizado-no-cidade
description: Define que ferramentas externas de terceiros usadas como bancada de validação (caso MiroFish) entram no repositório Cidade como cópia vendorizada e fixada num commit, em vez de submódulo ou repositório novo. Use ao trazer um projeto externo para o Cidade ou ao atualizar o MiroFish.
apply-to: Repositório talessc74/Cidade e ferramentas externas de validação trazidas para ele, a começar pelo MiroFish
valid-from: 2026-11-09
---

# _local-adr-policy-302: MiroFish vendorizado no Cidade

## Context and Problem Statement

O MiroFish (666ghj/MiroFish, AGPL-3.0) é um motor de simulação multiagente que será usado para validar projetos próprios. Era preciso deixá-lo pronto para execução sob demanda, e decidir se isso exigia um repositório novo.

Question: Como trazer uma ferramenta externa de validação para o Cidade de forma reprodutível, sem criar repositório novo?

## Decision Outcome

**Cópia vendorizada, fixada em commit, dentro do Cidade**

O MiroFish vive em `mirofish/` no repositório Cidade, como snapshot do upstream sem `.git/` e sem `.github/`. O commit de origem fica registrado em `mirofish/UPSTREAM.md`. A execução é feita por `Makefile` e `scripts/` na raiz do Cidade, sem alterar o código do upstream.

### Details

- Snapshot atual: upstream `7657031ac01184afe2cb220f5ee3545573b5e843` (2026-10-02).
- Atalhos na raiz: `make env`, `make setup`, `make doctor`, `make dev`, `make up`, `make update-upstream`. O `doctor` confere Node, uv e as chaves do `.env`.
- Segredos: `mirofish/.env` nunca é versionado (regra no `.gitignore` da raiz). Chaves exigidas: `LLM_API_KEY` e `ZEP_API_KEY`.
- Código do upstream não é editado no local. Qualquer mudança necessária entra como camada na raiz (Makefile, scripts, docs). Se uma edição no código vendorizado for inevitável, registra-se em `UPSTREAM.md`.
- Atualização: `make update-upstream` compara a cópia com o upstream atual; a incorporação é manual e atualiza o commit em `UPSTREAM.md`.
- Licença: o `LICENSE` AGPL-3.0 é mantido dentro de `mirofish/`. Uso interno sem modificação não gera obrigação adicional; modificar o código e expô-lo como serviço de rede exige publicar o código-fonte modificado.
- Alternativas descartadas: repositório novo (mais um lugar para manter, sem ganho); submódulo git (exige inicialização a cada clone e depende de o upstream continuar disponível); fork (carrega histórico e CI do upstream sem necessidade).
- Critério de aceitação verificável: (1) `mirofish/UPSTREAM.md` existe e traz o commit de origem; (2) não existe `mirofish/.git`; (3) `git check-ignore mirofish/.env` retorna o caminho; (4) `make doctor` roda e aponta as chaves ausentes.
- Consequências aceitas: o repositório cresce cerca de 9 MB; correções do upstream não chegam sozinhas, dependem de rodar `make update-upstream`.
- Limite verificado na criação: instalação de dependências, subida do backend (`/health` 200) e build do frontend foram testados; uma simulação completa ainda não, por depender das chaves do usuário.

## References

- [_local-adr-policy-301 - Fonte única de distribuição](../platform/301-fonte-unica-distribuicao-dois-instaladores.md) - decisão vizinha sobre origem única de conteúdo
- Upstream: https://github.com/666ghj/MiroFish
- Commit de implementação: talessc74/Cidade, branch `claude/happy-volta-jxcs0h`
