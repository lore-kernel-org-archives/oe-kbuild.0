Content-Type: multipart/mixed; boundary="===============6556402217152041706=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/memory_hotplug.c:860:16: warning: Local variable online_pages shadows outer function [shadowFunction]
Date: Sat, 19 Mar 2022 15:23:06 +0800
Message-ID: <202203191533.SWh3PIR5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6556402217152041706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34e047aa16c0123bbae8e2f6df33e5ecc1f56601
commit: 445fcf7c721450dd1d4ec6c217b3c6a932602a44 mm/memory_hotplug: memory =
group aware "auto-movable" online policy
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/memory_hotplug.c:860:16: warning: Local variable online_pages shadows=
 outer function [shadowFunction]
    unsigned long online_pages =3D 0, max_pages, end_pfn;
                  ^
   mm/memory_hotplug.c:1024:11: note: Shadowed declaration
   int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
             ^
   mm/memory_hotplug.c:860:16: note: Shadow variable
    unsigned long online_pages =3D 0, max_pages, end_pfn;
                  ^

vim +860 mm/memory_hotplug.c

c246a213f5bad68 Michal Hocko      2017-07-06  808  =

e83a437faa625ef David Hildenbrand 2021-09-07  809  /*
e83a437faa625ef David Hildenbrand 2021-09-07  810   * Determine to which zo=
ne to online memory dynamically based on user
e83a437faa625ef David Hildenbrand 2021-09-07  811   * configuration and sys=
tem stats. We care about the following ratio:
e83a437faa625ef David Hildenbrand 2021-09-07  812   *
e83a437faa625ef David Hildenbrand 2021-09-07  813   *   MOVABLE : KERNEL
e83a437faa625ef David Hildenbrand 2021-09-07  814   *
e83a437faa625ef David Hildenbrand 2021-09-07  815   * Whereby MOVABLE is me=
mory in ZONE_MOVABLE and KERNEL is memory in
e83a437faa625ef David Hildenbrand 2021-09-07  816   * one of the kernel zon=
es. CMA pages inside one of the kernel zones really
e83a437faa625ef David Hildenbrand 2021-09-07  817   * behaves like ZONE_MOV=
ABLE, so we treat them accordingly.
e83a437faa625ef David Hildenbrand 2021-09-07  818   *
e83a437faa625ef David Hildenbrand 2021-09-07  819   * We don't allow for ho=
tplugged memory in a KERNEL zone to increase the
e83a437faa625ef David Hildenbrand 2021-09-07  820   * amount of MOVABLE mem=
ory we can have, so we end up with:
e83a437faa625ef David Hildenbrand 2021-09-07  821   *
e83a437faa625ef David Hildenbrand 2021-09-07  822   *   MOVABLE : KERNEL_EA=
RLY
e83a437faa625ef David Hildenbrand 2021-09-07  823   *
e83a437faa625ef David Hildenbrand 2021-09-07  824   * Whereby KERNEL_EARLY =
is memory in one of the kernel zones, available sinze
e83a437faa625ef David Hildenbrand 2021-09-07  825   * boot. We base our cal=
culation on KERNEL_EARLY internally, because:
e83a437faa625ef David Hildenbrand 2021-09-07  826   *
e83a437faa625ef David Hildenbrand 2021-09-07  827   * a) Hotplugged memory =
in one of the kernel zones can sometimes still get
e83a437faa625ef David Hildenbrand 2021-09-07  828   *    hotunplugged, espe=
cially when hot(un)plugging individual memory blocks.
e83a437faa625ef David Hildenbrand 2021-09-07  829   *    There is no coordi=
nation across memory devices, therefore "automatic"
e83a437faa625ef David Hildenbrand 2021-09-07  830   *    hotunplugging, as =
implemented in hypervisors, could result in zone
e83a437faa625ef David Hildenbrand 2021-09-07  831   *    imbalances.
e83a437faa625ef David Hildenbrand 2021-09-07  832   * b) Early/boot memory =
in one of the kernel zones can usually not get
e83a437faa625ef David Hildenbrand 2021-09-07  833   *    hotunplugged again=
 (e.g., no firmware interface to unplug, fragmented
e83a437faa625ef David Hildenbrand 2021-09-07  834   *    with unmovable all=
ocations). While there are corner cases where it might
e83a437faa625ef David Hildenbrand 2021-09-07  835   *    still work, it is =
barely relevant in practice.
e83a437faa625ef David Hildenbrand 2021-09-07  836   *
e83a437faa625ef David Hildenbrand 2021-09-07  837   * We rely on "present p=
ages" instead of "managed pages", as the latter is
e83a437faa625ef David Hildenbrand 2021-09-07  838   * highly unreliable and=
 dynamic in virtualized environments, and does not
e83a437faa625ef David Hildenbrand 2021-09-07  839   * consider boot time al=
locations. For example, memory ballooning adjusts the
e83a437faa625ef David Hildenbrand 2021-09-07  840   * managed pages when in=
flating/deflating the balloon, and balloon compaction
e83a437faa625ef David Hildenbrand 2021-09-07  841   * can even migrate infl=
ated pages between zones.
e83a437faa625ef David Hildenbrand 2021-09-07  842   *
e83a437faa625ef David Hildenbrand 2021-09-07  843   * Using "present pages"=
 is better but some things to keep in mind are:
e83a437faa625ef David Hildenbrand 2021-09-07  844   *
e83a437faa625ef David Hildenbrand 2021-09-07  845   * a) Some memblock allo=
cations, such as for the crashkernel area, are
e83a437faa625ef David Hildenbrand 2021-09-07  846   *    effectively unused=
 by the kernel, yet they account to "present pages".
e83a437faa625ef David Hildenbrand 2021-09-07  847   *    Fortunately, these=
 allocations are comparatively small in relevant setups
e83a437faa625ef David Hildenbrand 2021-09-07  848   *    (e.g., fraction of=
 system memory).
e83a437faa625ef David Hildenbrand 2021-09-07  849   * b) Some hotplugged me=
mory blocks in virtualized environments, esecially
e83a437faa625ef David Hildenbrand 2021-09-07  850   *    hotplugged by virt=
io-mem, look like they are completely present, however,
e83a437faa625ef David Hildenbrand 2021-09-07  851   *    only parts of the =
memory block are actually currently usable.
e83a437faa625ef David Hildenbrand 2021-09-07  852   *    "present pages" is=
 an upper limit that can get reached at runtime. As
e83a437faa625ef David Hildenbrand 2021-09-07  853   *    we base our calcul=
ations on KERNEL_EARLY, this is not an issue.
e83a437faa625ef David Hildenbrand 2021-09-07  854   */
445fcf7c721450d David Hildenbrand 2021-09-07  855  static struct zone *auto=
_movable_zone_for_pfn(int nid,
445fcf7c721450d David Hildenbrand 2021-09-07  856  					      struct memory=
_group *group,
445fcf7c721450d David Hildenbrand 2021-09-07  857  					      unsigned long=
 pfn,
e83a437faa625ef David Hildenbrand 2021-09-07  858  					      unsigned long=
 nr_pages)
