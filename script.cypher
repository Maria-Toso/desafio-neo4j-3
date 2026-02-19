// 1. Criando 5 Usuários
CREATE (u1:Usuario {nome: "Alice", username: "@alice_tech", idade: 25}),
       (u2:Usuario {nome: "Bob", username: "@bob_builder", idade: 32}),
       (u3:Usuario {nome: "Charlie", username: "@char_grafos", idade: 28}),
       (u4:Usuario {nome: "Diana", username: "@diana_dev", idade: 21}),
       (u5:Usuario {nome: "Elon", username: "@elon_not_musk", idade: 40})

// 2. Criando 5 Postagens
CREATE (p1:Postagem {id: 101, texto: "Neo4j é incrível para redes sociais!", data: "2026-02-19"}),
       (p2:Postagem {id: 102, texto: "Alguém sabe como otimizar queries Cypher?", data: "2026-02-18"}),
       (p3:Postagem {id: 103, texto: "Amo bases de dados relacionais... Mentira.", data: "2026-02-17"}),
       (p4:Postagem {id: 104, texto: "O futuro é feito de conexões.", data: "2026-02-16"}),
       (p5:Postagem {id: 105, texto: "Café e grafos, a combinação perfeita.", data: "2026-02-15"})

// 3. Criando 5 Comunidades/Tópicos
CREATE (c1:Comunidade {nome: "Data Science", area: "Tecnologia"}),
       (c2:Comunidade {nome: "Graph Lovers", area: "Engenharia"}),
       (c3:Comunidade {nome: "Dev Life", area: "Carreira"}),
       (c4:Comunidade {nome: "Neo4j Brasil", area: "Educação"}),
       (c5:Comunidade {nome: "AI Insights", area: "IA"})

// 4. Criando Relacionamentos (O Caos Organizado)
CREATE 
  // Seguidores
  (u1)-[:SEGUE]->(u2), (u1)-[:SEGUE]->(u3), (u2)-[:SEGUE]->(u4), (u3)-[:SEGUE]->(u5), (u4)-[:SEGUE]->(u1),
  
  // Postagens e Curtidas
  (u1)-[:POSTOU]->(p1), (u2)-[:CURTIU]->(p1), (u3)-[:CURTIU]->(p1), (u4)-[:CURTIU]->(p1),
  (u2)-[:POSTOU]->(p2), (u1)-[:CURTIU]->(p2), (u5)-[:CURTIU]->(p2),
  (u3)-[:POSTOU]->(p3), (u4)-[:CURTIU]->(p3),
  (u4)-[:POSTOU]->(p4), (u5)-[:CURTIU]->(p4), (u1)-[:CURTIU]->(p4),
  (u5)-[:POSTOU]->(p5), (u2)-[:CURTIU]->(p5),

  // Membros de Comunidades
  (u1)-[:PARTICIPA]->(c1), (u1)-[:PARTICIPA]->(c4),
  (u2)-[:PARTICIPA]->(c2), (u2)-[:PARTICIPA]->(c3),
  (u3)-[:PARTICIPA]->(c4), (u3)-[:PARTICIPA]->(c5),
  (u4)-[:PARTICIPA]->(c1), (u4)-[:PARTICIPA]->(c3),
  (u5)-[:PARTICIPA]->(c5), (u5)-[:PARTICIPA]->(c2)
