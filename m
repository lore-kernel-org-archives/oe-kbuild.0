Content-Type: multipart/mixed; boundary="===============2754374687867872769=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/xen-blkback/blkback.c:831:9: warning: Opposite expression on both sides of '|='. [oppositeExpression]
Date: Mon, 17 Jan 2022 09:28:20 +0800
Message-ID: <202201170923.c52Ul7Ji-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2754374687867872769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79e06c4c4950be2abd8ca5d2428a8c915aa62c24
commit: 5a264285ed1cd32e26d9de4f3c8c6855e467fd63 xen-blkback: don't "handle=
" error by BUG()
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/f2fs/data.c:1850:11: warning: Redundant condition: If 'err =3D=3D 1',=
 the comparison 'err' is always true. [redundantCondition]
     if (err || err =3D=3D 1)
             ^
   fs/f2fs/f2fs.h:2222:15: warning: Local variable valid_node_count shadows=
 outer function [shadowFunction]
    unsigned int valid_node_count, user_block_count;
                 ^
   fs/f2fs/f2fs.h:2318:28: note: Shadowed declaration
   static inline unsigned int valid_node_count(struct f2fs_sb_info *sbi)
                              ^
   fs/f2fs/f2fs.h:2222:15: note: Shadow variable
    unsigned int valid_node_count, user_block_count;
                 ^
>> drivers/block/xen-blkback/blkback.c:831:9: warning: Opposite expression =
on both sides of '|=3D'. [oppositeExpression]
       ret |=3D !ret;
           ^

vim +831 drivers/block/xen-blkback/blkback.c

01f37f2d53e14a drivers/block/xen-blkback/blkback.c Konrad Rzeszutek Wilk 20=
11-05-11  755  =

