---
title: DevelopmentSeed Theme Demo
info: |
  ## DevelopmentSeed Slidev Theme
  A custom theme showcasing DevelopmentSeed's brand colors and layouts.
class: text-center
highlighter: shiki
drawings:
  persist: false
  enable: false
transition: slide-left
mdc: true

theme: './theme'
layout: title
image: /images/theme/lena-delta.jpg
---

<LogoHorPos position="top-left" height="24px" />

# A [Slidev](https://sli.dev/) deck for DevelopmentSeed


::subtitle::
This is the `title` layout


<DecorativeRectangle
  v-if="!noRectangle"
  width="50%"
  height="40%"
  zIndex=20
  :position="{
    bottom: '2%',
    right: '2%',
  }"
  :customStyle="{ mixBlendMode: 'multiply' }"
/>

---
layout: image-left
class: image-narrow
image: /images/theme/iceberg-scoresby-sund.jpg
---

<LogoHorNegMono position="bottom-left" height="24px" />

# Brand Colors

The DevelopmentSeed theme includes our complete color palette:

<div class="grid grid-cols-2 gap-4 mt-8">
  <div class="bg-primary p-4 rounded text-center">
    <strong>Primary</strong>
    <br/>
    #CF3F02
  </div>
  <div class="bg-secondary p-4 rounded text-center">
    <strong>Secondary</strong><br/>#E2C044
  </div>
  <div class="bg-success p-4 rounded text-center text-white">
    <strong>Success</strong><br/>#4DA167
  </div>
  <div class="bg-info p-4 rounded text-center text-white">
    <strong>Info</strong><br/>#2E86AB
  </div>
  <div class="bg-warning p-4 rounded text-center">
    <strong>Warning</strong><br/>#E2C044
  </div>
  <div class="bg-danger p-4 rounded text-center text-white">
    <strong>Danger</strong><br/>#A71D31
  </div>
</div>

---
layout: image-right
class: image-narrow
image: /images/theme/lena-delta.jpg
---

# Text-Image Layout

This layout follows DevelopmentSeed's common pattern:

- **Left side**: Content and messaging
- **Right side**: Rich, impactful imagery

However, on this slide we also set `reverse: true` to place the image on the right.

<LogoHorNegMono position="bottom-right" height="24px" />


---
layout: image-left
class: image-narrow
image: /images/theme/Utah_s_Great_Salt_Lake-1-scaled.jpg
---

<DecorativeRectangle
  width="35%"
  height="60%"
  :position="{
    top: '10px',
    left: '10px',
  }"
  zIndex="1"
  :customStyle="{ mixBlendMode: 'difference' }"
/>


<LogoHorNegMono position="top-left" height="24px" />

# Typography
## This is a Heading 2
### This is a Heading 3
#### This is a Heading 4

Headers use **Roboto Condensed** while body text uses **Roboto**.

Body text is set in Roboto for optimal readability. Links are styled with the primary color and have smooth hover transitions.

Code blocks use **Roboto Mono**:

```typescript
function greet(name: string): string {
  return `Hello, ${name}!`;
}
```

Inline code like `const x = 10;` also uses Roboto Mono.


---
layout: default
---

<DecorativeRectangle
  width="30%"
  height="90%"
  :position="{
    bottom: '2%',
    right: '5%',
  }"
/>

# Code Examples

The theme supports beautiful code highlighting with **Roboto Mono**:

```python {all|3|4|5-9|all}
def calculate_metrics(data):
    """Calculate key performance metrics."""
    total = sum(data)
    average = total / len(data)
    return {
        'total': total,
        'average': average,
        'count': len(data)
    }

result = calculate_metrics([10, 20, 30, 40, 50])
print(f"Average: {result['average']}")
```

```javascript
const processData = async (items) => {
  const results = await Promise.all(
    items.map(item => fetchData(item))
  );
  return results.filter(r => r.success);
};
```

---
layout: cover
background: /images/theme/Tanezrouft_Basin.jpg
---

````md magic-move
```js
console.log(`Step ${1}`)
```
```js
console.log(`Step ${1 + 1}`)
```
```ts
console.log(`Step ${3}` as string)
```
````

---
layout: cover
background: '/images/theme/Tanezrouft_Basin.jpg'
---

#### Demo

```ts {monaco-run} {autorun:true}
/**
 * Fetch Collection IDs for a given tenant
 */
async function fetchTenantCollectionIds(tenant?: string) {
  let endpoint = '/collections'
  if (tenant) {
    endpoint = `${tenant}/collections`;
  }
  const response = await fetch(`https://test.openveda.cloud/api/stac/${endpoint}`);
  const data = await response.json();
  return data['collections'].map((c: { 'id': string }) => c.id);
}

const tenant = 'earth-tenant';
const tenantCollectionIds = await fetchTenantCollectionIds(tenant);
for (const id of tenantCollectionIds) {
  console.log(` - ${id}`);
}
```

---
layout: default
---

# Lists and Content

The theme styles all standard Markdown elements:

**Unordered Lists:**
- First item
- Second item
  - Nested item
  - Another nested item
- Third item

**Ordered Lists:**
1. Step one
2. Step two
3. Step three

> Blockquotes are styled with the primary color accent and use a subtle italic font.

---
layout: default
---

# Ready to Use!

The DevelopmentSeed theme is ready for your presentations.

## Next Steps

1. Add your logo to `/public/logo.png`
2. Update `slides.md` frontmatter to use `theme: ./theme`
3. Start creating your presentation
4. Use the `text-image` layout for your content

**Available Layouts:**
- `default` - Standard content layout
- `cover` - Title slides with gradient background
- `text-image` - Text on left, image on right
