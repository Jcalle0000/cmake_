message(STATUS ">>> Loaded CTestCustom.cmake <<<")


# Path to llvm-cov and llvm-profdata — adjust as needed
set(CTEST_COVERAGE_COMMAND "/usr/local/opt/llvm/bin/llvm-cov")
set(CTEST_COVERAGE_COMMAND_MERGE "/usr/local/opt/llvm/bin/llvm-profdata")

# Output directory for coverage report
set(CTEST_COVERAGE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/coverage_html")

# Exclude patterns from coverage report
set(CTEST_CUSTOM_COVERAGE_EXCLUDE
  ".*tests/.*"
  ".*external/.*"
  ".*CMakeFiles.*"
  ".*/usr/.*"
)

# Define the actual commands that CTest runs for coverage analysis
set(CTEST_COVERAGE_COMMAND_ARGS
  bash -c "
    ${CTEST_COVERAGE_COMMAND_MERGE} merge -sparse tests/*.profraw -o coverage.profdata && \
    ${CTEST_COVERAGE_COMMAND} show tests/sum_up -instr-profile=coverage.profdata -format=html -output-dir=${CTEST_COVERAGE_OUTPUT_DIRECTORY}
  "
)
