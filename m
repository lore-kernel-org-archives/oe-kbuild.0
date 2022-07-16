Content-Type: multipart/mixed; boundary="===============2073412234598283098=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] posix_acl: Use try_cmpxchg in get_acl
Date: Sat, 16 Jul 2022 22:18:50 +0800
Message-ID: <202207162205.iBwToBEr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2073412234598283098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220714173819.13312-1-ubizjak@gmail.com>
References: <20220714173819.13312-1-ubizjak@gmail.com>
TO: Uros Bizjak <ubizjak@gmail.com>
TO: linux-fsdevel(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Uros Bizjak <ubizjak@gmail.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>

Hi Uros,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/posix_ac=
l-Use-try_cmpxchg-in-get_acl/20220715-014002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
4a57a8400075bc5287c5c877702c68aeae2a033d
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-sam440ep_defconfig (https://download.01.org/0day-ci/archive=
/20220716/202207162205.iBwToBEr-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8291d21630df3a57adf=
6d0ed8a1cded2a2700f66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uros-Bizjak/posix_acl-Use-try_cmpx=
chg-in-get_acl/20220715-014002
        git checkout 8291d21630df3a57adf6d0ed8a1cded2a2700f66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:20,
                    from fs/posix_acl.c:14:
   fs/posix_acl.c: In function 'get_acl':
>> include/linux/atomic/atomic-arch-fallback.h:90:34: error: initialization=
 of 'struct posix_acl **' from incompatible pointer type 'void **' [-Werror=
=3Dincompatible-pointer-types]
      90 |         typeof(*(_ptr)) *___op =3D (_oldp), ___o =3D *___op, ___=
r; \
         |                                  ^
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/atomic/atomic-instrumented.h:1978:9: note: in expansion of=
 macro 'arch_try_cmpxchg'
    1978 |         arch_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~
   fs/posix_acl.c:167:23: note: in expansion of macro 'try_cmpxchg'
     167 |         if (unlikely(!try_cmpxchg(p, &sentinel, acl)))
         |                       ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +90 include/linux/atomic/atomic-arch-fallback.h

29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  86  =

29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  87  #ifndef arch_try_cmpxchg
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  88  #define arch_try_cmpxchg(_ptr, _oldp, _new) \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  89  ({ \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29 @90  	typeof(*(_ptr)) *___op =3D (_oldp), ___o =3D *___op, ___r; \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  91  	___r =3D arch_cmpxchg((_ptr), ___o, (_new)); \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  92  	if (unlikely(___r !=3D ___o)) \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  93  		*___op =3D ___r; \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  94  	likely(___r =3D=3D ___o); \
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  95  })
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  96  #endif /* arch_try_cmpxchg */
29f006fdefe6f8 include/linux/atomic-arch-fallback.h Peter Zijlstra 2020-08-=
29  97  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2073412234598283098==--

