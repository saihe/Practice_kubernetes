package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/api/sample", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello gin.",
		})
	})

	r.Run("0.0.0.0:8080")
}
