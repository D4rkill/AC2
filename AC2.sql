create table produtos (
id_produto serial primary key,
nome varchar(100) not null,
preco double not null,
estoque int not null,
perecivel boolean not null,
marca varchar(100),
nacionalidade varchar(50)
);

insert into produtos (id_produto, nome, preco, estoque, perecivel, marca, nacionalidade) values
('maçã', 2.50, 100, true, 'marca A', 'brasil'),
('arroz', 4.00, 50, false, 'marca B', 'brasil'),
('leite', 3.20, 200, true, 'marca C', 'brasil'),
('feijão', 5.00, 75, false, 'marca D', 'brasil'),
('banana', 1.80, 120, true, 'marca E', 'brasil');

select * from produtos;

-- Relatório de quantos produtos estão cadastrados
select count(*) as total_produtos from produtos;

-- Relatório do preço médio dos produtos
select avg(preco) as preco_medio from produtos;

-- Média dos preços dos produtos agrupados por perecíveis e não perecíveis
select perecivel, avg(preco) as media_preco from produtos group by perecivel;

-- Média dos preços dos produtos agrupados pelo nome do produto
select nome, avg(preco) as media_preco from produtos group by nome;

-- Média dos preços e total em estoque dos produtos
select avg(preco) as media_preco, sum(estoque) as total_estoque from produtos;

-- Nome, marca e quantidade em estoque do produto mais caro
select nome, marca, estoque from produtos where preco = (select max(preco) from produtos);

-- Produtos com preço acima da média
select * from produtos where preco > (select avg(preco) from produtos);

-- Quantidade de produtos de cada nacionalidade
select nacionalidade, count(*) as quantidade from produtos group by nacionalidade;