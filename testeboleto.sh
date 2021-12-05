#!/usr/bin/bash

echo '[{"valor":5.0,"cedente":"Kivanio Barbosa","documento_cedente":"12345678912","sacado":"Claudio Pozzebom",
"sacado_documento":"12345678900","agencia":"0810","conta_corrente":"53678","convenio":12387,"nosso_numero":"12345678","bank":"ailos"},
{"valor": 10.00,"cedente": "PREFEITURA MUNICIPAL DE VILHENA","documento_cedente": "04092706000181","sacado": "João Paulo Barbosa",
"sacado_documento": "77777777777","agencia": "1825","conta_corrente": "0000528","convenio": "245274","nosso_numero": "000000000000001","bank":"caixa"}]'\
> /tmp/boletos_data.json
curl -X POST -F type=pdf -F 'data=@/tmp/boletos_data.json' localhost:9292/api/boleto/multi > /tmp/boletos.pdf
evince /tmp/boletos.pdf