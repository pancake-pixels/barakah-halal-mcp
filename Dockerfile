# The server is hosted at https://app.barakahprofits.com/mcp (streamable HTTP, no API key).
# This image only bridges it to stdio so local MCP clients and directory checkers can talk to it.
FROM node:22-alpine
CMD ["npx", "-y", "mcp-remote", "https://app.barakahprofits.com/mcp"]
