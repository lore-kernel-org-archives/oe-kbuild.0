Content-Type: multipart/mixed; boundary="===============2633489782591702343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/6] mm: pagewalk: make error checks more obvious
Date: Tue, 23 Aug 2022 16:43:54 +0800
Message-ID: <202208231649.7QKavhA3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2633489782591702343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <2203731.iZASKD2KPV@devpool047>
References: <2203731.iZASKD2KPV@devpool047>
TO: Rolf Eike Beer <eb@emlix.com>

Hi Rolf,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.0-rc2]
[cannot apply to next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rolf-Eike-Beer/Minor=
-improvements-for-pagewalk-code/20220822-214107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20823/202208231649.7QKavhA3-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/pagewalk.c:248 walk_p4d_range() error: uninitialized symbol 'err'.
mm/pagewalk.c:287 walk_pgd_range() error: uninitialized symbol 'err'.
mm/pagewalk.c:324 walk_hugetlb_range() error: uninitialized symbol 'err'.

vim +/err +248 mm/pagewalk.c

e6473092bd9116 Matt Mackall       2008-02-04  217  =

c2febafc67734a Kirill A. Shutemov 2017-03-09  218  static int walk_p4d_rang=
e(pgd_t *pgd, unsigned long addr, unsigned long end,
c2febafc67734a Kirill A. Shutemov 2017-03-09  219  			  struct mm_walk *wal=
k)
c2febafc67734a Kirill A. Shutemov 2017-03-09  220  {
c2febafc67734a Kirill A. Shutemov 2017-03-09  221  	p4d_t *p4d;
c2febafc67734a Kirill A. Shutemov 2017-03-09  222  	unsigned long next;
7b86ac3371b70c Christoph Hellwig  2019-08-28  223  	const struct mm_walk_op=
s *ops =3D walk->ops;
b7a16c7ad790d0 Steven Price       2020-02-03  224  	int depth =3D real_dept=
h(1);
c2febafc67734a Kirill A. Shutemov 2017-03-09  225  =

c2febafc67734a Kirill A. Shutemov 2017-03-09  226  	p4d =3D p4d_offset(pgd,=
 addr);
c2febafc67734a Kirill A. Shutemov 2017-03-09  227  	do {
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  228  		int err;
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  229  =

c2febafc67734a Kirill A. Shutemov 2017-03-09  230  		next =3D p4d_addr_end(=
addr, end);
c2febafc67734a Kirill A. Shutemov 2017-03-09  231  		if (p4d_none_or_clear_=
bad(p4d)) {
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  232  			if (ops->pte_hole) {
b7a16c7ad790d0 Steven Price       2020-02-03  233  				err =3D ops->pte_hol=
e(addr, next, depth, walk);
c2febafc67734a Kirill A. Shutemov 2017-03-09  234  				if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  235  					return err;
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  236  			}
c2febafc67734a Kirill A. Shutemov 2017-03-09  237  			continue;
c2febafc67734a Kirill A. Shutemov 2017-03-09  238  		}
3afc423632a194 Steven Price       2020-02-03  239  		if (ops->p4d_entry) {
3afc423632a194 Steven Price       2020-02-03  240  			err =3D ops->p4d_entr=
y(p4d, addr, next, walk);
3afc423632a194 Steven Price       2020-02-03  241  			if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  242  				return err;
3afc423632a194 Steven Price       2020-02-03  243  		}
e17eae2b839937 Christophe Leroy   2021-06-28  244  		if (is_hugepd(__hugepd=
(p4d_val(*p4d))))
e17eae2b839937 Christophe Leroy   2021-06-28  245  			err =3D walk_hugepd_r=
ange((hugepd_t *)p4d, addr, next, walk, P4D_SHIFT);
e17eae2b839937 Christophe Leroy   2021-06-28  246  		else if (ops->pud_entr=
y || ops->pmd_entry || ops->pte_entry)
c2febafc67734a Kirill A. Shutemov 2017-03-09  247  			err =3D walk_pud_rang=
e(p4d, addr, next, walk);
c2febafc67734a Kirill A. Shutemov 2017-03-09 @248  		if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  249  			return err;
c2febafc67734a Kirill A. Shutemov 2017-03-09  250  	} while (p4d++, addr =
=3D next, addr !=3D end);
c2febafc67734a Kirill A. Shutemov 2017-03-09  251  =

40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  252  	return 0;
c2febafc67734a Kirill A. Shutemov 2017-03-09  253  }
c2febafc67734a Kirill A. Shutemov 2017-03-09  254  =

fafaa4264eba49 Naoya Horiguchi    2015-02-11  255  static int walk_pgd_rang=
e(unsigned long addr, unsigned long end,
fafaa4264eba49 Naoya Horiguchi    2015-02-11  256  			  struct mm_walk *wal=
k)
fafaa4264eba49 Naoya Horiguchi    2015-02-11  257  {
fafaa4264eba49 Naoya Horiguchi    2015-02-11  258  	pgd_t *pgd;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  259  	unsigned long next;
7b86ac3371b70c Christoph Hellwig  2019-08-28  260  	const struct mm_walk_op=
s *ops =3D walk->ops;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  261  =

e47690d756a760 Steven Price       2020-02-03  262  	if (walk->pgd)
e47690d756a760 Steven Price       2020-02-03  263  		pgd =3D walk->pgd + pg=
d_index(addr);
e47690d756a760 Steven Price       2020-02-03  264  	else
fafaa4264eba49 Naoya Horiguchi    2015-02-11  265  		pgd =3D pgd_offset(wal=
k->mm, addr);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  266  	do {
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  267  		int err;
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  268  =

fafaa4264eba49 Naoya Horiguchi    2015-02-11  269  		next =3D pgd_addr_end(=
addr, end);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  270  		if (pgd_none_or_clear_=
bad(pgd)) {
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  271  			if (ops->pte_hole) {
b7a16c7ad790d0 Steven Price       2020-02-03  272  				err =3D ops->pte_hol=
e(addr, next, 0, walk);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  273  				if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  274  					return err;
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  275  			}
fafaa4264eba49 Naoya Horiguchi    2015-02-11  276  			continue;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  277  		}
3afc423632a194 Steven Price       2020-02-03  278  		if (ops->pgd_entry) {
3afc423632a194 Steven Price       2020-02-03  279  			err =3D ops->pgd_entr=
y(pgd, addr, next, walk);
3afc423632a194 Steven Price       2020-02-03  280  			if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  281  				return err;
3afc423632a194 Steven Price       2020-02-03  282  		}
e17eae2b839937 Christophe Leroy   2021-06-28  283  		if (is_hugepd(__hugepd=
(pgd_val(*pgd))))
e17eae2b839937 Christophe Leroy   2021-06-28  284  			err =3D walk_hugepd_r=
ange((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
e17eae2b839937 Christophe Leroy   2021-06-28  285  		else if (ops->p4d_entr=
y || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
c2febafc67734a Kirill A. Shutemov 2017-03-09  286  			err =3D walk_p4d_rang=
e(pgd, addr, next, walk);
fafaa4264eba49 Naoya Horiguchi    2015-02-11 @287  		if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  288  			return err;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  289  	} while (pgd++, addr =
=3D next, addr !=3D end);
fafaa4264eba49 Naoya Horiguchi    2015-02-11  290  =

40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  291  	return 0;
fafaa4264eba49 Naoya Horiguchi    2015-02-11  292  }
fafaa4264eba49 Naoya Horiguchi    2015-02-11  293  =

116354d177ba2d Naoya Horiguchi    2010-04-06  294  #ifdef CONFIG_HUGETLB_PA=
GE
116354d177ba2d Naoya Horiguchi    2010-04-06  295  static unsigned long hug=
etlb_entry_end(struct hstate *h, unsigned long addr,
116354d177ba2d Naoya Horiguchi    2010-04-06  296  				       unsigned long=
 end)
116354d177ba2d Naoya Horiguchi    2010-04-06  297  {
116354d177ba2d Naoya Horiguchi    2010-04-06  298  	unsigned long boundary =
=3D (addr & huge_page_mask(h)) + huge_page_size(h);
116354d177ba2d Naoya Horiguchi    2010-04-06  299  	return boundary < end ?=
 boundary : end;
116354d177ba2d Naoya Horiguchi    2010-04-06  300  }
116354d177ba2d Naoya Horiguchi    2010-04-06  301  =

fafaa4264eba49 Naoya Horiguchi    2015-02-11  302  static int walk_hugetlb_=
range(unsigned long addr, unsigned long end,
116354d177ba2d Naoya Horiguchi    2010-04-06  303  			      struct mm_walk =
*walk)
116354d177ba2d Naoya Horiguchi    2010-04-06  304  {
fafaa4264eba49 Naoya Horiguchi    2015-02-11  305  	struct vm_area_struct *=
vma =3D walk->vma;
116354d177ba2d Naoya Horiguchi    2010-04-06  306  	struct hstate *h =3D hs=
tate_vma(vma);
116354d177ba2d Naoya Horiguchi    2010-04-06  307  	unsigned long next;
116354d177ba2d Naoya Horiguchi    2010-04-06  308  	unsigned long hmask =3D=
 huge_page_mask(h);
7868a2087ec13e Punit Agrawal      2017-07-06  309  	unsigned long sz =3D hu=
ge_page_size(h);
116354d177ba2d Naoya Horiguchi    2010-04-06  310  	pte_t *pte;
7b86ac3371b70c Christoph Hellwig  2019-08-28  311  	const struct mm_walk_op=
s *ops =3D walk->ops;
116354d177ba2d Naoya Horiguchi    2010-04-06  312  =

116354d177ba2d Naoya Horiguchi    2010-04-06  313  	do {
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  314  		int err;
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  315  =

116354d177ba2d Naoya Horiguchi    2010-04-06  316  		next =3D hugetlb_entry=
_end(h, addr, end);
7868a2087ec13e Punit Agrawal      2017-07-06  317  		pte =3D huge_pte_offse=
t(walk->mm, addr & hmask, sz);
373c4557d2aa36 Jann Horn          2017-11-14  318  =

373c4557d2aa36 Jann Horn          2017-11-14  319  		if (pte)
7b86ac3371b70c Christoph Hellwig  2019-08-28  320  			err =3D ops->hugetlb_=
entry(pte, hmask, addr, next, walk);
7b86ac3371b70c Christoph Hellwig  2019-08-28  321  		else if (ops->pte_hole)
b7a16c7ad790d0 Steven Price       2020-02-03  322  			err =3D ops->pte_hole=
(addr, next, -1, walk);
373c4557d2aa36 Jann Horn          2017-11-14  323  =

116354d177ba2d Naoya Horiguchi    2010-04-06 @324  		if (err)
40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  325  			return err;
116354d177ba2d Naoya Horiguchi    2010-04-06  326  	} while (addr =3D next,=
 addr !=3D end);
116354d177ba2d Naoya Horiguchi    2010-04-06  327  =

40d6cb9177b6a9 Rolf Eike Beer     2022-08-22  328  	return 0;
116354d177ba2d Naoya Horiguchi    2010-04-06  329  }
6c6d5280431544 KOSAKI Motohiro    2011-07-25  330  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2633489782591702343==--

