Content-Type: multipart/mixed; boundary="===============6463893447922227147=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7814/7920] mm/madvise.c:875:15: warning: Unused variable: zone
Date: Wed, 16 Sep 2020 03:27:44 +0800
Message-ID: <202009160339.rP0U03dB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6463893447922227147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Oscar Salvador <osalvador@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6b02addb1d1748d21dd1261e46029b264be4e5a0
commit: 62e508d41fa6cafc0607cebe9c268e3a08b8d25f [7814/7920] mm,hwpoison: d=
rop unneeded pcplist draining
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   mm/madvise.c:1071:8: warning: Variable 'error' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    error =3D 0;
          ^
   mm/madvise.c:1049:0: note: Variable 'error' is reassigned a value before=
 the old one has been used.
    int error =3D -EINVAL;
   ^
   mm/madvise.c:1071:8: note: Variable 'error' is reassigned a value before=
 the old one has been used.
    error =3D 0;
          ^
   mm/madvise.c:1135:9: warning: Variable 'error' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     error =3D madvise_vma(vma, &prev, start, tmp, behavior);
           ^
   mm/madvise.c:1117:9: note: Variable 'error' is reassigned a value before=
 the old one has been used.
     error =3D -ENOMEM;
           ^
   mm/madvise.c:1135:9: note: Variable 'error' is reassigned a value before=
 the old one has been used.
     error =3D madvise_vma(vma, &prev, start, tmp, behavior);
           ^
>> mm/madvise.c:875:15: warning: Unused variable: zone [unusedVariable]
    struct zone *zone;
                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D62e508d41fa6cafc0607cebe9c268e3a08b8d25f
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout 62e508d41fa6cafc0607cebe9c268e3a08b8d25f
vim +875 mm/madvise.c

f6b3ec238d12c8c Badari Pulavarty  2006-01-06  867  =

