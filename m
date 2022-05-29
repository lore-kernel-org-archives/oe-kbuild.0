Content-Type: multipart/mixed; boundary="===============7666891598767274552=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12535/14198] drivers/nvme/host/fc.c:1912:18: warning: Value stored to 'rq' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 29 May 2022 09:42:37 +0800
Message-ID: <202205290916.rMmAa3J9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7666891598767274552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Muneendra Kumar <muneendra.kumar@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: James Smart <jsmart2021@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: 827fc630e4c8087df5a8e8ee013b686bd6f13736 [12535/14198] scsi: nvme-f=
c: Add new routine nvme_fc_io_getuuid()
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20529/202205290916.rMmAa3J9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D827fc630e4c8087df5a8e8ee013b686bd6f13736
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 827fc630e4c8087df5a8e8ee013b686bd6f13736
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/md/bcache/extents.c:428:5: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                                   bkey_copy(&temp.key, k);
                                   ^
   drivers/md/bcache/bcache_ondisk.h:109:32: note: expanded from macro 'bke=
y_copy'
   #define bkey_copy(_dest, _src)  memcpy(_dest, _src, bkey_bytes(_src))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   drivers/nvme/host/fc.c:511:2: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(hostaddr, sizeof(hostaddr),
           ^~~~~~~~
   drivers/nvme/host/fc.c:511:2: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
           snprintf(hostaddr, sizeof(hostaddr),
           ^~~~~~~~
   drivers/nvme/host/fc.c:514:2: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(tgtaddr, sizeof(tgtaddr),
           ^~~~~~~~
   drivers/nvme/host/fc.c:514:2: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
           snprintf(tgtaddr, sizeof(tgtaddr),
           ^~~~~~~~
   drivers/nvme/host/fc.c:1221:2: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(assoc_rqst->assoc_cmd.hostnqn, ctrl->ctrl.opts->host->nq=
n,
           ^~~~~~~
   drivers/nvme/host/fc.c:1221:2: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
           strncpy(assoc_rqst->assoc_cmd.hostnqn, ctrl->ctrl.opts->host->nq=
n,
           ^~~~~~~
   drivers/nvme/host/fc.c:1223:2: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(assoc_rqst->assoc_cmd.subnqn, ctrl->ctrl.opts->subsysnqn,
           ^~~~~~~
   drivers/nvme/host/fc.c:1223:2: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
           strncpy(assoc_rqst->assoc_cmd.subnqn, ctrl->ctrl.opts->subsysnqn,
           ^~~~~~~
   drivers/nvme/host/fc.c:1569:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(acc, 0, sizeof(*acc));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:1569:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(acc, 0, sizeof(*acc));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:1784:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lsop->rqstbuf, lsreqbuf, lsreqbuf_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:1784:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(lsop->rqstbuf, lsreqbuf, lsreqbuf_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/nvme/host/fc.c:1912:18: warning: Value stored to 'rq' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct request *rq =3D op->rq;
                           ^~   ~~~~~~
   drivers/nvme/host/fc.c:1912:18: note: Value stored to 'rq' during its in=
itialization is never read
           struct request *rq =3D op->rq;
                           ^~   ~~~~~~
   drivers/nvme/host/fc.c:2077:25: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
           if (terminate_assoc && ctrl->ctrl.state !=3D NVME_CTRL_RESETTING)
                                  ^~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:1977:6: note: Assuming 'opstate' is not equal to =
FCPOP_STATE_ABORTED
           if (opstate =3D=3D FCPOP_STATE_ABORTED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:1977:2: note: Taking false branch
           if (opstate =3D=3D FCPOP_STATE_ABORTED)
           ^
   drivers/nvme/host/fc.c:1979:11: note: Assuming field 'status' is not equ=
al to 0
           else if (freq->status) {
                    ^~~~~~~~~~~~
   drivers/nvme/host/fc.c:1979:7: note: Taking true branch
           else if (freq->status) {
                ^
   drivers/nvme/host/fc.c:1981:3: note: Loop condition is false.  Exiting l=
oop
                   dev_info(ctrl->ctrl.device,
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
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
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/nvme/host/fc.c:1991:6: note: 'status' is 1760
           if (status)
               ^~~~~~
   drivers/nvme/host/fc.c:1991:2: note: Taking true branch
           if (status)
           ^
   drivers/nvme/host/fc.c:1992:3: note: Control jumps to line 2063
                   goto done;
                   ^
   drivers/nvme/host/fc.c:2063:6: note: Assuming the condition is true
           if (op->flags & FCOP_FLAGS_AEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2063:2: note: Taking true branch
           if (op->flags & FCOP_FLAGS_AEN) {
           ^
   drivers/nvme/host/fc.c:2068:3: note: Calling 'nvme_fc_ctrl_put'
                   nvme_fc_ctrl_put(ctrl);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2423:2: note: Calling 'kref_put'
           kref_put(&ctrl->ref, nvme_fc_ctrl_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'nvme_fc_ctrl_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2394:6: note: Assuming field 'tagset' is null
           if (ctrl->ctrl.tagset) {
               ^~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2394:2: note: Taking false branch
           if (ctrl->ctrl.tagset) {
           ^
   drivers/nvme/host/fc.c:2400:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&ctrl->rport->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/nvme/host/fc.c:2400:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&ctrl->rport->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/nvme/host/fc.c:2415:6: note: Assuming field 'opts' is null
           if (ctrl->ctrl.opts)
               ^~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2415:2: note: Taking false branch
           if (ctrl->ctrl.opts)
           ^
   drivers/nvme/host/fc.c:2417:2: note: Memory is released
           kfree(ctrl);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);

vim +/rq +1912 drivers/nvme/host/fc.c

19fce0470f0503 James Smart     2020-12-01  1901  =

827fc630e4c808 Muneendra Kumar 2022-05-19  1902  /*
827fc630e4c808 Muneendra Kumar 2022-05-19  1903   * nvme_fc_io_getuuid - Ro=
utine called to get the appid field
827fc630e4c808 Muneendra Kumar 2022-05-19  1904   * associated with request=
 by the lldd
827fc630e4c808 Muneendra Kumar 2022-05-19  1905   * @req:IO request from nv=
me fc to driver
827fc630e4c808 Muneendra Kumar 2022-05-19  1906   * Returns: UUID if there =
is an appid associated with VM or
827fc630e4c808 Muneendra Kumar 2022-05-19  1907   * NULL if the user/libvir=
t has not set the appid to VM
827fc630e4c808 Muneendra Kumar 2022-05-19  1908   */
827fc630e4c808 Muneendra Kumar 2022-05-19  1909  char *nvme_fc_io_getuuid(s=
truct nvmefc_fcp_req *req)
827fc630e4c808 Muneendra Kumar 2022-05-19  1910  {
827fc630e4c808 Muneendra Kumar 2022-05-19  1911  	struct nvme_fc_fcp_op *op=
 =3D fcp_req_to_fcp_op(req);
827fc630e4c808 Muneendra Kumar 2022-05-19 @1912  	struct request *rq =3D op=
->rq;
827fc630e4c808 Muneendra Kumar 2022-05-19  1913  =

827fc630e4c808 Muneendra Kumar 2022-05-19  1914  	if (!IS_ENABLED(CONFIG_BL=
K_CGROUP_FC_APPID) || !rq->bio)
827fc630e4c808 Muneendra Kumar 2022-05-19  1915  		return NULL;
827fc630e4c808 Muneendra Kumar 2022-05-19  1916  	return blkcg_get_fc_appid=
(rq->bio);
827fc630e4c808 Muneendra Kumar 2022-05-19  1917  }
827fc630e4c808 Muneendra Kumar 2022-05-19  1918  EXPORT_SYMBOL_GPL(nvme_fc_=
io_getuuid);
827fc630e4c808 Muneendra Kumar 2022-05-19  1919  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7666891598767274552==--

