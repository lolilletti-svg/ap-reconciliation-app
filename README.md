# AP Statement Reconciliation Tool

A browser-based tool that automates the reconciliation of vendor statements against internal billing systems — built with the Claude API.

## What it does

Manual AP reconciliation means opening multiple Excel tabs, running VLOOKUPs that break, converting PDFs by hand, and chasing invoices with mismatched numbers across systems. This tool replaces that process.

Upload a vendor statement (PDF or Excel), your Bills export, and optionally a NetSuite Open Items file — the app parses, matches, and exports a reconciled Excel in seconds.

## Features

- **PDF + Excel parsing** via Claude API — extracts all invoice line items automatically
- **Multi-location support** — upload multiple statements for the same vendor across locations
- **Bills cross-reference** — matches every invoice against your AllBillsPage export (Paid / Unpaid / Not Found)
- **Vendor credits** — upload a credits file, filter by vendor, and the app matches credits to invoices
- **NS Open Items** — optional cross-reference with NetSuite's AllOpenItemsDetail A/P export, adds a third tab to the output
- **Excel export** — 2–3 tab output: Statement, Bills Reference, NS Open Items (if uploaded)
- **Auto vendor matching** — detects vendor name from the statement and auto-selects it across all selectors

## How to use

1. Open `reconciliation-app.html` in your browser (run from a local server — see below)
2. Set your Anthropic API key (top right corner — stored in localStorage, never sent anywhere)
3. Upload your files:
   - **Vendor Statement** — PDF or Excel (supports multiple files for multi-location vendors)
   - **Bills** — AllBillsPage Excel export
   - **Vendor Credits** *(optional)* — Excel or CSV with credits; select the vendor before running
4. Optionally upload **NS Open Items** and select the vendor
5. Click **Run Reconciliation**
6. Review the preview and download the Excel

### Running locally

Chrome blocks external API calls from `file://`. Run a local server instead:

```bash
python3 -m http.server 8080
```

Then open `http://localhost:8080/reconciliation-app.html`.

## Tech stack

- Vanilla HTML/CSS/JavaScript — no framework, no build step, single file
- [Claude API](https://www.anthropic.com) (claude-haiku-4-5) — parses vendor statements
- [SheetJS](https://sheetjs.com) — reads and writes Excel files in the browser

## Requirements

- An [Anthropic API key](https://console.anthropic.com) with available credits
- A modern browser (Chrome via local server, or Firefox directly)

## Background

Built to solve a real problem in AP/P2P operations: vendor statement reconciliation is one of the most manual, error-prone tasks in the close process. This tool was the first in a series of automation projects documenting what's possible when finance ops people build their own tools.
