Content-Type: multipart/mixed; boundary="===============6604799185447888629=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave:for-next 54/72] fs/btrfs/volumes.c:7404 btrfs_read_sys_array() warn: passing zero to 'PTR_ERR'
Date: Sat, 29 Jan 2022 20:06:55 +0800
Message-ID: <202201291928.NthcMZR8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6604799185447888629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
head:   d98f768106353f72c66948a22e4cd0aa29d7ed5c
commit: e9795fb3fbcde13580e04a3f5a520a99f98f4a93 [54/72] btrfs: use dummy e=
xtent buffer for super block sys chunk array read
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220129/202201291928.NthcMZR8-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/volumes.c:7404 btrfs_read_sys_array() warn: passing zero to 'PTR_E=
RR'

Old smatch warnings:
fs/btrfs/volumes.h:212 btrfs_device_set_total_bytes() warn: statement has n=
o effect 31
fs/btrfs/volumes.h:213 btrfs_device_set_disk_total_bytes() warn: statement =
has no effect 31
fs/btrfs/volumes.h:214 btrfs_device_set_bytes_used() warn: statement has no=
 effect 31
fs/btrfs/volumes.c:6431 __btrfs_map_block() error: 'em' dereferencing possi=
ble ERR_PTR()

vim +/PTR_ERR +7404 fs/btrfs/volumes.c

0b86a832a1f38a Chris Mason        2008-03-24  7378  =

