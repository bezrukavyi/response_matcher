{
  data: {
    id: object.id,
    name: object.name
  },
  nested_data: call('with_attributes', object: nested_object)
}
