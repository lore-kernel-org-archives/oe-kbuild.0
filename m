Content-Type: multipart/mixed; boundary="===============4795304010076132132=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:185:3: warning: Value stored to 'r' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 25 Jan 2022 06:23:19 +0800
Message-ID: <202201250426.AeGyiHMY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4795304010076132132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: James Yao <yiqing.yao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jingwen Chen <Jingwen.Chen2@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 216a9873198bdc5c670a9f71d58fafd30227c9c8 drm/amdgpu: add dummy even=
t6 for vega10
date:   2 weeks ago
:::::: branch date: 29 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220125/202201250426.AeGyiHMY-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf=
424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D216a9873198bdc5c670a9f71d58fafd30227c9c8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 216a9873198bdc5c670a9f71d58fafd30227c9c8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                             ^
   mm/vmalloc.c:1824:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1822:20: note: expanded from macro 'VMAP_BBMAP_BITS'
                           VMALLOC_PAGES / roundup_pow_of_two(NR_CPUS) / 16=
))
                                           ^
   include/linux/log2.h:178:12: note: expanded from macro 'roundup_pow_of_t=
wo'
                   (1UL << (ilog2((n) - 1) + 1))   \
                            ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   mm/vmalloc.c:2053:20: note: '?' condition is false
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1824:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1822:20: note: expanded from macro 'VMAP_BBMAP_BITS'
                           VMALLOC_PAGES / roundup_pow_of_two(NR_CPUS) / 16=
))
                                           ^
   include/linux/log2.h:178:12: note: expanded from macro 'roundup_pow_of_t=
