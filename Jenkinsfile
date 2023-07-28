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
    }
    stage('Build Image') {
        checkout scm
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
            sh 'docker build -t slehmadi/react-app-cicd-dicoding .'
            sh 'docker login -u $USER -p $PASS'
            sh 'docker push slehmadi/react-app-cicd-dicoding'
        }
    }
    stage('Manual Approval') {
        checkout scm
        input message: 'Lanjutkan ke tahap Deploy?'
    }
    stage('Deploy') {
        checkout scm
        sshagent(['ec2-server-key']) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@13.212.240.207 sudo docker run -p 3000:3000 -d --rm slehmadi/react-app-cicd:latest sleep 60"
        }
    }
}