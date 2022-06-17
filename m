Content-Type: multipart/mixed; boundary="===============5084807392258934923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v7 3/5] bpf: Inline calls to bpf_loop when callback is known
Date: Fri, 17 Jun 2022 23:24:53 +0800
Message-ID: <202206172312.hdBsxxl6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5084807392258934923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: include/l=
inux/bpf_verifier.h:348:26: sparse: sparse: dubious one-bit signed bitfield"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220613205008.212724-4-eddyz87@gmail.com>
References: <20220613205008.212724-4-eddyz87@gmail.com>
TO: Eduard Zingerman <eddyz87@gmail.com>
TO: bpf(a)vger.kernel.org
TO: ast(a)kernel.org
TO: andrii(a)kernel.org
TO: daniel(a)iogearbox.net
TO: kernel-team(a)fb.com
TO: song(a)kernel.org
TO: joannelkoong(a)gmail.com
CC: eddyz87(a)gmail.com

Hi Eduard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf=
_loop-inlining/20220614-051405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220=
617/202206172312.hdBsxxl6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/intel-lab-lkp/linux/commit/743c1f24e0257d65327=
4ebf1b2cd0b62a0ea591d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eduard-Zingerman/bpf_loop-inlining=
/20220614-051405
        git checkout 743c1f24e0257d653274ebf1b2cd0b62a0ea591d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c: note: in included file:
>> include/linux/bpf_verifier.h:348:26: sparse: sparse: dubious one-bit sig=
ned bitfield
   include/linux/bpf_verifier.h:349:29: sparse: sparse: dubious one-bit sig=
ned bitfield
   kernel/bpf/core.c:221:49: sparse: sparse: arithmetics on pointers to fun=
ctions
   kernel/bpf/core.c:1850:43: sparse: sparse: arithmetics on pointers to fu=
nctions
   kernel/bpf/core.c:1855:48: sparse: sparse: arithmetics on pointers to fu=
nctions
   kernel/bpf/core.c:2103:77: sparse: sparse: subtraction of functions? Sha=
re your drugs
   kernel/bpf/core.c: note: in included file (through include/linux/rbtree_=
latch.h, include/linux/bpf.h, include/linux/filter.h):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +348 include/linux/bpf_verifier.h

58e2af8b3a6b58 Jakub Kicinski   2016-09-21  346  =

743c1f24e0257d Eduard Zingerman 2022-06-13  347  struct bpf_loop_inline_sta=
te {
743c1f24e0257d Eduard Zingerman 2022-06-13 @348  	int initialized:1; /* set=
 to true upon first entry */
743c1f24e0257d Eduard Zingerman 2022-06-13  349  	int fit_for_inline:1; /* =
true if callback function is the same
743c1f24e0257d Eduard Zingerman 2022-06-13  350  			       * at each call a=
nd flags are always zero
743c1f24e0257d Eduard Zingerman 2022-06-13  351  			       */
743c1f24e0257d Eduard Zingerman 2022-06-13  352  	u32 callback_subprogno; /=
* valid when fit_for_inline is true */
743c1f24e0257d Eduard Zingerman 2022-06-13  353  };
743c1f24e0257d Eduard Zingerman 2022-06-13  354  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5084807392258934923==--

