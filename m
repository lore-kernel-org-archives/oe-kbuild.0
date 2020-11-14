Content-Type: multipart/mixed; boundary="===============3191786123167444625=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/clk-xgene.c:419:33: sparse: expected void
Date: Sat, 14 Nov 2020 14:28:13 +0800
Message-ID: <202011141406.bsvSTTC6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3191786123167444625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f01c30de86f1047e9bae1b1b1417b0ce8dcd15b1
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk =
framework to be selectable
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: openrisc-randconfig-s031-20201113 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-107-gaf3512a6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbbd7ffdbef6888459f301c5889f3b14ada38b913
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/clk/clk-xgene.c:419:33: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *addr @@     got void =
[noderef] <asn:2> *[assigned] csr_reg @@
>> drivers/clk/clk-xgene.c:419:33: sparse:     expected void *addr
   drivers/clk/clk-xgene.c:419:33: sparse:     got void [noderef] <asn:2> *=
[assigned] csr_reg
   drivers/clk/clk-xgene.c:735:35: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *addr @@     got void =
[noderef] <asn:2> *[addressable] [assigned] csr_reg @@
   drivers/clk/clk-xgene.c:735:35: sparse:     expected void *addr
   drivers/clk/clk-xgene.c:735:35: sparse:     got void [noderef] <asn:2> *=
[addressable] [assigned] csr_reg
   drivers/clk/clk-xgene.c:737:35: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *addr @@     got void =
[noderef] <asn:2> *[addressable] [assigned] divider_reg @@
   drivers/clk/clk-xgene.c:737:35: sparse:     expected void *addr
   drivers/clk/clk-xgene.c:737:35: sparse:     got void [noderef] <asn:2> *=
