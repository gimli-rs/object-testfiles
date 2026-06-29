#!/bin/bash
rcodesign sign \
    --digest sha256 --digest sha1 \
    --binary-identifier base-aarch64 \
    --info-plist-file <(rcodesign debug-create-info-plist --bundle-name base-aarch64 /dev/stdout) \
    --entitlements-xml-file <(rcodesign debug-create-entitlements --get-task-allow /dev/stdout) \
    base-aarch64 base-aarch64-codesign
