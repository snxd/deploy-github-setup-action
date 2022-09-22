# Solsta Deployments Setup Action for GitHub

This project is a GitHub Action that uses Solid State Networks tools and services.  

## Variables

* **solsta_client_id:** Client ID to authenticate usage of Solid State Networks console tools
* **solsta_client_secret:** Secret Key to authenticate usage of Solid State Networks console tools
* **console_version:** Version of Solsta Console Tools to use
* **scripts_version:** Version of Solsta Deploy Scripts to use

## Using

Here is an example YAML Fragment in the steps section of a build:

```yaml
    steps:
    - name: Promote a Release from Dev to QA
      uses: snxd/deploy-github-setup-action@main
      with:
        console_version: '6.1.1.12'
        scripts_version: '3.7.16'
        source_product: 'Emutil'
        source_environment: 'Java'
        source_repository: 'Dev'
```

## License
(C) 2022 Solid State Networks, LLC.  All Rights Reserved.
