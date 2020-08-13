package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	logger := log.New(os.Stdout, "go.boilerplate.service", log.LstdFlags|log.Lshortfile)

	logger.Println("Started service")

	done := make(chan os.Signal, 1)
	signal.Notify(done, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	logger.Println("Waiting for shutdown signals...")
	<-done

	logger.Println("Exiting")
}
