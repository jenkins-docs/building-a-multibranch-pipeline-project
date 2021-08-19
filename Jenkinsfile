pipeline {
    agent any
    options {
        timestamps()
    }
    stages {
        stage('Build Project A') {
            when {
                changeset "project-a/**"
            }
            steps {
                sh "echo project-a"
            }
        }
        stage('Build project B') {
            when {
                changeset "project-b/**"
            }
            steps {
                sh "echo project-b"
            }
        }
    }
}
