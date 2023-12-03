<h1>Commits and Pull Requests</h1>

- [Document your reasoning](#document-your-reasoning)
  - [Document first](#document-first)
  - [Code comments](#code-comments)
  - [Commit messages](#commit-messages)
  - [Pull Request comments](#pull-request-comments)
  - [Write well](#write-well)
    - [Code has correctness rules](#code-has-correctness-rules)
    - [Avoid thrashing](#avoid-thrashing)
- [Summary](#summary)

# Document your reasoning

`Code should reflect emphaty`

Self-documenting code rarely is. Document why you wrote the code in the way you did; not what it does.

The preferred priority is this:

## Document first

Self-documenting code: You can make some decisions about the code self-documenting. Clean Code is literally a book on how to do that.
Automated tests are a great way to document and reason about your implementation.

## Code comments

If you can't make the code sufficiently self-documenting, add a code comment. At least, the comment is co-located with the code, so even in the unlikely event that you decide to change version control system, the comment is still preserved.

## Commit messages

Most version control systems give you the opportunity to write a commit message.

Most people don't bother putting anything other than a bare minimum into these, but you can document your reasoning here as well.

Sometimes, you'll need to explain why you're doing things in a certain order. This doesn't fit well in code comments, but is a good fit for a commit message.

As long as you keep using the same version control system, you preserve these commit messages, but they're once removed from the actual source code, and you may loose the messages if you change to another source control system.

## Pull Request comments

Rarely, you may find yourself in a situation where none of the above options are appropriate. This message is twice removed from the actual source code, and will only persist as long as you keep using the same host.

Occasionally, you may find that you need to explain yourself to the reviewer, but the explanation involves something external to the source code.

## Write well

Write good code, but also write good prose. This is partly subjective, but there are rules for both code and prose.

### Code has correctness rules

If you break them, it doesn't compile (or, for interpreted languages, it fails at run-time).

The same goes for the prose you may add: Code comments. Commit messages. Pull Request messages.

Please use correct spelling, grammar, and punctuation as per the Style Guide. If you don't, your prose is harder to understand, and your reviewer is a human being.

### Avoid thrashing

Sometimes, a reviewer will point out various issues with your Pull Request, and you'll agree to address them.

This may cause you to add more commits to your Pull Request branch. There's nothing wrong with that per se. However, this can lead to unwarranted thrashing.

As an example, your pull request may contain five commits: A, B, C, D, and E. The reviewer doesn't like what you did in commits B and C, so she asks you to remove that code. Most people do that by checking out their pull request branch and deleting the offending code, adding yet another commit (F) to the commit list: [A, B, C, D, E, F]

Why should we have to merge a series of commits that first adds unwanted code, and then removes it again? It's just thrashing; it doesn't add any value.
Instead, remove the offending commits, and force push your modified branch: [A, D, E]. While under review, you're the sole owner of that branch, so you can modify and force push it all you want.

Using a squashing merge or using interactive rebases is a great way to achieve this.

You are the sole owner of that branch. Just rebase your Pull Request branch and force push it. The resulting commit history will be cleaner.

# Summary

One or more persons will review your Pull Request. Don't make your reviewer work.
The more you make your reviewer work, the greater the risk is that your Pull Request will be rejected.
