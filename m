Content-Type: multipart/mixed; boundary="===============3262200313547265377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] xfs: Remove the redundant assignment
Date: Sun, 22 May 2022 08:17:42 +0800
Message-ID: <202205220844.pkDDZn5J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3262200313547265377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220520040518.73957-1-jiapeng.chong@linux.alibaba.com>
References: <20220520040518.73957-1-jiapeng.chong@linux.alibaba.com>
TO: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
TO: djwong(a)kernel.org
CC: linux-xfs(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: Abaci Robot <abaci@linux.alibaba.com>

Hi Jiapeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.18-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/xfs-Re=
move-the-redundant-assignment/20220520-120736
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20522/202205220844.pkDDZn5J-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b36976=
2beb70dfef22c7e793aed79b94d7dc0757)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/890587fbe3e3934d20f=
cd39effdcefedd65e6b7f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiapeng-Chong/xfs-Remove-the-redun=
dant-assignment/20220520-120736
        git checkout 890587fbe3e3934d20fcd39effdcefedd65e6b7f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   fs/xfs/xfs_log_recover.c:2094:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ptr[old_len], dp, len);
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
   fs/xfs/xfs_log_recover.c:2149:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&trans->r_theader, dp, len);
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
   fs/xfs/xfs_log_recover.c:2149:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&trans->r_theader, dp, len);
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
   fs/xfs/xfs_log_recover.c:2154:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr, dp, len);
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
   fs/xfs/xfs_log_recover.c:2154:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, dp, len);
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
   fs/xfs/xfs_log_recover.c:3027:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rhash, 0, sizeof(rhash));
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
   fs/xfs/xfs_log_recover.c:3027:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(rhash, 0, sizeof(rhash));
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
>> fs/xfs/xfs_log_recover.c:3542:20: warning: Value stored to 'agfp' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct xfs_agf  *agfp =3D agfbp->b_addr;
                                            ^~~~   ~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:3542:20: note: Value stored to 'agfp' during it=
s initialization is never read
                           struct xfs_agf  *agfp =3D agfbp->b_addr;
                                            ^~~~   ~~~~~~~~~~~~~
