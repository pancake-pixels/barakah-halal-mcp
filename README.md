# Barakah Halal Stock Screen — MCP server

Ask your AI assistant whether a stock is halal, and get a dated answer.

A hosted [Model Context Protocol](https://modelcontextprotocol.io) server from
[Barakah Profits](https://barakahprofits.com/?utm_source=github&utm_medium=readme&utm_campaign=mcp).
It screens listed companies for Sharia compliance and, unlike most screeners, tells you
**when the verdict last changed** — from a [public, dated verdict ledger](https://app.barakahprofits.com/halal-verdict-changes?utm_source=github&utm_medium=readme&utm_campaign=mcp).

Nothing to install, no API key.

```
https://app.barakahprofits.com/mcp
```

## Tools

| Tool | What it does |
|---|---|
| `check_halal_stock` | Screens one ticker (e.g. `NVDA`, `CSL.AX`): business activity, interest-bearing debt and cash vs market cap, interest income vs revenue. Returns the verdict, each check with its ratio, and the verdict's change history. |
| `recent_halal_verdict_changes` | Stocks that recently cleared or broke the screen, with dates. |

Verdicts: **PASSES FINANCIAL SCREEN**, **NEEDS REVIEW**, **NOT HALAL**.

## Connect

**Claude (claude.ai / Claude Desktop)** — Settings → Connectors → Add custom connector →
paste `https://app.barakahprofits.com/mcp`.

**Claude Code**

```sh
claude mcp add --transport http barakah-halal https://app.barakahprofits.com/mcp
```

**Cursor** — `~/.cursor/mcp.json`

```json
{
  "mcpServers": {
    "barakah-halal": { "url": "https://app.barakahprofits.com/mcp" }
  }
}
```

**VS Code** — `.vscode/mcp.json`

```json
{
  "servers": {
    "barakah-halal": { "type": "http", "url": "https://app.barakahprofits.com/mcp" }
  }
}
```

Then ask: *"Is NVDA halal?"* or *"Which stocks changed halal status recently?"*

## Method

AAOIFI-style screen:

- **Business activity** — core business must not be interest-based finance, alcohol, tobacco,
  gambling, pork, adult content or weapons.
- **Interest-bearing debt** under 30% of market cap.
- **Cash and interest-bearing securities** under 30% of market cap.
- **Interest income** under 5% of revenue.

"Passes financial screen" is deliberately not "halal": revenue from minor non-compliant
business lines isn't itemised in filings data, so confirm the revenue mix before investing.
Because the debt and cash tests are measured against market cap, a company can cross the
line on share price alone — which is why the verdict history matters.

This is an automated estimate, not a fatwa, and not financial advice.

## More

Quality scores, fair-value ranges and alerts when a verdict changes are in
[Barakah Watch](https://barakahprofits.com/?utm_source=github&utm_medium=readme&utm_campaign=mcp).

Financial data provided by [Twelve Data](https://twelvedata.com).

© Pancake Pixels Pty Ltd
