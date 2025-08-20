# Use uma imagem base da Microsoft que já tem as dependências do Playwright e navegadores
FROM mcr.microsoft.com/playwright:v1.39.0-jammy

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar o arquivo de requisitos para que ele seja instalado primeiro
COPY requirements.txt ./

# Instalar as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do seu código
COPY . .

# Expor a porta que o Streamlit usa por padrão (8501)
EXPOSE 8501

# Comando para iniciar a aplicação Streamlit
CMD ["streamlit", "run", "app.py"]