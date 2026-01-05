# ProductInfo Service/Client experiment

This is a sample app to experiement with GRPC and get hands on experience.

## Generating the Protobufs

```shell
make proto
```

### Calling the server with GRPCurl

#### Adding Product 

```bash
grpcurl -plaintext \ 
  -import-path ./proto \
  -proto proto/product_info.proto \                                                                                                 
  -d '{
    "id": "prod-123",
    "name": "Mechanical Keyboard",
    "description": "Hot-swappable, tactile switches",
    "price": 149.99
  }' \
  localhost:50051 ecommerce.ProductInfo/addProduct
```

```shell
{
  "value": "e019212a-c516-43d4-8070-2d14124d44b0"
}
```


#### Retrieving a product

```shell 
grpcurl -plaintext \
-import-path ./proto \
-proto proto/product_info.proto \
-d '{
"value": "e019212a-c516-43d4-8070-2d14124d44b0"
}' \
localhost:50051 ecommerce.ProductInfo/getProduct
```
