all: openresty

openresty:
	docker build -t openresty:test .
