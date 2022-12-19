package queries

import (
	"github.com/jmoiron/sqlx"
	"project/gofiber/app/models"
)

// BookQueries struct for queries from Book model.
type PostsQueries struct {
	*sqlx.DB
}

// GetBooks method for getting all books.
func (q *PostsQueries) GetPosts() ([]models.Posts, error) {
	// Define books variable.
	posts := []models.Posts{}

	// Define query string.
	query := `SELECT * FROM posts`

	// Send query to database.
	err := q.Select(&posts, query)
	if err != nil {
		// Return empty object and error.
		return posts, err
	}

	// Return query result.
	return posts, nil
}

// GetBook method for getting one book by given ID.
//func (q *BookQueries) GetBook(id uuid.UUID) (models.Book, error) {
//	// Define book variable.
//	book := models.Book{}
//
//	// Define query string.
//	query := `SELECT * FROM books WHERE id = $1`
//
//	// Send query to database.
//	err := q.Get(&book, query, id)
//	if err != nil {
//		// Return empty object and error.
//		return book, err
//	}
//
//	// Return query result.
//	return book, nil
//}
//
//// CreateBook method for creating book by given Book object.
//func (q *BookQueries) CreateBook(b *models.Book) error {
//	// Define query string.
//	query := `INSERT INTO books VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`
//
//	// Send query to database.
//	_, err := q.Exec(query, b.ID, b.CreatedAt, b.UpdatedAt, b.UserID, b.Title, b.Author, b.BookStatus, b.BookAttrs)
//	if err != nil {
//		// Return only error.
//		return err
//	}
//
//	// This query returns nothing.
//	return nil
//}
//
//// UpdateBook method for updating book by given Book object.
//func (q *BookQueries) UpdateBook(id uuid.UUID, b *models.Book) error {
//	// Define query string.
//	query := `UPDATE books SET updated_at = $2, title = $3, author = $4, book_status = $5, book_attrs = $6 WHERE id = $1`
//
//	// Send query to database.
//	_, err := q.Exec(query, id, b.UpdatedAt, b.Title, b.Author, b.BookStatus, b.BookAttrs)
//	if err != nil {
//		// Return only error.
//		return err
//	}
//
//	// This query returns nothing.
//	return nil
//}
//
//// DeleteBook method for delete book by given ID.
//func (q *BookQueries) DeleteBook(id uuid.UUID) error {
//	// Define query string.
//	query := `DELETE FROM books WHERE id = $1`
//
//	// Send query to database.
//	_, err := q.Exec(query, id)
//	if err != nil {
//		// Return only error.
//		return err
//	}
//
//	// This query returns nothing.
//	return nil
//}
