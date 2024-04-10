package main

import (
	"fmt"
	"runtime"
)
import "strings"
import "log"

func main() {
	current := strings.ReplaceAll(runtime.Version(), "go", "")
	colored := fmt.Sprintf("\x1b[%dm%s\x1b[0m", 32, "Hello, DevoxxFR ! Go version :"+current)
	log.Println(colored)
}
