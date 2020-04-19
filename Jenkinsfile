pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build Complete!"'
            }
        }
        stage('Test') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                sh 'echo "Delivered to development!"'
                input message: 'Happy?'
                sh 'echo "Something else happened!"'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh 'echo "Delivered to development!"'
                input message: 'Happy?'
                sh 'echo "Something else happened!"'
            }
        }
    }
}
