# CMake generated Testfile for 
# Source directory: C:/Users/Jack/AppData/Roaming/.emacs.d/elpa/irony-20171018.1550/server/test/elisp
# Build directory: C:/Users/Jack/AppData/Roaming/.emacs.d/elpa/irony-20171018.1550/server/build/test/elisp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(check-irony-el "C:/msys64/usr/bin/emacs.exe" "-Q" "--batch" "-l" "package" "--eval" "(package-initialize)" "--eval" "(unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "C:/Users/Jack/AppData/Roaming/.emacs.d/elpa/irony-20171018.1550/server/test/elisp/irony.el" "-f" "ert-run-tests-batch-and-exit")
set_tests_properties(check-irony-el PROPERTIES  TIMEOUT "15")
add_test(check-irony-iotask-el "C:/msys64/usr/bin/emacs.exe" "-Q" "--batch" "-l" "package" "--eval" "(package-initialize)" "--eval" "(unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "C:/Users/Jack/AppData/Roaming/.emacs.d/elpa/irony-20171018.1550/server/test/elisp/irony-iotask.el" "-f" "ert-run-tests-batch-and-exit")
set_tests_properties(check-irony-iotask-el PROPERTIES  TIMEOUT "15")
add_test(check-irony-cdb-json-el "C:/msys64/usr/bin/emacs.exe" "-Q" "--batch" "-l" "package" "--eval" "(package-initialize)" "--eval" "(unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "C:/Users/Jack/AppData/Roaming/.emacs.d/elpa/irony-20171018.1550/server/test/elisp/irony-cdb-json.el" "-f" "ert-run-tests-batch-and-exit")
set_tests_properties(check-irony-cdb-json-el PROPERTIES  TIMEOUT "15")
