# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Fetcher is a monorepo containing a modern HTTP client library ecosystem built on the native Fetch API. It provides an Axios-like experience with powerful features including interceptors, timeout control, and native LLM streaming API support.

## Tech Stack

- **Package Manager**: pnpm (workspace-based monorepo)
- **Build Tool**: Vite
- **Testing**: Vitest with coverage
- **Language**: TypeScript (strict mode)
- **Linting**: ESLint with Prettier

## Commands

```bash
# Install dependencies
pnpm install

# Build all packages
pnpm build

# Run all tests
pnpm test

# Run unit tests only (packages/*)
pnpm test:unit

# Run integration tests
pnpm test:it

# Lint all packages
pnpm lint

# Format code
pnpm format

# Clean build artifacts
pnpm clean

# Run Storybook
pnpm storybook

# Build Storybook docs
pnpm build-storybook

# Update all package versions
pnpm update-version <new-version>
```

## Package Architecture

The ecosystem is built on the core `fetcher` package with modular extensions:

### Core
- **`packages/fetcher`** - Ultra-lightweight (3KB) HTTP client with interceptors, timeout, path/query parameters

### Extensions
- **`packages/decorator`** - TypeScript decorators for declarative API service definitions
- **`packages/eventstream`** - Server-Sent Events (SSE) support for real-time streaming and LLM APIs
- **`packages/eventbus`** - Event bus with serial/parallel execution and cross-tab broadcasting
- **`packages/openai`** - Type-safe OpenAI API client with streaming support
- **`packages/storage`** - Cross-environment storage (localStorage/sessionStorage/in-memory)
- **`packages/react`** - React hooks for data fetching and state management

### Framework Integrations
- **`packages/wow`** - First-class support for Wow CQRS/DDD framework (commands, queries, aggregates)
- **`packages/cosec`** - Enterprise security with CoSec authentication and token management

### Code Generation
- **`packages/generator`** - OpenAPI 3.0+ code generator that produces type-safe TypeScript clients, with specialized support for Wow CQRS patterns
- **`packages/openapi`** - Complete TypeScript type definitions for OpenAPI 3.0+ specifications

### UI Components
- **`packages/viewer`** - Table, filter, and view components for data display

## Dependency Management

Shared dependencies are managed via `pnpm-workspace.yaml` catalog entries. When adding dependencies, use `catalog:` instead of version numbers to ensure consistency across the monorepo.

## Testing

Tests use Vitest with coverage enabled. Each package has its own `test/` directory. Run `pnpm test:unit` to run only package tests (excluding integration tests).