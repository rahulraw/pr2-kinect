
SVN=pr2_force_torque_calibration
SVN_URL=https://github.com/pr2-debs/pr2_force_torque_calibration


all: ${SVN}
.PHONY: all

${SVN}:
	svn co ${SVN_URL}

install-dirs:
	mkdir -p ${DESTDIR}/usr/share/pr2-ft
	mkdir -p ${DESTDIR}/usr/bin

install: ${SVN}
	install pr2-ft-config ${DESTDIR}/usr/bin/
	find ${DESTDIR}
	rsync -a --exclude='.svn' ${SVN}/ ${DESTDIR}/usr/share/pr2-ft

clean:
	-rm -rf ${SVN}
