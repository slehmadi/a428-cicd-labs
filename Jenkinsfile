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
        stage('Build image') {
            checkout scm
            withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')])
            sh 'docker build -t slehmadi/react-app-cicd-dicoding .'
            sh 'docker login -u $USER -p $PASS'
            sh 'docker push slehmadi/react-app-cicd-dicoding'
        }
        stage('Manual Approval') {
            checkout scm
            input message: 'Lanjutkan ke tahap Deploy?'
        }
        stage('Deploy') {
            checkout scm
            sh './jenkins/scripts/deliver.sh'
            sh 'sleep 60'
            sh './jenkins/scripts/kill.sh'
        }
    }
}