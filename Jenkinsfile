node {
    docker.image('node:16-buster-slim').inside('-p 3000:3000') {
        stage('Build') {
            checkout scm
            sh 'npm install'
        }
        stage('Test') {
            checkout scm
            sh './jenkins/scripts/test.sh'
        }
        stage('Deploy') {
            checkout scm
            sh './jenkins/scripts/deliver.sh'
            input message: 'Sudah selesai? (klik "Proceed" untuk mengakhiri)'
            sh './jenkins/scripts/kill.sh'
        }
    }
}