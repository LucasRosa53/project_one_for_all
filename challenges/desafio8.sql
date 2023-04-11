SELECT n.nome_artista AS artista,
al.nome_album AS album
FROM SpotifyClone.artistas AS n INNER JOIN SpotifyClone.album AS al ON al.artista_id = n.artista_id
WHERE n.nome_artista = 'Elis Regina';