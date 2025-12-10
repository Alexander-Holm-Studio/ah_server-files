# LB News App

A news app for [LB Phone](https://store.lbscripts.com/)

## Installation

1. Add `lb-newsapp` to your `resources` folder
2. Add `start lb-newsapp` to your `server.cfg`, make sure it's started after `lb-phone`
3. Run the `news.sql` file using HeidiSQL

### ESX

If you use ESX, you need to run the `esx.sql` file to add the `reporter` job. You may need to delete the predefined job first.

### QB Core

If you use QB Core, you need to manually add the `reporter` job. You may need to delete the predefined job first.

1. Open `qb-core/shared/jobs.lua`
2. Add the following:

```lua
reporter = {
    label = 'Reporter',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = { name = 'Reporter', payment = 25 },
        ['1'] = { name = 'Editor', payment = 50 },
        ['2'] = { name = 'Editor-in-Chief', payment = 100 },
        ['3'] = { name = 'CEO', payment = 150 },
    },
},
```

## Configuration

### Framework

The script automatically detects your framework. If this for some reason doesn't work, you can set it manually by changing `Config.Framework`.

### Language

You can set the language by changing `Config.Language`. To create your own language, copy the `locales/en.lua` file and change the values.

### Job

To change the job required for the app, edit `Config.JobName`. To change permissions for different grades, edit `Config.Permissions`.

### Logs

To enable logs, set `Config.Logs.Enabled` to true.

To change the service used for logs, change `Config.Logs.Service`. By default, [fivemanage](https://github.com/fivemanage/sdk), [ox_lib](https://github.com/overextended/ox_lib) and discord are supported. You can edit this in `server/logs.lua`.

### Discord Notifications

You can enable discord webhooks to send a message whenever a new article is published, or when an article is edited. To do so, change `Config.DiscordNotifications`. To set your webhook link, do so in `server/apiKeys.lua`.

### App Design

You can change the header of the app by changing `Config.Header`. You can change the text, color, font-size and optionally set an image. If you use an image, text has to be set to `nil`.
