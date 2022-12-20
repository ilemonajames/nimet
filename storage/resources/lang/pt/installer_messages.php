<?php 

return [
    'title' => 'Instalador Laravel',
    'next' => 'Próxima Etapa',
    'back' => 'Anterior',
    'finish' => 'Instalar',
    'forms' => [
        'errorTitle' => 'Ocorreram os seguintes erros:',
    ],
    'welcome' => [
        'templateTitle' => 'Bem-vinda',
        'title' => 'Instalador Laravel',
        'message' => 'Assistente de instalação e configuração fácil.',
        'next' => 'Verifique os requisitos',
    ],
    'requirements' => [
        'templateTitle' => 'Etapa 1 | Requisitos do servidor',
        'title' => 'Requisitos do servidor',
        'next' => 'Verifique as permissões',
    ],
    'permissions' => [
        'templateTitle' => 'Etapa 2 | Permissões',
        'title' => 'Permissões',
        'next' => 'Configurar o Ambiente',
    ],
    'environment' => [
        'menu' => [
            'templateTitle' => 'Etapa 3 | Configurações de Ambiente',
            'title' => 'Configurações de Ambiente',
            'desc' => 'Selecione como deseja configurar o arquivo <code> .env </code> dos aplicativos.',
            'wizard-button' => 'Configuração do assistente de formulário',
            'classic-button' => 'Editor de Texto Clássico',
        ],
        'wizard' => [
            'templateTitle' => 'Etapa 3 | Configurações de ambiente | Assistente guiado',
            'title' => 'Assistente <code> .env </code> guiado',
            'tabs' => [
                'environment' => 'Meio Ambiente',
                'database' => 'Base de dados',
                'application' => 'Inscrição',
            ],
            'form' => [
                'name_required' => 'É necessário um nome de ambiente.',
                'app_name_label' => 'Nome do aplicativo',
                'app_name_placeholder' => 'Nome do aplicativo',
                'app_environment_label' => 'Ambiente de aplicativos',
                'app_environment_label_local' => 'Local',
                'app_environment_label_developement' => 'Desenvolvimento',
                'app_environment_label_qa' => 'Qa',
                'app_environment_label_production' => 'Produção',
                'app_environment_label_other' => 'De outros',
                'app_environment_placeholder_other' => 'Entre em seu ambiente ...',
                'app_debug_label' => 'App Debug',
                'app_debug_label_true' => 'Verdadeiro',
                'app_debug_label_false' => 'Falso',
                'app_log_level_label' => 'Nível de registro do aplicativo',
                'app_log_level_label_debug' => 'depurar',
                'app_log_level_label_info' => 'informação',
                'app_log_level_label_notice' => 'aviso prévio',
                'app_log_level_label_warning' => 'Atenção',
                'app_log_level_label_error' => 'erro',
                'app_log_level_label_critical' => 'crítico',
                'app_log_level_label_alert' => 'alerta',
                'app_log_level_label_emergency' => 'emergência',
                'app_url_label' => 'Url do aplicativo',
                'app_url_placeholder' => 'Url do aplicativo',
                'db_connection_failed' => 'Não pôde conectar com a base de dados.',
                'db_connection_label' => 'Conexão de banco de dados',
                'db_connection_label_mysql' => 'mysql',
                'db_connection_label_sqlite' => 'sqlite',
                'db_connection_label_pgsql' => 'pgsql',
                'db_connection_label_sqlsrv' => 'sqlsrv',
                'db_host_label' => 'Host de banco de dados',
                'db_host_placeholder' => 'Host de banco de dados',
                'db_port_label' => 'Porta de banco de dados',
                'db_port_placeholder' => 'Porta de banco de dados',
                'db_name_label' => 'Nome do banco de dados',
                'db_name_placeholder' => 'Nome do banco de dados',
                'db_username_label' => 'Nome de usuário do banco de dados',
                'db_username_placeholder' => 'Nome de usuário do banco de dados',
                'db_password_label' => 'Senha do banco de dados',
                'db_password_placeholder' => 'Senha do banco de dados',
                'app_tabs' => [
                    'more_info' => 'Mais informações',
                    'broadcasting_title' => '',
                    'broadcasting_label' => 'Driver de transmissão',
                    'broadcasting_placeholder' => 'Driver de transmissão',
                    'cache_label' => 'Driver de cache',
                    'cache_placeholder' => 'Driver de cache',
                    'session_label' => 'Driver de Sessão',
                    'session_placeholder' => 'Driver de Sessão',
                    'queue_label' => 'Driver de fila',
                    'queue_placeholder' => 'Driver de fila',
                    'redis_label' => 'Redis Driver',
                    'redis_host' => 'Redis Host',
                    'redis_password' => 'Senha redis',
                    'redis_port' => 'Redis Port',
                    'mail_label' => 'Enviar',
                    'mail_driver_label' => 'Mail Driver',
                    'mail_driver_placeholder' => 'Mail Driver',
                    'mail_host_label' => 'Mail Host',
                    'mail_host_placeholder' => 'Mail Host',
                    'mail_port_label' => 'Mail Port',
                    'mail_port_placeholder' => 'Mail Port',
                    'mail_username_label' => 'Nome de usuário do correio',
                    'mail_username_placeholder' => 'Nome de usuário do correio',
                    'mail_password_label' => 'Senha de correio',
                    'mail_password_placeholder' => 'Senha de correio',
                    'mail_encryption_label' => 'Criptografia de Correio',
                    'mail_encryption_placeholder' => 'Criptografia de Correio',
                    'pusher_label' => 'Empurrador',
                    'pusher_app_id_label' => 'Pusher App Id',
                    'pusher_app_id_palceholder' => 'Pusher App Id',
                    'pusher_app_key_label' => 'Pusher App Key',
                    'pusher_app_key_palceholder' => 'Pusher App Key',
                    'pusher_app_secret_label' => 'Pusher App Secret',
                    'pusher_app_secret_palceholder' => 'Pusher App Secret',
                ],
                'buttons' => [
                    'setup_database' => 'Banco de dados de configuração',
                    'setup_application' => 'Aplicativo de configuração',
                    'install' => 'Instalar',
                ],
            ],
        ],
        'classic' => [
            'templateTitle' => 'Etapa 3 | Configurações de ambiente | Editor Clássico',
            'title' => 'Editor de Ambiente Clássico',
            'save' => 'Salvar .env',
            'back' => 'Usar assistente de formulário',
            'install' => 'Salvar e instalar',
        ],
        'success' => 'As configurações do seu arquivo .env foram salvas.',
        'errors' => 'Não foi possível salvar o arquivo .env, crie-o manualmente.',
    ],
    'install' => 'Instalar',
    'installed' => [
        'success_log_message' => 'Instalador do Laravel INSTALADO com sucesso em',
    ],
    'final' => [
        'title' => 'Instalação Terminada',
        'templateTitle' => 'Instalação Terminada',
        'finished' => 'O aplicativo foi instalado com sucesso.',
        'migration' => '',
        'console' => 'Saída do console do aplicativo:',
        'log' => 'Entrada de registro de instalação:',
        'env' => 'Arquivo .env final:',
        'exit' => 'Clique aqui para sair',
    ],
    'updater' => [
        'title' => 'Laravel Updater',
        'welcome' => [
            'title' => 'Bem-vindo ao atualizador',
            'message' => 'Bem-vindo ao assistente de atualização.',
        ],
        'overview' => [
            'title' => 'visão global',
            'message' => 'Há 1 atualização. | Existem: atualizações de número.',
            'install_updates' => 'Instalar atualizações',
        ],
        'final' => [
            'title' => 'Acabado',
            'finished' => 'O banco de dados do aplicativo foi atualizado com sucesso.',
            'exit' => 'Clique aqui para sair',
        ],
        'log' => [
            'success_message' => 'Instalador do Laravel ATUALIZADO com sucesso em',
        ],
    ],
];