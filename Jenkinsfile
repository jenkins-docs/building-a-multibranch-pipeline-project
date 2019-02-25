pipeline {
    agent any
    stages {
        when {
            branch 'develop'
        }
        stage('Build') {
            steps {
                sh 'echo "Hello develop!"'
            }
        }
    }
}
