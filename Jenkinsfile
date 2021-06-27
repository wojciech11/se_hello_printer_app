pipeline {
    agent any
    stages {
        stage('Deps') {
            steps {
                    sh 'make deps'
                }
        }
        stage('Linter') {
            steps {
                    sh 'make lint'
                }
        }
        stage('Test') {
            steps {
              sh 'make test_xunit || true'
              xunit thresholds: [
              skipped(failureThreshold: '0'),
              failed(failureThreshold: '1')
              ],
              tools: [
                  JUnit(deleteOutputFiles: true,
                        failIfNotNew: true,
                        pattern: 'test_results.xml',
                        skipNoTestFiles: false,
                        stopProcessingIfError: true)
              ]
          }
       }
    }
}
