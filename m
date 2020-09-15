Content-Type: multipart/mixed; boundary="===============3949693470005230904=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 11/12] mm/truncate, shmem: Handle truncates that split THPs
Date: Tue, 15 Sep 2020 23:59:13 +0800
Message-ID: <202009152306.SGfIoJra%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3949693470005230904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200914130042.11442-12-willy@infradead.org>
References: <20200914130042.11442-12-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: linux-mm(a)kvack.org
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Hugh Dickins <hughd@google.com>
CC: William Kucharski <william.kucharski@oracle.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Jan Kara <jack@suse.cz>
CC: Yang Shi <yang.shi@linux.alibaba.com>
CC: Dave Chinner <dchinner@redhat.com>

Hi "Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200914]
[cannot apply to hnaz-linux-mm/master linus/master v5.9-rc5 v5.9-rc4 v5.9-r=
c3 v5.9-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Wilcox-Oracle/Over=
haul-multi-page-lookups-for-THP/20200914-211127
base:    f965d3ec86fa89285db0fbb983da76ba9c398efa
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> mm/truncate.c:430:10: warning: Variable 'index' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
      index =3D page->index + thp_nr_pages(page) - 1;
            ^
   mm/truncate.c:424:10: note: Variable 'index' is reassigned a value befor=
e the old one has been used.
      index =3D indices[i];
            ^
   mm/truncate.c:430:10: note: Variable 'index' is reassigned a value befor=
e the old one has been used.
      index =3D page->index + thp_nr_pages(page) - 1;
            ^

# https://github.com/0day-ci/linux/commit/b41ca9fc7c7cba74785d3d5402d53da07=
e46032a
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Overhaul-multi-page-=
lookups-for-THP/20200914-211127
git checkout b41ca9fc7c7cba74785d3d5402d53da07e46032a
vim +/index +430 mm/truncate.c

83f786680aec8d0 Wu Fengguang            2009-09-16  308  =

^1da177e4c3f415 Linus Torvalds          2005-04-16  309  /**
73c1e20430cbb96 Liu Bo                  2012-02-21  310   * truncate_inode_=
pages_range - truncate range of pages specified by start & end byte offsets
^1da177e4c3f415 Linus Torvalds          2005-04-16  311   * @mapping: mappi=
ng to truncate
^1da177e4c3f415 Linus Torvalds          2005-04-16  312   * @lstart: offset=
 from which to truncate
5a7203947a1d9b6 Lukas Czerner           2013-05-27  313   * @lend: offset t=
o which to truncate (inclusive)
^1da177e4c3f415 Linus Torvalds          2005-04-16  314   *
d7339071f6a8b50 Hans Reiser             2006-01-06  315   * Truncate the pa=
ge cache, removing the pages that are between
5a7203947a1d9b6 Lukas Czerner           2013-05-27  316   * specified offse=
ts (and zeroing out partial pages
5a7203947a1d9b6 Lukas Czerner           2013-05-27  317   * if lstart or le=
nd + 1 is not page aligned).
^1da177e4c3f415 Linus Torvalds          2005-04-16  318   *
^1da177e4c3f415 Linus Torvalds          2005-04-16  319   * Truncate takes =
two passes - the first pass is nonblocking.  It will not
^1da177e4c3f415 Linus Torvalds          2005-04-16  320   * block on page l=
ocks and it will not block on writeback.  The second pass
^1da177e4c3f415 Linus Torvalds          2005-04-16  321   * will wait.  Thi=
s is to prevent as much IO as possible in the affected region.
^1da177e4c3f415 Linus Torvalds          2005-04-16  322   * The first pass =
will remove most pages, so the search cost of the second pass
^1da177e4c3f415 Linus Torvalds          2005-04-16  323   * is low.
^1da177e4c3f415 Linus Torvalds          2005-04-16  324   *
^1da177e4c3f415 Linus Torvalds          2005-04-16  325   * We pass down th=
e cache-hot hint to the page freeing code.  Even if the
^1da177e4c3f415 Linus Torvalds          2005-04-16  326   * mapping is larg=
e, it is probably the case that the final pages are the most
^1da177e4c3f415 Linus Torvalds          2005-04-16  327   * recently touche=
d, and freeing happens in ascending file offset order.
5a7203947a1d9b6 Lukas Czerner           2013-05-27  328   *
5a7203947a1d9b6 Lukas Czerner           2013-05-27  329   * Note that since=
 ->invalidatepage() accepts range to invalidate
5a7203947a1d9b6 Lukas Czerner           2013-05-27  330   * truncate_inode_=
pages_range is able to handle cases where lend + 1 is not
5a7203947a1d9b6 Lukas Czerner           2013-05-27  331   * page aligned pr=
operly.
^1da177e4c3f415 Linus Torvalds          2005-04-16  332   */
d7339071f6a8b50 Hans Reiser             2006-01-06  333  void truncate_inod=
e_pages_range(struct address_space *mapping,
d7339071f6a8b50 Hans Reiser             2006-01-06  334  				loff_t lstart,=
 loff_t lend)
^1da177e4c3f415 Linus Torvalds          2005-04-16  335  {
5a7203947a1d9b6 Lukas Czerner           2013-05-27  336  	pgoff_t		start;		=
/* inclusive */
5a7203947a1d9b6 Lukas Czerner           2013-05-27  337  	pgoff_t		end;		/*=
 exclusive */
^1da177e4c3f415 Linus Torvalds          2005-04-16  338  	struct pagevec	pv=
ec;
0cd6144aadd2afd Johannes Weiner         2014-04-03  339  	pgoff_t		indices[=
PAGEVEC_SIZE];
b85e0effd3dcbf9 Hugh Dickins            2011-07-25  340  	pgoff_t		index;
^1da177e4c3f415 Linus Torvalds          2005-04-16  341  	int		i;
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  342) 	struct page *	pag=
e;
^1da177e4c3f415 Linus Torvalds          2005-04-16  343  =

f9fe48bece3af2d Ross Zwisler            2016-01-22  344  	if (mapping->nrpa=
ges =3D=3D 0 && mapping->nrexceptional =3D=3D 0)
34ccb69ea27ab25 Andrey Ryabinin         2017-05-03  345  		goto out;
^1da177e4c3f415 Linus Torvalds          2005-04-16  346  =

5a7203947a1d9b6 Lukas Czerner           2013-05-27  347  	/*
5a7203947a1d9b6 Lukas Czerner           2013-05-27  348  	 * 'start' and 'e=
nd' always covers the range of pages to be fully
5a7203947a1d9b6 Lukas Czerner           2013-05-27  349  	 * truncated. Par=
tial pages are covered with 'partial_start' at the
5a7203947a1d9b6 Lukas Czerner           2013-05-27  350  	 * start of the r=
ange and 'partial_end' at the end of the range.
5a7203947a1d9b6 Lukas Czerner           2013-05-27  351  	 * Note that 'end=
' is exclusive while 'lend' is inclusive.
5a7203947a1d9b6 Lukas Czerner           2013-05-27  352  	 */
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  353  	start =3D (lstart=
 + PAGE_SIZE - 1) >> PAGE_SHIFT;
5a7203947a1d9b6 Lukas Czerner           2013-05-27  354  	if (lend =3D=3D -=
1)
5a7203947a1d9b6 Lukas Czerner           2013-05-27  355  		/*
5a7203947a1d9b6 Lukas Czerner           2013-05-27  356  		 * lend =3D=3D -=
1 indicates end-of-file so we have to set 'end'
5a7203947a1d9b6 Lukas Czerner           2013-05-27  357  		 * to the highes=
t possible pgoff_t and since the type is
5a7203947a1d9b6 Lukas Czerner           2013-05-27  358  		 * unsigned we'r=
e using -1.
5a7203947a1d9b6 Lukas Czerner           2013-05-27  359  		 */
5a7203947a1d9b6 Lukas Czerner           2013-05-27  360  		end =3D -1;
5a7203947a1d9b6 Lukas Czerner           2013-05-27  361  	else
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  362  		end =3D (lend + =
1) >> PAGE_SHIFT;
d7339071f6a8b50 Hans Reiser             2006-01-06  363  =

8667982014d6048 Mel Gorman              2017-11-15  364  	pagevec_init(&pve=
c);
b85e0effd3dcbf9 Hugh Dickins            2011-07-25  365  	index =3D start;
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  366) 	while (index < en=
d && find_lock_entries(mapping, index, end - 1,
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  367) 			&pvec, indices)=
) {
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  368) 		index =3D indice=
s[pagevec_count(&pvec) - 1] + 1;
c276b26914a46fd Matthew Wilcox (Oracle  2020-09-14  369) 		truncate_excepti=
onal_pvec_entries(mapping, &pvec, indices);
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  370) 		for (i =3D 0; i =
< pagevec_count(&pvec); i++)
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  371) 			truncate_cleanu=
p_page(mapping, pvec.pages[i]);
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  372) 		delete_from_page=
_cache_batch(mapping, &pvec);
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  373) 		for (i =3D 0; i =
< pagevec_count(&pvec); i++)
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  374) 			unlock_page(pve=
c.pages[i]);
^1da177e4c3f415 Linus Torvalds          2005-04-16  375  		pagevec_release(=
&pvec);
^1da177e4c3f415 Linus Torvalds          2005-04-16  376  		cond_resched();
^1da177e4c3f415 Linus Torvalds          2005-04-16  377  	}
f699a761aae14d0 Matthew Wilcox (Oracle  2020-09-14  378) =

