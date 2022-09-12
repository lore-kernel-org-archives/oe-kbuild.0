Content-Type: multipart/mixed; boundary="===============2175712725620568710=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/serial/kl5kusb105.c:520:19: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 12 Sep 2022 11:06:24 +0800
Message-ID: <202209121117.HaZrAXmz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2175712725620568710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/u=
sb/serial/kl5kusb105.c:520:19: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Himadri Pandya <himadrispandya@gmail.com>
CC: Johan Hovold <johan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e78fcce86de0288793a0ef0f6acf37656ee4cf
commit: 71b20b34afc2e709f3bbce516fbfdd9f042b607a USB: serial: kl5kusb105: u=
se usb_control_msg_recv() and usb_control_msg_send()
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20220907 (https://download.01.org/0day-ci/arc=
hive/20220912/202209121117.HaZrAXmz-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df=
49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D71b20b34afc2e709f3bbce516fbfdd9f042b607a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 71b20b34afc2e709f3bbce516fbfdd9f042b607a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/usb/gadget/legacy/inode.c:1616:2: note: '?' condition is true
           DBG (dev, "%s enomem\n", __func__);
           ^
   drivers/usb/gadget/legacy/inode.c:243:2: note: expanded from macro 'DBG'
           xprintk(dev , KERN_DEBUG , fmt , ## args)
           ^
   drivers/usb/gadget/legacy/inode.c:239:2: note: expanded from macro 'xpri=
ntk'
           printk(level "%s: " fmt , shortname , ## args)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/usb/gadget/legacy/inode.c:1616:2: note: '?' condition is true
           DBG (dev, "%s enomem\n", __func__);
           ^
   drivers/usb/gadget/legacy/inode.c:243:2: note: expanded from macro 'DBG'
           xprintk(dev , KERN_DEBUG , fmt , ## args)
           ^
   drivers/usb/gadget/legacy/inode.c:239:2: note: expanded from macro 'xpri=
ntk'
           printk(level "%s: " fmt , shortname , ## args)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/usb/gadget/legacy/inode.c:1616:2: note: Loop condition is false.=
  Exiting loop
           DBG (dev, "%s enomem\n", __func__);
           ^
   drivers/usb/gadget/legacy/inode.c:243:2: note: expanded from macro 'DBG'
           xprintk(dev , KERN_DEBUG , fmt , ## args)
           ^
   drivers/usb/gadget/legacy/inode.c:239:2: note: expanded from macro 'xpri=
ntk'
           printk(level "%s: " fmt , shortname , ## args)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/usb/gadget/legacy/inode.c:1617:2: note: Use of memory after it i=
s freed
           destroy_ep_files (dev);
           ^                 ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/serial/keyspan.c:920:2: warning: Value stored to 'data' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           data =3D urb->transfer_buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:920:2: note: Value stored to 'data' is neve=
r read
           data =3D urb->transfer_buffer;
           ^      ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/keyspan.c:1184:2: warning: Value stored to 'len' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           len =3D 0;
           ^     ~
   drivers/usb/serial/keyspan.c:1184:2: note: Value stored to 'len' is neve=
r read
           len =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/usb/serial/kl5kusb105.c:520:19: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
           priv->line_state =3D line_state;
                            ^ ~~~~~~~~~~
   drivers/usb/serial/kl5kusb105.c:509:2: note: 'line_state' declared witho=
ut an initial value
           unsigned long line_state;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/kl5kusb105.c:511:7: note: Calling 'klsi_105_get_line_=
state'
           rc =3D klsi_105_get_line_state(port, &line_state);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/kl5kusb105.c:185:6: note: Assuming 'rc' is not equal =
to 0
           if (rc) {
               ^~
   drivers/usb/serial/kl5kusb105.c:185:2: note: Taking true branch
           if (rc) {
           ^
   drivers/usb/serial/kl5kusb105.c:186:3: note: Left side of '&&' is true
                   dev_err(&port->dev, "reading line status failed: %d\n", =
rc);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/usb/serial/kl5kusb105.c:186:3: note: Taking true branch
                   dev_err(&port->dev, "reading line status failed: %d\n", =
rc);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/usb/serial/kl5kusb105.c:186:3: note: '?' condition is true
                   dev_err(&port->dev, "reading line status failed: %d\n", =
rc);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/usb/serial/kl5kusb105.c:186:3: note: '?' condition is true
                   dev_err(&port->dev, "reading line status failed: %d\n", =
rc);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/usb/serial/kl5kusb105.c:186:3: note: Loop condition is false.  E=
xiting loop
                   dev_err(&port->dev, "reading line status failed: %d\n", =
rc);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)

vim +520 drivers/usb/serial/kl5kusb105.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  502  =

60b33c133ca0b7 Alan Cox           2011-02-14  503  static int klsi_105_tioc=
mget(struct tty_struct *tty)
^1da177e4c3f41 Linus Torvalds     2005-04-16  504  {
95da310e66ee80 Alan Cox           2008-07-22  505  	struct usb_serial_port =
*port =3D tty->driver_data;
^1da177e4c3f41 Linus Torvalds     2005-04-16  506  	struct klsi_105_private=
 *priv =3D usb_get_serial_port_data(port);
^1da177e4c3f41 Linus Torvalds     2005-04-16  507  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  508  	int rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  509  	unsigned long line_stat=
e;
^1da177e4c3f41 Linus Torvalds     2005-04-16  510  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  511  	rc =3D klsi_105_get_lin=
e_state(port, &line_state);
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  	if (rc < 0) {
194343d9364ea0 Greg Kroah-Hartman 2008-08-20  513  		dev_err(&port->dev,
194343d9364ea0 Greg Kroah-Hartman 2008-08-20  514  			"Reading line control=
 failed (error =3D %d)\n", rc);
^1da177e4c3f41 Linus Torvalds     2005-04-16  515  		/* better return value=
? EAGAIN? */
^1da177e4c3f41 Linus Torvalds     2005-04-16  516  		return rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  517  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  518  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  519  	spin_lock_irqsave(&priv=
->lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16 @520  	priv->line_state =3D li=
ne_state;
^1da177e4c3f41 Linus Torvalds     2005-04-16  521  	spin_unlock_irqrestore(=
&priv->lock, flags);
1ad7604f69ae3c Greg Kroah-Hartman 2012-09-14  522  	dev_dbg(&port->dev, "%s=
 - read line state 0x%lx\n", __func__, line_state);
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  	return (int)line_state;
^1da177e4c3f41 Linus Torvalds     2005-04-16  524  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  525  =


:::::: The code at line 520 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2175712725620568710==--

