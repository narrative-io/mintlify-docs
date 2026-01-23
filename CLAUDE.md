# Mintlify documentation

## Working relationship
- You can push back on ideas-this can lead to better documentation. Cite sources and explain your reasoning when you do so
- ALWAYS ask for clarification rather than making assumptions
- NEVER lie, guess, or make up information

## Project context
- Format: MDX files with YAML frontmatter
- Config: docs.json for navigation, theme, settings
- Components: Mintlify components

## Content strategy
- Document just enough for user success - not too much, not too little
- Prioritize accuracy and usability of information
- Make content evergreen when possible
- Search for existing information before adding new content. Avoid duplication unless it is done for a strategic reason
- Check existing patterns for consistency
- Start by making the smallest reasonable changes

## Information architecture principles

### The four documentation types (Diátaxis framework)
Keep these four types of documentation separate and distinct. Each serves a different purpose and requires a different writing approach:

1. **Tutorials** (Getting Started tab)
   - Learning-oriented, for newcomers
   - Goal: Build confidence through hands-on experience
   - Write as a lesson that takes the reader through a complete experience
   - Don't explain concepts in depth—link to Concepts instead
   - Must be tested end-to-end and work reliably

2. **How-to Guides** (Guides tab)
   - Task-oriented, for practitioners
   - Goal: Help someone accomplish a specific task
   - Assume the reader has basic knowledge
   - Start with a clear problem and end with a solution
   - Keep focused—don't explain why, link to Concepts instead

3. **Explanation** (Concepts tab)
   - Understanding-oriented, for deeper learning
   - Goal: Help the reader understand why things work the way they do
   - Discuss alternatives, history, and design decisions
   - Connect ideas and provide context
   - Don't include step-by-step instructions—link to Guides instead

4. **Reference** (Reference + API Reference tabs)
   - Information-oriented, for looking things up
   - Goal: Describe the system accurately and completely
   - Structure should mirror the codebase/system
   - Be consistent in format, tone, and structure
   - Don't explain concepts or provide tutorials—link elsewhere

### Cookbooks
- Solution-oriented, bridging guides and reference
- Complete, working examples for real-world use cases
- Include all necessary code and context
- Explain what the recipe accomplishes upfront

### Cross-linking rules
- Tutorials → link to Concepts for deeper understanding
- Guides → link to Concepts for why, Reference for specifics
- Concepts → link to Guides for how-to, Reference for details
- Reference → link to Guides for usage examples
- Cookbooks → link to all relevant Guides, Concepts, and Reference pages

### Content principles
- Use layered content architecture: business context → technical details
- Developers love code examples—include them liberally
- Maintain a glossary for domain-specific terminology
- Use consistent terminology throughout all documentation
- Three-column layout works well for reference documentation

### Glossary maintenance
When creating or editing any article:
1. **Review the glossary first** - Read `/reference/glossary.mdx` to understand existing terminology
2. **Use existing terms** - When a glossary term applies, use that exact term consistently
3. **Add new terms** - If introducing domain-specific terminology not in the glossary, add a definition
4. **Update existing terms** - If an article reveals that a definition is incomplete or outdated, update it
5. **Link to glossary** - Consider linking to glossary entries when terms are first introduced in an article

## Frontmatter requirements for pages
- title: Clear, descriptive page title
- description: Concise summary for SEO/navigation

## Writing standards
- Second-person voice ("you")
- Prerequisites at start of procedural content
- Test all code examples before publishing
- Match style and formatting of existing pages
- Include both basic and advanced use cases
- Language tags on all code blocks
- Alt text on all images
- Relative paths for internal links

## NQL guidelines
- NEVER use wildcards (*) in NQL queries—always specify explicit column names
- All NQL code examples must use fully qualified column names

## Git workflow
- NEVER use --no-verify when committing
- Ask how to handle uncommitted changes before starting
- Create a new branch when no clear branch exists for changes
- Commit frequently throughout development
- NEVER skip or disable pre-commit hooks

## Do not
- Skip frontmatter on any MDX file
- Use absolute URLs for internal links
- Include untested code examples
- Make assumptions - always ask for clarification
- Mix documentation types (e.g., don't put tutorials in reference pages)
- Duplicate explanations across pages—link instead
- Write reference docs that try to teach concepts
- Write tutorials that assume prior knowledge of the system