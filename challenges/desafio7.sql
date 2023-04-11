SELECT n.nome_artista AS artista,
al.nome_album AS album,
COUNT(s.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS n INNER JOIN SpotifyClone.album AS al ON al.artista_id = n.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS s ON s.artista_id = n.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;