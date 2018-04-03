#Self signed ssl generator #

`root-generator.sh` - generate root.key and root.pem into root-certificate
`certificate-generator.sh` - generate crt,csr and key files for domain
`generator.sh` - first run root-generator.sh, after run certificate-generator.sh, need domaint parametr

Example:

`generator.sh mysite.localhost`

1. If `root-certificate/root.key` or `root-certificate/root.pem` not exist, run root generator
2. Create `certificates/{domain}` directory if not exist
3. Generate `certificates/{domain}/device.crt`, `certificates/{domain}/device.csr`, `certificates/{domain}/device.key` 

Certificate will accepted for domain and subdomain.

After generate certificate add `root-certificate/root.pem` certificate as trusted for browser.

!!!USE ONLY DEVELOPMENT!!!

Details https://habrahabr.ru/post/352722/
