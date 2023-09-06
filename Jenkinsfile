@Library('my-shared-library')

pipeline{
    agent any

    stages{

        stage('git checkout'){

            steps{
            gtiCheckout(
                branch: "main",
                url: ""
            )
            } 

        }
    }
}
