
playbook:
	antora --fetch playbook-test.yml

upload-test:
	aws s3 sync ./build/site s3://test.docs.portx.io/test
