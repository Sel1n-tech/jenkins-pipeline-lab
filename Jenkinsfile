// Подключаем нашу библиотеку. Имя 'os-build-lib' мы настроим в Jenkins на следующем шаге.
// Символ '_' означает "импортировать все функции из библиотеки в текущую область видимости"
@Library('os-build-lib') _

pipeline {
    agent any

    // ЭТОТ БЛОК СОЗДАЕТ "КНОПКИ" И ВЫПАДАЮЩИЕ СПИСКИ В UI JENKINS
    parameters {
        choice(
            name: 'OS_TYPE', 
            choices: ['ubuntu-24.04', 'alpine-3.18'], 
            description: 'Выберите дистрибутив для сборки'
        )
        choice(
            name: 'RELEASE_VERSION', 
            choices: ['1.0.0-beta', '1.0.0-rc', '1.0.0-stable'], 
            description: 'Выберите версию релиза'
        )
    }

    stages {
        stage('Custom OS Build') {
            steps {
                echo "👤 Сборку инициировал пользователь: ${env.BUILD_USER_ID ?: 'unknown'}"
                
                // Вызываем нашу функцию из Shared Library и передаем ей Map с параметрами из UI
                buildMiniOs([
                    osType: params.OS_TYPE,
                    releaseVersion: params.RELEASE_VERSION
                ])
            }
        }
    }
}