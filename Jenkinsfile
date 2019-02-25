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
    }
}
