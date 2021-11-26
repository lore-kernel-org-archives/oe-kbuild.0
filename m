Content-Type: multipart/mixed; boundary="===============0833593112368798691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 07/21] btrfs: zoned: move btrfs_finish_block_group_to_copy to zoned code
Date: Fri, 26 Nov 2021 10:38:52 +0800
Message-ID: <202111261027.3kJDKpBC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0833593112368798691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1482f3cd38ca134c23c8969a27191a828fc2f64d.1637745470.git.johan=
nes.thumshirn@wdc.com>
References: <1482f3cd38ca134c23c8969a27191a828fc2f64d.1637745470.git.johann=
es.thumshirn@wdc.com>
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
TO: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: linux-btrfs(a)vger.kernel.org
CC: Nikolay Borisov <nborisov@suse.com>
CC: Naohiro Aota <Naohiro.Aota@wdc.com>

Hi Johannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20211125]
[cannot apply to v5.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Johannes-Thumshirn/btrfs-f=
irst-batch-of-zoned-cleanups/20211124-173329
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20211124 (https://download.01.org/0day-ci/arch=
ive/20211126/202111261027.3kJDKpBC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/zoned.c:2187 btrfs_finish_block_group_to_copy() error: 'em' derefe=
rencing possible ERR_PTR()

Old smatch warnings:
fs/btrfs/zoned.c:169 sb_zone_number() error: uninitialized symbol 'zone'.
fs/btrfs/zoned.c:1456 btrfs_load_block_group_zone_info() error: uninitializ=
ed symbol 'ret'.

vim +/em +2187 fs/btrfs/zoned.c

1a4c69dc517089 Johannes Thumshirn 2021-11-24  2162  =

1a4c69dc517089 Johannes Thumshirn 2021-11-24  2163  bool btrfs_finish_block=
_group_to_copy(struct btrfs_device *srcdev,
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2164  				      struct btrfs_=
block_group *cache,
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2165  				      u64 physical)
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2166  {
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2167  	struct btrfs_fs_info *=
fs_info =3D cache->fs_info;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2168  	struct extent_map *em;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2169  	struct map_lookup *map;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2170  	u64 chunk_offset =3D c=
ache->start;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2171  	int num_extents, cur_e=
xtent;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2172  	int i;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2173  =

1a4c69dc517089 Johannes Thumshirn 2021-11-24  2174  	/* Do not use "to_copy=
" on non zoned filesystem for now */
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2175  	if (!btrfs_is_zoned(fs=
_info))
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2176  		return true;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2177  =

1a4c69dc517089 Johannes Thumshirn 2021-11-24  2178  	spin_lock(&cache->lock=
);
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2179  	if (cache->removed) {
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2180  		spin_unlock(&cache->l=
ock);
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2181  		return true;
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2182  	}
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2183  	spin_unlock(&cache->lo=
ck);
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2184  =

1a4c69dc517089 Johannes Thumshirn 2021-11-24  2185  	em =3D btrfs_get_chunk=
_map(fs_info, chunk_offset, 1);
1a4c69dc517089 Johannes Thumshirn 2021-11-24  2186  	ASSERT(!IS_ERR(em));
1a4c69dc517089 Johannes Thumshirn 2021-11-24 @2187  	map =3D em->map_lookup;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0833593112368798691==--

