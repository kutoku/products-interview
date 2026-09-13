# Products Interview

A small Rails product catalogue for a technical interview. Products can belong to zero, one, or several collections.

## Stack

- Ruby 3.3.x or 3.4.x
- Rails 8.1.3 and SQLite
- Turbo, Stimulus, and import maps
- Kaminari and Minitest

## Install and run

Clone the repository and start the app:

```sh
git clone https://github.com/kutoku/products-interview.git
cd products-interview
bin/setup --skip-server
# Custom check: verify Ruby, dependencies, database, sample data, tests, and Rails autoloading.
bin/interview-check
bin/rails server
```

Setup installs dependencies, prepares the SQLite database, and seeds four sample products and their collections.

Open [http://localhost:3000](http://localhost:3000). No sign-in is required.

To reload the sample data or run tests:

```sh
bin/rails db:seed
bin/rails test
```

Have the app running before the interview. No feature work is required beforehand.

## What to expect during the interview

Allow approximately 90 minutes. We will work together over a screen share using your usual editor, terminal, and browser.

During the call, we'll share a GitHub gist link containing a patch that adds the feature for the exercise. We will guide you through applying it; no patch preparation is needed beforehand.

1. **Get ready:** confirm the app works, then we'll introduce the proposed feature.
2. **Investigate:** reproduce a reported issue, explain what you find, and clarify the intended behaviour.
3. **Make a change:** implement a correction and demonstrate how you verified it.
4. **Extend the feature:** discuss a follow-up requirement and work on its implementation.
5. **Review:** explain your changes, checks, and remaining uncertainties. There will also be time for your questions.

Ask clarifying questions and take quiet working time when useful; you do not need to narrate every keystroke.

## Tools and AI

We will begin with an independent investigation without AI assistance. During implementation, you may use your normal coding assistant. Keep its use visible in the screen share and be prepared to explain and verify the code you accept. Ordinary documentation is allowed throughout.
