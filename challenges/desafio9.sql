SELECT COUNT(nome_usuarios) AS musicas_no_historico
FROM SpotifyClone.usuarios INNER JOIN historico_de_reproducao ON usuarios.usuario_id = historico_de_reproducao.usuario_id
WHERE usuarios.nome_usuarios = 'Barbara Liskov';