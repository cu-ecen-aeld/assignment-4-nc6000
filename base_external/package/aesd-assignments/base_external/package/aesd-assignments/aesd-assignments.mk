AESD_ASSIGNMENTS_SITE = git@github.com:nc6000/assignment-3-and-later.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_VERSION = master
AESD_ASSIGNMENTS_DEPENDENCIES = 

AESD_ASSIGNMENTS_CONF_DIR = $(PKG_INSTALL_DIR)/etc/finder-app/conf

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D) CC=$(TARGET_CC)
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Create config directory
	mkdir -p $(AESD_ASSIGNMENTS_CONF_DIR)
	# Copy conf files
	cp -r $(@D)/conf/* $(AESD_ASSIGNMENTS_CONF_DIR)

	# Copy writer, tester, finder scripts and binaries to /usr/bin
	install -D -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/writer
	install -D -m 0755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/tester.sh
	install -D -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
endef

$(eval $(generic-package))
