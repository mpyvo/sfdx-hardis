---
title: Suspect Setup Actions (Salesforce monitoring)
description: Schedule daily checks of suspect actions in setup with sfdx-hardis Monitoring
---
<!-- markdownlint-disable MD013 -->

## Detect suspect setup actions in major org

Will extract from audit trail all actions that are considered as suspect, excepted the ones related to the deployment user and a given list of users, like the release manager.

Sfdx-hardis command: [sf hardis:org:diagnose:audittrail](https://sfdx-hardis.cloudity.com/hardis/org/diagnose/audittrail/)

Key: **AUDIT_TRAIL**

### Grafana example

![](assets/images/screenshot-monitoring-audittrail-grafana.jpg)

### Slack example

![](assets/images/screenshot-monitoring-audittrail.jpg)

## Excel output example

![](assets/images/screenshot-monitoring-audittrail-excel.jpg)

## Local output example

![](assets/images/screenshot-monitoring-audittrail-local.jpg)
