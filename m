Content-Type: multipart/mixed; boundary="===============1609937010395382679=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [andrea-aa:main 44/48] mm/ksm.c:2134 cmp_and_merge_page() error: uninitialized symbol 'checksum'.
Date: Sun, 19 Dec 2021 05:20:39 +0800
Message-ID: <202112190517.NPcuhEOX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1609937010395382679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrea Arcangeli <aarcange@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git main
head:   2f1336124b54750df7ae428da9352e4d8091f31e
commit: fec43fa50ccf8365ae2a8d9f150970ab6ca42b18 [44/48] KSM: only attempt =
to merge with KSM pages if the payload doesn't change
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20211218 (https://download.01.org/0day-ci/arch=
ive/20211219/202112190517.NPcuhEOX-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/ksm.c:2134 cmp_and_merge_page() error: uninitialized symbol 'checksum'.

vim +/checksum +2134 mm/ksm.c

31dbd01f314364 Izik Eidus        2009-09-21  2049  =

31dbd01f314364 Izik Eidus        2009-09-21  2050  /*
81464e30609cdb Hugh Dickins      2009-09-21  2051   * cmp_and_merge_page - =
first see if page can be merged into the stable tree;
81464e30609cdb Hugh Dickins      2009-09-21  2052   * if not, compare check=
sum to previous and if it's the same, see if page can
81464e30609cdb Hugh Dickins      2009-09-21  2053   * be inserted into the =
unstable tree, or merged with a page already there and
81464e30609cdb Hugh Dickins      2009-09-21  2054   * both transferred to t=
he stable tree.
31dbd01f314364 Izik Eidus        2009-09-21  2055   *
31dbd01f314364 Izik Eidus        2009-09-21  2056   * @page: the page that =
we are searching identical page to.
31dbd01f314364 Izik Eidus        2009-09-21  2057   * @rmap_item: the rever=
se mapping into the virtual address of this page
31dbd01f314364 Izik Eidus        2009-09-21  2058   */
31dbd01f314364 Izik Eidus        2009-09-21  2059  static void cmp_and_merg=
e_page(struct page *page, struct rmap_item *rmap_item)
31dbd01f314364 Izik Eidus        2009-09-21  2060  {
4b22927f0cbd58 Kirill Tkhai      2017-10-03  2061  	struct mm_struct *mm =
=3D rmap_item->mm;
31dbd01f314364 Izik Eidus        2009-09-21  2062  	struct rmap_item *tree_=
rmap_item;
8dd3557a52f0bc Hugh Dickins      2009-12-14  2063  	struct page *tree_page =
=3D NULL;
7b6ba2c7d3baf8 Hugh Dickins      2009-12-14  2064  	struct stable_node *sta=
ble_node;
8dd3557a52f0bc Hugh Dickins      2009-12-14  2065  	struct page *kpage;
31dbd01f314364 Izik Eidus        2009-09-21  2066  	unsigned int checksum;
31dbd01f314364 Izik Eidus        2009-09-21  2067  	int err;
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2068  	bool max_page_sharing_b=
ypass =3D false;
31dbd01f314364 Izik Eidus        2009-09-21  2069  =

4146d2d673e8d6 Hugh Dickins      2013-02-22  2070  	stable_node =3D page_st=
able_node(page);
4146d2d673e8d6 Hugh Dickins      2013-02-22  2071  	if (stable_node) {
4146d2d673e8d6 Hugh Dickins      2013-02-22  2072  		if (stable_node->head =
!=3D &migrate_nodes &&
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2073  		    get_kpfn_nid(READ_=
ONCE(stable_node->kpfn)) !=3D
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2074  		    NUMA(stable_node->=
nid)) {
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2075  			stable_node_dup_del(s=
table_node);
4146d2d673e8d6 Hugh Dickins      2013-02-22  2076  			stable_node->head =3D=
 &migrate_nodes;
4146d2d673e8d6 Hugh Dickins      2013-02-22  2077  			list_add(&stable_node=
->list, stable_node->head);
4146d2d673e8d6 Hugh Dickins      2013-02-22  2078  		}
4146d2d673e8d6 Hugh Dickins      2013-02-22  2079  		if (stable_node->head =
!=3D &migrate_nodes &&
4146d2d673e8d6 Hugh Dickins      2013-02-22  2080  		    rmap_item->head =
=3D=3D stable_node)
4146d2d673e8d6 Hugh Dickins      2013-02-22  2081  			return;
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2082  		/*
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2083  		 * If it's a KSM fork,=
 allow it to go over the sharing limit
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2084  		 * without warnings.
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2085  		 */
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2086  		if (!is_page_sharing_c=
andidate(stable_node))
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2087  			max_page_sharing_bypa=
ss =3D true;
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2088  	} else {
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2089  		/*
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2090  		 * If the hash value o=
f the page has changed from the last
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2091  		 * time we calculated =
it, this page is changing frequently:
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2092  		 * therefore we don't =
want to write protect it.
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2093  		 */
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2094  		checksum =3D calc_chec=
ksum(page);
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2095  		if (rmap_item->oldchec=
ksum !=3D checksum) {
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2096  			rmap_item->oldchecksu=
m =3D checksum;
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2097  			remove_rmap_item_from=
_tree(rmap_item);
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2098  			return;
fec43fa50ccf83 Andrea Arcangeli  2021-11-23  2099  		}
4146d2d673e8d6 Hugh Dickins      2013-02-22  2100  	}
31dbd01f314364 Izik Eidus        2009-09-21  2101  =

31dbd01f314364 Izik Eidus        2009-09-21  2102  	/* We first start with =
searching the page inside the stable tree */
62b61f611eb5e2 Hugh Dickins      2009-12-14  2103  	kpage =3D stable_tree_s=
earch(page);
4146d2d673e8d6 Hugh Dickins      2013-02-22  2104  	if (kpage =3D=3D page &=
& rmap_item->head =3D=3D stable_node) {
4146d2d673e8d6 Hugh Dickins      2013-02-22  2105  		put_page(kpage);
4146d2d673e8d6 Hugh Dickins      2013-02-22  2106  		return;
4146d2d673e8d6 Hugh Dickins      2013-02-22  2107  	}
4146d2d673e8d6 Hugh Dickins      2013-02-22  2108  =

4146d2d673e8d6 Hugh Dickins      2013-02-22  2109  	remove_rmap_item_from_t=
ree(rmap_item);
4146d2d673e8d6 Hugh Dickins      2013-02-22  2110  =

62b61f611eb5e2 Hugh Dickins      2009-12-14  2111  	if (kpage) {
2cee57d1b08877 Yang Shi          2019-03-05  2112  		if (PTR_ERR(kpage) =3D=
=3D -EBUSY)
2cee57d1b08877 Yang Shi          2019-03-05  2113  			return;
2cee57d1b08877 Yang Shi          2019-03-05  2114  =

08beca44dfb0ab Hugh Dickins      2009-12-14  2115  		err =3D try_to_merge_w=
ith_ksm_page(rmap_item, page, kpage);
31dbd01f314364 Izik Eidus        2009-09-21  2116  		if (!err) {
31dbd01f314364 Izik Eidus        2009-09-21  2117  			/*
31dbd01f314364 Izik Eidus        2009-09-21  2118  			 * The page was succe=
ssfully merged:
31dbd01f314364 Izik Eidus        2009-09-21  2119  			 * add its rmap_item =
to the stable tree.
31dbd01f314364 Izik Eidus        2009-09-21  2120  			 */
5ad6468801d28c Hugh Dickins      2009-12-14  2121  			lock_page(kpage);
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2122  			stable_tree_append(rm=
ap_item, page_stable_node(kpage),
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2123  					   max_page_sharing=
_bypass);
5ad6468801d28c Hugh Dickins      2009-12-14  2124  			unlock_page(kpage);
31dbd01f314364 Izik Eidus        2009-09-21  2125  		}
8dd3557a52f0bc Hugh Dickins      2009-12-14  2126  		put_page(kpage);
31dbd01f314364 Izik Eidus        2009-09-21  2127  		return;
31dbd01f314364 Izik Eidus        2009-09-21  2128  	}
31dbd01f314364 Izik Eidus        2009-09-21  2129  =

e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2130  	/*
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2131  	 * Same checksum as an =
empty page. We attempt to merge it with the
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2132  	 * appropriate zero pag=
e if the user enabled this via sysfs.
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2133  	 */
e86c59b1b12d0d Claudio Imbrenda  2017-02-24 @2134  	if (ksm_use_zero_pages =
&& (checksum =3D=3D zero_checksum)) {
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2135  		struct vm_area_struct =
*vma;
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2136  =

d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2137  		mmap_read_lock(mm);
4b22927f0cbd58 Kirill Tkhai      2017-10-03  2138  		vma =3D find_mergeable=
_vma(mm, rmap_item->address);
56df70a63ed5d9 Muchun Song       2020-04-20  2139  		if (vma) {
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2140  			err =3D try_to_merge_=
one_page(vma, page,
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2141  					ZERO_PAGE(rmap_item=
->address));
56df70a63ed5d9 Muchun Song       2020-04-20  2142  		} else {
56df70a63ed5d9 Muchun Song       2020-04-20  2143  			/*
56df70a63ed5d9 Muchun Song       2020-04-20  2144  			 * If the vma is out =
of date, we do not need to
56df70a63ed5d9 Muchun Song       2020-04-20  2145  			 * continue.
56df70a63ed5d9 Muchun Song       2020-04-20  2146  			 */
56df70a63ed5d9 Muchun Song       2020-04-20  2147  			err =3D 0;
56df70a63ed5d9 Muchun Song       2020-04-20  2148  		}
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2149  		mmap_read_unlock(mm);
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2150  		/*
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2151  		 * In case of failure,=
 the page was not really empty, so we
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2152  		 * need to continue. O=
therwise we're done.
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2153  		 */
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2154  		if (!err)
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2155  			return;
e86c59b1b12d0d Claudio Imbrenda  2017-02-24  2156  	}
8dd3557a52f0bc Hugh Dickins      2009-12-14  2157  	tree_rmap_item =3D
8dd3557a52f0bc Hugh Dickins      2009-12-14  2158  		unstable_tree_search_i=
nsert(rmap_item, page, &tree_page);
31dbd01f314364 Izik Eidus        2009-09-21  2159  	if (tree_rmap_item) {
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2160  		bool split;
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2161  =

8dd3557a52f0bc Hugh Dickins      2009-12-14  2162  		kpage =3D try_to_merge=
_two_pages(rmap_item, page,
8dd3557a52f0bc Hugh Dickins      2009-12-14  2163  						tree_rmap_item, tr=
ee_page);
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2164  		/*
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2165  		 * If both pages we tr=
ied to merge belong to the same compound
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2166  		 * page, then we actua=
lly ended up increasing the reference
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2167  		 * count of the same c=
ompound page twice, and split_huge_page
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2168  		 * failed.
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2169  		 * Here we set a flag =
if that happened, and we use it later to
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2170  		 * try split_huge_page=
 again. Since we call put_page right
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2171  		 * afterwards, the ref=
erence count will be correct and
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2172  		 * split_huge_page sho=
uld succeed.
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2173  		 */
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2174  		split =3D PageTransCom=
pound(page)
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2175  			&& compound_head(page=
) =3D=3D compound_head(tree_page);
8dd3557a52f0bc Hugh Dickins      2009-12-14  2176  		put_page(tree_page);
bc56620b493496 Hugh Dickins      2013-02-22  2177  		if (kpage) {
31dbd01f314364 Izik Eidus        2009-09-21  2178  			/*
bc56620b493496 Hugh Dickins      2013-02-22  2179  			 * The pages were suc=
cessfully merged: insert new
bc56620b493496 Hugh Dickins      2013-02-22  2180  			 * node in the stable=
 tree and add both rmap_items.
31dbd01f314364 Izik Eidus        2009-09-21  2181  			 */
5ad6468801d28c Hugh Dickins      2009-12-14  2182  			lock_page(kpage);
7b6ba2c7d3baf8 Hugh Dickins      2009-12-14  2183  			stable_node =3D stabl=
e_tree_insert(kpage);
7b6ba2c7d3baf8 Hugh Dickins      2009-12-14  2184  			if (stable_node) {
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2185  				stable_tree_append(t=
ree_rmap_item, stable_node,
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2186  						   false);
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2187  				stable_tree_append(r=
map_item, stable_node,
2c653d0ee2ae78 Andrea Arcangeli  2017-07-06  2188  						   false);
7b6ba2c7d3baf8 Hugh Dickins      2009-12-14  2189  			}
5ad6468801d28c Hugh Dickins      2009-12-14  2190  			unlock_page(kpage);
7b6ba2c7d3baf8 Hugh Dickins      2009-12-14  2191  =

31dbd01f314364 Izik Eidus        2009-09-21  2192  			/*
31dbd01f314364 Izik Eidus        2009-09-21  2193  			 * If we fail to inse=
rt the page into the stable tree,
31dbd01f314364 Izik Eidus        2009-09-21  2194  			 * we will have 2 vir=
tual addresses that are pointing
31dbd01f314364 Izik Eidus        2009-09-21  2195  			 * to a ksm page left=
 outside the stable tree,
31dbd01f314364 Izik Eidus        2009-09-21  2196  			 * in which case we n=
eed to break_cow on both.
31dbd01f314364 Izik Eidus        2009-09-21  2197  			 */
7b6ba2c7d3baf8 Hugh Dickins      2009-12-14  2198  			if (!stable_node) {
8dd3557a52f0bc Hugh Dickins      2009-12-14  2199  				break_cow(tree_rmap_=
item);
8dd3557a52f0bc Hugh Dickins      2009-12-14  2200  				break_cow(rmap_item);
31dbd01f314364 Izik Eidus        2009-09-21  2201  			}
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2202  		} else if (split) {
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2203  			/*
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2204  			 * We are here if we =
tried to merge two pages and
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2205  			 * failed because the=
y both belonged to the same
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2206  			 * compound page. We =
will split the page now, but no
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2207  			 * merging will take =
place.
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2208  			 * We do not want to =
add the cost of a full lock; if
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2209  			 * the page is locked=
, it is better to skip it and
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2210  			 * perhaps try again =
later.
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2211  			 */
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2212  			if (!trylock_page(pag=
e))
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2213  				return;
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2214  			split_huge_page(page);
77da2ba0648a4f Claudio Imbrenda  2018-04-05  2215  			unlock_page(page);
31dbd01f314364 Izik Eidus        2009-09-21  2216  		}
31dbd01f314364 Izik Eidus        2009-09-21  2217  	}
31dbd01f314364 Izik Eidus        2009-09-21  2218  }
31dbd01f314364 Izik Eidus        2009-09-21  2219  =


:::::: The code at line 2134 was first introduced by commit
:::::: e86c59b1b12d0db1c97eb5bec7586a691685c6cc mm/ksm: improve deduplicati=
on of zero pages with colouring

:::::: TO: Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1609937010395382679==--

