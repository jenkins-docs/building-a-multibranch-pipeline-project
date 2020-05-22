// execute this before anything else, including requesting any time on an agent
if (currentBuild.rawBuild.getCauses().toString().contains('BranchIndexingCause')) {
    print "INFO: Build skipped due to trigger being Branch Indexing"
    return
}

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello worltttt!"'
            }
        }
    }
}
