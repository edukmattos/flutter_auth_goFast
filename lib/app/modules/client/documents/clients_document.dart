const String docClientAll = '''
  subscription getClients {
    clients (
      order_by: {
        name: asc
      }
    )
    {
      id
      name
      ein_ssa
      email
      created_at
      updated_at
      deleted_at
    }
  }
''';

const docSearchClientsEinSsa = '''
  query qrySearchClientsEinSsa (\$name: String, \$ein_ssa: String) { 
    clients(
      where: {
        _or: [
          { name: {_eq: \$name}},
          { ein_ssa: {_eq: \$ein_ssa}}
        ]
        _and: [
          { deleted_at: {_eq: null}}
        ]
      }
    ) {
      name
      ein_ssa
      email
      deleted_at
    }
  }
''';

const docClientSave = '''
  mutation (\$ein_ssa:String, \$name:String, \$email:String) {
    insert_clients(objects: {ein_ssa: \$ein_ssa, name: \$name, email: \$email}) {
     affected_rows
     returning {
        id
        ein_ssa
        name
        email
        created_at
        updated_at
        deleted_at
     }
    }
  }
''';

const docClientEinSsaUnique = '''
  query qryClientEinSsaUnique (\$ein_ssa: String) { 
    clients(
      where: {
        _and: [
          { ein_ssa: {_eq: \$ein_ssa}},
          { deleted_at: {_eq: null}}
        ]
      }
    ) {
      name
      ein_ssa
      email
      deleted_at
    }
  }
''';

const docClientEmailUnique = '''
  query qryClientEmailUnique (\$email:String)
  { 
    clients (
      where: {
        _and: [
          { email: {_eq: \$email}},
          { deleted_at: {_eq: null}}
        ]
      }
    )
    {
      name
      ein_ssa
      email
      deleted_at
    }
  }
''';

const docClientNameUnique = '''
  query qryClientEmailUnique (\$name:String)
  { 
    clients (
      where: {
        _and: [
          { name: {_eq: \$name}},
          { deleted_at: {_eq: null}}
        ]
      }
    )
    {
      name
      ein_ssa
      email
      deleted_at
    }
  }
''';
