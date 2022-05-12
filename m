Content-Type: multipart/mixed; boundary="===============3951757065001993716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-unaccepted-memory 3/15] mm/page_alloc.c:1183 __free_one_page() error: uninitialized symbol 'page_needs_acceptance'.
Date: Fri, 13 May 2022 01:32:17 +0800
Message-ID: <202205130113.xDKF4oQn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3951757065001993716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-unaccepted-memory
head:   83a8442434ff3bbf432df7508f1fefd447ca2c86
commit: 0845556ccd9555f5245d3bdd6cb646c2ea3fa9c2 [3/15] mm: Add support for=
 unaccepted memory
:::::: branch date: 2 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-m031-20220509 (https://download.01.org/0day-ci/arch=
ive/20220513/202205130113.xDKF4oQn-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/page_alloc.c:1183 __free_one_page() error: uninitialized symbol 'page_ne=
eds_acceptance'.

vim +/page_needs_acceptance +1183 mm/page_alloc.c

0845556ccd9555 Kirill A. Shutemov      2021-08-25  1056  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  1057  /*
^1da177e4c3f41 Linus Torvalds          2005-04-16  1058   * Freeing functio=
n for a buddy system allocator.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1059   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  1060   * The concept of =
a buddy system is to maintain direct-mapped table
^1da177e4c3f41 Linus Torvalds          2005-04-16  1061   * (containing bit=
 values) for memory blocks of various "orders".
^1da177e4c3f41 Linus Torvalds          2005-04-16  1062   * The bottom leve=
l table contains the map for the smallest allocatable
^1da177e4c3f41 Linus Torvalds          2005-04-16  1063   * units of memory=
 (here, pages), and each level above it describes
^1da177e4c3f41 Linus Torvalds          2005-04-16  1064   * pairs of units =
from the levels below, hence, "buddies".
^1da177e4c3f41 Linus Torvalds          2005-04-16  1065   * At a high level=
, all that happens here is marking the table entry
^1da177e4c3f41 Linus Torvalds          2005-04-16  1066   * at the bottom l=
evel available, and propagating the changes upward
^1da177e4c3f41 Linus Torvalds          2005-04-16  1067   * as necessary, p=
lus some accounting needed to play nicely with other
^1da177e4c3f41 Linus Torvalds          2005-04-16  1068   * parts of the VM=
 system.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1069   * At each level, =
we keep a list of pages, which are heads of continuous
6e292b9be7f435 Matthew Wilcox          2018-06-07  1070   * free pages of l=
ength of (1 << order) and marked with PageBuddy.
6e292b9be7f435 Matthew Wilcox          2018-06-07  1071   * Page's order is=
 recorded in page_private(page) field.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1072   * So when we are =
allocating or freeing one, we can derive the state of the
^1da177e4c3f41 Linus Torvalds          2005-04-16  1073   * other.  That is=
, if we allocate a small block, and both were
^1da177e4c3f41 Linus Torvalds          2005-04-16  1074   * free, the remai=
nder of the region must be split into blocks.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1075   * If a block is f=
reed, and its buddy is also free, then this
^1da177e4c3f41 Linus Torvalds          2005-04-16  1076   * triggers coales=
cing into a block of larger size.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1077   *
6d49e352ae9aed Nadia Yvette Chambers   2012-12-06  1078   * -- nyc
^1da177e4c3f41 Linus Torvalds          2005-04-16  1079   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  1080  =

48db57f8ff10eb Nicholas Piggin         2006-01-08  1081  static inline void=
 __free_one_page(struct page *page,
dc4b0caff24d9b Mel Gorman              2014-06-04  1082  		unsigned long pf=
n,
ed0ae21dc5fe3b Mel Gorman              2009-06-16  1083  		struct zone *zon=
e, unsigned int order,
f04a5d5d913fa8 David Hildenbrand       2020-10-15  1084  		int migratetype,=
 fpi_t fpi_flags)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1085  {
a2129f24798a99 Alexander Duyck         2020-04-06  1086  	struct capture_co=
ntrol *capc =3D task_capc(zone);
b3d40a2b6d10c9 David Hildenbrand       2022-03-22  1087  	unsigned int max_=
order =3D pageblock_order;
3f649ab728cda8 Kees Cook               2020-06-03  1088  	unsigned long bud=
dy_pfn;
a2129f24798a99 Alexander Duyck         2020-04-06  1089  	unsigned long com=
bined_pfn;
a2129f24798a99 Alexander Duyck         2020-04-06  1090  	struct page *budd=
y;
a2129f24798a99 Alexander Duyck         2020-04-06  1091  	bool to_tail;
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1092  	bool page_needs_a=
cceptance;
d9dddbf556674b Vlastimil Babka         2016-03-25  1093  =

d29bb9782d2206 Cody P Schafer          2013-02-22  1094  	VM_BUG_ON(!zone_i=
s_initialized(zone));
6e9f0d582dde09 Kirill A. Shutemov      2015-02-11  1095  	VM_BUG_ON_PAGE(pa=
ge->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1096  =

ed0ae21dc5fe3b Mel Gorman              2009-06-16  1097  	VM_BUG_ON(migrate=
type =3D=3D -1);
d9dddbf556674b Vlastimil Babka         2016-03-25  1098  	if (likely(!is_mi=
grate_isolate(migratetype)))
8f82b55dd558a7 Joonsoo Kim             2014-11-13  1099  		__mod_zone_freep=
age_state(zone, 1 << order, migratetype);
ed0ae21dc5fe3b Mel Gorman              2009-06-16  1100  =

76741e776a3797 Vlastimil Babka         2017-02-22  1101  	VM_BUG_ON_PAGE(pf=
n & ((1 << order) - 1), page);
309381feaee564 Sasha Levin             2014-01-23  1102  	VM_BUG_ON_PAGE(ba=
d_range(zone, page), page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1103  =

0845556ccd9555 Kirill A. Shutemov      2021-08-25  1104  	if (PageUnaccepte=
d(page)) {
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1105  		page_needs_accep=
tance =3D true;
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1106  		__ClearPageUnacc=
epted(page);
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1107  	}
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1108  =

d9dddbf556674b Vlastimil Babka         2016-03-25  1109  continue_merging:
7ad69832f37e3c Muchun Song             2020-12-14  1110  	while (order < ma=
x_order) {
5e1f0f098b4649 Mel Gorman              2019-03-05  1111  		if (compaction_c=
apture(capc, page, order, migratetype)) {
5e1f0f098b4649 Mel Gorman              2019-03-05  1112  			__mod_zone_free=
page_state(zone, -(1 << order),
5e1f0f098b4649 Mel Gorman              2019-03-05  1113  								migratetyp=
e);
5e1f0f098b4649 Mel Gorman              2019-03-05  1114  			return;
5e1f0f098b4649 Mel Gorman              2019-03-05  1115  		}
76741e776a3797 Vlastimil Babka         2017-02-22  1116  		buddy_pfn =3D __=
find_buddy_pfn(pfn, order);
76741e776a3797 Vlastimil Babka         2017-02-22  1117  		buddy =3D page +=
 (buddy_pfn - pfn);
13ad59df67f197 Vlastimil Babka         2017-02-22  1118  =

cb2b95e1c6b56e Andy Whitcroft          2006-06-23  1119  		if (!page_is_bud=
dy(page, buddy, order))
d9dddbf556674b Vlastimil Babka         2016-03-25  1120  			goto done_mergi=
ng;
c0a32fc5a2e470 Stanislaw Gruszka       2012-01-10  1121  		/*
c0a32fc5a2e470 Stanislaw Gruszka       2012-01-10  1122  		 * Our buddy is =
free or it is CONFIG_DEBUG_PAGEALLOC guard page,
c0a32fc5a2e470 Stanislaw Gruszka       2012-01-10  1123  		 * merge with it=
 and move up one order.
c0a32fc5a2e470 Stanislaw Gruszka       2012-01-10  1124  		 */
b03641af680959 Dan Williams            2019-05-14  1125  		if (page_is_guar=
d(buddy))
2847cf95c68fa5 Joonsoo Kim             2014-12-12  1126  			clear_page_guar=
d(zone, buddy, order, migratetype);
b03641af680959 Dan Williams            2019-05-14  1127  		else
6ab0136310961e Alexander Duyck         2020-04-06  1128  			del_page_from_f=
ree_list(buddy, zone, order);
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1129  =

0845556ccd9555 Kirill A. Shutemov      2021-08-25  1130  		/* Mark page una=
ccepted if any of merged pages were unaccepted */
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1131  		if (PageUnaccept=
ed(buddy)) {
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1132  			page_needs_acce=
ptance =3D true;
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1133  			__ClearPageUnac=
cepted(buddy);
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1134  		}
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1135  =

76741e776a3797 Vlastimil Babka         2017-02-22  1136  		combined_pfn =3D=
 buddy_pfn & pfn;
76741e776a3797 Vlastimil Babka         2017-02-22  1137  		page =3D page + =
(combined_pfn - pfn);
76741e776a3797 Vlastimil Babka         2017-02-22  1138  		pfn =3D combined=
_pfn;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1139  		order++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1140  	}
7ad69832f37e3c Muchun Song             2020-12-14  1141  	if (order < MAX_O=
RDER - 1) {
d9dddbf556674b Vlastimil Babka         2016-03-25  1142  		/* If we are her=
e, it means order is >=3D pageblock_order.
1dd214b8f21ca4 Zi Yan                  2022-03-22  1143  		 * We want to pr=
event merge between freepages on pageblock
1dd214b8f21ca4 Zi Yan                  2022-03-22  1144  		 * without fallb=
acks and normal pageblock. Without this,
1dd214b8f21ca4 Zi Yan                  2022-03-22  1145  		 * pageblock iso=
lation could cause incorrect freepage or CMA
1dd214b8f21ca4 Zi Yan                  2022-03-22  1146  		 * accounting or=
 HIGHATOMIC accounting.
d9dddbf556674b Vlastimil Babka         2016-03-25  1147  		 *
d9dddbf556674b Vlastimil Babka         2016-03-25  1148  		 * We don't want=
 to hit this code for the more frequent
d9dddbf556674b Vlastimil Babka         2016-03-25  1149  		 * low-order mer=
ging.
d9dddbf556674b Vlastimil Babka         2016-03-25  1150  		 */
d9dddbf556674b Vlastimil Babka         2016-03-25  1151  		int buddy_mt;
d9dddbf556674b Vlastimil Babka         2016-03-25  1152  =

76741e776a3797 Vlastimil Babka         2017-02-22  1153  		buddy_pfn =3D __=
find_buddy_pfn(pfn, order);
76741e776a3797 Vlastimil Babka         2017-02-22  1154  		buddy =3D page +=
 (buddy_pfn - pfn);
787af64d05cd52 Zi Yan                  2022-03-30  1155  =

787af64d05cd52 Zi Yan                  2022-03-30  1156  		if (!page_is_bud=
dy(page, buddy, order))
787af64d05cd52 Zi Yan                  2022-03-30  1157  			goto done_mergi=
ng;
d9dddbf556674b Vlastimil Babka         2016-03-25  1158  		buddy_mt =3D get=
_pageblock_migratetype(buddy);
d9dddbf556674b Vlastimil Babka         2016-03-25  1159  =

d9dddbf556674b Vlastimil Babka         2016-03-25  1160  		if (migratetype =
!=3D buddy_mt
1dd214b8f21ca4 Zi Yan                  2022-03-22  1161  				&& (!migratety=
pe_is_mergeable(migratetype) ||
1dd214b8f21ca4 Zi Yan                  2022-03-22  1162  					!migratetype_=
is_mergeable(buddy_mt)))
d9dddbf556674b Vlastimil Babka         2016-03-25  1163  			goto done_mergi=
ng;
7ad69832f37e3c Muchun Song             2020-12-14  1164  		max_order =3D or=
der + 1;
d9dddbf556674b Vlastimil Babka         2016-03-25  1165  		goto continue_me=
rging;
d9dddbf556674b Vlastimil Babka         2016-03-25  1166  	}
d9dddbf556674b Vlastimil Babka         2016-03-25  1167  =

