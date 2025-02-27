
pipeline {
    agent any

     stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the application
                    sh 'make build'  // Modify this according to your build process
                }
            }
        }

        stage('Unit Test') {
            steps {
                script {
                    // Run unit tests
                    sh 'make test'  // Modify this according to your test process
                }
            }
        }
     }
}
