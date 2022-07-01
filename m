Content-Type: multipart/mixed; boundary="===============0471873903977402463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-split 13/23] fs/btrfs/volumes.c:6546 __btrfs_map_block() error: we previously assumed 'mirror_num_p' could be null (see line 6373)
Date: Fri, 01 Jul 2022 23:14:46 +0800
Message-ID: <202207012321.3j8iefoF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0471873903977402463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-split
head:   5b0a740fccc4046cf80cfb6d90a6edd7f86b8f60
commit: 3857d170deeb6db2bc4e1e8eb6d827601a7a4281 [13/23] btrfs: stop alloca=
tion a btrfs_io_context for simple I/O
:::::: branch date: 6 hours ago
:::::: commit date: 9 hours ago
config: microblaze-randconfig-m031-20220629 (https://download.01.org/0day-c=
i/archive/20220701/202207012321.3j8iefoF-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/volumes.c:6546 __btrfs_map_block() error: we previously assumed 'm=
irror_num_p' could be null (see line 6373)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/mirror_num_p +6546 fs/btrfs/volumes.c

3857d170deeb6d Christoph Hellwig 2022-06-28  6357  =

cf8cddd38bab31 Christoph Hellwig 2016-10-27  6358  static int __btrfs_map_b=
lock(struct btrfs_fs_info *fs_info,
3857d170deeb6d Christoph Hellwig 2022-06-28  6359  			     enum btrfs_map_o=
p op, u64 logical, u64 *length,
4c664611791239 Qu Wenruo         2021-09-15  6360  			     struct btrfs_io_=
context **bioc_ret,
3857d170deeb6d Christoph Hellwig 2022-06-28  6361  			     struct btrfs_io_=
stripe *smap,
3857d170deeb6d Christoph Hellwig 2022-06-28  6362  			     int *mirror_num_=
p, int need_raid_map)
0b86a832a1f38a Chris Mason       2008-03-24  6363  {
0b86a832a1f38a Chris Mason       2008-03-24  6364  	struct extent_map *em;
0b86a832a1f38a Chris Mason       2008-03-24  6365  	struct map_lookup *map;
593060d756e0c2 Chris Mason       2008-03-25  6366  	u64 stripe_offset;
593060d756e0c2 Chris Mason       2008-03-25  6367  	u64 stripe_nr;
53b381b3abeb86 David Woodhouse   2013-01-29  6368  	u64 stripe_len;
9d644a623ec48e David Sterba      2015-02-20  6369  	u32 stripe_index;
cff8267228c14e David Sterba      2019-05-17  6370  	int data_stripes;
cea9e4452ebaf1 Chris Mason       2008-04-09  6371  	int i;
de11cc12df1733 Li Zefan          2011-12-01  6372  	int ret =3D 0;
3857d170deeb6d Christoph Hellwig 2022-06-28 @6373  	int mirror_num =3D mirr=
or_num_p ? *mirror_num_p : 0;
f2d8d74d7874f8 Chris Mason       2008-04-21  6374  	int num_stripes;
a236aed14ccb06 Chris Mason       2008-04-29  6375  	int max_errors =3D 0;
2c8cdd6ee4e7f6 Miao Xie          2014-11-14  6376  	int tgtdev_indexes =3D =
0;
4c664611791239 Qu Wenruo         2021-09-15  6377  	struct btrfs_io_context=
 *bioc =3D NULL;
472262f35a6b34 Stefan Behrens    2012-11-06  6378  	struct btrfs_dev_replac=
e *dev_replace =3D &fs_info->dev_replace;
472262f35a6b34 Stefan Behrens    2012-11-06  6379  	int dev_replace_is_ongo=
ing =3D 0;
472262f35a6b34 Stefan Behrens    2012-11-06  6380  	int num_alloc_stripes;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6381  	int patch_the_first_str=
ipe_for_dev_replace =3D 0;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6382  	u64 physical_to_patch_i=
n_first_stripe =3D 0;
53b381b3abeb86 David Woodhouse   2013-01-29  6383  	u64 raid56_full_stripe_=
start =3D (u64)-1;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6384  	struct btrfs_io_geometr=
y geom;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6385  =

4c664611791239 Qu Wenruo         2021-09-15  6386  	ASSERT(bioc_ret);
75fb2e9e49c1bf David Sterba      2018-08-03  6387  	ASSERT(op !=3D BTRFS_MA=
P_DISCARD);
0b3d4cd371edb6 Liu Bo            2017-03-14  6388  =

420343131970fd Michal Rostecki   2021-01-27  6389  	em =3D btrfs_get_chunk_=
map(fs_info, logical, *length);
420343131970fd Michal Rostecki   2021-01-27  6390  	ASSERT(!IS_ERR(em));
420343131970fd Michal Rostecki   2021-01-27  6391  =

43c0d1a5e11795 Qu Wenruo         2021-04-13  6392  	ret =3D btrfs_get_io_ge=
ometry(fs_info, em, op, logical, &geom);
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6393  	if (ret < 0)
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6394  		return ret;
0b86a832a1f38a Chris Mason       2008-03-24  6395  =

95617d69326ce3 Jeff Mahoney      2015-06-03  6396  	map =3D em->map_lookup;
593060d756e0c2 Chris Mason       2008-03-25  6397  =

89b798ad1b42b1 Nikolay Borisov   2019-06-03  6398  	*length =3D geom.len;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6399  	stripe_len =3D geom.str=
ipe_len;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6400  	stripe_nr =3D geom.stri=
pe_nr;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6401  	stripe_offset =3D geom.=
stripe_offset;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6402  	raid56_full_stripe_star=
t =3D geom.raid56_stripe_offset;
cff8267228c14e David Sterba      2019-05-17  6403  	data_stripes =3D nr_dat=
a_stripes(map);
593060d756e0c2 Chris Mason       2008-03-25  6404  =

cb5583dd52fab4 David Sterba      2018-09-07  6405  	down_read(&dev_replace-=
>rwsem);
472262f35a6b34 Stefan Behrens    2012-11-06  6406  	dev_replace_is_ongoing =
=3D btrfs_dev_replace_is_ongoing(dev_replace);
53176dde0acd8f David Sterba      2018-04-05  6407  	/*
53176dde0acd8f David Sterba      2018-04-05  6408  	 * Hold the semaphore f=
or read during the whole operation, write is
53176dde0acd8f David Sterba      2018-04-05  6409  	 * requested at commit =
time but must wait.
53176dde0acd8f David Sterba      2018-04-05  6410  	 */
472262f35a6b34 Stefan Behrens    2012-11-06  6411  	if (!dev_replace_is_ong=
oing)
cb5583dd52fab4 David Sterba      2018-09-07  6412  		up_read(&dev_replace->=
rwsem);
472262f35a6b34 Stefan Behrens    2012-11-06  6413  =

ad6d620e2a5704 Stefan Behrens    2012-11-06  6414  	if (dev_replace_is_ongo=
ing && mirror_num =3D=3D map->num_stripes + 1 &&
2b19a1fef7be74 Liu Bo            2017-03-14  6415  	    !need_full_stripe(o=
p) && dev_replace->tgtdev !=3D NULL) {
5ab56090b8824c Liu Bo            2017-03-14  6416  		ret =3D get_extra_mirr=
or_from_replace(fs_info, logical, *length,
5ab56090b8824c Liu Bo            2017-03-14  6417  						    dev_replace->s=
rcdev->devid,
5ab56090b8824c Liu Bo            2017-03-14  6418  						    &mirror_num,
5ab56090b8824c Liu Bo            2017-03-14  6419  					    &physical_to_pa=
tch_in_first_stripe);
5ab56090b8824c Liu Bo            2017-03-14  6420  		if (ret)
ad6d620e2a5704 Stefan Behrens    2012-11-06  6421  			goto out;
5ab56090b8824c Liu Bo            2017-03-14  6422  		else
94a97dfeb61e32 Zhao Lei          2015-12-09  6423  			patch_the_first_strip=
e_for_dev_replace =3D 1;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6424  	} else if (mirror_num >=
 map->num_stripes) {
ad6d620e2a5704 Stefan Behrens    2012-11-06  6425  		mirror_num =3D 0;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6426  	}
ad6d620e2a5704 Stefan Behrens    2012-11-06  6427  =

f2d8d74d7874f8 Chris Mason       2008-04-21  6428  	num_stripes =3D 1;
cea9e4452ebaf1 Chris Mason       2008-04-09  6429  	stripe_index =3D 0;
fce3bb9a1bd492 Li Dongyang       2011-03-24  6430  	if (map->type & BTRFS_B=
LOCK_GROUP_RAID0) {
47c5713f4737e4 David Sterba      2015-02-20  6431  		stripe_nr =3D div_u64_=
rem(stripe_nr, map->num_stripes,
47c5713f4737e4 David Sterba      2015-02-20  6432  				&stripe_index);
de48373454acea Anand Jain        2017-10-12  6433  		if (!need_full_stripe(=
op))
28e1cc7d1baf80 Miao Xie          2014-09-12  6434  			mirror_num =3D 1;
c7369b3faea230 David Sterba      2019-05-31  6435  	} else if (map->type & =
BTRFS_BLOCK_GROUP_RAID1_MASK) {
de48373454acea Anand Jain        2017-10-12  6436  		if (need_full_stripe(o=
p))
f2d8d74d7874f8 Chris Mason       2008-04-21  6437  			num_stripes =3D map->=
num_stripes;
2fff734fafa742 Chris Mason       2008-04-29  6438  		else if (mirror_num)
f188591e987e21 Chris Mason       2008-04-09  6439  			stripe_index =3D mirr=
or_num - 1;
dfe25020689bb2 Chris Mason       2008-05-13  6440  		else {
30d9861ff9520e Stefan Behrens    2012-11-06  6441  			stripe_index =3D find=
_live_mirror(fs_info, map, 0,
30d9861ff9520e Stefan Behrens    2012-11-06  6442  					    dev_replace_is_=
ongoing);
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6443  			mirror_num =3D stripe=
_index + 1;
dfe25020689bb2 Chris Mason       2008-05-13  6444  		}
2fff734fafa742 Chris Mason       2008-04-29  6445  =

611f0e00a27fe0 Chris Mason       2008-04-03  6446  	} else if (map->type & =
BTRFS_BLOCK_GROUP_DUP) {
de48373454acea Anand Jain        2017-10-12  6447  		if (need_full_stripe(o=
p)) {
f2d8d74d7874f8 Chris Mason       2008-04-21  6448  			num_stripes =3D map->=
num_stripes;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6449  		} else if (mirror_num)=
 {
f188591e987e21 Chris Mason       2008-04-09  6450  			stripe_index =3D mirr=
or_num - 1;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6451  		} else {
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6452  			mirror_num =3D 1;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6453  		}
2fff734fafa742 Chris Mason       2008-04-29  6454  =

321aecc65671ae Chris Mason       2008-04-16  6455  	} else if (map->type & =
BTRFS_BLOCK_GROUP_RAID10) {
9d644a623ec48e David Sterba      2015-02-20  6456  		u32 factor =3D map->nu=
m_stripes / map->sub_stripes;
321aecc65671ae Chris Mason       2008-04-16  6457  =

47c5713f4737e4 David Sterba      2015-02-20  6458  		stripe_nr =3D div_u64_=
rem(stripe_nr, factor, &stripe_index);
321aecc65671ae Chris Mason       2008-04-16  6459  		stripe_index *=3D map-=
>sub_stripes;
321aecc65671ae Chris Mason       2008-04-16  6460  =

de48373454acea Anand Jain        2017-10-12  6461  		if (need_full_stripe(o=
p))
f2d8d74d7874f8 Chris Mason       2008-04-21  6462  			num_stripes =3D map->=
sub_stripes;
321aecc65671ae Chris Mason       2008-04-16  6463  		else if (mirror_num)
321aecc65671ae Chris Mason       2008-04-16  6464  			stripe_index +=3D mir=
ror_num - 1;
dfe25020689bb2 Chris Mason       2008-05-13  6465  		else {
3e74317ad773ba Jan Schmidt       2012-04-27  6466  			int old_stripe_index =
=3D stripe_index;
30d9861ff9520e Stefan Behrens    2012-11-06  6467  			stripe_index =3D find=
_live_mirror(fs_info, map,
30d9861ff9520e Stefan Behrens    2012-11-06  6468  					      stripe_index,
30d9861ff9520e Stefan Behrens    2012-11-06  6469  					      dev_replace_i=
s_ongoing);
3e74317ad773ba Jan Schmidt       2012-04-27  6470  			mirror_num =3D stripe=
_index - old_stripe_index + 1;
dfe25020689bb2 Chris Mason       2008-05-13  6471  		}
53b381b3abeb86 David Woodhouse   2013-01-29  6472  =

ffe2d2034bbb34 Zhao Lei          2015-01-20  6473  	} else if (map->type & =
BTRFS_BLOCK_GROUP_RAID56_MASK) {
6a45cb21d29269 Christoph Hellwig 2022-06-17  6474  		ASSERT(map->stripe_len=
 =3D=3D BTRFS_STRIPE_LEN);
de48373454acea Anand Jain        2017-10-12  6475  		if (need_raid_map && (=
need_full_stripe(op) || mirror_num > 1)) {
53b381b3abeb86 David Woodhouse   2013-01-29  6476  			/* push stripe_nr bac=
k to the start of the full stripe */
42c61ab6760f5f Liu Bo            2017-04-03  6477  			stripe_nr =3D div64_u=
64(raid56_full_stripe_start,
cff8267228c14e David Sterba      2019-05-17  6478  					stripe_len * data_s=
tripes);
53b381b3abeb86 David Woodhouse   2013-01-29  6479  =

53b381b3abeb86 David Woodhouse   2013-01-29  6480  			/* RAID[56] write or =
recovery. Return all stripes */
53b381b3abeb86 David Woodhouse   2013-01-29  6481  			num_stripes =3D map->=
num_stripes;
a204b169d8ee1d Qu Wenruo         2022-05-13  6482  			max_errors =3D btrfs_=
chunk_max_errors(map);
53b381b3abeb86 David Woodhouse   2013-01-29  6483  =

a8aa67e6507575 Qu Wenruo         2022-06-17  6484  			/* Return the length =
to the full stripe end */
a8aa67e6507575 Qu Wenruo         2022-06-17  6485  			*length =3D min(logic=
al + *length,
a8aa67e6507575 Qu Wenruo         2022-06-17  6486  				      raid56_full_st=
ripe_start + em->start +
a8aa67e6507575 Qu Wenruo         2022-06-17  6487  				      data_stripes *=
 stripe_len) - logical;
53b381b3abeb86 David Woodhouse   2013-01-29  6488  			stripe_index =3D 0;
53b381b3abeb86 David Woodhouse   2013-01-29  6489  			stripe_offset =3D 0;
53b381b3abeb86 David Woodhouse   2013-01-29  6490  		} else {
53b381b3abeb86 David Woodhouse   2013-01-29  6491  			/*
53b381b3abeb86 David Woodhouse   2013-01-29  6492  			 * Mirror #0 or #1 me=
ans the original data block.
53b381b3abeb86 David Woodhouse   2013-01-29  6493  			 * Mirror #2 is RAID5=
 parity block.
53b381b3abeb86 David Woodhouse   2013-01-29  6494  			 * Mirror #3 is RAID6=
 Q block.
53b381b3abeb86 David Woodhouse   2013-01-29  6495  			 */
47c5713f4737e4 David Sterba      2015-02-20  6496  			stripe_nr =3D div_u64=
_rem(stripe_nr,
cff8267228c14e David Sterba      2019-05-17  6497  					data_stripes, &stri=
pe_index);
53b381b3abeb86 David Woodhouse   2013-01-29  6498  			if (mirror_num > 1)
cff8267228c14e David Sterba      2019-05-17  6499  				stripe_index =3D dat=
a_stripes + mirror_num - 2;
53b381b3abeb86 David Woodhouse   2013-01-29  6500  =

53b381b3abeb86 David Woodhouse   2013-01-29  6501  			/* We distribute the =
parity blocks across stripes */
47c5713f4737e4 David Sterba      2015-02-20  6502  			div_u64_rem(stripe_nr=
 + stripe_index, map->num_stripes,
47c5713f4737e4 David Sterba      2015-02-20  6503  					&stripe_index);
de48373454acea Anand Jain        2017-10-12  6504  			if (!need_full_stripe=
(op) && mirror_num <=3D 1)
28e1cc7d1baf80 Miao Xie          2014-09-12  6505  				mirror_num =3D 1;
53b381b3abeb86 David Woodhouse   2013-01-29  6506  		}
8790d502e4401a Chris Mason       2008-04-03  6507  	} else {
593060d756e0c2 Chris Mason       2008-03-25  6508  		/*
47c5713f4737e4 David Sterba      2015-02-20  6509  		 * after this, stripe_=
nr is the number of stripes on this
47c5713f4737e4 David Sterba      2015-02-20  6510  		 * device we have to w=
alk to find the data, and stripe_index is
47c5713f4737e4 David Sterba      2015-02-20  6511  		 * the number of our d=
evice in the stripe array
593060d756e0c2 Chris Mason       2008-03-25  6512  		 */
47c5713f4737e4 David Sterba      2015-02-20  6513  		stripe_nr =3D div_u64_=
rem(stripe_nr, map->num_stripes,
47c5713f4737e4 David Sterba      2015-02-20  6514  				&stripe_index);
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6515  		mirror_num =3D stripe_=
index + 1;
8790d502e4401a Chris Mason       2008-04-03  6516  	}
e042d1ec441798 Josef Bacik       2016-04-12  6517  	if (stripe_index >=3D m=
ap->num_stripes) {
5d163e0e68ce74 Jeff Mahoney      2016-09-20  6518  		btrfs_crit(fs_info,
5d163e0e68ce74 Jeff Mahoney      2016-09-20  6519  			   "stripe index math=
 went horribly wrong, got stripe_index=3D%u, num_stripes=3D%u",
e042d1ec441798 Josef Bacik       2016-04-12  6520  			   stripe_index, map-=
>num_stripes);
e042d1ec441798 Josef Bacik       2016-04-12  6521  		ret =3D -EINVAL;
e042d1ec441798 Josef Bacik       2016-04-12  6522  		goto out;
e042d1ec441798 Josef Bacik       2016-04-12  6523  	}
593060d756e0c2 Chris Mason       2008-03-25  6524  =

472262f35a6b34 Stefan Behrens    2012-11-06  6525  	num_alloc_stripes =3D n=
um_stripes;
6fad823f4998cd Liu Bo            2017-03-14  6526  	if (dev_replace_is_ongo=
ing && dev_replace->tgtdev !=3D NULL) {
0b3d4cd371edb6 Liu Bo            2017-03-14  6527  		if (op =3D=3D BTRFS_MA=
P_WRITE)
472262f35a6b34 Stefan Behrens    2012-11-06  6528  			num_alloc_stripes <<=
=3D 1;
cf8cddd38bab31 Christoph Hellwig 2016-10-27  6529  		if (op =3D=3D BTRFS_MA=
P_GET_READ_MIRRORS)
ad6d620e2a5704 Stefan Behrens    2012-11-06  6530  			num_alloc_stripes++;
2c8cdd6ee4e7f6 Miao Xie          2014-11-14  6531  		tgtdev_indexes =3D num=
_stripes;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6532  	}
2c8cdd6ee4e7f6 Miao Xie          2014-11-14  6533  =

3857d170deeb6d Christoph Hellwig 2022-06-28  6534  	/*
3857d170deeb6d Christoph Hellwig 2022-06-28  6535  	 * If this I/O maps to =
a single device, try to return the device and
3857d170deeb6d Christoph Hellwig 2022-06-28  6536  	 * physical block infor=
mation on the stack instead of allocating an
3857d170deeb6d Christoph Hellwig 2022-06-28  6537  	 * I/O context structur=
e.
3857d170deeb6d Christoph Hellwig 2022-06-28  6538  	 */
3857d170deeb6d Christoph Hellwig 2022-06-28  6539  	if (smap && num_alloc_s=
tripes =3D=3D 1 &&
3857d170deeb6d Christoph Hellwig 2022-06-28  6540  	    !((map->type & BTRF=
S_BLOCK_GROUP_RAID56_MASK) && mirror_num > 1) &&
3857d170deeb6d Christoph Hellwig 2022-06-28  6541  	    (!need_full_stripe(=
op) || !dev_replace_is_ongoing ||
3857d170deeb6d Christoph Hellwig 2022-06-28  6542  	     !dev_replace->tgtd=
ev)) {
3857d170deeb6d Christoph Hellwig 2022-06-28  6543  		if (unlikely(patch_the=
_first_stripe_for_dev_replace)) {
3857d170deeb6d Christoph Hellwig 2022-06-28  6544  			smap->dev =3D dev_rep=
lace->tgtdev;
3857d170deeb6d Christoph Hellwig 2022-06-28  6545  			smap->physical =3D ph=
ysical_to_patch_in_first_stripe;
3857d170deeb6d Christoph Hellwig 2022-06-28 @6546  			*mirror_num_p =3D map=
->num_stripes + 1;
3857d170deeb6d Christoph Hellwig 2022-06-28  6547  		} else {
3857d170deeb6d Christoph Hellwig 2022-06-28  6548  			set_stripe(smap, map,=
 stripe_index, stripe_offset,
3857d170deeb6d Christoph Hellwig 2022-06-28  6549  				   stripe_nr);
3857d170deeb6d Christoph Hellwig 2022-06-28  6550  			*mirror_num_p =3D mir=
ror_num;
3857d170deeb6d Christoph Hellwig 2022-06-28  6551  		}
3857d170deeb6d Christoph Hellwig 2022-06-28  6552  		*bioc_ret =3D NULL;
3857d170deeb6d Christoph Hellwig 2022-06-28  6553  		ret =3D 0;
3857d170deeb6d Christoph Hellwig 2022-06-28  6554  		goto out;
3857d170deeb6d Christoph Hellwig 2022-06-28  6555  	}
3857d170deeb6d Christoph Hellwig 2022-06-28  6556  =

731ccf15c952d5 Qu Wenruo         2021-09-23  6557  	bioc =3D alloc_btrfs_io=
_context(fs_info, num_alloc_stripes, tgtdev_indexes);
4c664611791239 Qu Wenruo         2021-09-15  6558  	if (!bioc) {
de11cc12df1733 Li Zefan          2011-12-01  6559  		ret =3D -ENOMEM;
de11cc12df1733 Li Zefan          2011-12-01  6560  		goto out;
de11cc12df1733 Li Zefan          2011-12-01  6561  	}
608769a4e41cce Nikolay Borisov   2020-07-02  6562  =

608769a4e41cce Nikolay Borisov   2020-07-02  6563  	for (i =3D 0; i < num_s=
tripes; i++) {
3857d170deeb6d Christoph Hellwig 2022-06-28  6564  		set_stripe(&bioc->stri=
pes[i], map, stripe_index, stripe_offset,
3857d170deeb6d Christoph Hellwig 2022-06-28  6565  			   stripe_nr);
608769a4e41cce Nikolay Borisov   2020-07-02  6566  		stripe_index++;
608769a4e41cce Nikolay Borisov   2020-07-02  6567  	}
de11cc12df1733 Li Zefan          2011-12-01  6568  =

4c664611791239 Qu Wenruo         2021-09-15  6569  	/* Build raid_map */
2b19a1fef7be74 Liu Bo            2017-03-14  6570  	if (map->type & BTRFS_B=
LOCK_GROUP_RAID56_MASK && need_raid_map &&
2b19a1fef7be74 Liu Bo            2017-03-14  6571  	    (need_full_stripe(o=
p) || mirror_num > 1)) {
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6572  		u64 tmp;
9d644a623ec48e David Sterba      2015-02-20  6573  		unsigned rot;
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6574  =

8e5cfb55d3f7dc Zhao Lei          2015-01-20  6575  		/* Work out the disk r=
otation on this stripe-set */
47c5713f4737e4 David Sterba      2015-02-20  6576  		div_u64_rem(stripe_nr,=
 num_stripes, &rot);
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6577  =

8e5cfb55d3f7dc Zhao Lei          2015-01-20  6578  		/* Fill in the logical=
 address of each stripe */
cff8267228c14e David Sterba      2019-05-17  6579  		tmp =3D stripe_nr * da=
ta_stripes;
cff8267228c14e David Sterba      2019-05-17  6580  		for (i =3D 0; i < data=
_stripes; i++)
4c664611791239 Qu Wenruo         2021-09-15  6581  			bioc->raid_map[(i + r=
ot) % num_stripes] =3D
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6582  				em->start + (tmp + i=
) * map->stripe_len;
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6583  =

4c664611791239 Qu Wenruo         2021-09-15  6584  		bioc->raid_map[(i + ro=
t) % map->num_stripes] =3D RAID5_P_STRIPE;
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6585  		if (map->type & BTRFS_=
BLOCK_GROUP_RAID6)
4c664611791239 Qu Wenruo         2021-09-15  6586  			bioc->raid_map[(i + r=
ot + 1) % num_stripes] =3D
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6587  				RAID6_Q_STRIPE;
8e5cfb55d3f7dc Zhao Lei          2015-01-20  6588  =

4c664611791239 Qu Wenruo         2021-09-15  6589  		sort_parity_stripes(bi=
oc, num_stripes);
593060d756e0c2 Chris Mason       2008-03-25  6590  	}
de11cc12df1733 Li Zefan          2011-12-01  6591  =

2b19a1fef7be74 Liu Bo            2017-03-14  6592  	if (need_full_stripe(op=
))
d20983b40e828f Miao Xie          2014-07-03  6593  		max_errors =3D btrfs_c=
hunk_max_errors(map);
de11cc12df1733 Li Zefan          2011-12-01  6594  =

73c0f228250ff7 Liu Bo            2017-03-14  6595  	if (dev_replace_is_ongo=
ing && dev_replace->tgtdev !=3D NULL &&
2b19a1fef7be74 Liu Bo            2017-03-14  6596  	    need_full_stripe(op=
)) {
4c664611791239 Qu Wenruo         2021-09-15  6597  		handle_ops_on_dev_repl=
ace(op, &bioc, dev_replace, logical,
6143c23ccced76 Naohiro Aota      2021-02-04  6598  					  &num_stripes, &ma=
x_errors);
ad6d620e2a5704 Stefan Behrens    2012-11-06  6599  	}
472262f35a6b34 Stefan Behrens    2012-11-06  6600  =

4c664611791239 Qu Wenruo         2021-09-15  6601  	*bioc_ret =3D bioc;
4c664611791239 Qu Wenruo         2021-09-15  6602  	bioc->map_type =3D map-=
>type;
4c664611791239 Qu Wenruo         2021-09-15  6603  	bioc->num_stripes =3D n=
um_stripes;
4c664611791239 Qu Wenruo         2021-09-15  6604  	bioc->max_errors =3D ma=
x_errors;
4c664611791239 Qu Wenruo         2021-09-15  6605  	bioc->mirror_num =3D mi=
rror_num;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6606  =

ad6d620e2a5704 Stefan Behrens    2012-11-06  6607  	/*
ad6d620e2a5704 Stefan Behrens    2012-11-06  6608  	 * this is the case tha=
t REQ_READ && dev_replace_is_ongoing &&
ad6d620e2a5704 Stefan Behrens    2012-11-06  6609  	 * mirror_num =3D=3D nu=
m_stripes + 1 && dev_replace target drive is
ad6d620e2a5704 Stefan Behrens    2012-11-06  6610  	 * available as a mirror
ad6d620e2a5704 Stefan Behrens    2012-11-06  6611  	 */
ad6d620e2a5704 Stefan Behrens    2012-11-06  6612  	if (patch_the_first_str=
ipe_for_dev_replace && num_stripes > 0) {
ad6d620e2a5704 Stefan Behrens    2012-11-06  6613  		WARN_ON(num_stripes > =
1);
4c664611791239 Qu Wenruo         2021-09-15  6614  		bioc->stripes[0].dev =
=3D dev_replace->tgtdev;
4c664611791239 Qu Wenruo         2021-09-15  6615  		bioc->stripes[0].physi=
cal =3D physical_to_patch_in_first_stripe;
4c664611791239 Qu Wenruo         2021-09-15  6616  		bioc->mirror_num =3D m=
ap->num_stripes + 1;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6617  	}
cea9e4452ebaf1 Chris Mason       2008-04-09  6618  out:
73beece9ca07c0 Liu Bo            2015-07-17  6619  	if (dev_replace_is_ongo=
ing) {
53176dde0acd8f David Sterba      2018-04-05  6620  		lockdep_assert_held(&d=
ev_replace->rwsem);
53176dde0acd8f David Sterba      2018-04-05  6621  		/* Unlock and let wait=
ing writers proceed */
cb5583dd52fab4 David Sterba      2018-09-07  6622  		up_read(&dev_replace->=
rwsem);
73beece9ca07c0 Liu Bo            2015-07-17  6623  	}
0b86a832a1f38a Chris Mason       2008-03-24  6624  	free_extent_map(em);
de11cc12df1733 Li Zefan          2011-12-01  6625  	return ret;
0b86a832a1f38a Chris Mason       2008-03-24  6626  }
0b86a832a1f38a Chris Mason       2008-03-24  6627  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0471873903977402463==--

