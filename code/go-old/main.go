package main

import (
	"fmt"
	"runtime"
)
import "strings"
import "strconv"
import "log"
import "os"

func main() {
	current := strings.ReplaceAll(runtime.Version(), "go", "")
	parts := strings.SplitN(current, ".", 3)
	minor, _ := strconv.ParseInt(parts[1], 10, 64)
	if 16 != minor {
		// red output
		colored := fmt.Sprintf("\x1b[%dm%s\x1b[0m", 31, "Need go version between 1.16.0 and 1.16.15")
		log.Fatal(colored)
		os.Exit(1)
	}

	colored := fmt.Sprintf("\x1b[%dm%s\x1b[0m", 32, "Hello, Breizh Camp ! Go version :"+current)
	log.Println(colored)
}
