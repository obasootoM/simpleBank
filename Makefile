postgres:
	docker run -name postgres14 -p 8888:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=postgres -d postgres:14
	 
createdb:
	docker exec -it postgres14 createdb --username=root --owner=root banking

dropdb:
	docker exec -it postgres14 dropdb banking
	
migrateup:
	migrate -path db/migration -database "postgresql://root:postgres@localhost:8888/banking?sslmode=disable" -verbose up 

migratedown:
	migrate -path db/migration -database "postgresql://root:postgres@localhost:8888/banking?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc