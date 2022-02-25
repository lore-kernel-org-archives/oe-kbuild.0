Content-Type: multipart/mixed; boundary="===============2637332601537031736=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:nvme-duplicate-id-check 18/27] drivers/nvme/host/core.c:305:23: warning: Value stored to 'nr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 25 Feb 2022 17:24:33 +0800
Message-ID: <202202251719.APryuyCl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2637332601537031736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git nvme-duplicate-id-check
head:   c8c48703bc70b45fef90337677f5d4ff20dd5bc7
commit: 19c37bce5c21decf96d899b692faa33836b5a065 [18/27] nvme: add verbose =
error logging
:::::: branch date: 17 hours ago
:::::: commit date: 9 days ago
config: riscv-randconfig-c006-20220223 (https://download.01.org/0day-ci/arc=
hive/20220225/202202251719.APryuyCl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc nvme-duplicate-id-check
        git checkout 19c37bce5c21decf96d899b692faa33836b5a065
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                      ^~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/drm_crtc_helper.c:635:2: warning: Value stored to 'count=
' is never read [clang-analyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:635:2: note: Value stored to 'count' i=
s never read
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:681:2: warning: Value stored to 'count=
' is never read [clang-analyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:681:2: note: Value stored to 'count' i=
s never read
           count =3D 0;
           ^       ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   fs/ntfs/compress.c:164:6: warning: Value stored to 'cb_sb_start' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:164:6: note: Value stored to 'cb_sb_start' during its=
 initialization is never read
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:810:4: warning: Value stored to 'cb_pos' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/compress.c:810:4: note: Value stored to 'cb_pos' is never read
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   drivers/nvme/host/core.c:4181:6: note: Assuming the condition is false
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/nvme/host/core.c:4120:11: note: Assuming the condition is true
                           while (++prev < nsid)
                                  ^~~~~~~~~~~~~
   drivers/nvme/host/core.c:4120:4: note: Loop condition is true.  Entering=
 loop body
                           while (++prev < nsid)
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
   drivers/nvme/host/core.c:3946:6: note: Assuming the condition is false
           if (test_and_set_bit(NVME_NS_REMOVING, &ns->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3946:2: note: Taking false branch
           if (test_and_set_bit(NVME_NS_REMOVING, &ns->flags))
           ^
   drivers/nvme/host/core.c:3955:6: note: Assuming the condition is false
           if (list_empty(&ns->head->list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3955:2: note: Taking false branch
           if (list_empty(&ns->head->list)) {
           ^
   drivers/nvme/host/core.c:3965:6: note: Assuming the condition is false
           if (nvme_mpath_clear_current_path(ns))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3965:2: note: Taking false branch

vim +/nr +305 drivers/nvme/host/core.c

49cd84b6f8b677 Keith Busch  2018-11-27  301  =

19c37bce5c21de Alan Adamson 2022-02-03  302  static void nvme_log_error(str=
uct request *req)
19c37bce5c21de Alan Adamson 2022-02-03  303  {
19c37bce5c21de Alan Adamson 2022-02-03  304  	struct nvme_ns *ns =3D req->q=
->queuedata;
19c37bce5c21de Alan Adamson 2022-02-03 @305  	struct nvme_request *nr =3D n=
vme_req(req);
19c37bce5c21de Alan Adamson 2022-02-03  306  =

19c37bce5c21de Alan Adamson 2022-02-03  307  	if (ns) {
19c37bce5c21de Alan Adamson 2022-02-03  308  		pr_err_ratelimited("%s: %s(0=
x%x) @ LBA %llu, %llu blocks, %s (sct 0x%x / sc 0x%x) %s%s\n",
19c37bce5c21de Alan Adamson 2022-02-03  309  		       ns->disk ? ns->disk->=
disk_name : "?",
19c37bce5c21de Alan Adamson 2022-02-03  310  		       nvme_get_opcode_str(n=
r->cmd->common.opcode),
19c37bce5c21de Alan Adamson 2022-02-03  311  		       nr->cmd->common.opcod=
e,
19c37bce5c21de Alan Adamson 2022-02-03  312  		       (unsigned long long)n=
vme_sect_to_lba(ns, blk_rq_pos(req)),
19c37bce5c21de Alan Adamson 2022-02-03  313  		       (unsigned long long)b=
lk_rq_bytes(req) >> ns->lba_shift,
19c37bce5c21de Alan Adamson 2022-02-03  314  		       nvme_get_error_status=
_str(nr->status),
19c37bce5c21de Alan Adamson 2022-02-03  315  		       nr->status >> 8 & 7,	=
/* Status Code Type */
19c37bce5c21de Alan Adamson 2022-02-03  316  		       nr->status & 0xff,	/*=
 Status Code */
19c37bce5c21de Alan Adamson 2022-02-03  317  		       nr->status & NVME_SC_=
MORE ? "MORE " : "",
19c37bce5c21de Alan Adamson 2022-02-03  318  		       nr->status & NVME_SC_=
DNR  ? "DNR "  : "");
19c37bce5c21de Alan Adamson 2022-02-03  319  		return;
19c37bce5c21de Alan Adamson 2022-02-03  320  	}
19c37bce5c21de Alan Adamson 2022-02-03  321  =

19c37bce5c21de Alan Adamson 2022-02-03  322  	pr_err_ratelimited("%s: %s(0x=
%x), %s (sct 0x%x / sc 0x%x) %s%s\n",
19c37bce5c21de Alan Adamson 2022-02-03  323  			   dev_name(nr->ctrl->devic=
e),
19c37bce5c21de Alan Adamson 2022-02-03  324  			   nvme_get_admin_opcode_st=
r(nr->cmd->common.opcode),
19c37bce5c21de Alan Adamson 2022-02-03  325  			   nr->cmd->common.opcode,
19c37bce5c21de Alan Adamson 2022-02-03  326  			   nvme_get_error_status_st=
r(nr->status),
19c37bce5c21de Alan Adamson 2022-02-03  327  			   nr->status >> 8 & 7,	/* =
Status Code Type */
19c37bce5c21de Alan Adamson 2022-02-03  328  			   nr->status & 0xff,	/* St=
atus Code */
19c37bce5c21de Alan Adamson 2022-02-03  329  			   nr->status & NVME_SC_MOR=
E ? "MORE " : "",
19c37bce5c21de Alan Adamson 2022-02-03  330  			   nr->status & NVME_SC_DNR=
  ? "DNR "  : "");
19c37bce5c21de Alan Adamson 2022-02-03  331  }
19c37bce5c21de Alan Adamson 2022-02-03  332  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2637332601537031736==--

