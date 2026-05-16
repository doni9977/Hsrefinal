package main

import (
	"fmt"
	"net/http"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Welcome to SRE Capstone App inside Minikube!")
	})

	fmt.Println("Server is starting on port 8080...")
	
	
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}