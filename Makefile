
playbook:
	antora --fetch site-nn-head-camel-3.yml
	antora --fetch site-nn-head-esb-3.yml
	antora --fetch site-nn-head-mule-3.yml

local:
	open build/site/index.html

upload-test:
	aws s3 sync ./build/site s3://test.docs.portx.io/test

upload-dev:
	aws s3 sync ./build/site s3://modusbox-docs

upload-stg:
	aws s3 sync ./build/site s3://staging.docs.portx.io

upload-prod:
	aws s3 sync ./build/site s3://portx-prod-docs