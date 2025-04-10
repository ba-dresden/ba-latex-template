---
title: Environments
sort: 3
---

# Environments

The template provides two environments to deal with figures and tables.
Both will likely break if the content spans multiple pages.
Therefore, it could make sense to split up large content and use multiple `bafigures` or `batables`.
There's also an additional environment to deal with code snippets in your work, `bacode`.

## bafigure

The `bafigure` environment creates a frame and a label around its content and adds an entry to the list of figures.
It also adds the given caption with a source reference below the figure.

```latex
\begin{bafigure}[
    source=SOURCE,
    placement=htb,
    label=LABEL
]{CAPTION}
    % The content e.g. \includegraphics{...}
    % Large images should be nicely sized by setting their width to 14cm, e.g. \includegraphics[width=14cm]{...}
\end{bafigure}
```

Let's describe the optional arguments shortly:

- `source` is the source of the figure, it defaults to you. To cite something here properly `\captioncite` should be used.
- `placement` describes the placement of the figure, it defaults to `H`, which puts the figure exactly where it was specified in the code.
- `label` is the label, which you can use in `\ref{label}`, it defaults to the provided caption.

## batable

The `batable` environment puts its content in a table environment and adds an entry to the list of table.
It also adds the given caption with a source reference below the figure.

```latex
\begin{batable}[
    source=SOURCE,
    placement=htb,
    label=LABEL
]{CAPTION}
    % The content e.g. a nested tabular environment
\end{batable}
```

The optional arguments have the same meaning as for `bafigure`.

- `source` is the source of the table, it defaults to you. To cite something here properly `\captioncite` should be used.
- `placement` describes the placement of the table, it defaults to `H`, which puts the table exactly where it was specified in the code.
- `label` is the label, which you can use in `\ref{label}`, it defaults to the provided caption.

In case you need footnotes in tables possible options are outlined [here](https://texfaq.org/FAQ-footintab).

## bacode

The `bacode` creates a frameless box around it's content to provide a caption and adds it content to the list of codes.
The caption which includes a source reference is placed beneath the code snippet.

```latex
\begin{bacode}[
    source=SOURCE,
    label=LABEL
]{CAPTION}
    % The content e.g. \begin{listing}
\end{bacode}
```

The optional arguments have the same meaning as for `bafigure` and `batable`.

- `source` is the source of the table, it defaults to you. To cite something here properly `\captioncite` should be used.
- `placement` is **not** applied. This will probably managed by your own code environment e.g. `listings` or `minted`. For further information see [packages](./packages.md).
- `label` is the label, which you can use in `\ref{label}`, it defaults to the provided caption.

If you decide to use the [`simple mode`](./simple.md) and the package `listings` this template provides 2 different styling options for your code highlighting. These theme options are `github-light` and `github-dark` and are orientated on the code highlighting from [GitHub](https://github.com). Unfortunately the DHSN itself doesn't provide any requirements for code formatting, highlighting etc. The default theme option in [`simple mode`](./simple`.md) is `github-light`. If you want to change this you can do this with `\lstset{style=github-dark}` or any other theme name you maybe created by your self. Also feel free to add other styles to this template. If you want to learn more about the `listings` package you can visit the [listings introduction page](https://de.overleaf.com/learn/latex/Code_listing) on overleaf and the package itself on [CTAN](https://ctan.org/pkg/listings).

## baappx

The `baappx` environment creates the appendix along with list of all appendix entries and adds required entries to the table of contents.
It adjusts the behavior of `bafigure` and `batable` so that they do not add entries to the list of figures/tables and
put them instead into the list of all appendix entries.

```latex
\begin{baappx}
    \begin{bafigure}{CAPTION}
        % A figure in the appendix
    \end{bafigure}
    \clearpage
    \begin{batable}{CAPTION}
        % A table in the appendix
    \end{batable}
\end{baappx}
```

Throughout the document `\theappx` can be used to get the number/index of the last appendix entry.
An entry to the list of all appendix entries can be created manually with `\addtoappx{caption}`

```warning
 The list of appendix entries is tracked in an extra file ending in ".loa". It might not be handled correctly by build tools when cleaning, e.g. "latexmk -c". In this case the file can be removed manually. In case your compilation fails permantly without any apparent reason try deleting the ".loa" file.
```
