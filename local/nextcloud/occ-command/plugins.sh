#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"
app_dirpath=/var/www/html/apps
plugin_dirname=./plugins

install_plugin()
{
  plugin_filename=$1
  plugin_name=$(basename ${plugin_filename} 2>/dev/null | \
                sed -e 's/.tar.gz$//g' | awk -F '-' '{print $1}')

  if [ -z "${plugin_name}" ]; then
      echo "<${plugin_name}> is empty, exiting..." > /dev/stderr
      return 1
  fi

  if [ ! -f "${plugin_filename}" ]; then
      echo "cannot find <${plugin_filename}>, exiting..." > /dev/stderr
      return 2
  fi

  echo "Extracting the <${plugin_filename}> file..."
  tar -C ${app_dirpath} -xzf ${plugin_filename}
  echo "Installing the plugin <${plugin_name}>..."
  ${occ_cmd} app:enable ${plugin_name}
  echo "The plugin <${plugin_name}> is installed."
  return 0
}

for p in `ls -1 ${plugin_dirname}/*.tar.gz` ; do
  install_plugin ${p}
  if [ $? -ne 0 ]; then
    exit 2;
  fi
done
