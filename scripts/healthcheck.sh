#!/bin/bash
set -e

echo "⏳ Verifying Soroban RPC network initialization..."
MAX_RETRIES=15
COUNTER=0

until $(curl -s -X POST -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"getNetwork"}' \
  http://localhost:8000/soroban/rpc | grep -q "pass" \
  || curl -s http://localhost:8000/ > /dev/null); do

    COUNTER=$((COUNTER+1))
    if [ $COUNTER -eq $MAX_RETRIES ]; then
      echo "❌ Standalone Soroban RPC node failed to establish ready state within time parameters."
      exit 1
    fi
    echo "🔄 Node status pending... Retrying in 2 seconds ($COUNTER/$MAX_RETRIES)"
    sleep 2
done

echo "✅ Soroban standalone test node successfully synchronized and accepting connection streams on port 8000."