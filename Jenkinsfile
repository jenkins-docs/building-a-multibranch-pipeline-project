node {
    // Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
            checkout scm
        }
        stage ('Build') {
            sh "echo 'shell scripts to build project...'"
        }
        stage ('Deliver') {
            parallel 'Stagging': {
                sh "echo 'shell scripts to run Stagging tests...'"
            },
            'Development': {
                stage ('Deploy') {
                    sh "echo 'shell scripts to deploy to server...'"
                }
            }
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}
