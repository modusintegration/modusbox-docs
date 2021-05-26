
playbook:
	antora --fetch site-nn-head-camel-3.yml
	antora --fetch site-nn-head-esb-3.yml
	antora --fetch site-nn-head-mule-3.yml

local:
	open build/site/index.html

download-artifact:
	curl -H "Authorization: token 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" https://github.com/modusintegration/portx-ui/releases/download/dev/ui-bundle.zip

download-aws:
	aws s3 cp s3://modusbox-docs-ui-bundle/ui-bundle.zip ./build-resources/ui-bundle.zip

linkchecker:
	docker run --rm -i -u $(id -u):$(id -g) -v`pwd`:/mnt linkchecker/linkchecker --verbose ./build/site/index.html

upload-test:
	aws s3 sync ./build/site s3://test.docs.portx.io/test

upload-dev:
	aws s3 sync ./build/site s3://modusbox-docs

upload-stg:
	aws s3 sync ./build/site s3://staging.docs.portx.io

upload-prod:
	aws s3 sync ./build/site s3://portx-prod-docs

