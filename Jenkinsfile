pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                echo "Hello world!"
            }
        }
        stage ('preprod-code branch') {
            when {
                branch "preprod-*"
            }
            steps {
                sh '''
                cat README.md
                '''
            }
        }
        stage ("PR branch") {
            when {
                brnach "PR-*"
            }
            steps {
                echo "runs only for PR'S"
            }
        }
    }
}
