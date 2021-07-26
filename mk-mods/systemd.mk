current_dir := $(notdir $(CURDIR))

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
project_dir := $(dir $(mkfile_path))
systemd_dir := $(abspath $(project_dir)/systemd/)

service_template = $(abspath $(systemd_dir)/nas.service)
service_name = nas-$(current_dir)
service_filename = $(service_name).service


$(service_filename):
	sed $(service_template) \
		-e 's#@MOD_NAME@#$(current_dir)#g' \
		-e 's#@USER@#$(shell id -un)#g' \
		-e 's#@ABSOLUTED_PATH@#$(CURDIR)#g' > $@

.PHONY: $(service_filename)/install
$(service_filename)/install: $(service_filename)
	install -p -D -m 0644 $< /etc/systemd/system/$<
	systemctl daemon-reload
	systemctl enable $(service_name)

.PHONY: $(service_filename)/clean
$(service_filename)/clean:
	-rm $(service_filename)

.PHONY: $(service_filename)/uninstall
$(service_filename)/uninstall:
	-rm /etc/systemd/system/$(service_filename)
	systemctl daemon-reload
	systemctl disable $(service_name)
