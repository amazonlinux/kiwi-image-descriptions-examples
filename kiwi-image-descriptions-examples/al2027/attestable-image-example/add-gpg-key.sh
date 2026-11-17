# Add the AL2027 public key to the kiwi build repository
repo_file=$1
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-amazon-linux-2027" >> ${repo_file}
