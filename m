Content-Type: multipart/mixed; boundary="===============3746497936348212594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/raid56.c:1255 finish_rmw() error: uninitialized symbol 'has_qstripe'.
Date: Sun, 04 Oct 2020 09:33:32 +0800
Message-ID: <202010040917.r44uG8W4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3746497936348212594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   22fbc037cd32e4e6771d2271b565806cfb8c134c
commit: c17af96554a8a8777cbb0fd53b8497250e548b43 btrfs: raid56: simplify tr=
acking of Q stripe presence
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m031-20201004 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/raid56.c:1255 finish_rmw() error: uninitialized symbol 'has_qstrip=
e'.
fs/btrfs/raid56.c:2390 finish_parity_scrub() error: uninitialized symbol 'h=
as_qstripe'.

Old smatch warnings:
fs/btrfs/raid56.c:2431 finish_parity_scrub() error: memcmp() 'parity' too s=
mall (4096 vs 16384)

vim +/has_qstripe +1255 fs/btrfs/raid56.c

53b381b3abeb86 David Woodhouse    2013-01-29  1183  =

53b381b3abeb86 David Woodhouse    2013-01-29  1184  /*
53b381b3abeb86 David Woodhouse    2013-01-29  1185   * this is called from =
one of two situations.  We either
53b381b3abeb86 David Woodhouse    2013-01-29  1186   * have a full stripe f=
rom the higher layers, or we've read all
53b381b3abeb86 David Woodhouse    2013-01-29  1187   * the missing bits off=
 disk.
53b381b3abeb86 David Woodhouse    2013-01-29  1188   *
53b381b3abeb86 David Woodhouse    2013-01-29  1189   * This will calculate =
the parity and then send down any
53b381b3abeb86 David Woodhouse    2013-01-29  1190   * changed blocks.
53b381b3abeb86 David Woodhouse    2013-01-29  1191   */
53b381b3abeb86 David Woodhouse    2013-01-29  1192  static noinline void fi=
nish_rmw(struct btrfs_raid_bio *rbio)
53b381b3abeb86 David Woodhouse    2013-01-29  1193  {
53b381b3abeb86 David Woodhouse    2013-01-29  1194  	struct btrfs_bio *bbio=
 =3D rbio->bbio;
1389053e1bed93 Kees Cook          2018-05-29  1195  	void **pointers =3D rb=
io->finish_pointers;
53b381b3abeb86 David Woodhouse    2013-01-29  1196  	int nr_data =3D rbio->=
nr_data;
53b381b3abeb86 David Woodhouse    2013-01-29  1197  	int stripe;
53b381b3abeb86 David Woodhouse    2013-01-29  1198  	int pagenr;
c17af96554a8a8 David Sterba       2020-02-19  1199  	bool has_qstripe;
53b381b3abeb86 David Woodhouse    2013-01-29  1200  	struct bio_list bio_li=
st;
53b381b3abeb86 David Woodhouse    2013-01-29  1201  	struct bio *bio;
53b381b3abeb86 David Woodhouse    2013-01-29  1202  	int ret;
53b381b3abeb86 David Woodhouse    2013-01-29  1203  =

53b381b3abeb86 David Woodhouse    2013-01-29  1204  	bio_list_init(&bio_lis=
t);
53b381b3abeb86 David Woodhouse    2013-01-29  1205  =

c17af96554a8a8 David Sterba       2020-02-19  1206  	if (rbio->real_stripes=
 - rbio->nr_data =3D=3D 1)
c17af96554a8a8 David Sterba       2020-02-19  1207  		has_qstripe =3D false;
c17af96554a8a8 David Sterba       2020-02-19  1208  	else if (rbio->real_st=
ripes - rbio->nr_data =3D=3D 2)
c17af96554a8a8 David Sterba       2020-02-19  1209  		has_qstripe =3D true;
c17af96554a8a8 David Sterba       2020-02-19  1210  	else
53b381b3abeb86 David Woodhouse    2013-01-29  1211  		BUG();
53b381b3abeb86 David Woodhouse    2013-01-29  1212  =

53b381b3abeb86 David Woodhouse    2013-01-29  1213  	/* at this point we ei=
ther have a full stripe,
53b381b3abeb86 David Woodhouse    2013-01-29  1214  	 * or we've read the f=
ull stripe from the drive.
53b381b3abeb86 David Woodhouse    2013-01-29  1215  	 * recalculate the par=
ity and write the new results.
53b381b3abeb86 David Woodhouse    2013-01-29  1216  	 *
53b381b3abeb86 David Woodhouse    2013-01-29  1217  	 * We're not allowed t=
o add any new bios to the
53b381b3abeb86 David Woodhouse    2013-01-29  1218  	 * bio list here, anyo=
ne else that wants to
53b381b3abeb86 David Woodhouse    2013-01-29  1219  	 * change this stripe =
needs to do their own rmw.
53b381b3abeb86 David Woodhouse    2013-01-29  1220  	 */
53b381b3abeb86 David Woodhouse    2013-01-29  1221  	spin_lock_irq(&rbio->b=
io_list_lock);
53b381b3abeb86 David Woodhouse    2013-01-29  1222  	set_bit(RBIO_RMW_LOCKE=
D_BIT, &rbio->flags);
53b381b3abeb86 David Woodhouse    2013-01-29  1223  	spin_unlock_irq(&rbio-=
>bio_list_lock);
53b381b3abeb86 David Woodhouse    2013-01-29  1224  =

b89e1b012c7f81 Miao Xie           2014-10-15  1225  	atomic_set(&rbio->erro=
r, 0);
53b381b3abeb86 David Woodhouse    2013-01-29  1226  =

53b381b3abeb86 David Woodhouse    2013-01-29  1227  	/*
53b381b3abeb86 David Woodhouse    2013-01-29  1228  	 * now that we've set =
rmw_locked, run through the
53b381b3abeb86 David Woodhouse    2013-01-29  1229  	 * bio list one last t=
ime and map the page pointers
4ae10b3a133e11 Chris Mason        2013-01-31  1230  	 *
4ae10b3a133e11 Chris Mason        2013-01-31  1231  	 * We don't cache full=
 rbios because we're assuming
4ae10b3a133e11 Chris Mason        2013-01-31  1232  	 * the higher layers a=
re unlikely to use this area of
4ae10b3a133e11 Chris Mason        2013-01-31  1233  	 * the disk again soon=
.  If they do use it again,
4ae10b3a133e11 Chris Mason        2013-01-31  1234  	 * hopefully they will=
 send another full bio.
53b381b3abeb86 David Woodhouse    2013-01-29  1235  	 */
53b381b3abeb86 David Woodhouse    2013-01-29  1236  	index_rbio_pages(rbio);
4ae10b3a133e11 Chris Mason        2013-01-31  1237  	if (!rbio_is_full(rbio=
))
4ae10b3a133e11 Chris Mason        2013-01-31  1238  		cache_rbio_pages(rbio=
);
4ae10b3a133e11 Chris Mason        2013-01-31  1239  	else
4ae10b3a133e11 Chris Mason        2013-01-31  1240  		clear_bit(RBIO_CACHE_=
READY_BIT, &rbio->flags);
53b381b3abeb86 David Woodhouse    2013-01-29  1241  =

915e22903cb346 Zhao Lei           2015-03-03  1242  	for (pagenr =3D 0; pag=
enr < rbio->stripe_npages; pagenr++) {
53b381b3abeb86 David Woodhouse    2013-01-29  1243  		struct page *p;
53b381b3abeb86 David Woodhouse    2013-01-29  1244  		/* first collect one =
page from each data stripe */
53b381b3abeb86 David Woodhouse    2013-01-29  1245  		for (stripe =3D 0; st=
ripe < nr_data; stripe++) {
53b381b3abeb86 David Woodhouse    2013-01-29  1246  			p =3D page_in_rbio(r=
bio, stripe, pagenr, 0);
53b381b3abeb86 David Woodhouse    2013-01-29  1247  			pointers[stripe] =3D=
 kmap(p);
53b381b3abeb86 David Woodhouse    2013-01-29  1248  		}
53b381b3abeb86 David Woodhouse    2013-01-29  1249  =

53b381b3abeb86 David Woodhouse    2013-01-29  1250  		/* then add the parit=
y stripe */
53b381b3abeb86 David Woodhouse    2013-01-29  1251  		p =3D rbio_pstripe_pa=
ge(rbio, pagenr);
53b381b3abeb86 David Woodhouse    2013-01-29  1252  		SetPageUptodate(p);
53b381b3abeb86 David Woodhouse    2013-01-29  1253  		pointers[stripe++] =
=3D kmap(p);
53b381b3abeb86 David Woodhouse    2013-01-29  1254  =

c17af96554a8a8 David Sterba       2020-02-19 @1255  		if (has_qstripe) {
53b381b3abeb86 David Woodhouse    2013-01-29  1256  =

53b381b3abeb86 David Woodhouse    2013-01-29  1257  			/*
53b381b3abeb86 David Woodhouse    2013-01-29  1258  			 * raid6, add the qs=
tripe and call the
53b381b3abeb86 David Woodhouse    2013-01-29  1259  			 * library function =
to fill in our p/q
53b381b3abeb86 David Woodhouse    2013-01-29  1260  			 */
53b381b3abeb86 David Woodhouse    2013-01-29  1261  			p =3D rbio_qstripe_p=
age(rbio, pagenr);
53b381b3abeb86 David Woodhouse    2013-01-29  1262  			SetPageUptodate(p);
53b381b3abeb86 David Woodhouse    2013-01-29  1263  			pointers[stripe++] =
=3D kmap(p);
53b381b3abeb86 David Woodhouse    2013-01-29  1264  =

2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1265  			raid6_call.gen_syndr=
ome(rbio->real_stripes, PAGE_SIZE,
53b381b3abeb86 David Woodhouse    2013-01-29  1266  						pointers);
53b381b3abeb86 David Woodhouse    2013-01-29  1267  		} else {
53b381b3abeb86 David Woodhouse    2013-01-29  1268  			/* raid5 */
69d2480456d1ba David Sterba       2018-06-29  1269  			copy_page(pointers[n=
r_data], pointers[0]);
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1270  			run_xor(pointers + 1=
, nr_data - 1, PAGE_SIZE);
53b381b3abeb86 David Woodhouse    2013-01-29  1271  		}
53b381b3abeb86 David Woodhouse    2013-01-29  1272  =

53b381b3abeb86 David Woodhouse    2013-01-29  1273  =

2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1274  		for (stripe =3D 0; st=
ripe < rbio->real_stripes; stripe++)
53b381b3abeb86 David Woodhouse    2013-01-29  1275  			kunmap(page_in_rbio(=
rbio, stripe, pagenr, 0));
53b381b3abeb86 David Woodhouse    2013-01-29  1276  	}
53b381b3abeb86 David Woodhouse    2013-01-29  1277  =

53b381b3abeb86 David Woodhouse    2013-01-29  1278  	/*
53b381b3abeb86 David Woodhouse    2013-01-29  1279  	 * time to start writi=
ng.  Make bios for everything from the
53b381b3abeb86 David Woodhouse    2013-01-29  1280  	 * higher layers (the =
bio_list in our rbio) and our p/q.  Ignore
53b381b3abeb86 David Woodhouse    2013-01-29  1281  	 * everything else.
53b381b3abeb86 David Woodhouse    2013-01-29  1282  	 */
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1283  	for (stripe =3D 0; str=
ipe < rbio->real_stripes; stripe++) {
915e22903cb346 Zhao Lei           2015-03-03  1284  		for (pagenr =3D 0; pa=
genr < rbio->stripe_npages; pagenr++) {
53b381b3abeb86 David Woodhouse    2013-01-29  1285  			struct page *page;
53b381b3abeb86 David Woodhouse    2013-01-29  1286  			if (stripe < rbio->n=
r_data) {
53b381b3abeb86 David Woodhouse    2013-01-29  1287  				page =3D page_in_rb=
io(rbio, stripe, pagenr, 1);
53b381b3abeb86 David Woodhouse    2013-01-29  1288  				if (!page)
53b381b3abeb86 David Woodhouse    2013-01-29  1289  					continue;
53b381b3abeb86 David Woodhouse    2013-01-29  1290  			} else {
53b381b3abeb86 David Woodhouse    2013-01-29  1291  			       page =3D rbio=
_stripe_page(rbio, stripe, pagenr);
53b381b3abeb86 David Woodhouse    2013-01-29  1292  			}
53b381b3abeb86 David Woodhouse    2013-01-29  1293  =

53b381b3abeb86 David Woodhouse    2013-01-29  1294  			ret =3D rbio_add_io_=
page(rbio, &bio_list,
53b381b3abeb86 David Woodhouse    2013-01-29  1295  				       page, stripe=
, pagenr, rbio->stripe_len);
53b381b3abeb86 David Woodhouse    2013-01-29  1296  			if (ret)
53b381b3abeb86 David Woodhouse    2013-01-29  1297  				goto cleanup;
53b381b3abeb86 David Woodhouse    2013-01-29  1298  		}
53b381b3abeb86 David Woodhouse    2013-01-29  1299  	}
53b381b3abeb86 David Woodhouse    2013-01-29  1300  =

2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1301  	if (likely(!bbio->num_=
tgtdevs))
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1302  		goto write_data;
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1303  =

2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1304  	for (stripe =3D 0; str=
ipe < rbio->real_stripes; stripe++) {
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1305  		if (!bbio->tgtdev_map=
[stripe])
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1306  			continue;
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1307  =

915e22903cb346 Zhao Lei           2015-03-03  1308  		for (pagenr =3D 0; pa=
genr < rbio->stripe_npages; pagenr++) {
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1309  			struct page *page;
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1310  			if (stripe < rbio->n=
r_data) {
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1311  				page =3D page_in_rb=
io(rbio, stripe, pagenr, 1);
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1312  				if (!page)
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1313  					continue;
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1314  			} else {
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1315  			       page =3D rbio=
_stripe_page(rbio, stripe, pagenr);
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1316  			}
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1317  =

2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1318  			ret =3D rbio_add_io_=
page(rbio, &bio_list, page,
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1319  					       rbio->bbio-=
>tgtdev_map[stripe],
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1320  					       pagenr, rbi=
o->stripe_len);
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1321  			if (ret)
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1322  				goto cleanup;
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1323  		}
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1324  	}
2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1325  =

2c8cdd6ee4e7f6 Miao Xie           2014-11-14  1326  write_data:
b89e1b012c7f81 Miao Xie           2014-10-15  1327  	atomic_set(&rbio->stri=
pes_pending, bio_list_size(&bio_list));
b89e1b012c7f81 Miao Xie           2014-10-15  1328  	BUG_ON(atomic_read(&rb=
io->stripes_pending) =3D=3D 0);
53b381b3abeb86 David Woodhouse    2013-01-29  1329  =

53b381b3abeb86 David Woodhouse    2013-01-29  1330  	while (1) {
53b381b3abeb86 David Woodhouse    2013-01-29  1331  		bio =3D bio_list_pop(=
&bio_list);
53b381b3abeb86 David Woodhouse    2013-01-29  1332  		if (!bio)
53b381b3abeb86 David Woodhouse    2013-01-29  1333  			break;
53b381b3abeb86 David Woodhouse    2013-01-29  1334  =

53b381b3abeb86 David Woodhouse    2013-01-29  1335  		bio->bi_private =3D r=
bio;
53b381b3abeb86 David Woodhouse    2013-01-29  1336  		bio->bi_end_io =3D ra=
id_write_end_io;
ebcc326316f3d7 David Sterba       2018-06-29  1337  		bio->bi_opf =3D REQ_O=
P_WRITE;
4e49ea4a3d2763 Mike Christie      2016-06-05  1338  =

4e49ea4a3d2763 Mike Christie      2016-06-05  1339  		submit_bio(bio);
53b381b3abeb86 David Woodhouse    2013-01-29  1340  	}
53b381b3abeb86 David Woodhouse    2013-01-29  1341  	return;
53b381b3abeb86 David Woodhouse    2013-01-29  1342  =

53b381b3abeb86 David Woodhouse    2013-01-29  1343  cleanup:
58efbc9f546330 Omar Sandoval      2017-08-22  1344  	rbio_orig_end_io(rbio,=
 BLK_STS_IOERR);
785884fc31883a Liu Bo             2017-09-22  1345  =

785884fc31883a Liu Bo             2017-09-22  1346  	while ((bio =3D bio_li=
st_pop(&bio_list)))
785884fc31883a Liu Bo             2017-09-22  1347  		bio_put(bio);
53b381b3abeb86 David Woodhouse    2013-01-29  1348  }
53b381b3abeb86 David Woodhouse    2013-01-29  1349  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3746497936348212594==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3746497936348212594==--

