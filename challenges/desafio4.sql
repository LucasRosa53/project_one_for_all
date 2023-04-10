SELECT u.nome_usuarios AS pessoa_usuaria,
IF(MAX(YEAR(hdr.data_reproducao)) >= 2021,  'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_de_reproducao AS hdr ON u.usuario_id = hdr.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;