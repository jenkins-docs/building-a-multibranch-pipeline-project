  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def mvn = tool 'Default Maven';
    withSonarQubeEnv() {
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=building-a-multibranch-pipeline-project -Dsonar.projectName='building-a-multibranch-pipeline-project'"
    }
  }