d9dddbf556674b Vlastimil Babka         2016-03-25  1168  done_merging:
ab130f9108dcf2 Matthew Wilcox (Oracle  2020-10-15  1169) 	set_buddy_order(p=
age, order);
6dda9d55bf5450 Corrado Zoccolo         2010-05-24  1170  =

0845556ccd9555 Kirill A. Shutemov      2021-08-25  1171  	/*
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1172  	 * The page gets =
marked as PageUnaccepted() if any of merged-in pages
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1173  	 * is PageUnaccep=
ted().
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1174  	 *
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1175  	 * New pages, jus=
t being added to buddy allocator, do not have
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1176  	 * PageUnaccepted=
() set. FPI_UNACCEPTED_SLOWPATH indicates that the
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1177  	 * page is new an=
d page_is_unaccepted() check is required to
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1178  	 * determinate if=
 acceptance is required.
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1179  	 *
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1180  	 * Avoid calling =
page_is_unaccepted() if it is known that the page
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1181  	 * needs acceptan=
ce. It can be costly.
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1182  	 */
0845556ccd9555 Kirill A. Shutemov      2021-08-25 @1183  	if (!page_needs_a=
cceptance && (fpi_flags & FPI_UNACCEPTED_SLOWPATH))
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1184  		page_needs_accep=
tance =3D page_is_unaccepted(page, order);
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1185  	if (page_needs_ac=
ceptance)
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1186  		__SetPageUnaccep=
ted(page);
0845556ccd9555 Kirill A. Shutemov      2021-08-25  1187  =