6bccf3ab1e1f09 Jeff Mahoney       2016-06-21  7379  int btrfs_read_sys_arra=
y(struct btrfs_fs_info *fs_info)
0b86a832a1f38a Chris Mason        2008-03-24  7380  {
ab8d0fc48dba09 Jeff Mahoney       2016-09-20  7381  	struct btrfs_super_blo=
ck *super_copy =3D fs_info->super_copy;
a061fc8da7b990 Chris Mason        2008-05-07  7382  	struct extent_buffer *=
sb;
0b86a832a1f38a Chris Mason        2008-03-24  7383  	struct btrfs_disk_key =
*disk_key;
0b86a832a1f38a Chris Mason        2008-03-24  7384  	struct btrfs_chunk *ch=
unk;
1ffb22cf8c322b David Sterba       2014-10-31  7385  	u8 *array_ptr;
1ffb22cf8c322b David Sterba       2014-10-31  7386  	unsigned long sb_array=
_offset;
84eed90fac1b92 Chris Mason        2008-04-25  7387  	int ret =3D 0;
0b86a832a1f38a Chris Mason        2008-03-24  7388  	u32 num_stripes;
0b86a832a1f38a Chris Mason        2008-03-24  7389  	u32 array_size;
0b86a832a1f38a Chris Mason        2008-03-24  7390  	u32 len =3D 0;
1ffb22cf8c322b David Sterba       2014-10-31  7391  	u32 cur_offset;
e06cd3dd7cea50 Liu Bo             2016-06-03  7392  	u64 type;
84eed90fac1b92 Chris Mason        2008-04-25  7393  	struct btrfs_key key;
0b86a832a1f38a Chris Mason        2008-03-24  7394  =

0b246afa62b0cf Jeff Mahoney       2016-06-22  7395  	ASSERT(BTRFS_SUPER_INF=
O_SIZE <=3D fs_info->nodesize);
e9795fb3fbcde1 Qu Wenruo          2022-01-13  7396  =

a83fffb75d09cd David Sterba       2014-06-15  7397  	/*
e9795fb3fbcde1 Qu Wenruo          2022-01-13  7398  	 * We allocated a dumm=
y extent, just to use extent buffer accessors.
e9795fb3fbcde1 Qu Wenruo          2022-01-13  7399  	 * There will be unuse=
d space after BTRFS_SUPER_INFO_SIZE, but
e9795fb3fbcde1 Qu Wenruo          2022-01-13  7400  	 * that's fine, we wil=
l not go beyond system chunk array anyway.
a83fffb75d09cd David Sterba       2014-06-15  7401  	 */
e9795fb3fbcde1 Qu Wenruo          2022-01-13  7402  	sb =3D alloc_dummy_ext=
ent_buffer(fs_info, BTRFS_SUPER_INFO_OFFSET);
e9795fb3fbcde1 Qu Wenruo          2022-01-13  7403  	if (!sb)
c871b0f2fd27e7 Liu Bo             2016-06-06 @7404  		return PTR_ERR(sb);
4db8c528cdccb4 David Sterba       2015-12-03  7405  	set_extent_buffer_upto=
date(sb);
4008c04a07c73e Chris Mason        2009-02-12  7406  =

a061fc8da7b990 Chris Mason        2008-05-07  7407  	write_extent_buffer(sb=
, super_copy, 0, BTRFS_SUPER_INFO_SIZE);
0b86a832a1f38a Chris Mason        2008-03-24  7408  	array_size =3D btrfs_s=
uper_sys_array_size(super_copy);
0b86a832a1f38a Chris Mason        2008-03-24  7409  =

1ffb22cf8c322b David Sterba       2014-10-31  7410  	array_ptr =3D super_co=
py->sys_chunk_array;
1ffb22cf8c322b David Sterba       2014-10-31  7411  	sb_array_offset =3D of=
fsetof(struct btrfs_super_block, sys_chunk_array);
1ffb22cf8c322b David Sterba       2014-10-31  7412  	cur_offset =3D 0;
0b86a832a1f38a Chris Mason        2008-03-24  7413  =

1ffb22cf8c322b David Sterba       2014-10-31  7414  	while (cur_offset < ar=
ray_size) {
1ffb22cf8c322b David Sterba       2014-10-31  7415  		disk_key =3D (struct =
btrfs_disk_key *)array_ptr;
e3540eab29e1b2 David Sterba       2014-11-05  7416  		len =3D sizeof(*disk_=
key);
e3540eab29e1b2 David Sterba       2014-11-05  7417  		if (cur_offset + len =
> array_size)
e3540eab29e1b2 David Sterba       2014-11-05  7418  			goto out_short_read;
e3540eab29e1b2 David Sterba       2014-11-05  7419  =

0b86a832a1f38a Chris Mason        2008-03-24  7420  		btrfs_disk_key_to_cpu=
(&key, disk_key);
0b86a832a1f38a Chris Mason        2008-03-24  7421  =

1ffb22cf8c322b David Sterba       2014-10-31  7422  		array_ptr +=3D len;
1ffb22cf8c322b David Sterba       2014-10-31  7423  		sb_array_offset +=3D =
len;
1ffb22cf8c322b David Sterba       2014-10-31  7424  		cur_offset +=3D len;
0b86a832a1f38a Chris Mason        2008-03-24  7425  =

32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7426  		if (key.type !=3D BTR=
FS_CHUNK_ITEM_KEY) {
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7427  			btrfs_err(fs_info,
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7428  			    "unexpected item=
 type %u in sys_array at offset %u",
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7429  				  (u32)key.type, cu=
r_offset);
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7430  			ret =3D -EIO;
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7431  			break;
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7432  		}
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7433  =

1ffb22cf8c322b David Sterba       2014-10-31  7434  		chunk =3D (struct btr=
fs_chunk *)sb_array_offset;
e3540eab29e1b2 David Sterba       2014-11-05  7435  		/*
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7436  		 * At least one btrfs=
_chunk with one stripe must be present,
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7437  		 * exact stripe count=
 check comes afterwards
e3540eab29e1b2 David Sterba       2014-11-05  7438  		 */
e3540eab29e1b2 David Sterba       2014-11-05  7439  		len =3D btrfs_chunk_i=
tem_size(1);
e3540eab29e1b2 David Sterba       2014-11-05  7440  		if (cur_offset + len =
> array_size)
e3540eab29e1b2 David Sterba       2014-11-05  7441  			goto out_short_read;
e3540eab29e1b2 David Sterba       2014-11-05  7442  =

e3540eab29e1b2 David Sterba       2014-11-05  7443  		num_stripes =3D btrfs=
_chunk_num_stripes(sb, chunk);
f5cdedd73fa71b David Sterba       2015-11-30  7444  		if (!num_stripes) {
ab8d0fc48dba09 Jeff Mahoney       2016-09-20  7445  			btrfs_err(fs_info,
ab8d0fc48dba09 Jeff Mahoney       2016-09-20  7446  			"invalid number of s=
tripes %u in sys_array at offset %u",
f5cdedd73fa71b David Sterba       2015-11-30  7447  				  num_stripes, cur_=
offset);
f5cdedd73fa71b David Sterba       2015-11-30  7448  			ret =3D -EIO;
f5cdedd73fa71b David Sterba       2015-11-30  7449  			break;
f5cdedd73fa71b David Sterba       2015-11-30  7450  		}
f5cdedd73fa71b David Sterba       2015-11-30  7451  =

e06cd3dd7cea50 Liu Bo             2016-06-03  7452  		type =3D btrfs_chunk_=
type(sb, chunk);
e06cd3dd7cea50 Liu Bo             2016-06-03  7453  		if ((type & BTRFS_BLO=
CK_GROUP_SYSTEM) =3D=3D 0) {
ab8d0fc48dba09 Jeff Mahoney       2016-09-20  7454  			btrfs_err(fs_info,
e06cd3dd7cea50 Liu Bo             2016-06-03  7455  			"invalid chunk type =
%llu in sys_array at offset %u",
e06cd3dd7cea50 Liu Bo             2016-06-03  7456  				  type, cur_offset);
e06cd3dd7cea50 Liu Bo             2016-06-03  7457  			ret =3D -EIO;
e06cd3dd7cea50 Liu Bo             2016-06-03  7458  			break;
e06cd3dd7cea50 Liu Bo             2016-06-03  7459  		}
e06cd3dd7cea50 Liu Bo             2016-06-03  7460  =

e3540eab29e1b2 David Sterba       2014-11-05  7461  		len =3D btrfs_chunk_i=
tem_size(num_stripes);
e3540eab29e1b2 David Sterba       2014-11-05  7462  		if (cur_offset + len =
> array_size)
e3540eab29e1b2 David Sterba       2014-11-05  7463  			goto out_short_read;
e3540eab29e1b2 David Sterba       2014-11-05  7464  =

9690ac09877482 David Sterba       2019-03-20  7465  		ret =3D read_one_chun=
k(&key, sb, chunk);
84eed90fac1b92 Chris Mason        2008-04-25  7466  		if (ret)
84eed90fac1b92 Chris Mason        2008-04-25  7467  			break;
32ab3d1b4d0c55 Johannes Thumshirn 2019-10-18  7468  =

1ffb22cf8c322b David Sterba       2014-10-31  7469  		array_ptr +=3D len;
1ffb22cf8c322b David Sterba       2014-10-31  7470  		sb_array_offset +=3D =
len;
1ffb22cf8c322b David Sterba       2014-10-31  7471  		cur_offset +=3D len;
0b86a832a1f38a Chris Mason        2008-03-24  7472  	}
d865177a5e7498 Liu Bo             2016-06-03  7473  	clear_extent_buffer_up=
todate(sb);
1c8b5b6e8b570a Liu Bo             2016-05-13  7474  	free_extent_buffer_sta=
le(sb);
84eed90fac1b92 Chris Mason        2008-04-25  7475  	return ret;
e3540eab29e1b2 David Sterba       2014-11-05  7476  =

e3540eab29e1b2 David Sterba       2014-11-05  7477  out_short_read:
ab8d0fc48dba09 Jeff Mahoney       2016-09-20  7478  	btrfs_err(fs_info, "sy=
s_array too short to read %u bytes at offset %u",
e3540eab29e1b2 David Sterba       2014-11-05  7479  			len, cur_offset);
d865177a5e7498 Liu Bo             2016-06-03  7480  	clear_extent_buffer_up=
todate(sb);
1c8b5b6e8b570a Liu Bo             2016-05-13  7481  	free_extent_buffer_sta=
le(sb);
e3540eab29e1b2 David Sterba       2014-11-05  7482  	return -EIO;
0b86a832a1f38a Chris Mason        2008-03-24  7483  }
0b86a832a1f38a Chris Mason        2008-03-24  7484  =


:::::: The code at line 7404 was first introduced by commit
:::::: c871b0f2fd27e7f9097d507f47de5270f88003b9 Btrfs: check if extent buff=
er is aligned to sectorsize

:::::: TO: Liu Bo <bo.li.liu@oracle.com>
:::::: CC: David Sterba <dsterba@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6604799185447888629==--

