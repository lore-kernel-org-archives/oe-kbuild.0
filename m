Content-Type: multipart/mixed; boundary="===============5712314965433099803=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:pending-fixes 8096/13747] drivers/nvme/host/core.c:305:23: warning: Value stored to 'nr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 01 Apr 2022 18:41:46 +0800
Message-ID: <202204011816.zeTSMq91-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5712314965433099803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alan Adamson <alan.adamson@oracle.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Chaitanya Kulkarni <kch@nvidia.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 pending-fixes
head:   412036f22f464f3889fa2c2a8fc0ee1ba9e205d6
commit: bd83fe6f2cd2133beaac7c423fd36c3515048fc8 [8096/13747] nvme: add ver=
bose error logging
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220328 (https://download.01.org/0day-ci/archi=
ve/20220401/202204011816.zeTSMq91-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dbd83fe6f2cd2133beaac7c423fd36c3515048fc8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout bd83fe6f2cd2133beaac7c423fd36c3515048fc8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/spi/spi-bcm-qspi.c:840:7: note: Assuming field 'bits_per_word' i=
s > 8
                   if (tp.trans->bits_per_word <=3D 8) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:840:3: note: Taking false branch
                   if (tp.trans->bits_per_word <=3D 8) {
                   ^
   drivers/spi/spi-bcm-qspi.c:847:14: note: Assuming field 'bits_per_word' =
is > 16
                   } else if (tp.trans->bits_per_word <=3D 16) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:847:10: note: Taking false branch
                   } else if (tp.trans->bits_per_word <=3D 16) {
                          ^
   drivers/spi/spi-bcm-qspi.c:855:14: note: Assuming field 'bits_per_word' =
is > 32
                   } else if (tp.trans->bits_per_word <=3D 32) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:855:10: note: Taking false branch
                   } else if (tp.trans->bits_per_word <=3D 32) {
                          ^
   drivers/spi/spi-bcm-qspi.c:864:14: note: Assuming field 'bits_per_word' =
is > 64
                   } else if (tp.trans->bits_per_word <=3D 64) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:864:10: note: Taking false branch
                   } else if (tp.trans->bits_per_word <=3D 64) {
                          ^
   drivers/spi/spi-bcm-qspi.c:839:2: note: Loop condition is false. Executi=
on continues on line 880
           for (slot =3D 0; slot < slots; slot++) {
           ^
   drivers/spi/spi-bcm-qspi.c:880:2: note: The value of 'tp' is assigned to=
 field 'trans_pos'
           qspi->trans_pos =3D tp;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:1143:3: note: Returning from 'read_from_hw'
                   read_from_hw(qspi, slots);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:1134:9: note: Assuming field 'byte' is < fiel=
d 'len'
           while (qspi->trans_pos.byte < trans->len) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:1134:2: note: Loop condition is true.  Enteri=
ng loop body
           while (qspi->trans_pos.byte < trans->len) {
           ^
   drivers/spi/spi-bcm-qspi.c:1137:11: note: Calling 'write_to_hw'
                   slots =3D write_to_hw(qspi, spi);
                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:943:2: note: Null pointer value stored to 'tp=
.trans'
           tp =3D qspi->trans_pos;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:944:35: note: Passing null pointer value via =
3rd parameter 'trans'
           bcm_qspi_update_parms(qspi, spi, tp.trans);
                                            ^~~~~~~~
   drivers/spi/spi-bcm-qspi.c:944:2: note: Calling 'bcm_qspi_update_parms'
           bcm_qspi_update_parms(qspi, spi, tp.trans);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:699:16: note: Access to field 'speed_hz' resu=
lts in a dereference of a null pointer (loaded from variable 'trans')
           xp.speed_hz =3D trans->speed_hz;
                         ^~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (7 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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

49cd84b6f8b677e Keith Busch  2018-11-27  301  =

bd83fe6f2cd2133 Alan Adamson 2022-02-03  302  static void nvme_log_error(st=
ruct request *req)
bd83fe6f2cd2133 Alan Adamson 2022-02-03  303  {
bd83fe6f2cd2133 Alan Adamson 2022-02-03  304  	struct nvme_ns *ns =3D req->=
q->queuedata;
bd83fe6f2cd2133 Alan Adamson 2022-02-03 @305  	struct nvme_request *nr =3D =
nvme_req(req);
bd83fe6f2cd2133 Alan Adamson 2022-02-03  306  =

bd83fe6f2cd2133 Alan Adamson 2022-02-03  307  	if (ns) {
bd83fe6f2cd2133 Alan Adamson 2022-02-03  308  		pr_err_ratelimited("%s: %s(=
0x%x) @ LBA %llu, %llu blocks, %s (sct 0x%x / sc 0x%x) %s%s\n",
bd83fe6f2cd2133 Alan Adamson 2022-02-03  309  		       ns->disk ? ns->disk-=
>disk_name : "?",
bd83fe6f2cd2133 Alan Adamson 2022-02-03  310  		       nvme_get_opcode_str(=
nr->cmd->common.opcode),
bd83fe6f2cd2133 Alan Adamson 2022-02-03  311  		       nr->cmd->common.opco=
de,
bd83fe6f2cd2133 Alan Adamson 2022-02-03  312  		       (unsigned long long)=
nvme_sect_to_lba(ns, blk_rq_pos(req)),
bd83fe6f2cd2133 Alan Adamson 2022-02-03  313  		       (unsigned long long)=
blk_rq_bytes(req) >> ns->lba_shift,
bd83fe6f2cd2133 Alan Adamson 2022-02-03  314  		       nvme_get_error_statu=
s_str(nr->status),
bd83fe6f2cd2133 Alan Adamson 2022-02-03  315  		       nr->status >> 8 & 7,=
	/* Status Code Type */
bd83fe6f2cd2133 Alan Adamson 2022-02-03  316  		       nr->status & 0xff,	/=
* Status Code */
bd83fe6f2cd2133 Alan Adamson 2022-02-03  317  		       nr->status & NVME_SC=
_MORE ? "MORE " : "",
bd83fe6f2cd2133 Alan Adamson 2022-02-03  318  		       nr->status & NVME_SC=
_DNR  ? "DNR "  : "");
bd83fe6f2cd2133 Alan Adamson 2022-02-03  319  		return;
bd83fe6f2cd2133 Alan Adamson 2022-02-03  320  	}
bd83fe6f2cd2133 Alan Adamson 2022-02-03  321  =

bd83fe6f2cd2133 Alan Adamson 2022-02-03  322  	pr_err_ratelimited("%s: %s(0=
x%x), %s (sct 0x%x / sc 0x%x) %s%s\n",
bd83fe6f2cd2133 Alan Adamson 2022-02-03  323  			   dev_name(nr->ctrl->devi=
ce),
bd83fe6f2cd2133 Alan Adamson 2022-02-03  324  			   nvme_get_admin_opcode_s=
tr(nr->cmd->common.opcode),
bd83fe6f2cd2133 Alan Adamson 2022-02-03  325  			   nr->cmd->common.opcode,
bd83fe6f2cd2133 Alan Adamson 2022-02-03  326  			   nvme_get_error_status_s=
tr(nr->status),
bd83fe6f2cd2133 Alan Adamson 2022-02-03  327  			   nr->status >> 8 & 7,	/*=
 Status Code Type */
bd83fe6f2cd2133 Alan Adamson 2022-02-03  328  			   nr->status & 0xff,	/* S=
tatus Code */
bd83fe6f2cd2133 Alan Adamson 2022-02-03  329  			   nr->status & NVME_SC_MO=
RE ? "MORE " : "",
bd83fe6f2cd2133 Alan Adamson 2022-02-03  330  			   nr->status & NVME_SC_DN=
R  ? "DNR "  : "");
bd83fe6f2cd2133 Alan Adamson 2022-02-03  331  }
bd83fe6f2cd2133 Alan Adamson 2022-02-03  332  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5712314965433099803==--

