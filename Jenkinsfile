pipeline {
    agent any
    environment {
        // nnnn
        CI = 'true'
    }
    stages {
        // stage('Build') {
        //     steps {
        //         echo "build"
        //     }
        // }
        // stage('Test') {
        //     steps {
        //         echo "tests"
        //     }
        // }
        stage('PR') {
            when {
                changeRequest()
            }
            steps {
                echo "tests development PRRRRR"
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                echo "tests development"
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                echo "tests production"
            }
        }
    }
}
