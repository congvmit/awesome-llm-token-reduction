#!/usr/bin/env bash
# Verify every Markdown link in a file resolves (HTTP 2xx/3xx).
# Usage: bash check-links.sh README.md
# Exit code 0 = all links OK, 1 = one or more broken links or bad usage.
set -euo pipefail

FILE="${1:-README.md}"

if [[ ! -f "$FILE" ]]; then
  echo "error: file not found: $FILE" >&2
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "error: curl is required" >&2
  exit 1
fi

# Extract http(s) URLs from Markdown links: [text](URL)
urls=$(grep -oE '\]\(https?://[^) ]+\)' "$FILE" | sed -E 's/^\]\(//; s/\)$//' | sort -u)

if [[ -z "$urls" ]]; then
  echo "No http(s) links found in $FILE"
  exit 0
fi

fail=0
while IFS= read -r url; do
  [[ -z "$url" ]] && continue
  code=$(curl -sL -o /dev/null -w '%{http_code}' --max-time 20 -A 'awesome-list-curator/1.0' "$url" || echo "000")
  if [[ "$code" =~ ^2|^3 ]]; then
    printf 'OK   %s  %s\n' "$code" "$url"
  else
    printf 'FAIL %s  %s\n' "$code" "$url"
    fail=1
  fi
done <<< "$urls"

if [[ "$fail" -ne 0 ]]; then
  echo "One or more links failed." >&2
  exit 1
fi
echo "All links OK."