9893e49d64a4874 Andi Kleen        2009-09-16  868  #ifdef CONFIG_MEMORY_FAI=
LURE
9893e49d64a4874 Andi Kleen        2009-09-16  869  /*
9893e49d64a4874 Andi Kleen        2009-09-16  870   * Error injection suppo=
rt for memory error handling.
9893e49d64a4874 Andi Kleen        2009-09-16  871   */
97167a7681e9a58 Anshuman Khandual 2017-05-03  872  static int madvise_injec=
t_error(int behavior,
97167a7681e9a58 Anshuman Khandual 2017-05-03  873  		unsigned long start, u=
nsigned long end)
9893e49d64a4874 Andi Kleen        2009-09-16  874  {
c461ad6a63b37ba Mel Gorman        2017-08-31 @875  	struct zone *zone;
d3cd257ce15bad1 Yunfeng Ye        2019-11-30  876  	unsigned long size;
97167a7681e9a58 Anshuman Khandual 2017-05-03  877  =

9893e49d64a4874 Andi Kleen        2009-09-16  878  	if (!capable(CAP_SYS_AD=
MIN))
9893e49d64a4874 Andi Kleen        2009-09-16  879  		return -EPERM;
97167a7681e9a58 Anshuman Khandual 2017-05-03  880  =

19bfbe22f59a207 Alexandru Moise   2017-10-03  881  =

d3cd257ce15bad1 Yunfeng Ye        2019-11-30  882  	for (; start < end; sta=
rt +=3D size) {
23e7b5c2e271594 Dan Williams      2018-07-13  883  		unsigned long pfn;
6a7e4461476a789 Oscar Salvador    2020-09-14  884  		struct page *page;
325c4ef5c4b1737 Andrew Morton     2013-09-11  885  		int ret;
325c4ef5c4b1737 Andrew Morton     2013-09-11  886  =

97167a7681e9a58 Anshuman Khandual 2017-05-03  887  		ret =3D get_user_pages=
_fast(start, 1, 0, &page);
9893e49d64a4874 Andi Kleen        2009-09-16  888  		if (ret !=3D 1)
9893e49d64a4874 Andi Kleen        2009-09-16  889  			return ret;
23e7b5c2e271594 Dan Williams      2018-07-13  890  		pfn =3D page_to_pfn(pa=
ge);
325c4ef5c4b1737 Andrew Morton     2013-09-11  891  =

19bfbe22f59a207 Alexandru Moise   2017-10-03  892  		/*
19bfbe22f59a207 Alexandru Moise   2017-10-03  893  		 * When soft offlining=
 hugepages, after migrating the page
19bfbe22f59a207 Alexandru Moise   2017-10-03  894  		 * we dissolve it, the=
refore in the second loop "page" will
d3cd257ce15bad1 Yunfeng Ye        2019-11-30  895  		 * no longer be a comp=
ound page.
19bfbe22f59a207 Alexandru Moise   2017-10-03  896  		 */
d3cd257ce15bad1 Yunfeng Ye        2019-11-30  897  		size =3D page_size(com=
pound_head(page));
19bfbe22f59a207 Alexandru Moise   2017-10-03  898  =

97167a7681e9a58 Anshuman Khandual 2017-05-03  899  		if (behavior =3D=3D MA=
DV_SOFT_OFFLINE) {
97167a7681e9a58 Anshuman Khandual 2017-05-03  900  			pr_info("Soft offlini=
ng pfn %#lx at process virtual address %#lx\n",
23e7b5c2e271594 Dan Williams      2018-07-13  901  				 pfn, start);
feec24a6139d464 Naoya Horiguchi   2019-11-30  902  			ret =3D soft_offline_=
page(pfn, MF_COUNT_INCREASED);
6a7e4461476a789 Oscar Salvador    2020-09-14  903  		} else {
97167a7681e9a58 Anshuman Khandual 2017-05-03  904  			pr_info("Injecting me=
mory failure for pfn %#lx at process virtual address %#lx\n",
23e7b5c2e271594 Dan Williams      2018-07-13  905  				 pfn, start);
23e7b5c2e271594 Dan Williams      2018-07-13  906  			/*
23e7b5c2e271594 Dan Williams      2018-07-13  907  			 * Drop the page refe=
rence taken by get_user_pages_fast(). In
23e7b5c2e271594 Dan Williams      2018-07-13  908  			 * the absence of MF_=
COUNT_INCREASED the memory_failure()
23e7b5c2e271594 Dan Williams      2018-07-13  909  			 * routine is respons=
ible for pinning the page to prevent it
23e7b5c2e271594 Dan Williams      2018-07-13  910  			 * from being release=
d back to the page allocator.
23e7b5c2e271594 Dan Williams      2018-07-13  911  			 */
23e7b5c2e271594 Dan Williams      2018-07-13  912  			put_page(page);
23e7b5c2e271594 Dan Williams      2018-07-13  913  			ret =3D memory_failur=
e(pfn, 0);
6a7e4461476a789 Oscar Salvador    2020-09-14  914  		}
6a7e4461476a789 Oscar Salvador    2020-09-14  915  =

23a003bfd23ea9e Naoya Horiguchi   2016-03-15  916  		if (ret)
23a003bfd23ea9e Naoya Horiguchi   2016-03-15  917  			return ret;
9893e49d64a4874 Andi Kleen        2009-09-16  918  	}
c461ad6a63b37ba Mel Gorman        2017-08-31  919  =

325c4ef5c4b1737 Andrew Morton     2013-09-11  920  	return 0;
9893e49d64a4874 Andi Kleen        2009-09-16  921  }
9893e49d64a4874 Andi Kleen        2009-09-16  922  #endif
9893e49d64a4874 Andi Kleen        2009-09-16  923  =


:::::: The code@line 875 was first introduced by commit
:::::: c461ad6a63b37ba74632e90c063d14823c884247 mm, madvise: ensure poisone=
d pages are removed from per-cpu lists

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6463893447922227147==--

