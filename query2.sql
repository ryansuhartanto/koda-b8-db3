SELECT "movies"."name", "movies"."year", "movies"."rankscore", concat_ws(' ', "directors"."first_name", "directors"."last_name") AS "director", "movies_genres"."genre" FROM "movies"
CROSS JOIN "directors"
JOIN "movies_directors" ON "movies_directors"."movie_id" = "movies"."id" AND "movies_directors"."director_id" = "directors"."id"
JOIN "movies_genres" ON "movies_genres"."movie_id" = "movies"."id"
LIMIT 50;

SELECT concat_ws(' ', "actors"."first_name", "actors"."last_name"), "movies"."name" as "movie", "roles"."role" FROM "actors"
CROSS JOIN "movies"
JOIN "roles" ON "roles"."actor_id" = "actors"."id" AND "roles"."movie_id" = "movies"."id"
LIMIT 50;
