pipeline {
   agent { any { image 'mcr.microsoft.com/playwright:focal' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'npm install'
            sh 'npm run test'
         }
      }
   }
}
