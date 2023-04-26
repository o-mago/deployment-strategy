# Strategy

![schema](https://user-images.githubusercontent.com/23153316/234588896-5185522d-bca0-4e48-9e63-59e5e97c4598.png)

## About
This deployment strategy is based on the github releases lifecycle

With this approach we have 2 main branches:
- `main`: development branch, whatever is inside this branch is deployed to homolog
- `prod`: production branch, whatever is inside this branch is deployed to production

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
- Merge a PR into our `main` branch

https://user-images.githubusercontent.com/23153316/234625312-dfc9462c-88eb-4a1d-80af-6713f8f2e489.mp4

### Sandbox
- Edit release draft
- Make sure `Set as a pre-release` is checked
- Publish

https://user-images.githubusercontent.com/23153316/234627351-e585c3a0-25ca-4e77-a175-e80094756722.mp4

### Production
- Edit the existing prerelease
- Uncheck `Set as a pre-release`
- Check `Set as the latest release`
- Save

https://user-images.githubusercontent.com/23153316/234627381-4f22eadb-0ae8-4afd-84e4-caf13df7b64c.mp4

## Hotfix
To create a new hotfix, we must:
- Create a PR pointing directly to the `prod` branch and merge it
- It will deploy to `sandbox` and `prod`
- It will create a new PR pointing to `main` in order to put the hotfix back to development *
- Merge the PR with `Merge commits` **

*We create a new PR instead of merging directly to handle possible conflicts between `main` branch and `prod`, due to hotfix changes and changes inside `main` while the hotfix was created.

**This will avoid branch `prod` being 1 commit ahead of `main`. It would happen if we `Squash and merge`, because a new commit would be created only and the original hotfix commit wouldn't be merged

Hotfixes will always create a new homolog deployment also at the end of the process

https://user-images.githubusercontent.com/23153316/234627432-0affb75d-ee66-4986-a830-3d273f0ba554.mp4
