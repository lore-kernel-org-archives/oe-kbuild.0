Content-Type: multipart/mixed; boundary="===============7877491778594218931=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/6] Kbuild: compile kernel with gnu11 std
Date: Fri, 11 Mar 2022 01:35:55 +0800
Message-ID: <202203110136.AB1vmAMG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7877491778594218931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220301075839.4156-2-xiam0nd.tong@gmail.com>
References: <20220301075839.4156-2-xiam0nd.tong@gmail.com>
TO: Xiaomeng Tong <xiam0nd.tong@gmail.com>
TO: torvalds(a)linux-foundation.org
CC: arnd(a)arndb.de
CC: jakobkoschel(a)gmail.com
CC: linux-kernel(a)vger.kernel.org
CC: gregkh(a)linuxfoundation.org
CC: keescook(a)chromium.org
CC: jannh(a)google.com
CC: linux-kbuild(a)vger.kernel.org
CC: linux-mm(a)kvack.org
CC: netdev(a)vger.kernel.org
CC: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Hi Xiaomeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on vkoul-dmaengine/next soc/for-next linus/master =
v5.17-rc7 next-20220309]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xiaomeng-Tong/list_for_eac=
h_entry-make-iterator-invisiable-outside-the-loop/20220301-160113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20311/202203110136.AB1vmAMG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/84ec4077430a7e8c23ea1ebc7=
b69e254fda25cb1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xiaomeng-Tong/list_for_each_entry-=
make-iterator-invisiable-outside-the-loop/20220301-160113
        git checkout 84ec4077430a7e8c23ea1ebc7b69e254fda25cb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:513:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr, bytes, eeprom->len);
           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:513:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, bytes, eeprom->len);
           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1222:2: warning: Value =
stored to 'ctrl_reg' is never read [clang-analyzer-deadcode.DeadStores]
           ctrl_reg =3D er32(CTRL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1222:2: note: Value sto=
red to 'ctrl_reg' is never read
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1360:2: warning: Call t=
o function 'memset' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memset_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skb->data, 0xFF, frame_size);
           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1360:2: note: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(skb->data, 0xFF, frame_size);
           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1362:2: warning: Call t=
o function 'memset' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memset_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&skb->data[frame_size / 2], 0xAA, frame_size / 2 - 1);
           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1362:2: note: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&skb->data[frame_size / 2], 0xAA, frame_size / 2 - 1);
           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1847:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, e1000_gstrings_test, sizeof(e1000_gstrings_=
test));
                   ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1847:3: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, e1000_gstrings_test, sizeof(e1000_gstrings_=
test));
                   ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1851:4: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(p, e1000_gstrings_stats[i].stat_string,
                           ^~~~~~
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:1851:4: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(p, e1000_gstrings_stats[i].stat_string,
                           ^~~~~~
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (101 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (101 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   net/netfilter/nfnetlink.c:429:4: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINTR;
                           ^     ~~~~~~
   net/netfilter/nfnetlink.c:429:4: note: Value stored to 'err' is never re=
ad
                           err =3D -EINTR;
                           ^     ~~~~~~
   net/netfilter/nfnetlink.c:434:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&extack, 0, sizeof(extack));
                   ^~~~~~
   net/netfilter/nfnetlink.c:434:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&extack, 0, sizeof(extack));
                   ^~~~~~
   net/netfilter/nfnetlink.c:436:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   net/netfilter/nfnetlink.c:436:3: note: Value stored to 'err' is never re=
ad
                   err =3D 0;
                   ^     ~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/base/regmap/regmap-mmio.c:52:3: warning: Value stored to 'min_st=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   min_stride =3D 0;
                   ^            ~
   drivers/base/regmap/regmap-mmio.c:52:3: note: Value stored to 'min_strid=
e' is never read
                   min_stride =3D 0;
                   ^            ~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/base/regmap/regmap-irq.c:444:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(data->status_buf, 0, size);
                   ^~~~~~
   drivers/base/regmap/regmap-irq.c:444:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(data->status_buf, 0, size);
                   ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
>> drivers/block/zram/zram_drv.c:457:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, "none\n", 5);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:457:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, "none\n", 5);
                   ^~~~~~
