pipeline {
  agent any
  environment {
    BACKEND_IMAGE  = 'taskbloom-backend'
    FRONTEND_IMAGE = 'taskbloom-frontend'
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Build Backend') {
      steps {
        bat 'docker build -t %BACKEND_IMAGE%:latest ./backend'
      }
    }
    stage('Build Frontend') {
      steps {
        bat 'docker build -t %FRONTEND_IMAGE%:latest ./frontend'
      }
    }
    stage('Load to KinD') {
      steps {
        bat 'kind.exe load docker-image %BACKEND_IMAGE%:latest --name taskbloom'
        bat 'kind.exe load docker-image %FRONTEND_IMAGE%:latest --name taskbloom'
      }
    }
    stage('Deploy via Helm') {
      steps {
        bat 'helm.exe upgrade --install taskbloom-release ./taskbloom'
      }
    }
  }
  post {
    success { echo 'Deployment Successful!' }
    failure  { echo 'Pipeline Failed!' }
  }
}