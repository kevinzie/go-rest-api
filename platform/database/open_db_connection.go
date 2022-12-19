package database

import "project/gofiber/app/queries"

// Queries struct for collect all app queries.
type Queries struct {
	*queries.BookQueries  // load queries from Book model
	*queries.PostsQueries // load queries from Book model
	//PostsQueries *queries.PostsQueries
}

// OpenDBConnection func for opening database connection.
func OpenDBConnection() (*Queries, error) {
	// Define a new PostgreSQL connection.
	db, err := PostgreSQLConnection()
	if err != nil {
		return nil, err
	}

	return &Queries{
		// Set queries from models:
		BookQueries:  &queries.BookQueries{DB: db},  // from Book model
		PostsQueries: &queries.PostsQueries{DB: db}, // from Book model
	}, nil
}
