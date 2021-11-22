#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"
app_dirpath=/var/www/html/apps
plugin_dirname=./plugins

download_and_install_plugin()
{
  plugin_url=$1
  plugin_tmp_filename=/tmp/plugin-tmpfile.tar.gz

  echo ">>> downloading plugin from <${plugin_url}>"
  curl --progress-bar -x http://privoxy:8118 -L --output ${plugin_tmp_filename} \
      ${plugin_url}

  plugin_name=$(tar --no-recursion -tzf ${plugin_tmp_filename} 2>/dev/null | sed -e 's@/.*@@' | uniq)

  if [ -z "${plugin_name}" ]; then
      echo "cannot get plugin name from <${plugin_url}>, exiting..." > /dev/stderr
      return 1
  fi

  echo "Extracting the <${plugin_name}> plugin file..."
  tar -C ${app_dirpath} -xzf ${plugin_tmp_filename}

  echo "Installing the plugin <${plugin_name}>..."
  ${occ_cmd} app:enable ${plugin_name}
  echo "The plugin <${plugin_name}> is installed."

  rm ${plugin_tmp_filename}
  return 0
}

#download_and_install_plugin "https://github.com/felixrupp/user_cas/releases/download/1.9.0/user_cas-nextcloud-with-phpcas.tar.gz"
#download_and_install_plugin "https://github.com/nextcloud-releases/calendar/releases/download/v2.3.2/calendar.tar.gz"
#download_and_install_plugin "https://github.com/nextcloud/deck/releases/download/v1.5.0/deck.tar.gz"

${occ_cmd} app:install calendar
${occ_cmd} app:install deck
${occ_cmd} app:install onlyoffice
${occ_cmd} app:install ocdownloader
${occ_cmd} app:install checksum
${occ_cmd} app:install extract
${occ_cmd} app:install metadata
${occ_cmd} app:install workflow_media_converter
${occ_cmd} app:update --all
