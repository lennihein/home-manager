# Repository Guidelines

## Project Structure & Module Organization
- flake.nix: Flake entry defining Home Manager configs and inputs (`nixpkgs`, `nixpkgs-stable`, `home-manager`).
- common/: Shared modules auto-imported by `common/default.nix` (shell, packages, dotfiles, HM settings).
- configs/: Profile- or environment-specific modules (e.g., `dev.nix`, `debian.nix`, `wsl.nix`, `nixos.nix`).
- files/: Static config assets referenced by modules (e.g., starship/helix configs).

## Build, Test, and Development Commands
- Evaluate flake: `nix flake check`
  - Ensures modules evaluate against current inputs.
- Apply locally: `home-manager switch --flake .#debianwsl --refresh --no-write-lock-file`
  - `--no-write-lock-file` is used because this repo doesn’t track `flake.lock`.
- Apply from GitHub: `home-manager switch --flake github:lennihein/home-manager#debianwsl --refresh --no-write-lock-file`
- List/rollback generations: `home-manager generations`; `home-manager switch --rollback`

## Coding Style & Naming Conventions
- Nix style: small, focused modules returning attribute sets; one option per line.
- Indentation: 2 spaces preferred; keep changes minimal and consistent with nearby code.
- Filenames: lowercase with hyphens (e.g., `home-manager.nix`, `stateversion.nix`).
- Inputs: main channel on `nixos-unstable`; stable channel exposed as `pkgsStable` from `nixos-25.05`.
- Unfree packages: imported with `config.allowUnfree = true`.

## Testing Guidelines
- No unit tests; validate by evaluation and a dry apply:
  - `nix flake check`
  - `home-manager build --flake .#debianwsl` (build only) or `switch` to apply.
- Prefer incremental changes and verify on at least one profile (e.g., `debianwsl`).

## Commit & Pull Request Guidelines
- Commit style: concise, imperative subject (e.g., "remove X", "switch to Y", "disable Z").
- Scope: one logical change per commit; avoid unrelated refactors.
- PRs should include:
  - What changed and why (1–3 sentences).
  - Example command used to verify (e.g., `nix flake check`, `home-manager switch`).
  - Any risk/rollback notes (generations can be rolled back).

## Security & Configuration Tips
- This repo ignores `flake.lock`; inputs update on each run. Use `--no-write-lock-file` with remote flakes.
- Home Manager manual outputs are disabled to speed builds and reduce noise.
- For stability-sensitive packages, use `pkgsStable` (example: `configs/dev.nix` uses `pkgsStable.termius`).