[addressable] [assigned] divider_reg
   drivers/clk/clk-xgene.c: note: in included file (through arch/openrisc/i=
nclude/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   drivers/clk/clk-xgene.c:444:12: sparse: sparse: context imbalance in 'xg=
ene_clk_enable' - different lock contexts for basic block
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   drivers/clk/clk-xgene.c:510:9: sparse: sparse: context imbalance in 'xge=
ne_clk_disable' - different lock contexts for basic block
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   drivers/clk/clk-xgene.c:594:9: sparse: sparse: context imbalance in 'xge=
ne_clk_set_rate' - different lock contexts for basic block
--
   drivers/clk/bcm/clk-kona-setup.c:764:20: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void *addr @@     =
got void [noderef] <asn:2> *base @@
>> drivers/clk/bcm/clk-kona-setup.c:764:20: sparse:     expected void *addr
   drivers/clk/bcm/clk-kona-setup.c:764:20: sparse:     got void [noderef] =
<asn:2> *base
--
   drivers/clk/bcm/clk-iproc-armpll.c:280:20: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *addr @@   =
  got void [noderef] <asn:2> *base @@
>> drivers/clk/bcm/clk-iproc-armpll.c:280:20: sparse:     expected void *ad=
dr
   drivers/clk/bcm/clk-iproc-armpll.c:280:20: sparse:     got void [noderef=
] <asn:2> *base
   drivers/clk/bcm/clk-iproc-armpll.c: note: in included file (through arch=
/openrisc/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
--
   drivers/clk/bcm/clk-iproc-pll.c:849:28: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void *addr @@     g=
ot void [noderef] <asn:2> *status_base @@
>> drivers/clk/bcm/clk-iproc-pll.c:849:28: sparse:     expected void *addr
   drivers/clk/bcm/clk-iproc-pll.c:849:28: sparse:     got void [noderef] <=
asn:2> *status_base
   drivers/clk/bcm/clk-iproc-pll.c:853:28: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void *addr @@     g=
ot void [noderef] <asn:2> *asiu_base @@
   drivers/clk/bcm/clk-iproc-pll.c:853:28: sparse:     expected void *addr
   drivers/clk/bcm/clk-iproc-pll.c:853:28: sparse:     got void [noderef] <=
asn:2> *asiu_base
   drivers/clk/bcm/clk-iproc-pll.c:857:28: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void *addr @@     g=
ot void [noderef] <asn:2> *pwr_base @@
   drivers/clk/bcm/clk-iproc-pll.c:857:28: sparse:     expected void *addr
   drivers/clk/bcm/clk-iproc-pll.c:857:28: sparse:     got void [noderef] <=
asn:2> *pwr_base
   drivers/clk/bcm/clk-iproc-pll.c:859:20: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void *addr @@     g=
ot void [noderef] <asn:2> *control_base @@
   drivers/clk/bcm/clk-iproc-pll.c:859:20: sparse:     expected void *addr
   drivers/clk/bcm/clk-iproc-pll.c:859:20: sparse:     got void [noderef] <=
asn:2> *control_base
   drivers/clk/bcm/clk-iproc-pll.c: note: in included file (through arch/op=
enrisc/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
--
   drivers/clk/bcm/clk-iproc-asiu.c:258:21: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void *addr @@     =
got void [noderef] <asn:2> *gate_base @@
>> drivers/clk/bcm/clk-iproc-asiu.c:258:21: sparse:     expected void *addr
   drivers/clk/bcm/clk-iproc-asiu.c:258:21: sparse:     got void [noderef] =
<asn:2> *gate_base
   drivers/clk/bcm/clk-iproc-asiu.c:261:21: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void *addr @@     =
got void [noderef] <asn:2> *div_base @@
   drivers/clk/bcm/clk-iproc-asiu.c:261:21: sparse:     expected void *addr
   drivers/clk/bcm/clk-iproc-asiu.c:261:21: sparse:     got void [noderef] =
<asn:2> *div_base
   drivers/clk/bcm/clk-iproc-asiu.c: note: in included file (through arch/o=
penrisc/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
--
   drivers/clk/mediatek/clk-mt8173.c:1093:25: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *addr @@   =
  got void [noderef] <asn:2> *[assigned] base @@
>> drivers/clk/mediatek/clk-mt8173.c:1093:25: sparse:     expected void *ad=
dr
   drivers/clk/mediatek/clk-mt8173.c:1093:25: sparse:     got void [noderef=
] <asn:2> *[assigned] base
--
   drivers/video/fbdev/imxfb.c:1051:20: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *regs @@
>> drivers/video/fbdev/imxfb.c:1051:20: sparse:     expected void *addr
   drivers/video/fbdev/imxfb.c:1051:20: sparse:     got void [noderef] <asn=
:2> *regs
   drivers/video/fbdev/imxfb.c:1081:20: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *regs @@
   drivers/video/fbdev/imxfb.c:1081:20: sparse:     expected void *addr
   drivers/video/fbdev/imxfb.c:1081:20: sparse:     got void [noderef] <asn=
:2> *regs
   drivers/video/fbdev/imxfb.c: note: in included file (through arch/openri=
sc/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]

vim +419 drivers/clk/clk-xgene.c

1a85b50bef13b44 Hoan Tran   2016-09-12  377  =

1a85b50bef13b44 Hoan Tran   2016-09-12  378  static void xgene_pmdclk_init(=
struct device_node *np)
1a85b50bef13b44 Hoan Tran   2016-09-12  379  {
1a85b50bef13b44 Hoan Tran   2016-09-12  380  	const char *clk_name =3D np->=
full_name;
1a85b50bef13b44 Hoan Tran   2016-09-12  381  	void __iomem *csr_reg;
1a85b50bef13b44 Hoan Tran   2016-09-12  382  	struct resource res;
1a85b50bef13b44 Hoan Tran   2016-09-12  383  	struct clk *clk;
1a85b50bef13b44 Hoan Tran   2016-09-12  384  	u64 denom;
1a85b50bef13b44 Hoan Tran   2016-09-12  385  	u32 flags =3D 0;
1a85b50bef13b44 Hoan Tran   2016-09-12  386  	int rc;
1a85b50bef13b44 Hoan Tran   2016-09-12  387  =

1a85b50bef13b44 Hoan Tran   2016-09-12  388  	/* Check if the entry is disa=
bled */
1a85b50bef13b44 Hoan Tran   2016-09-12  389  	if (!of_device_is_available(n=
p))
1a85b50bef13b44 Hoan Tran   2016-09-12  390  		return;
1a85b50bef13b44 Hoan Tran   2016-09-12  391  =

1a85b50bef13b44 Hoan Tran   2016-09-12  392  	/* Parse the DTS register for=
 resource */
1a85b50bef13b44 Hoan Tran   2016-09-12  393  	rc =3D of_address_to_resource=
(np, 0, &res);
1a85b50bef13b44 Hoan Tran   2016-09-12  394  	if (rc !=3D 0) {
1667393126d7c51 Rob Herring 2017-07-18  395  		pr_err("no DTS register for =
%pOF\n", np);
1a85b50bef13b44 Hoan Tran   2016-09-12  396  		return;
1a85b50bef13b44 Hoan Tran   2016-09-12  397  	}
1a85b50bef13b44 Hoan Tran   2016-09-12  398  	csr_reg =3D of_iomap(np, 0);
1a85b50bef13b44 Hoan Tran   2016-09-12  399  	if (!csr_reg) {
1667393126d7c51 Rob Herring 2017-07-18  400  		pr_err("Unable to map resour=
ce for %pOF\n", np);
1a85b50bef13b44 Hoan Tran   2016-09-12  401  		return;
1a85b50bef13b44 Hoan Tran   2016-09-12  402  	}
1a85b50bef13b44 Hoan Tran   2016-09-12  403  	of_property_read_string(np, "=
clock-output-names", &clk_name);
1a85b50bef13b44 Hoan Tran   2016-09-12  404  =

1a85b50bef13b44 Hoan Tran   2016-09-12  405  	denom =3D BIT(XGENE_CLK_PMD_W=
IDTH);
1a85b50bef13b44 Hoan Tran   2016-09-12  406  	flags |=3D XGENE_CLK_PMD_SCAL=
E_INVERTED;
1a85b50bef13b44 Hoan Tran   2016-09-12  407  =

1a85b50bef13b44 Hoan Tran   2016-09-12  408  	clk =3D xgene_register_clk_pm=
d(NULL, clk_name,
1a85b50bef13b44 Hoan Tran   2016-09-12  409  				     of_clk_get_parent_nam=
e(np, 0), 0,
1a85b50bef13b44 Hoan Tran   2016-09-12  410  				     csr_reg, XGENE_CLK_PM=
D_SHIFT,
1a85b50bef13b44 Hoan Tran   2016-09-12  411  				     XGENE_CLK_PMD_WIDTH, =
denom,
1a85b50bef13b44 Hoan Tran   2016-09-12  412  				     flags, &clk_lock);
1a85b50bef13b44 Hoan Tran   2016-09-12  413  	if (!IS_ERR(clk)) {
1a85b50bef13b44 Hoan Tran   2016-09-12  414  		of_clk_add_provider(np, of_c=
lk_src_simple_get, clk);
1a85b50bef13b44 Hoan Tran   2016-09-12  415  		clk_register_clkdev(clk, clk=
_name, NULL);
1a85b50bef13b44 Hoan Tran   2016-09-12  416  		pr_debug("Add %s clock\n", c=
lk_name);
1a85b50bef13b44 Hoan Tran   2016-09-12  417  	} else {
1a85b50bef13b44 Hoan Tran   2016-09-12  418  		if (csr_reg)
1a85b50bef13b44 Hoan Tran   2016-09-12 @419  			iounmap(csr_reg);
1a85b50bef13b44 Hoan Tran   2016-09-12  420  	}
1a85b50bef13b44 Hoan Tran   2016-09-12  421  }
1a85b50bef13b44 Hoan Tran   2016-09-12  422  =


:::::: The code at line 419 was first introduced by commit
:::::: 1a85b50bef13b44016c206272785a746adae7833 clk: xgene: Add PMD clock

:::::: TO: Hoan Tran <hotran@apm.com>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3191786123167444625==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3191786123167444625==--

