<!-- This file has been generated with command 'sf hardis:doc:plugin:generate'. Please do not update it manually or it may be overwritten -->
# hardis:doc:project2markdown

## Description

Generates a markdown documentation from a SFDX project

- Objects (with fields, validation rules, relationships and dependencies)
- Automations
  - Approval Processes
  - Assignment Rules
  - AutoResponse Rules
  - Escalation Rules
  - Flows
- Authorizations
  - Profiles
  - Permission Set Groups
  - Permission Sets
- Code
  - Apex
  - Lightning Web Components
- Lightning Pages
- Packages
- SFDX-Hardis Config
- Branches & Orgs
- Manifests

Can work on any sfdx project, no need for it to be a sfdx-hardis flavored one.

Generates markdown files will be written in **docs** folder (except README.md where a link to doc index is added)

- You can customize the pages following [mkdocs-material setup documentation](https://squidfunk.github.io/mkdocs-material/setup/)
- You can manually add new markdown files in the "docs" folder to extend this documentation and add references to them in "mkdocs.yml"
- You can also add images in folder "docs/assets" and embed them in markdown files.

To read Flow documentations if your markdown reader doesn't handle MermaidJS syntax, this command could require @mermaid-js/mermaid-cli

- Run `npm install @mermaid-js/mermaid-cli --global` if puppeteer works in your environment
- It can also be run as a docker image

Both modes will be tried by default, but you can also force one of them by defining environment variable `MERMAID_MODES=docker` or `MERMAID_MODES=cli`

_sfdx-hardis docker image is alpine-based and does not succeed to run mermaid/puppeteer: if you can help, please submit a PR !_

If Flow history doc always display a single state, you probably need to update your workflow configuration:

- on Gitlab: Env variable [`GIT_FETCH_EXTRA_FLAGS: --depth 10000`](https://github.com/hardisgroupcom/sfdx-hardis/blob/main/defaults/monitoring/.gitlab-ci.yml#L11)
- on GitHub: [`fetch-depth: 0`](https://github.com/hardisgroupcom/sfdx-hardis/blob/main/defaults/monitoring/.github/workflows/org-monitoring.yml#L58)
- on Azure: [`fetchDepth: "0"`](https://github.com/hardisgroupcom/sfdx-hardis/blob/main/defaults/monitoring/azure-pipelines.yml#L39)
- on Bitbucket: [`step: clone: depth: full`](https://github.com/hardisgroupcom/sfdx-hardis/blob/main/defaults/monitoring/bitbucket-pipelines.yml#L18)

![Screenshot flow doc](https://github.com/hardisgroupcom/sfdx-hardis/raw/main/docs/assets/images/screenshot-flow-doc.jpg)

![Screenshot project documentation](https://github.com/hardisgroupcom/sfdx-hardis/raw/main/docs/assets/images/screenshot-project-doc.jpg)

![Screenshot project documentation](https://github.com/hardisgroupcom/sfdx-hardis/raw/main/docs/assets/images/screenshot-project-doc-2.jpg)

![Screenshot project documentation](https://github.com/hardisgroupcom/sfdx-hardis/raw/main/docs/assets/images/screenshot-object-diagram.jpg)

![Screenshot project documentation](https://github.com/hardisgroupcom/sfdx-hardis/raw/main/docs/assets/images/screenshot-project-doc-profile.gif)

If it is a sfdx-hardis CI/CD project, a diagram of the branches and orgs strategy will be generated.

![](https://github.com/hardisgroupcom/sfdx-hardis/raw/main/docs/assets/images/screenshot-doc-branches-strategy.jpg)

If [AI integration](https://sfdx-hardis.cloudity.com/salesforce-ai-setup/) is configured, documentation will contain a summary of the Flow.

- Use variable PROMPTS_LANGUAGE (ex: PROMPTS_LANGUAGE=fr) to force language for LLM calls (default:en)

If you have a complex strategy, you might need to input property **mergeTargets** in branch-scoped sfdx-hardis.yml file to have a correct diagram.

Define DO_NOT_OVERWRITE_INDEX_MD=true to avoid overwriting the index.md file in docs folder, useful if you want to keep your own index.md file.

## Doc HTML Pages

To read the documentation as HTML pages, run the following code (you need [**Python**](https://www.python.org/downloads/) on your computer)

```python
pip install mkdocs-material mkdocs-exclude-search mdx_truly_sane_lists || python -m pip install mkdocs-material mkdocs-exclude-search mdx_truly_sane_lists || py -m pip install mkdocs-material mkdocs-exclude-search mdx_truly_sane_lists
mkdocs serve -v || python -m mkdocs serve -v || py -m mkdocs serve -v
```

To just generate HTML pages that you can host anywhere, run `mkdocs build -v || python -m mkdocs build -v || py -m mkdocs build -v`



## Parameters

| Name              |  Type   | Description                                                         |                 Default                  | Required | Options |
|:------------------|:-------:|:--------------------------------------------------------------------|:----------------------------------------:|:--------:|:-------:|
| debug<br/>-d      | boolean | Activate debug mode (more logs)                                     |                                          |          |         |
| diff-only         | boolean | Generate documentation only for changed files (used for monitoring) |                                          |          |         |
| flags-dir         | option  | undefined                                                           |                                          |          |         |
| json              | boolean | Format output as json.                                              |                                          |          |         |
| pdf               | boolean | Also generate the documentation in PDF format                       |                                          |          |         |
| skipauth          | boolean | Skip authentication check when a default username is required       |                                          |          |         |
| target-org<br/>-o | option  | undefined                                                           | <nicolas.vuillamy@cloudity.com.playnico> |          |         |
| websocket         | option  | Websocket host:port for VsCode SFDX Hardis UI integration           |                                          |          |         |
| with-history      | boolean | Generate a markdown file with the history diff of the Flow          |                                          |          |         |

## Examples

```shell
sf hardis:doc:project2markdown
```

```shell
sf hardis:doc:project2markdown --with-history
```

```shell
sf hardis:doc:project2markdown --with-history --pdf
```


