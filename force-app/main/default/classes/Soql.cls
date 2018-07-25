public class Soql {
    private String q;
    private Soql(String q) {
        this.q = q;
    }

    public override String toString() {
        return this.q;
    }
    public interface SelectStep {
        FromStep selectId();
        FromStep selectFields(List<String> fields);
        FromStep selectAggregate(String func);
    }
    public interface FromStep {
        WhereStep fromm(String s);
    }
    public interface WhereStep {
        TerminalStep wheree(SoqlCondition conditions);
        OrderStep limitBy(Integer amount);
        FinalStep orderBy(String field, Boolean ascending);
        Soql build();
    }
    public interface LimitStep extends TerminalStep {
        OrderStep limitBy(Integer amount);
        Soql build();
    }
    public interface OrderStep extends TerminalStep {
        FinalStep orderBy(String field, Boolean ascending);
        Soql build();
    }
    public interface TerminalStep {
        OrderStep limitBy(Integer amount);
        FinalStep orderBy(String field, Boolean ascending);
        Soql build();
    }
    public interface FinalStep {
        Soql build();
    }

    public class Builder implements SelectStep, FromStep, WhereStep, LimitStep, OrderStep, FinalStep {
        private String q;
        public FromStep selectId() {
            q = 'Select Id ';
            return this;
        }

        public FromStep selectFields(List<String> fields) {
            q = 'Select ' + String.join(fields, ',') + ' ';
            return this;
        }

        public FromStep selectAggregate(String func) {
            q = 'Select ' + func + ' ';
            return this;
        }

        public WhereStep fromm(String s) {
            q += 'From ' + s + ' ';
            return this;
        }

        public TerminalStep wheree(SoqlCondition condition) {
            q += 'Where ' + condition.toString();
            return this;
        }

        public OrderStep limitBy(Integer amount) {
            q += 'Limit ' + String.valueOf(amount) + ' ';
            return this;
        }

        public FinalStep orderBy(String field, Boolean ascending) {
            q += 'Order By ' + field + (ascending ? ' ASC ' : ' DESC ');
            return this;
        }

        public Soql build() {
            return new Soql(q);
        }
    }
}