wo'
                   (1UL << (ilog2((n) - 1) + 1))   \
                            ^
   include/linux/log2.h:159:3: note: expanded from macro 'ilog2'
           ((n) < 2 ? 0 :                  \
            ^
   mm/vmalloc.c:2053:20: note: Assuming the condition is true
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1824:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^~~~~~~~~~~~~~~
   mm/vmalloc.c:1820:3: note: expanded from macro 'VMAP_BBMAP_BITS'
                   VMAP_MIN(VMAP_BBMAP_BITS_MAX,   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:1817:26: note: expanded from macro 'VMAP_MIN'
   #define VMAP_MIN(x, y)          ((x) < (y) ? (x) : (y)) /* can't use min=
() */
                                    ^~~~~~~~~
   mm/vmalloc.c:2053:20: note: '?' condition is true
           offset =3D (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
                             ^
   mm/vmalloc.c:1824:27: note: expanded from macro 'VMAP_BLOCK_SIZE'
   #define VMAP_BLOCK_SIZE         (VMAP_BBMAP_BITS * PAGE_SIZE)
                                    ^
   mm/vmalloc.c:1820:3: note: expanded from macro 'VMAP_BBMAP_BITS'
                   VMAP_MIN(VMAP_BBMAP_BITS_MAX,   \
                   ^
   mm/vmalloc.c:1817:26: note: expanded from macro 'VMAP_MIN'
   #define VMAP_MIN(x, y)          ((x) < (y) ? (x) : (y)) /* can't use min=
() */
                                    ^
   mm/vmalloc.c:2058:2: note: Taking false branch
           if (debug_pagealloc_enabled_static())
           ^
   mm/vmalloc.c:2064:18: note: Assuming '__UNIQUE_ID___x284' is >=3D '__UNI=
QUE_ID___y285'
           vb->dirty_min =3D min(vb->dirty_min, offset);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   mm/vmalloc.c:2064:18: note: '?' condition is false
           vb->dirty_min =3D min(vb->dirty_min, offset);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   mm/vmalloc.c:2065:51: note: The result of the left shift is undefined du=
e to shifting by '64', which is greater or equal to the width of type 'unsi=
gned long'
           vb->dirty_max =3D max(vb->dirty_max, offset + (1UL << order));
                                                            ^
   include/linux/minmax.h:52:36: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                                            ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:185:3: warning: Value stored to 'r=
' is never read [clang-analyzer-deadcode.DeadStores]
                   r =3D xgpu_ai_poll_msg(adev, IDH_REQ_GPU_INIT_DATA_READY=
);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:185:3: note: Value stored to 'r' i=
s never read
                   r =3D xgpu_ai_poll_msg(adev, IDH_REQ_GPU_INIT_DATA_READY=
);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/ntfs3/xattr.c:966:3: warning: 2nd function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                   i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Calling 'ntfs_get_ea'
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:6: note: Assuming the condition is false
           if (!(ni->ni_flags & NI_FLAG_EA))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:2: note: Taking false branch
           if (!(ni->ni_flags & NI_FLAG_EA))
           ^
   fs/ntfs3/xattr.c:212:7: note: 'required' is non-null
           if (!required)
                ^~~~~~~~
   fs/ntfs3/xattr.c:212:2: note: Taking false branch
           if (!required)
           ^
   fs/ntfs3/xattr.c:217:6: note: 'name_len' is <=3D 255
           if (name_len > 255) {
               ^~~~~~~~
   fs/ntfs3/xattr.c:217:2: note: Taking false branch
           if (name_len > 255) {
           ^
   fs/ntfs3/xattr.c:223:6: note: 'err' is not equal to 0
           if (err)
               ^~~
   fs/ntfs3/xattr.c:223:2: note: Taking true branch
           if (err)
           ^
   fs/ntfs3/xattr.c:224:3: note: Control jumps to line 253
                   goto out;
                   ^
   fs/ntfs3/xattr.c:254:7: note: 'required' is non-null
           if (!required)
                ^~~~~~~~
   fs/ntfs3/xattr.c:254:2: note: Taking false branch
           if (!required)
           ^
   fs/ntfs3/xattr.c:257:9: note: 'err' is not equal to 0
           return err ? err : len;
                  ^~~
   fs/ntfs3/xattr.c:257:9: note: '?' condition is true
   fs/ntfs3/xattr.c:257:2: note: Returning without writing to '*buffer'
           return err ? err : len;
           ^
   fs/ntfs3/xattr.c:960:6: note: Returning from 'ntfs_get_ea'
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Assuming the condition is true
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Left side of '&&' is true

vim +/r +185 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c

890419409a3aba Gavin Wan     2017-06-23  160  =

890419409a3aba Gavin Wan     2017-06-23  161  static int xgpu_ai_send_acces=
s_requests(struct amdgpu_device *adev,
890419409a3aba Gavin Wan     2017-06-23  162  					enum idh_request req)
890419409a3aba Gavin Wan     2017-06-23  163  {
890419409a3aba Gavin Wan     2017-06-23  164  	int r;
890419409a3aba Gavin Wan     2017-06-23  165  =

890419409a3aba Gavin Wan     2017-06-23  166  	xgpu_ai_mailbox_trans_msg(ad=
ev, req, 0, 0, 0);
c9c9de93a33ccd Xiangliang Yu 2017-03-10  167  =

c9c9de93a33ccd Xiangliang Yu 2017-03-10  168  	/* start to check msg if req=
uest is idh_req_gpu_init_access */
c9c9de93a33ccd Xiangliang Yu 2017-03-10  169  	if (req =3D=3D IDH_REQ_GPU_I=
NIT_ACCESS ||
c9c9de93a33ccd Xiangliang Yu 2017-03-10  170  		req =3D=3D IDH_REQ_GPU_FINI=
_ACCESS ||
c9c9de93a33ccd Xiangliang Yu 2017-03-10  171  		req =3D=3D IDH_REQ_GPU_RESE=
T_ACCESS) {
94b4fd725b7d86 Monk Liu      2017-04-05  172  		r =3D xgpu_ai_poll_msg(adev=
, IDH_READY_TO_ACCESS_GPU);
17b2e332a277bf Monk Liu      2017-04-21  173  		if (r) {
17b2e332a277bf Monk Liu      2017-04-21  174  			pr_err("Doesn't get READY_=
TO_ACCESS_GPU from pf, give up\n");
c9c9de93a33ccd Xiangliang Yu 2017-03-10  175  			return r;
c9c9de93a33ccd Xiangliang Yu 2017-03-10  176  		}
2dc8f81e4f822c Horace Chen   2017-10-09  177  		/* Retrieve checksum from m=
ailbox2 */
d3c117e564bfbf Emily Deng    2018-12-29  178  		if (req =3D=3D IDH_REQ_GPU_=
INIT_ACCESS || req =3D=3D IDH_REQ_GPU_RESET_ACCESS) {
2dc8f81e4f822c Horace Chen   2017-10-09  179  			adev->virt.fw_reserve.chec=
ksum_key =3D
2dc8f81e4f822c Horace Chen   2017-10-09  180  				RREG32_NO_KIQ(SOC15_REG_O=
FFSET(NBIO, 0,
2dc8f81e4f822c Horace Chen   2017-10-09  181  					mmBIF_BX_PF0_MAILBOX_MSG=
BUF_RCV_DW2));
2dc8f81e4f822c Horace Chen   2017-10-09  182  		}
216a9873198bdc James Yao     2021-12-29  183  	} else if (req =3D=3D IDH_RE=
Q_GPU_INIT_DATA){
216a9873198bdc James Yao     2021-12-29  184  		/* Dummy REQ_GPU_INIT_DATA =
handling */
216a9873198bdc James Yao     2021-12-29 @185  		r =3D xgpu_ai_poll_msg(adev=
, IDH_REQ_GPU_INIT_DATA_READY);
216a9873198bdc James Yao     2021-12-29  186  		/* version set to 0 since d=
ummy */
216a9873198bdc James Yao     2021-12-29  187  		adev->virt.req_init_data_ve=
r =3D 0;	=

17b2e332a277bf Monk Liu      2017-04-21  188  	}
c9c9de93a33ccd Xiangliang Yu 2017-03-10  189  =

c9c9de93a33ccd Xiangliang Yu 2017-03-10  190  	return 0;
c9c9de93a33ccd Xiangliang Yu 2017-03-10  191  }
c9c9de93a33ccd Xiangliang Yu 2017-03-10  192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4795304010076132132==--

