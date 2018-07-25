public class SoqlCondition {
    private String condition;

    private SoqlCondition(String condition) {
        this.condition = condition;
    }

    public override String toString() {
        return this.condition;
    }

    public interface ParenStep {
        ConditionStep andd();
        ConditionStep orr();
        SoqlCondition build();
    }

    public interface ConditionStep {
//        ParenStep paren(List<SoqlCondition> conditions);
        ParenStep paren(SoqlCondition condition);

        OperatorStep eq(String a, Boolean b);
        OperatorStep eq(String a, Date b);
        OperatorStep eq(String a, Datetime b);
        OperatorStep eq(String a, Decimal b);
        OperatorStep eq(String a, Double b);
        OperatorStep eq(String a, Id b);
        OperatorStep eq(String a, Integer b);
        OperatorStep eq(String a, Long b);
        OperatorStep eq(String a, Object b);
        OperatorStep eq(String a, String b);
        OperatorStep eq(String a, Time b);
        OperatorStep neq(String a, Boolean b);
        OperatorStep neq(String a, Date b);
        OperatorStep neq(String a, Datetime b);
        OperatorStep neq(String a, Decimal b);
        OperatorStep neq(String a, Double b);
        OperatorStep neq(String a, Id b);
        OperatorStep neq(String a, Integer b);
        OperatorStep neq(String a, Long b);
        OperatorStep neq(String a, Object b);
        OperatorStep neq(String a, String b);
        OperatorStep neq(String a, Time b);
        OperatorStep le(String a, Date b);
        OperatorStep le(String a, Datetime b);
        OperatorStep le(String a, Decimal b);
        OperatorStep le(String a, Double b);
        OperatorStep le(String a, Integer b);
        OperatorStep le(String a, Long b);
        OperatorStep le(String a, String b);
        OperatorStep le(String a, Time b);
        OperatorStep lt(String a, Date b);
        OperatorStep lt(String a, Datetime b);
        OperatorStep lt(String a, Decimal b);
        OperatorStep lt(String a, Double b);
        OperatorStep lt(String a, Integer b);
        OperatorStep lt(String a, Long b);
        OperatorStep lt(String a, String b);
        OperatorStep lt(String a, Time b);
        OperatorStep gt(String a, Date b);
        OperatorStep gt(String a, Datetime b);
        OperatorStep gt(String a, Decimal b);
        OperatorStep gt(String a, Double b);
        OperatorStep gt(String a, Integer b);
        OperatorStep gt(String a, Long b);
        OperatorStep gt(String a, String b);
        OperatorStep gt(String a, Time b);
        OperatorStep ge(String a, Date b);
        OperatorStep ge(String a, Datetime b);
        OperatorStep ge(String a, Decimal b);
        OperatorStep ge(String a, Double b);
        OperatorStep ge(String a, Integer b);
        OperatorStep ge(String a, Long b);
        OperatorStep ge(String a, String b);
        OperatorStep ge(String a, Time b);
        OperatorStep inn(String a, List<Boolean> b);
        OperatorStep inn(String a, List<Date> b);
        OperatorStep inn(String a, List<Datetime> b);
        OperatorStep inn(String a, List<Decimal> b);
        OperatorStep inn(String a, List<Double> b);
        OperatorStep inn(String a, List<Id> b);
        OperatorStep inn(String a, List<Integer> b);
        OperatorStep inn(String a, List<Long> b);
        OperatorStep inn(String a, List<Object> b);
        OperatorStep inn(String a, List<String> b);
        OperatorStep inn(String a, List<Time> b);
        OperatorStep ninn(String a, List<Boolean> b);
        OperatorStep ninn(String a, List<Date> b);
        OperatorStep ninn(String a, List<Datetime> b);
        OperatorStep ninn(String a, List<Decimal> b);
        OperatorStep ninn(String a, List<Double> b);
        OperatorStep ninn(String a, List<Id> b);
        OperatorStep ninn(String a, List<Integer> b);
        OperatorStep ninn(String a, List<Long> b);
        OperatorStep ninn(String a, List<Object> b);
        OperatorStep ninn(String a, List<String> b);
        OperatorStep ninn(String a, List<Time> b);
        OperatorStep inc(String a, List<Boolean> b);
        OperatorStep inc(String a, List<Date> b);
        OperatorStep inc(String a, List<Datetime> b);
        OperatorStep inc(String a, List<Decimal> b);
        OperatorStep inc(String a, List<Double> b);
        OperatorStep inc(String a, List<Id> b);
        OperatorStep inc(String a, List<Integer> b);
        OperatorStep inc(String a, List<Long> b);
        OperatorStep inc(String a, List<Object> b);
        OperatorStep inc(String a, List<String> b);
        OperatorStep inc(String a, List<Time> b);
        OperatorStep exc(String a, List<Boolean> b);
        OperatorStep exc(String a, List<Date> b);
        OperatorStep exc(String a, List<Datetime> b);
        OperatorStep exc(String a, List<Decimal> b);
        OperatorStep exc(String a, List<Double> b);
        OperatorStep exc(String a, List<Id> b);
        OperatorStep exc(String a, List<Integer> b);
        OperatorStep exc(String a, List<Long> b);
        OperatorStep exc(String a, List<Object> b);
        OperatorStep exc(String a, List<String> b);
        OperatorStep exc(String a, List<Time> b);
        OperatorStep likee(String a, String b);
        OperatorStep eqNull(Boolean a);
        OperatorStep neqNull(Boolean a);
        OperatorStep eqNull(Date a);
        OperatorStep neqNull(Date a);
        OperatorStep eqNull(Datetime a);
        OperatorStep neqNull(Datetime a);
        OperatorStep eqNull(Decimal a);
        OperatorStep neqNull(Decimal a);
        OperatorStep eqNull(Double a);
        OperatorStep neqNull(Double a);
        OperatorStep eqNull(Id a);
        OperatorStep neqNull(Id a);
        OperatorStep eqNull(Integer a);
        OperatorStep neqNull(Integer a);
        OperatorStep eqNull(Long a);
        OperatorStep neqNull(Long a);
        OperatorStep eqNull(Object a);
        OperatorStep neqNull(Object a);
        OperatorStep eqNull(String a);
        OperatorStep neqNull(String a);
        OperatorStep eqNull(Time a);
        OperatorStep neqNull(Time a);
    }

    public interface OperatorStep {
        ConditionStep andd();
        ConditionStep orr();
        SoqlCondition build();
    }

    public class Builder implements ParenStep, ConditionStep, OperatorStep {
        private String c = '';

        public ConditionStep andd() {
            c += 'AND ';
            return this;
        }

        public ConditionStep orr() {
            c += 'OR ';
            return this;
        }

        /* Consider, {eq(a, b), eq(a, b)}. although permissible, is not valid.
        * Comment this out until a solution is resolved
        public ParenStep paren(List<SoqlCondition> nestedConditions) {
            c += '( ';
            for (SoqlCondition condition : nestedConditions) {
                c += condition.toString();
            }
            c += ') ';
            return this;
        }
        */

        public ParenStep paren(SoqlCondition condition) {
            c += '( ' + condition.toString() + ' ) ';
            return this;
        }

        public SoqlCondition build() {
            return new SoqlCondition(c);
        }
        public OperatorStep eq(String a, Boolean b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, Date b) {
            c += a + ' = ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep eq(String a, Datetime b) {
            c += a + ' = ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep eq(String a, Decimal b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, Double b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, Id b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, Integer b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, Long b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, Object b) {
            c += a + ' = ' + b + ' ';
            return this;
        }

        public OperatorStep eq(String a, String b) {
            c += a + ' = ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep eq(String a, Time b) {
            c += a + ' = ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep neq(String a, Boolean b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, Date b) {
            c += a + ' != ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep neq(String a, Datetime b) {
            c += a + ' != ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep neq(String a, Decimal b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, Double b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, Id b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, Integer b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, Long b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, Object b) {
            c += a + ' != ' + b + ' ';
            return this;
        }

        public OperatorStep neq(String a, String b) {
            c += a + ' != ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep neq(String a, Time b) {
            c += a + ' != ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep le(String a, Date b) {
            c += a + ' <= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep le(String a, Datetime b) {
            c += a + ' <= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep le(String a, Decimal b) {
            c += a + ' <= ' + b + ' ';
            return this;
        }

        public OperatorStep le(String a, Double b) {
            c += a + ' <= ' + b + ' ';
            return this;
        }

        public OperatorStep le(String a, Integer b) {
            c += a + ' <= ' + b + ' ';
            return this;
        }

        public OperatorStep le(String a, Long b) {
            c += a + ' <= ' + b + ' ';
            return this;
        }

        public OperatorStep le(String a, String b) {
            c += a + ' <= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep le(String a, Time b) {
            c += a + ' <= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep lt(String a, Date b) {
            c += a + ' < ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep lt(String a, Datetime b) {
            c += a + ' < ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep lt(String a, Decimal b) {
            c += a + ' < ' + b + ' ';
            return this;
        }

        public OperatorStep lt(String a, Double b) {
            c += a + ' < ' + b + ' ';
            return this;
        }

        public OperatorStep lt(String a, Integer b) {
            c += a + ' < ' + b + ' ';
            return this;
        }

        public OperatorStep lt(String a, Long b) {
            c += a + ' < ' + b + ' ';
            return this;
        }

        public OperatorStep lt(String a, String b) {
            c += a + ' < ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep lt(String a, Time b) {
            c += a + ' < ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep gt(String a, Date b) {
            c += a + ' > ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep gt(String a, Datetime b) {
            c += a + ' > ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep gt(String a, Decimal b) {
            c += a + ' > ' + b + ' ';
            return this;
        }

        public OperatorStep gt(String a, Double b) {
            c += a + ' > ' + b + ' ';
            return this;
        }

        public OperatorStep gt(String a, Integer b) {
            c += a + ' > ' + b + ' ';
            return this;
        }

        public OperatorStep gt(String a, Long b) {
            c += a + ' > ' + b + ' ';
            return this;
        }

        public OperatorStep gt(String a, String b) {
            c += a + ' > ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep gt(String a, Time b) {
            c += a + ' > ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep ge(String a, Date b) {
            c += a + ' >= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep ge(String a, Datetime b) {
            c += a + ' >= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep ge(String a, Decimal b) {
            c += a + ' >= ' + b + ' ';
            return this;
        }

        public OperatorStep ge(String a, Double b) {
            c += a + ' >= ' + b + ' ';
            return this;
        }

        public OperatorStep ge(String a, Integer b) {
            c += a + ' >= ' + b + ' ';
            return this;
        }

        public OperatorStep ge(String a, Long b) {
            c += a + ' >= ' + b + ' ';
            return this;
        }

        public OperatorStep ge(String a, String b) {
            c += a + ' >= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep ge(String a, Time b) {
            c += a + ' >= ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Boolean> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Date> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Datetime> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Decimal> b) {
            c += a + ' IN ' + b + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Double> b) {
            c += a + ' IN ' + b + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Id> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Integer> b) {
            c += a + ' IN ' + b + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Long> b) {
            c += a + ' IN ' + b + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Object> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<String> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inn(String a, List<Time> b) {
            c += a + ' IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Boolean> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Date> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Datetime> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Decimal> b) {
            c += a + ' NOT IN ' + b + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Double> b) {
            c += a + ' NOT IN ' + b + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Id> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Integer> b) {
            c += a + ' NOT IN ' + b + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Long> b) {
            c += a + ' NOT IN ' + b + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Object> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<String> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep ninn(String a, List<Time> b) {
            c += a + ' NOT IN ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Boolean> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Date> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Datetime> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Decimal> b) {
            c += a + ' INCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Double> b) {
            c += a + ' INCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Id> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Integer> b) {
            c += a + ' INCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Long> b) {
            c += a + ' INCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Object> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<String> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep inc(String a, List<Time> b) {
            c += a + ' INCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Boolean> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Date> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Datetime> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Decimal> b) {
            c += a + ' EXCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Double> b) {
            c += a + ' EXCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Id> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Integer> b) {
            c += a + ' EXCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Long> b) {
            c += a + ' EXCLUDES ' + b + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Object> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<String> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep exc(String a, List<Time> b) {
            c += a + ' EXCLUDES ' + String.valueOf(b) + ' ';
            return this;
        }

        public OperatorStep likee(String a, String b) {
            c += a + ' LIKE ' + '\'' + String.valueOf(b) + '\'' + ' ';
            return this;
        }

        public OperatorStep neqNull(Boolean a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Boolean a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Date a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Date a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Datetime a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Datetime a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Decimal a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Decimal a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Double a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Double a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Id a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Id a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Integer a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Integer a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Long a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Long a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Object a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Object a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(String a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(String a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }

        public OperatorStep neqNull(Time a) {
            c += String.valueOf(a) + ' != NULL ';
            return this;
        }

        public OperatorStep eqNull(Time a) {
            c += String.valueOf(a) + ' = NULL ';
            return this;
        }
    }
}