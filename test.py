import sys
sys.path.append("./build_py")

from google.protobuf.json_format import MessageToJson
from build_py.issue_pb2 import Message

msg = Message()
msg.foo_bar_baz = -1
json_obj = MessageToJson(msg, indent=None)
print(json_obj == '{"fooBarBaz": -1.0}')
print(json_obj)
