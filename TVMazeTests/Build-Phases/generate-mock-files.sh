# Define output file. Change "${PROJECT_DIR}/${PROJECT_NAME}Tests" to your test's root source folder, if it's not the default name.
OUTPUT_FILE="${PROJECT_DIR}/${PROJECT_NAME}Tests/GeneratedMocks.swift"
echo "Generated Mocks File = ${OUTPUT_FILE}"

# Define input directory. Change "${PROJECT_DIR}/${PROJECT_NAME}" to your project's root source folder, if it's not the default name.
INPUT_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
echo "Mocks Input Directory = ${INPUT_DIR}"

# Generate mock files, include as many input files as you'd like to create mocks for.
"${PODS_ROOT}/Cuckoo/run" generate --testable "${PROJECT_NAME}" \
--output "${OUTPUT_FILE}" \
"${INPUT_DIR}/Shared/Network/Manager/NetworkManager.swift" \
"${INPUT_DIR}/Shared/Network/Session/NetworkSession.swift" \
"${INPUT_DIR}/Shared/Data/LocalStorage/LocalStorage.swift" \
"${INPUT_DIR}/Shows/Data/DataSource/ShowsLocalDataSource.swift"

# ... and so forth, the last line should never end with a backslash

# After running once, locate `GeneratedMocks.swift` and drag it into your Xcode test target group.
