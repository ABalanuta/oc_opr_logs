NAME=oc-opr-logs
VERSION=0.01
MAINTAINER='Artur Balanuta'
WORK_DIR=src
ARCH=all
DEPS := rsyslog

DESCRIPTION='OpenChirp.io OPR logs forwarder'

POSTINSTALL_SCRIPT=deb/post-install.sh
PREINSTALL_SCRIPT=deb/pre-install.sh
POSTUNINSTALL_SCRIPT=deb/post-uninstall.sh

COMMON_FPM_ARGS=\
	--log error \
	-C $(WORK_DIR) \
	--after-install $(POSTINSTALL_SCRIPT) \
	--before-install $(PREINSTALL_SCRIPT) \
	--after-remove $(POSTUNINSTALL_SCRIPT) \
	--name $(NAME) \
	--version $(VERSION) \
	--maintainer $(MAINTAINER) \
	--description $(DESCRIPTION) \
	--config-files /etc/rsyslog.d/40-default-oc-client.conf \
	--verbose

.PHONY: package
package:
	fpm -s dir -t deb -a $(ARCH) $(COMMON_FPM_ARGS) $(foreach dep,$(DEPS),-d $(dep))
	mv $(NAME)_$(VERSION)_*.deb build/
