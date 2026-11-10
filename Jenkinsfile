@Library('os-build-lib@feature/sandbox-test-lib') _

pipeline {
    agent any

    parameters {
        choice(
            name: 'RELEASE_VERSION', 
            choices: ['1.0.0-beta', '1.0.0-rc', '1.0.0-stable'], 
            description: 'Выберите версию релиза для всех сборок'
        )
    }

    stages {
        stage('Parallel OS Builds') {
            // Блок parallel запускает вложенные этапы ОДНОВРЕМЕННО
            parallel {
                stage('Build Ubuntu') {
                    steps {
                        echo "🐧 Запуск сборки Ubuntu в параллельном потоке..."
                        buildMiniOs([
                            osType: 'ubuntu-24.04',
                            releaseVersion: params.RELEASE_VERSION,
                            imageName: 'my-mini-os'
                        ])
                    }
                }
                stage('Build Alpine') {
                    steps {
                        echo "🏔️ Запуск сборки Alpine в параллельном потоке..."
                        buildMiniOs([
                            osType: 'alpine-3.18',
                            releaseVersion: params.RELEASE_VERSION,
                            imageName: 'my-mini-os'
                        ])
                    }
                }
            }
        }
    }
      post {
        success {
            echo "🎉 Все образы успешно собраны! Передаем эстафету Оркестратору."
            
            // Мы соберем в одну строку выбранные ОС, но для простоты предположим, 
            // что мы хотим протестировать только Ubuntu (или можно передавать список).
            // В реальном сценарии Job 1 триггерит Scheduler для каждой успешной сборки.
            
            build job: 'PROJECT/os-scheduler',
                  parameters: [
                      string(name: 'OS_TYPE', value: 'ubuntu-24.04'), // Хардкод для примера, можно брать из params
                      string(name: 'RELEASE_VERSION', value: params.RELEASE_VERSION)
                  ],
                  wait: false
        }
        failure {
            echo "💥 Сборка провалилась! Оркестратор не запускается, чтобы не тратить ресурсы."
        }
    }
}