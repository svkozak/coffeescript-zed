## CoffeeScript for Zed

A lightweight Zed extension that adds CoffeeScript support:

- Syntax highlighting via a Tree‑sitter CoffeeScript grammar
- LSP features (completion, hover, diagnostics, etc.) via CoffeeSense

### Requirements

- Zed editor
- Node.js and npm (for running the CoffeeSense language server via `npx`)
- Rust toolchain (only needed when you build the extension locally)

### Language Server (CoffeeSense)

This extension runs CoffeeSense through `npx` so contributors don’t need a global install.

Configured in `extension.toml`:

```toml
[language_servers.coffeesense]
name = "CoffeeSense"
languages = ["CoffeeScript"]
command = "npx"
args = ["-y", "coffeesense-language-server@latest", "--stdio"]
```

#### Notes:

- `-y` accepts prompts; first run may download the package.
- You can pin a version for stability, e.g. `"coffeesense-language-server@1.x"`.
- If `npx` is not on Zed’s PATH, set `command = "/usr/bin/env"` and `args = ["npx", ...]`.

### Grammar

The grammar is defined in `extension.toml` under `[grammars.coffeescript]`.
It requires a Tree-sitter CoffeeScript grammar repository [`tree-sitter-coffeescript`](https://github.com/svkozak/tree-sitter-coffeescript).

To have syntax highlighting and parsing work you need to clone the grammar locally or point to a public repo. Currently it points to a local checkout path.

Clone the Tree-sitter CoffeeScript grammar and set the local path in `extension.toml`:

```toml
[grammars.coffeescript]
repository = "file:///path/to/your/tree-sitter-coffeescript"
rev = "[latest commit hash]"
```

After public release this will be updated to use a public repo URL pinned `rev`, for example:

```toml
[grammars.coffeescript]
repository = "<git URL to your tree-sitter-coffeescript>"
rev = "<pinned commit>"
```

### Developing / Installing Locally

- Open Zed and use the command palette: “Extensions: Install Dev Extension”. Choose `coffeescript-zed` folder and Zed will build and load the extension from source.
- Or build manually with Rust (Zed will still handle loading the built artifact when installing the dev extension):
  - `cargo build --release`

### Troubleshooting

- CoffeeSense doesn’t start: ensure `npx` is on PATH for Zed. Try setting `command = "/usr/bin/env"` and `args = ["npx", ...]` as noted above.
- First-run is slow: `npx` may download CoffeeSense on first use; subsequent runs are cached.
- Grammar not loading on another machine: point `[grammars.coffeescript]` to a public repo/commit, or vendor the precompiled `coffeescript.wasm` as described.

### More Information

Zed extension development docs: [https://zed.dev/docs/extensions/developing-extensions](https://zed.dev/docs/extensions/developing-extensions)
