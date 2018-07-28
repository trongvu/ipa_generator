# IPA Re-generator
Simple script to generate IPA file which is ready for re-singing

# Situation
- You're developing under other name.  
- Apple ID owner does not want to expose distribution certification.  
- You have only development certification.  
- They want to receive only final IPA file for re-sigining, not full xarchive file.  

# How you can do?
- Generate IPA file with development provisioning profile

# Problem
- Uploading could receive *Invalid SwiftSupport* from iTune-Connect

# How to solve?
You might following below steps:  
1. Export xarchive file  
2. Generate development IPA  
3. Re-generate IPA file based on content of xarchive & IPA  
4. Send to customer, they can re-sign with single command  

# Sample
Refer to sample script for demostration  
