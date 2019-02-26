pipeline {
    agent {
        docker {
            image 'node' 
            args '-p 3000:3000' 
        }
    }
    environment {
        HOME = '.'
        CI = 'true'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
                sh 'npm start &' 
            }
        },
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}

