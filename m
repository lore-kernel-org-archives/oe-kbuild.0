Content-Type: multipart/mixed; boundary="===============2236460879899491311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/zdata.c:767 z_erofs_do_read_page() error: we previously assumed 'fe->cl' could be null (see line 666)
Date: Fri, 01 Apr 2022 04:59:08 +0800
Message-ID: <202204010444.7WZ3LNx4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2236460879899491311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Yue Hu <huyue2@coolpad.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: 5c6dcc57e2e50553405f2cf8b949f99b8820a685 erofs: get rid of `struct =
z_erofs_collector'
date:   2 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-m031-20220327 (https://download.01.org/0day-ci/arc=
hive/20220401/202204010444.7WZ3LNx4-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/erofs/zdata.c:767 z_erofs_do_read_page() error: we previously assumed 'f=
e->cl' could be null (see line 666)

Old smatch warnings:
fs/erofs/zdata.c:471 z_erofs_register_collection() warn: passing a valid po=
inter to 'PTR_ERR'
fs/erofs/zdata.c:1244 jobqueueset_init() warn: maybe use && instead of &

vim +767 fs/erofs/zdata.c

92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-12-=
08  639  =

97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-=
31  640  static int z_erofs_do_read_page(struct z_erofs_decompress_frontend=
 *fe,
eaa9172ad988b3 fs/erofs/zdata.c                  Gao Xiang         2021-10-=
22  641  				struct page *page, struct page **pagepool)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  642  {
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-=
31  643  	struct inode *const inode =3D fe->inode;
bda17a4577da72 fs/erofs/zdata.c                  Gao Xiang         2019-10-=
08  644  	struct erofs_sb_info *const sbi =3D EROFS_I_SB(inode);
3b423417d0d1d5 drivers/staging/erofs/unzip_vle.c Chao Yu           2019-01-=
15  645  	struct erofs_map_blocks *const map =3D &fe->map;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  646  	const loff_t offset =3D page_offset(page);
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  647  	bool tight =3D true;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  648  =

92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-12-=
08  649  	enum z_erofs_cache_alloctype cache_strategy;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  650  	enum z_erofs_page_type page_type;
7dd68b147d60e5 drivers/staging/erofs/unzip_vle.c Thomas Wei=C3=9Fschuh  201=
8-09-10  651  	unsigned int cur, end, spiltted, index;
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  652  	int err =3D 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  653  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  654  	/* register locked file pages as online pages in pack */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  655  	z_erofs_onlinepage_init(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  656  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  657  	spiltted =3D 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  658  	end =3D PAGE_SIZE;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  659  repeat:
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  660  	cur =3D end - 1;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  661  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  662  	/* lucky, within the range of the current map_blocks */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  663  	if (offset + cur >=3D map->m_la &&
1e5ceeab692958 drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-=
27  664  	    offset + cur < map->m_la + map->m_llen) {
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-=
31  665  		/* didn't get a valid collection previously (very rare) */
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02 @666  		if (!fe->cl)
1e5ceeab692958 drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-=
27  667  			goto restart_now;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  668  		goto hitted;
1e5ceeab692958 drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-=
27  669  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  670  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  671  	/* go ahead the next map_blocks */
4f761fa253b49f fs/erofs/zdata.c                  Gao Xiang         2019-09-=
04  672  	erofs_dbg("%s: [out-of-range] pos %llu", __func__, offset + cur);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  673  =

5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  674  	if (z_erofs_collector_end(fe))
f0c519fc2679ca drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-11-=
23  675  		fe->backmost =3D false;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  676  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  677  	map->m_la =3D offset + cur;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  678  	map->m_llen =3D 0;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-=
31  679  	err =3D z_erofs_map_blocks_iter(inode, map, 0);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-=
30  680  	if (err)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  681  		goto err_out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  682  =

1e5ceeab692958 drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-=
27  683  restart_now:
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-=
30  684  	if (!(map->m_flags & EROFS_MAP_MAPPED))
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  685  		goto hitted;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  686  =

5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  687  	err =3D z_erofs_collector_begin(fe, inode, map);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-=
30  688  	if (err)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  689  		goto err_out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  690  =

5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  691  	if (z_erofs_is_inline_pcluster(fe->pcl)) {
09c543798c3cde fs/erofs/zdata.c                  Gao Xiang         2022-01-=
02  692  		void *mp;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  693  =

09c543798c3cde fs/erofs/zdata.c                  Gao Xiang         2022-01-=
02  694  		mp =3D erofs_read_metabuf(&fe->map.buf, inode->i_sb,
09c543798c3cde fs/erofs/zdata.c                  Gao Xiang         2022-01-=
02  695  					erofs_blknr(map->m_pa), EROFS_NO_KMAP);
09c543798c3cde fs/erofs/zdata.c                  Gao Xiang         2022-01-=
02  696  		if (IS_ERR(mp)) {
09c543798c3cde fs/erofs/zdata.c                  Gao Xiang         2022-01-=
02  697  			err =3D PTR_ERR(mp);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  698  			erofs_err(inode->i_sb,
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  699  				  "failed to get inline page, err %d", err);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  700  			goto err_out;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  701  		}
09c543798c3cde fs/erofs/zdata.c                  Gao Xiang         2022-01-=
02  702  		get_page(fe->map.buf.page);
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  703  		WRITE_ONCE(fe->pcl->compressed_pages[0], fe->map.buf.page);
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  704  		fe->mode =3D COLLECT_PRIMARY_FOLLOWED_NOINPLACE;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  705  	} else {
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  706  		/* preload all compressed pages (can change mode if needed) */
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  707  		if (should_alloc_managed_pages(fe, sbi->opt.cache_strategy,
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  708  					       map->m_la))
1825c8d7ce93c4 fs/erofs/zdata.c                  Gao Xiang         2020-12-=
09  709  			cache_strategy =3D TRYALLOC;
92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-12-=
08  710  		else
92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-12-=
08  711  			cache_strategy =3D DONTALLOC;
92e6efd566c4a1 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-12-=
08  712  =

5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  713  		preload_compressed_pages(fe, MNGD_MAPPING(sbi),
1825c8d7ce93c4 fs/erofs/zdata.c                  Gao Xiang         2020-12-=
09  714  					 cache_strategy, pagepool);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-=
29  715  	}
105d4ad857dcbf drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  716  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  717  hitted:
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  718  	/*
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  719  	 * Ensure the current partial page belongs to this submit chain r=
ather
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  720  	 * than other concurrent submit chains or the noio(bypass) chain =
since
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  721  	 * those chains are handled asynchronously thus the page cannot b=
e used
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  722  	 * for inplace I/O or pagevec (should be processed in strict orde=
r.)
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  723  	 */
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  724  	tight &=3D (fe->mode >=3D COLLECT_PRIMARY_HOOKED &&
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  725  		  fe->mode !=3D COLLECT_PRIMARY_FOLLOWED_NOINPLACE);
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-=
22  726  =

7dd68b147d60e5 drivers/staging/erofs/unzip_vle.c Thomas Wei=C3=9Fschuh  201=
8-09-10  727  	cur =3D end - min_t(unsigned int, offset + end - map->m_la, =
end);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-=
30  728  	if (!(map->m_flags & EROFS_MAP_MAPPED)) {
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  729  		zero_user_segment(page, cur, end);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  730  		goto next_part;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  731  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  732  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  733  	/* let's derive page type */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  734  	page_type =3D cur ? Z_EROFS_VLE_PAGE_TYPE_HEAD :
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  735  		(!spiltted ? Z_EROFS_PAGE_TYPE_EXCLUSIVE :
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  736  			(tight ? Z_EROFS_PAGE_TYPE_EXCLUSIVE :
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  737  				Z_EROFS_VLE_PAGE_TYPE_TAIL_SHARED));
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  738  =

a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-=
27  739  	if (cur)
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  740  		tight &=3D (fe->mode >=3D COLLECT_PRIMARY_FOLLOWED);
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-=
27  741  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  742  retry:
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  743  	err =3D z_erofs_attach_page(fe, page, page_type,
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  744  				  fe->mode >=3D COLLECT_PRIMARY_FOLLOWED);
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang         2020-12-=
08  745  	/* should allocate an additional short-lived page for pagevec */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  746  	if (err =3D=3D -EAGAIN) {
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  747  		struct page *const newpage =3D
e3f78d5e7e6b08 fs/erofs/zdata.c                  Chao Yu           2020-09-=
17  748  				alloc_page(GFP_NOFS | __GFP_NOFAIL);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  749  =

6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang         2020-12-=
08  750  		set_page_private(newpage, Z_EROFS_SHORTLIVED_PAGE);
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02  751  		err =3D z_erofs_attach_page(fe, newpage,
86432a6dca9bed fs/erofs/zdata.c                  Gao Xiang         2021-11-=
04  752  					  Z_EROFS_PAGE_TYPE_EXCLUSIVE, true);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-=
30  753  		if (!err)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  754  			goto retry;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  755  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  756  =

8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-=
30  757  	if (err)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  758  		goto err_out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  759  =

97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-=
31  760  	index =3D page->index - (map->m_la >> PAGE_SHIFT);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  761  =

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  762  	z_erofs_onlinepage_fixup(page, index, true);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  763  =

1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  764  	/* bump up the number of spiltted parts of a page */
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  765  	++spiltted;
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  766  	/* also update nr_pages */
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang         2022-03-=
02 @767  	fe->cl->nr_pages =3D max_t(pgoff_t, fe->cl->nr_pages, index + 1);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  768  next_part:
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  769  	/* can be used for verification */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  770  	map->m_llen =3D offset + cur - map->m_la;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  771  =

2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps =C4=8Civkulis 201=
8-08-05  772  	end =3D cur;
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps =C4=8Civkulis 201=
8-08-05  773  	if (end > 0)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  774  		goto repeat;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  775  =

1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  776  out:
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  777  	z_erofs_onlinepage_endio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  778  =

4f761fa253b49f fs/erofs/zdata.c                  Gao Xiang         2019-09-=
04  779  	erofs_dbg("%s, finish page: %pK spiltted: %u map->m_llen %llu",
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  780  		  __func__, page, spiltted, map->m_llen);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  781  	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  782  =

1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  783  	/* if some error occurred while processing this page */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  784  err_out:
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  785  	SetPageError(page);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-=
18  786  	goto out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  787  }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-=
26  788  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2236460879899491311==--

