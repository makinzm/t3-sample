#!/bin/bash

docker compose up -d

until curl -s http://localhost:3000/health &> /dev/null; do
  echo "Waiting for application..."
  sleep 2
done

export DATABASE_URL=postgres://postgres:your_password@localhost:5432/t3-sample
npx prisma db push


