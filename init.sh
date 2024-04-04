#!/bin/bash
# Define the path to the backend file
BACKEND_FILE="backend_configs/tfe.tfbackend"
TFVARS_FILE="variables/dev.tfvars"
PLAN_ONLY="false"

# Check if the backend file exists
if [ -f "$BACKEND_FILE" ]; then
    # If the backend file exists, use it for backend configuration
    echo "Backend configuration found. Running 'terraform init' with backend config..."
    terraform init -backend-config="$BACKEND_FILE"
else
    # If the backend file does not exist, run 'terraform init' without backend config
    echo "No backend configuration found. Running 'terraform init' without backend config..."
    terraform init
fi

# Check if the tfvars file exists for plan and apply
if [ -f "$TFVARS_FILE" ]; then
    # If the tfvars file exists, use it for plan and apply
    TFVARS_FILE=$TFVARS_FILE
else
    # If the tfvars file does not exist, use an empty file
    echo "No tfvars file found. Using an empty file..."
    TFVARS_FILE=$TFVARS_FILE
fi

# Check if environment variable PLAN_ONLY is set to true
if [ "$PLAN_ONLY" = true ]; then
    # If PLAN_ONLY is true, run 'terraform plan' with tfvars file
    echo "Running 'terraform plan'..."
    terraform plan -var-file="$TFVARS_FILE"
else
    # If PLAN_ONLY is not true, run 'terraform apply' with tfvars file
    echo "Running 'terraform apply'..."
    terraform apply -auto-approve -var-file="$TFVARS_FILE"
fi

