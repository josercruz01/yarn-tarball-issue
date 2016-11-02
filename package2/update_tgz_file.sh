#!/bin/bash
set -x
cd ../package1
npm pack
cp ../package1/package1-1.0.0.tgz ../package2

