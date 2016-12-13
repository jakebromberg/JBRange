**JBRange: Enumerate over ranges in Objective-C like you would in Swift**

In which we abuse NSNumber to get a for-in enumeration over ranges of unsigned integers. JBRange is relatively fast, only about three times slower than writing a C-style for-loop over unsigned integers within the same range. See the tests for benchmark comparisons.
