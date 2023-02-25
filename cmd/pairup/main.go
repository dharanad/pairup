package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	fmt.Println("Hello, PairUp")
	r := gin.Default()
	r.GET("/health", func(context *gin.Context) {
		context.JSON(http.StatusOK, map[string]string{
			"message": "healthy",
		})
	})
	if err := r.Run(":8080"); err != nil {
		panic(err)
	}
}
