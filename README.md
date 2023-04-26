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
![homolg deploy](https://user-images.githubusercontent.com/23153316/234607011-c3124844-ca57-4b92-89f5-f547ed30fd5d.gif)

- Merge a PR into our `main` branch

### Sandbox
![sandbox deploy](https://user-images.githubusercontent.com/23153316/234606777-4d9378be-34c4-4d20-bdbd-42b5a8295253.gif)

- Edit release draft
- Make sure `Set as a pre-release` is checked
- Publish

### Production
![production deploy](https://user-images.githubusercontent.com/23153316/234606871-a97301e0-701f-435e-a9fb-eb7b8b138a76.gif)

- Edit the existing prerelease
- Uncheck `Set as a pre-release`
- Check `Set as the latest release`
- Save


## Hotfix
![hotfix](https://user-images.githubusercontent.com/23153316/234606987-cec06ebd-96cf-4eef-a3db-6e9c11c027b0.gif)

To create a new hotfix, we must:
- Create a PR pointing directly to the `prod` branch and merge it
- It will deploy to `sandbox` and `prod`
- It will create a new PR pointing to `main` in order to put the hotfix back to development *
- Merge the PR with `Merge commits` **

*We create a new PR instead of merging directly to handle possible conflicts between `main` branch and `prod`, due to hotfix changes and changes inside `main` while the hotfix was created.

**This will avoid branch `prod` being 1 commit ahead of `main`. It would happen if we `Squash and merge`, because a new commit would be created only and the original hotfix commit wouldn't be merged

Hotfixes will always create a new homolog deployment also at the end of the process
