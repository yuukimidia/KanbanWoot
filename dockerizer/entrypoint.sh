#!/bin/sh

# Caminho corrigido (sem o underline final que tinha no original)
ENV_FILE="/usr/share/nginx/html/.env.js"

echo "Gerando arquivo de variáveis de ambiente: $ENV_FILE"

# Cria o arquivo .env.js com base nas variáveis do ambiente do container
cat <<EOF > "$ENV_FILE"
window._env_ = {
  REACT_APP_CHATWOOT_URL: "${REACT_APP_CHATWOOT_URL}",
  REACT_APP_CHATWOOT_TOKEN: "${REACT_APP_CHATWOOT_TOKEN}",
  REACT_APP_CHATWOOT_ACCOUNT_ID: "${REACT_APP_CHATWOOT_ACCOUNT_ID}",
  REACT_APP_DEBUG: "${REACT_APP_DEBUG}"
};
EOF

echo "Arquivo .env.js gerado com sucesso."

# Inicia o Nginx
exec nginx -g "daemon off;"
