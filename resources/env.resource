*** Settings ***
Documentation        Arquivo de ambiente

*** Variables ***
# URL das aplicações
${BASE_URL}        http://localhost:3000
${BASE_API}        http://localhost:3333

# RabbitMQ
&{HEADERS}         Authorization=Basic bWJqem5qd2Y6Q1IwLWpIRlpSODBWZ2JBcDUxUmNyWjFSN3JWRDdKZXE=

${AMQP_URL}        https://woodpecker.rmq.cloudamqp.com/api/queues/mbjznjwf
${AMQP_HOST}       mbjznjwf
${AMQP_QUEUE}      tasks