Content-Type: multipart/mixed; boundary="===============5003828766694797963=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/host/core.c:305:23: warning: Value stored to 'nr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 29 Mar 2022 21:52:08 +0800
Message-ID: <202203292153.lr9VGNSg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5003828766694797963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alan Adamson <alan.adamson@oracle.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Chaitanya Kulkarni <kch@nvidia.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: bd83fe6f2cd2133beaac7c423fd36c3515048fc8 nvme: add verbose error lo=
gging
date:   4 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220328 (https://download.01.org/0day-ci/archi=
ve/20220329/202203292153.lr9VGNSg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbd83fe6f2cd2133beaac7c423fd36c3515048fc8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bd83fe6f2cd2133beaac7c423fd36c3515048fc8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/tty/serial/serial_core.c:768:2: note: Returning without writing =
to 'retinfo->iomem_reg_shift'
           return ret;
           ^
   drivers/tty/serial/serial_core.c:2754:2: note: Returning from 'uart_get_=
info'
           uart_get_info(port, &tmp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2755:9: note: 3rd function call argumen=
t is an uninitialized value
           return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
                  ^                    ~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   lib/string_helpers.c:112:12: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   lib/string_helpers.c:60:6: note: Assuming 'blk_size' is not equal to 0
           if (blk_size =3D=3D 0)
               ^~~~~~~~~~~~~
   lib/string_helpers.c:60:2: note: Taking false branch
           if (blk_size =3D=3D 0)
           ^
   lib/string_helpers.c:62:6: note: Assuming 'size' is not equal to 0
           if (size =3D=3D 0)
               ^~~~~~~~~
   lib/string_helpers.c:62:2: note: Taking false branch
           if (size =3D=3D 0)
           ^
   lib/string_helpers.c:76:2: note: Loop condition is false. Execution cont=
inues on line 81
           while (blk_size >> 32) {
           ^
   lib/string_helpers.c:81:2: note: Loop condition is false. Execution cont=
inues on line 88
           while (size >> 32) {
           ^
   lib/string_helpers.c:91:2: note: Loop condition is false. Execution cont=
inues on line 98
           while (size >=3D divisor[units]) {
           ^
   lib/string_helpers.c:99:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:99:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:99:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:99:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:99:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:99:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:99:32: note: The value 3 is assigned to 'j'
           for (j =3D 0; sf_cap*10 < 1000; j++)
                                         ^~~
   lib/string_helpers.c:99:14: note: Assuming the condition is false
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:99:2: note: Loop condition is false. Execution cont=
inues on line 102
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:102:6: note: Assuming 'units' is not equal to STRIN=
G_UNITS_2
           if (units =3D=3D STRING_UNITS_2) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c:102:2: note: Taking false branch
           if (units =3D=3D STRING_UNITS_2) {
           ^
   lib/string_helpers.c:112:12: note: Assigned value is garbage or undefined
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   8 warnings generated.
   drivers/phy/motorola/phy-mapphone-mdm6600.c:424:3: warning: Value stored=
 to 'error' is never read [clang-analyzer-deadcode.DeadStores]
                   error =3D -ETIMEDOUT;
                   ^       ~~~~~~~~~~
   drivers/phy/motorola/phy-mapphone-mdm6600.c:424:3: note: Value stored to=
 'error' is never read
                   error =3D -ETIMEDOUT;
                   ^       ~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/nvme/host/core.c:305:23: warning: Value stored to 'nr' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct nvme_request *nr =3D nvme_req(req);
                                ^~   ~~~~~~~~~~~~~
   drivers/nvme/host/core.c:305:23: note: Value stored to 'nr' during its i=
nitialization is never read
           struct nvme_request *nr =3D nvme_req(req);
                                ^~   ~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3988:3: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]
                   nvme_put_ns(ns);
                   ^
   drivers/nvme/host/core.c:4178:6: note: Assuming field 'state' is equal t=
o NVME_CTRL_LIVE
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:4178:6: note: Left side of '||' is false
   drivers/nvme/host/core.c:4178:39: note: Assuming field 'tagset' is non-n=
ull
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
                                                ^~~~~~~~~~~~~
   drivers/nvme/host/core.c:4178:2: note: Taking false branch
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
           ^
   drivers/nvme/host/core.c:4181:6: note: '?' condition is true
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
               ^
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/nvme/host/core.c:4181:6: note: Assuming the condition is false
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
               ^
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:4181:2: note: Taking false branch
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
           ^
   drivers/nvme/host/core.c:4187:6: note: Calling 'nvme_scan_ns_list'
           if (nvme_scan_ns_list(ctrl) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:4092:2: note: Taking false branch
           if (nvme_ctrl_limited_cns(ctrl))
           ^
   drivers/nvme/host/core.c:4096:6: note: Assuming 'ns_list' is non-null
           if (!ns_list)
               ^~~~~~~~
   drivers/nvme/host/core.c:4096:2: note: Taking false branch
           if (!ns_list)
           ^
   drivers/nvme/host/core.c:4099:2: note: Loop condition is true.  Entering=
 loop body
           for (;;) {
           ^
   drivers/nvme/host/core.c:4108:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/nvme/host/core.c:4108:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/nvme/host/core.c:4114:3: note: Loop condition is true.  Entering=
 loop body
                   for (i =3D 0; i < nr_entries; i++) {
                   ^
   drivers/nvme/host/core.c:4117:8: note: Assuming 'nsid' is not equal to 0
                           if (!nsid)      /* end of the list? */
                               ^~~~~
   drivers/nvme/host/core.c:4117:4: note: Taking false branch
                           if (!nsid)      /* end of the list? */
                           ^
   drivers/nvme/host/core.c:4120:11: note: Assuming the condition is true
                           while (++prev < nsid)
                                  ^~~~~~~~~~~~~
   drivers/nvme/host/core.c:4120:4: note: Loop condition is true.  Entering=
 loop body
                           while (++prev < nsid)
                           ^
   drivers/nvme/host/core.c:4121:5: note: Calling 'nvme_ns_remove_by_nsid'
                                   nvme_ns_remove_by_nsid(ctrl, prev);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3986:6: note: 'ns' is non-null
           if (ns) {
               ^~
   drivers/nvme/host/core.c:3986:2: note: Taking true branch
           if (ns) {
           ^
   drivers/nvme/host/core.c:3987:3: note: Calling 'nvme_ns_remove'
                   nvme_ns_remove(ns);
                   ^~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3946:6: note: '?' condition is true
           if (test_and_set_bit(NVME_NS_REMOVING, &ns->flags))
               ^
   arch/arm/include/asm/bitops.h:192:33: note: expanded from macro 'test_an=
d_set_bit'
   #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr=
,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/nvme/host/core.c:3946:6: note: Assuming the condition is false
           if (test_and_set_bit(NVME_NS_REMOVING, &ns->flags))
               ^
   arch/arm/include/asm/bitops.h:192:33: note: expanded from macro 'test_an=
d_set_bit'

vim +/nr +305 drivers/nvme/host/core.c

49cd84b6f8b677 Keith Busch  2018-11-27  301  =

bd83fe6f2cd213 Alan Adamson 2022-02-03  302  static void nvme_log_error(str=
uct request *req)
bd83fe6f2cd213 Alan Adamson 2022-02-03  303  {
bd83fe6f2cd213 Alan Adamson 2022-02-03  304  	struct nvme_ns *ns =3D req->q=
->queuedata;
bd83fe6f2cd213 Alan Adamson 2022-02-03 @305  	struct nvme_request *nr =3D n=
vme_req(req);
bd83fe6f2cd213 Alan Adamson 2022-02-03  306  =

bd83fe6f2cd213 Alan Adamson 2022-02-03  307  	if (ns) {
bd83fe6f2cd213 Alan Adamson 2022-02-03  308  		pr_err_ratelimited("%s: %s(0=
x%x) @ LBA %llu, %llu blocks, %s (sct 0x%x / sc 0x%x) %s%s\n",
bd83fe6f2cd213 Alan Adamson 2022-02-03  309  		       ns->disk ? ns->disk->=
disk_name : "?",
bd83fe6f2cd213 Alan Adamson 2022-02-03  310  		       nvme_get_opcode_str(n=
r->cmd->common.opcode),
bd83fe6f2cd213 Alan Adamson 2022-02-03  311  		       nr->cmd->common.opcod=
e,
bd83fe6f2cd213 Alan Adamson 2022-02-03  312  		       (unsigned long long)n=
vme_sect_to_lba(ns, blk_rq_pos(req)),
bd83fe6f2cd213 Alan Adamson 2022-02-03  313  		       (unsigned long long)b=
lk_rq_bytes(req) >> ns->lba_shift,
bd83fe6f2cd213 Alan Adamson 2022-02-03  314  		       nvme_get_error_status=
_str(nr->status),
bd83fe6f2cd213 Alan Adamson 2022-02-03  315  		       nr->status >> 8 & 7,	=
/* Status Code Type */
bd83fe6f2cd213 Alan Adamson 2022-02-03  316  		       nr->status & 0xff,	/*=
 Status Code */
bd83fe6f2cd213 Alan Adamson 2022-02-03  317  		       nr->status & NVME_SC_=
MORE ? "MORE " : "",
bd83fe6f2cd213 Alan Adamson 2022-02-03  318  		       nr->status & NVME_SC_=
DNR  ? "DNR "  : "");
bd83fe6f2cd213 Alan Adamson 2022-02-03  319  		return;
bd83fe6f2cd213 Alan Adamson 2022-02-03  320  	}
bd83fe6f2cd213 Alan Adamson 2022-02-03  321  =

bd83fe6f2cd213 Alan Adamson 2022-02-03  322  	pr_err_ratelimited("%s: %s(0x=
%x), %s (sct 0x%x / sc 0x%x) %s%s\n",
bd83fe6f2cd213 Alan Adamson 2022-02-03  323  			   dev_name(nr->ctrl->devic=
e),
bd83fe6f2cd213 Alan Adamson 2022-02-03  324  			   nvme_get_admin_opcode_st=
r(nr->cmd->common.opcode),
bd83fe6f2cd213 Alan Adamson 2022-02-03  325  			   nr->cmd->common.opcode,
bd83fe6f2cd213 Alan Adamson 2022-02-03  326  			   nvme_get_error_status_st=
r(nr->status),
bd83fe6f2cd213 Alan Adamson 2022-02-03  327  			   nr->status >> 8 & 7,	/* =
Status Code Type */
bd83fe6f2cd213 Alan Adamson 2022-02-03  328  			   nr->status & 0xff,	/* St=
atus Code */
bd83fe6f2cd213 Alan Adamson 2022-02-03  329  			   nr->status & NVME_SC_MOR=
E ? "MORE " : "",
bd83fe6f2cd213 Alan Adamson 2022-02-03  330  			   nr->status & NVME_SC_DNR=
  ? "DNR "  : "");
bd83fe6f2cd213 Alan Adamson 2022-02-03  331  }
bd83fe6f2cd213 Alan Adamson 2022-02-03  332  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5003828766694797963==--

