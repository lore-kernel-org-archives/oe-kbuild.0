Content-Type: multipart/mixed; boundary="===============2375487577606249566=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/slob.c:415:30: warning: dereference of NULL 'sp' [CWE-476]
Date: Tue, 14 Jun 2022 18:04:45 +0800
Message-ID: <202206141713.IxEczAhn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2375487577606249566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: mm/slob.c=
:415:30: warning: dereference of NULL 'sp' [CWE-476] [-Wanalyzer-null-deref=
erence]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 50757018b4c9b02dbf7fcc0514e0fc45b8689c62 mm/slob: Convert SLOB to u=
se struct slab and struct folio
date:   5 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220611 (https://download.01.org/0day-ci/archi=
ve/20220614/202206141713.IxEczAhn-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D50757018b4c9b02dbf7fcc0514e0fc45b8689c62
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 50757018b4c9b02dbf7fcc0514e0fc45b8689c62
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
              |      |         (7) ...to here
   include/asm-generic/getorder.h:38:24: note: in expansion of macro 'ilog2'
              |   38 |                 return ilog2((size) - 1) - PAGE_SHIF=
T + 1;
              |      |                        ^~~~~
              |
            '__kmem_cache_free': event 8
              |
              |   38 |                 return ilog2((size) - 1) - PAGE_SHIF=
T + 1;
              |
            '__kmem_cache_free': event 9
              |
              |include/linux/log2.h:162:24:
              |  161 |         (sizeof(n) <=3D 4) ?              \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  162 |         __ilog2_u32(n) :                \
              |      |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (9) ...to here
              |  163 |         __ilog2_u64(n)                  \
              |      |         ~~~~~~~~~~~~~~  =

   include/asm-generic/getorder.h:38:24: note: in expansion of macro 'ilog2'
              |   38 |                 return ilog2((size) - 1) - PAGE_SHIF=
T + 1;
              |      |                        ^~~~~
              |
            '__kmem_cache_free': event 10
              |
              |include/linux/log2.h:162:24:
              |  161 |         (sizeof(n) <=3D 4) ?              \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  162 |         __ilog2_u32(n) :                \
              |      |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (10) calling '__ilog2_u32' fr=
om '__kmem_cache_free'
              |  163 |         __ilog2_u64(n)                  \
              |      |         ~~~~~~~~~~~~~~  =

   include/asm-generic/getorder.h:38:24: note: in expansion of macro 'ilog2'
              |   38 |                 return ilog2((size) - 1) - PAGE_SHIF=
T + 1;
              |      |                        ^~~~~
              |
              +--> '__ilog2_u32': event 11
                     |
                     |include/linux/log2.h:22:5:
                     |   22 | int __ilog2_u32(u32 n)
                     |      |     ^~~~~~~~~~~
                     |      |     |
                     |      |     (11) entry to '__ilog2_u32'
                     |
                   '__ilog2_u32': event 12
                     |
                     |include/asm-generic/bitops/builtin-fls.h:14:53:
                     |   14 |         return x ? sizeof(x) * 8 - __builtin_=
clz(x) : 0;
                     |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~^~~
                     |      |                                              =
       |
                     |      |                                              =
       (12) following 'false' branch (when 'n =3D=3D 0')...
                     |
                   '__ilog2_u32': event 13
                     |
                     |include/linux/log2.h:24:23:
                     |   24 |         return fls(n) - 1;
                     |      |                ~~~~~~~^~~
                     |      |                       |
                     |      |                       (13) ...to here
                     |
              <------+
              |
            '__kmem_cache_free': event 14
              |
              |  161 |         (sizeof(n) <=3D 4) ?              \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  162 |         __ilog2_u32(n) :                \
              |      |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (14) returning to '__kmem_cac=
he_free' from '__ilog2_u32'
              |  163 |         __ilog2_u64(n)                  \
              |      |         ~~~~~~~~~~~~~~  =

   include/asm-generic/getorder.h:38:24: note: in expansion of macro 'ilog2'
              |   38 |                 return ilog2((size) - 1) - PAGE_SHIF=
T + 1;
              |      |                        ^~~~~
              |
            '__kmem_cache_free': event 15
              |
              |mm/slob.c:658:17:
              |  658 |                 slob_free_pages(b, get_order(size));
              |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (15) calling 'slob_free_pages' from =
'__kmem_cache_free'
              |
              +--> 'slob_free_pages': events 16-17
                     |
                     |  210 | static void slob_free_pages(void *b, int orde=
r)
                     |      |             ^~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (16) entry to 'slob_free_pages'
                     |......
                     |  218 |                             -(PAGE_SIZE << or=
der));
                     |      |                              ~~~~~~~~~~~~~~~~=