47b6a24a23825a David Hildenbrand       2020-10-15  1188  	if (fpi_flags & F=
PI_TO_TAIL)
47b6a24a23825a David Hildenbrand       2020-10-15  1189  		to_tail =3D true;
47b6a24a23825a David Hildenbrand       2020-10-15  1190  	else if (is_shuff=
le_order(order))
a2129f24798a99 Alexander Duyck         2020-04-06  1191  		to_tail =3D shuf=
fle_pick_tail();
97500a4a54876d Dan Williams            2019-05-14  1192  	else
a2129f24798a99 Alexander Duyck         2020-04-06  1193  		to_tail =3D budd=
y_merge_likely(pfn, buddy_pfn, page, order);
97500a4a54876d Dan Williams            2019-05-14  1194  =

a2129f24798a99 Alexander Duyck         2020-04-06  1195  	if (to_tail)
6ab0136310961e Alexander Duyck         2020-04-06  1196  		add_to_free_list=
_tail(page, zone, order, migratetype);
a2129f24798a99 Alexander Duyck         2020-04-06  1197  	else
6ab0136310961e Alexander Duyck         2020-04-06  1198  		add_to_free_list=
(page, zone, order, migratetype);
36e66c554b5c6a Alexander Duyck         2020-04-06  1199  =

36e66c554b5c6a Alexander Duyck         2020-04-06  1200  	/* Notify page re=
porting subsystem of freed page */
f04a5d5d913fa8 David Hildenbrand       2020-10-15  1201  	if (!(fpi_flags &=
 FPI_SKIP_REPORT_NOTIFY))
36e66c554b5c6a Alexander Duyck         2020-04-06  1202  		page_reporting_n=
otify_free(order);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1203  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1204  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3951757065001993716==--

