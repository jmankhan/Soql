interfaces = open("interfaces.txt", "w+")
methods = open("methods.txt", "w+")

# define valid operators and data types to use. we will start with a combination of all types and ops, but narrow down
# which ones are valid in the loops below. note that likee is not included in the operators map because
# the only valid data_type for it is String, it will be added after the loops at the end
operators = ['eq', 'neq', 'le', 'lt', 'gt', 'ge', 'inn', 'ninn', 'inc', 'exc']
data_types = ['Boolean', 'Date', 'Datetime', 'Decimal', 'Double', 'Id', 'Integer', 'Long', 'Object', 'String', 'Time']
operator_map = {'eq' : '=', 'neq' : '!=', 'lt' : '<', 'le' : '<=', 'gt' : '>', 'ge' : '>=', 'likee' : 'LIKE', 'inn' : 'IN', 'ninn' : 'NOT IN', 'inc' : 'INCLUDES', 'exc' : 'EXCLUDES'}
list_operators = ['inn', 'ninn', 'inc', 'exc']
restricted_types = ['Boolean', 'Id', 'Object']
restricted_operators = ['eq', 'neq']
numeric_types = ['Decimal', 'Double', 'Integer', 'Long']

# define generated template format
i_template = "OperatorStep {0}(String a, {1} b);\n"
i_null_template = 'OperatorStep {0}Null({1} a);\n'
m_template = ''.join(["public OperatorStep {0}(String a, {1} b) {{\n",
                      "\tc += a + \' {2} \' + {3} + \' \';\n",
                      "\treturn this;\n",
                      "}}\n\n"])
m_null_template = ''.join(["public OperatorStep {0}Null({1} a) {{\n",
                   "\tc += String.valueOf(a) + ' {2} NULL ';\n",
                   "\treturn this;\n",
                   "}}\n\n"])

# define all interfaces
for operator in operators:
    for data_type in data_types:
        # for list types, we need to wrap the data_type in a List<> wrapper
        if operator in list_operators:
            interfaces.write(i_template.format(operator, "List<" + data_type + ">"))
        # for other types, just print them normally. there is a special case for restricted data_types that are only
        # valid for their corresponding operators
        elif data_type in restricted_types and operator in restricted_operators or data_type not in restricted_types:
            interfaces.write(i_template.format(operator, data_type))
interfaces.write(i_template.format('likee', 'String'))

for data_type in data_types:
    for operator in ['eq', 'neq']:
        interfaces.write(i_null_template.format(operator, data_type))

# define all methods
for operator in operators:
    for data_type in data_types:
        # create list types
        if operator in list_operators:
            # we want the raw reference of numeric types, convert other types to strings
            if data_type in numeric_types:
                methods.write(m_template.format(operator, "List<" + data_type +">", operator_map.get(operator), 'b'))
            else:
                methods.write(m_template.format(operator, "List<" + data_type + ">", operator_map.get(operator), 'String.valueOf(b)'))
        # for non list types that are numeric or restricted, we want the raw reference without quotes
        elif data_type in numeric_types or (data_type in restricted_types and operator in restricted_operators):
            methods.write(m_template.format(operator, data_type, operator_map.get(operator), 'b'))
        # the rest of the types should be converted to string types and wrapped in quotes
        elif data_type not in restricted_types:
            methods.write(m_template.format(operator, data_type, operator_map.get(operator), '\'\\\'\' + String.valueOf(b) + \'\\\'\''))
methods.write(m_template.format('likee', 'String', operator_map.get('likee'), '\'\\\'\' + String.valueOf(b) + \'\\\'\''))

for data_type in data_types:
    for operator in {'eq', 'neq'}:
        methods.write(m_null_template.format(operator, data_type, operator_map.get(operator)))