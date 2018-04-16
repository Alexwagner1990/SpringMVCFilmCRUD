package com.skilldistillery.film.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.FilmCategory;
import com.skilldistillery.film.entities.Language;

public class DatabaseAccessorImpl implements DatabaseAccessorInterface {

	private static final String URL = "jdbc:mysql://localhost:3306/sdvid";
	private static final String user = "student";
	private static final String pass = "student";

	public DatabaseAccessorImpl() throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
	}

	@Override
	public Film getFilmById(int filmId) {
		ResultSet rs;
		Connection conn;
		PreparedStatement stmt;
		try {
			DatabaseAccessorImpl castGetter = new DatabaseAccessorImpl();
			conn = DriverManager.getConnection(URL, user, pass);
			String sql = "select id, title, description, release_year, language_id, rental_duration, "
					+ "rental_rate, length, replacement_cost, rating, special_features from film where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Film f = new Film(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11),
						castGetter.getActorsByFilmId(filmId));
				f.setCategory(castGetter.getFilmCategory(f));
				f.setLanguage(castGetter.getLanguageName(f));
				rs.close();
				conn.close();
				stmt.close();
				return f;
			} else {
				// System.out.println("Film not found, try a different ID or don't I'm not your
				// dad");
				rs.close();
				conn.close();
				stmt.close();
				return null;
			}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Actor getActorById(int actorId) {
		ResultSet rs;
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			String sql = "select id, first_name, last_name from actor where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Actor a = new Actor(rs.getInt(1), rs.getString(2), rs.getString(3));
				rs.close();
				conn.close();
				stmt.close();
				return a;
			} else {
				conn.close();
				stmt.close();
				rs.close();
				return null;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public Actor addActor(Actor actor) {
		// System.out.println(actor);
		// System.out.println(actor.getFirstName());
		// System.out.println(actor.getLastName());
		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);
			String sql = "insert into actor (first_name, last_name) values (?,?) ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, actor.getFirstName());
			stmt.setString(2, actor.getLastName());
			int success = stmt.executeUpdate();
			if (success == 1) {
				String sql2 = "Select last_insert_id()";
				Statement stmt2 = conn.createStatement();
				ResultSet rs = stmt2.executeQuery(sql2);
				if (rs.next()) {
					actor.setId(rs.getInt(1));
					System.out.println("There");
					conn.close();
					stmt.close();
					return actor;
				}
				return null;
			} else {
				conn.close();
				stmt.close();
				return null;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public List<Actor> getActorsByFilmId(int filmId) {
		ResultSet rs;
		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);
			String sql = "select a.id, a.first_name, a.last_name from actor a join film_actor fa on a.id = fa.actor_id where fa.film_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			rs = stmt.executeQuery();
			boolean checkIfIdFindsAnything = false;
			List<Actor> actorList = new ArrayList<>();
			while (rs.next()) {
				checkIfIdFindsAnything = true;
				Actor foundActor = new Actor(rs.getInt(1), rs.getString(2), rs.getString(3));
				actorList.add(foundActor);
			}
			if (!checkIfIdFindsAnything) {
				rs.close();
				conn.close();
				stmt.close();
				return null;
			}
			rs.close();
			conn.close();
			stmt.close();
			return actorList;

		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}

	}

	@Override
	public List<Film> getFilmBySearchTerm(String search) {
		ResultSet rs;
		Connection conn;
		PreparedStatement stmt;
		List<Film> foundFilms = new ArrayList<>();
		try {
			DatabaseAccessorImpl castGetter = new DatabaseAccessorImpl();
			conn = DriverManager.getConnection(URL, user, pass);
			String sql = "select id, title, description, release_year, language_id, rental_duration, "
					+ "rental_rate, length, replacement_cost, rating, special_features from film where title like ? or description like ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + search + "%");
			stmt.setString(2, "%" + search + "%");
			rs = stmt.executeQuery();
			boolean didYouFindAFilm = false;
			while (rs.next()) {
				didYouFindAFilm = true;
				Film f = new Film(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11),
						castGetter.getActorsByFilmId(rs.getInt(1)));
				f.setCategory(castGetter.getFilmCategory(f));
				f.setLanguage(castGetter.getLanguageName(f));
				foundFilms.add(f);
			}
			if (!didYouFindAFilm) {
				conn.close();
				stmt.close();
				rs.close();
				return null;
			}
			return foundFilms;
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public Language getLanguageName(Film filmWithoutLanguage) {
		if (filmWithoutLanguage == null) {
			return null;
		}
		int languageId = filmWithoutLanguage.getLanguage_id();
		Language languageFromId = new Language();
		ResultSet rs;
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			String sql = "select id, name from language where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, languageId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				String languageName = rs.getString(2);
				languageFromId.setLanguage_name(languageName);
				rs.close();
				conn.close();
				stmt.close();
				return languageFromId;
			} else {
				conn.close();
				stmt.close();
				rs.close();
				return null;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public FilmCategory getFilmCategory(Film filmWithNoDetails) {
		FilmCategory category = new FilmCategory();
		ResultSet rs;
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			String sql = "select c.name from film_category fc join category c on fc.category_id = c.id where fc.category_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmWithNoDetails.getId());
			rs = stmt.executeQuery();
			if (rs.next()) {
				String categoryName = rs.getString(1);
				category.setCategoryName(categoryName);
				rs.close();
				conn.close();
				stmt.close();
				return category;
			} else {
				conn.close();
				stmt.close();
				rs.close();
				return null;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public Film addFilm(Film film) {
		System.out.println(film);
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "insert into film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features) values (?,?,?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			 stmt.setInt(3, film.getRelease_year());
			 stmt.setInt(4, film.getLanguage_id());
			 stmt.setInt(5, film.getRental_duration());
			 stmt.setInt(6, film.getRental_rate());
			 stmt.setInt(7, film.getLength());
			 stmt.setInt(8, film.getReplacement_cost());
			 stmt.setString(9, film.getRating());
			 stmt.setString(10, film.getSpecial_features());
			int success = stmt.executeUpdate();
			System.out.println("FirstAddSuccess");
			if (success == 1) {
				// ResultSet rs = stmt.getGeneratedKeys();
				String sql2 = "select last_insert_id()";
				PreparedStatement stmt2 = conn.prepareStatement(sql2);
				ResultSet rs2 = stmt2.executeQuery();
				System.out.println("SecondQuerySuccess");
				int filmid=0;
				if(rs2.next()) {
				filmid = rs2.getInt(1);
				System.out.println(filmid);
				film.setId(filmid);
				 conn.commit();
				conn.close();
				stmt.close();
				return film;
				}
				// conn.commit();
				conn.close();
				stmt.close();
				return null;
			} else {
				// conn.commit();
				conn.close();
				stmt.close();
				return null;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public boolean deleteFilm(int filmId) {
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "delete from film where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			int success = stmt.executeUpdate();
			if (success == 1) {
				conn.commit();
				conn.close();
				stmt.close();
				return true;
			} else {
				conn.commit();
				conn.close();
				stmt.close();
				return false;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return false;
		}
	}

	@Override
	public Film updateFilm(Film film) {
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "update film set title = ?, description = ?, release_year = ?, language_id = ?, rental_duration = ?, rental_rate = ?, length = ?, replacement_cost = ?, rating = ?, special_features = ? where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getRelease_year());
			stmt.setInt(4, film.getLanguage_id());
			stmt.setInt(5, film.getRental_duration());
			stmt.setInt(6, film.getRental_rate());
			stmt.setInt(7, film.getLength());
			stmt.setInt(8, film.getReplacement_cost());
			stmt.setString(9, film.getRating());
			stmt.setString(10, film.getSpecial_features());
			stmt.setInt(11, film.getId());
			int success = stmt.executeUpdate();
			if (success == 1) {
				DatabaseAccessorImpl dbl = new DatabaseAccessorImpl();
				film.setCategory(dbl.getFilmCategory(film));
				film.setLanguage(dbl.getLanguageName(film));
				film.setActors(dbl.getActorsByFilmId(film.getId()));
				conn.commit();
				conn.close();
				stmt.close();
				return film;
			} else {
				conn.commit();
				conn.close();
				stmt.close();
				return null;
			}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}

	}

	@Override
	public Actor updateActor(Actor actor) {
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "update actor set first_name = ?, last_name = ? where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, actor.getFirstName());
			stmt.setString(2, actor.getLastName());
			stmt.setInt(3, actor.getId());
			int success = stmt.executeUpdate();
			if (success == 1) {
				// DatabaseAccessorImpl dbl = new DatabaseAccessorImpl();
				conn.commit();
				conn.close();
				stmt.close();
				return actor;
			} else {
				conn.commit();
				conn.close();
				stmt.close();
				return null;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

	@Override
	public boolean deleteActor(int actorId) {
		// System.out.println(actorId);
		Connection conn;
		PreparedStatement stmt;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			Connection conn2 = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "delete from film_actor where actor_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			int success = stmt.executeUpdate();
			// if (success !=0) {
			// conn.commit();
			// return true;
			// }
			// return false;
			if (success != 0) {
				String sql2 = "delete from actor where id=?";
				PreparedStatement stmt2 = conn.prepareStatement(sql2);
				stmt2.setInt(1, actorId);
				int success2 = stmt.executeUpdate();
				if (success2 == 1) {
					conn.commit();
					conn.close();
					stmt.close();
					return true;
				}

				return false;
			} else {

				return false;
			}
		} catch (SQLException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return false;
		}
	}

	public List<Film> getActorFilms(int actorId) {
		System.out.println(actorId);
		Connection conn;
		PreparedStatement stmt;
		List<Film> filmIdList = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "select film_id from film_actor where actor_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			ResultSet rs = stmt.executeQuery();
			DatabaseAccessorImpl dbl = new DatabaseAccessorImpl();
			while (rs.next()) {
				int filmId = rs.getInt(1);
				Film f = dbl.getFilmById(filmId);
				filmIdList.add(f);
			}
			conn.commit();
			conn.close();
			stmt.close();
			return filmIdList;
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Database problem. Dunno what to tell ya.");
			return null;
		}
	}

}
