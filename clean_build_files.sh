#!/bin/bash

# =============================================================================
# OCaml Piscine Build Files Cleanup Script
# =============================================================================
# This script removes all compiled files, executables, and build artifacts
# from d0x directories while preserving .ml and .mli source files.
# =============================================================================
# Usage:
# ./clean_build_files.sh [--dry-run] [--force]
#
# Options:
#   --dry-run: Show what would be deleted without actually deleting anything
#   --force:   Force deletion without confirmation
# =============================================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}==============================================================================${NC}"
echo -e "${BLUE}OCaml Piscine Build Files Cleanup${NC}"
echo -e "${BLUE}==============================================================================${NC}"
echo

# Function to count files before deletion
count_files() {
    local pattern="$1"
    local count=0
    
    # Count OCaml build artifacts
    count=$((count + $(find d*/ -name "*.cmo" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.cmx" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.cmi" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.o" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.a" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.cmxa" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.cmxs" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.cma" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.byte" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.native" 2>/dev/null | wc -l)))
    count=$((count + $(find d*/ -name "*.exe" 2>/dev/null | wc -l)))
    
    # Count executables (files without extension in ex* directories)
    count=$((count + $(find d*/ex*/ -type f -executable -not -name "*.ml" -not -name "*.mli" -not -name "*.sh" 2>/dev/null | wc -l)))
    
    # Count build directories
    count=$((count + $(find d*/ -type d -name "_build" 2>/dev/null | wc -l)))
    
    echo $count
}

# Function to delete build files
cleanup_build_files() {
    local deleted_count=0
    
    echo -e "${YELLOW}Cleaning OCaml build artifacts...${NC}"
    
    # Delete OCaml compiled files
    for ext in cmo cmx cmi o a cmxa cmxs cma byte native exe annot; do
        if find d*/ -name "*.$ext" -delete 2>/dev/null; then
            local count=$(find d*/ -name "*.$ext" 2>/dev/null | wc -l)
            if [ $count -eq 0 ]; then
                echo -e "  ${GREEN}✓${NC} Cleaned *.$ext files"
            fi
        fi
    done
    
    echo -e "${YELLOW}Cleaning executables...${NC}"
    
    # Delete executables in exercise directories (files without extension)
    for dir in d*/ex*/; do
        if [ -d "$dir" ]; then
            # Find and delete executable files (no extension, not .ml/.mli/.sh)
            find "$dir" -type f -executable -not -name "*.ml" -not -name "*.mli" -not -name "*.sh" -not -name ".*" -delete 2>/dev/null || true
        fi
    done
    echo -e "  ${GREEN}✓${NC} Cleaned executable files"
    
    echo -e "${YELLOW}Cleaning build directories...${NC}"
    
    # Delete build directories
    find d*/ -type d -name "_build" -exec rm -rf {} + 2>/dev/null || true
    echo -e "  ${GREEN}✓${NC} Cleaned _build directories"
    
    echo -e "${YELLOW}Cleaning temporary files...${NC}"
    
    # Delete temporary files
    for ext in tmp temp log out err; do
        find d*/ -name "*.$ext" -delete 2>/dev/null || true
    done
    
    # Delete backup files
    find d*/ -name "*~" -delete 2>/dev/null || true
    find d*/ -name ".*~" -delete 2>/dev/null || true
    
    echo -e "  ${GREEN}✓${NC} Cleaned temporary and backup files"
}

# Function to show what would be deleted (dry run)
dry_run() {
    echo -e "${YELLOW}DRY RUN - Files that would be deleted:${NC}"
    echo
    
    # Show OCaml build artifacts
    echo -e "${BLUE}OCaml build artifacts:${NC}"
    for ext in cmo cmx cmi o a cmxa cmxs cma byte native exe annot; do
        local files=$(find d*/ -name "*.$ext" 2>/dev/null)
        if [ -n "$files" ]; then
            echo "$files" | sed 's/^/  /'
        fi
    done
    
    # Show executables
    echo -e "${BLUE}Executable files:${NC}"
    for dir in d*/ex*/; do
        if [ -d "$dir" ]; then
            local executables=$(find "$dir" -type f -executable -not -name "*.ml" -not -name "*.mli" -not -name "*.sh" -not -name ".*" 2>/dev/null)
            if [ -n "$executables" ]; then
                echo "$executables" | sed 's/^/  /'
            fi
        fi
    done
    
    # Show build directories
    echo -e "${BLUE}Build directories:${NC}"
    local build_dirs=$(find d*/ -type d -name "_build" 2>/dev/null)
    if [ -n "$build_dirs" ]; then
        echo "$build_dirs" | sed 's/^/  /'
    fi
    
    # Show temporary files
    echo -e "${BLUE}Temporary files:${NC}"
    for ext in tmp temp log out err; do
        local files=$(find d*/ -name "*.$ext" 2>/dev/null)
        if [ -n "$files" ]; then
            echo "$files" | sed 's/^/  /'
        fi
    done
    
    local backup_files=$(find d*/ -name "*~" -o -name ".*~" 2>/dev/null)
    if [ -n "$backup_files" ]; then
        echo "$backup_files" | sed 's/^/  /'
    fi
    
    echo
}

# Main execution
cd "$SCRIPT_DIR"

# Check if any d0x directories exist
if ! ls d*/ >/dev/null 2>&1; then
    echo -e "${RED}No d0x directories found!${NC}"
    exit 1
fi

# Count files to be deleted
file_count=$(count_files)

if [ "$file_count" -eq 0 ]; then
    echo -e "${GREEN}No build files found to clean!${NC}"
    exit 0
fi

echo -e "${YELLOW}Found $file_count build files to clean${NC}"
echo

# Parse command line arguments
if [ "$1" = "--dry-run" ] || [ "$1" = "-n" ]; then
    dry_run
    echo -e "${BLUE}Run without --dry-run to actually delete these files${NC}"
    exit 0
elif [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
    echo -e "${YELLOW}Force mode: Cleaning without confirmation...${NC}"
    cleanup_build_files
else
    # Ask for confirmation
    echo -e "${YELLOW}This will delete all build files from d0x directories.${NC}"
    echo -e "${YELLOW}Source files (.ml and .mli) will be preserved.${NC}"
    echo
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cleanup_build_files
    else
        echo -e "${BLUE}Cleanup cancelled.${NC}"
        exit 0
    fi
fi

echo
echo -e "${GREEN}==============================================================================${NC}"
echo -e "${GREEN}Cleanup completed successfully!${NC}"
echo -e "${GREEN}All build files have been removed from d0x directories.${NC}"
echo -e "${GREEN}Your .ml and .mli source files are preserved.${NC}"
echo -e "${GREEN}==============================================================================${NC}" 