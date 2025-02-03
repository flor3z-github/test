package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// Initialize the Gin router with default middleware (logger and recovery)
	router := gin.Default()

	// Define a simple GET route for the root endpoint
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello, World!",
		})
	})

	// Define another endpoint for demonstration
	router.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	// Start the web server on port 8080
	router.Run(":8080")
}
