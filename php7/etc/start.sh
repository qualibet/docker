#!/bin/bash
rm -rf /var/www/html/qualibet/portal-frontend/node_modules
cd /var/www/html/qualibet/portal-frontend && npm install && npm run dev

