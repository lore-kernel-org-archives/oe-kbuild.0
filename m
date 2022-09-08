Content-Type: multipart/mixed; boundary="===============3861839352540490947=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/slob.c:331:11: warning: Uninitialized variable: sp->units [uninitvar]
Date: Fri, 09 Sep 2022 06:50:16 +0800
Message-ID: <202209090621.WAI0o9pr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3861839352540490947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 mm/slob.c:331:11: warning: Uninitialized variable: sp->units [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Roman Gushchin <guro@fb.com>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   506357871c18e06565840d71c2ef9f818e19f460
commit: 401fb12c68c257b9c9116b1475c0ac26b646fcc0 mm/sl*b: Differentiate str=
uct slab fields by sl*b implementations
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 401fb12c68c257b9c9116b1475c0ac26b646fcc0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/slob.c:146:57: warning: Parameter 'next' can be declared with const [=
constParameter]
   static void set_slob(slob_t *s, slobidx_t size, slob_t *next)
                                                           ^
>> mm/slob.c:331:11: warning: Uninitialized variable: sp->units [uninitvar]
     if (sp->units < SLOB_UNITS(size))
             ^

vim +331 mm/slob.c

10cef602950291 Matt Mackall            2006-01-08  297  =

95b35127f13661 Nicholas Piggin         2007-07-15  298  /*
95b35127f13661 Nicholas Piggin         2007-07-15  299   * slob_alloc: entr=
y point into the slob allocator.
95b35127f13661 Nicholas Piggin         2007-07-15  300   */
59bb47985c1db2 Vlastimil Babka         2019-10-06  301  static void *slob_a=
lloc(size_t size, gfp_t gfp, int align, int node,
59bb47985c1db2 Vlastimil Babka         2019-10-06  302  							int align_of=
fset)
95b35127f13661 Nicholas Piggin         2007-07-15  303  {
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  304) 	struct folio *foli=
o;
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  305) 	struct slab *sp;
20cecbae44528d Matt Mackall            2008-02-04  306  	struct list_head *=
slob_list;
95b35127f13661 Nicholas Piggin         2007-07-15  307  	slob_t *b =3D NULL;
95b35127f13661 Nicholas Piggin         2007-07-15  308  	unsigned long flag=
s;
130e8e09e2675b Tobin C. Harding        2019-05-13  309  	bool _unused;
95b35127f13661 Nicholas Piggin         2007-07-15  310  =

20cecbae44528d Matt Mackall            2008-02-04  311  	if (size < SLOB_BR=
EAK1)
20cecbae44528d Matt Mackall            2008-02-04  312  		slob_list =3D &fr=
ee_slob_small;
20cecbae44528d Matt Mackall            2008-02-04  313  	else if (size < SL=
OB_BREAK2)
20cecbae44528d Matt Mackall            2008-02-04  314  		slob_list =3D &fr=
ee_slob_medium;
20cecbae44528d Matt Mackall            2008-02-04  315  	else
20cecbae44528d Matt Mackall            2008-02-04  316  		slob_list =3D &fr=
ee_slob_large;
20cecbae44528d Matt Mackall            2008-02-04  317  =

95b35127f13661 Nicholas Piggin         2007-07-15  318  	spin_lock_irqsave(=
&slob_lock, flags);
95b35127f13661 Nicholas Piggin         2007-07-15  319  	/* Iterate through=
 each partially free page, try to find room */
adab7b68189d14 Tobin C. Harding        2019-05-13  320  	list_for_each_entr=
y(sp, slob_list, slab_list) {
130e8e09e2675b Tobin C. Harding        2019-05-13  321  		bool page_removed=
_from_list =3D false;
6193a2ff180920 Paul Mundt              2007-07-15  322  #ifdef CONFIG_NUMA
6193a2ff180920 Paul Mundt              2007-07-15  323  		/*
6193a2ff180920 Paul Mundt              2007-07-15  324  		 * If there's a n=
ode specification, search for a partial
6193a2ff180920 Paul Mundt              2007-07-15  325  		 * page with a ma=
tching node id in the freelist.
6193a2ff180920 Paul Mundt              2007-07-15  326  		 */
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  327) 		if (node !=3D NUM=
A_NO_NODE && slab_nid(sp) !=3D node)
6193a2ff180920 Paul Mundt              2007-07-15  328  			continue;
6193a2ff180920 Paul Mundt              2007-07-15  329  #endif
d6269543ef24aa Matt Mackall            2007-07-21  330  		/* Enough room on=
 this page? */
d6269543ef24aa Matt Mackall            2007-07-21 @331  		if (sp->units < S=
LOB_UNITS(size))
d6269543ef24aa Matt Mackall            2007-07-21  332  			continue;
6193a2ff180920 Paul Mundt              2007-07-15  333  =

59bb47985c1db2 Vlastimil Babka         2019-10-06  334  		b =3D slob_page_a=
lloc(sp, size, align, align_offset, &page_removed_from_list);
d6269543ef24aa Matt Mackall            2007-07-21  335  		if (!b)
d6269543ef24aa Matt Mackall            2007-07-21  336  			continue;
d6269543ef24aa Matt Mackall            2007-07-21  337  =

