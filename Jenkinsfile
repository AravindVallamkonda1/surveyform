pipeline {
   environment {
        registry = "aravindvallamkonda1/aravindswe645hw2"
        registryCredential = 'dockerhub_id'
        TIMESTAMP = new Date().format("yyyyMMdd_HHmmss")
    }
   agent any

   stages {
      stage('Build') {
         steps {
            script{
               sh 'pwd'
               sh 'rm -rf *.war'
               sh 'ls -l'
               sh 'jar -cvf SWE645HW1.war -C WebContent/ .'
               docker.withRegistry('',registryCredential){
                  def customImage = docker.build("aravindvallamkonda1/aravindswe645hw2:${env.TIMESTAMP}")
               }
            }
         }
      }

      stage('Push Image to Dockerhub') {
         steps {
            script{
               docker.withRegistry('',registryCredential){
                  sh "docker push aravindvallamkonda1/aravindswe645hw2:${env.TIMESTAMP}"
               }
            }
         }
      }

      stage('Deploying to Rancher to single node(deployed in 3 replicas)') {
         steps {
            script{
               sh "kubectl set image deployment/swe645hw2 container-0=aravindvallamkonda1/aravindswe645hw2:${env.TIMESTAMP}"
            }
         }
      }

      stage('Deploying to Rancher using Load Balancer as a service') {
         steps {
            script{
               sh "kubectl set image deployment/swe645hw2 container-0=aravindvallamkonda1/aravindswe645hw2:${env.TIMESTAMP}"
            }
         }
      }
   }
}
