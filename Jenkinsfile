pipeline {
    agent any

    stages
    {
            srage("build") {
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