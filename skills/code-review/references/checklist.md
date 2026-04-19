# Code Review Checklist

Use this checklist when reviewing each diff. Not every item applies to every change — skip categories that are irrelevant.

## Correctness

- [ ] Logic handles edge cases (nulls, empty collections, boundary values)
- [ ] Error paths are handled — no swallowed exceptions or silent failures
- [ ] State mutations are intentional and scoped correctly
- [ ] Concurrent access is safe (if applicable)

## Security

- [ ] No hardcoded secrets, tokens, or credentials
- [ ] User input is validated and sanitized before use
- [ ] SQL queries use parameterized statements (no string interpolation)
- [ ] File paths are validated — no path traversal vulnerabilities
- [ ] Dependencies added are from trusted sources with no known CVEs

## Performance

- [ ] No unnecessary allocations in hot paths
- [ ] Database queries are batched where possible (no N+1)
- [ ] Large collections are paginated or streamed
- [ ] Expensive operations are cached or debounced when appropriate

## Maintainability

- [ ] Functions and variables have clear, descriptive names
- [ ] No duplicated logic that should be extracted
- [ ] Complex logic has explanatory comments
- [ ] Public APIs have sufficient documentation

## Testing

- [ ] New logic has corresponding tests
- [ ] Edge cases are covered in tests
- [ ] Tests are deterministic (no flaky timing or ordering dependencies)
- [ ] Mocks are minimal — prefer real implementations where feasible
