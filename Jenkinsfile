pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                echo '----stage build'
            }
        }
        stage('Test') {
            steps {
                echo '----stage test'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development' 
            }
            steps {
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                echo '----- development branch'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'  
            }
            steps {
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                echo '---- deploy branch'
            }
        }
    }
}
