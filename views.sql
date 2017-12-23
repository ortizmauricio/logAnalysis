CREATE VIEW article_ranks AS  
	SELECT articles.title, path_ranks.num 
	FROM articles 
	JOIN (SELECT path, count(*) AS num 
		FROM log 
		WHERE status = '200 OK' 
		AND path LIKE '%/article/%' GROUP BY path ORDER BY num DESC) 
	path_ranks ON path_ranks.path = '/article/' || articles.slug;

CREATE VIEW popular_authors AS 
	SELECT author_articles.name, SUM(article_ranks.num) AS total_visits 
	FROM (SELECT authors.name, articles.title 
		FROM authors 
		JOIN articles ON articles.author = authors.id) author_articles 
	JOIN article_ranks ON author_articles.title = article_ranks.title 
	GROUP BY author_articles.name ORDER BY total_visits DESC;

CREATE VIEW rates AS 
	SELECT DATE(time) AS day, 
	( CAST(SUM(CASE WHEN status = '404 NOT FOUND' THEN 1 ELSE 0 END) AS float) / 
		CAST(count(*) AS float ) * 100.0) AS percent 
	FROM log 
	GROUP BY day;