Content-Type: multipart/mixed; boundary="===============3653082753358924287=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 54/60] drivers/cxl/region.c:294:26: warning: Value stored to 'parent_port' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 01:26:07 +0800
Message-ID: <202201280128.LTQ7woOM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3653082753358924287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   41c2d219a2c8e14de644f4e953e0c57402c3e884
commit: e6b7dbd076fea0d1679e501a45beb9eaa127ac6f [54/60] cxl/region: HB por=
t config verification
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220128/202201280128.LTQ7woOM-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6=
012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3De6b7dbd076fea0d1679e501a45beb9eaa127ac6f
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout e6b7dbd076fea0d1679e501a45beb9eaa127ac6f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^
   drivers/i2c/busses/i2c-nforce2.c:161:10: note: Calling 'inb_p'
                   temp =3D inb_p(NVIDIA_SMB_STS);
                          ^
   arch/x86/include/asm/io.h:327:15: note: expanded from macro 'inb_p'
   #define inb_p inb_p
                 ^
   arch/x86/include/asm/io.h:320:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:284:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/cxl/region.c:294:26: warning: Value stored to 'parent_port' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cxl_port *port, *parent_port =3D port =3D ep->port;
                                   ^~~~~~~~~~~          ~~~~~~~~
   drivers/cxl/region.c:294:26: note: Value stored to 'parent_port' during =
its initialization is never read
           struct cxl_port *port, *parent_port =3D port =3D ep->port;
                                   ^~~~~~~~~~~          ~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   mm/oom_kill.c:258:17: warning: Value stored to 'highest_zoneidx' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:258:17: note: Value stored to 'highest_zoneidx' during its=
 initialization is never read
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/ata/pata_sis.c:417:6: warning: Value stored to 'speed' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_sis.c:417:6: note: Value stored to 'speed' during its i=
nitialization is never read
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_sis.c:451:6: warning: Value stored to 'speed' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_sis.c:451:6: note: Value stored to 'speed' during its i=
nitialization is never read
           int speed =3D adev->dma_mode - XFER_MW_DMA_0;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/parent_port +294 drivers/cxl/region.c

84dbaed92240cd Ben Widawsky 2021-06-15  291  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  292  static struct cxl_dport *get_r=
p(struct cxl_memdev *ep)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  293  {
e6b7dbd076fea0 Ben Widawsky 2021-10-08 @294  	struct cxl_port *port, *paren=
t_port =3D port =3D ep->port;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  295  	struct cxl_dport *dport;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  296  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  297  	while (!is_cxl_root(port)) {
e6b7dbd076fea0 Ben Widawsky 2021-10-08  298  		parent_port =3D to_cxl_port(=
port->dev.parent);
e6b7dbd076fea0 Ben Widawsky 2021-10-08  299  		if (parent_port->depth =3D=
=3D 1)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  300  			list_for_each_entry(dport, =
&parent_port->dports, list)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  301  				if (dport->dport =3D=3D po=
rt->uport->parent->parent)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  302  					return dport;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  303  		port =3D parent_port;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  304  	}
e6b7dbd076fea0 Ben Widawsky 2021-10-08  305  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  306  	BUG();
e6b7dbd076fea0 Ben Widawsky 2021-10-08  307  	return NULL;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  308  }
e6b7dbd076fea0 Ben Widawsky 2021-10-08  309  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3653082753358924287==--

