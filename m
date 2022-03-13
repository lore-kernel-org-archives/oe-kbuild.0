Content-Type: multipart/mixed; boundary="===============6370995983429088477=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshpb.c:104:22: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 13 Mar 2022 17:07:52 +0800
Message-ID: <202203131708.3tgmUZ01-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6370995983429088477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daejun Park <daejun7.park@samsung.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Can Guo <cang@codeaurora.org>
CC: Bean Huo <beanhuo@micron.com>
CC: Stanley Chu <stanley.chu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aad611a868d16cdc16a7d4a764cef955293e47e3
commit: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introdu=
ce Host Performance Buffer feature
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220312 (https://download.01.org/0day-ci/arc=
hive/20220313/202203131708.3tgmUZ01-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df02bc9754a6887bf5e286889265d24ce5e3b1952
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f02bc9754a6887bf5e286889265d24ce5e3b1952
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:475:2: note: Taking false branch
           if (lun >=3D hba->dev_info.max_lu_supported)
           ^
   drivers/scsi/ufs/ufshpb.c:479:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshpb.c:479:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshpb.c:482:8: note: Calling 'ufshpb_alloc_hpb_lu'
           hpb =3D ufshpb_alloc_hpb_lu(hba, lun, &hba->ufshpb_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:257:6: note: Assuming 'hpb' is non-null
           if (!hpb)
               ^~~~
   drivers/scsi/ufs/ufshpb.c:257:2: note: Taking false branch
           if (!hpb)
           ^
   drivers/scsi/ufs/ufshpb.c:264:8: note: Calling 'ufshpb_lu_hpb_init'
           ret =3D ufshpb_lu_hpb_init(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:241:8: note: Calling 'ufshpb_alloc_region_tbl'
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:120:6: note: Assuming 'rgn_table' is non-null
           if (!rgn_table)
               ^~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:120:2: note: Taking false branch
           if (!rgn_table)
           ^
   drivers/scsi/ufs/ufshpb.c:125:20: note: Assuming 'rgn_idx' is < field 'r=
gns_per_lu'
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:125:2: note: Loop condition is true.  Entering=
 loop body
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
           ^
   drivers/scsi/ufs/ufshpb.c:132:7: note: Assuming the condition is true
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:132:3: note: Taking true branch
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                   ^
   drivers/scsi/ufs/ufshpb.c:139:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/scsi/ufs/ufshpb.c:139:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/scsi/ufs/ufshpb.c:141:3: note: Calling 'ufshpb_init_subregion_tb=
l'
                   ufshpb_init_subregion_tbl(hpb, rgn, last_srgn);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:43:2: note: 'srgn' declared without an initial=
 value
           struct ufshpb_subregion *srgn;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:45:21: note: Assuming 'srgn_idx' is >=3D field=
 'srgn_cnt'
           for (srgn_idx =3D 0; srgn_idx < rgn->srgn_cnt; srgn_idx++) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:45:2: note: Loop condition is false. Execution=
 continues on line 53
           for (srgn_idx =3D 0; srgn_idx < rgn->srgn_cnt; srgn_idx++) {
           ^
   drivers/scsi/ufs/ufshpb.c:53:15: note: 'last' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/scsi/ufs/ufshpb.c:53:15: note: Left side of '&&' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   drivers/scsi/ufs/ufshpb.c:53:6: note: Assuming the condition is false
           if (unlikely(last && hpb->last_srgn_entries))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   drivers/scsi/ufs/ufshpb.c:53:15: note: 'last' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:53:15: note: Left side of '&&' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   drivers/scsi/ufs/ufshpb.c:53:2: note: Taking true branch
           if (unlikely(last && hpb->last_srgn_entries))
           ^
   drivers/scsi/ufs/ufshpb.c:54:17: note: Access to field 'is_last' results=
 in a dereference of an undefined pointer value (loaded from variable 'srgn=
')
                   srgn->is_last =3D true;
                   ~~~~          ^
>> drivers/scsi/ufs/ufshpb.c:104:22: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           hpb->srgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
                               ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/scsi/ufs/ufshpb.c:78:23: note: Assuming field 'num_pinned' is 0
           hpb->lu_pinned_end =3D hpb_lu_info->num_pinned ?
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:78:23: note: '?' condition is false
   drivers/scsi/ufs/ufshpb.c:84:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: 4 is >=3D 4
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:68:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   drivers/scsi/ufs/ufshpb.c:84:2: note: Left side of '&&' is true
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:68:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:234:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: Assuming the condition is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:241:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: Taking false branch
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:241:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: 4 is >=3D 4
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:68:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   drivers/scsi/ufs/ufshpb.c:89:2: note: Left side of '&&' is true
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:68:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:234:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Assuming the condition is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:241:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))

vim +104 drivers/scsi/ufs/ufshpb.c

f02bc9754a6887 Daejun Park 2021-07-12   68  =

f02bc9754a6887 Daejun Park 2021-07-12   69  static void ufshpb_lu_parameter=
_init(struct ufs_hba *hba,
f02bc9754a6887 Daejun Park 2021-07-12   70  				     struct ufshpb_lu *hpb,
f02bc9754a6887 Daejun Park 2021-07-12   71  				     struct ufshpb_dev_info=
 *hpb_dev_info,
f02bc9754a6887 Daejun Park 2021-07-12   72  				     struct ufshpb_lu_info =
*hpb_lu_info)
f02bc9754a6887 Daejun Park 2021-07-12   73  {
f02bc9754a6887 Daejun Park 2021-07-12   74  	u32 entries_per_rgn;
f02bc9754a6887 Daejun Park 2021-07-12   75  	u64 rgn_mem_size, tmp;
f02bc9754a6887 Daejun Park 2021-07-12   76  =

f02bc9754a6887 Daejun Park 2021-07-12   77  	hpb->lu_pinned_start =3D hpb_l=
u_info->pinned_start;
f02bc9754a6887 Daejun Park 2021-07-12   78  	hpb->lu_pinned_end =3D hpb_lu_=
info->num_pinned ?
f02bc9754a6887 Daejun Park 2021-07-12   79  		(hpb_lu_info->pinned_start + =
hpb_lu_info->num_pinned - 1)
f02bc9754a6887 Daejun Park 2021-07-12   80  		: PINNED_NOT_SET;
f02bc9754a6887 Daejun Park 2021-07-12   81  =

f02bc9754a6887 Daejun Park 2021-07-12   82  	rgn_mem_size =3D (1ULL << hpb_=
dev_info->rgn_size) * HPB_RGN_SIZE_UNIT
f02bc9754a6887 Daejun Park 2021-07-12   83  			* HPB_ENTRY_SIZE;
f02bc9754a6887 Daejun Park 2021-07-12   84  	do_div(rgn_mem_size, HPB_ENTRY=
_BLOCK_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12   85  	hpb->srgn_mem_size =3D (1ULL <=
< hpb_dev_info->srgn_size)
f02bc9754a6887 Daejun Park 2021-07-12   86  		* HPB_RGN_SIZE_UNIT / HPB_ENT=
RY_BLOCK_SIZE * HPB_ENTRY_SIZE;
f02bc9754a6887 Daejun Park 2021-07-12   87  =

f02bc9754a6887 Daejun Park 2021-07-12   88  	tmp =3D rgn_mem_size;
f02bc9754a6887 Daejun Park 2021-07-12   89  	do_div(tmp, HPB_ENTRY_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12   90  	entries_per_rgn =3D (u32)tmp;
f02bc9754a6887 Daejun Park 2021-07-12   91  	hpb->entries_per_rgn_shift =3D=
 ilog2(entries_per_rgn);
f02bc9754a6887 Daejun Park 2021-07-12   92  	hpb->entries_per_rgn_mask =3D =
entries_per_rgn - 1;
f02bc9754a6887 Daejun Park 2021-07-12   93  =

f02bc9754a6887 Daejun Park 2021-07-12   94  	hpb->entries_per_srgn =3D hpb-=
>srgn_mem_size / HPB_ENTRY_SIZE;
f02bc9754a6887 Daejun Park 2021-07-12   95  	hpb->entries_per_srgn_shift =
=3D ilog2(hpb->entries_per_srgn);
f02bc9754a6887 Daejun Park 2021-07-12   96  	hpb->entries_per_srgn_mask =3D=
 hpb->entries_per_srgn - 1;
f02bc9754a6887 Daejun Park 2021-07-12   97  =

f02bc9754a6887 Daejun Park 2021-07-12   98  	tmp =3D rgn_mem_size;
f02bc9754a6887 Daejun Park 2021-07-12   99  	do_div(tmp, hpb->srgn_mem_size=
);
f02bc9754a6887 Daejun Park 2021-07-12  100  	hpb->srgns_per_rgn =3D (int)tm=
p;
f02bc9754a6887 Daejun Park 2021-07-12  101  =

f02bc9754a6887 Daejun Park 2021-07-12  102  	hpb->rgns_per_lu =3D DIV_ROUND=
_UP(hpb_lu_info->num_blocks,
f02bc9754a6887 Daejun Park 2021-07-12  103  				entries_per_rgn);
f02bc9754a6887 Daejun Park 2021-07-12 @104  	hpb->srgns_per_lu =3D DIV_ROUN=
D_UP(hpb_lu_info->num_blocks,
f02bc9754a6887 Daejun Park 2021-07-12  105  				(hpb->srgn_mem_size / HPB_E=
NTRY_SIZE));
f02bc9754a6887 Daejun Park 2021-07-12  106  	hpb->last_srgn_entries =3D hpb=
_lu_info->num_blocks
f02bc9754a6887 Daejun Park 2021-07-12  107  				 % (hpb->srgn_mem_size / HP=
B_ENTRY_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12  108  =

f02bc9754a6887 Daejun Park 2021-07-12  109  	hpb->pages_per_srgn =3D DIV_RO=
UND_UP(hpb->srgn_mem_size, PAGE_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12  110  }
f02bc9754a6887 Daejun Park 2021-07-12  111  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6370995983429088477==--

