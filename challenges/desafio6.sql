SELECT MIN(valor_plano) AS faturamento_minimo,
MAX(valor_plano) AS faturamento_maximo,
ROUND(AVG(valor_plano), 2) AS faturamento_medio,
SUM(valor_plano) AS faturamento_total
FROM SpotifyClone.usuarios AS u INNER JOIN SpotifyClone.planos AS p ON u.planos_id = p.planos_id;