Content-Type: multipart/mixed; boundary="===============5890545835093747800=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] posix_acl: Use try_cmpxchg in get_acl
Date: Fri, 15 Jul 2022 09:34:34 +0800
Message-ID: <202207150930.zM626Ujx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5890545835093747800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: llvm(a)lists.linux.dev
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
[also build test ERROR on v5.19-rc6 next-20220714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/posix_ac=
l-Use-try_cmpxchg-in-get_acl/20220715-014002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
4a57a8400075bc5287c5c877702c68aeae2a033d
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: hexagon-randconfig-r045-20220714 (https://download.01.org/0day-ci/a=
rchive/20220715/202207150930.zM626Ujx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9=
c556267086ef9b743a0b57df302eef831b)
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
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/posix_acl.c:167:16: error: incompatible pointer types initializing 't=
ypeof (*(__ai_ptr)) *' (aka 'struct posix_acl **') with an expression of ty=
pe 'typeof (&sentinel)' (aka 'void **') [-Werror,-Wincompatible-pointer-typ=
es]
           if (unlikely(!try_cmpxchg(p, &sentinel, acl)))
               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1978:2: note: expanded from m=
acro 'try_cmpxchg'
           arch_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:90:19: note: expanded from m=
acro 'arch_try_cmpxchg'
           typeof(*(_ptr)) *___op =3D (_oldp), ___o =3D *___op, ___r; \
                            ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   1 error generated.


vim +167 fs/posix_acl.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  107  =

2982baa2ae31eb Christoph Hellwig   2013-12-20  108  struct posix_acl *get_a=
cl(struct inode *inode, int type)
2982baa2ae31eb Christoph Hellwig   2013-12-20  109  {
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  110  	void *sentinel;
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  111  	struct posix_acl **p;
2982baa2ae31eb Christoph Hellwig   2013-12-20  112  	struct posix_acl *acl;
2982baa2ae31eb Christoph Hellwig   2013-12-20  113  =

b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  114  	/*
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  115  	 * The sentinel is use=
d to detect when another operation like
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  116  	 * set_cached_acl() or=
 forget_cached_acl() races with get_acl().
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  117  	 * It is guaranteed th=
at is_uncached_acl(sentinel) is true.
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  118  	 */
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  119  =

2982baa2ae31eb Christoph Hellwig   2013-12-20  120  	acl =3D get_cached_acl=
(inode, type);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  121  	if (!is_uncached_acl(a=
cl))
2982baa2ae31eb Christoph Hellwig   2013-12-20  122  		return acl;
2982baa2ae31eb Christoph Hellwig   2013-12-20  123  =

2982baa2ae31eb Christoph Hellwig   2013-12-20  124  	if (!IS_POSIXACL(inode=
))
2982baa2ae31eb Christoph Hellwig   2013-12-20  125  		return NULL;
2982baa2ae31eb Christoph Hellwig   2013-12-20  126  =

b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  127  	sentinel =3D uncached_=
acl_sentinel(current);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  128  	p =3D acl_by_type(inod=
e, type);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  129  =

b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  130  	/*
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  131  	 * If the ACL isn't be=
ing read yet, set our sentinel.  Otherwise, the
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  132  	 * current value of th=
e ACL will not be ACL_NOT_CACHED and so our own
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  133  	 * sentinel will not b=
e set; another task will update the cache.  We
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  134  	 * could wait for that=
 other task to complete its job, but it's easier
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  135  	 * to just call ->get_=
acl to fetch the ACL ourself.  (This is going to
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  136  	 * be an unlikely race=
.)
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  137  	 */
d1cef29adc2293 Arnd Bergmann       2021-11-05  138  	cmpxchg(p, ACL_NOT_CAC=
HED, sentinel);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  139  =

2982baa2ae31eb Christoph Hellwig   2013-12-20  140  	/*
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  141  	 * Normally, the ACL r=
eturned by ->get_acl will be cached.
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  142  	 * A filesystem can pr=
event that by calling
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  143  	 * forget_cached_acl(i=
node, type) in ->get_acl.
2982baa2ae31eb Christoph Hellwig   2013-12-20  144  	 *
2982baa2ae31eb Christoph Hellwig   2013-12-20  145  	 * If the filesystem d=
oesn't have a get_acl() function at all, we'll
2982baa2ae31eb Christoph Hellwig   2013-12-20  146  	 * just create the neg=
ative cache entry.
2982baa2ae31eb Christoph Hellwig   2013-12-20  147  	 */
2982baa2ae31eb Christoph Hellwig   2013-12-20  148  	if (!inode->i_op->get_=
acl) {
2982baa2ae31eb Christoph Hellwig   2013-12-20  149  		set_cached_acl(inode,=
 type, NULL);
2982baa2ae31eb Christoph Hellwig   2013-12-20  150  		return NULL;
2982baa2ae31eb Christoph Hellwig   2013-12-20  151  	}
0cad6246621b58 Miklos Szeredi      2021-08-18  152  	acl =3D inode->i_op->g=
et_acl(inode, type, false);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  153  =

b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  154  	if (IS_ERR(acl)) {
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  155  		/*
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  156  		 * Remove our sentine=
l so that we don't block future attempts
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  157  		 * to cache the ACL.
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  158  		 */
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  159  		cmpxchg(p, sentinel, =
ACL_NOT_CACHED);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  160  		return acl;
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  161  	}
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  162  =

b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  163  	/*
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  164  	 * Cache the result, b=
ut only if our sentinel is still in place.
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  165  	 */
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  166  	posix_acl_dup(acl);
8291d21630df3a Uros Bizjak         2022-07-14 @167  	if (unlikely(!try_cmpx=
chg(p, &sentinel, acl)))
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  168  		posix_acl_release(acl=
);
b8a7a3a6674725 Andreas Gruenbacher 2016-03-24  169  	return acl;
2982baa2ae31eb Christoph Hellwig   2013-12-20  170  }
2982baa2ae31eb Christoph Hellwig   2013-12-20  171  EXPORT_SYMBOL(get_acl);
2982baa2ae31eb Christoph Hellwig   2013-12-20  172  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5890545835093747800==--

