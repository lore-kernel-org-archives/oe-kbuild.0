Content-Type: multipart/mixed; boundary="===============9219340232535932230=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/alteon/acenic.c:1010:17: warning: result of comparison of constant 256 with expression of type 'unsigned char' is always true
Date: Mon, 15 Jun 2020 05:25:55 +0800
Message-ID: <202006150539.8sN3QLuT%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9219340232535932230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: clang-built-linux(a)googlegroups.com
CC: linux-kernel(a)vger.kernel.org
TO: Nathan Chancellor <natechancellor@gmail.com>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b3a9e3b9622ae10064826dccb4f7a52bd88c7407
commit: afe956c577b2d5a3d9834e4424587c1ebcf90c4c kbuild: Enable -Wtautologi=
cal-compare
date:   10 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 weeks ago
config: s390-randconfig-r026-20200614 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project cb5072=
d1877b38c972f95092db2cedbcddb81da6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390-linux-gnu
        git checkout afe956c577b2d5a3d9834e4424587c1ebcf90c4c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
___constant_swab32(x) :                                               ^
include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_swa=
b32'
(((__u32)(x) & (__u32)0x000000ffUL) << 24) |                               =
  ^
In file included from drivers/net/ethernet/alteon/acenic.c:54:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
___constant_swab32(x) :                                               ^
include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swa=
b32'
(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |                               =
  ^
In file included from drivers/net/ethernet/alteon/acenic.c:54:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
___constant_swab32(x) :                                               ^
include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swa=
b32'
(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |                               =
  ^
In file included from drivers/net/ethernet/alteon/acenic.c:54:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
___constant_swab32(x) :                                               ^
include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swa=
b32'
(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
^
In file included from drivers/net/ethernet/alteon/acenic.c:54:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
__fswab32(x))
^
In file included from drivers/net/ethernet/alteon/acenic.c:54:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:503:33: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
__raw_writeb(value, PCI_IOBASE + addr);
~~~~~~~~~~ ^
include/asm-generic/io.h:513:46: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
__raw_writew(cpu_to_le16(value), PCI_IOBASE + addr);
~~~~~~~~~~ ^
include/asm-generic/io.h:523:46: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
__raw_writel(cpu_to_le32(value), PCI_IOBASE + addr);
~~~~~~~~~~ ^
include/asm-generic/io.h:585:20: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
readsb(PCI_IOBASE + addr, buffer, count);
~~~~~~~~~~ ^
include/asm-generic/io.h:593:20: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
readsw(PCI_IOBASE + addr, buffer, count);
~~~~~~~~~~ ^
include/asm-generic/io.h:601:20: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
readsl(PCI_IOBASE + addr, buffer, count);
~~~~~~~~~~ ^
include/asm-generic/io.h:610:21: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
writesb(PCI_IOBASE + addr, buffer, count);
~~~~~~~~~~ ^
include/asm-generic/io.h:619:21: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
writesw(PCI_IOBASE + addr, buffer, count);
~~~~~~~~~~ ^
include/asm-generic/io.h:628:21: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
writesl(PCI_IOBASE + addr, buffer, count);
~~~~~~~~~~ ^
>> drivers/net/ethernet/alteon/acenic.c:1010:17: warning: result of compari=
son of constant 256 with expression of type 'unsigned char' is always true =
[-Wtautological-constant-out-of-range-compare]
if (cache_size !=3D SMP_CACHE_BYTES) {
~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/alteon/acenic.c:1013:18: warning: result of compari=
son of constant 256 with expression of type 'unsigned char' is always false=
 [-Wtautological-constant-out-of-range-compare]
if (cache_size > SMP_CACHE_BYTES)
~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
In file included from drivers/net/ethernet/alteon/acenic.c:49:
In file included from include/linux/module.h:12:
In file included from include/linux/list.h:9:
In file included from include/linux/kernel.h:12:
In file included from include/linux/bitops.h:29:
arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline asm: =
'ni	$0,${1:b}'
"ni     %0,%b1n"
^
arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline asm: =
'oi	$0,${1:b}'
"oi     %0,%b1n"
^
arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline asm: =
'oi	$0,${1:b}'
arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline asm: =
'ni	$0,${1:b}'
"ni     %0,%b1n"
^
arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline asm: =
'ni	$0,${1:b}'
arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline asm: =
'ni	$0,${1:b}'
arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline asm: =
'ni	$0,${1:b}'
22 warnings and 7 errors generated.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dafe956c577b2d5a3d9834e4424587c1ebcf90c4c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout afe956c577b2d5a3d9834e4424587c1ebcf90c4c
vim +1010 drivers/net/ethernet/alteon/acenic.c

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   859  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   860  =

083abbb7dc16b6 drivers/net/ethernet/alteon/acenic.c Bill Pemberton    2012-=
12-03   861  static int ace_init(struct net_device *dev)
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   862  {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   863  	struct ace_private *ap;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   864  	struct ace_regs __iomem *regs;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   865  	struct ace_info *info =3D NULL;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   866  	struct pci_dev *pdev;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   867  	unsigned long myjif;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   868  	u64 tmp_ptr;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   869  	u32 tig_ver, mac1, mac2, tmp, pci_state;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   870  	int board_idx, ecode =3D 0;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   871  	short i;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   872  	unsigned char cache_size;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   873  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   874  	ap =3D netdev_priv(dev);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   875  	regs =3D ap->regs;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   876  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   877  	board_idx =3D ap->board_idx;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   878  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   879  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   880  	 * aman(a)sgi.com - its useful to do a NIC reset here to
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   881  	 * address the `Firmware not running' problem subsequent
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   882  	 * to any crashes involving the NIC
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   883  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   884  	writel(HW_RESET | (HW_RESET << 24), &regs->HostCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   885  	readl(&regs->HostCtrl);		/* PCI write posting */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   886  	udelay(5);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   887  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   888  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   889  	 * Don't access any other registers before this point!
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   890  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   891  #ifdef __BIG_ENDIAN
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   892  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   893  	 * This will most likely need BYTE_SWAP once we switch
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   894  	 * to using __raw_writel()
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   895  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   896  	writel((WORD_SWAP | CLR_INT | ((WORD_SWAP | CLR_INT) << 24)),
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   897  	       &regs->HostCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   898  #else
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   899  	writel((CLR_INT | WORD_SWAP | ((CLR_INT | WORD_SWAP) << 24)),
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   900  	       &regs->HostCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   901  #endif
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   902  	readl(&regs->HostCtrl);		/* PCI write posting */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   903  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   904  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   905  	 * Stop the NIC CPU and clear pending interrupts
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   906  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   907  	writel(readl(&regs->CpuCtrl) | CPU_HALT, &regs->CpuCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   908  	readl(&regs->CpuCtrl);		/* PCI write posting */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   909  	writel(0, &regs->Mb0Lo);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   910  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   911  	tig_ver =3D readl(&regs->HostCtrl) >> 28;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   912  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   913  	switch(tig_ver){
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   914  #ifndef CONFIG_ACENIC_OMIT_TIGON_I
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   915  	case 4:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   916  	case 5:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   917  		printk(KERN_INFO "  Tigon I  (Rev. %i), Firmware: %i.%i.%i, =
",
949b42544a20fb drivers/net/acenic.c                 Jaswinder Singh   2009-=
01-04   918  		       tig_ver, ap->firmware_major, ap->firmware_minor,
949b42544a20fb drivers/net/acenic.c                 Jaswinder Singh   2009-=
01-04   919  		       ap->firmware_fix);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   920  		writel(0, &regs->LocalCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   921  		ap->version =3D 1;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   922  		ap->tx_ring_entries =3D TIGON_I_TX_RING_ENTRIES;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   923  		break;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   924  #endif
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   925  	case 6:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   926  		printk(KERN_INFO "  Tigon II (Rev. %i), Firmware: %i.%i.%i, =
",
949b42544a20fb drivers/net/acenic.c                 Jaswinder Singh   2009-=
01-04   927  		       tig_ver, ap->firmware_major, ap->firmware_minor,
949b42544a20fb drivers/net/acenic.c                 Jaswinder Singh   2009-=
01-04   928  		       ap->firmware_fix);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   929  		writel(readl(&regs->CpuBCtrl) | CPU_HALT, &regs->CpuBCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   930  		readl(&regs->CpuBCtrl);		/* PCI write posting */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   931  		/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   932  		 * The SRAM bank size does _not_ indicate the amount
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   933  		 * of memory on the card, it controls the _bank_ size!
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   934  		 * Ie. a 1MB AceNIC will have two banks of 512KB.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   935  		 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   936  		writel(SRAM_BANK_512K, &regs->LocalCtrl);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   937  		writel(SYNC_SRAM_TIMING, &regs->MiscCfg);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   938  		ap->version =3D 2;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   939  		ap->tx_ring_entries =3D MAX_TX_RING_ENTRIES;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   940  		break;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   941  	default:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   942  		printk(KERN_WARNING "  Unsupported Tigon version detected "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   943  		       "(%i)\n", tig_ver);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   944  		ecode =3D -ENODEV;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   945  		goto init_error;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   946  	}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   947  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   948  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   949  	 * ModeStat _must_ be set after the SRAM settings as this cha=
nge
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   950  	 * seems to corrupt the ModeStat and possible other registers.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   951  	 * The SRAM settings survive resets and setting it to the same
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   952  	 * value a second time works as well. This is what caused the
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   953  	 * `Firmware not running' problem on the Tigon II.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   954  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   955  #ifdef __BIG_ENDIAN
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   956  	writel(ACE_BYTE_SWAP_DMA | ACE_WARN | ACE_FATAL | ACE_BYTE_SW=
AP_BD |
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   957  	       ACE_WORD_SWAP_BD | ACE_NO_JUMBO_FRAG, &regs->ModeStat);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   958  #else
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   959  	writel(ACE_BYTE_SWAP_DMA | ACE_WARN | ACE_FATAL |
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   960  	       ACE_WORD_SWAP_BD | ACE_NO_JUMBO_FRAG, &regs->ModeStat);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   961  #endif
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   962  	readl(&regs->ModeStat);		/* PCI write posting */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   963  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   964  	mac1 =3D 0;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   965  	for(i =3D 0; i < 4; i++) {
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   966  		int t;
6f9d47220eb2d1 drivers/net/acenic.c                 Eric Sesterhenn   2006-=
01-20   967  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   968  		mac1 =3D mac1 << 8;
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   969  		t =3D read_eeprom_byte(dev, 0x8c+i);
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   970  		if (t < 0) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   971  			ecode =3D -EIO;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   972  			goto init_error;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   973  		} else
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   974  			mac1 |=3D (t & 0xff);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   975  	}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   976  	mac2 =3D 0;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   977  	for(i =3D 4; i < 8; i++) {
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   978  		int t;
6f9d47220eb2d1 drivers/net/acenic.c                 Eric Sesterhenn   2006-=
01-20   979  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   980  		mac2 =3D mac2 << 8;
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   981  		t =3D read_eeprom_byte(dev, 0x8c+i);
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   982  		if (t < 0) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   983  			ecode =3D -EIO;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   984  			goto init_error;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   985  		} else
ddfce6bb43c6bf drivers/net/acenic.c                 Stephen Hemminger 2007-=
10-05   986  			mac2 |=3D (t & 0xff);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   987  	}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   988  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   989  	writel(mac1, &regs->MacAddrHi);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   990  	writel(mac2, &regs->MacAddrLo);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   991  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   992  	dev->dev_addr[0] =3D (mac1 >> 8) & 0xff;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   993  	dev->dev_addr[1] =3D mac1 & 0xff;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   994  	dev->dev_addr[2] =3D (mac2 >> 24) & 0xff;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   995  	dev->dev_addr[3] =3D (mac2 >> 16) & 0xff;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   996  	dev->dev_addr[4] =3D (mac2 >> 8) & 0xff;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   997  	dev->dev_addr[5] =3D mac2 & 0xff;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16   998  =

e174961ca1a0b2 drivers/net/acenic.c                 Johannes Berg     2008-=
10-27   999  	printk("MAC: %pM\n", dev->dev_addr);
0795af5729b182 drivers/net/acenic.c                 Joe Perches       2007-=
10-03  1000  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1001  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1002  	 * Looks like this is necessary to deal with on all architect=
ures,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1003  	 * even this %$#%$# N440BX Intel based thing doesn't get it r=
ight.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1004  	 * Ie. having two NICs in the machine, one will have the cache
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1005  	 * line set at boot time, the other will not.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1006  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1007  	pdev =3D ap->pdev;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1008  	pci_read_config_byte(pdev, PCI_CACHE_LINE_SIZE, &cache_size);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1009  	cache_size <<=3D 2;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16 @1010  	if (cache_size !=3D SMP_CACHE_BYTES) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1011  		printk(KERN_INFO "  PCI cache line size set incorrectly "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1012  		       "(%i bytes) by BIOS/FW, ", cache_size);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16 @1013  		if (cache_size > SMP_CACHE_BYTES)
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1014  			printk("expecting %i\n", SMP_CACHE_BYTES);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1015  		else {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1016  			printk("correcting to %i\n", SMP_CACHE_BYTES);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1017  			pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1018  					      SMP_CACHE_BYTES >> 2);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1019  		}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1020  	}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1021  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1022  	pci_state =3D readl(&regs->PciState);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1023  	printk(KERN_INFO "  PCI bus width: %i bits, speed: %iMHz, "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1024  	       "latency: %i clks\n",
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1025  	       	(pci_state & PCI_32BIT) ? 32 : 64,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1026  		(pci_state & PCI_66MHZ) ? 66 : 33,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1027  		ap->pci_latency);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1028  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1029  	/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1030  	 * Set the max DMA transfer size. Seems that for most systems
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1031  	 * the performance is better when no MAX parameter is
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1032  	 * set. However for systems enabling PCI write and invalidate,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1033  	 * DMA writes must be set to the L1 cache line size to get
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1034  	 * optimal performance.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1035  	 *
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1036  	 * The default is now to turn the PCI write and invalidate off
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1037  	 * - that is what Alteon does for NT.
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1038  	 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1039  	tmp =3D READ_CMD_MEM | WRITE_CMD_MEM;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1040  	if (ap->version >=3D 2) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1041  		tmp |=3D (MEM_READ_MULTIPLE | (pci_state & PCI_66MHZ));
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1042  		/*
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1043  		 * Tuning parameters only supported for 8 cards
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1044  		 */
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1045  		if (board_idx =3D=3D BOARD_IDX_OVERFLOW ||
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1046  		    dis_pci_mem_inval[board_idx]) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1047  			if (ap->pci_command & PCI_COMMAND_INVALIDATE) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1048  				ap->pci_command &=3D ~PCI_COMMAND_INVALIDATE;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1049  				pci_write_config_word(pdev, PCI_COMMAND,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1050  						      ap->pci_command);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1051  				printk(KERN_INFO "  Disabling PCI memory "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1052  				       "write and invalidate\n");
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1053  			}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1054  		} else if (ap->pci_command & PCI_COMMAND_INVALIDATE) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1055  			printk(KERN_INFO "  PCI memory write & invalidate "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1056  			       "enabled by BIOS, enabling counter measures\n");
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1057  =

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1058  			switch(SMP_CACHE_BYTES) {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1059  			case 16:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1060  				tmp |=3D DMA_WRITE_MAX_16;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1061  				break;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1062  			case 32:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1063  				tmp |=3D DMA_WRITE_MAX_32;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1064  				break;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1065  			case 64:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1066  				tmp |=3D DMA_WRITE_MAX_64;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1067  				break;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1068  			case 128:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1069  				tmp |=3D DMA_WRITE_MAX_128;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1070  				break;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1071  			default:
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1072  				printk(KERN_INFO "  Cache line size %i not "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1073  				       "supported, PCI write and invalidate "
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1074  				       "disabled\n", SMP_CACHE_BYTES);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1075  				ap->pci_command &=3D ~PCI_COMMAND_INVALIDATE;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1076  				pci_write_config_word(pdev, PCI_COMMAND,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1077  						      ap->pci_command);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1078  			}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1079  		}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1080  	}
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds    2005-=
04-16  1081  =


:::::: The code at line 1010 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9219340232535932230==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
xym9fWGCXbZkmpLTQ+zYmyuN1f8AKgCI10C6AQA=
--===============9219340232535932230==--

