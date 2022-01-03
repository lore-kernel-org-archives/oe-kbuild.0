Content-Type: multipart/mixed; boundary="===============8972610782821669573=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3790/9897] drivers/gpu/drm/i915/i915_vma_snapshot.c:64:17: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 03 Jan 2022 12:58:20 +0800
Message-ID: <202201031211.QpQPHUFA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8972610782821669573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
CC: Ramalingam C <ramalingam.c@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: ff20afc4cee7b65f752b1da6d5da4c0bea1431b9 [3790/9897] drm/i915: Upda=
te error capture code to avoid using the current vma state
:::::: branch date: 10 days ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c001-20211207 (https://download.01.org/0day-ci/arch=
ive/20220103/202201031211.QpQPHUFA-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dff20afc4cee7b65f752b1da6d5da4c0bea1431b9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ff20afc4cee7b65f752b1da6d5da4c0bea1431b9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/tty/tty_ldisc.c:674:3: note: Loop condition is false.  Exiting l=
oop
                   BUG_ON(disc =3D=3D N_TTY);
                   ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/tty/tty_ldisc.c:747:13: note: Returned allocated memory
                                   WARN_ON(tty_ldisc_reinit(tty, N_NULL) < =
0);
                                           ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/tty/tty_ldisc.c:747:5: note: Potential memory leak
                                   WARN_ON(tty_ldisc_reinit(tty, N_NULL) < =
0);
                                   ^
   include/asm-generic/bug.h:121:2: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/regulator/palmas-regulator.c:1598:36: warning: Value stored to '=
pdata' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct palmas_pmic_platform_data *pdata =3D dev_get_platdata(&pd=
ev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/regulator/palmas-regulator.c:1598:36: note: Value stored to 'pda=
ta' during its initialization is never read
           struct palmas_pmic_platform_data *pdata =3D dev_get_platdata(&pd=
ev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (2 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
>> drivers/gpu/drm/i915/i915_vma_snapshot.c:64:17: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           vsnap->present =3D false;
                          ^
   drivers/gpu/drm/i915/i915_vma_snapshot.c:92:7: note: Calling 'kref_put'
           if (!kref_put(&vsnap->kref, vma_snapshot_release))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'vma_snapshot_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_vma_snapshot.c:65:2: note: Assuming field 'pag=
es_rsgt' is null
           if (vsnap->pages_rsgt)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/i915/i915_vma_snapshot.c:65:2: note: '?' condition is fa=
lse
           if (vsnap->pages_rsgt)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/i915/i915_vma_snapshot.c:65:13: note: Field 'pages_rsgt'=
 is null
           if (vsnap->pages_rsgt)
                      ^
   drivers/gpu/drm/i915/i915_vma_snapshot.c:65:2: note: '?' condition is fa=
lse
           if (vsnap->pages_rsgt)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/i915/i915_vma_snapshot.c:65:2: note: Taking false branch
           if (vsnap->pages_rsgt)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/i915/i915_vma_snapshot.c:67:6: note: Assuming field 'ons=
tack' is false
           if (!vsnap->onstack)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/i915/i915_vma_snapshot.c:67:2: note: '?' condition is fa=
lse
           if (!vsnap->onstack)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/i915/i915_vma_snapshot.c:67:14: note: Field 'onstack' is=
 false
           if (!vsnap->onstack)

vim +64 drivers/gpu/drm/i915/i915_vma_snapshot.c

ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  58  =

ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  59  static void vma_snapsh=
ot_release(struct kref *ref)
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  60  {
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  61  	struct i915_vma_snaps=
hot *vsnap =3D
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  62  		container_of(ref, ty=
peof(*vsnap), kref);
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  63  =

ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29 @64  	vsnap->present =3D fa=
lse;
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  65  	if (vsnap->pages_rsgt)
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  66  		i915_refct_sgt_put(v=
snap->pages_rsgt);
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  67  	if (!vsnap->onstack)
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  68  		kfree(vsnap);
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  69  }
ff20afc4cee7b6 Thomas Hellstr=C3=B6m 2021-11-29  70  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8972610782821669573==--

