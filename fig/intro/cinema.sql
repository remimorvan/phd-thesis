SELECT title, time
FROM Movies, Projections
WHERE Projections.movie_id = Movies.id;
