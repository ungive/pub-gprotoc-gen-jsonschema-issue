```
make build
```

Observe `foo_bar_baz` instead of `fooBarBaz` in `issue.schema.json`

```
pip install protobuf
make build_py
python test.py
```

Observe output `{"fooBarBaz": 100.0}`
