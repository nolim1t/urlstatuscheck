# urlstatuscheck

## What

Simple code for checking the status (only) of the URL. Pull requests welcome.

## Installing

```bash
npm install urlstatuscheck
```

## Usage

```node.js
var urlstatuscheck = require("urlstatuscheck").check;

urlstatuscheck({url: ""}, function(cb) { console.log(cb); });

```
