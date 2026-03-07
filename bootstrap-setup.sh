#!/bin/bash
# Claudinho Bootstrap Setup
# ──────────────────────────────────────
# Copies .github/ + detects tech stack + pre-fills copilot instructions
# Usage: ./bootstrap-setup.sh [path]

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Always capture source directory first
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_DIR="${1:-.}"
TARGET_DIR=$(cd "$TARGET_DIR" && pwd)

echo -e "${BLUE}Claudinho Bootstrap Setup${NC}"
echo "📁 $TARGET_DIR"
echo ""

# Step 1: Copy .github/ folder (or merge if exists)
if [ -d "$TARGET_DIR/.github" ]; then
  echo "→ Merging .github/ files..."
  # Copy all skills, agents, and config files (rsync with update only)
  cp -r "$SCRIPT_DIR/.github/skills" "$TARGET_DIR/.github/" 2>/dev/null || true
  cp -r "$SCRIPT_DIR/.github/agents" "$TARGET_DIR/.github/" 2>/dev/null || true
  cp "$SCRIPT_DIR/.github/COPILOT_INSTRUCTIONS_TEMPLATE.md" "$TARGET_DIR/.github/" 2>/dev/null || true
  echo -e "${GREEN}✓${NC} Merged"
else
  echo "→ Copying .github/ folder..."
  cp -r "$SCRIPT_DIR/.github" "$TARGET_DIR/"
  echo -e "${GREEN}✓${NC} Done"
fi

echo ""
echo "→ Detecting tech stack..."

# Step 2: Detect tech stack (simple checks only)
cd "$TARGET_DIR"
STACK=""

[ -f "package.json" ] && STACK="$STACK, Node.js"
[ -f "Gemfile" ] && STACK="$STACK, Ruby"
[ -f "requirements.txt" ] || [ -f "Pipfile" ] && STACK="$STACK, Python"
[ -f "go.mod" ] && STACK="$STACK, Go"
[ -f "Dockerfile" ] && STACK="$STACK, Docker"

STACK="${STACK#, }"
[ -z "$STACK" ] && STACK="(auto-detect in /setup-agent)"
echo -e "${GREEN}✓${NC} Found: $STACK"

echo ""
echo "→ Creating .github/copilot-instructions.md..."

# Step 3: Create instructions file
if [ ! -f ".github/copilot-instructions.md" ]; then
  cp ".github/COPILOT_INSTRUCTIONS_TEMPLATE.md" ".github/copilot-instructions.md"
  
  PROJECT_NAME=$(basename "$TARGET_DIR")
  DATE=$(date +'%Y-%m-%d')
  
  # Replace basic placeholders (simpler approach)
  sed -i '' "s/\[PROJECT NAME\]/$PROJECT_NAME/g" ".github/copilot-instructions.md"
  sed -i '' "s/\[DATE\]/$DATE/g" ".github/copilot-instructions.md"
  
  echo -e "${GREEN}✓${NC} Created"
else
  echo "✓ .github/copilot-instructions.md exists (keeping)"
fi

echo -e "${GREEN}Setup Complete!${NC}"
echo ""
echo "Copy & paste these commands:"
echo ""
echo "  cd /Users/giovannabottesi/StayFi/infrastructure"
echo ""
echo "  /setup-agent"
echo ""
echo "  git add .github/ && git commit -m 'Add Copilot context'"
echo ""
echo "Then use:"
echo "  @claudinho     → main dev agent"
echo "  @journal       → capture work & learnings"
echo "  @data-analysis → queries & trends"
echo "  @explain       → understand systems"
