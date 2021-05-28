package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.Handle("/", http.HandlerFunc(func(rw http.ResponseWriter, r *http.Request) {
		rw.WriteHeader(http.StatusOK)
		rw.Write([]byte(fmt.Sprintf("%s learn-k3s", os.Getenv("DOMAIN"))))
	}))

	server := http.Server{Addr: fmt.Sprintf(":%s", os.Getenv("HTTP_PORT"))}
	defer server.Close()

	server.ListenAndServe()
}
