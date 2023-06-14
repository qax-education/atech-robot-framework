*** Settings ***
Documentation            Validação das mensagens que são enviadas para a fila do RabbitMQ

Resource       env.resource

Library        RequestsLibrary


*** Keywords ***
Get amqp message    
    ${payload}        Create Dictionary
    ...    vhost=${AMQP_HOST}
    ...    name=${AMQP_QUEUE}
    ...    truncate=50000
    ...    ackmode=ack_requeue_true
    ...    encoding=auto
    ...    count=1

    ${response}    POST    ${AMQP_URL}/tasks/get
    ...    json=${payload}
    ...    headers=${HEADERS}
    ...    expected_status=200
    
    ${result}    Set Variable       ${response.json()}[0]

    [return]       ${result} 

Purge amqp queue
    ${payload}        Create Dictionary
    ...    vhost=${AMQP_HOST}
    ...    name=${AMQP_QUEUE}
    ...    mode=purge

    DELETE        ${AMQP_URL}/tasks/contents
    ...    json=${payload}
    ...    headers=${HEADERS}
    ...    expected_status=204