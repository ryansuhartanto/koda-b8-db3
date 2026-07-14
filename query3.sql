SELECT
    concat_ws(' ', "directors"."first_name", "directors"."last_name") AS "name",
    COUNT(*) AS "total_genres"
FROM "directors"
JOIN "directors_genres" ON "directors_genres"."director_id" = "directors"."id"
GROUP BY "directors"."id"
ORDER BY COUNT(*) DESC;

SELECT
    concat_ws(' ', "actors"."first_name", "actors"."last_name") AS "name",
    "actors"."gender",
    COUNT(*) AS "total_roles"
FROM "actors"
JOIN "roles" ON "roles"."actor_id" = "actors"."id"
GROUP BY "actors"."id"
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;

SELECT
    concat_ws(' ', "directors"."first_name", "directors"."last_name") AS "name",
    COUNT(*) AS "total_movies"
FROM "directors"
JOIN "movies_directors" ON "movies_directors"."director_id" = "directors"."id"
GROUP BY "directors"."id"
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT
    "year",
    COUNT(*) AS "total"
FROM "movies"
GROUP BY "movies"."year"
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT
    "movies"."name",
    "movies"."rankscore",
    "movies"."year",
    string_agg("movies_genres"."genre", ', ')
FROM "movies"
JOIN "movies_genres" ON "movies_genres"."movie_id" = "movies"."id"
GROUP BY "movies"."id"
