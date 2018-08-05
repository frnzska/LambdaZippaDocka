### Description

Zip lambda function folder content in amazon linux env and upload generated zip to s3.

<pre>
make deploy FOLDER=some_lambda_fct_folder ZIP_NAME=someZip.zip S3_LOCATION=s3://somebucket/key 
</pre>


<pre>
make zip FOLDER=some_lambda_fct_folder ZIP_NAME=someZip.zip  
</pre>

<pre>
 ./lambda_zip_to_s3.sh some_lambda_fct_folder myZip.zip s3://somebucket/something
</pre>
