#Setup master and slave

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

aws ec2 run-instances \
    --image-id ami-0f1026b68319bad6c \
    --key-name frankfurt-key-amazon \
    --instance-type t2.micro \
    --region eu-central-1 \
    --security-group-ids sg-4df2c82b \
    --count 3
