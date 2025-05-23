AESD_ASSIGNMENTS_SITE = git@github.com:nc6000/assignments-3-and-later.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_VERSION = master

AESD_ASSIGNMENTS_INSTALL_TARGET = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" -C $(@D) writer
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/writer $(TARGET_DIR)/usr/bin/writer
    $(INSTALL) -D $(@D)/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
    $(INSTALL) -D $(@D)/tester.sh $(TARGET_DIR)/usr/bin/finder-test.sh
    $(INSTALL) -D -m 644 $(@D)/conf/username.txt $(TARGET_DIR)/etc/finder-app/conf/username.txt
    $(INSTALL) -D -m 644 $(@D)/conf/assignment.txt $(TARGET_DIR)/etc/finder-app/conf/assignment.txt
endef

$(eval $(generic-package))
