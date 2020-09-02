require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    attributes = { title: "Parasite", director: "Bong Joon-ho" }
    movie = Movie.create(attributes)
    # As a user,
    # when I visit /movies/1
    visit("/movies/#{movie.id}") # visit("/movies/1")
    # I see the title of the movie "Parasite"
    assert_text movie.title
    # I also see the name of the director "Bong Joon-ho"
    assert_text movie.director
  end

  test "visiting the index" do
    movie_1 = Movie.create(title: "Parasite", director: "Bong Joon-ho")
    movie_2 = Movie.create(title: "Titanic", director: "James Cameron")

    visit("/movies") # visit("/movies/1")

    assert_text movie_1.title
    assert_text movie_1.director

    assert_text movie_2.title
    assert_text movie_2.director
  end
end