b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  379) 	index =3D -1;
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  380) 	if (end !=3D -1 &=
& ((lend + 1) % PAGE_SIZE))
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  381) 		index =3D lend >=
> PAGE_SHIFT;
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  382) 	page =3D find_loc=
k_head(mapping, lstart >> PAGE_SHIFT);
^1da177e4c3f415 Linus Torvalds          2005-04-16  383  	if (page) {
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  384) 		bool same_page =
=3D lend + 1 < page_offset(page) + thp_size(page);
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  385) 		if (same_page)
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  386) 			index =3D -1;
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  387) 		if (!truncate_in=
ode_partial_page(page, lstart, lend)) {
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  388) 			start =3D page-=
>index + thp_nr_pages(page);
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  389) 			if (same_page)
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  390) 				end =3D page->=
index;
5a7203947a1d9b6 Lukas Czerner           2013-05-27  391  		}
^1da177e4c3f415 Linus Torvalds          2005-04-16  392  		unlock_page(page=
);
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  393  		put_page(page);
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  394) 		page =3D NULL;
^1da177e4c3f415 Linus Torvalds          2005-04-16  395  	}
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  396) =

b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  397) 	if (index !=3D -1)
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  398) 		page =3D find_lo=
ck_head(mapping, index);
5a7203947a1d9b6 Lukas Czerner           2013-05-27  399  	if (page) {
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  400) 		if (!truncate_in=
ode_partial_page(page, lstart, lend))
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  401) 			end =3D page->i=
ndex;
5a7203947a1d9b6 Lukas Czerner           2013-05-27  402  		unlock_page(page=
);
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  403  		put_page(page);
5a7203947a1d9b6 Lukas Czerner           2013-05-27  404  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  405  =

