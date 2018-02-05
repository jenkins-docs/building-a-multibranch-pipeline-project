pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'yarn'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
		stage('Deliver') {
			parallel 'development': {
                sh "echo 'shell scripts to run static tests...'"
            },
            'stagging': {
                sh "echo 'shell scripts to run unit tests...'"
            }
		}
        stage('Deploy for production') {
				when {
					branch 'production'
				}
				steps {
					sh './jenkins/scripts/deploy-for-production.sh'
					input message: 'Finished using the web site? (Click "Proceed" to continue)'
					sh './jenkins/scripts/kill.sh'
				}
        }
    }
}
