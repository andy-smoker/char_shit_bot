pipeline {
    agent any

    storage("build") {
        steps {
            go build -o run main.go
        }
    }
    storage("test") {
        steps {
            go test
        }
    }
}