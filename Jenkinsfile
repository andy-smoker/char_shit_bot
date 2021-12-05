pipeline {
    agent any

    stages
    {
        stage("build") {
            steps {
                go build -o run main.go
            }
        }
        stage("test") {
            steps {
                go test
            }
        }
    }
}