e83a437faa625ef David Hildenbrand 2021-09-07  859  {
445fcf7c721450d David Hildenbrand 2021-09-07 @860  	unsigned long online_pa=
ges =3D 0, max_pages, end_pfn;
445fcf7c721450d David Hildenbrand 2021-09-07  861  	struct page *page;
445fcf7c721450d David Hildenbrand 2021-09-07  862  =

e83a437faa625ef David Hildenbrand 2021-09-07  863  	if (!auto_movable_ratio)
e83a437faa625ef David Hildenbrand 2021-09-07  864  		goto kernel_zone;
e83a437faa625ef David Hildenbrand 2021-09-07  865  =

445fcf7c721450d David Hildenbrand 2021-09-07  866  	if (group && !group->is=
_dynamic) {
445fcf7c721450d David Hildenbrand 2021-09-07  867  		max_pages =3D group->s=
.max_pages;
445fcf7c721450d David Hildenbrand 2021-09-07  868  		online_pages =3D group=
->present_movable_pages;
445fcf7c721450d David Hildenbrand 2021-09-07  869  =

445fcf7c721450d David Hildenbrand 2021-09-07  870  		/* If anything is !MOV=
ABLE online the rest !MOVABLE. */
445fcf7c721450d David Hildenbrand 2021-09-07  871  		if (group->present_ker=
nel_pages)
445fcf7c721450d David Hildenbrand 2021-09-07  872  			goto kernel_zone;
445fcf7c721450d David Hildenbrand 2021-09-07  873  	} else if (!group || gr=
oup->d.unit_pages =3D=3D nr_pages) {
445fcf7c721450d David Hildenbrand 2021-09-07  874  		max_pages =3D nr_pages;
445fcf7c721450d David Hildenbrand 2021-09-07  875  	} else {
445fcf7c721450d David Hildenbrand 2021-09-07  876  		max_pages =3D group->d=
.unit_pages;
445fcf7c721450d David Hildenbrand 2021-09-07  877  		/*
445fcf7c721450d David Hildenbrand 2021-09-07  878  		 * Take a look at all =
online sections in the current unit.
445fcf7c721450d David Hildenbrand 2021-09-07  879  		 * We can safely assum=
e that all pages within a section belong
445fcf7c721450d David Hildenbrand 2021-09-07  880  		 * to the same zone, b=
ecause dynamic memory groups only deal
445fcf7c721450d David Hildenbrand 2021-09-07  881  		 * with hotplugged mem=
ory.
445fcf7c721450d David Hildenbrand 2021-09-07  882  		 */
445fcf7c721450d David Hildenbrand 2021-09-07  883  		pfn =3D ALIGN_DOWN(pfn=
, group->d.unit_pages);
445fcf7c721450d David Hildenbrand 2021-09-07  884  		end_pfn =3D pfn + grou=
p->d.unit_pages;
445fcf7c721450d David Hildenbrand 2021-09-07  885  		for (; pfn < end_pfn; =
pfn +=3D PAGES_PER_SECTION) {
445fcf7c721450d David Hildenbrand 2021-09-07  886  			page =3D pfn_to_onlin=
e_page(pfn);
445fcf7c721450d David Hildenbrand 2021-09-07  887  			if (!page)
445fcf7c721450d David Hildenbrand 2021-09-07  888  				continue;
445fcf7c721450d David Hildenbrand 2021-09-07  889  			/* If anything is !MO=
VABLE online the rest !MOVABLE. */
445fcf7c721450d David Hildenbrand 2021-09-07  890  			if (page_zonenum(page=
) !=3D ZONE_MOVABLE)
445fcf7c721450d David Hildenbrand 2021-09-07  891  				goto kernel_zone;
445fcf7c721450d David Hildenbrand 2021-09-07  892  			online_pages +=3D PAG=
ES_PER_SECTION;
445fcf7c721450d David Hildenbrand 2021-09-07  893  		}
445fcf7c721450d David Hildenbrand 2021-09-07  894  	}
445fcf7c721450d David Hildenbrand 2021-09-07  895  =

445fcf7c721450d David Hildenbrand 2021-09-07  896  	/*
445fcf7c721450d David Hildenbrand 2021-09-07  897  	 * Online MOVABLE if we=
 could *currently* online all remaining parts
445fcf7c721450d David Hildenbrand 2021-09-07  898  	 * MOVABLE. We expect t=
o (add+) online them immediately next, so if
445fcf7c721450d David Hildenbrand 2021-09-07  899  	 * nobody interferes, a=
ll will be MOVABLE if possible.
445fcf7c721450d David Hildenbrand 2021-09-07  900  	 */
445fcf7c721450d David Hildenbrand 2021-09-07  901  	nr_pages =3D max_pages =
- online_pages;
e83a437faa625ef David Hildenbrand 2021-09-07  902  	if (!auto_movable_can_o=
nline_movable(NUMA_NO_NODE, nr_pages))
e83a437faa625ef David Hildenbrand 2021-09-07  903  		goto kernel_zone;
e83a437faa625ef David Hildenbrand 2021-09-07  904  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6556402217152041706==--

