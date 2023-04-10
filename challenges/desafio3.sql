SELECT u.nome_usuarios AS pessoa_usuaria,
COUNT(hdr.musicas_id) AS musicas_ouvidas,
ROUND(SUM(m.duracoes_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.historico_de_reproducao AS hdr
INNER JOIN SpotifyClone.musicas AS m
ON hdr.musicas_id = m.musicas_id
INNER JOIN SpotifyClone.usuarios AS u
ON hdr.usuario_id = u.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;