pipeline {
  agent any
  tools { maven 'Default Maven' }
  stages {
    stage('SCM') {
      steps { checkout scm }
    }
    stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('SonarLocal') {
          sh "mvn clean verify sonar:sonar " +
             "-Dsonar.projectKey=building-a-multibranch-pipeline-project " +
             "-Dsonar.projectName='building-a-multibranch-pipeline-project'"
        }
      }
    }
    stage('Quality Gate') {
      steps {
        timeout(time: 5, unit: 'MINUTES') {
          waitForQualityGate abortPipeline: true
        }
      }
    }
  }
}