597957000ab5b1 drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  756  static int xen_blkbk_map(struct xen_blkif_ring *ring,
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  757  			 struct grant_page *pages[],
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  758  			 int num, bool ro)
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  759  {
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  760  	struct gnttab_map_grant_ref map[BLKIF_MAX_SEGMENTS_PER_REQU=
EST];
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  761  	struct page *pages_to_gnt[BLKIF_MAX_SEGMENTS_PER_REQUEST];
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  762  	struct persistent_gnt *persistent_gnt =3D NULL;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  763  	phys_addr_t addr =3D 0;
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  764  	int i, seg_idx, new_map_idx;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  765  	int segs_to_map =3D 0;
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  766  	int ret =3D 0;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  767  	int last_map =3D 0, map_until =3D 0;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  768  	int use_persistent_gnts;
597957000ab5b1 drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  769  	struct xen_blkif *blkif =3D ring->blkif;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  770  =

0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  771  	use_persistent_gnts =3D (blkif->vbd.feature_gnt_persistent);
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  772  =

01f37f2d53e14a drivers/block/xen-blkback/blkback.c Konrad Rzeszutek Wilk 20=
11-05-11  773  	/*
01f37f2d53e14a drivers/block/xen-blkback/blkback.c Konrad Rzeszutek Wilk 20=
11-05-11  774  	 * Fill out preq.nr_sects with proper amount of sectors, an=
d setup
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  775  	 * assign map[..] with the PFN of the page in our domain wi=
th the
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  776  	 * corresponding grant reference for each page.
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  777  	 */
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  778  again:
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  779  	for (i =3D map_until; i < num; i++) {
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  780  		uint32_t flags;
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  781  =

597957000ab5b1 drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  782  		if (use_persistent_gnts) {
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  783  			persistent_gnt =3D get_persistent_gnt(
d4bf0065b7251a drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  784  				ring,
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  785  				pages[i]->gref);
597957000ab5b1 drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  786  		}
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  787  =

0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  788  		if (persistent_gnt) {
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  789  			/*
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  790  			 * We are using persistent grants and
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  791  			 * the grant is already mapped
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  792  			 */
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  793  			pages[i]->page =3D persistent_gnt->page;
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  794  			pages[i]->persistent_gnt =3D persistent_gnt;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  795  		} else {
ca33479cc7be2c drivers/block/xen-blkback/blkback.c Juergen Gross         20=
20-12-07  796  			if (gnttab_page_cache_get(&ring->free_pages,
ca33479cc7be2c drivers/block/xen-blkback/blkback.c Juergen Gross         20=
20-12-07  797  						  &pages[i]->page))
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  798  				goto out_of_memory;
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  799  			addr =3D vaddr(pages[i]->page);
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  800  			pages_to_gnt[segs_to_map] =3D pages[i]->page;
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  801  			pages[i]->persistent_gnt =3D NULL;
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  802  			flags =3D GNTMAP_host_map;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  803  			if (!use_persistent_gnts && ro)
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  804  				flags |=3D GNTMAP_readonly;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  805  			gnttab_set_map_op(&map[segs_to_map++], addr,
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  806  					  flags, pages[i]->gref,
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  807  					  blkif->domid);
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  808  		}
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  809  		map_until =3D i + 1;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  810  		if (segs_to_map =3D=3D BLKIF_MAX_SEGMENTS_PER_REQUEST)
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  811  			break;
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  812  	}
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  813  =

5a264285ed1cd3 drivers/block/xen-blkback/blkback.c Jan Beulich           20=
21-02-15  814  	if (segs_to_map)
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  815  		ret =3D gnttab_map_refs(map, NULL, pages_to_gnt, segs_to_m=
ap);
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  816  =

01f37f2d53e14a drivers/block/xen-blkback/blkback.c Konrad Rzeszutek Wilk 20=
11-05-11  817  	/*
01f37f2d53e14a drivers/block/xen-blkback/blkback.c Konrad Rzeszutek Wilk 20=
11-05-11  818  	 * Now swizzle the MFN in our domain with the MFN from the =
other domain
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  819  	 * so that when we access vaddr(pending_req,i) it has the c=
ontents of
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  820  	 * the page from the other domain.
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  821  	 */
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  822  	for (seg_idx =3D last_map, new_map_idx =3D 0; seg_idx < map=
_until; seg_idx++) {
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  823  		if (!pages[seg_idx]->persistent_gnt) {
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  824  			/* This is a newly mapped grant */
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  825  			BUG_ON(new_map_idx >=3D segs_to_map);
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  826  			if (unlikely(map[new_map_idx].status !=3D 0)) {
77387b82d1b2ba drivers/block/xen-blkback/blkback.c Tao Chen              20=
15-04-01  827  				pr_debug("invalid buffer -- could not remap it\n");
ca33479cc7be2c drivers/block/xen-blkback/blkback.c Juergen Gross         20=
20-12-07  828  				gnttab_page_cache_put(&ring->free_pages,
ca33479cc7be2c drivers/block/xen-blkback/blkback.c Juergen Gross         20=
20-12-07  829  						      &pages[seg_idx]->page, 1);
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  830  				pages[seg_idx]->handle =3D BLKBACK_INVALID_HANDLE;
5a264285ed1cd3 drivers/block/xen-blkback/blkback.c Jan Beulich           20=
21-02-15 @831  				ret |=3D !ret;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  832  				goto next;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  833  			}
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  834  			pages[seg_idx]->handle =3D map[new_map_idx].handle;
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  835  		} else {
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  836  			continue;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  837  		}
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  838  		if (use_persistent_gnts &&
823f2091469367 drivers/block/xen-blkback/blkback.c SeongJae Park         20=
20-01-27  839  		    ring->persistent_gnt_c < max_pgrants) {
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  840  			/*
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  841  			 * We are using persistent grants, the grant is
3f3aad5e6686ed drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  842  			 * not mapped but we might have room for it.
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  843  			 */
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  844  			persistent_gnt =3D kmalloc(sizeof(struct persistent_gnt),
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  845  				                 GFP_KERNEL);
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  846  			if (!persistent_gnt) {
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  847  				/*
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  848  				 * If we don't have enough memory to
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  849  				 * allocate the persistent_gnt struct
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  850  				 * map this grant non-persistenly
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  851  				 */
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  852  				goto next;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  853  			}
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  854  			persistent_gnt->gnt =3D map[new_map_idx].ref;
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  855  			persistent_gnt->handle =3D map[new_map_idx].handle;
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  856  			persistent_gnt->page =3D pages[seg_idx]->page;
d4bf0065b7251a drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  857  			if (add_persistent_gnt(ring,
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  858  			                       persistent_gnt)) {
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  859  				kfree(persistent_gnt);
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  860  				persistent_gnt =3D NULL;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  861  				goto next;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  862  			}
bb642e8315fd57 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-05-02  863  			pages[seg_idx]->persistent_gnt =3D persistent_gnt;
77387b82d1b2ba drivers/block/xen-blkback/blkback.c Tao Chen              20=
15-04-01  864  			pr_debug("grant %u added to the tree of persistent grants=
, using %u/%u\n",
d4bf0065b7251a drivers/block/xen-blkback/blkback.c Bob Liu               20=
15-11-14  865  				 persistent_gnt->gnt, ring->persistent_gnt_c,
823f2091469367 drivers/block/xen-blkback/blkback.c SeongJae Park         20=
20-01-27  866  				 max_pgrants);
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  867  			goto next;
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  868  		}
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  869  		if (use_persistent_gnts && !blkif->vbd.overflow_max_grants=
) {
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  870  			blkif->vbd.overflow_max_grants =3D 1;
77387b82d1b2ba drivers/block/xen-blkback/blkback.c Tao Chen              20=
15-04-01  871  			pr_debug("domain %u, device %#x is using maximum number o=
f persistent grants\n",
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  872  			         blkif->domid, blkif->vbd.handle);
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  873  		}
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  874  		/*
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  875  		 * We could not map this grant persistently, so use it as
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  876  		 * a non-persistent grant.
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  877  		 */
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  878  next:
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  879  		new_map_idx++;
0a8704a51f386c drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
12-10-24  880  	}
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  881  	segs_to_map =3D 0;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  882  	last_map =3D map_until;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  883  	if (map_until !=3D num)
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  884  		goto again;
31552ee32df89f drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  885  =

1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  886  	return ret;
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  887  =

c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  888  out_of_memory:
77387b82d1b2ba drivers/block/xen-blkback/blkback.c Tao Chen              20=
15-04-01  889  	pr_alert("%s: out of memory\n", __func__);
ca33479cc7be2c drivers/block/xen-blkback/blkback.c Juergen Gross         20=
20-12-07  890  	gnttab_page_cache_put(&ring->free_pages, pages_to_gnt, segs=
_to_map);
f9bd84a8a845d8 drivers/block/xen-blkback/blkback.c SeongJae Park         20=
19-11-26  891  	for (i =3D last_map; i < num; i++)
f9bd84a8a845d8 drivers/block/xen-blkback/blkback.c SeongJae Park         20=
19-11-26  892  		pages[i]->handle =3D BLKBACK_INVALID_HANDLE;
c6cc142dac52e6 drivers/block/xen-blkback/blkback.c Roger Pau Monne       20=
13-04-17  893  	return -ENOMEM;
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  894  }
1a95fe6e42cefc drivers/xen/blkback/blkback.c       Konrad Rzeszutek Wilk 20=
11-04-15  895  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2754374687867872769==--

