pipeline
{
    agent any
    stages
    {
        stage('Build')
        {
            steps
            {
                sh '''
                    sh mvn.sh mvn clean package
                '''
            }
        }
    }
}
