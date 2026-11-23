AGENTS.md

Project overview

This repository contains the SushiUI Extended device configuration for the Motorola Moto G84 5G (codename: "bangkk").

The project uses Makefiles and shell scripts for device configuration and builds.

Read "README.md" and "envsetup.sh" before modifying build behavior.

Development rules

- Keep changes focused on the Motorola Moto G84 5G ("bangkk").
- Preserve existing project structure and naming conventions.
- Follow existing Bash and Makefile conventions.
- Quote shell variables and avoid unsafe command execution.
- Do not commit generated build artifacts or temporary files.
- Never expose credentials, signing keys or tokens.
- Preserve copyright notices.

Device configuration

- Device: Motorola Moto G84 5G
- Codename: "bangkk"
- Vendor: "motorola"
- SoC: Qualcomm SM6375

Never guess hardware specifications, partition layouts, kernel settings or firmware versions.

Verify existing configurations before modifying device-specific values.

Build instructions

Initialize the environment:

. ./envsetup.sh

Build:

smake

Additional options:

smake MAINTAINER=name
smake OFFICIAL=1 MAINTAINER=name

"MAINTAINER" defaults to "whoami".

"OFFICIAL" defaults to "0".

Validation

- Run "bash -n" on modified Bash scripts.
- Check Makefile syntax when applicable.
- Review changes before committing.
- Run the documented build when the environment is available.
- Never claim tests passed without actually running them.

Android development safety

- Never flash firmware without explicit authorization.
- Avoid destructive partition operations.
- Do not modify bootloader configurations unnecessarily.
- Preserve device compatibility.
- Be careful with proprietary blobs and vendor components.

Workflow

1. Inspect relevant files before editing.
2. Understand dependencies and existing behavior.
3. Make minimal, focused changes.
4. Validate modifications.
5. Review the final diff.
6. Explain what changed and what was tested.

Final instructions

Prioritize stability, compatibility, maintainability and reproducible builds.

Do not introduce unrelated changes.