130e8e09e2675b Tobin C. Harding        2019-05-13  338  		/*
130e8e09e2675b Tobin C. Harding        2019-05-13  339  		 * If slob_page_a=
lloc() removed sp from the list then we
130e8e09e2675b Tobin C. Harding        2019-05-13  340  		 * cannot call li=
st functions on sp.  If so allocation
130e8e09e2675b Tobin C. Harding        2019-05-13  341  		 * did not fragme=
nt the page anyway so optimisation is
130e8e09e2675b Tobin C. Harding        2019-05-13  342  		 * unnecessary.
130e8e09e2675b Tobin C. Harding        2019-05-13  343  		 */
130e8e09e2675b Tobin C. Harding        2019-05-13  344  		if (!page_removed=
_from_list) {
130e8e09e2675b Tobin C. Harding        2019-05-13  345  			/*
130e8e09e2675b Tobin C. Harding        2019-05-13  346  			 * Improve fragm=
ent distribution and reduce our average
d6269543ef24aa Matt Mackall            2007-07-21  347  			 * search time b=
y starting our next search here. (see
130e8e09e2675b Tobin C. Harding        2019-05-13  348  			 * Knuth vol 1, =
sec 2.5, pg 449)
130e8e09e2675b Tobin C. Harding        2019-05-13  349  			 */
adab7b68189d14 Tobin C. Harding        2019-05-13  350  			if (!list_is_fir=
st(&sp->slab_list, slob_list))
adab7b68189d14 Tobin C. Harding        2019-05-13  351  				list_rotate_to_=
front(&sp->slab_list, slob_list);
130e8e09e2675b Tobin C. Harding        2019-05-13  352  		}
95b35127f13661 Nicholas Piggin         2007-07-15  353  		break;
95b35127f13661 Nicholas Piggin         2007-07-15  354  	}
95b35127f13661 Nicholas Piggin         2007-07-15  355  	spin_unlock_irqres=
tore(&slob_lock, flags);
10cef602950291 Matt Mackall            2006-01-08  356  =

95b35127f13661 Nicholas Piggin         2007-07-15  357  	/* Not enough spac=
e: must allocate a new page */
95b35127f13661 Nicholas Piggin         2007-07-15  358  	if (!b) {
6e9ed0cc4b963f Am=C3=A9rico Wang            2009-01-19  359  		b =3D slob_n=
ew_pages(gfp & ~__GFP_ZERO, 0, node);
95b35127f13661 Nicholas Piggin         2007-07-15  360  		if (!b)
6e9ed0cc4b963f Am=C3=A9rico Wang            2009-01-19  361  			return NULL;
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  362) 		folio =3D virt_to=
_folio(b);
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  363) 		__folio_set_slab(=
folio);
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  364) 		sp =3D folio_slab=
(folio);
10cef602950291 Matt Mackall            2006-01-08  365  =

10cef602950291 Matt Mackall            2006-01-08  366  		spin_lock_irqsave=
(&slob_lock, flags);
95b35127f13661 Nicholas Piggin         2007-07-15  367  		sp->units =3D SLO=
B_UNITS(PAGE_SIZE);
b8c24c4aef94b1 Christoph Lameter       2012-06-13  368  		sp->freelist =3D =
b;
adab7b68189d14 Tobin C. Harding        2019-05-13  369  		INIT_LIST_HEAD(&s=
p->slab_list);
95b35127f13661 Nicholas Piggin         2007-07-15  370  		set_slob(b, SLOB_=
UNITS(PAGE_SIZE), b + SLOB_UNITS(PAGE_SIZE));
20cecbae44528d Matt Mackall            2008-02-04  371  		set_slob_page_fre=
e(sp, slob_list);
59bb47985c1db2 Vlastimil Babka         2019-10-06  372  		b =3D slob_page_a=
lloc(sp, size, align, align_offset, &_unused);
95b35127f13661 Nicholas Piggin         2007-07-15  373  		BUG_ON(!b);
95b35127f13661 Nicholas Piggin         2007-07-15  374  		spin_unlock_irqre=
store(&slob_lock, flags);
10cef602950291 Matt Mackall            2006-01-08  375  	}
9f88faee3ff7d6 Miles Chen              2017-11-15  376  	if (unlikely(gfp &=
 __GFP_ZERO))
d07dbea46405b3 Christoph Lameter       2007-07-17  377  		memset(b, 0, size=
);
95b35127f13661 Nicholas Piggin         2007-07-15  378  	return b;
10cef602950291 Matt Mackall            2006-01-08  379  }
10cef602950291 Matt Mackall            2006-01-08  380  =


:::::: The code at line 331 was first introduced by commit
:::::: d6269543ef24aa012aa228c27af3adb074f7b36b slob: reduce list scanning

:::::: TO: Matt Mackall <mpm@selenic.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3861839352540490947==--

