# 🚀 Social Insights Graph - Neo4j Case Study

## 📋 Sobre o Projeto
Este repositório contém o protótipo funcional de uma ferramenta de análise de mídias sociais desenvolvida para uma startup que precisa de insights reais sobre conexões humanas. Enquanto o SQL chora tentando processar relacionamentos complexos, o **Neo4j** resolve isso com a elegância e a performance de um grafo nativo.

---

## 🏗️ Modelo de Dados (Schema)
O projeto utiliza uma arquitetura de grafos projetada para performance e escalabilidade, focando no que realmente importa: as conexões.

* **Nós (Nodes):**
    * `Usuario`: O centro da rede (Propriedades: `nome`, `username`, `idade`).
    * `Postagem`: O conteúdo que gera o engajamento (Propriedades: `texto`, `id`).
    * `Comunidade`: Grupos de interesse segmentados (Propriedades: `nome`, `area`).

* **Relacionamentos (Relationships):**
    * `(:Usuario)-[:SEGUE]->(:Usuario)`: Conexões diretas entre usuários.
    * `(:Usuario)-[:POSTOU]->(:Postagem)`: Autoria de conteúdo original.
    * `(:Usuario)-[:CURTIU]->(:Postagem)`: Métricas de engajamento e popularidade.
    * `(:Usuario)-[:PARTICIPA]->(:Comunidade)`: Pertencimento e segmentação de nicho.

---

## 🛠️ Como Construir a Base (Seed)
Para popular seu banco de dados com a estrutura de 15 elementos (5 usuários, 5 posts e 5 comunidades), execute o seguinte script no seu console Cypher:

```cypher
// 1. Criando Usuários
CREATE (u1:Usuario {nome: "Alice", username: "@alice_tech", idade: 25}),
       (u2:Usuario {nome: "Bob", username: "@bob_builder", idade: 32}),
       (u3:Usuario {nome: "Charlie", username: "@char_grafos", idade: 28}),
       (u4:Usuario {nome: "Diana", username: "@diana_dev", idade: 21}),
       (u5:Usuario {nome: "Elon", username: "@elon_not_musk", idade: 40});

// 2. Criando Postagens
CREATE (p1:Postagem {id: 101, texto: "Neo4j é incrível para redes sociais!"}),
       (p2:Postagem {id: 102, texto: "Alguém sabe como otimizar queries Cypher?"}),
       (p3:Postagem {id: 103, texto: "Amo bases de dados relacionais... Mentira."}),
       (p4:Postagem {id: 104, texto: "O futuro é feito de conexões."}),
       (p5:Postagem {id: 105, texto: "Café e grafos, a combinação perfeita."});

// 3. Criando Comunidades
CREATE (c1:Comunidade {nome: "Data Science", area: "Tecnologia"}),
       (c2:Comunidade {nome: "Graph Lovers", area: "Engenharia"}),
       (c3:Comunidade {nome: "Dev Life", area: "Carreira"}),
       (c4:Comunidade {nome: "Neo4j Brasil", area: "Educação"}),
       (c5:Comunidade {nome: "AI Insights", area: "IA"});

// 4. Criando Relacionamentos de Exemplo
CREATE 
  (u1)-[:SEGUE]->(u2), (u2)-[:SEGUE]->(u3), (u3)-[:SEGUE]->(u4), (u4)-[:SEGUE]->(u5),
  (u1)-[:POSTOU]->(p1), (u2)-[:CURTIU]->(p1), (u3)-[:CURTIU]->(p1),
  (u1)-[:PARTICIPA]->(c1), (u2)-[:PARTICIPA]->(c2), (u3)-[:PARTICIPA]->(c4);
