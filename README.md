# Kogeskostkoncept

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 9.1.8.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Angular Readme

for angular generated readme please read at `./angular.info.md`

## Start

To run application locally

```sh
yarn start

## this will start with environment.local instead, you can use that for additional configuration only for your local
### this file is excluded from git so you need to create it of from: environment.dev.ts > environment.local.ts
yarn start:local

```

### environment

Local environment only is available! Just copy and rename `environment.dev.ts` > `environment.local.ts`
and keep in same location, this is your own file you can only use when running project with `yarn start:local`

### Start with database

make sure you read the instructions from backend/functions project readme.md under **Running firebase emulator with local database**.

Then, you dont need to do anything just run the application.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

For each environment build execute:

```sh
ng build --configuration=local # local development
ng build --configuration=dev # development
ng build --configuration=stg # staging
ng build --configuration=production # production

## then you can test run build on your http://localhost:3000
yarn serve

```

### Release and conventional commits

Ideas taken from: https://mokkapps.de/blog/how-to-automatically-generate-a-helpful-changelog-from-your-git-commit-messages
and from: https://www.conventionalcommits.org/en/v1.0.0-beta.2/
This project now support creating of releases via CLI command.
The release feature should only be used when issuing next release cycle of the project, the release should always be maintained, all commits need to follow valid formatting that will help generating final `CHANGELOG.md` file.
If your commits do not follow valid format you will not be able to commit;
**Example**

```sh
# this will fail
git commit -m "This is my new feature"
✖#subject may not be empty [subject-empty]
✖#type may not be empty [type-empty]
# this will pass
git commit -m " feat: This is my new feature"
git commit -m " fix: This is my new fix"
git commit -m " refactor: This is my new refactor"
git commit -m " perf: This is performance adjustments"
git commit -m " style: This is some code styling"
git commit -m " docs: This is some code documentations"
git commit -m " misc: This is some dependency adjustments, or small change"
git commit -m " test: This is for unit testing"
```

**Commit format**
To create valid commits please look inside package.json > "standard-version": {...}
you can use the following standards: `feat|fix|refactor|misc`

-   min > Minor
-   feat > Feature
-   fix > bugfix or hotfix
-   refactor > Refactor
-   misc > Miscellaneous (_anything that relates to package, dependency change_), deletion of old files, text or style changes
-   perf > Performance, any performance improvements
-   test > add unit testing (will not show in release)
-   style > code formatting (will not show in release)
-   docs > code documentation (will not show in release)
    **How does it work**
    This package will generate changelog.md file with latest commits and will bump your project version

1. _conventionalcommits_ > https://www.conventionalcommits.org/en/v1.0.0-beta.2/
    - Hook runs via husky validating your commits
2. _standard-version_ > https://www.npmjs.com/package/standard-version
    - After running release commands (per below), it will generate new `CHANGELOG.md` file from the last created git tag entry, for this to work correctly and display all commit messages you need to follow commit standards.
        - Every release increments the project version so make sure you know what semantic versioning is before you release something, my recommendation is to read this first: **Semantic Versioning 2.0.0** https://semver.org/

-   _types: https://stackoverflow.com/questions/66856017/how-can-i-custom-config-changelog-md-using-standard-version-npm-package_
    **how to initiate a new release in correct order**
    You need to be at project root `./`, if not already installed, run: `yarn add standard-version`, if doesnt work you may also need to install it globally so, `npm i -g standard-version`
    new release:

```sh
# how to bump
## patch, this will increment x.x.1
yarn release:patch
## minor,  this will increment x.1.x
yarn release:minor
## major, this will increment 1.x.x
yarn release:major
## manually set version
## version increments: major | minor | patch
yarn release --release-as {increment}
yarn release --release-as 1.1.0
```

**Correct order of execution**

1. First create new release branch
2. Next create new release with `standard-version` package to generate/update CHANGELOG.md file, it will append and populate this file with latest commits correctly formatted according to **conventionalcommits**.
3. You need to commit new changes because `package.json` and `CHANGELOG.md` were updated.
4. Finally push to remote branch
5. Optionally so we can track all git tag changes, if you did not set it to automatic, please do the following:

```sh
#  Git 1.8.3
git push --follow-tags
## or set it up one time
git config --global push.followTags true
#### also useful commands
## to pull tags to your local
git pull --tags
## see all remote tags
git ls-remote --tags origin
## see all local tags
git tag
## reference: https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git#5195913
```

-   before pushing new release branch to remote git:
    -   you need to run release command, example: `yarn release:patch`, you may also want to run this:
        `git push --follow-tags` > it will push all local tags to remote branch
        **new release example**

*   Remember we only need to create release one time: `dev>staging>production`
*   Remember every time you call `yarn release:{version_increment}` it will update project version and the change log.

```sh
## develop, any new changes release to staging
### at project root ./
git checkout -b release_25/staging
## if there are no breaking changes, or no new feature, then
yarn release:patch
## if there are new features, then
yarn release:minor
## if there are major changes to the project, that are not compatible, then
yarn release:major

## you can also skip version bump, commit and tag by adding this to above command or do the below\
npx standard-version --skip.bump --skip.commit --skip.tag

### finally push your release branch to remote
git push
```

## temp

hello world!
