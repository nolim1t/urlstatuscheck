# urlstatuscheck
[![Build Status](https://travis-ci.org/nolim1t/urlstatuscheck.svg)](https://travis-ci.org/nolim1t/urlstatuscheck)

## What

Simple code for checking the status (only) of the URL. Pull requests welcome.

## Installing

```bash
npm install urlstatuscheck
```

## Usage
Only coffeescript works for now :) Sorry.

### Statuscheck

```coffee-script
urlstatuscheck = require("urlstatuscheck").check;
urlstatuscheck {url: ""}, (cb) -> console.log cb
```

### Get Check

```coffee-script
urlstatuscheck = require("urlstatuscheck").getcheck;
urlstatuscheck {url: ""}, (cb) -> console.log cb
```

