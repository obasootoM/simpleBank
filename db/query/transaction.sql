-- name: CreateTransaction :one
INSERT INTO transactions (
  from_account_id, to_account_id,ammount
) VALUES (
  $1, $2, $3
)
RETURNING *;


-- name: GetTransaction :one
SELECT * FROM transactions 
WHERE id  = $1
LIMIT 1;




-- name: ListTransaction :many
SELECT * FROM transactions
 WHERE  from_account_id = $1 OR to_account_id = $2
 ORDER BY id
 LIMIT $3
 OFFSET $4;






