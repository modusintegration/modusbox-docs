
playbook:
	antora --fetch site-nn-head-camel-3.yml
	antora --fetch site-nn-head-esb-3.yml
	antora --fetch site-nn-head-mule-3.yml


upload-test:
	aws s3 sync ./build/site s3://test.docs.portx.io/test
