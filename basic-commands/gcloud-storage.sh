#create storage bucket
gsutil mb gs://magician-bucket/

#download image to temporary instance 
wget --output-document ada.jpg https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Ada_Lovelace_portrait.jpg/800px-Ada_Lovelace_portrait.jpg

#copy downloaded image to bucket
gsutil cp ada.jpg gs://YOUR-BUCKET-NAME

#download object from your bucket
gsutil cp -r gs://YOUR-BUCKET-NAME/ada.jpg .

#gsutil cp command to create a folder called image-folder and copy the image (ada.jpg) into it:
gsutil cp gs://YOUR-BUCKET-NAME/ada.jpg gs://YOUR-BUCKET-NAME/image-folder/

#list content in storage bucket
gsutil ls gs://YOUR-BUCKET-NAME

#list details of an object
gsutil ls -l gs://YOUR-BUCKET-NAME/ada.jpg

#make object publicly accessible
gsutil acl ch -u AllUsers:R gs://YOUR-BUCKET-NAME/ada.jpg

#remove public access
gsutil acl ch -d AllUsers gs://YOUR-BUCKET-NAME/ada.jpg

#delete object from storage bucket
gsutil rm gs://YOUR-BUCKET-NAME/ada.jpg