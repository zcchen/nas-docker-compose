#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"
mnt_dir="/mnt"

${occ_cmd} app:enable -f files_external

for d in Public Downloads Videos Pictures Softwares Music; do
  if [ -z "$(${occ_cmd} files_external:list | grep ${d})" ]; then
    echo ">>> seting up the mount point <$d>..."
    mount_id=$(${occ_cmd} files_external:create \
      -c datadir=${mnt_dir}/${d} --output json \
      ${d} local null::null \
      2>/dev/null)
    if [ -n "${mount_id}" ]; then
      ${occ_cmd} files_external:applicable --add-group users ${mount_id}
      ${occ_cmd} files_external:option ${mount_id} enable_sharing true
    else
      echo "--- mount point <${d}> did NOT create correctly."
    fi
  else
    echo ">>> mount point <${d}> is created..."
  fi
done

