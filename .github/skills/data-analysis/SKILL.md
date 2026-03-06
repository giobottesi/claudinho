---
name: data-analysis
description: "Data analysis specialist. Owns SQL queries, Python pandas workflows, aggregations, trend analysis, cohort comparisons, anomaly detection. Use when: analyzing trends, cohorts, anomalies, correlations, or business metrics."
argument-hint: "What data analysis do you need? (e.g., 'Analyze error frequency by provider')"
user-invocable: true
---

# Data Analysis

Specialized workflow for analyzing data—trends, cohorts, anomalies, correlations, business metrics.

## When to Use

- Aggregate queries (by time, cohort, category)
- Outlier detection & anomaly investigation
- Time-series trends & growth patterns
- Cohort comparisons & segmentation
- Correlation analysis
- Data quality flagging & cleaning

---

## Data Input Format

**Primary**: Direct pastes (CSV, query results, JSON)  
**Secondary**: File uploads for larger datasets  
**Preference**: Fast iteration over exact formatting

---

## Output Style

1. **Story first**: Actionable interpretation, not just numbers
2. **Show work**: Reproducible code you can run yourself
3. **Suggest visuals**: When relevant to the finding
4. **Next questions**: Always suggest 2-3 follow-up angles

---

## Response Approach

- **Transparent logic**: Show step-by-step reasoning
- **Deep context**: For non-obvious patterns
- **Quick answers**: For straightforward queries
- **Assumptions flagged**: Make reasonable guesses but document them
- **Quality-first**: Flag data issues explicitly—gaps, duplication, outliers, type mismatches—before analysis
- **Metric-focused**: Optimize for actionable metrics over vanity stats
- **Time-aware**: Watch for seasonal patterns, week-over-week vs year-over-year, cohort drift
- **Cohort-conscious**: Segment insights by user cohort, time period, or relevant dimension

---

## Tools & Libraries

**Preferred Stack**:
- SQL (query layer)
- Python + pandas (transformation & analysis)
- Matplotlib/Plotly (visualization suggestions)

**Flexibility**: Use the right tool for the question, not the prescribed one.

---

## Common Analysis Patterns

### Time-Series Comparison

**Question**: "What changed between period A and period B?"

**Approach**:
1. Calculate metric for both periods
2. Compute absolute & percent change
3. Break down by cohort/segment
4. Suggest: Is change seasonal? Statistical significance? Compare to baseline?

**Output**: Table + narrative + suggested drill-downs

### Cohort Segmentation

**Question**: "Who are my X users/properties?"

**Approach**:
1. Define cohort criteria (signup date, usage tier, geography, etc.)
2. Compute key metrics per cohort (retention, LTV, engagement)
3. Identify outlier cohorts
4. Suggest: What drives differences? Test hypothesis?

**Output**: Comparison table + interpretation + next questions

### Anomaly Detection

**Question**: "Something looks off. Where's the problem?"

**Approach**:
1. Establish baseline (normal range, seasonal pattern)
2. Identify deviation point (when did it break?)
3. Correlate with events (deployments, external changes)
4. Narrow: By segment? By provider? By time?

**Output**: Root cause hypothesis + evidence + remediation suggestions

---

## Start Here

Provide the data (CSV, JSON, query results) and ask your question. The skill will:
1. Clarify assumptions
2. Outline approach
3. Show reproducible code
4. Explain findings
5. Suggest next steps

**Examples**:
- "Analyze error frequency by service over the last 30 days"
- "Segment entities by creation cohort and compute retention"
- "Find anomalies in data extraction success rates"
