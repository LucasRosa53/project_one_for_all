SELECT nm.nome_musicas AS cancao,
COUNT(hdr.musicas_id) AS reproducoes
FROM SpotifyClone.musicas AS nm
INNER JOIN SpotifyClone.historico_de_reproducao AS hdr ON nm.musicas_id = hdr.musicas_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao LIMIT 2;