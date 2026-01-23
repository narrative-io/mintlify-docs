# Mintlify Release Notes Generator

## Purpose
Generate product release notes formatted for Mintlify's changelog system using `<Update>` components.

## Output Format

Each release entry uses this structure:

```mdx
<Update label="[Date/Version Label]" description="[Version Number]" tags={["Tag1", "Tag2"]}>
  [Release content in markdown - features, fixes, improvements]
</Update>
```

### Component Properties

| Property | Required | Description |
|----------|----------|-------------|
| `label` | Yes | Primary identifier shown in table of contents (e.g., "January 2026", "Week of Jan 20") |
| `description` | No | Secondary text, typically version number (e.g., "v2.4.0") |
| `tags` | No | Array of strings for filtering (e.g., `["API", "Dashboard", "Bug Fix"]`) |
| `rss` | No | Alternative text description for RSS subscribers when content includes components/code |

## Writing Guidelines

### Structure
- Lead with the most impactful change
- Group related changes under descriptive subheadings (##, ###)
- Use prose paragraphs rather than bullet lists when possible
- Include links to relevant documentation where helpful

### Content Categories
Organize updates by type when multiple changes exist:
- **New Features** - Net-new capabilities
- **Improvements** - Enhancements to existing features
- **Bug Fixes** - Resolved issues
- **Breaking Changes** - Changes requiring user action
- **Deprecations** - Features being phased out

### Tone
- Active voice ("Added support for..." not "Support was added for...")
- User-focused benefits ("You can now..." or describe what it enables)
- Concise but complete - provide enough context to understand the change

## Tag Strategy

Use consistent tags across releases for effective filtering:
- **Product area tags**: "API", "Dashboard", "CLI", "Integrations"
- **Change type tags**: "New Feature", "Improvement", "Bug Fix", "Breaking Change"
- **Audience tags**: "Enterprise", "Developers", "All Users"

## Examples

### Single Feature Release
```mdx
<Update label="January 23, 2026" description="v2.4.0" tags={["API", "New Feature"]}>
  ## Batch Processing API

  You can now process up to 1,000 records in a single API call with the new batch endpoint. This reduces overhead for high-volume integrations and improves throughput by approximately 10x compared to sequential calls.

  Configure batch size and error handling behavior through the new `batch_config` parameter. See the [Batch Processing Guide](/api/batch) for implementation details.
</Update>
```

### Multi-Item Release
```mdx
<Update label="January 2026" description="v2.4.0" tags={["API", "Dashboard", "Bug Fix"]}>
  ## New Features

  ### Dataset Statistics Dashboard
  The Datasets view now displays row counts, schema information, and freshness indicators directly in the UI. Click any dataset to see detailed statistics including column distributions and sample values.

  ### Improved Query Builder
  The NQL query builder now supports autocomplete for attribute names and provides real-time syntax validation as you type.

  ## Bug Fixes

  Resolved an issue where large file uploads would timeout after 30 seconds. Uploads now support files up to 5GB with automatic retry on network interruption.

  Fixed incorrect timezone handling in scheduled job displays for users outside UTC.
</Update>
```

### Release with RSS Alternative Text
```mdx
<Update label="January 2026" description="v2.4.0" tags={["Dashboard"]} rss="New interactive data visualization component for exploring dataset relationships.">
  ## Visual Data Explorer

  <DataExplorerDemo />

  Explore relationships between datasets with our new interactive visualization. Drag nodes to rearrange, click connections to see mapping details, and export views as PNG or SVG.
</Update>
```

## Page Setup

For a new changelog page, use this frontmatter:

```mdx
---
title: "Release Notes"
description: "Product updates and announcements"
rss: true
---
```

The `rss: true` flag displays an RSS icon linking to `[page-url]/rss.xml` for subscribers.

## Documentation Handoff

When a release includes changes that require expanded documentation beyond what fits in a release note, hand off to **kb-writer** for full documentation.

### When to Hand Off

- **New features** that need conceptual explanations, tutorials, or reference pages
- **API changes** requiring updated endpoint documentation or new examples
- **Configuration options** that need detailed parameter documentation
- **Breaking changes** that require migration guides
- **New integrations** needing setup guides or troubleshooting sections

### Handoff Format

After generating release notes, identify documentation needs and create a handoff request:

```
## Documentation Handoff for kb-writer

**Release:** [version/date]

**Items requiring documentation:**

1. **[Feature/Change Name]**
   - Type: [New page | Update existing | Migration guide]
   - Location: [Suggested path, e.g., /features/batch-processing]
   - Summary: [What needs to be documented]
   - Release note reference: [Link to the relevant Update entry]

2. **[Next item...]**
```

### Release Note + Doc Link Pattern

When documentation will be created, include a placeholder link in the release note:

```mdx
<Update label="January 2026" description="v2.4.0" tags={["API", "New Feature"]}>
  ## Batch Processing API

  Process up to 1,000 records in a single API call. See the [Batch Processing Guide](/api/batch) for implementation details.
</Update>
```

The kb-writer should then create the page at that path, ensuring the link works when both the release note and documentation ship together.

## Input Requirements

When requesting release notes, provide:
1. **Changes** - What was added, modified, or fixed
2. **Version** (optional) - Version number if applicable
3. **Date/Label** - How to identify this release
4. **Tags** (optional) - Relevant categories for filtering
5. **Audience context** - Who uses this product (helps with tone/detail level)
6. **Documentation needs** (optional) - Flag items that need full docs for kb-writer handoff