# Strategy
![schema](https://github.com/o-mago/deployment-strategy/assets/23153316/87ad45ab-3cbf-42b2-b600-d19b1f8b06ce)



## About
This deployment strategy is based on the github releases lifecycle

With this approach we have 2 main branches:
- `develop`: development branch, whatever is inside this branch is deployed to homolog
- `main`: production branch, whatever is inside this branch is deployed to production

## Releases
All release drafts are created automatically when we merge a PR to the main branch

### Versioning
The version is based on the [semver 2.0.0](https://semver.org/)
It is automatically increased by the release drafter based on the tags added to the PRs:
- major:
    - 💣 Breaking change
- minor:
    - 🚀 Feature
- patch:
    - 🐛 Bugfix
    - 🔥 Hotfix
    - 📚 Documentation
    - 🏗️ Refactor
    - 🧪 Test
    - 🚨 Security
    - ☁️ CI
    - no tag

## Deployment
How to deploy to each environment

### Homolog
- Merge a PR into `develop` branch

### Sandbox
- Edit release draft
- Make sure `Set as a pre-release` is checked
- Publish

### Production
- Edit the existing prerelease
- Uncheck `Set as a pre-release`
- Check `Set as the latest release`
- Save

## Hotfix
To create a new hotfix, we must:
- Create a new branch (with the changes) starting with `hotfix/` (e.g. `hotfix/failing-endpoint-x`)
- A new PR pointing directly to the `main` branch will be created by an action
- Edit it with the info about it and merge it
- It will deploy to production
- If no conflicts are found, it will merge automatically these changes to develop branch
- If conflicts are found, it will create a new branch and a PR pointing to `develop` in order to put the hotfix back to development
- Resolve the conflicts and merge with `Merge commit` option
