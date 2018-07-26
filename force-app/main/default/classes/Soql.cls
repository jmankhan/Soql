/**
 *  This file is part of Soql.

    Soql is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Soql is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Soql.  If not, see <https://www.gnu.org/licenses/>.
 */
public class Soql {
    private String q;
    private Soql(String q) {
        this.q = q;
    }

    public List<SObject> execute() {
        System.Savepoint sp = Database.setSavepoint();
        try {
            return Database.query(q);
        } catch(Exception e) {
            System.debug('Error occurred while performing DML operation: ' + e);
            Database.rollback(sp);
        }
        return new List<SObject>();
    }

    public Database.QueryLocator getQueryLocator() {
        return Database.getQueryLocator(q);
    }

    public override String toString() {
        return this.q;
    }
    public interface SelectStep {
        FromStep selectId();
        FromStep selectField(String field);
        FromStep selectFields(List<String> fields);
        //FromStep selectAggregate(String func);
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
            q = 'SELECT Id ';
            return this;
        }

        public FromStep selectField(String field) {
            q = 'SELECT ' + field + ' ';
            return this;
        }

        public FromStep selectFields(List<String> fields) {
            q = 'SELECT ' + String.join(fields, ',') + ' ';
            return this;
        }

        /*
        public FromStep selectAggregate(String func) {
            q = 'SELECT ' + func + ' ';
            return this;
        }
        */

        public WhereStep fromm(String s) {
            q += 'FROM ' + s + ' ';
            return this;
        }

        public TerminalStep wheree(SoqlCondition condition) {
            q += 'WHERE ' + condition.toString();
            return this;
        }

        public OrderStep limitBy(Integer amount) {
            q += 'LIMIT ' + String.valueOf(amount) + ' ';
            return this;
        }

        public FinalStep orderBy(String field, Boolean ascending) {
            q += 'ORDER BY ' + field + (ascending ? ' ASC ' : ' DESC ');
            return this;
        }

        public Soql build() {
            return new Soql(q);
        }
    }
}