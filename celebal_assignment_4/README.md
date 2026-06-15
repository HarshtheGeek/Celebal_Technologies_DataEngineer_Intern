# Mini Project: Azure Data Factory Data Pipeline

## Problem Statement

Build a complete data pipeline that reads a CSV file from Azure Blob Storage and processes it using Azure Data Factory (ADF).

---

## Objective

The objective of this project is to implement an end-to-end data pipeline using Azure services. The pipeline reads a CSV file from Azure Blob Storage, validates its metadata, and copies the data to a destination location using Azure Data Factory.

---

## Azure Services Used

* Azure Resource Group
* Azure Storage Account
* Azure Blob Storage
* Azure Data Factory (ADF)
* Linked Services
* Datasets
* Pipelines
* Get Metadata Activity
* Copy Data Activity

---

## Project Architecture

```text
CSV File
    │
    ▼
Blob Storage (Source Container)
    │
    ▼
Linked Service (AzureBlobStorage1)
    │
    ▼
Source Dataset
    │
    ▼
Get Metadata Activity
    │
    ▼
Copy Data Activity
    │
    ▼
Destination Dataset
    │
    ▼
Blob Storage (Destination Container)
```

---

## Implementation Steps

### 1. Storage Setup

* Created an Azure Storage Account.
* Created Blob Storage containers:

  * `source`
  * `destination`
* Uploaded the CSV file (`Sample - Superstore.csv`) to the source container.

### 2. Azure Data Factory Setup

* Created Azure Data Factory instance.
* Launched ADF Studio.
* Configured a Linked Service named `AzureBlobStorage1` to connect Azure Data Factory with Azure Blob Storage.

### 3. Dataset Configuration

* Created `SourceDataset` for the source CSV file.
* Created `DestinationDataset` for the destination container.

### 4. Metadata Validation

* Created a pipeline named `MetadataPipeline`.
* Added the **Get Metadata** activity.
* Validated:

  * File existence
  * File size
  * Last modified timestamp

### 5. Data Pipeline Development

* Created a pipeline named `CopyPipeline`.
* Added the **Copy Data** activity.
* Configured:

  * Source Dataset → `SourceDataset`
  * Sink Dataset → `DestinationDataset`

### 6. Pipeline Execution

* Executed the pipeline using the **Debug** option.
* Verified successful execution.

---

## Expected Output

* CSV file successfully read from Azure Blob Storage.
* Metadata validated using Get Metadata activity.
* Data copied from source container to destination container.
* Pipeline executed successfully with status **Succeeded**.

---

## Results

Linked Service configured successfully.

Source and Destination datasets created.

Metadata validation completed.

Copy Data pipeline executed successfully.

Data copied to destination container.

Pipeline execution status: **Succeeded**.

---

## Conclusion

This project successfully demonstrates the implementation of an Azure Data Factory data pipeline. The solution integrates Azure Blob Storage and Azure Data Factory to perform metadata validation and automated data movement between storage locations, showcasing fundamental cloud data engineering concepts.
