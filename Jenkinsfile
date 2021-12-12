pipeline {
    agent {
        docker { image 'golang:1.17.4' }
    }

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