Content-Type: multipart/mixed; boundary="===============9058629927069570603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kbuild: copy scripts/atomic/atomic-*.h to include/generated/atomic-*.h
Date: Tue, 17 May 2022 03:44:08 +0800
Message-ID: <202205170344.XqrtuaVM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9058629927069570603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220513185340.239753-1-masahiroy@kernel.org>
References: <20220513185340.239753-1-masahiroy@kernel.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: linux-kbuild(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Mark Rutland <mark.rutland@arm.com>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc7 next-202205=
16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/kbui=
ld-copy-scripts-atomic-atomic-h-to-include-generated-atomic-h/20220514-0256=
23
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220512 (https://download.01.org/0day-ci/archi=
ve/20220517/202205170344.XqrtuaVM-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 381894=
38b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/3f6dd60121830fdd373=
3dd804d9ae163d88acc98
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahiro-Yamada/kbuild-copy-script=
s-atomic-atomic-h-to-include-generated-atomic-h/20220514-025623
        git checkout 3f6dd60121830fdd3733dd804d9ae163d88acc98
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^
   drivers/vhost/vhost.c:2278:3: note: Taking false branch
                   if (unlikely(++found > vq->num)) {
                   ^
   drivers/vhost/vhost.c:2284:9: note: Calling 'vhost_get_desc'
                   ret =3D vhost_get_desc(vq, &desc, i);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:1052:9: note: Calling 'vhost_copy_from_user'
           return vhost_copy_from_user(vq, desc, vq->desc + idx, sizeof(*de=
sc));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/vhost/vhost.c:857:11: note: Field 'iotlb' is non-null
           if (!vq->iotlb)
                    ^
   drivers/vhost/vhost.c:857:2: note: Taking false branch
           if (!vq->iotlb)
           ^
   drivers/vhost/vhost.c:870:7: note: 'uaddr' is null
                   if (uaddr)
                       ^~~~~
   drivers/vhost/vhost.c:870:3: note: Taking false branch
                   if (uaddr)
                   ^
   drivers/vhost/vhost.c:876:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/vhost/vhost.c:876:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/vhost/vhost.c:883:9: note: Calling 'copy_from_iter'
                   ret =3D copy_from_iter(to, size, &f);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uio.h:168:15: note: Assuming the condition is true
           if (unlikely(!check_copy_size(addr, bytes, false)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/uio.h:168:2: note: Taking true branch
           if (unlikely(!check_copy_size(addr, bytes, false)))
           ^
   include/linux/uio.h:169:3: note: Returning without writing to 'addr->fla=
gs'
                   return 0;
                   ^
   drivers/vhost/vhost.c:883:9: note: Returning from 'copy_from_iter'
                   ret =3D copy_from_iter(to, size, &f);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:884:7: note: 'ret' is not equal to 'size'
                   if (ret =3D=3D size)
                       ^~~
   drivers/vhost/vhost.c:884:3: note: Taking false branch
                   if (ret =3D=3D size)
                   ^
   drivers/vhost/vhost.c:889:2: note: Returning without writing to 'to->fla=
gs'
           return ret;
           ^
   drivers/vhost/vhost.c:1052:9: note: Returning from 'vhost_copy_from_user'
           return vhost_copy_from_user(vq, desc, vq->desc + idx, sizeof(*de=
sc));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/vhost/vhost.c:1052:2: note: Returning without writing to 'desc->=
flags'
           return vhost_copy_from_user(vq, desc, vq->desc + idx, sizeof(*de=
sc));
           ^
   drivers/vhost/vhost.c:2284:9: note: Returning from 'vhost_get_desc'
                   ret =3D vhost_get_desc(vq, &desc, i);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.c:2285:3: note: Taking false branch
                   if (unlikely(ret)) {
                   ^
   drivers/vhost/vhost.c:2290:18: note: The left operand of '&' is a garbag=
e value
                   if (desc.flags & cpu_to_vhost16(vq, VRING_DESC_F_INDIREC=
T)) {
                       ~~~~~~~~~~ ^
   drivers/vhost/vhost.c:2584:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&node->msg, 0, sizeof node->msg);
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
   drivers/vhost/vhost.c:2584:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&node->msg, 0, sizeof node->msg);
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
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
>> ./include/generated/atomic-instrumented.h:28:9: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   net/lapb/lapb_iface.c:177:2: note: Loop condition is false.  Exiting loop
           write_lock_bh(&lapb_list_lock);
           ^
   include/linux/rwlock.h:95:30: note: expanded from macro 'write_lock_bh'
   #define write_lock_bh(lock)             _raw_write_lock_bh(lock)
                                           ^
   include/linux/spinlock_api_up.h:65:35: note: expanded from macro '_raw_w=
rite_lock_bh'
   #define _raw_write_lock_bh(lock)                __LOCK_BH(lock)
                                                   ^
   include/linux/spinlock_api_up.h:34:63: note: expanded from macro '__LOCK=
_BH'
     do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK(lo=
ck); } while (0)
                                                                 ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   net/lapb/lapb_iface.c:177:2: note: Loop condition is false.  Exiting loop
           write_lock_bh(&lapb_list_lock);
           ^
   include/linux/rwlock.h:95:30: note: expanded from macro 'write_lock_bh'
   #define write_lock_bh(lock)             _raw_write_lock_bh(lock)
                                           ^
   include/linux/spinlock_api_up.h:65:35: note: expanded from macro '_raw_w=
rite_lock_bh'
   #define _raw_write_lock_bh(lock)                __LOCK_BH(lock)
                                                   ^
   include/linux/spinlock_api_up.h:34:3: note: expanded from macro '__LOCK_=
BH'
     do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK(lo=
ck); } while (0)
     ^
   net/lapb/lapb_iface.c:179:6: note: Assuming 'lapb' is non-null
           if (!lapb)
               ^~~~~
   net/lapb/lapb_iface.c:179:2: note: Taking false branch
           if (!lapb)
           ^
   net/lapb/lapb_iface.c:181:2: note: Calling 'lapb_put'
           lapb_put(lapb);
           ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:57:2: note: Taking true branch
           if (refcount_dec_and_test(&lapb->refcnt))
           ^
   net/lapb/lapb_iface.c:58:3: note: Calling 'lapb_free_cb'
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:47:2: note: Memory is released
           kfree(lapb);
           ^~~~~~~~~~~
   net/lapb/lapb_iface.c:58:3: note: Returning; memory was released via 1st=
 parameter
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:181:2: note: Returning; memory was released via 1s=
t parameter
           lapb_put(lapb);
           ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:184:9: note: Calling 'refcount_read'
           while (refcount_read(&lapb->refcnt) > 2)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:147:9: note: Calling 'atomic_read'
           return atomic_read(&r->refs);
                  ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/atomic-instrumented.h:28:9: note: Left side of '||' =
is false
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   ./include/generated/atomic-instrumented.h:28:9: note: Left side of '||' =
is false
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   ./include/generated/atomic-instrumented.h:28:9: note: Left side of '||' =
is true
           return arch_atomic_read(v);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9058629927069570603==--

