pipeline {
    agent any
    stages {
        stage('java code pull') {
            steps {
                sh 'echo "Hello java!"'
            }
        }
        stage('compile') {
            steps {
                sh 'echo "Hello compile!"'
            }
        }
        stage('testing sonar') {
            steps {
                sh 'echo "Hello sonar!"'
            }
        }
        stage('push to artifactory') {
            steps {
                sh 'echo "Hello artu!"'
            }
        }
        stage('Build and push image') {
            steps {
                sh 'echo "Hello doker!"'
            }
        }
    }
}