b85e0effd3dcbf9 Hugh Dickins            2011-07-25  406  	index =3D start;
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  407) 	while (index < en=
d) {
^1da177e4c3f415 Linus Torvalds          2005-04-16  408  		cond_resched();
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  409) =

4a384ca30ee0c80 Matthew Wilcox (Oracle  2020-09-14  410) 		if (!find_get_en=
tries(mapping, index, end - 1, &pvec,
f8aaa140d6e4fc0 Matthew Wilcox (Oracle  2020-09-14  411) 				indices)) {
792ceaefe62189e Hugh Dickins            2014-07-23  412  			/* If all gone =
from start onwards, we're done */
b85e0effd3dcbf9 Hugh Dickins            2011-07-25  413  			if (index =3D=
=3D start)
^1da177e4c3f415 Linus Torvalds          2005-04-16  414  				break;
792ceaefe62189e Hugh Dickins            2014-07-23  415  			/* Otherwise re=
start to make sure all gone */
b85e0effd3dcbf9 Hugh Dickins            2011-07-25  416  			index =3D start;
^1da177e4c3f415 Linus Torvalds          2005-04-16  417  			continue;
^1da177e4c3f415 Linus Torvalds          2005-04-16  418  		}
f2187599189d94a Mel Gorman              2017-11-15  419  =

^1da177e4c3f415 Linus Torvalds          2005-04-16  420  		for (i =3D 0; i =
< pagevec_count(&pvec); i++) {
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14  421) 			page =3D pvec.p=
ages[i];
^1da177e4c3f415 Linus Torvalds          2005-04-16  422  =

b85e0effd3dcbf9 Hugh Dickins            2011-07-25  423  			/* We rely upon=
 deletion not changing page->index */
0cd6144aadd2afd Johannes Weiner         2014-04-03  424  			index =3D indic=
es[i];
b85e0effd3dcbf9 Hugh Dickins            2011-07-25  425  =

3159f943aafdbac Matthew Wilcox          2017-11-03  426  			if (xa_is_value=
(page))
0cd6144aadd2afd Johannes Weiner         2014-04-03  427  				continue;
0cd6144aadd2afd Johannes Weiner         2014-04-03  428  =

^1da177e4c3f415 Linus Torvalds          2005-04-16  429  			lock_page(page);
b41ca9fc7c7cba7 Matthew Wilcox (Oracle  2020-09-14 @430) 			index =3D page-=
>index + thp_nr_pages(page) - 1;
^1da177e4c3f415 Linus Torvalds          2005-04-16  431  			wait_on_page_wr=
iteback(page);
750b4987b0cd4d4 Nick Piggin             2009-09-16  432  			truncate_inode_=
page(mapping, page);
^1da177e4c3f415 Linus Torvalds          2005-04-16  433  			unlock_page(pag=
e);
^1da177e4c3f415 Linus Torvalds          2005-04-16  434  		}
c276b26914a46fd Matthew Wilcox (Oracle  2020-09-14  435) 		truncate_excepti=
onal_pvec_entries(mapping, &pvec, indices);
^1da177e4c3f415 Linus Torvalds          2005-04-16  436  		pagevec_release(=
&pvec);
b85e0effd3dcbf9 Hugh Dickins            2011-07-25  437  		index++;
^1da177e4c3f415 Linus Torvalds          2005-04-16  438  	}
34ccb69ea27ab25 Andrey Ryabinin         2017-05-03  439  =

34ccb69ea27ab25 Andrey Ryabinin         2017-05-03  440  out:
3167760f83899cc Dan Magenheimer         2011-09-21  441  	cleancache_invali=
date_inode(mapping);
^1da177e4c3f415 Linus Torvalds          2005-04-16  442  }
d7339071f6a8b50 Hans Reiser             2006-01-06  443  EXPORT_SYMBOL(trun=
cate_inode_pages_range);
^1da177e4c3f415 Linus Torvalds          2005-04-16  444  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3949693470005230904==--

