---
title: Environments
sort: 3
---
# Environments
The template provides two environments to deal with figures and tables.
## bafigure
The `bafigure` environment creates a frame and a label around its content and adds an entry to the list of figures. Also adds the given caption with a source reference below the figure.
```latex
\begin{bafigure}[
    source=SOURCE,
    placement=htb,
    label=LABEL
]{CAPTION}
    % The content
\end{bafigure}
```
Let's describe the optional arguments shortly:
- `source` is the source of the figure, it defaults to you.
- `placement` describes the placement of the figure, it defaults to `H`, which puts the figure exactly where it was specified in the code.
- `label` is the label, which you can use in `\ref{label}`, it defaults to the provided caption.

## batable
The `batable` environment puts its content in a table environment and adds an entry to the list of table. Also adds the given caption with a source reference below the figure.
```latex
\begin{batable}[
    source=SOURCE,
    placement=htb,
    label=LABEL
]{CAPTION}
    % The content
\end{batable}
```
The optional arguments have the same meaning as for `bafigure`.
- `source` is the source of the table, it defaults to you.
- `placement` describes the placement of the table, it defaults to `H`, which puts the table exactly where it was specified in the code.
- `label` is the label, which you can use in `\ref{label}`, it defaults to the provided caption.
