gcloud auth activate-service-account --key-file=$HOME/key-file.json

gcloud storage cp /usr/public/* gs://$BUCKET_NAME

gcloud storage buckets add-iam-policy-binding  gs://$BUCKET_NAME --member=allUsers --role=roles/storage.objectViewer