>> drivers/block/zram/zram_drv.c:469:2: warning: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(buf, p, ret);
           ^~~~~~~
   drivers/block/zram/zram_drv.c:469:2: note: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11
           memmove(buf, p, ret);
           ^~~~~~~
   drivers/block/zram/zram_drv.c:1051:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(zram->compressor, compressor);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1051:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(zram->compressor, compressor);
           ^~~~~~
>> drivers/block/zram/zram_drv.c:1100:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pool_stats, 0x00, sizeof(struct zs_pool_stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1100:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&pool_stats, 0x00, sizeof(struct zs_pool_stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1301:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, PAGE_SIZE);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1301:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, PAGE_SIZE);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1342:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst + bvec->bv_offset, src + offset, bvec->bv_len=
);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1342:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst + bvec->bv_offset, src + offset, bvec->bv_len=
);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1435:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, comp_len);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1435:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, comp_len);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1495:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst + offset, src + bvec->bv_offset, bvec->bv_len=
);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1495:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst + offset, src + bvec->bv_offset, bvec->bv_len=
);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1739:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&zram->stats, 0, sizeof(zram->stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1739:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&zram->stats, 0, sizeof(zram->stats));
           ^~~~~~
>> drivers/block/zram/zram_drv.c:1946:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(zram->disk->disk_name, 16, "zram%d", device_id);
           ^~~~~~~~
   drivers/block/zram/zram_drv.c:1946:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(zram->disk->disk_name, 16, "zram%d", device_id);
           ^~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/keyboard/lkkbd.c:627:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:627:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/keyboard/matrix_keypad.c:127:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(new_state, 0, sizeof(new_state));
           ^~~~~~
   drivers/input/keyboard/matrix_keypad.c:127:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(new_state, 0, sizeof(new_state));
           ^~~~~~
   drivers/input/keyboard/matrix_keypad.c:161:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(keypad->last_key_state, new_state, sizeof(new_state));
           ^~~~~~
   drivers/input/keyboard/matrix_keypad.c:161:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(keypad->last_key_state, new_state, sizeof(new_state));
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   net/sched/sch_hfsc.c:1131:17: warning: Although the value stored to 'res=
ult' is used in the enclosing expression, the value is never actually read =
from 'result' [clang-analyzer-deadcode.DeadStores]
           while (tcf && (result =3D tcf_classify(skb, NULL, tcf, &res, fal=
se)) >=3D 0) {
                          ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_hfsc.c:1131:17: note: Although the value stored to 'result=
' is used in the enclosing expression, the value is never actually read fro=
m 'result'
           while (tcf && (result =3D tcf_classify(skb, NULL, tcf, &res, fal=
se)) >=3D 0) {
                          ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/tty/tty_io.c:1192:2: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           sprintf(p, "%s%c%x",
           ^~~~~~~
   drivers/tty/tty_io.c:1192:2: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           sprintf(p, "%s%c%x",
           ^~~~~~~
   drivers/tty/tty_io.c:1211:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   return sprintf(p, "%s", driver->name);
                          ^~~~~~~
   drivers/tty/tty_io.c:1211:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   return sprintf(p, "%s", driver->name);
                          ^~~~~~~
   drivers/tty/tty_io.c:1213:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   return sprintf(p, "%s%d", driver->name,
                          ^~~~~~~
   drivers/tty/tty_io.c:1213:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   return sprintf(p, "%s%d", driver->name,
                          ^~~~~~~
   drivers/tty/tty_io.c:2575:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icount, 0, sizeof(*icount));
           ^~~~~~
   drivers/tty/tty_io.c:2575:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(icount, 0, sizeof(*icount));
           ^~~~~~
   drivers/tty/tty_io.c:2630:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&v, 0, sizeof(v));
           ^~~~~~
   drivers/tty/tty_io.c:2630:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&v, 0, sizeof(v));
           ^~~~~~
   drivers/tty/tty_io.c:3558:13: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                           count +=3D sprintf(buf + count, "%s%d",
                                    ^~~~~~~
   drivers/tty/tty_io.c:3558:13: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                           count +=3D sprintf(buf + count, "%s%d",
                                    ^~~~~~~
   drivers/tty/tty_io.c:3561:12: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count +=3D sprintf(buf + count, "%c", i ? ' ':'\n');
                            ^~~~~~~
   drivers/tty/tty_io.c:3561:12: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   count +=3D sprintf(buf + count, "%c", i ? ' ':'\n');
                            ^~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +457 drivers/block/zram/zram_drv.c

013bf95a83ec760 Minchan Kim 2017-09-06  445  =

013bf95a83ec760 Minchan Kim 2017-09-06  446  static ssize_t backing_dev_sho=
w(struct device *dev,
013bf95a83ec760 Minchan Kim 2017-09-06  447  		struct device_attribute *att=
r, char *buf)
013bf95a83ec760 Minchan Kim 2017-09-06  448  {
f7daefe4231e573 Chenwandun  2019-10-18  449  	struct file *file;
013bf95a83ec760 Minchan Kim 2017-09-06  450  	struct zram *zram =3D dev_to_=
zram(dev);
013bf95a83ec760 Minchan Kim 2017-09-06  451  	char *p;
013bf95a83ec760 Minchan Kim 2017-09-06  452  	ssize_t ret;
013bf95a83ec760 Minchan Kim 2017-09-06  453  =

013bf95a83ec760 Minchan Kim 2017-09-06  454  	down_read(&zram->init_lock);
f7daefe4231e573 Chenwandun  2019-10-18  455  	file =3D zram->backing_dev;
f7daefe4231e573 Chenwandun  2019-10-18  456  	if (!file) {
013bf95a83ec760 Minchan Kim 2017-09-06 @457  		memcpy(buf, "none\n", 5);
013bf95a83ec760 Minchan Kim 2017-09-06  458  		up_read(&zram->init_lock);
013bf95a83ec760 Minchan Kim 2017-09-06  459  		return 5;
013bf95a83ec760 Minchan Kim 2017-09-06  460  	}
013bf95a83ec760 Minchan Kim 2017-09-06  461  =

013bf95a83ec760 Minchan Kim 2017-09-06  462  	p =3D file_path(file, buf, PA=
GE_SIZE - 1);
013bf95a83ec760 Minchan Kim 2017-09-06  463  	if (IS_ERR(p)) {
013bf95a83ec760 Minchan Kim 2017-09-06  464  		ret =3D PTR_ERR(p);
013bf95a83ec760 Minchan Kim 2017-09-06  465  		goto out;
013bf95a83ec760 Minchan Kim 2017-09-06  466  	}
013bf95a83ec760 Minchan Kim 2017-09-06  467  =

013bf95a83ec760 Minchan Kim 2017-09-06  468  	ret =3D strlen(p);
013bf95a83ec760 Minchan Kim 2017-09-06 @469  	memmove(buf, p, ret);
013bf95a83ec760 Minchan Kim 2017-09-06  470  	buf[ret++] =3D '\n';
013bf95a83ec760 Minchan Kim 2017-09-06  471  out:
013bf95a83ec760 Minchan Kim 2017-09-06  472  	up_read(&zram->init_lock);
013bf95a83ec760 Minchan Kim 2017-09-06  473  	return ret;
013bf95a83ec760 Minchan Kim 2017-09-06  474  }
013bf95a83ec760 Minchan Kim 2017-09-06  475  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7877491778594218931==--

