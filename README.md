# 🛵 **Monitoramento Mottu**

## 👨‍💻 **INTEGRANTES**
- RM558763 • Eric Issamu de Lima Yoshida
- RM555010 • Gustavo Matias Teixeira
- RM557515 • Gustavo Monção

---
## 💬 **Explicação do Projeto**
Este projeto é uma API RESTful de monitoramento de motos, que utiliza Spring Boot e Gradle.
Com ela, é possível acompanhar em tempo real a localização das motos via UWB, além de consultar o estado de cada moto e a filial onde está registrada.\
\
Com o WebApp no Azure, tanto a aplicação quanto os dados ficam armazenados de forma segura e escalável na nuvem, garantindo alta disponibilidade, fácil manutenção e acesso centralizado de qualquer lugar.

---
## 💹 **Benefícios para o negócio**
- ✅ Localização rápida e precisa das motos
- ✅ Redução de erros e extravios
- ✅ Visão centralizada e em tempo real
- ✅ Agilidade no serviço
- ✅ Escalabilidade para múltiplas filiais

---
## 🏦 **Desenho de Arquitetura**
<img width="736" height="297" alt="image" src="https://github.com/user-attachments/assets/5a822860-463b-4114-bbcb-7534d6795394" />

---
## 🏗 **Plataforma e Linguagens**
- Azure
- Java
- SQL

---
## 🌐 **Criação Banco de Dados**
Para configurar o banco de dados na nuvem, utilizamos um script em PowerShell que automatiza a criação da estrutura.

📌 **Importante:** o script deve ser executado exclusivamente no PowerShell.

🔗 [Clique aqui para acessar o script](create-sql-server.ps1)

🚀 **Passo a passo:**

1. Abra o PowerShell em sua máquina.
2. Navegue até a pasta onde o script foi salvo.
3. Execute o comando:
```powershell
./create-sql-server.ps1
```
4. Aguarde a finalização da configuração.

Após concluído, o banco estará disponível no Grupo de Recursos `rg-sql-ping-mottu`.

❌ **Em caso de erro**
1. Não estar logado no Azure
```powershell
Erro: Please run 'az login' to setup account.
```
Antes de rodar o script, faça login com: `az login`

2. Nome de servidor já existente
```powershell
Erro: The server name ... is already in use.
```
O nome do servidor SQL precisa ser único globalmente no Azure.\
Basta alterar o nome no script e executar novamente.

---

