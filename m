Content-Type: multipart/mixed; boundary="===============7699167806289905112=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v3 3/6] [PATCH 3/6] mm: add migration waiting and rmap locking to pagewalk
Date: Wed, 18 May 2022 13:03:18 +0800
Message-ID: <202205181348.9FV48Mdu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7699167806289905112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220516125405.1675-4-matenajakub@gmail.com>
References: <20220516125405.1675-4-matenajakub@gmail.com>
TO: "Jakub Mat=C4=9Bna" <matenajakub@gmail.com>

Hi "Jakub,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linux/master linus/master v5.18-rc7]
[cannot apply to next-20220517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Mat-na/Removin=
g-limitations-of-merging-anonymous-VMAs/20220516-205637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/execve
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20220516 (https://download.01.org/0day-ci/arch=
ive/20220518/202205181348.9FV48Mdu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/pagewalk.c:104 walk_pte_range() error: uninitialized symbol 'ptl'.

vim +/ptl +104 mm/pagewalk.c

e6473092bd91165 Matt Mackall     2008-02-04   91  =

fbf56346b855872 Steven Price     2020-02-03   92  static int walk_pte_range=
(pmd_t *pmd, unsigned long addr, unsigned long end,
fbf56346b855872 Steven Price     2020-02-03   93  			  struct mm_walk *walk)
fbf56346b855872 Steven Price     2020-02-03   94  {
fbf56346b855872 Steven Price     2020-02-03   95  	pte_t *pte;
fbf56346b855872 Steven Price     2020-02-03   96  	int err =3D 0;
fbf56346b855872 Steven Price     2020-02-03   97  	spinlock_t *ptl;
fbf56346b855872 Steven Price     2020-02-03   98  =

9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16   99  	if (walk->flags & W=
ALK_LOCK_RMAP)
9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16  100  		take_rmap_locks(wa=
lk->vma);
9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16  101  =

fbf56346b855872 Steven Price     2020-02-03  102  	if (walk->no_vma) {
fbf56346b855872 Steven Price     2020-02-03  103  		pte =3D pte_offset_map(=
pmd, addr);
9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16 @104  		err =3D walk_pte_r=
ange_inner(pte, addr, end, walk, ptl, pmd);
fbf56346b855872 Steven Price     2020-02-03  105  		pte_unmap(pte);
fbf56346b855872 Steven Price     2020-02-03  106  	} else {
fbf56346b855872 Steven Price     2020-02-03  107  		pte =3D pte_offset_map_=
lock(walk->mm, pmd, addr, &ptl);
9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16  108  		err =3D walk_pte_r=
ange_inner(pte, addr, end, walk, ptl, pmd);
ace88f1018b8816 Thomas Hellstrom 2019-10-04  109  		pte_unmap_unlock(pte, p=
tl);
fbf56346b855872 Steven Price     2020-02-03  110  	}
fbf56346b855872 Steven Price     2020-02-03  111  =

9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16  112  	if (walk->flags & W=
ALK_LOCK_RMAP)
9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16  113  		drop_rmap_locks(wa=
lk->vma);
9ba7cddd9f98f45 Jakub Mat=C4=9Bna     2022-05-16  114  =

e6473092bd91165 Matt Mackall     2008-02-04  115  	return err;
e6473092bd91165 Matt Mackall     2008-02-04  116  }
e6473092bd91165 Matt Mackall     2008-02-04  117  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7699167806289905112==--

