Content-Type: multipart/mixed; boundary="===============6213558606330078473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/6] Kbuild: compile kernel with gnu11 std
Date: Fri, 04 Mar 2022 10:47:05 +0800
Message-ID: <202203040554.spGLPb81-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6213558606330078473==
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
v5.17-rc6 next-20220303]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xiaomeng-Tong/list_for_eac=
h_entry-make-iterator-invisiable-outside-the-loop/20220301-160113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20304/202203040554.spGLPb81-lkp(a)intel.com/config)
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
           ^~~~~~
   drivers/net/slip/slhc.c:632:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
             memcpy(cp, cs->cs_tcpopt, ((thp->doff) - 5) * 4);
             ^~~~~~
   drivers/net/slip/slhc.c:632:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
             memcpy(cp, cs->cs_tcpopt, ((thp->doff) - 5) * 4);
             ^~~~~~
   drivers/net/slip/slhc.c:679:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cs->cs_ip,icp,20);
           ^~~~~~
   drivers/net/slip/slhc.c:679:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&cs->cs_ip,icp,20);
           ^~~~~~
   drivers/net/slip/slhc.c:680:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cs->cs_tcp,icp + ihl*4,20);
           ^~~~~~
   drivers/net/slip/slhc.c:680:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&cs->cs_tcp,icp + ihl*4,20);
           ^~~~~~
   drivers/net/slip/slhc.c:682:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
             memcpy(cs->cs_ipopt, icp + sizeof(struct iphdr), (ihl - 5) * 4=
);
             ^~~~~~
   drivers/net/slip/slhc.c:682:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
             memcpy(cs->cs_ipopt, icp + sizeof(struct iphdr), (ihl - 5) * 4=
);
             ^~~~~~
   drivers/net/slip/slhc.c:684:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
             memcpy(cs->cs_tcpopt, icp + ihl*4 + sizeof(struct tcphdr), (cs=
->cs_tcp.doff - 5) * 4);
             ^~~~~~
   drivers/net/slip/slhc.c:684:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
             memcpy(cs->cs_tcpopt, icp + ihl*4 + sizeof(struct tcphdr), (cs=
->cs_tcp.doff - 5) * 4);
             ^~~~~~
   Suppressed 99 warnings (99 in non-user code).
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
   29 warnings generated.
   drivers/input/serio/libps2.c:245:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(send_param, param, send);
           ^~~~~~
   drivers/input/serio/libps2.c:245:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(send_param, param, send);
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/input/gameport/gameport.c:462:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", gameport->name);
                  ^~~~~~~
   drivers/input/gameport/gameport.c:462:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", gameport->name);
                  ^~~~~~~
   drivers/input/gameport/gameport.c:516:2: warning: Call to function 'vsnp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'vsnprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(gameport->phys, sizeof(gameport->phys), fmt, args);
           ^~~~~~~~~
   drivers/input/gameport/gameport.c:516:2: note: Call to function 'vsnprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(gameport->phys, sizeof(gameport->phys), fmt, args);
           ^~~~~~~~~
   drivers/input/gameport/gameport.c:681:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", driver->description ? driver->descri=
ption : "(none)");
                  ^~~~~~~
   drivers/input/gameport/gameport.c:681:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", driver->description ? driver->descri=
ption : "(none)");
                  ^~~~~~~
   Suppressed 12 warnings (12 in non-user code).
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
   57 warnings generated.
   drivers/ptp/ptp_kvm_common.c:100:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ts, &tspec, sizeof(struct timespec64));
           ^~~~~~
   drivers/ptp/ptp_kvm_common.c:100:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(ts, &tspec, sizeof(struct timespec64));
           ^~~~~~
   Suppressed 56 warnings (56 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/power/supply/power_supply_sysfs.c:251:13: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           count +=3D sprintf(buf + count, "[%s] ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:251:13: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           count +=3D sprintf(buf + count, "[%s] ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:255:13: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           count +=3D sprintf(buf + count, "%s ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:255:13: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           count +=3D sprintf(buf + count, "%s ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:299:10: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:299:10: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:308:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:308:9: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:311:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:311:9: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:415:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:415:4: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/net/phy/nxp-c45-tja11xx.c:438:3: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&shhwtstamps, 0, sizeof(shhwtstamps));
                   ^~~~~~
   drivers/net/phy/nxp-c45-tja11xx.c:438:3: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                   memset(&shhwtstamps, 0, sizeof(shhwtstamps));
                   ^~~~~~
   drivers/net/phy/nxp-c45-tja11xx.c:845:3: warning: Call to function 'strn=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'strncpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(data + i * ETH_GSTRING_LEN,
                   ^~~~~~~
   drivers/net/phy/nxp-c45-tja11xx.c:845:3: note: Call to function 'strncpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(data + i * ETH_GSTRING_LEN,
                   ^~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/net/phy/realtek.c:813:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D phy_write_paged(phydev, 0xa42, RTL9000A_GINMR, v=
al);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/realtek.c:813:3: note: Value stored to 'err' is never re=
ad
                   err =3D phy_write_paged(phydev, 0xa42, RTL9000A_GINMR, v=
al);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/realtek.c:820:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D rtl9000a_ack_interrupt(phydev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/realtek.c:820:3: note: Value stored to 'err' is never re=
ad
                   err =3D rtl9000a_ack_interrupt(phydev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (59 in non-user code).
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
--===============6213558606330078473==--

