Content-Type: multipart/mixed; boundary="===============1416451120442844724=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2079/2594] fs/btrfs/volumes.c:6546 __btrfs_map_block() error: we previously assumed 'mirror_num_p' could be null (see line 6373)
Date: Wed, 24 Aug 2022 07:42:36 +0800
Message-ID: <202208240734.u4Y7Q6sW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1416451120442844724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: David Sterba <dsterba@suse.com>
CC: Nikolay Borisov <nborisov@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   05477f3653b82d8b3bcf39d2937d9893124976db
commit: 51bf2819055847ce90006a368f8d2c07f408dd33 [2079/2594] btrfs: make th=
e btrfs_io_context allocation in __btrfs_map_block optional
:::::: branch date: 18 hours ago
:::::: commit date: 30 hours ago
config: nios2-randconfig-m031-20220824 (https://download.01.org/0day-ci/arc=
hive/20220824/202208240734.u4Y7Q6sW-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/volumes.c:6546 __btrfs_map_block() error: we previously assumed 'm=
irror_num_p' could be null (see line 6373)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninit=
ialized symbol 'sp'.
fs/btrfs/volumes.c:6396 __btrfs_map_block() error: 'em' dereferencing possi=
ble ERR_PTR()

vim +/mirror_num_p +6546 fs/btrfs/volumes.c

51bf2819055847c Christoph Hellwig 2022-08-06  6357  =

cf8cddd38bab31b Christoph Hellwig 2016-10-27  6358  static int __btrfs_map_=
block(struct btrfs_fs_info *fs_info,
51bf2819055847c Christoph Hellwig 2022-08-06  6359  			     enum btrfs_map_=
op op, u64 logical, u64 *length,
4c6646117912397 Qu Wenruo         2021-09-15  6360  			     struct btrfs_io=
_context **bioc_ret,
51bf2819055847c Christoph Hellwig 2022-08-06  6361  			     struct btrfs_io=
_stripe *smap,
51bf2819055847c Christoph Hellwig 2022-08-06  6362  			     int *mirror_num=
_p, int need_raid_map)
0b86a832a1f38ab Chris Mason       2008-03-24  6363  {
0b86a832a1f38ab Chris Mason       2008-03-24  6364  	struct extent_map *em;
0b86a832a1f38ab Chris Mason       2008-03-24  6365  	struct map_lookup *map;
593060d756e0c23 Chris Mason       2008-03-25  6366  	u64 stripe_offset;
593060d756e0c23 Chris Mason       2008-03-25  6367  	u64 stripe_nr;
53b381b3abeb86f David Woodhouse   2013-01-29  6368  	u64 stripe_len;
9d644a623ec48e2 David Sterba      2015-02-20  6369  	u32 stripe_index;
cff8267228c14e5 David Sterba      2019-05-17  6370  	int data_stripes;
cea9e4452ebaf18 Chris Mason       2008-04-09  6371  	int i;
de11cc12df17337 Li Zefan          2011-12-01  6372  	int ret =3D 0;
51bf2819055847c Christoph Hellwig 2022-08-06 @6373  	int mirror_num =3D mir=
ror_num_p ? *mirror_num_p : 0;
f2d8d74d7874f8f Chris Mason       2008-04-21  6374  	int num_stripes;
a236aed14ccb066 Chris Mason       2008-04-29  6375  	int max_errors =3D 0;
2c8cdd6ee4e7f63 Miao Xie          2014-11-14  6376  	int tgtdev_indexes =3D=
 0;
4c6646117912397 Qu Wenruo         2021-09-15  6377  	struct btrfs_io_contex=
t *bioc =3D NULL;
472262f35a6b340 Stefan Behrens    2012-11-06  6378  	struct btrfs_dev_repla=
ce *dev_replace =3D &fs_info->dev_replace;
472262f35a6b340 Stefan Behrens    2012-11-06  6379  	int dev_replace_is_ong=
oing =3D 0;
472262f35a6b340 Stefan Behrens    2012-11-06  6380  	int num_alloc_stripes;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6381  	int patch_the_first_st=
ripe_for_dev_replace =3D 0;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6382  	u64 physical_to_patch_=
in_first_stripe =3D 0;
53b381b3abeb86f David Woodhouse   2013-01-29  6383  	u64 raid56_full_stripe=
_start =3D (u64)-1;
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6384  	struct btrfs_io_geomet=
ry geom;
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6385  =

4c6646117912397 Qu Wenruo         2021-09-15  6386  	ASSERT(bioc_ret);
75fb2e9e49c1bff David Sterba      2018-08-03  6387  	ASSERT(op !=3D BTRFS_M=
AP_DISCARD);
0b3d4cd371edb6c Liu Bo            2017-03-14  6388  =

420343131970fd2 Michal Rostecki   2021-01-27  6389  	em =3D btrfs_get_chunk=
_map(fs_info, logical, *length);
420343131970fd2 Michal Rostecki   2021-01-27  6390  	ASSERT(!IS_ERR(em));
420343131970fd2 Michal Rostecki   2021-01-27  6391  =

43c0d1a5e117954 Qu Wenruo         2021-04-13  6392  	ret =3D btrfs_get_io_g=
eometry(fs_info, em, op, logical, &geom);
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6393  	if (ret < 0)
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6394  		return ret;
0b86a832a1f38ab Chris Mason       2008-03-24  6395  =

95617d69326ce38 Jeff Mahoney      2015-06-03  6396  	map =3D em->map_lookup;
593060d756e0c23 Chris Mason       2008-03-25  6397  =

89b798ad1b42b1d Nikolay Borisov   2019-06-03  6398  	*length =3D geom.len;
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6399  	stripe_len =3D geom.st=
ripe_len;
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6400  	stripe_nr =3D geom.str=
ipe_nr;
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6401  	stripe_offset =3D geom=
.stripe_offset;
89b798ad1b42b1d Nikolay Borisov   2019-06-03  6402  	raid56_full_stripe_sta=
rt =3D geom.raid56_stripe_offset;
cff8267228c14e5 David Sterba      2019-05-17  6403  	data_stripes =3D nr_da=
ta_stripes(map);
593060d756e0c23 Chris Mason       2008-03-25  6404  =

cb5583dd52fab46 David Sterba      2018-09-07  6405  	down_read(&dev_replace=
->rwsem);
472262f35a6b340 Stefan Behrens    2012-11-06  6406  	dev_replace_is_ongoing=
 =3D btrfs_dev_replace_is_ongoing(dev_replace);
53176dde0acd8fa David Sterba      2018-04-05  6407  	/*
53176dde0acd8fa David Sterba      2018-04-05  6408  	 * Hold the semaphore =
for read during the whole operation, write is
53176dde0acd8fa David Sterba      2018-04-05  6409  	 * requested at commit=
 time but must wait.
53176dde0acd8fa David Sterba      2018-04-05  6410  	 */
472262f35a6b340 Stefan Behrens    2012-11-06  6411  	if (!dev_replace_is_on=
going)
cb5583dd52fab46 David Sterba      2018-09-07  6412  		up_read(&dev_replace-=
>rwsem);
472262f35a6b340 Stefan Behrens    2012-11-06  6413  =

ad6d620e2a5704f Stefan Behrens    2012-11-06  6414  	if (dev_replace_is_ong=
oing && mirror_num =3D=3D map->num_stripes + 1 &&
2b19a1fef7be743 Liu Bo            2017-03-14  6415  	    !need_full_stripe(=
op) && dev_replace->tgtdev !=3D NULL) {
5ab56090b8824c7 Liu Bo            2017-03-14  6416  		ret =3D get_extra_mir=
ror_from_replace(fs_info, logical, *length,
5ab56090b8824c7 Liu Bo            2017-03-14  6417  						    dev_replace->=
srcdev->devid,
5ab56090b8824c7 Liu Bo            2017-03-14  6418  						    &mirror_num,
5ab56090b8824c7 Liu Bo            2017-03-14  6419  					    &physical_to_p=
atch_in_first_stripe);
5ab56090b8824c7 Liu Bo            2017-03-14  6420  		if (ret)
ad6d620e2a5704f Stefan Behrens    2012-11-06  6421  			goto out;
5ab56090b8824c7 Liu Bo            2017-03-14  6422  		else
94a97dfeb61e32a Zhao Lei          2015-12-09  6423  			patch_the_first_stri=
pe_for_dev_replace =3D 1;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6424  	} else if (mirror_num =
> map->num_stripes) {
ad6d620e2a5704f Stefan Behrens    2012-11-06  6425  		mirror_num =3D 0;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6426  	}
ad6d620e2a5704f Stefan Behrens    2012-11-06  6427  =

f2d8d74d7874f8f Chris Mason       2008-04-21  6428  	num_stripes =3D 1;
cea9e4452ebaf18 Chris Mason       2008-04-09  6429  	stripe_index =3D 0;
fce3bb9a1bd4927 Li Dongyang       2011-03-24  6430  	if (map->type & BTRFS_=
BLOCK_GROUP_RAID0) {
47c5713f4737e46 David Sterba      2015-02-20  6431  		stripe_nr =3D div_u64=
_rem(stripe_nr, map->num_stripes,
47c5713f4737e46 David Sterba      2015-02-20  6432  				&stripe_index);
de48373454aceaf Anand Jain        2017-10-12  6433  		if (!need_full_stripe=
(op))
28e1cc7d1baf803 Miao Xie          2014-09-12  6434  			mirror_num =3D 1;
c7369b3faea230c David Sterba      2019-05-31  6435  	} else if (map->type &=
 BTRFS_BLOCK_GROUP_RAID1_MASK) {
de48373454aceaf Anand Jain        2017-10-12  6436  		if (need_full_stripe(=
op))
f2d8d74d7874f8f Chris Mason       2008-04-21  6437  			num_stripes =3D map-=
>num_stripes;
2fff734fafa7422 Chris Mason       2008-04-29  6438  		else if (mirror_num)
f188591e987e21b Chris Mason       2008-04-09  6439  			stripe_index =3D mir=
ror_num - 1;
dfe25020689bb2d Chris Mason       2008-05-13  6440  		else {
30d9861ff9520e2 Stefan Behrens    2012-11-06  6441  			stripe_index =3D fin=
d_live_mirror(fs_info, map, 0,
30d9861ff9520e2 Stefan Behrens    2012-11-06  6442  					    dev_replace_is=
_ongoing);
a1d3c4786a4b9c7 Jan Schmidt       2011-08-04  6443  			mirror_num =3D strip=
e_index + 1;
dfe25020689bb2d Chris Mason       2008-05-13  6444  		}
2fff734fafa7422 Chris Mason       2008-04-29  6445  =

611f0e00a27fe0e Chris Mason       2008-04-03  6446  	} else if (map->type &=
 BTRFS_BLOCK_GROUP_DUP) {
de48373454aceaf Anand Jain        2017-10-12  6447  		if (need_full_stripe(=
op)) {
f2d8d74d7874f8f Chris Mason       2008-04-21  6448  			num_stripes =3D map-=
>num_stripes;
a1d3c4786a4b9c7 Jan Schmidt       2011-08-04  6449  		} else if (mirror_num=
) {
f188591e987e21b Chris Mason       2008-04-09  6450  			stripe_index =3D mir=
ror_num - 1;
a1d3c4786a4b9c7 Jan Schmidt       2011-08-04  6451  		} else {
a1d3c4786a4b9c7 Jan Schmidt       2011-08-04  6452  			mirror_num =3D 1;
a1d3c4786a4b9c7 Jan Schmidt       2011-08-04  6453  		}
2fff734fafa7422 Chris Mason       2008-04-29  6454  =

321aecc65671ae8 Chris Mason       2008-04-16  6455  	} else if (map->type &=
 BTRFS_BLOCK_GROUP_RAID10) {
9d644a623ec48e2 David Sterba      2015-02-20  6456  		u32 factor =3D map->n=
um_stripes / map->sub_stripes;
321aecc65671ae8 Chris Mason       2008-04-16  6457  =

47c5713f4737e46 David Sterba      2015-02-20  6458  		stripe_nr =3D div_u64=
_rem(stripe_nr, factor, &stripe_index);
321aecc65671ae8 Chris Mason       2008-04-16  6459  		stripe_index *=3D map=
->sub_stripes;
321aecc65671ae8 Chris Mason       2008-04-16  6460  =

de48373454aceaf Anand Jain        2017-10-12  6461  		if (need_full_stripe(=
op))
f2d8d74d7874f8f Chris Mason       2008-04-21  6462  			num_stripes =3D map-=
>sub_stripes;
321aecc65671ae8 Chris Mason       2008-04-16  6463  		else if (mirror_num)
321aecc65671ae8 Chris Mason       2008-04-16  6464  			stripe_index +=3D mi=
rror_num - 1;
dfe25020689bb2d Chris Mason       2008-05-13  6465  		else {
3e74317ad773ba9 Jan Schmidt       2012-04-27  6466  			int old_stripe_index=
 =3D stripe_index;
30d9861ff9520e2 Stefan Behrens    2012-11-06  6467  			stripe_index =3D fin=
d_live_mirror(fs_info, map,
30d9861ff9520e2 Stefan Behrens    2012-11-06  6468  					      stripe_index,
30d9861ff9520e2 Stefan Behrens    2012-11-06  6469  					      dev_replace_=
is_ongoing);
3e74317ad773ba9 Jan Schmidt       2012-04-27  6470  			mirror_num =3D strip=
e_index - old_stripe_index + 1;
dfe25020689bb2d Chris Mason       2008-05-13  6471  		}
53b381b3abeb86f David Woodhouse   2013-01-29  6472  =

ffe2d2034bbb34f Zhao Lei          2015-01-20  6473  	} else if (map->type &=
 BTRFS_BLOCK_GROUP_RAID56_MASK) {
ff18a4afebdd9b4 Christoph Hellwig 2022-06-17  6474  		ASSERT(map->stripe_le=
n =3D=3D BTRFS_STRIPE_LEN);
de48373454aceaf Anand Jain        2017-10-12  6475  		if (need_raid_map && =
(need_full_stripe(op) || mirror_num > 1)) {
53b381b3abeb86f David Woodhouse   2013-01-29  6476  			/* push stripe_nr ba=
ck to the start of the full stripe */
42c61ab6760f5f6 Liu Bo            2017-04-03  6477  			stripe_nr =3D div64_=
u64(raid56_full_stripe_start,
cff8267228c14e5 David Sterba      2019-05-17  6478  					stripe_len * data_=
stripes);
53b381b3abeb86f David Woodhouse   2013-01-29  6479  =

53b381b3abeb86f David Woodhouse   2013-01-29  6480  			/* RAID[56] write or=
 recovery. Return all stripes */
53b381b3abeb86f David Woodhouse   2013-01-29  6481  			num_stripes =3D map-=
>num_stripes;
6dead96c1a1e091 Qu Wenruo         2022-05-13  6482  			max_errors =3D btrfs=
_chunk_max_errors(map);
53b381b3abeb86f David Woodhouse   2013-01-29  6483  =

462b0b2a86c4d5a Qu Wenruo         2022-06-17  6484  			/* Return the length=
 to the full stripe end */
462b0b2a86c4d5a Qu Wenruo         2022-06-17  6485  			*length =3D min(logi=
cal + *length,
462b0b2a86c4d5a Qu Wenruo         2022-06-17  6486  				      raid56_full_s=
tripe_start + em->start +
462b0b2a86c4d5a Qu Wenruo         2022-06-17  6487  				      data_stripes =
* stripe_len) - logical;
53b381b3abeb86f David Woodhouse   2013-01-29  6488  			stripe_index =3D 0;
53b381b3abeb86f David Woodhouse   2013-01-29  6489  			stripe_offset =3D 0;
53b381b3abeb86f David Woodhouse   2013-01-29  6490  		} else {
53b381b3abeb86f David Woodhouse   2013-01-29  6491  			/*
53b381b3abeb86f David Woodhouse   2013-01-29  6492  			 * Mirror #0 or #1 m=
eans the original data block.
53b381b3abeb86f David Woodhouse   2013-01-29  6493  			 * Mirror #2 is RAID=
5 parity block.
53b381b3abeb86f David Woodhouse   2013-01-29  6494  			 * Mirror #3 is RAID=
6 Q block.
53b381b3abeb86f David Woodhouse   2013-01-29  6495  			 */
47c5713f4737e46 David Sterba      2015-02-20  6496  			stripe_nr =3D div_u6=
4_rem(stripe_nr,
cff8267228c14e5 David Sterba      2019-05-17  6497  					data_stripes, &str=
ipe_index);
53b381b3abeb86f David Woodhouse   2013-01-29  6498  			if (mirror_num > 1)
cff8267228c14e5 David Sterba      2019-05-17  6499  				stripe_index =3D da=
ta_stripes + mirror_num - 2;
53b381b3abeb86f David Woodhouse   2013-01-29  6500  =

53b381b3abeb86f David Woodhouse   2013-01-29  6501  			/* We distribute the=
 parity blocks across stripes */
47c5713f4737e46 David Sterba      2015-02-20  6502  			div_u64_rem(stripe_n=
r + stripe_index, map->num_stripes,
47c5713f4737e46 David Sterba      2015-02-20  6503  					&stripe_index);
de48373454aceaf Anand Jain        2017-10-12  6504  			if (!need_full_strip=
e(op) && mirror_num <=3D 1)
28e1cc7d1baf803 Miao Xie          2014-09-12  6505  				mirror_num =3D 1;
53b381b3abeb86f David Woodhouse   2013-01-29  6506  		}
8790d502e4401a4 Chris Mason       2008-04-03  6507  	} else {
593060d756e0c23 Chris Mason       2008-03-25  6508  		/*
47c5713f4737e46 David Sterba      2015-02-20  6509  		 * after this, stripe=
_nr is the number of stripes on this
47c5713f4737e46 David Sterba      2015-02-20  6510  		 * device we have to =
walk to find the data, and stripe_index is
47c5713f4737e46 David Sterba      2015-02-20  6511  		 * the number of our =
device in the stripe array
593060d756e0c23 Chris Mason       2008-03-25  6512  		 */
47c5713f4737e46 David Sterba      2015-02-20  6513  		stripe_nr =3D div_u64=
_rem(stripe_nr, map->num_stripes,
47c5713f4737e46 David Sterba      2015-02-20  6514  				&stripe_index);
a1d3c4786a4b9c7 Jan Schmidt       2011-08-04  6515  		mirror_num =3D stripe=
_index + 1;
8790d502e4401a4 Chris Mason       2008-04-03  6516  	}
e042d1ec4417981 Josef Bacik       2016-04-12  6517  	if (stripe_index >=3D =
map->num_stripes) {
5d163e0e68ce743 Jeff Mahoney      2016-09-20  6518  		btrfs_crit(fs_info,
5d163e0e68ce743 Jeff Mahoney      2016-09-20  6519  			   "stripe index mat=
h went horribly wrong, got stripe_index=3D%u, num_stripes=3D%u",
e042d1ec4417981 Josef Bacik       2016-04-12  6520  			   stripe_index, map=
->num_stripes);
e042d1ec4417981 Josef Bacik       2016-04-12  6521  		ret =3D -EINVAL;
e042d1ec4417981 Josef Bacik       2016-04-12  6522  		goto out;
e042d1ec4417981 Josef Bacik       2016-04-12  6523  	}
593060d756e0c23 Chris Mason       2008-03-25  6524  =

472262f35a6b340 Stefan Behrens    2012-11-06  6525  	num_alloc_stripes =3D =
num_stripes;
6fad823f4998cdf Liu Bo            2017-03-14  6526  	if (dev_replace_is_ong=
oing && dev_replace->tgtdev !=3D NULL) {
0b3d4cd371edb6c Liu Bo            2017-03-14  6527  		if (op =3D=3D BTRFS_M=
AP_WRITE)
472262f35a6b340 Stefan Behrens    2012-11-06  6528  			num_alloc_stripes <<=
=3D 1;
cf8cddd38bab31b Christoph Hellwig 2016-10-27  6529  		if (op =3D=3D BTRFS_M=
AP_GET_READ_MIRRORS)
ad6d620e2a5704f Stefan Behrens    2012-11-06  6530  			num_alloc_stripes++;
2c8cdd6ee4e7f63 Miao Xie          2014-11-14  6531  		tgtdev_indexes =3D nu=
m_stripes;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6532  	}
2c8cdd6ee4e7f63 Miao Xie          2014-11-14  6533  =

51bf2819055847c Christoph Hellwig 2022-08-06  6534  	/*
51bf2819055847c Christoph Hellwig 2022-08-06  6535  	 * If this I/O maps to=
 a single device, try to return the device and
51bf2819055847c Christoph Hellwig 2022-08-06  6536  	 * physical block info=
rmation on the stack instead of allocating an
51bf2819055847c Christoph Hellwig 2022-08-06  6537  	 * I/O context structu=
re.
51bf2819055847c Christoph Hellwig 2022-08-06  6538  	 */
51bf2819055847c Christoph Hellwig 2022-08-06  6539  	if (smap && num_alloc_=
stripes =3D=3D 1 &&
51bf2819055847c Christoph Hellwig 2022-08-06  6540  	    !((map->type & BTR=
FS_BLOCK_GROUP_RAID56_MASK) && mirror_num > 1) &&
51bf2819055847c Christoph Hellwig 2022-08-06  6541  	    (!need_full_stripe=
(op) || !dev_replace_is_ongoing ||
51bf2819055847c Christoph Hellwig 2022-08-06  6542  	     !dev_replace->tgt=
dev)) {
51bf2819055847c Christoph Hellwig 2022-08-06  6543  		if (unlikely(patch_th=
e_first_stripe_for_dev_replace)) {
51bf2819055847c Christoph Hellwig 2022-08-06  6544  			smap->dev =3D dev_re=
place->tgtdev;
51bf2819055847c Christoph Hellwig 2022-08-06  6545  			smap->physical =3D p=
hysical_to_patch_in_first_stripe;
51bf2819055847c Christoph Hellwig 2022-08-06 @6546  			*mirror_num_p =3D ma=
p->num_stripes + 1;
51bf2819055847c Christoph Hellwig 2022-08-06  6547  		} else {
51bf2819055847c Christoph Hellwig 2022-08-06  6548  			set_stripe(smap, map=
, stripe_index, stripe_offset,
51bf2819055847c Christoph Hellwig 2022-08-06  6549  				   stripe_nr);
51bf2819055847c Christoph Hellwig 2022-08-06  6550  			*mirror_num_p =3D mi=
rror_num;
51bf2819055847c Christoph Hellwig 2022-08-06  6551  		}
51bf2819055847c Christoph Hellwig 2022-08-06  6552  		*bioc_ret =3D NULL;
51bf2819055847c Christoph Hellwig 2022-08-06  6553  		ret =3D 0;
51bf2819055847c Christoph Hellwig 2022-08-06  6554  		goto out;
51bf2819055847c Christoph Hellwig 2022-08-06  6555  	}
51bf2819055847c Christoph Hellwig 2022-08-06  6556  =

731ccf15c952d53 Qu Wenruo         2021-09-23  6557  	bioc =3D alloc_btrfs_i=
o_context(fs_info, num_alloc_stripes, tgtdev_indexes);
4c6646117912397 Qu Wenruo         2021-09-15  6558  	if (!bioc) {
de11cc12df17337 Li Zefan          2011-12-01  6559  		ret =3D -ENOMEM;
de11cc12df17337 Li Zefan          2011-12-01  6560  		goto out;
de11cc12df17337 Li Zefan          2011-12-01  6561  	}
608769a4e41ccec Nikolay Borisov   2020-07-02  6562  =

608769a4e41ccec Nikolay Borisov   2020-07-02  6563  	for (i =3D 0; i < num_=
stripes; i++) {
51bf2819055847c Christoph Hellwig 2022-08-06  6564  		set_stripe(&bioc->str=
ipes[i], map, stripe_index, stripe_offset,
51bf2819055847c Christoph Hellwig 2022-08-06  6565  			   stripe_nr);
608769a4e41ccec Nikolay Borisov   2020-07-02  6566  		stripe_index++;
608769a4e41ccec Nikolay Borisov   2020-07-02  6567  	}
de11cc12df17337 Li Zefan          2011-12-01  6568  =

4c6646117912397 Qu Wenruo         2021-09-15  6569  	/* Build raid_map */
2b19a1fef7be743 Liu Bo            2017-03-14  6570  	if (map->type & BTRFS_=
BLOCK_GROUP_RAID56_MASK && need_raid_map &&
2b19a1fef7be743 Liu Bo            2017-03-14  6571  	    (need_full_stripe(=
op) || mirror_num > 1)) {
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6572  		u64 tmp;
9d644a623ec48e2 David Sterba      2015-02-20  6573  		unsigned rot;
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6574  =

8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6575  		/* Work out the disk =
rotation on this stripe-set */
47c5713f4737e46 David Sterba      2015-02-20  6576  		div_u64_rem(stripe_nr=
, num_stripes, &rot);
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6577  =

8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6578  		/* Fill in the logica=
l address of each stripe */
cff8267228c14e5 David Sterba      2019-05-17  6579  		tmp =3D stripe_nr * d=
ata_stripes;
cff8267228c14e5 David Sterba      2019-05-17  6580  		for (i =3D 0; i < dat=
a_stripes; i++)
4c6646117912397 Qu Wenruo         2021-09-15  6581  			bioc->raid_map[(i + =
rot) % num_stripes] =3D
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6582  				em->start + (tmp + =
i) * map->stripe_len;
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6583  =

4c6646117912397 Qu Wenruo         2021-09-15  6584  		bioc->raid_map[(i + r=
ot) % map->num_stripes] =3D RAID5_P_STRIPE;
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6585  		if (map->type & BTRFS=
_BLOCK_GROUP_RAID6)
4c6646117912397 Qu Wenruo         2021-09-15  6586  			bioc->raid_map[(i + =
rot + 1) % num_stripes] =3D
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6587  				RAID6_Q_STRIPE;
8e5cfb55d3f7dc7 Zhao Lei          2015-01-20  6588  =

4c6646117912397 Qu Wenruo         2021-09-15  6589  		sort_parity_stripes(b=
ioc, num_stripes);
593060d756e0c23 Chris Mason       2008-03-25  6590  	}
de11cc12df17337 Li Zefan          2011-12-01  6591  =

2b19a1fef7be743 Liu Bo            2017-03-14  6592  	if (need_full_stripe(o=
p))
d20983b40e828fd Miao Xie          2014-07-03  6593  		max_errors =3D btrfs_=
chunk_max_errors(map);
de11cc12df17337 Li Zefan          2011-12-01  6594  =

73c0f228250ff7f Liu Bo            2017-03-14  6595  	if (dev_replace_is_ong=
oing && dev_replace->tgtdev !=3D NULL &&
2b19a1fef7be743 Liu Bo            2017-03-14  6596  	    need_full_stripe(o=
p)) {
4c6646117912397 Qu Wenruo         2021-09-15  6597  		handle_ops_on_dev_rep=
lace(op, &bioc, dev_replace, logical,
6143c23ccced762 Naohiro Aota      2021-02-04  6598  					  &num_stripes, &m=
ax_errors);
ad6d620e2a5704f Stefan Behrens    2012-11-06  6599  	}
472262f35a6b340 Stefan Behrens    2012-11-06  6600  =

4c6646117912397 Qu Wenruo         2021-09-15  6601  	*bioc_ret =3D bioc;
4c6646117912397 Qu Wenruo         2021-09-15  6602  	bioc->map_type =3D map=
->type;
4c6646117912397 Qu Wenruo         2021-09-15  6603  	bioc->num_stripes =3D =
num_stripes;
4c6646117912397 Qu Wenruo         2021-09-15  6604  	bioc->max_errors =3D m=
ax_errors;
4c6646117912397 Qu Wenruo         2021-09-15  6605  	bioc->mirror_num =3D m=
irror_num;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6606  =

ad6d620e2a5704f Stefan Behrens    2012-11-06  6607  	/*
ad6d620e2a5704f Stefan Behrens    2012-11-06  6608  	 * this is the case th=
at REQ_READ && dev_replace_is_ongoing &&
ad6d620e2a5704f Stefan Behrens    2012-11-06  6609  	 * mirror_num =3D=3D n=
um_stripes + 1 && dev_replace target drive is
ad6d620e2a5704f Stefan Behrens    2012-11-06  6610  	 * available as a mirr=
or
ad6d620e2a5704f Stefan Behrens    2012-11-06  6611  	 */
ad6d620e2a5704f Stefan Behrens    2012-11-06  6612  	if (patch_the_first_st=
ripe_for_dev_replace && num_stripes > 0) {
ad6d620e2a5704f Stefan Behrens    2012-11-06  6613  		WARN_ON(num_stripes >=
 1);
4c6646117912397 Qu Wenruo         2021-09-15  6614  		bioc->stripes[0].dev =
=3D dev_replace->tgtdev;
4c6646117912397 Qu Wenruo         2021-09-15  6615  		bioc->stripes[0].phys=
ical =3D physical_to_patch_in_first_stripe;
4c6646117912397 Qu Wenruo         2021-09-15  6616  		bioc->mirror_num =3D =
map->num_stripes + 1;
ad6d620e2a5704f Stefan Behrens    2012-11-06  6617  	}
cea9e4452ebaf18 Chris Mason       2008-04-09  6618  out:
73beece9ca07c00 Liu Bo            2015-07-17  6619  	if (dev_replace_is_ong=
oing) {
53176dde0acd8fa David Sterba      2018-04-05  6620  		lockdep_assert_held(&=
dev_replace->rwsem);
53176dde0acd8fa David Sterba      2018-04-05  6621  		/* Unlock and let wai=
ting writers proceed */
cb5583dd52fab46 David Sterba      2018-09-07  6622  		up_read(&dev_replace-=
>rwsem);
73beece9ca07c00 Liu Bo            2015-07-17  6623  	}
0b86a832a1f38ab Chris Mason       2008-03-24  6624  	free_extent_map(em);
de11cc12df17337 Li Zefan          2011-12-01  6625  	return ret;
0b86a832a1f38ab Chris Mason       2008-03-24  6626  }
0b86a832a1f38ab Chris Mason       2008-03-24  6627  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1416451120442844724==--

