# Lab 005 - Compose to Helm



- `Helm` is a powerful package manager for `Kubernetes` that simplifies the deployment and management of applications.
- This lab will walk you through the process of creating and using a `Helm` chart.

---


## Prerequisites

Before you begin, ensure you have the following installed:

1. **`Kubernetes` Cluster**: A running `Kubernetes` cluster.
2. **`Helm`**: Installed and configured. You can install `Helm` by following the [official Helm installation guide](https://helm.sh/docs/intro/install/).
3. **`kubectl`**: Installed and configured to interact with your `Kubernetes` cluster.
4. `Docker` and `Docker Compose` installed.
5. Completion of previous labs (<a href="/DockerComposeLabs/001-intro/" target="_blank">001 - Introduction</a>, <a href="/DockerComposeLabs/002-Compose-Demo/" target="_blank">002 - Compose-Demo</a>, <a href="/DockerComposeLabs/003-Structure/" target="_blank">003 - Structure</a>, <a href="/DockerComposeLabs/004-Commands/" target="_blank">004 - Commands</a>).


<div style="border:2px solid #2196f3; border-radius:8px; padding:1em; margin:1em 0;">
While the labs can be practiced using your local Docker environment, it is recommended to use a cloud-based solution like <b>Google Cloud Shell</b>, in which Docker and `Docker Compose` are pre-installed and ready to use.<br>
<a href="https://console.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/nirgeier/DockerComposeLabs" target="_blank"><img src="https://gstatic.com/cloudssh/images/open-btn.svg" alt="Open in Cloud Shell" /></a>
</div>

---

## How to Create and Use a Helm Chart

### Step 1: Create a New Helm Chart

1. Navigate to the directory where you want to create the `Helm` chart:

      ```bash
      cd /path/to/your/directory
      ```

2. Use the `helm create` command to template a new `Helm` chart:

      ```bash
      helm create my-chart
      ```

      This will create a directory structure for your chart, including default templates and configuration files.

---

### Step 2: Customize the Chart

1. **Edit `values.yaml`:**
      - Open the `values.yaml` file in the chart directory.
      - Define the default values for your application - such as image repository, tag and resource limits.

2. **Modify Templates:**
      - Navigate to the `templates/` directory.
      - Edit the YAML files (e.g., `deployment.yaml` and `service.yaml`) to define `Kubernetes` resources for your application.

3. **Add Configurations:**
      - If your application requires additional configurations, add them to the `templates/` directory or include them in the `values.yaml` file.

---

### Step 3: Pack the Chart

1. Pack the chart in a `.tgz` file:

      ```bash
      helm package my-chart
      ```

      This creates a compressed file that can be shared.


2. Optionally, you can upload the packaged chart to a `Helm` repository for distribution.

---

### Step 4: Deploy the Chart

1. Install the chart in your `Kubernetes` cluster:

      ```bash
      helm install my-release ./my-chart
      ```

      Replace `my-release` with a name for your release and `./my-chart` with the path to your chart.


2. Verify the deployment:

      ```bash
      kubectl get all
      ```

      Ensure all resources are created and running as expected.

---

### Step 5: Upgrade and Manage the Chart

1. **Upgrade the Release:**
      - Modify the chart or `values.yaml` as needed.
      - Apply the changes:

      ```bash
      helm upgrade my-release ./my-chart
      ```


2. **Rollback Changes:**
      - If something goes wrong, rollback to a previous version:

      ```bash
      helm rollback my-release 1
      ```

      Replace `1` with the desired revision number.

3. **Uninstall the Release:**
      - To remove the release and its resources:

      ```bash
      helm uninstall my-release
      ```

---

### Step 6: Pass Values to the Helm Chart

Helm allows you to override default values defined in the `values.yaml` file by passing custom values during installation or upgrade. This is useful for customizing deployments without modifying the chart itself.

1. **Pass Values via Command Line:**
      - Use the `--set` flag to specify values directly in the command:

      ```bash
      helm install my-release ./my-chart --set key1=value1,key2=value2
      ```

      Example:

      ```bash
      helm install my-release ./my-chart --set image.tag=1.2.3,replicaCount=3
      ```


2. **Use a Custom Values File:**

      - Create a custom YAML file (e.g., `custom-values.yaml`) with the values you want to override:

      ```yaml
      replicaCount: 3
      image:
      ```

2. Use the `helm create` command to template a new `Helm` chart:
      ```bash
      helm create my-chart
      ```

   - Pass the file using the `-f` flag:

     ```bash
     helm install my-release ./my-chart -f custom-values.yaml
     ```

3. **Combine Multiple Methods:**
      - You can combine the `--set` flag and custom values file. The `--set` values take precedence over the file:

      ```bash
      helm install my-release ./my-chart -f custom-values.yaml --set replicaCount=5
      ```

      - This allows you to customize your `Helm` chart deployments flexibly, adapting to different environments or requirements without modifying the chart itself.
