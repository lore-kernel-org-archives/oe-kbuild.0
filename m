Content-Type: multipart/mixed; boundary="===============0411817840886047728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/3] btrfs: scrub: rename members related to scrub_block::pagev
Date: Sun, 13 Mar 2022 22:45:33 +0800
Message-ID: <202203132232.7U2j2PCZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0411817840886047728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <c9b166e536844ca1dd42adb8ea1e3520fc53618a.1647161284.git.wqu(a=
)suse.com>
References: <c9b166e536844ca1dd42adb8ea1e3520fc53618a.1647161284.git.wqu@=
suse.com>
TO: Qu Wenruo <wqu@suse.com>

Hi Qu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-scrub-big-=
renaming-to-address-the-page-and-sector-difference/20220313-184251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: m68k-randconfig-m031-20220313 (https://download.01.org/0day-ci/arch=
ive/20220313/202203132232.7U2j2PCZ-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/scrub.c:1258 scrub_setup_recheck_block() warn: should 'original_sb=
lock->sector_count << fs_info->sectorsize_bits' be a 64 bit type?

vim +1258 fs/btrfs/scrub.c

af8e2d1df9848b Miao Xie          2014-10-23  1252  =

be50a8ddaae1d0 Zhao Lei          2015-01-20  1253  static int scrub_setup_r=
echeck_block(struct scrub_block *original_sblock,
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1254  				     struct scrub_bl=
ock *sblocks_for_recheck)
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1255  {
be50a8ddaae1d0 Zhao Lei          2015-01-20  1256  	struct scrub_ctx *sctx =
=3D original_sblock->sctx;
fb456252d3d9c0 Jeff Mahoney      2016-06-22  1257  	struct btrfs_fs_info *f=
s_info =3D sctx->fs_info;
9053bf58b14388 Qu Wenruo         2022-03-13 @1258  	u64 length =3D original=
_sblock->sector_count << fs_info->sectorsize_bits;
9053bf58b14388 Qu Wenruo         2022-03-13  1259  	u64 logical =3D origina=
l_sblock->sectors[0]->logical;
9053bf58b14388 Qu Wenruo         2022-03-13  1260  	u64 generation =3D orig=
inal_sblock->sectors[0]->generation;
9053bf58b14388 Qu Wenruo         2022-03-13  1261  	u64 flags =3D original_=
sblock->sectors[0]->flags;
9053bf58b14388 Qu Wenruo         2022-03-13  1262  	u64 have_csum =3D origi=
nal_sblock->sectors[0]->have_csum;
af8e2d1df9848b Miao Xie          2014-10-23  1263  	struct scrub_recover *r=
ecover;
4c664611791239 Qu Wenruo         2021-09-15  1264  	struct btrfs_io_context=
 *bioc;
af8e2d1df9848b Miao Xie          2014-10-23  1265  	u64 sublen;
af8e2d1df9848b Miao Xie          2014-10-23  1266  	u64 mapped_length;
af8e2d1df9848b Miao Xie          2014-10-23  1267  	u64 stripe_offset;
af8e2d1df9848b Miao Xie          2014-10-23  1268  	int stripe_index;
9053bf58b14388 Qu Wenruo         2022-03-13  1269  	int sector_index =3D 0;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1270  	int mirror_index;
af8e2d1df9848b Miao Xie          2014-10-23  1271  	int nmirrors;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1272  	int ret;
a2de733c78fa7a Arne Jansen       2011-03-08  1273  =

b5d67f64f9bc65 Stefan Behrens    2012-03-27  1274  	/*
570193454a5841 Zhao Lei          2015-01-20  1275  	 * note: the two member=
s refs and outstanding_pages
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1276  	 * are not used (and no=
t set) in the blocks that are used for
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1277  	 * the recheck procedure
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1278  	 */
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1279  =

b5d67f64f9bc65 Stefan Behrens    2012-03-27  1280  	while (length > 0) {
8df507cbb59527 Qu Wenruo         2021-04-22  1281  		sublen =3D min_t(u64, =
length, fs_info->sectorsize);
af8e2d1df9848b Miao Xie          2014-10-23  1282  		mapped_length =3D subl=
en;
4c664611791239 Qu Wenruo         2021-09-15  1283  		bioc =3D NULL;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1284  =

b5d67f64f9bc65 Stefan Behrens    2012-03-27  1285  		/*
8df507cbb59527 Qu Wenruo         2021-04-22  1286  		 * With a length of se=
ctorsize, each returned stripe represents
8df507cbb59527 Qu Wenruo         2021-04-22  1287  		 * one mirror
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1288  		 */
e501bfe323356e Qu Wenruo         2017-03-29  1289  		btrfs_bio_counter_inc_=
blocked(fs_info);
cf8cddd38bab31 Christoph Hellwig 2016-10-27  1290  		ret =3D btrfs_map_sblo=
ck(fs_info, BTRFS_MAP_GET_READ_MIRRORS,
4c664611791239 Qu Wenruo         2021-09-15  1291  				       logical, &map=
ped_length, &bioc);
4c664611791239 Qu Wenruo         2021-09-15  1292  		if (ret || !bioc || ma=
pped_length < sublen) {
4c664611791239 Qu Wenruo         2021-09-15  1293  			btrfs_put_bioc(bioc);
e501bfe323356e Qu Wenruo         2017-03-29  1294  			btrfs_bio_counter_dec=
(fs_info);
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1295  			return -EIO;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1296  		}
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1297  =

af8e2d1df9848b Miao Xie          2014-10-23  1298  		recover =3D kzalloc(si=
zeof(struct scrub_recover), GFP_NOFS);
af8e2d1df9848b Miao Xie          2014-10-23  1299  		if (!recover) {
4c664611791239 Qu Wenruo         2021-09-15  1300  			btrfs_put_bioc(bioc);
e501bfe323356e Qu Wenruo         2017-03-29  1301  			btrfs_bio_counter_dec=
(fs_info);
af8e2d1df9848b Miao Xie          2014-10-23  1302  			return -ENOMEM;
af8e2d1df9848b Miao Xie          2014-10-23  1303  		}
af8e2d1df9848b Miao Xie          2014-10-23  1304  =

6f615018b35fb5 Elena Reshetova   2017-03-03  1305  		refcount_set(&recover-=
>refs, 1);
4c664611791239 Qu Wenruo         2021-09-15  1306  		recover->bioc =3D bioc;
af8e2d1df9848b Miao Xie          2014-10-23  1307  		recover->map_length =
=3D mapped_length;
af8e2d1df9848b Miao Xie          2014-10-23  1308  =

9053bf58b14388 Qu Wenruo         2022-03-13  1309  		ASSERT(sector_index < =
SCRUB_MAX_SECTORS_PER_BLOCK);
af8e2d1df9848b Miao Xie          2014-10-23  1310  =

4c664611791239 Qu Wenruo         2021-09-15  1311  		nmirrors =3D min(scrub=
_nr_raid_mirrors(bioc), BTRFS_MAX_MIRRORS);
10f11900167a83 Zhao Lei          2015-01-20  1312  =

af8e2d1df9848b Miao Xie          2014-10-23  1313  		for (mirror_index =3D =
0; mirror_index < nmirrors;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1314  		     mirror_index++) {
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1315  			struct scrub_block *s=
block;
261d2dcb24302b Qu Wenruo         2020-11-03  1316  			struct scrub_page *sp=
age;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1317  =

b5d67f64f9bc65 Stefan Behrens    2012-03-27  1318  			sblock =3D sblocks_fo=
r_recheck + mirror_index;
7a9e9987681198 Stefan Behrens    2012-11-02  1319  			sblock->sctx =3D sctx;
4734b7ed79e123 Zhao Lei          2015-08-19  1320  =

261d2dcb24302b Qu Wenruo         2020-11-03  1321  			spage =3D kzalloc(siz=
eof(*spage), GFP_NOFS);
261d2dcb24302b Qu Wenruo         2020-11-03  1322  			if (!spage) {
7a9e9987681198 Stefan Behrens    2012-11-02  1323  leave_nomem:
d9d181c1ba7aa0 Stefan Behrens    2012-11-02  1324  				spin_lock(&sctx->sta=
t_lock);
d9d181c1ba7aa0 Stefan Behrens    2012-11-02  1325  				sctx->stat.malloc_er=
rors++;
d9d181c1ba7aa0 Stefan Behrens    2012-11-02  1326  				spin_unlock(&sctx->s=
tat_lock);
e501bfe323356e Qu Wenruo         2017-03-29  1327  				scrub_put_recover(fs=
_info, recover);
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1328  				return -ENOMEM;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1329  			}
261d2dcb24302b Qu Wenruo         2020-11-03  1330  			scrub_page_get(spage);
9053bf58b14388 Qu Wenruo         2022-03-13  1331  			sblock->sectors[secto=
r_index] =3D spage;
261d2dcb24302b Qu Wenruo         2020-11-03  1332  			spage->sblock =3D sbl=
ock;
261d2dcb24302b Qu Wenruo         2020-11-03  1333  			spage->flags =3D flag=
s;
261d2dcb24302b Qu Wenruo         2020-11-03  1334  			spage->generation =3D=
 generation;
261d2dcb24302b Qu Wenruo         2020-11-03  1335  			spage->logical =3D lo=
gical;
261d2dcb24302b Qu Wenruo         2020-11-03  1336  			spage->have_csum =3D =
have_csum;
4734b7ed79e123 Zhao Lei          2015-08-19  1337  			if (have_csum)
261d2dcb24302b Qu Wenruo         2020-11-03  1338  				memcpy(spage->csum,
9053bf58b14388 Qu Wenruo         2022-03-13  1339  				       original_sblo=
ck->sectors[0]->csum,
2ae0c2d80d25da David Sterba      2020-06-30  1340  				       sctx->fs_info=
->csum_size);
af8e2d1df9848b Miao Xie          2014-10-23  1341  =

10f11900167a83 Zhao Lei          2015-01-20  1342  			scrub_stripe_index_an=
d_offset(logical,
4c664611791239 Qu Wenruo         2021-09-15  1343  						      bioc->map_ty=
pe,
4c664611791239 Qu Wenruo         2021-09-15  1344  						      bioc->raid_m=
ap,
af8e2d1df9848b Miao Xie          2014-10-23  1345  						      mapped_lengt=
h,
4c664611791239 Qu Wenruo         2021-09-15  1346  						      bioc->num_st=
ripes -
4c664611791239 Qu Wenruo         2021-09-15  1347  						      bioc->num_tg=
tdevs,
af8e2d1df9848b Miao Xie          2014-10-23  1348  						      mirror_index,
af8e2d1df9848b Miao Xie          2014-10-23  1349  						      &stripe_inde=
x,
af8e2d1df9848b Miao Xie          2014-10-23  1350  						      &stripe_offs=
et);
4c664611791239 Qu Wenruo         2021-09-15  1351  			spage->physical =3D b=
ioc->stripes[stripe_index].physical +
af8e2d1df9848b Miao Xie          2014-10-23  1352  					 stripe_offset;
4c664611791239 Qu Wenruo         2021-09-15  1353  			spage->dev =3D bioc->=
stripes[stripe_index].dev;
af8e2d1df9848b Miao Xie          2014-10-23  1354  =

9053bf58b14388 Qu Wenruo         2022-03-13  1355  			BUG_ON(sector_index >=
=3D original_sblock->sector_count);
261d2dcb24302b Qu Wenruo         2020-11-03  1356  			spage->physical_for_d=
ev_replace =3D
9053bf58b14388 Qu Wenruo         2022-03-13  1357  				original_sblock->sec=
tors[sector_index]->
ff023aac31198e Stefan Behrens    2012-11-06  1358  				physical_for_dev_rep=
lace;
7a9e9987681198 Stefan Behrens    2012-11-02  1359  			/* for missing device=
s, dev->bdev is NULL */
261d2dcb24302b Qu Wenruo         2020-11-03  1360  			spage->mirror_num =3D=
 mirror_index + 1;
9053bf58b14388 Qu Wenruo         2022-03-13  1361  			sblock->sector_count+=
+;
261d2dcb24302b Qu Wenruo         2020-11-03  1362  			spage->page =3D alloc=
_page(GFP_NOFS);
261d2dcb24302b Qu Wenruo         2020-11-03  1363  			if (!spage->page)
7a9e9987681198 Stefan Behrens    2012-11-02  1364  				goto leave_nomem;
af8e2d1df9848b Miao Xie          2014-10-23  1365  =

af8e2d1df9848b Miao Xie          2014-10-23  1366  			scrub_get_recover(rec=
over);
261d2dcb24302b Qu Wenruo         2020-11-03  1367  			spage->recover =3D re=
cover;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1368  		}
e501bfe323356e Qu Wenruo         2017-03-29  1369  		scrub_put_recover(fs_i=
nfo, recover);
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1370  		length -=3D sublen;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1371  		logical +=3D sublen;
9053bf58b14388 Qu Wenruo         2022-03-13  1372  		sector_index++;
b5d67f64f9bc65 Stefan Behrens    2012-03-27  1373  	}
a2de733c78fa7a Arne Jansen       2011-03-08  1374  =

b5d67f64f9bc65 Stefan Behrens    2012-03-27  1375  	return 0;
96e369208e65a7 Ilya Dryomov      2011-04-09  1376  }
96e369208e65a7 Ilya Dryomov      2011-04-09  1377  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0411817840886047728==--

