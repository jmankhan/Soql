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
        ParenStep paren(List<SoqlCondition> conditions);
        ParenStep paren(SoqlCondition condition);
    }

    public interface OperatorStep {
        ConditionStep andd();
        ConditionStep orr();
        SoqlCondition build();
    }

    public class Builder implements ParenStep, ConditionStep, OperatorStep {
        private String c = '';

        public ConditionStep andd() {
            c += 'And ';
            return this;
        }

        public ConditionStep orr() {
            c += 'Or ';
            return this;
        }

        public ParenStep paren(List<SoqlCondition> nestedConditions) {
            c += '( ';
            for(SoqlCondition condition : nestedConditions) {
                c += condition.toString();
            }
            c += ') ';
            return this;
        }

        public SoqlCondition build() {
            return new SoqlCondition(c);
        }

        public ParenStep paren(SoqlCondition condition) {
            c += '( ' + condition.toString() + ' ) ';
            return this;
        }

    }

}