~~~~
                     |      |                                         |
                     |      |                                         (17) =
shift by negative amount here ('-12')
                     |
   mm/slob.c: In function 'slob_free':
>> mm/slob.c:415:30: warning: dereference of NULL 'sp' [CWE-476] [-Wanalyze=
r-null-dereference]
     415 |                 sp->freelist =3D b;
         |                 ~~~~~~~~~~~~~^~~
     '__kmem_cache_free': events 1-4
       |
       |  653 | static void __kmem_cache_free(void *b, int size)
       |      |             ^~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to '__kmem_cache_free'
       |  654 | {
       |  655 |         if (size < PAGE_SIZE)
       |      |            ~ =

       |      |            |
       |      |            (2) following 'true' branch...
       |  656 |                 slob_free(b, size);
       |      |                 ~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |      |                 (4) calling 'slob_free' from '__kmem_cache_=
free'
       |
       +--> 'slob_free': events 5-6
              |
              |  384 | static void slob_free(void *block, int size)
              |      |             ^~~~~~~~~
              |      |             |
              |      |             (5) entry to 'slob_free'
              |......
              |  392 |         if (unlikely(ZERO_OR_NULL_PTR(block)))
              |      |            ~ =

              |      |            |
              |      |            (6) following 'false' branch...
              |
            'slob_free': event 7
              |
              |include/linux/compiler.h:78:42:
              |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
              |      |                                          ^~~~~
              |      |                                          |
              |      |                                          (7) ...to h=
ere
   include/asm-generic/bug.h:161:36: note: in expansion of macro 'unlikely'
              |  161 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                    ^~~~~~~~
   mm/slob.c:394:9: note: in expansion of macro 'BUG_ON'
              |  394 |         BUG_ON(!size);
              |      |         ^~~~~~
              |
            'slob_free': event 8
              |
              |include/asm-generic/bug.h:161:35:
              |  161 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                   ^
              |      |                                   |
              |      |                                   (8) following 'fal=
se' branch...
   mm/slob.c:394:9: note: in expansion of macro 'BUG_ON'
              |  394 |         BUG_ON(!size);
              |      |         ^~~~~~
              |
            'slob_free': events 9-10
              |
              |  396 |         sp =3D virt_to_slab(block);
              |      |              ^~~~~~~~~~~~~~~~~~~
              |      |              |
              |      |              (9) ...to here
              |      |              (10) calling 'virt_to_slab' from 'slob_=
free'
              |
              +--> 'virt_to_slab': events 11-12
                     |
                     |mm/slab.h:155:28:
                     |  155 | static inline struct slab *virt_to_slab(const=
 void *addr)
                     |      |                            ^~~~~~~~~~~~
                     |      |                            |
                     |      |                            (11) entry to 'vir=
t_to_slab'
                     |......
                     |  159 |         if (!folio_test_slab(folio))
                     |      |            ~                =

                     |      |            |
                     |      |            (12) following 'false' branch...
                     |
                   'virt_to_slab': event 13
                     |
                     |cc1:
                     | (13): ...to here
                     |
              <------+
              |
            'slob_free': events 14-19
              |
              |mm/slob.c:396:14:
              |  396 |         sp =3D virt_to_slab(block);
              |      |              ^~~~~~~~~~~~~~~~~~~
              |      |              |
              |      |              (14) return of NULL to 'slob_free' from=
 'virt_to_slab'
              |......
              |  401 |         if (sp->units + units =3D=3D SLOB_UNITS(PAGE=
_SIZE)) {
              |      |            ~  =

              |      |            |
              |      |            (15) following 'false' branch...
              |......
              |  412 |         if (!slob_page_free(sp)) {
              |      |            ~ ~~~~~~~~~~~~~~~~~~
              |      |            | |

vim +/sp +415 mm/slob.c

10cef602950291 Matt Mackall            2006-01-08  380  =

95b35127f13661 Nicholas Piggin         2007-07-15  381  /*
95b35127f13661 Nicholas Piggin         2007-07-15  382   * slob_free: entry=
 point into the slob allocator.
95b35127f13661 Nicholas Piggin         2007-07-15  383   */
10cef602950291 Matt Mackall            2006-01-08  384  static void slob_fr=
ee(void *block, int size)
10cef602950291 Matt Mackall            2006-01-08  385  {
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  386) 	struct slab *sp;
95b35127f13661 Nicholas Piggin         2007-07-15  387  	slob_t *prev, *nex=
t, *b =3D (slob_t *)block;
95b35127f13661 Nicholas Piggin         2007-07-15  388  	slobidx_t units;
10cef602950291 Matt Mackall            2006-01-08  389  	unsigned long flag=
s;
d602dabaeba79d Bob Liu                 2010-07-10  390  	struct list_head *=
slob_list;
10cef602950291 Matt Mackall            2006-01-08  391  =

2408c55037c3f7 Satyam Sharma           2007-10-16  392  	if (unlikely(ZERO_=
OR_NULL_PTR(block)))
10cef602950291 Matt Mackall            2006-01-08  393  		return;
95b35127f13661 Nicholas Piggin         2007-07-15  394  	BUG_ON(!size);
10cef602950291 Matt Mackall            2006-01-08  395  =

50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  396) 	sp =3D virt_to_sla=
b(block);
95b35127f13661 Nicholas Piggin         2007-07-15  397  	units =3D SLOB_UNI=
TS(size);
10cef602950291 Matt Mackall            2006-01-08  398  =

10cef602950291 Matt Mackall            2006-01-08  399  	spin_lock_irqsave(=
&slob_lock, flags);
10cef602950291 Matt Mackall            2006-01-08  400  =

95b35127f13661 Nicholas Piggin         2007-07-15  401  	if (sp->units + un=
its =3D=3D SLOB_UNITS(PAGE_SIZE)) {
95b35127f13661 Nicholas Piggin         2007-07-15  402  		/* Go directly to=
 page allocator. Do not pass slob allocator */
95b35127f13661 Nicholas Piggin         2007-07-15  403  		if (slob_page_fre=
e(sp))
95b35127f13661 Nicholas Piggin         2007-07-15  404  			clear_slob_page_=
free(sp);
6fb8f424393025 Nicholas Piggin         2009-03-16  405  		spin_unlock_irqre=
store(&slob_lock, flags);
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  406) 		__folio_clear_sla=
b(slab_folio(sp));
50757018b4c9b0 Matthew Wilcox (Oracle  2021-10-04  407) 		page_mapcount_res=
et(slab_page(sp));
1f0532eb617d28 Nicholas Piggin         2009-05-05  408  		slob_free_pages(b=
, 0);
6fb8f424393025 Nicholas Piggin         2009-03-16  409  		return;
95b35127f13661 Nicholas Piggin         2007-07-15  410  	}
10cef602950291 Matt Mackall            2006-01-08  411  =

95b35127f13661 Nicholas Piggin         2007-07-15  412  	if (!slob_page_fre=
e(sp)) {
95b35127f13661 Nicholas Piggin         2007-07-15  413  		/* This slob page=
 is about to become partially free. Easy! */
95b35127f13661 Nicholas Piggin         2007-07-15  414  		sp->units =3D uni=
ts;
b8c24c4aef94b1 Christoph Lameter       2012-06-13 @415  		sp->freelist =3D =
b;
95b35127f13661 Nicholas Piggin         2007-07-15  416  		set_slob(b, units,
95b35127f13661 Nicholas Piggin         2007-07-15  417  			(void *)((unsign=
ed long)(b +
95b35127f13661 Nicholas Piggin         2007-07-15  418  					SLOB_UNITS(PAG=
E_SIZE)) & PAGE_MASK));
d602dabaeba79d Bob Liu                 2010-07-10  419  		if (size < SLOB_B=
REAK1)
d602dabaeba79d Bob Liu                 2010-07-10  420  			slob_list =3D &f=
ree_slob_small;
d602dabaeba79d Bob Liu                 2010-07-10  421  		else if (size < S=
LOB_BREAK2)
d602dabaeba79d Bob Liu                 2010-07-10  422  			slob_list =3D &f=
ree_slob_medium;
d602dabaeba79d Bob Liu                 2010-07-10  423  		else
d602dabaeba79d Bob Liu                 2010-07-10  424  			slob_list =3D &f=
ree_slob_large;
d602dabaeba79d Bob Liu                 2010-07-10  425  		set_slob_page_fre=
e(sp, slob_list);
95b35127f13661 Nicholas Piggin         2007-07-15  426  		goto out;
95b35127f13661 Nicholas Piggin         2007-07-15  427  	}
95b35127f13661 Nicholas Piggin         2007-07-15  428  =

95b35127f13661 Nicholas Piggin         2007-07-15  429  	/*
95b35127f13661 Nicholas Piggin         2007-07-15  430  	 * Otherwise the p=
age is already partially free, so find reinsertion
95b35127f13661 Nicholas Piggin         2007-07-15  431  	 * point.
95b35127f13661 Nicholas Piggin         2007-07-15  432  	 */
95b35127f13661 Nicholas Piggin         2007-07-15  433  	sp->units +=3D uni=
ts;
95b35127f13661 Nicholas Piggin         2007-07-15  434  =

b8c24c4aef94b1 Christoph Lameter       2012-06-13  435  	if (b < (slob_t *)=
sp->freelist) {
b8c24c4aef94b1 Christoph Lameter       2012-06-13  436  		if (b + units =3D=
=3D sp->freelist) {
b8c24c4aef94b1 Christoph Lameter       2012-06-13  437  			units +=3D slob_=
units(sp->freelist);
b8c24c4aef94b1 Christoph Lameter       2012-06-13  438  			sp->freelist =3D=
 slob_next(sp->freelist);
679299b32dbf9b Matt Mackall            2008-02-04  439  		}
b8c24c4aef94b1 Christoph Lameter       2012-06-13  440  		set_slob(b, units=
, sp->freelist);
b8c24c4aef94b1 Christoph Lameter       2012-06-13  441  		sp->freelist =3D =
b;
95b35127f13661 Nicholas Piggin         2007-07-15  442  	} else {
b8c24c4aef94b1 Christoph Lameter       2012-06-13  443  		prev =3D sp->free=
list;
95b35127f13661 Nicholas Piggin         2007-07-15  444  		next =3D slob_nex=
t(prev);
95b35127f13661 Nicholas Piggin         2007-07-15  445  		while (b > next) {
95b35127f13661 Nicholas Piggin         2007-07-15  446  			prev =3D next;
95b35127f13661 Nicholas Piggin         2007-07-15  447  			next =3D slob_ne=
xt(prev);
95b35127f13661 Nicholas Piggin         2007-07-15  448  		}
10cef602950291 Matt Mackall            2006-01-08  449  =

95b35127f13661 Nicholas Piggin         2007-07-15  450  		if (!slob_last(pr=
ev) && b + units =3D=3D next) {
95b35127f13661 Nicholas Piggin         2007-07-15  451  			units +=3D slob_=
units(next);
95b35127f13661 Nicholas Piggin         2007-07-15  452  			set_slob(b, unit=
s, slob_next(next));
95b35127f13661 Nicholas Piggin         2007-07-15  453  		} else
95b35127f13661 Nicholas Piggin         2007-07-15  454  			set_slob(b, unit=
s, next);
10cef602950291 Matt Mackall            2006-01-08  455  =

95b35127f13661 Nicholas Piggin         2007-07-15  456  		if (prev + slob_u=
nits(prev) =3D=3D b) {
95b35127f13661 Nicholas Piggin         2007-07-15  457  			units =3D slob_u=
nits(b) + slob_units(prev);
95b35127f13661 Nicholas Piggin         2007-07-15  458  			set_slob(prev, u=
nits, slob_next(b));
95b35127f13661 Nicholas Piggin         2007-07-15  459  		} else
95b35127f13661 Nicholas Piggin         2007-07-15  460  			set_slob(prev, s=
lob_units(prev), b);
95b35127f13661 Nicholas Piggin         2007-07-15  461  	}
95b35127f13661 Nicholas Piggin         2007-07-15  462  out:
10cef602950291 Matt Mackall            2006-01-08  463  	spin_unlock_irqres=
tore(&slob_lock, flags);
10cef602950291 Matt Mackall            2006-01-08  464  }
10cef602950291 Matt Mackall            2006-01-08  465  =


:::::: The code at line 415 was first introduced by commit
:::::: b8c24c4aef94b1f0daafb450363fef13a1163780 slob: Define page struct fi=
elds used in mm_types.h

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Pekka Enberg <penberg@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2375487577606249566==--

