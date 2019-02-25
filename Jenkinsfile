pipeline {
    agent any
    stages {
        stage('Build') {
            when {
                branch 'develop'
            }
            steps {
                sh 'echo "Hello develop!"'
            }
        }
        stage('Build') {
            when {
                branch 'master'
            }
            steps {
                sh 'echo "Hello master!"'
            }
        }
    }
}
