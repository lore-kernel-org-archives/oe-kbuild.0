Content-Type: multipart/mixed; boundary="===============2864255593964625369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/syscall.c:75 __do_sys_pciconfig_read() warn: ignoring unreachable code.
Date: Tue, 29 Mar 2022 13:31:12 +0800
Message-ID: <202203291326.byMfeBmk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2864255593964625369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: e58a41c2226847fb1446f3942dc1b55af8acfe02 csky: uaccess.h: Coding co=
nvention with asm generic
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: csky-randconfig-m031-20220327 (https://download.01.org/0day-ci/arch=
ive/20220329/202203291326.byMfeBmk-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pci/syscall.c:75 __do_sys_pciconfig_read() warn: ignoring unreachab=
le code.
drivers/pci/syscall.c:75 __do_sys_pciconfig_read() warn: ignoring unreachab=
le code.
drivers/pci/proc.c:73 proc_bus_pci_read() warn: ignoring unreachable code.

Old smatch warnings:
drivers/pci/syscall.c:78 __do_sys_pciconfig_read() warn: ignoring unreachab=
le code.
drivers/pci/syscall.c:78 __do_sys_pciconfig_read() warn: ignoring unreachab=
le code.
arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized sy=
mbol 'retval'.
drivers/pci/proc.c:82 proc_bus_pci_read() warn: ignoring unreachable code.
drivers/pci/proc.c:91 proc_bus_pci_read() warn: ignoring unreachable code.
arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized sy=
mbol 'retval'.

vim +75 drivers/pci/syscall.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  14  =

c4ea37c26a691a Heiko Carstens  2009-01-14  15  SYSCALL_DEFINE5(pciconfig_re=
ad, unsigned long, bus, unsigned long, dfn,
c4ea37c26a691a Heiko Carstens  2009-01-14  16  		unsigned long, off, unsign=
ed long, len, void __user *, buf)
^1da177e4c3f41 Linus Torvalds  2005-04-16  17  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  18  	struct pci_dev *dev;
^1da177e4c3f41 Linus Torvalds  2005-04-16  19  	u8 byte;
^1da177e4c3f41 Linus Torvalds  2005-04-16  20  	u16 word;
^1da177e4c3f41 Linus Torvalds  2005-04-16  21  	u32 dword;
e4585da22ad04a Alan Cox        2007-04-23  22  	long err;
ef9e4005cbaf02 Heiner Kallweit 2021-01-24  23  	int cfg_ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  24  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  25  	if (!capable(CAP_SYS_ADMIN))
e4585da22ad04a Alan Cox        2007-04-23  26  		return -EPERM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  27  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  28  	err =3D -ENODEV;
39c9465204e8f4 Sinan Kaya      2017-12-19  29  	dev =3D pci_get_domain_bus_=
and_slot(0, bus, dfn);
^1da177e4c3f41 Linus Torvalds  2005-04-16  30  	if (!dev)
^1da177e4c3f41 Linus Torvalds  2005-04-16  31  		goto error;
^1da177e4c3f41 Linus Torvalds  2005-04-16  32  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  33  	switch (len) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  34  	case 1:
e04b0ea2e0f9c1 Brian King      2005-09-27  35  		cfg_ret =3D pci_user_read_=
config_byte(dev, off, &byte);
^1da177e4c3f41 Linus Torvalds  2005-04-16  36  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  37  	case 2:
e04b0ea2e0f9c1 Brian King      2005-09-27  38  		cfg_ret =3D pci_user_read_=
config_word(dev, off, &word);
^1da177e4c3f41 Linus Torvalds  2005-04-16  39  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  40  	case 4:
e04b0ea2e0f9c1 Brian King      2005-09-27  41  		cfg_ret =3D pci_user_read_=
config_dword(dev, off, &dword);
^1da177e4c3f41 Linus Torvalds  2005-04-16  42  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  43  	default:
^1da177e4c3f41 Linus Torvalds  2005-04-16  44  		err =3D -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  45  		goto error;
f7625980f5820e Bjorn Helgaas   2013-11-14  46  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  47  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  48  	err =3D -EIO;
ef9e4005cbaf02 Heiner Kallweit 2021-01-24  49  	if (cfg_ret)
^1da177e4c3f41 Linus Torvalds  2005-04-16  50  		goto error;
^1da177e4c3f41 Linus Torvalds  2005-04-16  51  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  52  	switch (len) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  53  	case 1:
^1da177e4c3f41 Linus Torvalds  2005-04-16  54  		err =3D put_user(byte, (un=
signed char __user *)buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  55  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  56  	case 2:
^1da177e4c3f41 Linus Torvalds  2005-04-16  57  		err =3D put_user(word, (un=
signed short __user *)buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  58  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  59  	case 4:
^1da177e4c3f41 Linus Torvalds  2005-04-16  60  		err =3D put_user(dword, (u=
nsigned int __user *)buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  61  		break;
e4585da22ad04a Alan Cox        2007-04-23  62  	}
e4585da22ad04a Alan Cox        2007-04-23  63  	pci_dev_put(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  64  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  65  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  66  error:
^1da177e4c3f41 Linus Torvalds  2005-04-16  67  	/* ??? XFree86 doesn't even=
 check the return value.  They
^1da177e4c3f41 Linus Torvalds  2005-04-16  68  	   just look for 0xffffffff=
 in the output, since that's what
^1da177e4c3f41 Linus Torvalds  2005-04-16  69  	   they get instead of a ma=
chine check on x86.  */
^1da177e4c3f41 Linus Torvalds  2005-04-16  70  	switch (len) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  71  	case 1:
^1da177e4c3f41 Linus Torvalds  2005-04-16  72  		put_user(-1, (unsigned cha=
r __user *)buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  73  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  74  	case 2:
^1da177e4c3f41 Linus Torvalds  2005-04-16 @75  		put_user(-1, (unsigned sho=
rt __user *)buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  76  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  77  	case 4:
^1da177e4c3f41 Linus Torvalds  2005-04-16  78  		put_user(-1, (unsigned int=
 __user *)buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  		break;
e4585da22ad04a Alan Cox        2007-04-23  80  	}
e4585da22ad04a Alan Cox        2007-04-23  81  	pci_dev_put(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  82  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  83  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  84  =


:::::: The code at line 75 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2864255593964625369==--

