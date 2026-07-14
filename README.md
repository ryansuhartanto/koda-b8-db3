# SQL Query & Join

Database exercise querying data with various ways.

## [query1](query1)

```sql
SELECT * FROM "movies" WHERE "year" > 2000;
```

id | name | year | rankscore
-: | :- | :-: | :-:
0 | #28 | 2002 | NULL
10 | $100,000 Pyramid, The | 2001 | NULL
17 | $300 y tickets | 2002 | NULL
21 | $5.15/Hr. | 2004 | NULL
33 | $windle | 2002 | 5.4
36 | '15' | 2002 | 6.8
42 | '60s Pop Rock Reunion | 2004 | NULL
47 | '88 Dodge Aries | 2002 | NULL
57 | 'Ang Galing galing mo, Babes' | 2002 | NULL
61 | 'As se hizo' - Torremolinos 73 | 2003 | NULL

```sql
SELECT * FROM "actors" WHERE "last_name" LIKE '%s';
```

id | first_name | last_name | gender
-: | :- | :- | :-:
37 | The | 3 Whippets | M
42 | The | 4D Jones | M
49 | Dragan | a zovu ga Elvis | M
86 | Sebastian | Aagaard-Williams | M
122 | Willie | Aames | M
135 | Efisio | Aarbus | M
139 | Fritz | Aardvark Bragpuss | M
144 | Jeffrey | Aarles | M
181 | Aaron | Aarons | M
182 | Allan | Aarons | M

```sql
SELECT * FROM "movies" WHERE "rankscore" BETWEEN 5 AND 7 AND "year" BETWEEN 2004 AND 2006;
```

id | name | year | rankscore
-: | :- | :-: | :-:
634 | 10 on Ten | 2004 | 5.8
709 | 100 minuta slave | 2004 | 6.8
907 | 11 commandements, Les | 2004 | 5
1038 | 13 Going On 30 | 2004 | 6.3
1311 | 18-j | 2004 | 5.4
1930 | 24th Day, The | 2004 | 6.6
1938 | 25 degrs en hiver | 2004 | 6.6
2030 | 2BPerfectlyHonest | 2004 | 7
2709 | 50 First Dates | 2004 | 6.8
2838 | 5x2 cinq fois deux | 2004 | 6.2

```sql
SELECT COUNT(*) FROM "movies" WHERE "rankscore" >= 6 AND "rankscore" < 7;
```

| count
:-:
17113

## [query2](query2)

```sql
SELECT "movies"."name", "movies"."year", "movies"."rankscore", concat_ws(' ', "directors"."first_name", "directors"."last_name") AS "director", "movies_genres"."genre"
FROM "movies"
CROSS JOIN "directors"
JOIN "movies_directors" ON "movies_directors"."movie_id" = "movies"."id" AND "movies_directors"."director_id" = "directors"."id"
JOIN "movies_genres" ON "movies_genres"."movie_id" = "movies"."id"
LIMIT 50;
```

name | year | rankscore | director | genre
:- | :-: | :-: | :- | :-
#7 Train: An Immigrant Journey, The | 2000 | NULL | Hye Jung Park | Documentary
#7 Train: An Immigrant Journey, The | 2000 | NULL | J.T. Takagi | Documentary
#7 Train: An Immigrant Journey, The | 2000 | NULL | Hye Jung Park | Short
#7 Train: An Immigrant Journey, The | 2000 | NULL | J.T. Takagi | Short
$ | 1971 | 6.4 | Richard (I) Brooks | Comedy
$ | 1971 | 6.4 | Richard (I) Brooks | Crime
$1,000 Reward | 1923 | NULL | Charles R. Seeling | Western
$1,000,000 Duck | 1971 | 5 | Vincent McEveety | Comedy
$1,000,000 Duck | 1971 | 5 | Vincent McEveety | Family
$10,000 Under a Pillow | 1921 | NULL | Frank Moser | Animation

```sql
SELECT concat_ws(' ', "actors"."first_name", "actors"."last_name") AS "name", "actors"."gender", "movies"."name" as "movie", "roles"."role"
FROM "actors"
CROSS JOIN "movies"
JOIN "roles" ON "roles"."actor_id" = "actors"."id" AND "roles"."movie_id" = "movies"."id"
LIMIT 50;
```

name | gender | movie | role
:- | :-: | :- | :-
Greg Fitzpatrick | M | #28 | #1 Man
Laura Niemi | F | #28 | #1 Woman
Darrell (I) Armstrong | M | $ | Associated Press
Warren Beatty | M | $ | Joe Collins
Scott (I) Brady | M | $ | Sarge
Arthur Brauss | M | $ | Candy Man
Gert Fröbe | M | $ | Mr. Kessel
Bob Herron | M | $ | Bodyguard
Horst Hesslein | M | $ | Bruno
Hans (I) Hutter | M | $ | Karl

## License

[MIT](LICENSE)
