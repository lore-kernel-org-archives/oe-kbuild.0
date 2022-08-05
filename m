Content-Type: multipart/mixed; boundary="===============4038695380541901375=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/w83627hf.c:109 superio_inb() warn: ignoring unreachable code.
Date: Sat, 06 Aug 2022 06:24:21 +0800
Message-ID: <202208060640.yZKPYyd0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4038695380541901375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9e2f40233670c70c25e0681cb66d50d1e2742829
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-m041-20220804 (https://download.01.org/0day-ci/ar=
chive/20220806/202208060640.yZKPYyd0-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/hwmon/w83627hf.c:109 superio_inb() warn: ignoring unreachable code.
drivers/hwmon/smsc47b397.c:67 superio_enter() warn: ignoring unreachable co=
de.
drivers/hwmon/smsc47b397.c:52 superio_inb() warn: ignoring unreachable code.

Old smatch warnings:
drivers/hwmon/w83627hf.c:126 superio_enter() warn: ignoring unreachable cod=
e.
drivers/hwmon/w83627hf.c:116 superio_select() warn: ignoring unreachable co=
de.
drivers/hwmon/w83627hf.c:102 superio_outb() warn: ignoring unreachable code.
drivers/hwmon/w83627hf.c:135 superio_exit() warn: ignoring unreachable code.
drivers/hwmon/w83627hf.c:1600 w83627hf_read_value() warn: ignoring unreacha=
ble code.
drivers/hwmon/w83627hf.c:1575 w83627hf_set_bank() warn: ignoring unreachabl=
e code.
drivers/hwmon/w83627hf.c:1584 w83627hf_reset_bank() warn: ignoring unreacha=
ble code.
drivers/hwmon/w83627hf.c:1707 w83627hf_write_value() warn: ignoring unreach=
able code.
drivers/hwmon/w83627hf.c:1856 w83627hf_update_device() error: buffer overfl=
ow 'regpwm_627hf' 2 <=3D 2
drivers/hwmon/smsc47b397.c:111 smsc47b397_read_value() warn: ignoring unrea=
chable code.
drivers/hwmon/smsc47b397.c:73 superio_exit() warn: ignoring unreachable cod=
e.
drivers/hwmon/smsc47b397.c:46 superio_outb() warn: ignoring unreachable cod=
e.

vim +109 drivers/hwmon/w83627hf.c

^1da177e4c3f41 drivers/i2c/chips/w83627hf.c Linus Torvalds 2005-04-16  105  =

^1da177e4c3f41 drivers/i2c/chips/w83627hf.c Linus Torvalds 2005-04-16  106 =
 static inline int
b72656dbc49148 drivers/hwmon/w83627hf.c     Jean Delvare   2009-12-09  107 =
 superio_inb(struct w83627hf_sio_data *sio, int reg)
^1da177e4c3f41 drivers/i2c/chips/w83627hf.c Linus Torvalds 2005-04-16  108 =
 {
b72656dbc49148 drivers/hwmon/w83627hf.c     Jean Delvare   2009-12-09 @109 =
 	outb(reg, sio->sioaddr);
b72656dbc49148 drivers/hwmon/w83627hf.c     Jean Delvare   2009-12-09  110 =
 	return inb(sio->sioaddr + 1);
^1da177e4c3f41 drivers/i2c/chips/w83627hf.c Linus Torvalds 2005-04-16  111 =
 }
^1da177e4c3f41 drivers/i2c/chips/w83627hf.c Linus Torvalds 2005-04-16  112  =


:::::: The code at line 109 was first introduced by commit
:::::: b72656dbc491484765776a16eeb55ef2e90efea6 hwmon: (w83627hf) Stop usin=
g globals for I/O port numbers

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Jean Delvare <khali@linux-fr.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4038695380541901375==--

