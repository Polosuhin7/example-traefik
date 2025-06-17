#!/bin/bash

COMPOSE_FILE="docker-compose.yml"

if [ ! -f "$COMPOSE_FILE" ]; then
  echo "❌ $COMPOSE_FILE not found in current directory."
  exit 1
fi

echo "🛠  Docker Compose domain/email configurator"

# Prompt for domain
read -p "🌐 Enter your main domain (e.g. example.com): " DOMAIN
if [ -z "$DOMAIN" ]; then
  echo "❌ Domain cannot be empty"
  exit 1
fi

# Prompt for email
read -p "📧 Enter your email for Let's Encrypt: " EMAIL
if [ -z "$EMAIL" ]; then
  echo "❌ Email cannot be empty"
  exit 1
fi

# Detect OS and assign correct sed command
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED=(sed -i '')
else
  SED=(sed -i)
fi

# Replace values safely
echo "🔧 Updating $COMPOSE_FILE..."

"${SED[@]}" "s/admin@example.com/${EMAIL}/g" "$COMPOSE_FILE"
"${SED[@]}" "s/portainer\.example\.com/portainer.${DOMAIN}/g" "$COMPOSE_FILE"
"${SED[@]}" "s/example\.com/${DOMAIN}/g" "$COMPOSE_FILE"

echo "✅ Updated docker-compose.yml with:"
echo "   - DOMAIN: $DOMAIN"
echo "   - EMAIL:  $EMAIL"
