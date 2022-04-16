Content-Type: multipart/mixed; boundary="===============1043508764796864398=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4227/4328] mm/vmscan.c:3990:29: sparse: sparse: cast to non-scalar
Date: Sat, 16 Apr 2022 10:58:52 +0800
Message-ID: <202204161028.ly942P0r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1043508764796864398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: 32be05f0e1b84564fa4e5d1810191a198c47f87b [4227/4328] mm: multi-gen =
LRU: support page table walks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/2022041=
6/202204161028.ly942P0r-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D32be05f0e1b84564fa4e5d1810191a198c47f87b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 32be05f0e1b84564fa4e5d1810191a198c47f87b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   mm/vmscan.c:3184:40: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected struct task_struct *p @@     got struc=
t task_struct [noderef] __rcu *owner @@
   mm/vmscan.c:3184:40: sparse:     expected struct task_struct *p
   mm/vmscan.c:3184:40: sparse:     got struct task_struct [noderef] __rcu =
*owner
>> mm/vmscan.c:3990:29: sparse: sparse: cast to non-scalar
>> mm/vmscan.c:3990:29: sparse: sparse: cast from non-scalar
   mm/vmscan.c:1329:28: sparse: sparse: context imbalance in '__remove_mapp=
ing' - unexpected unlock
   mm/vmscan.c:2203:33: sparse: sparse: context imbalance in 'folio_isolate=
_lru' - unexpected unlock
   mm/vmscan.c:2296:48: sparse: sparse: context imbalance in 'move_pages_to=
_lru' - unexpected unlock
   mm/vmscan.c: note: in included file (through include/linux/rculist.h, in=
clude/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:725:9: sparse: sparse: context imbalance in 'lr=
u_gen_look_around' - different lock contexts for basic block
   mm/vmscan.c: note: in included file (through include/linux/swap.h):
   include/linux/memcontrol.h:1610:39: sparse: sparse: context imbalance in=
 'check_move_unevictable_pages' - unexpected unlock

vim +3990 mm/vmscan.c

32be05f0e1b8456 Yu Zhao 2022-04-13  3975  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3976  static int walk_pud_range(p4d_t *=
p4d, unsigned long start, unsigned long end,
32be05f0e1b8456 Yu Zhao 2022-04-13  3977  			  struct mm_walk *walk)
32be05f0e1b8456 Yu Zhao 2022-04-13  3978  {
32be05f0e1b8456 Yu Zhao 2022-04-13  3979  	int i;
32be05f0e1b8456 Yu Zhao 2022-04-13  3980  	pud_t *pud;
32be05f0e1b8456 Yu Zhao 2022-04-13  3981  	unsigned long addr;
32be05f0e1b8456 Yu Zhao 2022-04-13  3982  	unsigned long next;
32be05f0e1b8456 Yu Zhao 2022-04-13  3983  	struct lru_gen_mm_walk *priv =3D=
 walk->private;
32be05f0e1b8456 Yu Zhao 2022-04-13  3984  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3985  	VM_BUG_ON(p4d_leaf(*p4d));
32be05f0e1b8456 Yu Zhao 2022-04-13  3986  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3987  	pud =3D pud_offset(p4d, start & =
P4D_MASK);
32be05f0e1b8456 Yu Zhao 2022-04-13  3988  restart:
32be05f0e1b8456 Yu Zhao 2022-04-13  3989  	for (i =3D pud_index(start), add=
r =3D start; addr !=3D end; i++, addr =3D next) {
32be05f0e1b8456 Yu Zhao 2022-04-13 @3990  		pud_t val =3D READ_ONCE(pud[i]);
32be05f0e1b8456 Yu Zhao 2022-04-13  3991  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3992  		next =3D pud_addr_end(addr, end=
);
32be05f0e1b8456 Yu Zhao 2022-04-13  3993  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3994  		if (!pud_present(val) || WARN_O=
N_ONCE(pud_leaf(val)))
32be05f0e1b8456 Yu Zhao 2022-04-13  3995  			continue;
32be05f0e1b8456 Yu Zhao 2022-04-13  3996  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3997  		walk_pmd_range(&val, addr, next=
, walk);
32be05f0e1b8456 Yu Zhao 2022-04-13  3998  =

32be05f0e1b8456 Yu Zhao 2022-04-13  3999  		if (priv->batched >=3D MAX_LRU_=
BATCH) {
32be05f0e1b8456 Yu Zhao 2022-04-13  4000  			end =3D (addr | ~PUD_MASK) + 1;
32be05f0e1b8456 Yu Zhao 2022-04-13  4001  			goto done;
32be05f0e1b8456 Yu Zhao 2022-04-13  4002  		}
32be05f0e1b8456 Yu Zhao 2022-04-13  4003  	}
32be05f0e1b8456 Yu Zhao 2022-04-13  4004  =

32be05f0e1b8456 Yu Zhao 2022-04-13  4005  	if (i < PTRS_PER_PUD && get_next=
_vma(walk, P4D_MASK, PUD_SIZE, &start, &end))
32be05f0e1b8456 Yu Zhao 2022-04-13  4006  		goto restart;
32be05f0e1b8456 Yu Zhao 2022-04-13  4007  =

32be05f0e1b8456 Yu Zhao 2022-04-13  4008  	end =3D round_up(end, P4D_SIZE);
32be05f0e1b8456 Yu Zhao 2022-04-13  4009  done:
32be05f0e1b8456 Yu Zhao 2022-04-13  4010  	/* rounded-up boundaries can wra=
p to 0 */
32be05f0e1b8456 Yu Zhao 2022-04-13  4011  	priv->next_addr =3D end && walk-=
>vma ? max(end, walk->vma->vm_start) : 0;
32be05f0e1b8456 Yu Zhao 2022-04-13  4012  =

32be05f0e1b8456 Yu Zhao 2022-04-13  4013  	return -EAGAIN;
32be05f0e1b8456 Yu Zhao 2022-04-13  4014  }
32be05f0e1b8456 Yu Zhao 2022-04-13  4015  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1043508764796864398==--

