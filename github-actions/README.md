### Category github-actions

---

 - [Capture An Output Value For Use In A Later Step](#capture-an-output-value-for-use-in-a-later-step)
 - [Reference An Encrypted Secret In An Action](#reference-an-encrypted-secret-in-an-action)

---

# Capture An Output Value For Use In A Later Step

GitHub Actions has a workflow command called `set-output`. This can be used to
capture the output from a shell command in step. That output value can then be
used in a later step.

A useful example of this is reading the version of a tool from a dot-file to
tell a later step what version of that tool to install.

Here's the `.tool-versions` file included in my repository:

```
postgres 13.1
ruby 3.0.0
nodejs 15.4.0
```

Assuming I've already [checked out my
repo](https://github.com/actions/checkout), I can find and read the `nodejs`
version from my `.tool-versions` file with a step that uses `set-output`.

```yaml
  - name: Read Node.js version to install from `.tool-versions`
    id: nodejs
    run: >-
      echo "::set-output name=NODE_VERSION::$(
        cat .tool-versions |
        grep nodejs |
        sed 's/nodejs \(.*\)$/\1/'
      )"
```

`echo` runs the command in the string which sets `NODE_VERSION` as an output
value to what ends up being `15.4.0`.

This output value can be referenced in a later step.

```yaml
  - name: Install required Node.js version
    uses: actions/setup-node@v1
    with:
      node-version: "${{ steps.nodejs.outputs.NODE_VERSION }}"
```

`steps` has a reference to the `nodejs` step (note the `id` above) which then
has `outputs` like the `NODE_VERSION`.

[source](https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions#using-workflow-commands-to-access-toolkit-functions)

# Reference An Encrypted Secret In An Action

CI environments like GitHub Actions want to help you keep your secrets secret.
They allow you to store an encrypted version of a secret that can be access in
an action.

First, you need to add an encrypted secret to your repository. Navigate to your
repository's _Settings_ page and then to the _Secrets_ tab. You can then add
the secret with the _New repository secret_ button.

Once the secret is added, you can reference it in your actions.

Let's say you added your repository secret with the name `MY_API_KEY`. And then
let's say that your project needs to be built with that API key available in
the environment as `SECRET_API_KEY`. You can reference it from `secrets` in the
`env` section.

```yaml
  - name: Build the JS bundle
    run: yarn build
    env:
      SECRET_API_KEY: ${{ secrets.MY_API_KEY }}
```

Though this API key is stored on GitHub's servers as an encrypted value, it
will be decrypted when this workflow step is run.

[source](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow)