>> fs/xfs/xfs_log_recover.c:3551:20: warning: Value stored to 'agi' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct xfs_agi  *agi =3D agibp->b_addr;
                                            ^~~   ~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:3551:20: note: Value stored to 'agi' during its=
 initialization is never read
                           struct xfs_agi  *agi =3D agibp->b_addr;
                                            ^~~   ~~~~~~~~~~~~~
   Suppressed 51 warnings (49 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/fs-writeback.c:148:3: warning: Argument to kfree() is the address of =
the local variable 'work', which is not memory allocated by malloc() [clang=
-analyzer-unix.Malloc]
                   kfree(work);
                   ^
   fs/fs-writeback.c:2660:6: note: Assuming the condition is false
           if (bdi =3D=3D &noop_backing_dev_info)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:2660:2: note: Taking false branch
           if (bdi =3D=3D &noop_backing_dev_info)
           ^
   fs/fs-writeback.c:2662:2: note: Taking false branch
           WARN_ON(!rwsem_is_locked(&sb->s_umount));
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/fs-writeback.c:2666:2: note: Calling 'bdi_split_work_to_wbs'
           bdi_split_work_to_wbs(bdi, &work, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1167:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:152:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   fs/fs-writeback.c:1169:7: note: 'skip_if_busy' is false
           if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
                ^~~~~~~~~~~~
   fs/fs-writeback.c:1169:20: note: Left side of '||' is true
           if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
                             ^
   fs/fs-writeback.c:1171:3: note: Calling 'wb_queue_work'
                   wb_queue_work(&bdi->wb, base_work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:163:6: note: Assuming field 'done' is null
           if (work->done)
               ^~~~~~~~~~
   fs/fs-writeback.c:163:2: note: Taking false branch
           if (work->done)
           ^
   fs/fs-writeback.c:168:6: note: Assuming the condition is false
           if (test_bit(WB_registered, &wb->state)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:168:2: note: Taking false branch
           if (test_bit(WB_registered, &wb->state)) {
           ^
   fs/fs-writeback.c:172:3: note: Calling 'finish_writeback_work'
                   finish_writeback_work(wb, work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:147:6: note: Assuming field 'auto_free' is not equal t=
o 0
           if (work->auto_free)
               ^~~~~~~~~~~~~~~
   fs/fs-writeback.c:147:2: note: Taking true branch
           if (work->auto_free)
           ^
   fs/fs-writeback.c:148:3: note: Argument to kfree() is the address of the=
 local variable 'work', which is not memory allocated by malloc()
                   kfree(work);
                   ^     ~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/acpi/acpica/dsfield.c:182:4: warning: Value stored to 'status' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           status =3D AE_OK;
                           ^
   drivers/acpi/acpica/dsfield.c:182:4: note: Value stored to 'status' is n=
ever read
   drivers/acpi/acpica/dsfield.c:506:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(struct acpi_create_field_info));
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
   drivers/acpi/acpica/dsfield.c:506:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(struct acpi_create_field_info));
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
   Suppressed 17 warnings (17 in non-user code).

vim +/agfp +3542 fs/xfs/xfs_log_recover.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3519  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3520  #if defined(DEBUG)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3521  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3522   * Read all of the agf a=
nd agi counters and check that they
^1da177e4c3f41 Linus Torvalds    2005-04-16  3523   * are consistent with t=
he superblock counters.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3524   */
e89fbb5ee1893f Christoph Hellwig 2017-11-06  3525  STATIC void
^1da177e4c3f41 Linus Torvalds    2005-04-16  3526  xlog_recover_check_summa=
ry(
9a8d2fdbb47aaa Mark Tinguely     2012-06-14  3527  	struct xlog		*log)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3528  {
934933c3eec9e4 Dave Chinner      2021-06-02  3529  	struct xfs_mount	*mp =
=3D log->l_mp;
934933c3eec9e4 Dave Chinner      2021-06-02  3530  	struct xfs_perag	*pag;
e82226138b20d4 Dave Chinner      2020-12-16  3531  	struct xfs_buf		*agfbp;
e82226138b20d4 Dave Chinner      2020-12-16  3532  	struct xfs_buf		*agibp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3533  	xfs_agnumber_t		agno;
5e1be0fb1a3950 Christoph Hellwig 2008-11-28  3534  	int			error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3535  =

934933c3eec9e4 Dave Chinner      2021-06-02  3536  	for_each_perag(mp, agno=
, pag) {
934933c3eec9e4 Dave Chinner      2021-06-02  3537  		error =3D xfs_read_agf=
(mp, NULL, pag->pag_agno, 0, &agfbp);
4805621a37d9b2 Christoph Hellwig 2008-11-28  3538  		if (error) {
a0fa2b679ecd15 Dave Chinner      2011-03-07  3539  			xfs_alert(mp, "%s agf=
 read failed agno %d error %d",
934933c3eec9e4 Dave Chinner      2021-06-02  3540  						__func__, pag->pag=
_agno, error);
4805621a37d9b2 Christoph Hellwig 2008-11-28  3541  		} else {
9798f615ad2be4 Christoph Hellwig 2020-03-10 @3542  			struct xfs_agf	*agfp =
=3D agfbp->b_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3543  			xfs_buf_relse(agfbp);
4805621a37d9b2 Christoph Hellwig 2008-11-28  3544  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3545  =

934933c3eec9e4 Dave Chinner      2021-06-02  3546  		error =3D xfs_read_agi=
(mp, NULL, pag->pag_agno, &agibp);
a0fa2b679ecd15 Dave Chinner      2011-03-07  3547  		if (error) {
a0fa2b679ecd15 Dave Chinner      2011-03-07  3548  			xfs_alert(mp, "%s agi=
 read failed agno %d error %d",
934933c3eec9e4 Dave Chinner      2021-06-02  3549  						__func__, pag->pag=
_agno, error);
a0fa2b679ecd15 Dave Chinner      2011-03-07  3550  		} else {
370c782b98436b Christoph Hellwig 2020-03-10 @3551  			struct xfs_agi	*agi =
=3D agibp->b_addr;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3262200313547265377==--

