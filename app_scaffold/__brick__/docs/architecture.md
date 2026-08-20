# Clean Architecture Blueprint

## Feature Structure (`lib/features/`)
Each feature folder follows standard clean architecture:
- `data/` (datasources, models, repositories implementations)
- `domain/` (entities, enums, inputs, usecases, repository interfaces)
- `presentation/` (controllers/cubits/blocs, pages, widgets)


## Core Scaffolding (`lib/core/`)
- `app_injection`: GetIt service locator setup
- `router`: Named routing setup
- `localization`: Locale cubit & arb files
- `design_system`: Palette, font styles, typography & themes
- `network`: Dio client & error handling
- `storage`: Base & concrete local storage adapters
