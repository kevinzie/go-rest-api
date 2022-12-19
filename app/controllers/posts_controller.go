package controllers

import (
	"github.com/gofiber/fiber/v2"
	"project/gofiber/platform/database"
)

// GetPosts func gets all exists books.
// @Description Get all exists books.
// @Summary get all exists books
// @Tags Posts
// @Accept json
// @Produce json
// @Success 200 {array} models.Posts
// @Router /v1/posts [get]
func GetPosts(c *fiber.Ctx) error {
	// Create database connection.
	db, err := database.OpenDBConnection()
	if err != nil {
		// Return status 500 and database connection error.
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
			"error": true,
			"msg":   err.Error(),
		})
	}

	// Get all books.
	posts, err := db.GetPosts()
	if err != nil {
		// Return, if books not found.
		return c.Status(fiber.StatusNotFound).JSON(fiber.Map{
			"error":       true,
			"msg":         "Posts were not found",
			"count":       0,
			"booasdasdks": nil,
		})
	}

	// Return status 200 OK.
	return c.JSON(fiber.Map{
		"results": posts,
	})
}
