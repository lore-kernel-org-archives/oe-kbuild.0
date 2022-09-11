Content-Type: multipart/mixed; boundary="===============7419030049798714722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] drivers/md/md-bitmap: check the return value of md_bitmap_get_counter()
Date: Sun, 11 Sep 2022 11:02:47 +0800
Message-ID: <202209111048.YGgWVmUV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7419030049798714722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220909040936.2610780-1-floridsleeves@gmail.com>
References: <20220909040936.2610780-1-floridsleeves@gmail.com>
TO: Li Zhong <floridsleeves@gmail.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-raid(a)vger.kernel.org
CC: song(a)kernel.org
CC: Li Zhong <floridsleeves@gmail.com>

Hi Li,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on song-md/md-next]
[also build test WARNING on linus/master v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhong/drivers-md-=
md-bitmap-check-the-return-value-of-md_bitmap_get_counter/20220909-121143
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-m031-20220909
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/md-bitmap.c:2211 md_bitmap_resize() error: we previously assumed=
 'bmc_new' could be null (see line 2198)

vim +/bmc_new +2211 drivers/md/md-bitmap.c

57148964d94661 drivers/md/bitmap.c    NeilBrown         2012-03-19  2053  =

e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2054  i=
nt md_bitmap_resize(struct bitmap *bitmap, sector_t blocks,
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2055  	=
	  int chunksize, int init)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2056  {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2057  	=
/* If chunk_size is 0, choose an appropriate chunk size.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2058  	=
 * Then possibly allocate new storage space.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2059  	=
 * Then quiesce, copy bits, replace bitmap, and re-start
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2060  	=
 *
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2061  	=
 * This function is called both to set up the initial bitmap
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2062  	=
 * and to resize the bitmap while the array is active.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2063  	=
 * If this happens as a result of the array being resized,
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2064  	=
 * chunksize will be zero, and we need to choose a suitable
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2065  	=
 * chunksize, otherwise we use what we are given.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2066  	=
 */
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2067  	=
struct bitmap_storage store;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2068  	=
struct bitmap_counts old_counts;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2069  	=
unsigned long chunks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2070  	=
sector_t block;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2071  	=
sector_t old_blocks, new_blocks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2072  	=
int chunkshift;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2073  	=
int ret =3D 0;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2074  	=
long pages;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2075  	=
struct bitmap_page *new_bp;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2076  =

e8a27f836f165c drivers/md/bitmap.c    NeilBrown         2017-08-31  2077  	=
if (bitmap->storage.file && !init) {
e8a27f836f165c drivers/md/bitmap.c    NeilBrown         2017-08-31  2078  	=
	pr_info("md: cannot resize file-based bitmap\n");
e8a27f836f165c drivers/md/bitmap.c    NeilBrown         2017-08-31  2079  	=
	return -EINVAL;
e8a27f836f165c drivers/md/bitmap.c    NeilBrown         2017-08-31  2080  	}
e8a27f836f165c drivers/md/bitmap.c    NeilBrown         2017-08-31  2081  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2082  	=
if (chunksize =3D=3D 0) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2083  	=
	/* If there is enough space, leave the chunk size unchanged,
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2084  	=
	 * else increase by factor of two until there is enough space.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2085  	=
	 */
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2086  	=
	long bytes;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2087  	=
	long space =3D bitmap->mddev->bitmap_info.space;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2088  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2089  	=
	if (space =3D=3D 0) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2090  	=
		/* We don't know how much space there is, so limit
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2091  	=
		 * to current size - in sectors.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2092  	=
		 */
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2093  	=
		bytes =3D DIV_ROUND_UP(bitmap->counts.chunks, 8);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2094  	=
		if (!bitmap->mddev->bitmap_info.external)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2095  	=
			bytes +=3D sizeof(bitmap_super_t);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2096  	=
		space =3D DIV_ROUND_UP(bytes, 512);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2097  	=
		bitmap->mddev->bitmap_info.space =3D space;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2098  	=
	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2099  	=
	chunkshift =3D bitmap->counts.chunkshift;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2100  	=
	chunkshift--;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2101  	=
	do {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2102  	=
		/* 'chunkshift' is shift from block size to chunk size */
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2103  	=
		chunkshift++;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2104  	=
		chunks =3D DIV_ROUND_UP_SECTOR_T(blocks, 1 << chunkshift);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2105  	=
		bytes =3D DIV_ROUND_UP(chunks, 8);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2106  	=
		if (!bitmap->mddev->bitmap_info.external)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2107  	=
			bytes +=3D sizeof(bitmap_super_t);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2108  	=
	} while (bytes > (space << 9));
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2109  	=
} else
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2110  	=
	chunkshift =3D ffz(~chunksize) - BITMAP_BLOCK_SHIFT;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2111  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2112  	=
chunks =3D DIV_ROUND_UP_SECTOR_T(blocks, 1 << chunkshift);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2113  	=
memset(&store, 0, sizeof(store));
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2114  	=
if (bitmap->mddev->bitmap_info.offset || bitmap->mddev->bitmap_info.file)
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2115  	=
	ret =3D md_bitmap_storage_alloc(&store, chunks,
b97e92574c0bf3 drivers/md/bitmap.c    Goldwyn Rodrigues 2014-06-06  2116  	=
				      !bitmap->mddev->bitmap_info.external,
da6fb7a9e5bd6f drivers/md/bitmap.c    NeilBrown         2015-10-01  2117  	=
				      mddev_is_clustered(bitmap->mddev)
da6fb7a9e5bd6f drivers/md/bitmap.c    NeilBrown         2015-10-01  2118  	=
				      ? bitmap->cluster_slot : 0);
cbb38732361029 drivers/md/bitmap.c    Guoqing Jiang     2016-10-31  2119  	=
if (ret) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2120  	=
	md_bitmap_file_unmap(&store);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2121  	=
	goto err;
cbb38732361029 drivers/md/bitmap.c    Guoqing Jiang     2016-10-31  2122  	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2123  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2124  	=
pages =3D DIV_ROUND_UP(chunks, PAGE_COUNTER_RATIO);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2125  =

6396bb221514d2 drivers/md/md-bitmap.c Kees Cook         2018-06-12  2126  	=
new_bp =3D kcalloc(pages, sizeof(*new_bp), GFP_KERNEL);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2127  	=
ret =3D -ENOMEM;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2128  	=
if (!new_bp) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2129  	=
	md_bitmap_file_unmap(&store);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2130  	=
	goto err;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2131  	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2132  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2133  	=
if (!init)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2134  	=
	bitmap->mddev->pers->quiesce(bitmap->mddev, 1);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2135  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2136  	=
store.file =3D bitmap->storage.file;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2137  	=
bitmap->storage.file =3D NULL;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2138  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2139  	=
if (store.sb_page && bitmap->storage.sb_page)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2140  	=
	memcpy(page_address(store.sb_page),
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2141  	=
	       page_address(bitmap->storage.sb_page),
938b533d479e74 drivers/md/bitmap.c    Shaohua Li        2017-10-16  2142  	=
	       sizeof(bitmap_super_t));
fadcbd2901a0f7 drivers/md/md-bitmap.c Guoqing Jiang     2019-09-26  2143  	=
spin_lock_irq(&bitmap->counts.lock);
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2144  	=
md_bitmap_file_unmap(&bitmap->storage);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2145  	=
bitmap->storage =3D store;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2146  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2147  	=
old_counts =3D bitmap->counts;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2148  	=
bitmap->counts.bp =3D new_bp;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2149  	=
bitmap->counts.pages =3D pages;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2150  	=
bitmap->counts.missing_pages =3D pages;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2151  	=
bitmap->counts.chunkshift =3D chunkshift;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2152  	=
bitmap->counts.chunks =3D chunks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2153  	=
bitmap->mddev->bitmap_info.chunksize =3D 1 << (chunkshift +
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2154  	=
					     BITMAP_BLOCK_SHIFT);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2155  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2156  	=
blocks =3D min(old_counts.chunks << old_counts.chunkshift,
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2157  	=
	     chunks << chunkshift);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2158  =

c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2159  	=
/* For cluster raid, need to pre-allocate bitmap */
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2160  	=
if (mddev_is_clustered(bitmap->mddev)) {
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2161  	=
	unsigned long page;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2162  	=
	for (page =3D 0; page < pages; page++) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2163  	=
		ret =3D md_bitmap_checkpage(&bitmap->counts, page, 1, 1);
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2164  	=
		if (ret) {
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2165  	=
			unsigned long k;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2166  =

c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2167  	=
			/* deallocate the page memory */
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2168  	=
			for (k =3D 0; k < page; k++) {
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2169  	=
				kfree(new_bp[k].map);
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2170  	=
			}
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2171  	=
			kfree(new_bp);
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2172  =

c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2173  	=
			/* restore some fields from old_counts */
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2174  	=
			bitmap->counts.bp =3D old_counts.bp;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2175  	=
			bitmap->counts.pages =3D old_counts.pages;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2176  	=
			bitmap->counts.missing_pages =3D old_counts.pages;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2177  	=
			bitmap->counts.chunkshift =3D old_counts.chunkshift;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2178  	=
			bitmap->counts.chunks =3D old_counts.chunks;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2179  	=
			bitmap->mddev->bitmap_info.chunksize =3D 1 << (old_counts.chunkshift +
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2180  	=
								     BITMAP_BLOCK_SHIFT);
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2181  	=
			blocks =3D old_counts.chunks << old_counts.chunkshift;
ec0cc226854a79 drivers/md/bitmap.c    NeilBrown         2016-11-02  2182  	=
			pr_warn("Could not pre-allocate in-memory bitmap for cluster raid\n");
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2183  	=
			break;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2184  	=
		} else
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2185  	=
			bitmap->counts.bp[page].count +=3D 1;
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2186  	=
	}
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2187  	}
c9d65032282943 drivers/md/bitmap.c    Guoqing Jiang     2016-05-02  2188  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2189  	=
for (block =3D 0; block < blocks; ) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2190  	=
	bitmap_counter_t *bmc_old, *bmc_new;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2191  	=
	int set;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2192  =

e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2193  	=
	bmc_old =3D md_bitmap_get_counter(&old_counts, block, &old_blocks, 0);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2194  	=
	set =3D bmc_old && NEEDED(*bmc_old);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2195  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2196  	=
	if (set) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2197  	=
		bmc_new =3D md_bitmap_get_counter(&bitmap->counts, block, &new_blocks, 1);
a0b3a521efba6a drivers/md/md-bitmap.c Li Zhong          2022-09-08 @2198  	=
		if (bmc_new && *bmc_new =3D=3D 0) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2199  	=
			/* need to set on-disk bits too. */
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2200  	=
			sector_t end =3D block + new_blocks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2201  	=
			sector_t start =3D block >> chunkshift;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2202  	=
			start <<=3D chunkshift;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2203  	=
			while (start < end) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2204  	=
				md_bitmap_file_set_bit(bitmap, block);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2205  	=
				start +=3D 1 << chunkshift;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2206  	=
			}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2207  	=
			*bmc_new =3D 2;
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2208  	=
			md_bitmap_count_page(&bitmap->counts, block, 1);
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2209  	=
			md_bitmap_set_pending(&bitmap->counts, block);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2210  	=
		}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22 @2211  	=
		*bmc_new |=3D NEEDED_MASK;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2212  	=
		if (new_blocks < old_blocks)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2213  	=
			old_blocks =3D new_blocks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2214  	=
	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2215  	=
	block +=3D old_blocks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2216  	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2217  =

0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2218  	=
if (bitmap->counts.bp !=3D old_counts.bp) {
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2219  	=
	unsigned long k;
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2220  	=
	for (k =3D 0; k < old_counts.pages; k++)
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2221  	=
		if (!old_counts.bp[k].hijacked)
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2222  	=
			kfree(old_counts.bp[k].map);
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2223  	=
	kfree(old_counts.bp);
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2224  	}
0868b99c214a3d drivers/md/md-bitmap.c Zdenek Kabelac    2017-11-08  2225  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2226  	=
if (!init) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2227  	=
	int i;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2228  	=
	while (block < (chunks << chunkshift)) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2229  	=
		bitmap_counter_t *bmc;
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2230  	=
		bmc =3D md_bitmap_get_counter(&bitmap->counts, block, &new_blocks, 1);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2231  	=
		if (bmc) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2232  	=
			/* new space.  It needs to be resynced, so
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2233  	=
			 * we set NEEDED_MASK.
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2234  	=
			 */
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2235  	=
			if (*bmc =3D=3D 0) {
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2236  	=
				*bmc =3D NEEDED_MASK | 2;
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2237  	=
				md_bitmap_count_page(&bitmap->counts, block, 1);
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2238  	=
				md_bitmap_set_pending(&bitmap->counts, block);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2239  	=
			}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2240  	=
		}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2241  	=
		block +=3D new_blocks;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2242  	=
	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2243  	=
	for (i =3D 0; i < bitmap->storage.file_pages; i++)
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2244  	=
		set_page_attr(bitmap, i, BITMAP_PAGE_DIRTY);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2245  	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2246  	=
spin_unlock_irq(&bitmap->counts.lock);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2247  =

d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2248  	=
if (!init) {
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2249  	=
	md_bitmap_unplug(bitmap);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2250  	=
	bitmap->mddev->pers->quiesce(bitmap->mddev, 0);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2251  	}
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2252  	=
ret =3D 0;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2253  e=
rr:
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2254  	=
return ret;
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2255  }
e64e4018d57271 drivers/md/md-bitmap.c Andy Shevchenko   2018-08-01  2256  E=
XPORT_SYMBOL_GPL(md_bitmap_resize);
d60b479d177a57 drivers/md/bitmap.c    NeilBrown         2012-05-22  2257  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============7419030049798714722==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L202
OGsgNi4wLjAtcmMyIEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJT05fVEVY
VD0ibTY4ay1saW51eC1nY2MgKEdDQykgMTIuMS4wIgpDT05GSUdfQ0NfSVNfR0NDPXkKQ09ORklH
X0dDQ19WRVJTSU9OPTEyMDEwMApDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19BU19JU19H
TlU9eQpDT05GSUdfQVNfVkVSU0lPTj0yMzgwMApDT05GSUdfTERfSVNfQkZEPXkKQ09ORklHX0xE
X1ZFUlNJT049MjM4MDAKQ09ORklHX0xMRF9WRVJTSU9OPTAKQ09ORklHX0NDX0hBU19BU01fSU5M
SU5FPXkKQ09ORklHX0NDX0hBU19OT19QUk9GSUxFX0ZOX0FUVFI9eQpDT05GSUdfUEFIT0xFX1ZF
UlNJT049MTIzCkNPTkZJR19DT05TVFJVQ1RPUlM9eQpDT05GSUdfSVJRX1dPUks9eQoKIwojIEdl
bmVyYWwgc2V0dXAKIwpDT05GSUdfQlJPS0VOX09OX1NNUD15CkNPTkZJR19JTklUX0VOVl9BUkdf
TElNSVQ9MzIKQ09ORklHX0NPTVBJTEVfVEVTVD15CiMgQ09ORklHX1dFUlJPUiBpcyBub3Qgc2V0
CkNPTkZJR19MT0NBTFZFUlNJT049IiIKQ09ORklHX0JVSUxEX1NBTFQ9IiIKQ09ORklHX0RFRkFV
TFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUpIgojIENPTkZJR19TWVNW
SVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfV0FUQ0hfUVVFVUUgaXMgbm90IHNldApDT05GSUdfVVNF
TElCPXkKCiMKIyBJUlEgc3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1NIT1c9eQpDT05G
SUdfR0VORVJJQ19JUlFfQ0hJUD15CkNPTkZJR19JUlFfRE9NQUlOPXkKQ09ORklHX0lSUV9TSU09
eQpDT05GSUdfSVJRX0RPTUFJTl9ISUVSQVJDSFk9eQojIENPTkZJR19HRU5FUklDX0lSUV9ERUJV
R0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVJRIHN1YnN5c3RlbQoKQ09ORklHX0xFR0FDWV9USU1F
Ul9USUNLPXkKQ09ORklHX1RJTUVfS1VOSVRfVEVTVD1tCkNPTkZJR19CUEY9eQoKIwojIEJQRiBz
dWJzeXN0ZW0KIwpDT05GSUdfQlBGX1NZU0NBTEw9eQojIENPTkZJR19CUEZfVU5QUklWX0RFRkFV
TFRfT0ZGIGlzIG5vdCBzZXQKIyBlbmQgb2YgQlBGIHN1YnN5c3RlbQoKQ09ORklHX1BSRUVNUFRf
Tk9ORV9CVUlMRD15CkNPTkZJR19QUkVFTVBUX05PTkU9eQoKIwojIENQVS9UYXNrIHRpbWUgYW5k
IHN0YXRzIGFjY291bnRpbmcKIwpDT05GSUdfVElDS19DUFVfQUNDT1VOVElORz15CkNPTkZJR19C
U0RfUFJPQ0VTU19BQ0NUPXkKIyBDT05GSUdfQlNEX1BST0NFU1NfQUNDVF9WMyBpcyBub3Qgc2V0
CkNPTkZJR19QU0k9eQojIENPTkZJR19QU0lfREVGQVVMVF9ESVNBQkxFRCBpcyBub3Qgc2V0CiMg
ZW5kIG9mIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcKCkNPTkZJR19DUFVfSVNP
TEFUSU9OPXkKCiMKIyBSQ1UgU3Vic3lzdGVtCiMKQ09ORklHX1RJTllfUkNVPXkKIyBDT05GSUdf
UkNVX0VYUEVSVCBpcyBub3Qgc2V0CkNPTkZJR19TUkNVPXkKQ09ORklHX1RJTllfU1JDVT15CkNP
TkZJR19UQVNLU19SQ1VfR0VORVJJQz15CkNPTkZJR19UQVNLU19UUkFDRV9SQ1U9eQpDT05GSUdf
UkNVX05FRURfU0VHQ0JMSVNUPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3RlbQoKQ09ORklHX0lLQ09O
RklHPW0KQ09ORklHX0lLQ09ORklHX1BST0M9eQpDT05GSUdfSUtIRUFERVJTPW0KCiMKIyBTY2hl
ZHVsZXIgZmVhdHVyZXMKIwojIGVuZCBvZiBTY2hlZHVsZXIgZmVhdHVyZXMKCkNPTkZJR19DQ19J
TVBMSUNJVF9GQUxMVEhST1VHSD0iLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD01IgpDT05GSUdfR0ND
MTJfTk9fQVJSQVlfQk9VTkRTPXkKQ09ORklHX0NDX05PX0FSUkFZX0JPVU5EUz15CkNPTkZJR19D
R1JPVVBTPXkKQ09ORklHX1BBR0VfQ09VTlRFUj15CiMgQ09ORklHX0NHUk9VUF9GQVZPUl9EWU5N
T0RTIGlzIG5vdCBzZXQKQ09ORklHX01FTUNHPXkKQ09ORklHX01FTUNHX0tNRU09eQojIENPTkZJ
R19CTEtfQ0dST1VQIGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19GQUlS
X0dST1VQX1NDSEVEPXkKQ09ORklHX0NGU19CQU5EV0lEVEg9eQpDT05GSUdfUlRfR1JPVVBfU0NI
RUQ9eQpDT05GSUdfQ0dST1VQX1BJRFM9eQojIENPTkZJR19DR1JPVVBfUkRNQSBpcyBub3Qgc2V0
CkNPTkZJR19DR1JPVVBfRlJFRVpFUj15CkNPTkZJR19DR1JPVVBfREVWSUNFPXkKQ09ORklHX0NH
Uk9VUF9DUFVBQ0NUPXkKQ09ORklHX0NHUk9VUF9CUEY9eQpDT05GSUdfQ0dST1VQX01JU0M9eQoj
IENPTkZJR19DR1JPVVBfREVCVUcgaXMgbm90IHNldApDT05GSUdfU09DS19DR1JPVVBfREFUQT15
CkNPTkZJR19OQU1FU1BBQ0VTPXkKIyBDT05GSUdfVVRTX05TIGlzIG5vdCBzZXQKQ09ORklHX1VT
RVJfTlM9eQojIENPTkZJR19QSURfTlMgaXMgbm90IHNldAojIENPTkZJR19DSEVDS1BPSU5UX1JF
U1RPUkUgaXMgbm90IHNldApDT05GSUdfU0NIRURfQVVUT0dST1VQPXkKIyBDT05GSUdfU1lTRlNf
REVQUkVDQVRFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkxLX0RFVl9JTklUUkQgaXMgbm90IHNldAojIENPTkZJR19CT09UX0NPTkZJRyBpcyBub3Qgc2V0
CkNPTkZJR19JTklUUkFNRlNfUFJFU0VSVkVfTVRJTUU9eQojIENPTkZJR19DQ19PUFRJTUlaRV9G
T1JfUEVSRk9STUFOQ0UgaXMgbm90IHNldApDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkU9eQpD
T05GSUdfU1lTQ1RMPXkKQ09ORklHX0hBVkVfVUlEMTY9eQpDT05GSUdfRVhQRVJUPXkKIyBDT05G
SUdfVUlEMTYgaXMgbm90IHNldApDT05GSUdfTVVMVElVU0VSPXkKQ09ORklHX1NHRVRNQVNLX1NZ
U0NBTEw9eQojIENPTkZJR19TWVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZIQU5ETEU9
eQpDT05GSUdfUE9TSVhfVElNRVJTPXkKIyBDT05GSUdfUFJJTlRLIGlzIG5vdCBzZXQKIyBDT05G
SUdfQlVHIGlzIG5vdCBzZXQKQ09ORklHX0VMRl9DT1JFPXkKIyBDT05GSUdfQkFTRV9GVUxMIGlz
IG5vdCBzZXQKQ09ORklHX0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKIyBDT05GSUdfRVBPTEwg
aXMgbm90IHNldApDT05GSUdfU0lHTkFMRkQ9eQojIENPTkZJR19USU1FUkZEIGlzIG5vdCBzZXQK
Q09ORklHX0VWRU5URkQ9eQpDT05GSUdfQUlPPXkKQ09ORklHX0lPX1VSSU5HPXkKIyBDT05GSUdf
QURWSVNFX1NZU0NBTExTIGlzIG5vdCBzZXQKQ09ORklHX01FTUJBUlJJRVI9eQojIENPTkZJR19L
QUxMU1lNUyBpcyBub3Qgc2V0CkNPTkZJR19LQ01QPXkKQ09ORklHX0VNQkVEREVEPXkKIyBDT05G
SUdfUEMxMDQgaXMgbm90IHNldAoKIwojIEtlcm5lbCBQZXJmb3JtYW5jZSBFdmVudHMgQW5kIENv
dW50ZXJzCiMKIyBlbmQgb2YgS2VybmVsIFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMK
CkNPTkZJR19QUk9GSUxJTkc9eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfTTY4Sz15
CkNPTkZJR19DUFVfQklHX0VORElBTj15CkNPTkZJR19HRU5FUklDX0hXRUlHSFQ9eQpDT05GSUdf
R0VORVJJQ19DQUxJQlJBVEVfREVMQVk9eQpDT05GSUdfR0VORVJJQ19DU1VNPXkKQ09ORklHX1RJ
TUVfTE9XX1JFUz15CkNPTkZJR19OT19JT1BPUlRfTUFQPXkKQ09ORklHX0haPTEwMApDT05GSUdf
UEdUQUJMRV9MRVZFTFM9MwojIENPTkZJR19NTVUgaXMgbm90IHNldAojIENPTkZJR19LRVhFQyBp
cyBub3Qgc2V0CgojCiMgUGxhdGZvcm0gc2V0dXAKIwoKIwojIFByb2Nlc3NvciBUeXBlCiMKQ09O
RklHX002OEtDTEFTU0lDPXkKIyBDT05GSUdfQ09MREZJUkUgaXMgbm90IHNldApDT05GSUdfTTY4
MDAwPXkKQ09ORklHX002OEVaMzI4PXkKQ09ORklHX002OFZaMzI4PXkKCiMKIyBQcm9jZXNzb3Ig
U3BlY2lmaWMgT3B0aW9ucwojCkNPTkZJR19GT1JDRV9NQVhfWk9ORU9SREVSPTExCkNPTkZJR19D
UFVfSEFTX05PX0JJVEZJRUxEUz15CkNPTkZJR19DUFVfSEFTX05PX0NBUz15CkNPTkZJR19DUFVf
SEFTX05PX01VTERJVjY0PXkKQ09ORklHX0NQVV9IQVNfTk9fVU5BTElHTkVEPXkKCiMKIyBNYWNo
aW5lIFR5cGVzCiMKIyBDT05GSUdfUElMT1QzIGlzIG5vdCBzZXQKQ09ORklHX1VDU0lNTT15CiMg
Q09ORklHX1VDRElNTSBpcyBub3Qgc2V0CkNPTkZJR19EUkFHRU4yPXkKQ09ORklHX0RJUkVDVF9J
T19BQ0NFU1M9eQpDT05GSUdfSU5JVF9MQ0Q9eQpDT05GSUdfTUVNT1JZX1JFU0VSVkU9MAoKIwoj
IE1hY2hpbmUgT3B0aW9ucwojCiMgQ09ORklHXzRLU1RBQ0tTIGlzIG5vdCBzZXQKCiMKIyBSQU0g
Y29uZmlndXJhdGlvbgojCkNPTkZJR19SQU1CQVNFPTAKQ09ORklHX1JBTVNJWkU9MHg0MDAwMDAK
Q09ORklHX1ZFQ1RPUkJBU0U9MApDT05GSUdfS0VSTkVMQkFTRT0weDQwMAoKIwojIFJPTSBjb25m
aWd1cmF0aW9uCiMKQ09ORklHX1JPTT15CkNPTkZJR19ST01CQVNFPTAKQ09ORklHX1JPTVZFQz0w
CkNPTkZJR19ST01TVEFSVD0weDQwMApDT05GSUdfUk9NU0laRT0weDEwMDAwMAojIENPTkZJR19S
QU1LRVJORUwgaXMgbm90IHNldApDT05GSUdfUk9NS0VSTkVMPXkKIyBlbmQgb2YgUGxhdGZvcm0g
c2V0dXAKCiMKIyBLZXJuZWwgRmVhdHVyZXMKIwojIGVuZCBvZiBLZXJuZWwgRmVhdHVyZXMKCiMK
IyBQb3dlciBtYW5hZ2VtZW50IG9wdGlvbnMKIwojIENPTkZJR19QTSBpcyBub3Qgc2V0CiMgZW5k
IG9mIFBvd2VyIG1hbmFnZW1lbnQgb3B0aW9ucwoKIwojIEdlbmVyYWwgYXJjaGl0ZWN0dXJlLWRl
cGVuZGVudCBvcHRpb25zCiMKQ09ORklHX0FSQ0hfMzJCSVRfT0ZGX1Q9eQpDT05GSUdfSEFWRV9B
U01fTU9EVkVSU0lPTlM9eQpDT05GSUdfQVJDSF9XQU5UX0lQQ19QQVJTRV9WRVJTSU9OPXkKQ09O
RklHX0xUT19OT05FPXkKQ09ORklHX0hBVkVfTU9EX0FSQ0hfU1BFQ0lGSUM9eQpDT05GSUdfTU9E
VUxFU19VU0VfRUxGX1JFTEE9eQpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTD15CkNPTkZJR19Q
QUdFX1NJWkVfTEVTU19USEFOXzY0S0I9eQpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl8yNTZL
Qj15CkNPTkZJR19IQVZFX0FSQ0hfSEFTSD15CkNPTkZJR19PTERfU0lHU1VTUEVORDM9eQpDT05G
SUdfT0xEX1NJR0FDVElPTj15CiMgQ09ORklHX0NPTVBBVF8zMkJJVF9USU1FIGlzIG5vdCBzZXQK
Q09ORklHX0FSQ0hfTk9fUFJFRU1QVD15CkNPTkZJR19DUFVfTk9fRUZGSUNJRU5UX0ZGUz15CiMg
Q09ORklHX0xPQ0tfRVZFTlRfQ09VTlRTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9QRk5f
VkFMSUQ9eQoKIwojIEdDT1YtYmFzZWQga2VybmVsIHByb2ZpbGluZwojCkNPTkZJR19HQ09WX0tF
Uk5FTD15CiMgZW5kIG9mIEdDT1YtYmFzZWQga2VybmVsIHByb2ZpbGluZwojIGVuZCBvZiBHZW5l
cmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwoKQ09ORklHX1JUX01VVEVYRVM9eQpD
T05GSUdfQkFTRV9TTUFMTD0xCkNPTkZJR19NT0RVTEVTPXkKQ09ORklHX01PRFVMRV9GT1JDRV9M
T0FEPXkKIyBDT05GSUdfTU9EVUxFX1VOTE9BRCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFZFUlNJ
T05TIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9TUkNWRVJTSU9OX0FMTD15CiMgQ09ORklHX01P
RFVMRV9TSUcgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfTk9ORSBpcyBub3Qg
c2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19HWklQIGlzIG5vdCBzZXQKQ09ORklHX01PRFVM
RV9DT01QUkVTU19YWj15CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19aU1REIGlzIG5vdCBzZXQK
IyBDT05GSUdfTU9EVUxFX0RFQ09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfQUxM
T1dfTUlTU0lOR19OQU1FU1BBQ0VfSU1QT1JUUyBpcyBub3Qgc2V0CkNPTkZJR19NT0RQUk9CRV9Q
QVRIPSIvc2Jpbi9tb2Rwcm9iZSIKQ09ORklHX0JMT0NLPXkKIyBDT05GSUdfQkxPQ0tfTEVHQUNZ
X0FVVE9MT0FEIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfQlNHX0NPTU1PTj15CkNPTkZJR19C
TEtfSUNRPXkKQ09ORklHX0JMS19ERVZfQlNHTElCPXkKQ09ORklHX0JMS19ERVZfSU5URUdSSVRZ
PXkKQ09ORklHX0JMS19ERVZfSU5URUdSSVRZX1QxMD1tCiMgQ09ORklHX0JMS19ERVZfWk9ORUQg
aXMgbm90IHNldApDT05GSUdfQkxLX1dCVD15CiMgQ09ORklHX0JMS19XQlRfTVEgaXMgbm90IHNl
dApDT05GSUdfQkxLX0RFQlVHX0ZTPXkKQ09ORklHX0JMS19TRURfT1BBTD15CiMgQ09ORklHX0JM
S19JTkxJTkVfRU5DUllQVElPTiBpcyBub3Qgc2V0CgojCiMgUGFydGl0aW9uIFR5cGVzCiMKIyBD
T05GSUdfUEFSVElUSU9OX0FEVkFOQ0VEIGlzIG5vdCBzZXQKQ09ORklHX01TRE9TX1BBUlRJVElP
Tj15CkNPTkZJR19FRklfUEFSVElUSU9OPXkKIyBlbmQgb2YgUGFydGl0aW9uIFR5cGVzCgpDT05G
SUdfQkxLX01RX1ZJUlRJTz15CkNPTkZJR19CTE9DS19IT0xERVJfREVQUkVDQVRFRD15CgojCiMg
SU8gU2NoZWR1bGVycwojCiMgQ09ORklHX01RX0lPU0NIRURfREVBRExJTkUgaXMgbm90IHNldAoj
IENPTkZJR19NUV9JT1NDSEVEX0tZQkVSIGlzIG5vdCBzZXQKQ09ORklHX0lPU0NIRURfQkZRPW0K
IyBlbmQgb2YgSU8gU2NoZWR1bGVycwoKQ09ORklHX0FTTjE9eQpDT05GSUdfVU5JTkxJTkVfU1BJ
Tl9VTkxPQ0s9eQpDT05GSUdfRlJFRVpFUj15CgojCiMgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMK
IwojIENPTkZJR19CSU5GTVRfRUxGX0ZEUElDIGlzIG5vdCBzZXQKQ09ORklHX0JJTkZNVF9TQ1JJ
UFQ9eQpDT05GSUdfQVJDSF9IQVNfQklORk1UX0ZMQVQ9eQpDT05GSUdfQklORk1UX0ZMQVQ9eQpD
T05GSUdfQklORk1UX0ZMQVRfQVJHVlBfRU5WUF9PTl9TVEFDSz15CkNPTkZJR19CSU5GTVRfRkxB
VF9PTEQ9eQojIENPTkZJR19CSU5GTVRfWkZMQVQgaXMgbm90IHNldApDT05GSUdfQklORk1UX01J
U0M9eQpDT05GSUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cwoK
IwojIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwoKIwojIFNMQUIgYWxsb2NhdG9yIG9wdGlv
bnMKIwojIENPTkZJR19TTEFCIGlzIG5vdCBzZXQKQ09ORklHX1NMVUI9eQojIENPTkZJR19TTE9C
IGlzIG5vdCBzZXQKQ09ORklHX1NMQUJfTUVSR0VfREVGQVVMVD15CkNPTkZJR19TTEFCX0ZSRUVM
SVNUX1JBTkRPTT15CkNPTkZJR19TTEFCX0ZSRUVMSVNUX0hBUkRFTkVEPXkKQ09ORklHX1NMVUJf
U1RBVFM9eQojIGVuZCBvZiBTTEFCIGFsbG9jYXRvciBvcHRpb25zCgpDT05GSUdfU0hVRkZMRV9Q
QUdFX0FMTE9DQVRPUj15CiMgQ09ORklHX0NPTVBBVF9CUksgaXMgbm90IHNldAojIENPTkZJR19N
TUFQX0FMTE9XX1VOSU5JVElBTElaRUQgaXMgbm90IHNldApDT05GSUdfRkxBVE1FTT15CkNPTkZJ
R19TUExJVF9QVExPQ0tfQ1BVUz05OTk5OTkKQ09ORklHX01FTU9SWV9CQUxMT09OPXkKQ09ORklH
X1BBR0VfUkVQT1JUSU5HPXkKQ09ORklHX05PTU1VX0lOSVRJQUxfVFJJTV9FWENFU1M9MQpDT05G
SUdfTkVFRF9QRVJfQ1BVX0tNPXkKQ09ORklHX0FSQ0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRF
Uj15CkNPTkZJR19aT05FX0RNQT15CkNPTkZJR19WTV9FVkVOVF9DT1VOVEVSUz15CiMgQ09ORklH
X1BFUkNQVV9TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dVUF9URVNUIGlzIG5vdCBzZXQKCiMK
IyBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMKQ09ORklHX0RBTU9OPXkKIyBDT05GSUdfREFNT05f
U1lTRlMgaXMgbm90IHNldAojIGVuZCBvZiBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMgZW5kIG9m
IE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKCiMgQ09ORklHX05FVCBpcyBub3Qgc2V0CgojCiMg
RGV2aWNlIERyaXZlcnMKIwpDT05GSUdfUENDQVJEPXkKQ09ORklHX1BDTUNJQT1tCkNPTkZJR19Q
Q01DSUFfTE9BRF9DSVM9eQoKIwojIFBDLWNhcmQgYnJpZGdlcwojCgojCiMgR2VuZXJpYyBEcml2
ZXIgT3B0aW9ucwojCkNPTkZJR19BVVhJTElBUllfQlVTPXkKIyBDT05GSUdfVUVWRU5UX0hFTFBF
UiBpcyBub3Qgc2V0CkNPTkZJR19ERVZUTVBGUz15CkNPTkZJR19ERVZUTVBGU19NT1VOVD15CkNP
TkZJR19ERVZUTVBGU19TQUZFPXkKIyBDT05GSUdfU1RBTkRBTE9ORSBpcyBub3Qgc2V0CkNPTkZJ
R19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2FkZXIKIwpDT05GSUdf
RldfTE9BREVSPXkKQ09ORklHX0ZXX0xPQURFUl9QQUdFRF9CVUY9eQpDT05GSUdfRldfTE9BREVS
X1NZU0ZTPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCkNPTkZJR19GV19MT0FERVJfVVNFUl9I
RUxQRVI9eQojIENPTkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVJfRkFMTEJBQ0sgaXMgbm90IHNl
dApDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTPXkKIyBDT05GSUdfRldfTE9BREVSX0NPTVBSRVNT
X1haIGlzIG5vdCBzZXQKQ09ORklHX0ZXX0xPQURFUl9DT01QUkVTU19aU1REPXkKIyBDT05GSUdf
RldfVVBMT0FEIGlzIG5vdCBzZXQKIyBlbmQgb2YgRmlybXdhcmUgbG9hZGVyCgojIENPTkZJR19B
TExPV19ERVZfQ09SRURVTVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19EUklWRVIgaXMgbm90
IHNldApDT05GSUdfREVCVUdfREVWUkVTPXkKIyBDT05GSUdfREVCVUdfVEVTVF9EUklWRVJfUkVN
T1ZFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9BU1lOQ19EUklWRVJfUFJPQkUgaXMgbm90IHNl
dApDT05GSUdfR0VORVJJQ19DUFVfREVWSUNFUz15CkNPTkZJR19SRUdNQVA9eQpDT05GSUdfUkVH
TUFQX0kyQz15CkNPTkZJR19SRUdNQVBfU1BNST15CkNPTkZJR19SRUdNQVBfVzE9bQpDT05GSUdf
UkVHTUFQX01NSU89eQpDT05GSUdfUkVHTUFQX0lSUT15CkNPTkZJR19SRUdNQVBfSTNDPW0KQ09O
RklHX0RNQV9TSEFSRURfQlVGRkVSPXkKIyBDT05GSUdfRE1BX0ZFTkNFX1RSQUNFIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwoKIwojIEJ1cyBkZXZpY2VzCiMKIyBD
T05GSUdfQVJNX0lOVEVHUkFUT1JfTE0gaXMgbm90IHNldAojIENPTkZJR19CVDFfQVBCIGlzIG5v
dCBzZXQKIyBDT05GSUdfQlQxX0FYSSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJU0lMSUNPTl9MUEMg
aXMgbm90IHNldAojIENPTkZJR19JTlRFTF9JWFA0WFhfRUIgaXMgbm90IHNldAojIENPTkZJR19R
Q09NX0VCSTIgaXMgbm90IHNldAojIENPTkZJR19NSElfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUhJX0JVU19FUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgRmlybXdhcmUg
RHJpdmVycwojCgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFj
ZSBQcm90b2NvbAojCiMgQ09ORklHX0FSTV9TQ01JX1BST1RPQ09MIGlzIG5vdCBzZXQKQ09ORklH
X0FSTV9TQ01JX1BPV0VSX0RPTUFJTj15CiMgQ09ORklHX0FSTV9TQ01JX1BPV0VSX0NPTlRST0wg
aXMgbm90IHNldAojIGVuZCBvZiBBUk0gU3lzdGVtIENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50
ZXJmYWNlIFByb3RvY29sCgojIENPTkZJR19BUk1fU0NQSV9QUk9UT0NPTCBpcyBub3Qgc2V0CkNP
TkZJR19BUk1fU0NQSV9QT1dFUl9ET01BSU49eQpDT05GSUdfRklSTVdBUkVfTUVNTUFQPXkKIyBD
T05GSUdfQkNNNDdYWF9OVlJBTSBpcyBub3Qgc2V0CkNPTkZJR19HT09HTEVfRklSTVdBUkU9eQpD
T05GSUdfR09PR0xFX0NPUkVCT09UX1RBQkxFPXkKQ09ORklHX0dPT0dMRV9NRU1DT05TT0xFPW0K
Q09ORklHX0dPT0dMRV9NRU1DT05TT0xFX0NPUkVCT09UPW0KQ09ORklHX0dPT0dMRV9WUEQ9eQoK
IwojIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5kIG9mIFRlZ3JhIGZpcm13YXJlIGRyaXZl
cgojIGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgojIENPTkZJR19HTlNTIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVREIGlzIG5vdCBzZXQKQ09ORklHX09GPXkKIyBDT05GSUdfT0ZfVU5JVFRFU1QgaXMg
bm90IHNldAojIENPTkZJR19PRl9BTExfRFRCUyBpcyBub3Qgc2V0CkNPTkZJR19PRl9LT0JKPXkK
Q09ORklHX09GX0FERFJFU1M9eQpDT05GSUdfT0ZfSVJRPXkKIyBDT05GSUdfT0ZfT1ZFUkxBWSBp
cyBub3Qgc2V0CkNPTkZJR19QQVJQT1JUPXkKQ09ORklHX1BBUlBPUlRfQVg4ODc5Nj1tCkNPTkZJ
R19QQVJQT1JUXzEyODQ9eQpDT05GSUdfUEFSUE9SVF9OT1RfUEM9eQpDT05GSUdfQkxLX0RFVj15
CkNPTkZJR19CTEtfREVWX05VTExfQkxLPW0KQ09ORklHX0JMS19ERVZfTlVMTF9CTEtfRkFVTFRf
SU5KRUNUSU9OPXkKQ09ORklHX0NEUk9NPW0KQ09ORklHX0JMS19ERVZfTE9PUD1tCkNPTkZJR19C
TEtfREVWX0xPT1BfTUlOX0NPVU5UPTgKCiMKIyBEUkJEIGRpc2FibGVkIGJlY2F1c2UgUFJPQ19G
UyBvciBJTkVUIG5vdCBzZWxlY3RlZAojCkNPTkZJR19CTEtfREVWX1JBTT15CkNPTkZJR19CTEtf
REVWX1JBTV9DT1VOVD0xNgpDT05GSUdfQkxLX0RFVl9SQU1fU0laRT00MDk2CkNPTkZJR19DRFJP
TV9QS1RDRFZEPW0KQ09ORklHX0NEUk9NX1BLVENEVkRfQlVGRkVSUz04CkNPTkZJR19DRFJPTV9Q
S1RDRFZEX1dDQUNIRT15CiMgQ09ORklHX1ZJUlRJT19CTEsgaXMgbm90IHNldAojIENPTkZJR19C
TEtfREVWX1VCTEsgaXMgbm90IHNldAoKIwojIE5WTUUgU3VwcG9ydAojCkNPTkZJR19OVk1FX0NP
TU1PTj1tCkNPTkZJR19OVk1FX0NPUkU9bQpDT05GSUdfTlZNRV9NVUxUSVBBVEg9eQpDT05GSUdf
TlZNRV9WRVJCT1NFX0VSUk9SUz15CiMgQ09ORklHX05WTUVfSFdNT04gaXMgbm90IHNldApDT05G
SUdfTlZNRV9GQUJSSUNTPW0KIyBDT05GSUdfTlZNRV9BVVRIIGlzIG5vdCBzZXQKQ09ORklHX05W
TUVfVEFSR0VUPW0KQ09ORklHX05WTUVfVEFSR0VUX1BBU1NUSFJVPXkKQ09ORklHX05WTUVfVEFS
R0VUX0xPT1A9bQpDT05GSUdfTlZNRV9UQVJHRVRfQVVUSD15CiMgZW5kIG9mIE5WTUUgU3VwcG9y
dAoKIwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19TRU5TT1JTX0xJUzNMVjAyRD15CkNPTkZJR19B
RDUyNVhfRFBPVD15CkNPTkZJR19BRDUyNVhfRFBPVF9JMkM9eQpDT05GSUdfRFVNTVlfSVJRPW0K
IyBDT05GSUdfSUNTOTMyUzQwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTUVMX1NTQyBpcyBub3Qg
c2V0CkNPTkZJR19FTkNMT1NVUkVfU0VSVklDRVM9bQpDT05GSUdfSEk2NDIxVjYwMF9JUlE9bQoj
IENPTkZJR19RQ09NX0NPSU5DRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9GQVNUUlBDIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMgbm90IHNldApDT05GSUdfSVNMMjkwMDM9
eQojIENPTkZJR19JU0wyOTAyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVFNMMjU1MCBp
cyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0JIMTc3MD15CkNPTkZJR19TRU5TT1JTX0FQRFM5OTBY
PXkKQ09ORklHX0hNQzYzNTI9eQojIENPTkZJR19EUzE2ODIgaXMgbm90IHNldAojIENPTkZJR19T
UkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX1NERkVDIGlzIG5vdCBzZXQKQ09ORklHX01J
U0NfUlRTWD15CkNPTkZJR19ISVNJX0hJS0VZX1VTQj1tCkNPTkZJR19WQ1BVX1NUQUxMX0RFVEVD
VE9SPW0KQ09ORklHX0MyUE9SVD15CgojCiMgRUVQUk9NIHN1cHBvcnQKIwojIENPTkZJR19FRVBS
T01fQVQyNCBpcyBub3Qgc2V0CkNPTkZJR19FRVBST01fTEVHQUNZPXkKQ09ORklHX0VFUFJPTV9N
QVg2ODc1PW0KQ09ORklHX0VFUFJPTV85M0NYNj1tCkNPTkZJR19FRVBST01fSURUXzg5SFBFU1g9
bQpDT05GSUdfRUVQUk9NX0VFMTAwND15CiMgZW5kIG9mIEVFUFJPTSBzdXBwb3J0CgojCiMgVGV4
YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKIwojIGVuZCBv
ZiBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQoKQ09O
RklHX1NFTlNPUlNfTElTM19JMkM9eQpDT05GSUdfQUxURVJBX1NUQVBMPW0KQ09ORklHX0VDSE89
bQpDT05GSUdfTUlTQ19SVFNYX1VTQj15CkNPTkZJR19VQUNDRT1tCiMgQ09ORklHX1BWUEFOSUMg
aXMgbm90IHNldAojIGVuZCBvZiBNaXNjIGRldmljZXMKCiMKIyBTQ1NJIGRldmljZSBzdXBwb3J0
CiMKQ09ORklHX1NDU0lfTU9EPW0KQ09ORklHX1JBSURfQVRUUlM9bQpDT05GSUdfU0NTSV9DT01N
T049bQpDT05GSUdfU0NTST1tCiMgQ09ORklHX1NDU0lfUFJPQ19GUyBpcyBub3Qgc2V0CgojCiMg
U0NTSSBzdXBwb3J0IHR5cGUgKGRpc2ssIHRhcGUsIENELVJPTSkKIwpDT05GSUdfQkxLX0RFVl9T
RD1tCiMgQ09ORklHX0NIUl9ERVZfU1QgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9TUj1tCkNP
TkZJR19DSFJfREVWX1NHPW0KQ09ORklHX0JMS19ERVZfQlNHPXkKQ09ORklHX0NIUl9ERVZfU0NI
PW0KIyBDT05GSUdfU0NTSV9FTkNMT1NVUkUgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0NPTlNU
QU5UUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTE9HR0lORyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfU0NBTl9BU1lOQyBpcyBub3Qgc2V0CgojCiMgU0NTSSBUcmFuc3BvcnRzCiMKQ09ORklH
X1NDU0lfU1BJX0FUVFJTPW0KQ09ORklHX1NDU0lfU0FTX0FUVFJTPW0KQ09ORklHX1NDU0lfU0FT
X0xJQlNBUz1tCiMgQ09ORklHX1NDU0lfU0FTX0hPU1RfU01QIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9TUlBfQVRUUlMgaXMgbm90IHNldAojIGVuZCBvZiBTQ1NJIFRyYW5zcG9ydHMKCkNPTkZJ
R19TQ1NJX0xPV0xFVkVMPXkKIyBDT05GSUdfSVNDU0lfQk9PVF9TWVNGUyBpcyBub3Qgc2V0CkNP
TkZJR19TQ1NJX0ZET01BSU49bQpDT05GSUdfU0NTSV9ERUJVRz1tCiMgQ09ORklHX1NDU0lfVklS
VElPIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfTE9XTEVWRUxfUENNQ0lBPXkKIyBDT05GSUdfUENN
Q0lBX0FIQTE1MlggaXMgbm90IHNldApDT05GSUdfUENNQ0lBX0ZET01BSU49bQpDT05GSUdfUENN
Q0lBX05JTkpBX1NDU0k9bQpDT05GSUdfUENNQ0lBX1FMT0dJQz1tCkNPTkZJR19QQ01DSUFfU1lN
NTNDNTAwPW0KQ09ORklHX1NDU0lfREg9eQpDT05GSUdfU0NTSV9ESF9SREFDPW0KQ09ORklHX1ND
U0lfREhfSFBfU1c9bQojIENPTkZJR19TQ1NJX0RIX0VNQyBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJ
X0RIX0FMVUE9bQojIGVuZCBvZiBTQ1NJIGRldmljZSBzdXBwb3J0CgojIENPTkZJR19BVEEgaXMg
bm90IHNldApDT05GSUdfTUQ9eQpDT05GSUdfQkxLX0RFVl9NRD1tCkNPTkZJR19NRF9MSU5FQVI9
bQpDT05GSUdfTURfUkFJRDA9bQpDT05GSUdfTURfUkFJRDE9bQojIENPTkZJR19NRF9SQUlEMTAg
aXMgbm90IHNldApDT05GSUdfTURfUkFJRDQ1Nj1tCiMgQ09ORklHX01EX01VTFRJUEFUSCBpcyBu
b3Qgc2V0CkNPTkZJR19NRF9GQVVMVFk9bQojIENPTkZJR19CQ0FDSEUgaXMgbm90IHNldAojIENP
TkZJR19CTEtfREVWX0RNIGlzIG5vdCBzZXQKQ09ORklHX1RBUkdFVF9DT1JFPW0KQ09ORklHX1RD
TV9JQkxPQ0s9bQojIENPTkZJR19UQ01fRklMRUlPIGlzIG5vdCBzZXQKQ09ORklHX1RDTV9QU0NT
ST1tCkNPTkZJR19MT09QQkFDS19UQVJHRVQ9bQoKIwojIElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1
cHBvcnQKIwojIENPTkZJR19GSVJFV0lSRSBpcyBub3Qgc2V0CiMgZW5kIG9mIElFRUUgMTM5NCAo
RmlyZVdpcmUpIHN1cHBvcnQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBV
VD15CkNPTkZJR19JTlBVVF9MRURTPW0KQ09ORklHX0lOUFVUX0ZGX01FTUxFU1M9eQpDT05GSUdf
SU5QVVRfU1BBUlNFS01BUD15CkNPTkZJR19JTlBVVF9NQVRSSVhLTUFQPXkKQ09ORklHX0lOUFVU
X1ZJVkFMRElGTUFQPW0KCiMKIyBVc2VybGFuZCBpbnRlcmZhY2VzCiMKIyBDT05GSUdfSU5QVVRf
TU9VU0VERVYgaXMgbm90IHNldApDT05GSUdfSU5QVVRfSk9ZREVWPXkKQ09ORklHX0lOUFVUX0VW
REVWPW0KQ09ORklHX0lOUFVUX0VWQlVHPW0KCiMKIyBJbnB1dCBEZXZpY2UgRHJpdmVycwojCiMg
Q09ORklHX0lOUFVUX0tFWUJPQVJEIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFPXkKQ09O
RklHX01PVVNFX1BTMj1tCkNPTkZJR19NT1VTRV9QUzJfQUxQUz15CkNPTkZJR19NT1VTRV9QUzJf
QllEPXkKIyBDT05GSUdfTU9VU0VfUFMyX0xPR0lQUzJQUCBpcyBub3Qgc2V0CkNPTkZJR19NT1VT
RV9QUzJfU1lOQVBUSUNTPXkKIyBDT05GSUdfTU9VU0VfUFMyX1NZTkFQVElDU19TTUJVUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9DWVBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX01PVVNF
X1BTMl9UUkFDS1BPSU5UPXkKQ09ORklHX01PVVNFX1BTMl9FTEFOVEVDSD15CiMgQ09ORklHX01P
VVNFX1BTMl9FTEFOVEVDSF9TTUJVUyBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9QUzJfU0VOVEVM
SUM9eQpDT05GSUdfTU9VU0VfUFMyX1RPVUNIS0lUPXkKIyBDT05GSUdfTU9VU0VfUFMyX0ZPQ0FM
VEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NFUklBTCBpcyBub3Qgc2V0CkNPTkZJR19N
T1VTRV9BUFBMRVRPVUNIPXkKQ09ORklHX01PVVNFX0JDTTU5NzQ9bQojIENPTkZJR19NT1VTRV9D
WUFQQSBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9FTEFOX0kyQz15CkNPTkZJR19NT1VTRV9FTEFO
X0kyQ19JMkM9eQpDT05GSUdfTU9VU0VfRUxBTl9JMkNfU01CVVM9eQpDT05GSUdfTU9VU0VfVlNY
WFhBQT1tCiMgQ09ORklHX01PVVNFX0dQSU8gaXMgbm90IHNldApDT05GSUdfTU9VU0VfU1lOQVBU
SUNTX0kyQz15CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19VU0IgaXMgbm90IHNldApDT05GSUdf
SU5QVVRfSk9ZU1RJQ0s9eQpDT05GSUdfSk9ZU1RJQ0tfQU5BTE9HPXkKIyBDT05GSUdfSk9ZU1RJ
Q0tfQTNEIGlzIG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX0FEQz1tCkNPTkZJR19KT1lTVElDS19B
REk9eQpDT05GSUdfSk9ZU1RJQ0tfQ09CUkE9eQojIENPTkZJR19KT1lTVElDS19HRjJLIGlzIG5v
dCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfR1JJUCBpcyBub3Qgc2V0CkNPTkZJR19KT1lTVElDS19H
UklQX01QPXkKIyBDT05GSUdfSk9ZU1RJQ0tfR1VJTExFTU9UIGlzIG5vdCBzZXQKIyBDT05GSUdf
Sk9ZU1RJQ0tfSU5URVJBQ1QgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfU0lERVdJTkRFUj15
CkNPTkZJR19KT1lTVElDS19UTURDPXkKQ09ORklHX0pPWVNUSUNLX0lGT1JDRT1tCiMgQ09ORklH
X0pPWVNUSUNLX0lGT1JDRV9VU0IgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfSUZPUkNFXzIz
Mj1tCkNPTkZJR19KT1lTVElDS19XQVJSSU9SPXkKQ09ORklHX0pPWVNUSUNLX01BR0VMTEFOPW0K
IyBDT05GSUdfSk9ZU1RJQ0tfU1BBQ0VPUkIgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfU1BB
Q0VCQUxMPXkKQ09ORklHX0pPWVNUSUNLX1NUSU5HRVI9eQpDT05GSUdfSk9ZU1RJQ0tfVFdJREpP
WT15CiMgQ09ORklHX0pPWVNUSUNLX1pIRU5IVUEgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tf
REI5PW0KQ09ORklHX0pPWVNUSUNLX0dBTUVDT049eQojIENPTkZJR19KT1lTVElDS19UVVJCT0dS
QUZYIGlzIG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX0FTNTAxMT15CkNPTkZJR19KT1lTVElDS19K
T1lEVU1QPXkKQ09ORklHX0pPWVNUSUNLX1hQQUQ9eQojIENPTkZJR19KT1lTVElDS19YUEFEX0ZG
IGlzIG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX1hQQURfTEVEUz15CkNPTkZJR19KT1lTVElDS19Q
WFJDPXkKIyBDT05GSUdfSk9ZU1RJQ0tfUVdJSUMgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElD
S19GU0lBNkIgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19TRU5TRUhBVCBpcyBub3Qgc2V0
CkNPTkZJR19JTlBVVF9UQUJMRVQ9eQpDT05GSUdfVEFCTEVUX1VTQl9BQ0VDQUQ9eQojIENPTkZJ
R19UQUJMRVRfVVNCX0FJUFRFSyBpcyBub3Qgc2V0CkNPTkZJR19UQUJMRVRfVVNCX0hBTldBTkc9
eQojIENPTkZJR19UQUJMRVRfVVNCX0tCVEFCIGlzIG5vdCBzZXQKQ09ORklHX1RBQkxFVF9VU0Jf
UEVHQVNVUz1tCkNPTkZJR19UQUJMRVRfU0VSSUFMX1dBQ09NND15CkNPTkZJR19JTlBVVF9UT1VD
SFNDUkVFTj15CkNPTkZJR19UT1VDSFNDUkVFTl9BRDc4Nzk9eQpDT05GSUdfVE9VQ0hTQ1JFRU5f
QUQ3ODc5X0kyQz1tCkNPTkZJR19UT1VDSFNDUkVFTl9BREM9bQpDT05GSUdfVE9VQ0hTQ1JFRU5f
QVIxMDIxX0kyQz15CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FUTUVMX01YVCBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX0FVT19QSVhDSVIgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFND
UkVFTl9CVTIxMDEzIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0JVMjEwMjk9bQpDT05G
SUdfVE9VQ0hTQ1JFRU5fQ0hJUE9ORV9JQ044MzE4PXkKQ09ORklHX1RPVUNIU0NSRUVOX0NZOENU
TUExNDA9bQpDT05GSUdfVE9VQ0hTQ1JFRU5fQ1k4Q1RNRzExMD15CiMgQ09ORklHX1RPVUNIU0NS
RUVOX0NZVFRTUF9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0NZVFRTUDRfQ09S
RT15CkNPTkZJR19UT1VDSFNDUkVFTl9DWVRUU1A0X0kyQz15CiMgQ09ORklHX1RPVUNIU0NSRUVO
X0RBOTAzNCBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9EWU5BUFJPPXkKQ09ORklHX1RP
VUNIU0NSRUVOX0hBTVBTSElSRT15CkNPTkZJR19UT1VDSFNDUkVFTl9FRVRJPW0KQ09ORklHX1RP
VUNIU0NSRUVOX0VHQUxBWD1tCiMgQ09ORklHX1RPVUNIU0NSRUVOX0VHQUxBWF9TRVJJQUwgaXMg
bm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FWEMzMDAwIGlzIG5vdCBzZXQKQ09ORklHX1RP
VUNIU0NSRUVOX0ZVSklUU1U9eQojIENPTkZJR19UT1VDSFNDUkVFTl9HT09ESVggaXMgbm90IHNl
dApDT05GSUdfVE9VQ0hTQ1JFRU5fSElERUVQPW0KQ09ORklHX1RPVUNIU0NSRUVOX0hZQ09OX0hZ
NDZYWD1tCiMgQ09ORklHX1RPVUNIU0NSRUVOX0lMSTIxMFggaXMgbm90IHNldApDT05GSUdfVE9V
Q0hTQ1JFRU5fSUxJVEVLPW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSVBST0MgaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9TNlNZNzYxIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVO
X0dVTlpFPW0KQ09ORklHX1RPVUNIU0NSRUVOX0VLVEYyMTI3PXkKQ09ORklHX1RPVUNIU0NSRUVO
X0VMQU49eQpDT05GSUdfVE9VQ0hTQ1JFRU5fRUxPPXkKQ09ORklHX1RPVUNIU0NSRUVOX1dBQ09N
X1c4MDAxPW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fV0FDT01fSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fTUFYMTE4MDEgaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JFRU5fTUNT
NTAwMD1tCiMgQ09ORklHX1RPVUNIU0NSRUVOX01NUzExNCBpcyBub3Qgc2V0CkNPTkZJR19UT1VD
SFNDUkVFTl9NRUxGQVNfTUlQND1tCkNPTkZJR19UT1VDSFNDUkVFTl9NU0cyNjM4PW0KQ09ORklH
X1RPVUNIU0NSRUVOX01UT1VDSD1tCkNPTkZJR19UT1VDSFNDUkVFTl9JTUFHSVM9bQojIENPTkZJ
R19UT1VDSFNDUkVFTl9JTVg2VUxfVFNDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5f
SU5FWElPIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX01LNzEyPW0KQ09ORklHX1RPVUNI
U0NSRUVOX1BFTk1PVU5UPW0KQ09ORklHX1RPVUNIU0NSRUVOX0VEVF9GVDVYMDY9bQojIENPTkZJ
R19UT1VDSFNDUkVFTl9SQVNQQkVSUllQSV9GVyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NS
RUVOX01JR09SIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX1RPVUNIUklHSFQ9eQpDT05G
SUdfVE9VQ0hTQ1JFRU5fVE9VQ0hXSU49eQpDT05GSUdfVE9VQ0hTQ1JFRU5fVElfQU0zMzVYX1RT
Qz1tCkNPTkZJR19UT1VDSFNDUkVFTl9QSVhDSVI9bQpDT05GSUdfVE9VQ0hTQ1JFRU5fV0RUODdY
WF9JMkM9eQpDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0NPTVBPU0lURT15CkNPTkZJR19UT1VDSFND
UkVFTl9NQzEzNzgzPXkKQ09ORklHX1RPVUNIU0NSRUVOX1VTQl9FR0FMQVg9eQojIENPTkZJR19U
T1VDSFNDUkVFTl9VU0JfUEFOSklUIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNC
XzNNIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0lUTSBpcyBub3Qgc2V0CkNP
TkZJR19UT1VDSFNDUkVFTl9VU0JfRVRVUkJPPXkKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0dV
TlpFIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0RNQ19UU0MxMCBpcyBub3Qg
c2V0CkNPTkZJR19UT1VDSFNDUkVFTl9VU0JfSVJUT1VDSD15CkNPTkZJR19UT1VDSFNDUkVFTl9V
U0JfSURFQUxURUs9eQojIENPTkZJR19UT1VDSFNDUkVFTl9VU0JfR0VORVJBTF9UT1VDSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1VTQl9HT1RPUCBpcyBub3Qgc2V0CkNPTkZJR19U
T1VDSFNDUkVFTl9VU0JfSkFTVEVDPXkKQ09ORklHX1RPVUNIU0NSRUVOX1VTQl9FTE89eQojIENP
TkZJR19UT1VDSFNDUkVFTl9VU0JfRTJJIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX1VT
Ql9aWVRST05JQz15CiMgQ09ORklHX1RPVUNIU0NSRUVOX1VTQl9FVFRfVEM0NVVTQiBpcyBub3Qg
c2V0CkNPTkZJR19UT1VDSFNDUkVFTl9VU0JfTkVYSU89eQpDT05GSUdfVE9VQ0hTQ1JFRU5fVVNC
X0VBU1lUT1VDSD15CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RPVUNISVQyMTMgaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9UUzQ4MDAgaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JFRU5f
VFNDX1NFUklPPW0KQ09ORklHX1RPVUNIU0NSRUVOX1RTQzIwMFhfQ09SRT1tCkNPTkZJR19UT1VD
SFNDUkVFTl9UU0MyMDA0PW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFNDMjAwNyBpcyBub3Qgc2V0
CkNPTkZJR19UT1VDSFNDUkVFTl9STV9UUz1tCkNPTkZJR19UT1VDSFNDUkVFTl9TSUxFQUQ9eQpD
T05GSUdfVE9VQ0hTQ1JFRU5fU0lTX0kyQz15CkNPTkZJR19UT1VDSFNDUkVFTl9TVDEyMzI9eQoj
IENPTkZJR19UT1VDSFNDUkVFTl9TVE1GVFMgaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JFRU5f
U1RNUEU9eQojIENPTkZJR19UT1VDSFNDUkVFTl9TVU40SSBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX1NYODY1NCBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9UUFM2NTA3WD1t
CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pFVDYyMjMgaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JF
RU5fWkZPUkNFPW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ09MSUJSSV9WRjUwIGlzIG5vdCBzZXQK
Q09ORklHX1RPVUNIU0NSRUVOX1JPSE1fQlUyMTAyMz15CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lR
UzVYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pJTklUSVggaXMgbm90IHNldApD
T05GSUdfSU5QVVRfTUlTQz15CkNPTkZJR19JTlBVVF84OFBNODBYX09OS0VZPW0KQ09ORklHX0lO
UFVUX0FENzE0WD1tCiMgQ09ORklHX0lOUFVUX0FENzE0WF9JMkMgaXMgbm90IHNldAojIENPTkZJ
R19JTlBVVF9BVEMyNjBYX09OS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQVRNRUxfQ0FQ
VE9VQ0ggaXMgbm90IHNldApDT05GSUdfSU5QVVRfQk1BMTUwPXkKQ09ORklHX0lOUFVUX0UzWDBf
QlVUVE9OPXkKIyBDT05GSUdfSU5QVVRfTTY4S19CRUVQIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVU
X01BWDc3NjUwX09OS0VZPW0KQ09ORklHX0lOUFVUX01BWDc3NjkzX0hBUFRJQz1tCiMgQ09ORklH
X0lOUFVUX01BWDg5OTdfSEFQVElDIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01DMTM3ODNfUFdS
QlVUVE9OPXkKQ09ORklHX0lOUFVUX01NQTg0NTA9eQpDT05GSUdfSU5QVVRfR1BJT19CRUVQRVI9
eQojIENPTkZJR19JTlBVVF9HUElPX0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9H
UElPX1ZJQlJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQVRJX1JFTU9URTIgaXMgbm90IHNl
dApDT05GSUdfSU5QVVRfS0VZU1BBTl9SRU1PVEU9bQojIENPTkZJR19JTlBVVF9LWFRKOSBpcyBu
b3Qgc2V0CkNPTkZJR19JTlBVVF9QT1dFUk1BVEU9eQpDT05GSUdfSU5QVVRfWUVBTElOSz1tCiMg
Q09ORklHX0lOUFVUX0NNMTA5IGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1JFR1VMQVRPUl9IQVBU
SUM9bQojIENPTkZJR19JTlBVVF9SRVRVX1BXUkJVVFRPTiBpcyBub3Qgc2V0CkNPTkZJR19JTlBV
VF9UUFM2NTIxOF9QV1JCVVRUT049bQojIENPTkZJR19JTlBVVF9BWFAyMFhfUEVLIGlzIG5vdCBz
ZXQKQ09ORklHX0lOUFVUX1RXTDQwMzBfUFdSQlVUVE9OPW0KQ09ORklHX0lOUFVUX1RXTDQwMzBf
VklCUkE9bQpDT05GSUdfSU5QVVRfVUlOUFVUPXkKQ09ORklHX0lOUFVUX1BDRjUwNjMzX1BNVT1t
CiMgQ09ORklHX0lOUFVUX1BDRjg1NzQgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9QV01fQkVF
UEVSIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1BXTV9WSUJSQT1tCkNPTkZJR19JTlBVVF9SSzgw
NV9QV1JLRVk9bQojIENPTkZJR19JTlBVVF9HUElPX1JPVEFSWV9FTkNPREVSIGlzIG5vdCBzZXQK
Q09ORklHX0lOUFVUX0RBNzI4MF9IQVBUSUNTPXkKQ09ORklHX0lOUFVUX0RBOTA1NV9PTktFWT15
CkNPTkZJR19JTlBVVF9EQTkwNjNfT05LRVk9bQojIENPTkZJR19JTlBVVF9BRFhMMzRYIGlzIG5v
dCBzZXQKQ09ORklHX0lOUFVUX0lNU19QQ1U9eQpDT05GSUdfSU5QVVRfSVFTMjY5QT1tCiMgQ09O
RklHX0lOUFVUX0lRUzYyNkEgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9JUVM3MjIyIGlzIG5v
dCBzZXQKQ09ORklHX0lOUFVUX0NNQTMwMDA9eQpDT05GSUdfSU5QVVRfQ01BMzAwMF9JMkM9eQoj
IENPTkZJR19JTlBVVF9EUlYyNjBYX0hBUFRJQ1MgaXMgbm90IHNldApDT05GSUdfSU5QVVRfRFJW
MjY2NV9IQVBUSUNTPW0KQ09ORklHX0lOUFVUX0RSVjI2NjdfSEFQVElDUz15CiMgQ09ORklHX0lO
UFVUX0hJU0lfUE9XRVJLRVkgaXMgbm90IHNldApDT05GSUdfSU5QVVRfUkFWRV9TUF9QV1JCVVRU
T049bQojIENPTkZJR19JTlBVVF9TQzI3WFhfVklCUkEgaXMgbm90IHNldApDT05GSUdfSU5QVVRf
U1RQTUlDMV9PTktFWT1tCkNPTkZJR19STUk0X0NPUkU9bQpDT05GSUdfUk1JNF9JMkM9bQojIENP
TkZJR19STUk0X1NNQiBpcyBub3Qgc2V0CkNPTkZJR19STUk0X0YwMz15CkNPTkZJR19STUk0X0Yw
M19TRVJJTz1tCkNPTkZJR19STUk0XzJEX1NFTlNPUj15CkNPTkZJR19STUk0X0YxMT15CkNPTkZJ
R19STUk0X0YxMj15CkNPTkZJR19STUk0X0YzMD15CiMgQ09ORklHX1JNSTRfRjM0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUk1JNF9GM0EgaXMgbm90IHNldApDT05GSUdfUk1JNF9GNTU9eQoKIwojIEhh
cmR3YXJlIEkvTyBwb3J0cwojCkNPTkZJR19TRVJJTz15CkNPTkZJR19TRVJJT19TRVJQT1JUPXkK
IyBDT05GSUdfU0VSSU9fUEFSS0JEIGlzIG5vdCBzZXQKQ09ORklHX1NFUklPX0xJQlBTMj1tCiMg
Q09ORklHX1NFUklPX1JBVyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJT19BTFRFUkFfUFMyPXkKQ09O
RklHX1NFUklPX1BTMk1VTFQ9eQpDT05GSUdfU0VSSU9fQVJDX1BTMj15CkNPTkZJR19TRVJJT19B
UEJQUzI9bQojIENPTkZJR19TRVJJT19PTFBDX0FQU1AgaXMgbm90IHNldAojIENPTkZJR19TRVJJ
T19TVU40SV9QUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19HUElPX1BTMiBpcyBub3Qgc2V0
CkNPTkZJR19VU0VSSU89bQpDT05GSUdfR0FNRVBPUlQ9eQojIENPTkZJR19HQU1FUE9SVF9OUzU1
OCBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUX0w0IGlzIG5vdCBzZXQKIyBlbmQgb2YgSGFy
ZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmljZSBzdXBwb3J0CgojCiMgQ2hhcmFj
dGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKQ09ORklHX1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJB
TlNMQVRJT05TPXkKIyBDT05GSUdfVlRfQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19IV19DT05T
T0xFPXkKQ09ORklHX1ZUX0hXX0NPTlNPTEVfQklORElORz15CiMgQ09ORklHX1VOSVg5OF9QVFlT
IGlzIG5vdCBzZXQKQ09ORklHX0xFR0FDWV9QVFlTPXkKQ09ORklHX0xFR0FDWV9QVFlfQ09VTlQ9
MjU2CiMgQ09ORklHX0xESVNDX0FVVE9MT0FEIGlzIG5vdCBzZXQKCiMKIyBTZXJpYWwgZHJpdmVy
cwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049eQpDT05GSUdfU0VSSUFMXzgyNTA9bQpDT05GSUdf
U0VSSUFMXzgyNTBfREVQUkVDQVRFRF9PUFRJT05TPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfMTY1
NTBBX1ZBUklBTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfRklOVEVLIGlzIG5v
dCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0NTPW0KQ09ORklHX1NFUklBTF84MjUwX05SX1VBUlRT
PTQKQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFM9NAojIENPTkZJR19TRVJJQUxfODI1
MF9FWFRFTkRFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX0FTUEVFRF9WVUFSVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX0RXIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VS
SUFMXzgyNTBfSU9DMyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9SVDI4OFg9eQojIENP
TkZJR19TRVJJQUxfODI1MF9PTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfTFBD
MThYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX01UNjU3NyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFUklBTF84MjUwX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgy
NTBfUFhBIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX1RFR1JBPW0KIyBDT05GSUdfU0VS
SUFMXzgyNTBfQkNNNzI3MSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfT0ZfUExBVEZPUk09bQoK
IwojIE5vbi04MjUwIHNlcmlhbCBwb3J0IHN1cHBvcnQKIwojIENPTkZJR19TRVJJQUxfQU1CQV9Q
TDAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BVE1FTCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklBTF9NRVNPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9DTFBTNzExWCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF9TQU1TVU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1RF
R1JBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1RFR1JBX1RDVSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklBTF9JTVggaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfSU1YX0VBUkxZQ09OIGlz
IG5vdCBzZXQKQ09ORklHX1NFUklBTF9VQVJUTElURT15CiMgQ09ORklHX1NFUklBTF9VQVJUTElU
RV9DT05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9VQVJUTElURV9OUl9VQVJUUz0xCiMg
Q09ORklHX1NFUklBTF9TSF9TQ0kgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfSFNfTFBDMzJY
WCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfQ09SRT15CkNPTkZJR19TRVJJQUxfQ09SRV9DT05T
T0xFPXkKIyBDT05GSUdfU0VSSUFMX01TTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9WVDg1
MDAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfT01BUCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJ
QUxfU0lGSVZFPW0KIyBDT05GSUdfU0VSSUFMX0xBTlRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
UklBTF9TQ0NOWFAgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX1NDMTZJUzdYWF9DT1JFPW0KQ09O
RklHX1NFUklBTF9TQzE2SVM3WFg9bQpDT05GSUdfU0VSSUFMX1NDMTZJUzdYWF9JMkM9eQojIENP
TkZJR19TRVJJQUxfVElNQkVSREFMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9CQ002M1hY
IGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9BTFRFUkFfSlRBR1VBUlQ9eQpDT05GSUdfU0VSSUFM
X0FMVEVSQV9KVEFHVUFSVF9DT05TT0xFPXkKIyBDT05GSUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFS
VF9DT05TT0xFX0JZUEFTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfVUFSVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9NWFNfQVVBUlQgaXMgbm90IHNldApDT05GSUdfU0VS
SUFMX1hJTElOWF9QU19VQVJUPXkKQ09ORklHX1NFUklBTF9YSUxJTlhfUFNfVUFSVF9DT05TT0xF
PXkKIyBDT05GSUdfU0VSSUFMX01QUzJfVUFSVCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfQVJD
PXkKQ09ORklHX1NFUklBTF9BUkNfQ09OU09MRT15CkNPTkZJR19TRVJJQUxfQVJDX05SX1BPUlRT
PTEKQ09ORklHX1NFUklBTF9DT05FWEFOVF9ESUdJQ09MT1I9eQojIENPTkZJR19TRVJJQUxfQ09O
RVhBTlRfRElHSUNPTE9SX0NPTlNPTEUgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU1RfQVND
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NUTTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VS
SUFMX09XTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9SREEgaXMgbm90IHNldAojIENPTkZJ
R19TRVJJQUxfTUlMQkVBVVRfVVNJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9MSVRFVUFS
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TVU5QTFVTIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
U2VyaWFsIGRyaXZlcnMKCkNPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz1tCiMgQ09ORklHX1NFUklB
TF9OT05TVEFOREFSRCBpcyBub3Qgc2V0CkNPTkZJR19OVUxMX1RUWT1tCkNPTkZJR19IVkNfRFJJ
VkVSPXkKIyBDT05GSUdfUlBNU0dfVFRZIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9ERVZfQlVT
PW0KQ09ORklHX1RUWV9QUklOVEs9bQpDT05GSUdfVFRZX1BSSU5US19MRVZFTD02CkNPTkZJR19Q
UklOVEVSPW0KIyBDT05GSUdfTFBfQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19QUERFVj1tCkNP
TkZJR19WSVJUSU9fQ09OU09MRT1tCkNPTkZJR19JUE1JX0hBTkRMRVI9bQojIENPTkZJR19JUE1J
X1BBTklDX0VWRU5UIGlzIG5vdCBzZXQKQ09ORklHX0lQTUlfREVWSUNFX0lOVEVSRkFDRT1tCiMg
Q09ORklHX0lQTUlfU0kgaXMgbm90IHNldAojIENPTkZJR19JUE1JX1NTSUYgaXMgbm90IHNldAoj
IENPTkZJR19JUE1JX0lQTUIgaXMgbm90IHNldApDT05GSUdfSVBNSV9XQVRDSERPRz1tCkNPTkZJ
R19JUE1JX1BPV0VST0ZGPW0KIyBDT05GSUdfQVNQRUVEX0tDU19JUE1JX0JNQyBpcyBub3Qgc2V0
CiMgQ09ORklHX05QQ003WFhfS0NTX0lQTUlfQk1DIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNQRUVE
X0JUX0lQTUlfQk1DIGlzIG5vdCBzZXQKQ09ORklHX0lQTUJfREVWSUNFX0lOVEVSRkFDRT15CkNP
TkZJR19IV19SQU5ET009bQpDT05GSUdfSFdfUkFORE9NX1RJTUVSSU9NRU09bQpDT05GSUdfSFdf
UkFORE9NX0JBNDMxPW0KQ09ORklHX0hXX1JBTkRPTV9CQ00yODM1PW0KQ09ORklHX0hXX1JBTkRP
TV9JUFJPQ19STkcyMDA9bQpDT05GSUdfSFdfUkFORE9NX0lYUDRYWD1tCkNPTkZJR19IV19SQU5E
T01fT01BUD1tCkNPTkZJR19IV19SQU5ET01fT01BUDNfUk9NPW0KIyBDT05GSUdfSFdfUkFORE9N
X1ZJUlRJTyBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fTk9NQURJSz1tCkNPTkZJR19IV19S
QU5ET01fU1RNMzI9bQpDT05GSUdfSFdfUkFORE9NX01FU09OPW0KQ09ORklHX0hXX1JBTkRPTV9N
VEs9bQpDT05GSUdfSFdfUkFORE9NX0VYWU5PUz1tCkNPTkZJR19IV19SQU5ET01fTlBDTT1tCkNP
TkZJR19IV19SQU5ET01fS0VZU1RPTkU9bQpDT05GSUdfSFdfUkFORE9NX0NDVFJORz1tCkNPTkZJ
R19IV19SQU5ET01fWElQSEVSQT1tCgojCiMgUENNQ0lBIGNoYXJhY3RlciBkZXZpY2VzCiMKIyBD
T05GSUdfU1lOQ0xJTktfQ1MgaXMgbm90IHNldAojIENPTkZJR19DQVJETUFOXzQwMDAgaXMgbm90
IHNldApDT05GSUdfQ0FSRE1BTl80MDQwPW0KQ09ORklHX1NDUjI0WD1tCiMgZW5kIG9mIFBDTUNJ
QSBjaGFyYWN0ZXIgZGV2aWNlcwoKQ09ORklHX0RFVk1FTT15CiMgQ09ORklHX1RDR19UUE0gaXMg
bm90IHNldAojIENPTkZJR19YSUxMWUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTExZVVNCIGlz
IG5vdCBzZXQKQ09ORklHX1JBTkRPTV9UUlVTVF9DUFU9eQpDT05GSUdfUkFORE9NX1RSVVNUX0JP
T1RMT0FERVI9eQojIGVuZCBvZiBDaGFyYWN0ZXIgZGV2aWNlcwoKIwojIEkyQyBzdXBwb3J0CiMK
Q09ORklHX0kyQz15CkNPTkZJR19JMkNfQk9BUkRJTkZPPXkKQ09ORklHX0kyQ19DT01QQVQ9eQpD
T05GSUdfSTJDX0NIQVJERVY9eQpDT05GSUdfSTJDX01VWD1tCgojCiMgTXVsdGlwbGV4ZXIgSTJD
IENoaXAgc3VwcG9ydAojCiMgQ09ORklHX0kyQ19BUkJfR1BJT19DSEFMTEVOR0UgaXMgbm90IHNl
dApDT05GSUdfSTJDX01VWF9HUElPPW0KQ09ORklHX0kyQ19NVVhfR1BNVVg9bQpDT05GSUdfSTJD
X01VWF9MVEM0MzA2PW0KQ09ORklHX0kyQ19NVVhfUENBOTU0MT1tCkNPTkZJR19JMkNfTVVYX1BD
QTk1NHg9bQpDT05GSUdfSTJDX01VWF9SRUc9bQojIENPTkZJR19JMkNfTVVYX01MWENQTEQgaXMg
bm90IHNldAojIGVuZCBvZiBNdWx0aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CgpDT05GSUdfSTJD
X0hFTFBFUl9BVVRPPXkKQ09ORklHX0kyQ19TTUJVUz15CkNPTkZJR19JMkNfQUxHT0JJVD15CkNP
TkZJR19JMkNfQUxHT1BDQT15CgojCiMgSTJDIEhhcmR3YXJlIEJ1cyBzdXBwb3J0CiMKIyBDT05G
SUdfSTJDX0hJWDVIRDIgaXMgbm90IHNldAoKIwojIEkyQyBzeXN0ZW0gYnVzIGRyaXZlcnMgKG1v
c3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1jaGlwKQojCiMgQ09ORklHX0kyQ19BTFRFUkEgaXMg
bm90IHNldAojIENPTkZJR19JMkNfQVNQRUVEIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FUOTEg
aXMgbm90IHNldAojIENPTkZJR19JMkNfQVhYSUEgaXMgbm90IHNldAojIENPTkZJR19JMkNfQkNN
X0lQUk9DIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0JDTV9LT05BIGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19CUkNNU1RCPXkKIyBDT05GSUdfSTJDX0NBREVOQ0UgaXMgbm90IHNldApDT05GSUdfSTJD
X0NCVVNfR1BJTz1tCiMgQ09ORklHX0kyQ19EQVZJTkNJIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19E
RVNJR05XQVJFX0NPUkU9bQpDT05GSUdfSTJDX0RFU0lHTldBUkVfU0xBVkU9eQpDT05GSUdfSTJD
X0RFU0lHTldBUkVfUExBVEZPUk09bQojIENPTkZJR19JMkNfRElHSUNPTE9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX0VYWU5PUzUgaXMgbm90IHNldApDT05GSUdfSTJDX0dQSU89bQpDT05GSUdf
STJDX0dQSU9fRkFVTFRfSU5KRUNUT1I9eQojIENPTkZJR19JMkNfSElHSExBTkRFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19ISVNJIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lNRyBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19JTVggaXMgbm90IHNldAojIENPTkZJR19JMkNfSU1YX0xQSTJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0lPUDNYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19KWjQ3
ODAgaXMgbm90IHNldAojIENPTkZJR19JMkNfTFBDMksgaXMgbm90IHNldAojIENPTkZJR19JMkNf
TUlDUk9DSElQX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JMkNfTVQ2NVhYIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX01UNzYyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVjY0WFhYIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX01YUyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19OUENNIGlzIG5v
dCBzZXQKQ09ORklHX0kyQ19PQ09SRVM9eQojIENPTkZJR19JMkNfT01BUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0kyQ19PV0wgaXMgbm90IHNldAojIENPTkZJR19JMkNfQVBQTEUgaXMgbm90IHNldApD
T05GSUdfSTJDX1BDQV9QTEFURk9STT15CiMgQ09ORklHX0kyQ19QTlggaXMgbm90IHNldAojIENP
TkZJR19JMkNfUFhBIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1FDT01fQ0NJIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX1FVUCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19SSUlDIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX1JaVjJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1MzQzI0MTAgaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0hfTU9CSUxFIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19TSU1URUM9
eQojIENPTkZJR19JMkNfU1QgaXMgbm90IHNldAojIENPTkZJR19JMkNfU1RNMzJGNCBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19TVE0zMkY3IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NVTjZJX1Ay
V0kgaXMgbm90IHNldAojIENPTkZJR19JMkNfU1lOUVVBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1RFR1JBIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1RFR1JBX0JQTVAgaXMgbm90IHNldAoj
IENPTkZJR19JMkNfVU5JUEhJRVIgaXMgbm90IHNldAojIENPTkZJR19JMkNfVU5JUEhJRVJfRiBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WRVJTQVRJTEUgaXMgbm90IHNldAojIENPTkZJR19JMkNf
V01UIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19YSUxJTlg9eQojIENPTkZJR19JMkNfWExQOVhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX1JDQVIgaXMgbm90IHNldAoKIwojIEV4dGVybmFsIEkyQy9T
TUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwojIENPTkZJR19JMkNfRElPTEFOX1UyQyBpcyBub3Qgc2V0
CkNPTkZJR19JMkNfQ1AyNjE1PW0KQ09ORklHX0kyQ19QQVJQT1JUPXkKQ09ORklHX0kyQ19ST0JP
VEZVWlpfT1NJRj15CiMgQ09ORklHX0kyQ19UQU9TX0VWTSBpcyBub3Qgc2V0CkNPTkZJR19JMkNf
VElOWV9VU0I9bQpDT05GSUdfSTJDX1ZJUEVSQk9BUkQ9eQoKIwojIE90aGVyIEkyQy9TTUJ1cyBi
dXMgZHJpdmVycwojCiMgQ09ORklHX0kyQ19NTFhDUExEIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19G
U0k9eQojIENPTkZJR19JMkNfVklSVElPIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIEhhcmR3YXJl
IEJ1cyBzdXBwb3J0CgpDT05GSUdfSTJDX1NUVUI9bQpDT05GSUdfSTJDX1NMQVZFPXkKQ09ORklH
X0kyQ19TTEFWRV9FRVBST009bQojIENPTkZJR19JMkNfU0xBVkVfVEVTVFVOSVQgaXMgbm90IHNl
dApDT05GSUdfSTJDX0RFQlVHX0NPUkU9eQojIENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qg
c2V0CkNPTkZJR19JMkNfREVCVUdfQlVTPXkKIyBlbmQgb2YgSTJDIHN1cHBvcnQKCkNPTkZJR19J
M0M9eQpDT05GSUdfQ0ROU19JM0NfTUFTVEVSPW0KIyBDT05GSUdfRFdfSTNDX01BU1RFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NWQ19JM0NfTUFTVEVSIGlzIG5vdCBzZXQKQ09ORklHX01JUElfSTND
X0hDST1tCiMgQ09ORklHX1NQSSBpcyBub3Qgc2V0CkNPTkZJR19TUE1JPXkKQ09ORklHX1NQTUlf
SElTSTM2NzA9eQojIENPTkZJR19TUE1JX01TTV9QTUlDX0FSQiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NQTUlfTVRLX1BNSUYgaXMgbm90IHNldAojIENPTkZJR19IU0kgaXMgbm90IHNldApDT05GSUdf
UFBTPXkKIyBDT05GSUdfUFBTX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRQX1BQUyBpcyBu
b3Qgc2V0CgojCiMgUFBTIGNsaWVudHMgc3VwcG9ydAojCkNPTkZJR19QUFNfQ0xJRU5UX0tUSU1F
Uj1tCkNPTkZJR19QUFNfQ0xJRU5UX0xESVNDPXkKQ09ORklHX1BQU19DTElFTlRfUEFSUE9SVD1t
CkNPTkZJR19QUFNfQ0xJRU5UX0dQSU89bQoKIwojIFBQUyBnZW5lcmF0b3JzIHN1cHBvcnQKIwoK
IwojIFBUUCBjbG9jayBzdXBwb3J0CiMKQ09ORklHX1BUUF8xNTg4X0NMT0NLX09QVElPTkFMPXkK
CiMKIyBFbmFibGUgUEhZTElCIGFuZCBORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgdG8gc2VlIHRo
ZSBhZGRpdGlvbmFsIGNsb2Nrcy4KIwojIGVuZCBvZiBQVFAgY2xvY2sgc3VwcG9ydAoKIyBDT05G
SUdfUElOQ1RSTCBpcyBub3Qgc2V0CkNPTkZJR19HUElPTElCPXkKQ09ORklHX0dQSU9MSUJfRkFT
VFBBVEhfTElNSVQ9NTEyCkNPTkZJR19PRl9HUElPPXkKQ09ORklHX0dQSU9MSUJfSVJRQ0hJUD15
CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldApDT05GSUdfR1BJT19TWVNGUz15CkNPTkZJ
R19HUElPX0NERVY9eQpDT05GSUdfR1BJT19DREVWX1YxPXkKQ09ORklHX0dQSU9fR0VORVJJQz15
CgojCiMgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwpDT05GSUdfR1BJT183NFhYX01NSU89
bQojIENPTkZJR19HUElPX0FMVEVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQVNQRUVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19BU1BFRURfU0dQSU8gaXMgbm90IHNldAojIENPTkZJR19H
UElPX0FUSDc5IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19SQVNQQkVSUllQSV9FWFAgaXMgbm90
IHNldAojIENPTkZJR19HUElPX0JDTV9LT05BIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19CQ01f
WEdTX0lQUk9DIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19CUkNNU1RCIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19DTFBTNzExWCBpcyBu
b3Qgc2V0CkNPTkZJR19HUElPX0RXQVBCPXkKIyBDT05GSUdfR1BJT19FSUNfU1BSRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fRU0gaXMgbm90IHNldAojIENPTkZJR19HUElPX0ZUR1BJTzAxMCBp
cyBub3Qgc2V0CkNPTkZJR19HUElPX0dFTkVSSUNfUExBVEZPUk09bQpDT05GSUdfR1BJT19HUkdQ
SU89eQojIENPTkZJR19HUElPX0hJU0kgaXMgbm90IHNldAojIENPTkZJR19HUElPX0hMV0QgaXMg
bm90IHNldAojIENPTkZJR19HUElPX0lPUCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0xPR0lDVkM9
bQojIENPTkZJR19HUElPX0xQQzE4WFggaXMgbm90IHNldAojIENPTkZJR19HUElPX0xQQzMyWFgg
aXMgbm90IHNldAojIENPTkZJR19HUElPX01CODZTN1ggaXMgbm90IHNldAojIENPTkZJR19HUElP
X01QQzhYWFggaXMgbm90IHNldAojIENPTkZJR19HUElPX01UNzYyMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fTVhDIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NWFMgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1BNSUNfRUlDX1NQUkQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1BYQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dQSU9fUkNBUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUkRBIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19ST0NLQ0hJUCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9f
U0FNQTVEMl9QSU9CVSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1NJRklWRT15CiMgQ09ORklHX0dQ
SU9fU05QU19DUkVHIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19TUFJEIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19TVFBfWFdBWSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1NZU0NPTj15CiMgQ09O
RklHX0dQSU9fVEVHUkEgaXMgbm90IHNldAojIENPTkZJR19HUElPX1RFR1JBMTg2IGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19UUzQ4MDAgaXMgbm90IHNldAojIENPTkZJR19HUElPX1VOSVBISUVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19WSVNDT05USSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQ
SU9fWEdFTkVfU0IgaXMgbm90IHNldApDT05GSUdfR1BJT19YSUxJTlg9eQojIENPTkZJR19HUElP
X1hMUCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0FNRF9GQ0g9eQojIENPTkZJR19HUElPX0lEVDMy
NDNYIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKCiMKIyBJ
MkMgR1BJTyBleHBhbmRlcnMKIwojIENPTkZJR19HUElPX0FEUDU1ODggaXMgbm90IHNldApDT05G
SUdfR1BJT19BRE5QPW0KIyBDT05GSUdfR1BJT19HV19QTEQgaXMgbm90IHNldAojIENPTkZJR19H
UElPX01BWDczMDAgaXMgbm90IHNldApDT05GSUdfR1BJT19NQVg3MzJYPXkKQ09ORklHX0dQSU9f
TUFYNzMyWF9JUlE9eQpDT05GSUdfR1BJT19QQ0E5NTNYPXkKIyBDT05GSUdfR1BJT19QQ0E5NTNY
X0lSUSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUENBOTU3MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fUENGODU3WCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1RQSUMyODEwPW0KIyBDT05GSUdf
R1BJT19UUzQ5MDAgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgR1BJTyBleHBhbmRlcnMKCiMKIyBN
RkQgR1BJTyBleHBhbmRlcnMKIwpDT05GSUdfR1BJT19CRDk1NzFNV1Y9bQpDT05GSUdfR1BJT19E
QTkwNTU9eQpDT05GSUdfR1BJT19MUDM5NDM9eQpDT05GSUdfR1BJT19NQVg3NzY1MD15CiMgQ09O
RklHX0dQSU9fU0wyOENQTEQgaXMgbm90IHNldApDT05GSUdfR1BJT19TVE1QRT15CiMgQ09ORklH
X0dQSU9fVEMzNTg5WCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1RQUzY1MDg2PXkKQ09ORklHX0dQ
SU9fVFBTNjU5MTI9bQpDT05GSUdfR1BJT19UV0w0MDMwPW0KQ09ORklHX0dQSU9fV004OTk0PW0K
IyBlbmQgb2YgTUZEIEdQSU8gZXhwYW5kZXJzCgojCiMgVVNCIEdQSU8gZXhwYW5kZXJzCiMKQ09O
RklHX0dQSU9fVklQRVJCT0FSRD1tCiMgZW5kIG9mIFVTQiBHUElPIGV4cGFuZGVycwoKIwojIFZp
cnR1YWwgR1BJTyBkcml2ZXJzCiMKIyBDT05GSUdfR1BJT19BR0dSRUdBVE9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19NT0NLVVAgaXMgbm90IHNldApDT05GSUdfR1BJT19WSVJUSU89bQpDT05G
SUdfR1BJT19TSU09bQojIGVuZCBvZiBWaXJ0dWFsIEdQSU8gZHJpdmVycwoKQ09ORklHX1cxPW0K
CiMKIyAxLXdpcmUgQnVzIE1hc3RlcnMKIwpDT05GSUdfVzFfTUFTVEVSX0RTMjQ5MD1tCkNPTkZJ
R19XMV9NQVNURVJfRFMyNDgyPW0KIyBDT05GSUdfVzFfTUFTVEVSX01YQyBpcyBub3Qgc2V0CkNP
TkZJR19XMV9NQVNURVJfRFMxV009bQpDT05GSUdfVzFfTUFTVEVSX0dQSU89bQpDT05GSUdfVzFf
TUFTVEVSX1NHST1tCiMgZW5kIG9mIDEtd2lyZSBCdXMgTWFzdGVycwoKIwojIDEtd2lyZSBTbGF2
ZXMKIwojIENPTkZJR19XMV9TTEFWRV9USEVSTSBpcyBub3Qgc2V0CiMgQ09ORklHX1cxX1NMQVZF
X1NNRU0gaXMgbm90IHNldApDT05GSUdfVzFfU0xBVkVfRFMyNDA1PW0KQ09ORklHX1cxX1NMQVZF
X0RTMjQwOD1tCkNPTkZJR19XMV9TTEFWRV9EUzI0MDhfUkVBREJBQ0s9eQojIENPTkZJR19XMV9T
TEFWRV9EUzI0MTMgaXMgbm90IHNldApDT05GSUdfVzFfU0xBVkVfRFMyNDA2PW0KQ09ORklHX1cx
X1NMQVZFX0RTMjQyMz1tCkNPTkZJR19XMV9TTEFWRV9EUzI4MDU9bQpDT05GSUdfVzFfU0xBVkVf
RFMyNDMwPW0KQ09ORklHX1cxX1NMQVZFX0RTMjQzMT1tCiMgQ09ORklHX1cxX1NMQVZFX0RTMjQz
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1cxX1NMQVZFX0RTMjQzOCBpcyBub3Qgc2V0CkNPTkZJR19X
MV9TTEFWRV9EUzI1MFg9bQpDT05GSUdfVzFfU0xBVkVfRFMyNzgwPW0KIyBDT05GSUdfVzFfU0xB
VkVfRFMyNzgxIGlzIG5vdCBzZXQKQ09ORklHX1cxX1NMQVZFX0RTMjhFMDQ9bQpDT05GSUdfVzFf
U0xBVkVfRFMyOEUxNz1tCiMgZW5kIG9mIDEtd2lyZSBTbGF2ZXMKCkNPTkZJR19QT1dFUl9SRVNF
VD15CkNPTkZJR19QT1dFUl9SRVNFVF9BUzM3MjI9eQpDT05GSUdfUE9XRVJfUkVTRVRfQVRDMjYw
WD1tCiMgQ09ORklHX1BPV0VSX1JFU0VUX0JSQ01LT05BIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9X
RVJfUkVTRVRfQlJDTVNUQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0dFTUlOSV9Q
T1dFUk9GRiBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9SRVNFVF9HUElPPXkKQ09ORklHX1BPV0VS
X1JFU0VUX0dQSU9fUkVTVEFSVD15CiMgQ09ORklHX1BPV0VSX1JFU0VUX09DRUxPVF9SRVNFVCBp
cyBub3Qgc2V0CkNPTkZJR19QT1dFUl9SRVNFVF9MVEMyOTUyPXkKIyBDT05GSUdfUE9XRVJfUkVT
RVRfTVQ2MzIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfUkVHVUxBVE9SIGlzIG5v
dCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfUkVTVEFSVCBpcyBub3Qgc2V0CkNPTkZJR19QT1dF
Ul9SRVNFVF9UUFM2NTA4Nj15CiMgQ09ORklHX1BPV0VSX1JFU0VUX0tFWVNUT05FIGlzIG5vdCBz
ZXQKQ09ORklHX1BPV0VSX1JFU0VUX1NZU0NPTj15CkNPTkZJR19QT1dFUl9SRVNFVF9TWVNDT05f
UE9XRVJPRkY9eQojIENPTkZJR19QT1dFUl9SRVNFVF9STU9CSUxFIGlzIG5vdCBzZXQKQ09ORklH
X1JFQk9PVF9NT0RFPXkKQ09ORklHX1NZU0NPTl9SRUJPT1RfTU9ERT1tCiMgQ09ORklHX1BPV0VS
X1JFU0VUX1NDMjdYWCBpcyBub3Qgc2V0CkNPTkZJR19OVk1FTV9SRUJPT1RfTU9ERT15CkNPTkZJ
R19QT1dFUl9TVVBQTFk9eQpDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHPXkKQ09ORklHX1BPV0VS
X1NVUFBMWV9IV01PTj15CiMgQ09ORklHX1BEQV9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dF
TkVSSUNfQURDX0JBVFRFUlkgaXMgbm90IHNldApDT05GSUdfSVA1WFhYX1BPV0VSPXkKIyBDT05G
SUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX0FEUDUwNjE9bQpDT05GSUdf
QkFUVEVSWV9BQ1Q4OTQ1QT1tCkNPTkZJR19CQVRURVJZX0NXMjAxNT15CkNPTkZJR19CQVRURVJZ
X0RTMjc2MD1tCkNPTkZJR19CQVRURVJZX0RTMjc4MD1tCiMgQ09ORklHX0JBVFRFUllfRFMyNzgx
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODIgaXMgbm90IHNldAojIENPTkZJR19C
QVRURVJZX0xFR09fRVYzIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfU0FNU1VOR19TREk9eQoj
IENPTkZJR19CQVRURVJZX1NCUyBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX1NCUz1tCkNPTkZJ
R19NQU5BR0VSX1NCUz1tCkNPTkZJR19CQVRURVJZX0JRMjdYWFg9bQojIENPTkZJR19CQVRURVJZ
X0JRMjdYWFhfSTJDIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfQlEyN1hYWF9IRFE9bQpDT05G
SUdfQkFUVEVSWV9EQTkwMzA9bQpDT05GSUdfQkFUVEVSWV9EQTkxNTA9eQojIENPTkZJR19BWFAy
MFhfUE9XRVIgaXMgbm90IHNldApDT05GSUdfQkFUVEVSWV9NQVgxNzA0MD15CkNPTkZJR19CQVRU
RVJZX01BWDE3MDQyPW0KQ09ORklHX0JBVFRFUllfTUFYMTcyMVg9bQojIENPTkZJR19DSEFSR0VS
X1BDRjUwNjMzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9JU1AxNzA0IGlzIG5vdCBzZXQK
Q09ORklHX0NIQVJHRVJfTUFYODkwMz15CkNPTkZJR19DSEFSR0VSX1RXTDQwMzA9bQpDT05GSUdf
Q0hBUkdFUl9MUDg3Mjc9eQpDT05GSUdfQ0hBUkdFUl9MUDg3ODg9bQpDT05GSUdfQ0hBUkdFUl9H
UElPPW0KIyBDT05GSUdfQ0hBUkdFUl9NQU5BR0VSIGlzIG5vdCBzZXQKQ09ORklHX0NIQVJHRVJf
TFQzNjUxPXkKIyBDT05GSUdfQ0hBUkdFUl9MVEM0MTYyTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfTUFYMTQ1NzcgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9ERVRFQ1RPUl9NQVgxNDY1
Nj1tCkNPTkZJR19DSEFSR0VSX01BWDc3NjUwPXkKQ09ORklHX0NIQVJHRVJfTUFYNzc2OTM9bQpD
T05GSUdfQ0hBUkdFUl9NQVg3Nzk3Nj15CkNPTkZJR19DSEFSR0VSX01BWDg5OTc9bQojIENPTkZJ
R19DSEFSR0VSX1FDT01fU01CQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDE1WCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDE5MCBpcyBub3Qgc2V0CkNPTkZJR19DSEFS
R0VSX0JRMjQyNTc9bQpDT05GSUdfQ0hBUkdFUl9CUTI0NzM1PW0KQ09ORklHX0NIQVJHRVJfQlEy
NTE1WD1tCkNPTkZJR19DSEFSR0VSX0JRMjU4OTA9eQpDT05GSUdfQ0hBUkdFUl9CUTI1OTgwPXkK
Q09ORklHX0NIQVJHRVJfQlEyNTZYWD1tCkNPTkZJR19DSEFSR0VSX1NNQjM0Nz1tCkNPTkZJR19D
SEFSR0VSX1RQUzY1MDkwPW0KQ09ORklHX0NIQVJHRVJfVFBTNjUyMTc9bQojIENPTkZJR19CQVRU
RVJZX0dBVUdFX0xUQzI5NDEgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0dPTERGSVNIIGlz
IG5vdCBzZXQKQ09ORklHX0JBVFRFUllfUlQ1MDMzPXkKQ09ORklHX0NIQVJHRVJfUlQ5NDU1PXkK
IyBDT05GSUdfQ0hBUkdFUl9TQzI3MzEgaXMgbm90IHNldAojIENPTkZJR19GVUVMX0dBVUdFX1ND
MjdYWCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX1VDUzEwMDI9eQpDT05GSUdfQ0hBUkdFUl9C
RDk5OTU0PXkKQ09ORklHX1JONVQ2MThfUE9XRVI9bQojIENPTkZJR19CQVRURVJZX1VHMzEwNSBp
cyBub3Qgc2V0CkNPTkZJR19IV01PTj15CkNPTkZJR19IV01PTl9WSUQ9eQojIENPTkZJR19IV01P
Tl9ERUJVR19DSElQIGlzIG5vdCBzZXQKCiMKIyBOYXRpdmUgZHJpdmVycwojCkNPTkZJR19TRU5T
T1JTX0FENzQxND15CkNPTkZJR19TRU5TT1JTX0FENzQxOD1tCkNPTkZJR19TRU5TT1JTX0FETTEw
MjE9bQojIENPTkZJR19TRU5TT1JTX0FETTEwMjUgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19B
RE0xMDI2PW0KIyBDT05GSUdfU0VOU09SU19BRE0xMDI5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19BRE0xMDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMTc3IGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfQURNOTI0MD1tCkNPTkZJR19TRU5TT1JTX0FEVDdYMTA9eQpDT05G
SUdfU0VOU09SU19BRFQ3NDEwPXkKQ09ORklHX1NFTlNPUlNfQURUNzQxMT1tCkNPTkZJR19TRU5T
T1JTX0FEVDc0NjI9eQpDT05GSUdfU0VOU09SU19BRFQ3NDcwPW0KQ09ORklHX1NFTlNPUlNfQURU
NzQ3NT1tCkNPTkZJR19TRU5TT1JTX0FIVDEwPW0KIyBDT05GSUdfU0VOU09SU19BUzM3MCBpcyBu
b3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FTQzc2MjE9bQojIENPTkZJR19TRU5TT1JTX0FYSV9GQU5f
Q09OVFJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVNCMTAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19BU1BFRUQgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19BVFhQMT15CiMg
Q09ORklHX1NFTlNPUlNfQlQxX1BWVCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0NPUlNBSVJf
Q1BSTz1tCkNPTkZJR19TRU5TT1JTX0NPUlNBSVJfUFNVPW0KQ09ORklHX1NFTlNPUlNfRFM2MjA9
bQpDT05GSUdfU0VOU09SU19EUzE2MjE9eQpDT05GSUdfU0VOU09SU19EQTkwNTU9eQojIENPTkZJ
R19TRU5TT1JTX1NQQVJYNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRjcxODA1RiBpcyBu
b3Qgc2V0CkNPTkZJR19TRU5TT1JTX0Y3MTg4MkZHPW0KQ09ORklHX1NFTlNPUlNfRjc1Mzc1Uz15
CkNPTkZJR19TRU5TT1JTX0dTQz15CkNPTkZJR19TRU5TT1JTX01DMTM3ODNfQURDPXkKIyBDT05G
SUdfU0VOU09SU19GU0NITUQgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19GVFNURVVUQVRFUz1t
CiMgQ09ORklHX1NFTlNPUlNfR0w1MThTTSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0dMNTIw
U009bQpDT05GSUdfU0VOU09SU19HNzYwQT1tCkNPTkZJR19TRU5TT1JTX0c3NjI9eQojIENPTkZJ
R19TRU5TT1JTX0dQSU9fRkFOIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19ISUg2MTMwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JQk1BRU0gaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0lCTVBFWCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0lJT19IV01PTj1tCkNPTkZJR19T
RU5TT1JTX0lUODc9eQojIENPTkZJR19TRU5TT1JTX0pDNDIgaXMgbm90IHNldApDT05GSUdfU0VO
U09SU19QT1dSMTIyMD1tCiMgQ09ORklHX1NFTlNPUlNfTEFOOTY2WCBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX0xJTkVBR0U9eQojIENPTkZJR19TRU5TT1JTX0xPQ0hOQUdBUiBpcyBub3Qgc2V0
CkNPTkZJR19TRU5TT1JTX0xUQzI5NDU9eQojIENPTkZJR19TRU5TT1JTX0xUQzI5NDdfSTJDIGlz
IG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTFRDMjk5MD15CkNPTkZJR19TRU5TT1JTX0xUQzI5OTI9
bQojIENPTkZJR19TRU5TT1JTX0xUQzQxNTEgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MVEM0
MjE1PW0KQ09ORklHX1NFTlNPUlNfTFRDNDIyMj15CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI0NSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2MCBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX0xUQzQyNjE9bQpDT05GSUdfU0VOU09SU19NQVgxMjc9eQojIENPTkZJR19TRU5TT1JTX01B
WDE2MDY1IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTUFYMTYxOT1tCkNPTkZJR19TRU5TT1JT
X01BWDE2Njg9bQojIENPTkZJR19TRU5TT1JTX01BWDE5NyBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX01BWDMxNzMwPW0KQ09ORklHX1NFTlNPUlNfTUFYNjYyMD1tCkNPTkZJR19TRU5TT1JTX01B
WDY2MjE9bQojIENPTkZJR19TRU5TT1JTX01BWDY2MzkgaXMgbm90IHNldApDT05GSUdfU0VOU09S
U19NQVg2NjQyPW0KQ09ORklHX1NFTlNPUlNfTUFYNjY1MD15CkNPTkZJR19TRU5TT1JTX01BWDY2
OTc9eQojIENPTkZJR19TRU5TT1JTX01BWDMxNzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19NQ1AzMDIxIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVEM2NTQ9bQojIENPTkZJR19TRU5T
T1JTX1RQUzIzODYxIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTVI3NTIwMz15CiMgQ09ORklH
X1NFTlNPUlNfTE02MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03MyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTE03NSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNNzc9bQpD
T05GSUdfU0VOU09SU19MTTc4PW0KIyBDT05GSUdfU0VOU09SU19MTTgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MTTgzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTE04NT1tCiMgQ09O
RklHX1NFTlNPUlNfTE04NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05MCBpcyBub3Qg
c2V0CkNPTkZJR19TRU5TT1JTX0xNOTI9eQpDT05GSUdfU0VOU09SU19MTTkzPXkKQ09ORklHX1NF
TlNPUlNfTE05NTIzND15CiMgQ09ORklHX1NFTlNPUlNfTE05NTI0MSBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX0xNOTUyNDU9eQpDT05GSUdfU0VOU09SU19QQzg3MzYwPW0KIyBDT05GSUdfU0VO
U09SU19QQzg3NDI3IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTlRDX1RIRVJNSVNUT1I9bQoj
IENPTkZJR19TRU5TT1JTX05DVDY2ODMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19OQ1Q2Nzc1
X0NPUkU9eQpDT05GSUdfU0VOU09SU19OQ1Q2Nzc1PW0KQ09ORklHX1NFTlNPUlNfTkNUNjc3NV9J
MkM9eQojIENPTkZJR19TRU5TT1JTX05DVDc4MDIgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19O
Q1Q3OTA0PW0KIyBDT05GSUdfU0VOU09SU19OUENNN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19OU0EzMjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX09DQ19QOF9JMkMgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX09DQ19QOV9TQkUgaXMgbm90IHNldApDT05GSUdfU0VOU09S
U19QQ0Y4NTkxPW0KQ09ORklHX1NFTlNPUlNfUEVDSV9DUFVURU1QPXkKIyBDT05GSUdfU0VOU09S
U19QRUNJX0RJTU1URU1QIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfUEVDST15CiMgQ09ORklH
X1BNQlVTIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfUFdNX0ZBTj15CiMgQ09ORklHX1NFTlNP
UlNfUkFTUEJFUlJZUElfSFdNT04gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NMMjhDUExE
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TQlRTSSBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX1NCUk1JPXkKQ09ORklHX1NFTlNPUlNfU0hUMTU9bQpDT05GSUdfU0VOU09SU19TSFQyMT1t
CiMgQ09ORklHX1NFTlNPUlNfU0hUM3ggaXMgbm90IHNldApDT05GSUdfU0VOU09SU19TSFQ0eD15
CiMgQ09ORklHX1NFTlNPUlNfU0hUQzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NZNzYz
NkEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RNRTE3MzcgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0VNQzE0MDMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19FTUMyMTAzPXkKQ09O
RklHX1NFTlNPUlNfRU1DNlcyMDE9eQpDT05GSUdfU0VOU09SU19TTVNDNDdNMT1tCkNPTkZJR19T
RU5TT1JTX1NNU0M0N00xOTI9bQpDT05GSUdfU0VOU09SU19TTVNDNDdCMzk3PW0KQ09ORklHX1NF
TlNPUlNfU0NINTZYWF9DT01NT049eQpDT05GSUdfU0VOU09SU19TQ0g1NjI3PXkKQ09ORklHX1NF
TlNPUlNfU0NINTYzNj15CkNPTkZJR19TRU5TT1JTX1NUVFM3NTE9eQojIENPTkZJR19TRU5TT1JT
X1NNTTY2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURDMTI4RDgxOCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfQURTNzgyOCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FNQzY4
MjE9bQpDT05GSUdfU0VOU09SU19JTkEyMDk9eQojIENPTkZJR19TRU5TT1JTX0lOQTJYWCBpcyBu
b3Qgc2V0CkNPTkZJR19TRU5TT1JTX0lOQTIzOD1tCiMgQ09ORklHX1NFTlNPUlNfSU5BMzIyMSBp
cyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1RDNzQ9bQpDT05GSUdfU0VOU09SU19USE1DNTA9bQpD
T05GSUdfU0VOU09SU19UTVAxMDI9eQpDT05GSUdfU0VOU09SU19UTVAxMDM9eQpDT05GSUdfU0VO
U09SU19UTVAxMDg9bQpDT05GSUdfU0VOU09SU19UTVA0MDE9eQpDT05GSUdfU0VOU09SU19UTVA0
MjE9eQpDT05GSUdfU0VOU09SU19UTVA0NjQ9bQojIENPTkZJR19TRU5TT1JTX1RNUDUxMyBpcyBu
b3Qgc2V0CkNPTkZJR19TRU5TT1JTX1ZUMTIxMT1tCkNPTkZJR19TRU5TT1JTX1c4Mzc3M0c9eQpD
T05GSUdfU0VOU09SU19XODM3ODFEPW0KQ09ORklHX1NFTlNPUlNfVzgzNzkxRD1tCkNPTkZJR19T
RU5TT1JTX1c4Mzc5MkQ9eQpDT05GSUdfU0VOU09SU19XODM3OTM9eQpDT05GSUdfU0VOU09SU19X
ODM3OTU9eQpDT05GSUdfU0VOU09SU19XODM3OTVfRkFOQ1RSTD15CiMgQ09ORklHX1NFTlNPUlNf
VzgzTDc4NVRTIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVzgzTDc4Nk5HPW0KIyBDT05GSUdf
U0VOU09SU19XODM2MjdIRiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1c4MzYyN0VIRj1tCkNP
TkZJR19USEVSTUFMPXkKQ09ORklHX1RIRVJNQUxfU1RBVElTVElDUz15CkNPTkZJR19USEVSTUFM
X0VNRVJHRU5DWV9QT1dFUk9GRl9ERUxBWV9NUz0wCkNPTkZJR19USEVSTUFMX0hXTU9OPXkKQ09O
RklHX1RIRVJNQUxfT0Y9eQpDT05GSUdfVEhFUk1BTF9XUklUQUJMRV9UUklQUz15CkNPTkZJR19U
SEVSTUFMX0RFRkFVTFRfR09WX1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9H
T1ZfRkFJUl9TSEFSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfVVNF
Ul9TUEFDRSBpcyBub3Qgc2V0CkNPTkZJR19USEVSTUFMX0dPVl9GQUlSX1NIQVJFPXkKQ09ORklH
X1RIRVJNQUxfR09WX1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJNQUxfR09WX0JBTkdfQkFORyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BBQ0UgaXMgbm90IHNldAojIENP
TkZJR19DUFVfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVkZSRVFfVEhFUk1BTCBpcyBu
b3Qgc2V0CkNPTkZJR19USEVSTUFMX0VNVUxBVElPTj15CiMgQ09ORklHX1RIRVJNQUxfTU1JTyBp
cyBub3Qgc2V0CkNPTkZJR19ISVNJX1RIRVJNQUw9eQojIENPTkZJR19JTVhfVEhFUk1BTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lNWDhNTV9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSzNfVEhF
Uk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1FPUklRX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJ
R19TUEVBUl9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOOElfVEhFUk1BTCBpcyBub3Qg
c2V0CiMgQ09ORklHX1JPQ0tDSElQX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19SQ0FSX1RI
RVJNQUwgaXMgbm90IHNldAojIENPTkZJR19SQ0FSX0dFTjNfVEhFUk1BTCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JaRzJMX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19LSVJLV09PRF9USEVSTUFM
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE9WRV9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJN
QURBX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19EQTkwNjJfVEhFUk1BTCBpcyBub3Qgc2V0
CkNPTkZJR19NVEtfVEhFUk1BTD15CgojCiMgSW50ZWwgdGhlcm1hbCBkcml2ZXJzCiMKCiMKIyBB
Q1BJIElOVDM0MFggdGhlcm1hbCBkcml2ZXJzCiMKIyBlbmQgb2YgQUNQSSBJTlQzNDBYIHRoZXJt
YWwgZHJpdmVycwojIGVuZCBvZiBJbnRlbCB0aGVybWFsIGRyaXZlcnMKCiMKIyBCcm9hZGNvbSB0
aGVybWFsIGRyaXZlcnMKIwojIENPTkZJR19CQ00yNzExX1RIRVJNQUwgaXMgbm90IHNldAojIENP
TkZJR19CQ00yODM1X1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19CUkNNU1RCX1RIRVJNQUwg
aXMgbm90IHNldAojIENPTkZJR19CQ01fTlNfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX0JD
TV9TUl9USEVSTUFMIGlzIG5vdCBzZXQKIyBlbmQgb2YgQnJvYWRjb20gdGhlcm1hbCBkcml2ZXJz
CgojCiMgVGV4YXMgSW5zdHJ1bWVudHMgdGhlcm1hbCBkcml2ZXJzCiMKIyBDT05GSUdfVElfU09D
X1RIRVJNQUwgaXMgbm90IHNldAojIGVuZCBvZiBUZXhhcyBJbnN0cnVtZW50cyB0aGVybWFsIGRy
aXZlcnMKCiMKIyBTYW1zdW5nIHRoZXJtYWwgZHJpdmVycwojCiMgQ09ORklHX0VYWU5PU19USEVS
TUFMIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2Ftc3VuZyB0aGVybWFsIGRyaXZlcnMKCiMKIyBOVklE
SUEgVGVncmEgdGhlcm1hbCBkcml2ZXJzCiMKIyBDT05GSUdfVEVHUkFfU09DVEhFUk0gaXMgbm90
IHNldAojIENPTkZJR19URUdSQV9CUE1QX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19URUdS
QTMwX1RTRU5TT1IgaXMgbm90IHNldAojIGVuZCBvZiBOVklESUEgVGVncmEgdGhlcm1hbCBkcml2
ZXJzCgpDT05GSUdfR0VORVJJQ19BRENfVEhFUk1BTD1tCgojCiMgUXVhbGNvbW0gdGhlcm1hbCBk
cml2ZXJzCiMKIyBDT05GSUdfUUNPTV9TUE1JX0FEQ19UTTUgaXMgbm90IHNldAojIENPTkZJR19R
Q09NX1NQTUlfVEVNUF9BTEFSTSBpcyBub3Qgc2V0CiMgZW5kIG9mIFF1YWxjb21tIHRoZXJtYWwg
ZHJpdmVycwoKIyBDT05GSUdfVU5JUEhJRVJfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQ
UkRfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19XQVRDSERPRz15CkNPTkZJR19XQVRDSERPR19D
T1JFPXkKQ09ORklHX1dBVENIRE9HX05PV0FZT1VUPXkKIyBDT05GSUdfV0FUQ0hET0dfSEFORExF
X0JPT1RfRU5BQkxFRCBpcyBub3Qgc2V0CkNPTkZJR19XQVRDSERPR19PUEVOX1RJTUVPVVQ9MApD
T05GSUdfV0FUQ0hET0dfU1lTRlM9eQojIENPTkZJR19XQVRDSERPR19IUlRJTUVSX1BSRVRJTUVP
VVQgaXMgbm90IHNldAoKIwojIFdhdGNoZG9nIFByZXRpbWVvdXQgR292ZXJub3JzCiMKIyBDT05G
SUdfV0FUQ0hET0dfUFJFVElNRU9VVF9HT1YgaXMgbm90IHNldAoKIwojIFdhdGNoZG9nIERldmlj
ZSBEcml2ZXJzCiMKQ09ORklHX1NPRlRfV0FUQ0hET0c9eQojIENPTkZJR19EQTkwNTJfV0FUQ0hE
T0cgaXMgbm90IHNldApDT05GSUdfREE5MDU1X1dBVENIRE9HPW0KIyBDT05GSUdfREE5MDYzX1dB
VENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfREE5MDYyX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09O
RklHX0dQSU9fV0FUQ0hET0c9bQojIENPTkZJR19NRU5GMjFCTUNfV0FUQ0hET0cgaXMgbm90IHNl
dApDT05GSUdfWElMSU5YX1dBVENIRE9HPW0KIyBDT05GSUdfWklJUkFWRV9XQVRDSERPRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JBVkVfU1BfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19TTDI4
Q1BMRF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTUFEQV8zN1hYX1dBVENIRE9HIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVNNOTI2MF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FU
OTFSTTkyMDBfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19BVDkxU0FNOVhfV0FUQ0hET0cg
aXMgbm90IHNldAojIENPTkZJR19TQU1BNUQ0X1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0FERU5DRV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZUV0RUMDEwX1dBVENIRE9HIGlz
IG5vdCBzZXQKIyBDT05GSUdfUzNDMjQxMF9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19EV19X
QVRDSERPRz15CiMgQ09ORklHX0VQOTNYWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX09N
QVBfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19QTlg0MDA4X1dBVENIRE9HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREFWSU5DSV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0szX1JUSV9X
QVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1JONVQ2MThfV0FUQ0hET0cgaXMgbm90IHNldAoj
IENPTkZJR19TVU5YSV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX05QQ003WFhfV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19UV0w0MDMwX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1RNUDNYWFhfUlRDX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfVFM0ODAwX1dBVENI
RE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfVFM3MlhYX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUFYNjNYWF9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19NQVg3NzYyMF9XQVRDSERPRz1t
CiMgQ09ORklHX0lNWDJfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1YN1VMUF9XRFQgaXMgbm90
IHNldAojIENPTkZJR19SRVRVX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9YQVJUX1dE
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUX0xQQ19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFR1JBX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9XRFQgaXMgbm90IHNldAoj
IENPTkZJR19NRVNPTl9HWEJCX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVTT05fV0FU
Q0hET0cgaXMgbm90IHNldAojIENPTkZJR19NRURJQVRFS19XQVRDSERPRyBpcyBub3Qgc2V0CiMg
Q09ORklHX0RJR0lDT0xPUl9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0xQQzE4WFhfV0FU
Q0hET0cgaXMgbm90IHNldAojIENPTkZJR19SRU5FU0FTX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFTkVTQVNfUlpBV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVORVNBU19SWk4xV0RUIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVORVNBU19SWkcyTFdEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FTUEVF
RF9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19TVFBNSUMxX1dBVENIRE9HPW0KIyBDT05GSUdf
VU5JUEhJRVJfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19SVEQxMTlYX1dBVENIRE9HIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1BSRF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJU0NP
TlRJX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfTVNDMzEzRV9XQVRDSERPRyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FQUExFX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOUExVU19X
QVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDNTIwX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0JDTTQ3WFhfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNMjgzNV9XRFQgaXMgbm90IHNldAoj
IENPTkZJR19CQ01fS09OQV9XRFQgaXMgbm90IHNldAojIENPTkZJR19CQ003MDM4X1dEVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lNR1BEQ19XRFQgaXMgbm90IHNldAojIENPTkZJR19NUEM1MjAwX1dE
VCBpcyBub3Qgc2V0CkNPTkZJR19NRU5fQTIxX1dEVD1tCiMgQ09ORklHX1VNTF9XQVRDSERPRyBp
cyBub3Qgc2V0CgojCiMgVVNCLWJhc2VkIFdhdGNoZG9nIENhcmRzCiMKQ09ORklHX1VTQlBDV0FU
Q0hET0c9bQoKIwojIE11bHRpZnVuY3Rpb24gZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdfTUZEX0NP
UkU9eQpDT05GSUdfTUZEX0FDVDg5NDVBPXkKIyBDT05GSUdfTUZEX1NVTjRJX0dQQURDIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0FTMzcxMSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfQVMzNzIyPW0K
IyBDT05GSUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FBVDI4NzBfQ09S
RSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BVDkxX1VTQVJUIGlzIG5vdCBzZXQKQ09ORklHX01G
RF9BVE1FTF9GTEVYQ09NPXkKQ09ORklHX01GRF9BVE1FTF9ITENEQz15CkNPTkZJR19NRkRfQkNN
NTkwWFg9bQpDT05GSUdfTUZEX0JEOTU3MU1XVj1tCkNPTkZJR19NRkRfQVhQMjBYPW0KQ09ORklH
X01GRF9BWFAyMFhfSTJDPW0KIyBDT05GSUdfTUZEX01BREVSQSBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9BU0lDMyBpcyBub3Qgc2V0CkNPTkZJR19QTUlDX0RBOTAzWD15CiMgQ09ORklHX01GRF9E
QTkwNTJfSTJDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9EQTkwNTU9eQojIENPTkZJR19NRkRfREE5
MDYyIGlzIG5vdCBzZXQKQ09ORklHX01GRF9EQTkwNjM9bQpDT05GSUdfTUZEX0RBOTE1MD15CiMg
Q09ORklHX01GRF9ETE4yIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0VORV9LQjM5MzAgaXMgbm90
IHNldAojIENPTkZJR19NRkRfRVhZTk9TX0xQQVNTIGlzIG5vdCBzZXQKQ09ORklHX01GRF9HQVRF
V09SS1NfR1NDPXkKQ09ORklHX01GRF9NQzEzWFhYPXkKQ09ORklHX01GRF9NQzEzWFhYX0kyQz15
CkNPTkZJR19NRkRfTVAyNjI5PXkKIyBDT05GSUdfTUZEX01YU19MUkFEQyBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9NWDI1X1RTQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0hJNjQyMV9QTUlD
IGlzIG5vdCBzZXQKQ09ORklHX01GRF9ISTY0MjFfU1BNST15CiMgQ09ORklHX01GRF9ISTY1NVhf
UE1JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hUQ19QQVNJQzMgaXMgbm90IHNldAojIENPTkZJR19I
VENfSTJDUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lRUzYyWCBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9LRU1QTEQgaXMgbm90IHNldApDT05GSUdfTUZEXzg4UE04MDA9bQpDT05GSUdfTUZE
Xzg4UE04MDU9bQojIENPTkZJR19NRkRfODhQTTg2MFggaXMgbm90IHNldApDT05GSUdfTUZEX01B
WDE0NTc3PW0KIyBDT05GSUdfTUZEX01BWDc3NjIwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQVg3
NzY1MD15CiMgQ09ORklHX01GRF9NQVg3NzY4NiBpcyBub3Qgc2V0CkNPTkZJR19NRkRfTUFYNzc2
OTM9eQpDT05GSUdfTUZEX01BWDc3NzE0PW0KIyBDT05GSUdfTUZEX01BWDc3ODQzIGlzIG5vdCBz
ZXQKQ09ORklHX01GRF9NQVg4OTA3PW0KIyBDT05GSUdfTUZEX01BWDg5MjUgaXMgbm90IHNldApD
T05GSUdfTUZEX01BWDg5OTc9eQpDT05GSUdfTUZEX01BWDg5OTg9eQojIENPTkZJR19NRkRfTVQ2
MzYwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9NVDYzOTc9bQojIENPTkZJR19NRkRfTUVORjIxQk1D
IGlzIG5vdCBzZXQKQ09ORklHX01GRF9WSVBFUkJPQVJEPXkKIyBDT05GSUdfTUZEX05UWEVDIGlz
IG5vdCBzZXQKQ09ORklHX01GRF9SRVRVPW0KQ09ORklHX01GRF9QQ0Y1MDYzMz1tCkNPTkZJR19Q
Q0Y1MDYzM19BREM9bQpDT05GSUdfUENGNTA2MzNfR1BJTz1tCiMgQ09ORklHX01GRF9QTThYWFgg
aXMgbm90IHNldAojIENPTkZJR19NRkRfU1BNSV9QTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1JUNDgzMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SVDUwMzMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfUkM1VDU4MyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfUks4MDg9bQpDT05GSUdfTUZEX1JO
NVQ2MTg9eQpDT05GSUdfTUZEX1NFQ19DT1JFPW0KQ09ORklHX01GRF9TSTQ3NlhfQ09SRT15CkNP
TkZJR19NRkRfU0lNUExFX01GRF9JMkM9bQojIENPTkZJR19NRkRfU0wyOENQTEQgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfU0tZODE0NTIgaXMgbm90IHNldAojIENPTkZJR19BQlg1MDBfQ09SRSBp
cyBub3Qgc2V0CkNPTkZJR19NRkRfU1RNUEU9eQoKIwojIFNUTWljcm9lbGVjdHJvbmljcyBTVE1Q
RSBJbnRlcmZhY2UgRHJpdmVycwojCiMgQ09ORklHX1NUTVBFX0kyQyBpcyBub3Qgc2V0CiMgZW5k
IG9mIFNUTWljcm9lbGVjdHJvbmljcyBTVE1QRSBJbnRlcmZhY2UgRHJpdmVycwoKIyBDT05GSUdf
TUZEX1NVTjZJX1BSQ00gaXMgbm90IHNldApDT05GSUdfTUZEX1NZU0NPTj15CkNPTkZJR19NRkRf
VElfQU0zMzVYX1RTQ0FEQz15CkNPTkZJR19NRkRfTFAzOTQzPXkKQ09ORklHX01GRF9MUDg3ODg9
eQpDT05GSUdfTUZEX1RJX0xNVT15CiMgQ09ORklHX01GRF9QQUxNQVMgaXMgbm90IHNldApDT05G
SUdfVFBTNjEwNVg9bQpDT05GSUdfVFBTNjUwMTA9bQpDT05GSUdfVFBTNjUwN1g9eQpDT05GSUdf
TUZEX1RQUzY1MDg2PXkKQ09ORklHX01GRF9UUFM2NTA5MD15CkNPTkZJR19NRkRfVFBTNjUyMTc9
bQojIENPTkZJR19NRkRfVElfTFA4NzNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xQODc1
NjUgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUyMTggaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjU4NlggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTAgaXMgbm90IHNldApD
T05GSUdfTUZEX1RQUzY1OTEyPW0KQ09ORklHX01GRF9UUFM2NTkxMl9JMkM9bQpDT05GSUdfVFdM
NDAzMF9DT1JFPXkKQ09ORklHX01GRF9UV0w0MDMwX0FVRElPPXkKIyBDT05GSUdfVFdMNjA0MF9D
T1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX0xNMzUzMyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfVEMzNTg5WD15CkNPTkZJR19NRkRf
VFFNWDg2PW0KQ09ORklHX01GRF9MT0NITkFHQVI9eQojIENPTkZJR19NRkRfQVJJWk9OQV9JMkMg
aXMgbm90IHNldApDT05GSUdfTUZEX1dNODQwMD15CiMgQ09ORklHX01GRF9XTTgzMVhfSTJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNODM1MF9JMkMgaXMgbm90IHNldApDT05GSUdfTUZEX1dN
ODk5ND15CiMgQ09ORklHX01GRF9TVFc0ODFYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JPSE1f
QkQ3MThYWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9ST0hNX0JENzE4MjggaXMgbm90IHNldAoj
IENPTkZJR19NRkRfUk9ITV9CRDk1N1hNVUYgaXMgbm90IHNldAojIENPTkZJR19NRkRfU1RNMzJf
TFBUSU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TVE0zMl9USU1FUlMgaXMgbm90IHNldApD
T05GSUdfTUZEX1NUUE1JQzE9bQpDT05GSUdfTUZEX1NUTUZYPW0KQ09ORklHX01GRF9BVEMyNjBY
PW0KQ09ORklHX01GRF9BVEMyNjBYX0kyQz1tCiMgQ09ORklHX01GRF9LSEFEQVNfTUNVIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0FDRVJfQTUwMF9FQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9R
Q09NX1BNODAwOCBpcyBub3Qgc2V0CkNPTkZJR19SQVZFX1NQX0NPUkU9bQojIENPTkZJR19NRkRf
UlNNVV9JMkMgaXMgbm90IHNldAojIGVuZCBvZiBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJz
CgpDT05GSUdfUkVHVUxBVE9SPXkKIyBDT05GSUdfUkVHVUxBVE9SX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX1JFR1VMQVRPUl9GSVhFRF9WT0xUQUdFPXkKIyBDT05GSUdfUkVHVUxBVE9SX1ZJUlRV
QUxfQ09OU1VNRVIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVVNFUlNQQUNFX0NPTlNV
TUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SXzg4UEc4NlggaXMgbm90IHNldApDT05G
SUdfUkVHVUxBVE9SXzg4UE04MDA9bQojIENPTkZJR19SRUdVTEFUT1JfQUNUODg2NSBpcyBub3Qg
c2V0CiMgQ09ORklHX1JFR1VMQVRPUl9BQ1Q4OTQ1QSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VM
QVRPUl9BRDUzOTggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfQU5BVE9QIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9BUzM3MjI9bQojIENPTkZJR19SRUdVTEFUT1JfQVRDMjYwWCBp
cyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfQVhQMjBYPW0KIyBDT05GSUdfUkVHVUxBVE9SX0JD
TTU5MFhYIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9CRDk1NzFNV1Y9bQojIENPTkZJR19S
RUdVTEFUT1JfREE5MDNYIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9EQTkwNTU9bQpDT05G
SUdfUkVHVUxBVE9SX0RBOTA2Mz1tCkNPTkZJR19SRUdVTEFUT1JfREE5MTIxPXkKIyBDT05GSUdf
UkVHVUxBVE9SX0RBOTIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9EQTkyMTEgaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfRkFONTM1NTUgaXMgbm90IHNldApDT05GSUdfUkVH
VUxBVE9SX0ZBTjUzODgwPXkKIyBDT05GSUdfUkVHVUxBVE9SX0dQSU8gaXMgbm90IHNldApDT05G
SUdfUkVHVUxBVE9SX0hJNjQyMVY2MDA9bQojIENPTkZJR19SRUdVTEFUT1JfSVNMOTMwNSBpcyBu
b3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfSVNMNjI3MUE9bQojIENPTkZJR19SRUdVTEFUT1JfTE0z
NjNYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xPQ0hOQUdBUiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9MUDM5NzEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFAz
OTcyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9MUDg3Mlg9eQojIENPTkZJR19SRUdVTEFU
T1JfTFA4NzU1IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xQODc4OCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9MVEMzNTg5IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9M
VEMzNjc2PXkKQ09ORklHX1JFR1VMQVRPUl9NQVgxNDU3Nz1tCkNPTkZJR19SRUdVTEFUT1JfTUFY
MTU4Nj1tCiMgQ09ORklHX1JFR1VMQVRPUl9NQVg3NzYyMCBpcyBub3Qgc2V0CkNPTkZJR19SRUdV
TEFUT1JfTUFYNzc2NTA9eQojIENPTkZJR19SRUdVTEFUT1JfTUFYODY0OSBpcyBub3Qgc2V0CkNP
TkZJR19SRUdVTEFUT1JfTUFYODY2MD15CkNPTkZJR19SRUdVTEFUT1JfTUFYODg5Mz15CiMgQ09O
RklHX1JFR1VMQVRPUl9NQVg4OTA3IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg4OTUy
PXkKQ09ORklHX1JFR1VMQVRPUl9NQVg4OTczPW0KQ09ORklHX1JFR1VMQVRPUl9NQVg4OTk3PXkK
IyBDT05GSUdfUkVHVUxBVE9SX01BWDg5OTggaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX01B
WDIwMDg2PW0KIyBDT05GSUdfUkVHVUxBVE9SX01BWDc3Njg2IGlzIG5vdCBzZXQKQ09ORklHX1JF
R1VMQVRPUl9NQVg3NzY5Mz1tCiMgQ09ORklHX1JFR1VMQVRPUl9NQVg3NzgwMiBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg3NzgyNiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1Jf
TUMxM1hYWF9DT1JFPXkKQ09ORklHX1JFR1VMQVRPUl9NQzEzNzgzPW0KQ09ORklHX1JFR1VMQVRP
Ul9NQzEzODkyPXkKQ09ORklHX1JFR1VMQVRPUl9NQ1AxNjUwMj1tCkNPTkZJR19SRUdVTEFUT1Jf
TVA1NDE2PW0KQ09ORklHX1JFR1VMQVRPUl9NUDg4NTk9eQojIENPTkZJR19SRUdVTEFUT1JfTVA4
ODZYIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NUFE3OTIwPXkKQ09ORklHX1JFR1VMQVRP
Ul9NVDYzMTE9eQpDT05GSUdfUkVHVUxBVE9SX01UNjMxNT15CiMgQ09ORklHX1JFR1VMQVRPUl9N
VDYzMjMgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTVQ2MzU4IGlzIG5vdCBzZXQKIyBD
T05GSUdfUkVHVUxBVE9SX01UNjM1OSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NVDYz
OTcgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUEJJQVMgaXMgbm90IHNldApDT05GSUdf
UkVHVUxBVE9SX1BDQTk0NTA9bQojIENPTkZJR19SRUdVTEFUT1JfUENGNTA2MzMgaXMgbm90IHNl
dAojIENPTkZJR19SRUdVTEFUT1JfUEY4WDAwIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9Q
RlVaRTEwMD15CkNPTkZJR19SRUdVTEFUT1JfUFY4ODA2MD15CkNPTkZJR19SRUdVTEFUT1JfUFY4
ODA4MD15CkNPTkZJR19SRUdVTEFUT1JfUFY4ODA5MD1tCiMgQ09ORklHX1JFR1VMQVRPUl9QV00g
aXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUUNPTV9SUE1IIGlzIG5vdCBzZXQKQ09ORklH
X1JFR1VMQVRPUl9RQ09NX1NQTUk9bQojIENPTkZJR19SRUdVTEFUT1JfUUNPTV9VU0JfVkJVUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SQVNQQkVSUllQSV9UT1VDSFNDUkVFTl9BVFRJ
TlkgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1JLODA4PW0KQ09ORklHX1JFR1VMQVRPUl9S
TjVUNjE4PXkKQ09ORklHX1JFR1VMQVRPUl9SVDQ4MDE9eQpDT05GSUdfUkVHVUxBVE9SX1JUNTE5
MEE9bQojIENPTkZJR19SRUdVTEFUT1JfUlQ1NzU5IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRP
Ul9SVDYxNjA9eQpDT05GSUdfUkVHVUxBVE9SX1JUNjI0NT1tCkNPTkZJR19SRUdVTEFUT1JfUlRR
MjEzND1tCkNPTkZJR19SRUdVTEFUT1JfUlRNVjIwPW0KQ09ORklHX1JFR1VMQVRPUl9SVFE2NzUy
PW0KIyBDT05GSUdfUkVHVUxBVE9SX1MyTVBBMDEgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9S
X1MyTVBTMTE9bQpDT05GSUdfUkVHVUxBVE9SX1M1TTg3Njc9bQojIENPTkZJR19SRUdVTEFUT1Jf
U0MyNzMxIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1NMRzUxMDAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX1NUTTMyX0JPT1NURVIgaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfU1RNMzJfVlJFRkJVRiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9TVE0zMl9Q
V1IgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1NUUE1JQzE9bQojIENPTkZJR19SRUdVTEFU
T1JfVElfQUJCIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1NUVzQ4MVhfVk1NQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9TWTc2MzZBIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VM
QVRPUl9TWTgxMDZBPW0KQ09ORklHX1JFR1VMQVRPUl9TWTg4MjRYPW0KIyBDT05GSUdfUkVHVUxB
VE9SX1NZODgyN04gaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNTE2MzIgaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjEwNVggaXMgbm90IHNldApDT05GSUdfUkVHVUxB
VE9SX1RQUzYyMzYwPW0KQ09ORklHX1JFR1VMQVRPUl9UUFM2Mjg2WD15CkNPTkZJR19SRUdVTEFU
T1JfVFBTNjUwMjM9eQpDT05GSUdfUkVHVUxBVE9SX1RQUzY1MDdYPXkKQ09ORklHX1JFR1VMQVRP
Ul9UUFM2NTA4Nj15CkNPTkZJR19SRUdVTEFUT1JfVFBTNjUwOTA9bQpDT05GSUdfUkVHVUxBVE9S
X1RQUzY1MTMyPW0KQ09ORklHX1JFR1VMQVRPUl9UUFM2NTIxNz1tCkNPTkZJR19SRUdVTEFUT1Jf
VFBTNjU5MTI9bQojIENPTkZJR19SRUdVTEFUT1JfVFBTNjg0NzAgaXMgbm90IHNldAojIENPTkZJ
R19SRUdVTEFUT1JfVFdMNDAzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9VTklQSElF
UiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfVkNUUkw9eQpDT05GSUdfUkVHVUxBVE9SX1dN
ODQwMD15CiMgQ09ORklHX1JFR1VMQVRPUl9XTTg5OTQgaXMgbm90IHNldApDT05GSUdfUkVHVUxB
VE9SX1FDT01fTEFCSUJCPXkKQ09ORklHX1JDX0NPUkU9eQojIENPTkZJR19CUEZfTElSQ19NT0RF
MiBpcyBub3Qgc2V0CkNPTkZJR19MSVJDPXkKQ09ORklHX1JDX01BUD1tCiMgQ09ORklHX1JDX0RF
Q09ERVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNfREVWSUNFUyBpcyBub3Qgc2V0CkNPTkZJR19D
RUNfQ09SRT15CgojCiMgQ0VDIHN1cHBvcnQKIwojIENPTkZJR19NRURJQV9DRUNfUkMgaXMgbm90
IHNldApDT05GSUdfTUVESUFfQ0VDX1NVUFBPUlQ9eQpDT05GSUdfQ0VDX0NINzMyMj15CiMgQ09O
RklHX0NFQ19NRVNPTl9BTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NFQ19HUElPIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0VDX1NBTVNVTkdfUzVQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0VDX1NUSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NFQ19TVE0zMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NFQ19URUdSQSBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfUFVMU0U4X0NFQz15CkNPTkZJR19VU0JfUkFJTlNIQURPV19D
RUM9eQojIGVuZCBvZiBDRUMgc3VwcG9ydAoKIyBDT05GSUdfTUVESUFfU1VQUE9SVCBpcyBub3Qg
c2V0CgojCiMgR3JhcGhpY3Mgc3VwcG9ydAojCiMgQ09ORklHX0lNWF9JUFVWM19DT1JFIGlzIG5v
dCBzZXQKCiMKIyBBUk0gZGV2aWNlcwojCiMgZW5kIG9mIEFSTSBkZXZpY2VzCgojCiMgRnJhbWUg
YnVmZmVyIERldmljZXMKIwpDT05GSUdfRkJfQ01ETElORT15CkNPTkZJR19GQl9OT1RJRlk9eQpD
T05GSUdfRkI9bQpDT05GSUdfRklSTVdBUkVfRURJRD15CkNPTkZJR19GQl9DRkJfRklMTFJFQ1Q9
bQpDT05GSUdfRkJfQ0ZCX0NPUFlBUkVBPW0KQ09ORklHX0ZCX0NGQl9JTUFHRUJMSVQ9bQpDT05G
SUdfRkJfU1lTX0ZJTExSRUNUPW0KQ09ORklHX0ZCX1NZU19DT1BZQVJFQT1tCkNPTkZJR19GQl9T
WVNfSU1BR0VCTElUPW0KIyBDT05GSUdfRkJfRk9SRUlHTl9FTkRJQU4gaXMgbm90IHNldApDT05G
SUdfRkJfU1lTX0ZPUFM9bQpDT05GSUdfRkJfREVGRVJSRURfSU89eQpDT05GSUdfRkJfTU9ERV9I
RUxQRVJTPXkKIyBDT05GSUdfRkJfVElMRUJMSVRUSU5HIGlzIG5vdCBzZXQKCiMKIyBGcmFtZSBi
dWZmZXIgaGFyZHdhcmUgZHJpdmVycwojCiMgQ09ORklHX0ZCX0NMUFM3MTFYIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfQVJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUFZSMiBpcyBub3Qgc2V0CkNP
TkZJR19GQl9TMUQxM1hYWD1tCiMgQ09ORklHX0ZCX1cxMDAgaXMgbm90IHNldAojIENPTkZJR19G
Ql9UTUlPIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU01TQ1VGWCBpcyBub3Qgc2V0CkNPTkZJR19G
Ql9VREw9bQpDT05GSUdfRkJfSUJNX0dYVDQ1MDA9bQojIENPTkZJR19GQl9HT0xERklTSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX1ZJUlRVQUwgaXMgbm90IHNldApDT05GSUdfRkJfTUVUUk9OT01F
PW0KIyBDT05GSUdfRkJfQlJPQURTSEVFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NJTVBMRSBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NTRDEzMDcgaXMgbm90IHNldAojIENPTkZJR19GQl9PTUFQ
MiBpcyBub3Qgc2V0CiMgQ09ORklHX01NUF9ESVNQIGlzIG5vdCBzZXQKIyBlbmQgb2YgRnJhbWUg
YnVmZmVyIERldmljZXMKCiMKIyBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKIwpDT05G
SUdfTENEX0NMQVNTX0RFVklDRT15CiMgQ09ORklHX0xDRF9QTEFURk9STSBpcyBub3Qgc2V0CkNP
TkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNFPXkKQ09ORklHX0JBQ0tMSUdIVF9LVEQyNTM9bQoj
IENPTkZJR19CQUNLTElHSFRfT01BUDEgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfUFdN
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0RBOTAzWCBpcyBub3Qgc2V0CkNPTkZJR19C
QUNLTElHSFRfUUNPTV9XTEVEPXkKQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwPXkKIyBDT05GSUdf
QkFDS0xJR0hUX0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfUENGNTA2MzMg
aXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX0xNMzYzMEE9eQpDT05GSUdfQkFDS0xJR0hUX0xN
MzYzOT1tCkNPTkZJR19CQUNLTElHSFRfTFA4NTVYPXkKIyBDT05GSUdfQkFDS0xJR0hUX0xQODc4
OCBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfUEFORE9SQT15CiMgQ09ORklHX0JBQ0tMSUdI
VF9UUFM2NTIxNyBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfR1BJTz15CkNPTkZJR19CQUNL
TElHSFRfTFY1MjA3TFA9bQojIENPTkZJR19CQUNLTElHSFRfQkQ2MTA3IGlzIG5vdCBzZXQKQ09O
RklHX0JBQ0tMSUdIVF9BUkNYQ05OPXkKQ09ORklHX0JBQ0tMSUdIVF9SQVZFX1NQPW0KQ09ORklH
X0JBQ0tMSUdIVF9MRUQ9eQojIGVuZCBvZiBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQK
CiMKIyBDb25zb2xlIGRpc3BsYXkgZHJpdmVyIHN1cHBvcnQKIwpDT05GSUdfRFVNTVlfQ09OU09M
RT15CkNPTkZJR19EVU1NWV9DT05TT0xFX0NPTFVNTlM9ODAKQ09ORklHX0RVTU1ZX0NPTlNPTEVf
Uk9XUz0yNQpDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRT15CkNPTkZJR19GUkFNRUJVRkZFUl9D
T05TT0xFX0xFR0FDWV9BQ0NFTEVSQVRJT049eQojIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xF
X0RFVEVDVF9QUklNQVJZIGlzIG5vdCBzZXQKIyBDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9S
T1RBVElPTiBpcyBub3Qgc2V0CiMgZW5kIG9mIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9y
dAoKIyBDT05GSUdfTE9HTyBpcyBub3Qgc2V0CiMgZW5kIG9mIEdyYXBoaWNzIHN1cHBvcnQKCiMg
Q09ORklHX1NPVU5EIGlzIG5vdCBzZXQKCiMKIyBISUQgc3VwcG9ydAojCkNPTkZJR19ISUQ9bQoj
IENPTkZJR19ISURfQkFUVEVSWV9TVFJFTkdUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRFJBVyBp
cyBub3Qgc2V0CiMgQ09ORklHX1VISUQgaXMgbm90IHNldApDT05GSUdfSElEX0dFTkVSSUM9bQoK
IwojIFNwZWNpYWwgSElEIGRyaXZlcnMKIwojIENPTkZJR19ISURfQTRURUNIIGlzIG5vdCBzZXQK
Q09ORklHX0hJRF9BQ1JVWD1tCkNPTkZJR19ISURfQUNSVVhfRkY9eQpDT05GSUdfSElEX0FQUExF
PW0KQ09ORklHX0hJRF9BVVJFQUw9bQpDT05GSUdfSElEX0JFTEtJTj1tCiMgQ09ORklHX0hJRF9D
SEVSUlkgaXMgbm90IHNldApDT05GSUdfSElEX0NPVUdBUj1tCkNPTkZJR19ISURfTUFDQUxMWT1t
CiMgQ09ORklHX0hJRF9DTUVESUEgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1lQUkVTUyBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfRFJBR09OUklTRT1tCkNPTkZJR19EUkFHT05SSVNFX0ZGPXkKIyBD
T05GSUdfSElEX0VNU19GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTEVDT00gaXMgbm90IHNl
dApDT05GSUdfSElEX0VaS0VZPW0KQ09ORklHX0hJRF9HRU1CSVJEPW0KQ09ORklHX0hJRF9HRlJN
PW0KIyBDT05GSUdfSElEX0dMT1JJT1VTIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9WSVZBTERJX0NP
TU1PTj1tCkNPTkZJR19ISURfVklWQUxEST1tCiMgQ09ORklHX0hJRF9LRVlUT1VDSCBpcyBub3Qg
c2V0CkNPTkZJR19ISURfS1lFPW0KQ09ORklHX0hJRF9XQUxUT1A9bQpDT05GSUdfSElEX1ZJRVdT
T05JQz1tCiMgQ09ORklHX0hJRF9YSUFPTUkgaXMgbm90IHNldAojIENPTkZJR19ISURfR1lSQVRJ
T04gaXMgbm90IHNldAojIENPTkZJR19ISURfSUNBREUgaXMgbm90IHNldAojIENPTkZJR19ISURf
SVRFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9KQUJSQT1tCiMgQ09ORklHX0hJRF9UV0lOSEFOIGlz
IG5vdCBzZXQKQ09ORklHX0hJRF9LRU5TSU5HVE9OPW0KQ09ORklHX0hJRF9MQ1BPV0VSPW0KQ09O
RklHX0hJRF9MRUQ9bQojIENPTkZJR19ISURfTEVOT1ZPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9N
QUdJQ01PVVNFPW0KIyBDT05GSUdfSElEX01BTFRST04gaXMgbm90IHNldAojIENPTkZJR19ISURf
TUFZRkxBU0ggaXMgbm90IHNldApDT05GSUdfSElEX1JFRFJBR09OPW0KIyBDT05GSUdfSElEX01J
Q1JPU09GVCBpcyBub3Qgc2V0CkNPTkZJR19ISURfTU9OVEVSRVk9bQpDT05GSUdfSElEX01VTFRJ
VE9VQ0g9bQpDT05GSUdfSElEX05JTlRFTkRPPW0KQ09ORklHX05JTlRFTkRPX0ZGPXkKQ09ORklH
X0hJRF9OVEk9bQpDT05GSUdfSElEX09SVEVLPW0KQ09ORklHX0hJRF9QQU5USEVSTE9SRD1tCkNP
TkZJR19QQU5USEVSTE9SRF9GRj15CkNPTkZJR19ISURfUEVUQUxZTlg9bQojIENPTkZJR19ISURf
UElDT0xDRCBpcyBub3Qgc2V0CkNPTkZJR19ISURfUExBTlRST05JQ1M9bQpDT05GSUdfSElEX1BM
QVlTVEFUSU9OPW0KIyBDT05GSUdfUExBWVNUQVRJT05fRkYgaXMgbm90IHNldAojIENPTkZJR19I
SURfUkFaRVIgaXMgbm90IHNldApDT05GSUdfSElEX1BSSU1BWD1tCkNPTkZJR19ISURfU0FJVEVL
PW0KQ09ORklHX0hJRF9TRU1JVEVLPW0KQ09ORklHX0hJRF9TUEVFRExJTks9bQpDT05GSUdfSElE
X1NURUFNPW0KIyBDT05GSUdfSElEX1NURUVMU0VSSUVTIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9T
VU5QTFVTPW0KQ09ORklHX0hJRF9STUk9bQpDT05GSUdfSElEX0dSRUVOQVNJQT1tCkNPTkZJR19H
UkVFTkFTSUFfRkY9eQpDT05GSUdfSElEX1NNQVJUSk9ZUExVUz1tCiMgQ09ORklHX1NNQVJUSk9Z
UExVU19GRiBpcyBub3Qgc2V0CkNPTkZJR19ISURfVElWTz1tCkNPTkZJR19ISURfVE9QU0VFRD1t
CkNPTkZJR19ISURfVEhJTkdNPW0KIyBDT05GSUdfSElEX1VEUkFXX1BTMyBpcyBub3Qgc2V0CkNP
TkZJR19ISURfV0lJTU9URT1tCkNPTkZJR19ISURfWElOTU89bQpDT05GSUdfSElEX1pFUk9QTFVT
PW0KQ09ORklHX1pFUk9QTFVTX0ZGPXkKIyBDT05GSUdfSElEX1pZREFDUk9OIGlzIG5vdCBzZXQK
Q09ORklHX0hJRF9TRU5TT1JfSFVCPW0KQ09ORklHX0hJRF9TRU5TT1JfQ1VTVE9NX1NFTlNPUj1t
CkNPTkZJR19ISURfQUxQUz1tCiMgZW5kIG9mIFNwZWNpYWwgSElEIGRyaXZlcnMKCiMKIyBVU0Ig
SElEIHN1cHBvcnQKIwojIENPTkZJR19VU0JfSElEIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9QSUQ9
eQoKIwojIFVTQiBISUQgQm9vdCBQcm90b2NvbCBkcml2ZXJzCiMKIyBDT05GSUdfVVNCX0tCRCBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfTU9VU0U9eQojIGVuZCBvZiBVU0IgSElEIEJvb3QgUHJvdG9j
b2wgZHJpdmVycwojIGVuZCBvZiBVU0IgSElEIHN1cHBvcnQKCiMKIyBJMkMgSElEIHN1cHBvcnQK
IwojIENPTkZJR19JMkNfSElEX09GIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19ISURfT0ZfRUxBTj15
CkNPTkZJR19JMkNfSElEX09GX0dPT0RJWD1tCiMgZW5kIG9mIEkyQyBISUQgc3VwcG9ydAoKQ09O
RklHX0kyQ19ISURfQ09SRT1tCiMgZW5kIG9mIEhJRCBzdXBwb3J0CgpDT05GSUdfVVNCX09IQ0lf
TElUVExFX0VORElBTj15CkNPTkZJR19VU0JfU1VQUE9SVD15CkNPTkZJR19VU0JfQ09NTU9OPXkK
Q09ORklHX1VTQl9VTFBJX0JVUz15CkNPTkZJR19VU0JfQ09OTl9HUElPPW0KQ09ORklHX1VTQl9B
UkNIX0hBU19IQ0Q9eQpDT05GSUdfVVNCPXkKIyBDT05GSUdfVVNCX0FOTk9VTkNFX05FV19ERVZJ
Q0VTIGlzIG5vdCBzZXQKCiMKIyBNaXNjZWxsYW5lb3VzIFVTQiBvcHRpb25zCiMKQ09ORklHX1VT
Ql9ERUZBVUxUX1BFUlNJU1Q9eQojIENPTkZJR19VU0JfRkVXX0lOSVRfUkVUUklFUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9EWU5BTUlDX01JTk9SUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9P
VEdfUFJPRFVDVExJU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfT1RHX0RJU0FCTEVfRVhURVJO
QUxfSFVCIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVVRPU1VTUEVORF9ERUxBWT0yCiMgQ09ORklH
X1VTQl9NT04gaXMgbm90IHNldAoKIwojIFVTQiBIb3N0IENvbnRyb2xsZXIgRHJpdmVycwojCiMg
Q09ORklHX1VTQl9DNjdYMDBfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0JSQ01TVEIgaXMg
bm90IHNldApDT05GSUdfVVNCX09YVTIxMEhQX0hDRD15CkNPTkZJR19VU0JfSVNQMTE2WF9IQ0Q9
bQojIENPTkZJR19VU0JfSVNQMTM2Ml9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfVTEzMl9I
Q0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0w4MTFfSENEIGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9SOEE2NjU5N19IQ0Q9bQpDT05GSUdfVVNCX0hDRF9URVNUX01PREU9eQoKIwojIFVTQiBEZXZp
Y2UgQ2xhc3MgZHJpdmVycwojCkNPTkZJR19VU0JfQUNNPXkKIyBDT05GSUdfVVNCX1BSSU5URVIg
aXMgbm90IHNldApDT05GSUdfVVNCX1dETT1tCiMgQ09ORklHX1VTQl9UTUMgaXMgbm90IHNldAoK
IwojIE5PVEU6IFVTQl9TVE9SQUdFIGRlcGVuZHMgb24gU0NTSSBidXQgQkxLX0RFVl9TRCBtYXkK
IwoKIwojIGFsc28gYmUgbmVlZGVkOyBzZWUgVVNCX1NUT1JBR0UgSGVscCBmb3IgbW9yZSBpbmZv
CiMKQ09ORklHX1VTQl9TVE9SQUdFPW0KQ09ORklHX1VTQl9TVE9SQUdFX0RFQlVHPXkKQ09ORklH
X1VTQl9TVE9SQUdFX1JFQUxURUs9bQojIENPTkZJR19VU0JfU1RPUkFHRV9EQVRBRkFCIGlzIG5v
dCBzZXQKQ09ORklHX1VTQl9TVE9SQUdFX0ZSRUVDT009bQojIENPTkZJR19VU0JfU1RPUkFHRV9J
U0QyMDAgaXMgbm90IHNldApDT05GSUdfVVNCX1NUT1JBR0VfVVNCQVQ9bQpDT05GSUdfVVNCX1NU
T1JBR0VfU0REUjA5PW0KQ09ORklHX1VTQl9TVE9SQUdFX1NERFI1NT1tCkNPTkZJR19VU0JfU1RP
UkFHRV9KVU1QU0hPVD1tCkNPTkZJR19VU0JfU1RPUkFHRV9BTEFVREE9bQojIENPTkZJR19VU0Jf
U1RPUkFHRV9PTkVUT1VDSCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU1RPUkFHRV9LQVJNQT1tCkNP
TkZJR19VU0JfU1RPUkFHRV9DWVBSRVNTX0FUQUNCPW0KQ09ORklHX1VTQl9TVE9SQUdFX0VORV9V
QjYyNTA9bQojIENPTkZJR19VU0JfVUFTIGlzIG5vdCBzZXQKCiMKIyBVU0IgSW1hZ2luZyBkZXZp
Y2VzCiMKQ09ORklHX1VTQl9NREM4MDA9bQojIENPTkZJR19VU0JfTUlDUk9URUsgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfTVRVMyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9NVVNCX0hEUkMgaXMg
bm90IHNldApDT05GSUdfVVNCX0lTUDE3NjA9bQpDT05GSUdfVVNCX0lTUDE3NjBfSENEPXkKQ09O
RklHX1VTQl9JU1AxNzYwX0hPU1RfUk9MRT15CgojCiMgVVNCIHBvcnQgZHJpdmVycwojCkNPTkZJ
R19VU0JfVVNTNzIwPXkKQ09ORklHX1VTQl9TRVJJQUw9eQojIENPTkZJR19VU0JfU0VSSUFMX0NP
TlNPTEUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0dFTkVSSUMgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX1NJTVBMRSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX0FJ
UkNBQkxFPXkKIyBDT05GSUdfVVNCX1NFUklBTF9BUkszMTE2IGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFUklBTF9CRUxLSU4gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0NIMzQxIGlz
IG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfV0hJVEVIRUFUPXkKQ09ORklHX1VTQl9TRVJJQUxf
RElHSV9BQ0NFTEVQT1JUPXkKIyBDT05GSUdfVVNCX1NFUklBTF9DUDIxMFggaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX0NZUFJFU1NfTTggaXMgbm90IHNldApDT05GSUdfVVNCX1NFUklB
TF9FTVBFRz1tCiMgQ09ORklHX1VTQl9TRVJJQUxfRlRESV9TSU8gaXMgbm90IHNldApDT05GSUdf
VVNCX1NFUklBTF9WSVNPUj1tCkNPTkZJR19VU0JfU0VSSUFMX0lQQVE9eQpDT05GSUdfVVNCX1NF
UklBTF9JUj15CkNPTkZJR19VU0JfU0VSSUFMX0VER0VQT1JUPXkKQ09ORklHX1VTQl9TRVJJQUxf
RURHRVBPUlRfVEk9bQojIENPTkZJR19VU0JfU0VSSUFMX0Y4MTIzMiBpcyBub3Qgc2V0CkNPTkZJ
R19VU0JfU0VSSUFMX0Y4MTUzWD1tCkNPTkZJR19VU0JfU0VSSUFMX0dBUk1JTj1tCkNPTkZJR19V
U0JfU0VSSUFMX0lQVz15CkNPTkZJR19VU0JfU0VSSUFMX0lVVT15CiMgQ09ORklHX1VTQl9TRVJJ
QUxfS0VZU1BBTl9QREEgaXMgbm90IHNldApDT05GSUdfVVNCX1NFUklBTF9LRVlTUEFOPXkKIyBD
T05GSUdfVVNCX1NFUklBTF9LTFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LT0JJ
TF9TQ1QgaXMgbm90IHNldApDT05GSUdfVVNCX1NFUklBTF9NQ1RfVTIzMj15CkNPTkZJR19VU0Jf
U0VSSUFMX01FVFJPPW0KIyBDT05GSUdfVVNCX1NFUklBTF9NT1M3NzIwIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9NT1M3ODQwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9N
WFVQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfTkFWTUFOPW0KQ09ORklHX1VTQl9T
RVJJQUxfUEwyMzAzPXkKIyBDT05GSUdfVVNCX1NFUklBTF9PVEk2ODU4IGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9TRVJJQUxfUUNBVVg9bQojIENPTkZJR19VU0JfU0VSSUFMX1FVQUxDT01NIGlzIG5v
dCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfU1BDUDhYNT1tCkNPTkZJR19VU0JfU0VSSUFMX1NBRkU9
bQojIENPTkZJR19VU0JfU0VSSUFMX1NBRkVfUEFEREVEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NFUklBTF9TSUVSUkFXSVJFTEVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU1lN
Qk9MIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfVEk9bQpDT05GSUdfVVNCX1NFUklBTF9D
WUJFUkpBQ0s9eQpDT05GSUdfVVNCX1NFUklBTF9XV0FOPXkKQ09ORklHX1VTQl9TRVJJQUxfT1BU
SU9OPW0KQ09ORklHX1VTQl9TRVJJQUxfT01OSU5FVD1tCkNPTkZJR19VU0JfU0VSSUFMX09QVElD
T049eQojIENPTkZJR19VU0JfU0VSSUFMX1hTRU5TX01UIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NFUklBTF9XSVNIQk9ORSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX1NTVTEwMD15CkNP
TkZJR19VU0JfU0VSSUFMX1FUMj15CkNPTkZJR19VU0JfU0VSSUFMX1VQRDc4RjA3MzA9eQpDT05G
SUdfVVNCX1NFUklBTF9YUj1tCkNPTkZJR19VU0JfU0VSSUFMX0RFQlVHPXkKCiMKIyBVU0IgTWlz
Y2VsbGFuZW91cyBkcml2ZXJzCiMKQ09ORklHX1VTQl9FTUk2Mj15CiMgQ09ORklHX1VTQl9FTUky
NiBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQURVVFVYPW0KQ09ORklHX1VTQl9TRVZTRUc9bQpDT05G
SUdfVVNCX0xFR09UT1dFUj1tCiMgQ09ORklHX1VTQl9MQ0QgaXMgbm90IHNldApDT05GSUdfVVNC
X0NZUFJFU1NfQ1k3QzYzPW0KQ09ORklHX1VTQl9DWVRIRVJNPXkKQ09ORklHX1VTQl9JRE1PVVNF
PW0KQ09ORklHX1VTQl9GVERJX0VMQU49bQpDT05GSUdfVVNCX0FQUExFRElTUExBWT1tCiMgQ09O
RklHX1VTQl9RQ09NX0VVRCBpcyBub3Qgc2V0CkNPTkZJR19BUFBMRV9NRklfRkFTVENIQVJHRT15
CkNPTkZJR19VU0JfTEQ9bQpDT05GSUdfVVNCX1RSQU5DRVZJQlJBVE9SPW0KIyBDT05GSUdfVVNC
X0lPV0FSUklPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9URVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX0VIU0VUX1RFU1RfRklYVFVSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU0lHSFRG
VyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ZVVJFWCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRVpV
U0JfRlgyPXkKIyBDT05GSUdfVVNCX0hVQl9VU0IyNTFYQiBpcyBub3Qgc2V0CkNPTkZJR19VU0Jf
SFNJQ19VU0IzNTAzPW0KIyBDT05GSUdfVVNCX0hTSUNfVVNCNDYwNCBpcyBub3Qgc2V0CkNPTkZJ
R19VU0JfTElOS19MQVlFUl9URVNUPXkKQ09ORklHX1VTQl9DSEFPU0tFWT1tCiMgQ09ORklHX0JS
Q01fVVNCX1BJTk1BUCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfT05CT0FSRF9IVUI9bQoKIwojIFVT
QiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCiMKQ09ORklHX1VTQl9QSFk9eQojIENPTkZJR19LRVlT
VE9ORV9VU0JfUEhZIGlzIG5vdCBzZXQKQ09ORklHX05PUF9VU0JfWENFSVY9bQojIENPTkZJR19B
TTMzNVhfUEhZX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HUElPX1ZCVVMgaXMgbm90IHNl
dApDT05GSUdfVEFIVk9fVVNCPW0KIyBDT05GSUdfVEFIVk9fVVNCX0hPU1RfQllfREVGQVVMVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxMzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1RF
R1JBX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9VTFBJIGlzIG5vdCBzZXQKIyBDT05GSUdf
Slo0NzcwX1BIWSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNhbCBMYXllciBkcml2ZXJz
CgojIENPTkZJR19VU0JfR0FER0VUIGlzIG5vdCBzZXQKQ09ORklHX1RZUEVDPXkKQ09ORklHX1RZ
UEVDX1RDUE09bQojIENPTkZJR19UWVBFQ19UQ1BDSSBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQ19G
VVNCMzAyPW0KQ09ORklHX1RZUEVDX1RQUzY1OThYPXkKQ09ORklHX1RZUEVDX0FOWDc0MTE9eQpD
T05GSUdfVFlQRUNfUlQxNzE5PXkKQ09ORklHX1RZUEVDX0hEM1NTMzIyMD15CiMgQ09ORklHX1RZ
UEVDX1NUVVNCMTYwWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RZUEVDX1FDT01fUE1JQyBpcyBub3Qg
c2V0CkNPTkZJR19UWVBFQ19XVVNCMzgwMT15CgojCiMgVVNCIFR5cGUtQyBNdWx0aXBsZXhlci9E
ZU11bHRpcGxleGVyIFN3aXRjaCBzdXBwb3J0CiMKIyBDT05GSUdfVFlQRUNfTVVYX0ZTQTQ0ODAg
aXMgbm90IHNldApDT05GSUdfVFlQRUNfTVVYX1BJM1VTQjMwNTMyPW0KIyBlbmQgb2YgVVNCIFR5
cGUtQyBNdWx0aXBsZXhlci9EZU11bHRpcGxleGVyIFN3aXRjaCBzdXBwb3J0CgojCiMgVVNCIFR5
cGUtQyBBbHRlcm5hdGUgTW9kZSBkcml2ZXJzCiMKIyBlbmQgb2YgVVNCIFR5cGUtQyBBbHRlcm5h
dGUgTW9kZSBkcml2ZXJzCgpDT05GSUdfVVNCX1JPTEVfU1dJVENIPXkKIyBDT05GSUdfTU1DIGlz
IG5vdCBzZXQKQ09ORklHX01FTVNUSUNLPXkKIyBDT05GSUdfTUVNU1RJQ0tfREVCVUcgaXMgbm90
IHNldAoKIwojIE1lbW9yeVN0aWNrIGRyaXZlcnMKIwpDT05GSUdfTUVNU1RJQ0tfVU5TQUZFX1JF
U1VNRT15CiMgQ09ORklHX01TUFJPX0JMT0NLIGlzIG5vdCBzZXQKQ09ORklHX01TX0JMT0NLPW0K
CiMKIyBNZW1vcnlTdGljayBIb3N0IENvbnRyb2xsZXIgRHJpdmVycwojCkNPTkZJR19NRU1TVElD
S19SRUFMVEVLX1VTQj1tCkNPTkZJR19ORVdfTEVEUz15CkNPTkZJR19MRURTX0NMQVNTPXkKIyBD
T05GSUdfTEVEU19DTEFTU19GTEFTSCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0NMQVNTX01VTFRJ
Q09MT1I9eQpDT05GSUdfTEVEU19CUklHSFRORVNTX0hXX0NIQU5HRUQ9eQoKIwojIExFRCBkcml2
ZXJzCiMKIyBDT05GSUdfTEVEU19BTjMwMjU5QSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQVJJ
RUwgaXMgbm90IHNldApDT05GSUdfTEVEU19BVzIwMTM9eQojIENPTkZJR19MRURTX0JDTTYzMjgg
aXMgbm90IHNldAojIENPTkZJR19MRURTX0JDTTYzNTggaXMgbm90IHNldAojIENPTkZJR19MRURT
X1RVUlJJU19PTU5JQSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzUzMD15CkNPTkZJR19MRURT
X0xNMzUzMj15CiMgQ09ORklHX0xFRFNfTE0zNjQyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19M
TTM2OTJYIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTVQ2MzIzPW0KIyBDT05GSUdfTEVEU19TM0My
NFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19DT0JBTFRfUVVCRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfQ09CQUxUX1JBUSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTUzMiBpcyBu
b3Qgc2V0CkNPTkZJR19MRURTX0dQSU89eQojIENPTkZJR19MRURTX0xQMzk0NCBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfTFAzOTUyIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTFA1MFhYPXkKQ09O
RklHX0xFRFNfTFA1NVhYX0NPTU1PTj15CiMgQ09ORklHX0xFRFNfTFA1NTIxIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19MUDU1MjMgaXMgbm90IHNldApDT05GSUdfTEVEU19MUDU1NjI9eQojIENP
TkZJR19MRURTX0xQODUwMSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xQODc4OD1tCkNPTkZJR19M
RURTX0xQODg2MD1tCkNPTkZJR19MRURTX1BDQTk1NVg9eQojIENPTkZJR19MRURTX1BDQTk1NVhf
R1BJTyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1BDQTk2M1g9eQpDT05GSUdfTEVEU19EQTkwM1g9
eQojIENPTkZJR19MRURTX1BXTSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1JFR1VMQVRPUj15CkNP
TkZJR19MRURTX0JEMjgwMj1tCiMgQ09ORklHX0xFRFNfTFQzNTkzIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19NQzEzNzgzIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTlMyPXkKQ09ORklHX0xFRFNf
TkVUWEJJRz15CkNPTkZJR19MRURTX1RDQTY1MDc9bQojIENPTkZJR19MRURTX1RMQzU5MVhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19NQVg3NzY1MCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX01B
WDg5OTc9eQojIENPTkZJR19MRURTX0xNMzU1eCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfT1Qy
MDAgaXMgbm90IHNldApDT05GSUdfTEVEU19JUzMxRkwzMTlYPW0KQ09ORklHX0xFRFNfSVMzMUZM
MzJYWD1tCgojCiMgTEVEIGRyaXZlciBmb3IgYmxpbmsoMSkgVVNCIFJHQiBMRUQgaXMgdW5kZXIg
U3BlY2lhbCBISUQgZHJpdmVycyAoSElEX1RISU5HTSkKIwpDT05GSUdfTEVEU19CTElOS009bQpD
T05GSUdfTEVEU19TWVNDT049eQpDT05GSUdfTEVEU19NTFhSRUc9bQojIENPTkZJR19MRURTX1VT
RVIgaXMgbm90IHNldApDT05GSUdfTEVEU19USV9MTVVfQ09NTU9OPXkKQ09ORklHX0xFRFNfTE0z
Njk3PW0KIyBDT05GSUdfTEVEU19MTTM2Mjc0IGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFBTNjEw
NVg9bQojIENPTkZJR19MRURTX0lQMzAgaXMgbm90IHNldAojIENPTkZJR19MRURTX0JDTTYzMTM4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MR00gaXMgbm90IHNldAoKIwojIEZsYXNoIGFuZCBU
b3JjaCBMRUQgZHJpdmVycwojCgojCiMgUkdCIExFRCBkcml2ZXJzCiMKQ09ORklHX0xFRFNfUFdN
X01VTFRJQ09MT1I9bQpDT05GSUdfTEVEU19RQ09NX0xQRz15CgojCiMgTEVEIFRyaWdnZXJzCiMK
IyBDT05GSUdfTEVEU19UUklHR0VSUyBpcyBub3Qgc2V0CgojCiMgU2ltcGxlIExFRCBkcml2ZXJz
CiMKQ09ORklHX0FDQ0VTU0lCSUxJVFk9eQpDT05GSUdfQTExWV9CUkFJTExFX0NPTlNPTEU9eQoK
IwojIFNwZWFrdXAgY29uc29sZSBzcGVlY2gKIwpDT05GSUdfU1BFQUtVUD1tCkNPTkZJR19TUEVB
S1VQX1NFUklBTElPPXkKQ09ORklHX1NQRUFLVVBfU1lOVEhfQUNOVFNBPW0KIyBDT05GSUdfU1BF
QUtVUF9TWU5USF9BQ05UUEMgaXMgbm90IHNldApDT05GSUdfU1BFQUtVUF9TWU5USF9BUE9MTE89
bQojIENPTkZJR19TUEVBS1VQX1NZTlRIX0FVRFBUUiBpcyBub3Qgc2V0CkNPTkZJR19TUEVBS1VQ
X1NZTlRIX0JOUz1tCkNPTkZJR19TUEVBS1VQX1NZTlRIX0RFQ1RMSz1tCiMgQ09ORklHX1NQRUFL
VVBfU1lOVEhfREVDRVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BFQUtVUF9TWU5USF9ERUNQQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NQRUFLVVBfU1lOVEhfRFRMSyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NQRUFLVVBfU1lOVEhfS0VZUEMgaXMgbm90IHNldApDT05GSUdfU1BFQUtVUF9TWU5USF9MVExL
PW0KIyBDT05GSUdfU1BFQUtVUF9TWU5USF9TT0ZUIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BFQUtV
UF9TWU5USF9TUEtPVVQgaXMgbm90IHNldApDT05GSUdfU1BFQUtVUF9TWU5USF9UWFBSVD1tCkNP
TkZJR19TUEVBS1VQX1NZTlRIX0RVTU1ZPW0KIyBlbmQgb2YgU3BlYWt1cCBjb25zb2xlIHNwZWVj
aAoKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdfUlRDX0NMQVNTPXkKQ09ORklHX1JUQ19IQ1RPU1lT
PXkKQ09ORklHX1JUQ19IQ1RPU1lTX0RFVklDRT0icnRjMCIKIyBDT05GSUdfUlRDX1NZU1RPSEMg
aXMgbm90IHNldAojIENPTkZJR19SVENfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19SVENfTElC
X0tVTklUX1RFU1QgaXMgbm90IHNldApDT05GSUdfUlRDX05WTUVNPXkKCiMKIyBSVEMgaW50ZXJm
YWNlcwojCkNPTkZJR19SVENfSU5URl9TWVNGUz15CkNPTkZJR19SVENfSU5URl9QUk9DPXkKIyBD
T05GSUdfUlRDX0lOVEZfREVWIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfVEVTVD1tCgojCiMg
STJDIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19EUlZfODhQTTgwWD1tCkNPTkZJR19SVENfRFJW
X0FCQjVaRVMzPW0KQ09ORklHX1JUQ19EUlZfQUJFT1o5PW0KQ09ORklHX1JUQ19EUlZfQUJYODBY
PXkKIyBDT05GSUdfUlRDX0RSVl9CUkNNU1RCIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfQVMz
NzIyPW0KQ09ORklHX1JUQ19EUlZfRFMxMzA3PW0KQ09ORklHX1JUQ19EUlZfRFMxMzA3X0NFTlRV
Ulk9eQojIENPTkZJR19SVENfRFJWX0RTMTM3NCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RT
MTY3Mj1tCkNPTkZJR19SVENfRFJWX0hZTTg1NjM9bQpDT05GSUdfUlRDX0RSVl9MUDg3ODg9eQoj
IENPTkZJR19SVENfRFJWX01BWDY5MDAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01BWDg5
MDcgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9NQVg4OTk4PXkKQ09ORklHX1JUQ19EUlZfTUFY
ODk5Nz1tCiMgQ09ORklHX1JUQ19EUlZfTUFYNzc2ODYgaXMgbm90IHNldApDT05GSUdfUlRDX0RS
Vl9OQ1QzMDE4WT15CiMgQ09ORklHX1JUQ19EUlZfUks4MDggaXMgbm90IHNldApDT05GSUdfUlRD
X0RSVl9SUzVDMzcyPXkKQ09ORklHX1JUQ19EUlZfSVNMMTIwOD1tCiMgQ09ORklHX1JUQ19EUlZf
SVNMMTIwMjIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0lTTDEyMDI2IGlzIG5vdCBzZXQK
Q09ORklHX1JUQ19EUlZfWDEyMDU9bQpDT05GSUdfUlRDX0RSVl9QQ0Y4NTIzPXkKQ09ORklHX1JU
Q19EUlZfUENGODUwNjM9bQpDT05GSUdfUlRDX0RSVl9QQ0Y4NTM2Mz1tCkNPTkZJR19SVENfRFJW
X1BDRjg1NjM9bQpDT05GSUdfUlRDX0RSVl9QQ0Y4NTgzPW0KIyBDT05GSUdfUlRDX0RSVl9NNDFU
ODAgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9CUTMySz1tCiMgQ09ORklHX1JUQ19EUlZfVFdM
NDAzMCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1JDNVQ2MTk9eQojIENPTkZJR19SVENfRFJW
X1MzNTM5MEEgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9GTTMxMzA9eQpDT05GSUdfUlRDX0RS
Vl9SWDgwMTA9eQpDT05GSUdfUlRDX0RSVl9SWDg1ODE9bQpDT05GSUdfUlRDX0RSVl9SWDgwMjU9
eQpDT05GSUdfUlRDX0RSVl9FTTMwMjc9bQpDT05GSUdfUlRDX0RSVl9SVjMwMjg9bQpDT05GSUdf
UlRDX0RSVl9SVjMwMzI9eQojIENPTkZJR19SVENfRFJWX1JWODgwMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfUzVNIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TRDMwNzggaXMgbm90
IHNldAoKIwojIFNQSSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfSTJDX0FORF9TUEk9eQoKIwoj
IFNQSSBhbmQgSTJDIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19EUlZfRFMzMjMyPW0KQ09ORklH
X1JUQ19EUlZfRFMzMjMyX0hXTU9OPXkKQ09ORklHX1JUQ19EUlZfUENGMjEyNz1tCiMgQ09ORklH
X1JUQ19EUlZfUlYzMDI5QzIgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9SWDYxMTA9bQoKIwoj
IFBsYXRmb3JtIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9EUzEyODYgaXMgbm90IHNl
dApDT05GSUdfUlRDX0RSVl9EUzE1MTE9bQpDT05GSUdfUlRDX0RSVl9EUzE1NTM9eQpDT05GSUdf
UlRDX0RSVl9EUzE2ODVfRkFNSUxZPW0KIyBDT05GSUdfUlRDX0RSVl9EUzE2ODUgaXMgbm90IHNl
dApDT05GSUdfUlRDX0RSVl9EUzE2ODk9eQojIENPTkZJR19SVENfRFJWX0RTMTcyODUgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX0RTMTc0ODUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0RTMTc4ODUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTc0MiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfRFMyNDA0IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfREE5MDU1PXkK
Q09ORklHX1JUQ19EUlZfREE5MDYzPW0KQ09ORklHX1JUQ19EUlZfU1RLMTdUQTg9bQpDT05GSUdf
UlRDX0RSVl9NNDhUODY9bQpDT05GSUdfUlRDX0RSVl9NNDhUMzU9bQojIENPTkZJR19SVENfRFJW
X000OFQ1OSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX01TTTYyNDI9bQpDT05GSUdfUlRDX0RS
Vl9CUTQ4MDI9bQpDT05GSUdfUlRDX0RSVl9SUDVDMDE9bQpDT05GSUdfUlRDX0RSVl9WMzAyMD15
CiMgQ09ORklHX1JUQ19EUlZfR0FNRUNVQkUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1ND
MjdYWCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1NQRUFSPXkKQ09ORklHX1JUQ19EUlZfUENG
NTA2MzM9bQpDT05GSUdfUlRDX0RSVl9aWU5RTVA9eQoKIwojIG9uLUNQVSBSVEMgZHJpdmVycwoj
CiMgQ09ORklHX1JUQ19EUlZfQVNNOTI2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfREFW
SU5DSSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRElHSUNPTE9SIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9GU0xfRlRNX0FMQVJNIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9N
RVNPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTUVTT05fVlJUQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfUzNDIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9FUDkzWFggaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX0FUOTFSTTkyMDAgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX0FUOTFTQU05IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWk4xIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9W
VDg1MDAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1NVTlhJIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9NViBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQVJNQURBMzhYIGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRDX0RSVl9DQURFTkNFIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZf
RlRSVEMwMTA9eQojIENPTkZJR19SVENfRFJWX1NUTVAgaXMgbm90IHNldApDT05GSUdfUlRDX0RS
Vl9NQzEzWFhYPXkKIyBDT05GSUdfUlRDX0RSVl9KWjQ3NDAgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX0xQQzI0WFggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0xQQzMyWFggaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1BNOFhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
VEVHUkEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01YQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfTVhDX1YyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TTlZTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9NT1hBUlQgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01U
MjcxMiBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX01UNjM5Nz1tCiMgQ09ORklHX1JUQ19EUlZf
TVQ3NjIyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9YR0VORSBpcyBub3Qgc2V0CkNPTkZJ
R19SVENfRFJWX1I3MzAxPW0KIyBDT05GSUdfUlRDX0RSVl9TVE0zMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfUlREMTE5WCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQVNQRUVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9USV9LMyBpcyBub3Qgc2V0CgojCiMgSElEIFNlbnNv
ciBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfRFJWX0dPTERGSVNIPW0KIyBDT05GSUdfUlRDX0RS
Vl9NU0MzMTMgaXMgbm90IHNldAoKIwojIERNQUJVRiBvcHRpb25zCiMKQ09ORklHX1NZTkNfRklM
RT15CiMgQ09ORklHX1NXX1NZTkMgaXMgbm90IHNldAojIENPTkZJR19VRE1BQlVGIGlzIG5vdCBz
ZXQKQ09ORklHX0RNQUJVRl9NT1ZFX05PVElGWT15CiMgQ09ORklHX0RNQUJVRl9ERUJVRyBpcyBu
b3Qgc2V0CkNPTkZJR19ETUFCVUZfU0VMRlRFU1RTPXkKQ09ORklHX0RNQUJVRl9IRUFQUz15CkNP
TkZJR19ETUFCVUZfU1lTRlNfU1RBVFM9eQpDT05GSUdfRE1BQlVGX0hFQVBTX1NZU1RFTT15CiMg
ZW5kIG9mIERNQUJVRiBvcHRpb25zCgpDT05GSUdfQVVYRElTUExBWT15CkNPTkZJR19DSEFSTENE
PXkKIyBDT05GSUdfTElORURJU1AgaXMgbm90IHNldApDT05GSUdfSEQ0NDc4MF9DT01NT049eQpD
T05GSUdfSEQ0NDc4MD1tCiMgQ09ORklHX0lNR19BU0NJSV9MQ0QgaXMgbm90IHNldAojIENPTkZJ
R19IVDE2SzMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTENEMlMgaXMgbm90IHNldApDT05GSUdfUEFS
UE9SVF9QQU5FTD15CkNPTkZJR19QQU5FTF9QQVJQT1JUPTAKQ09ORklHX1BBTkVMX1BST0ZJTEU9
NQojIENPTkZJR19QQU5FTF9DSEFOR0VfTUVTU0FHRSBpcyBub3Qgc2V0CkNPTkZJR19DSEFSTENE
X0JMX09GRj15CiMgQ09ORklHX0NIQVJMQ0RfQkxfT04gaXMgbm90IHNldAojIENPTkZJR19DSEFS
TENEX0JMX0ZMQVNIIGlzIG5vdCBzZXQKQ09ORklHX1BBTkVMPXkKQ09ORklHX1ZGSU89bQpDT05G
SUdfVkZJT19OT0lPTU1VPXkKIyBDT05GSUdfVkZJT19QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZGSU9fTURFViBpcyBub3Qgc2V0CkNPTkZJR19WSVJUX0RSSVZFUlM9eQpDT05GSUdfVklS
VElPX0FOQ0hPUj15CkNPTkZJR19WSVJUSU89bQpDT05GSUdfVklSVElPX01FTlU9eQpDT05GSUdf
VklSVElPX0JBTExPT049bQpDT05GSUdfVklSVElPX0lOUFVUPW0KQ09ORklHX1ZIT1NUX0lPVExC
PW0KQ09ORklHX1ZIT1NUPW0KQ09ORklHX1ZIT1NUX01FTlU9eQpDT05GSUdfVkhPU1RfU0NTST1t
CiMgQ09ORklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kgaXMgbm90IHNldAoKIwojIE1pY3Jv
c29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIGVuZCBvZiBNaWNyb3NvZnQgSHlwZXItViBn
dWVzdCBzdXBwb3J0CgpDT05GSUdfR1JFWUJVUz15CkNPTkZJR19HUkVZQlVTX0VTMj15CkNPTkZJ
R19DT01FREk9eQojIENPTkZJR19DT01FRElfREVCVUcgaXMgbm90IHNldApDT05GSUdfQ09NRURJ
X0RFRkFVTFRfQlVGX1NJWkVfS0I9MjA0OApDT05GSUdfQ09NRURJX0RFRkFVTFRfQlVGX01BWFNJ
WkVfS0I9MjA0ODAKQ09ORklHX0NPTUVESV9NSVNDX0RSSVZFUlM9eQojIENPTkZJR19DT01FRElf
Qk9ORCBpcyBub3Qgc2V0CkNPTkZJR19DT01FRElfVEVTVD1tCkNPTkZJR19DT01FRElfUEFSUE9S
VD1tCiMgQ09ORklHX0NPTUVESV9TU1ZfRE5QIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9JU0Ff
RFJJVkVSUz15CiMgQ09ORklHX0NPTUVESV9QQ0w3MTEgaXMgbm90IHNldApDT05GSUdfQ09NRURJ
X1BDTDcyND1tCkNPTkZJR19DT01FRElfUENMNzI2PW0KQ09ORklHX0NPTUVESV9QQ0w3MzA9eQoj
IENPTkZJR19DT01FRElfUENMODEyIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9QQ0w4MTY9bQpD
T05GSUdfQ09NRURJX1BDTDgxOD15CiMgQ09ORklHX0NPTUVESV9QQ00zNzI0IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NRURJX0FNUExDX0RJTzIwMF9JU0EgaXMgbm90IHNldAojIENPTkZJR19DT01F
RElfQU1QTENfUEMyMzZfSVNBIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9BTVBMQ19QQzI2M19J
U0E9eQpDT05GSUdfQ09NRURJX1JUSTgwMD1tCiMgQ09ORklHX0NPTUVESV9SVEk4MDIgaXMgbm90
IHNldAojIENPTkZJR19DT01FRElfREFDMDIgaXMgbm90IHNldApDT05GSUdfQ09NRURJX0RBUzE2
TTE9eQojIENPTkZJR19DT01FRElfREFTMDhfSVNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJ
X0RBUzE2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJX0RBUzgwMCBpcyBub3Qgc2V0CkNPTkZJ
R19DT01FRElfREFTMTgwMD15CiMgQ09ORklHX0NPTUVESV9EQVM2NDAyIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09NRURJX0RUMjgwMSBpcyBub3Qgc2V0CkNPTkZJR19DT01FRElfRFQyODExPXkKIyBD
T05GSUdfQ09NRURJX0RUMjgxNCBpcyBub3Qgc2V0CkNPTkZJR19DT01FRElfRFQyODE1PW0KQ09O
RklHX0NPTUVESV9EVDI4MTc9eQpDT05GSUdfQ09NRURJX0RUMjgyWD1tCkNPTkZJR19DT01FRElf
RE1NMzJBVD1tCkNPTkZJR19DT01FRElfRkw1MTI9eQpDT05GSUdfQ09NRURJX0FJT19BSU8xMl84
PW0KIyBDT05GSUdfQ09NRURJX0FJT19JSVJPXzE2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJ
X0lJX1BDSTIwS0MgaXMgbm90IHNldApDT05GSUdfQ09NRURJX0M2WERJR0lPPW0KQ09ORklHX0NP
TUVESV9NUEM2MjQ9eQojIENPTkZJR19DT01FRElfQURRMTJCIGlzIG5vdCBzZXQKQ09ORklHX0NP
TUVESV9OSV9BVF9BMjE1MD1tCkNPTkZJR19DT01FRElfTklfQVRfQU89eQpDT05GSUdfQ09NRURJ
X05JX0FUTUlPPXkKQ09ORklHX0NPTUVESV9OSV9BVE1JTzE2RD15CkNPTkZJR19DT01FRElfTklf
TEFCUENfSVNBPW0KIyBDT05GSUdfQ09NRURJX1BDTUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09N
RURJX1BDTURBMTIgaXMgbm90IHNldApDT05GSUdfQ09NRURJX1BDTU1JTz1tCkNPTkZJR19DT01F
RElfUENNVUlPPW0KQ09ORklHX0NPTUVESV9NVUxUSVEzPXkKIyBDT05GSUdfQ09NRURJX1M1MjYg
aXMgbm90IHNldAojIENPTkZJR19DT01FRElfUENNQ0lBX0RSSVZFUlMgaXMgbm90IHNldApDT05G
SUdfQ09NRURJX1VTQl9EUklWRVJTPXkKQ09ORklHX0NPTUVESV9EVDk4MTI9eQpDT05GSUdfQ09N
RURJX05JX1VTQjY1MDE9eQpDT05GSUdfQ09NRURJX1VTQkRVWD15CkNPTkZJR19DT01FRElfVVNC
RFVYRkFTVD1tCkNPTkZJR19DT01FRElfVVNCRFVYU0lHTUE9bQojIENPTkZJR19DT01FRElfVk1L
ODBYWCBpcyBub3Qgc2V0CkNPTkZJR19DT01FRElfODI1ND15CkNPTkZJR19DT01FRElfODI1NT15
CkNPTkZJR19DT01FRElfODI1NV9TQT1tCkNPTkZJR19DT01FRElfS0NPTUVESUxJQj1tCkNPTkZJ
R19DT01FRElfTklfTEFCUEM9bQpDT05GSUdfQ09NRURJX05JX1RJTz15CkNPTkZJR19DT01FRElf
TklfUk9VVElORz15CkNPTkZJR19DT01FRElfVEVTVFM9eQojIENPTkZJR19DT01FRElfVEVTVFNf
RVhBTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTUVESV9URVNUU19OSV9ST1VURVMgaXMgbm90
IHNldApDT05GSUdfU1RBR0lORz15CgojCiMgSUlPIHN0YWdpbmcgZHJpdmVycwojCgojCiMgQWNj
ZWxlcm9tZXRlcnMKIwojIGVuZCBvZiBBY2NlbGVyb21ldGVycwoKIwojIEFuYWxvZyB0byBkaWdp
dGFsIGNvbnZlcnRlcnMKIwojIGVuZCBvZiBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCgoj
CiMgQW5hbG9nIGRpZ2l0YWwgYmktZGlyZWN0aW9uIGNvbnZlcnRlcnMKIwpDT05GSUdfQURUNzMx
Nj1tCkNPTkZJR19BRFQ3MzE2X0kyQz1tCiMgZW5kIG9mIEFuYWxvZyBkaWdpdGFsIGJpLWRpcmVj
dGlvbiBjb252ZXJ0ZXJzCgojCiMgQ2FwYWNpdGFuY2UgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMK
Q09ORklHX0FENzc0Nj1tCiMgZW5kIG9mIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVy
cwoKIwojIERpcmVjdCBEaWdpdGFsIFN5bnRoZXNpcwojCiMgZW5kIG9mIERpcmVjdCBEaWdpdGFs
IFN5bnRoZXNpcwoKIwojIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252ZXJ0ZXJzCiMK
Q09ORklHX0FENTkzMz1tCiMgZW5kIG9mIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252
ZXJ0ZXJzCgojCiMgQWN0aXZlIGVuZXJneSBtZXRlcmluZyBJQwojCkNPTkZJR19BREU3ODU0PW0K
Q09ORklHX0FERTc4NTRfSTJDPW0KIyBlbmQgb2YgQWN0aXZlIGVuZXJneSBtZXRlcmluZyBJQwoK
IwojIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMgZW5kIG9mIFJlc29sdmVyIHRv
IGRpZ2l0YWwgY29udmVydGVycwojIGVuZCBvZiBJSU8gc3RhZ2luZyBkcml2ZXJzCgpDT05GSUdf
U1RBR0lOR19NRURJQT15CiMgQ09ORklHX0dSRVlCVVNfQk9PVFJPTSBpcyBub3Qgc2V0CkNPTkZJ
R19HUkVZQlVTX0hJRD1tCiMgQ09ORklHX0dSRVlCVVNfTElHSFQgaXMgbm90IHNldAojIENPTkZJ
R19HUkVZQlVTX0xPRyBpcyBub3Qgc2V0CkNPTkZJR19HUkVZQlVTX0xPT1BCQUNLPW0KQ09ORklH
X0dSRVlCVVNfUE9XRVI9eQpDT05GSUdfR1JFWUJVU19SQVc9eQpDT05GSUdfR1JFWUJVU19WSUJS
QVRPUj15CiMgQ09ORklHX0dSRVlCVVNfQlJJREdFRF9QSFkgaXMgbm90IHNldAojIENPTkZJR19H
UkVZQlVTX0FSQ0hFIGlzIG5vdCBzZXQKQ09ORklHX0JDTV9WSURFT0NPUkU9eQpDT05GSUdfWElM
X0FYSVNfRklGTz15CkNPTkZJR19GSUVMREJVU19ERVY9eQojIENPTkZJR19ITVNfQU5ZQlVTU19C
VVMgaXMgbm90IHNldAojIENPTkZJR19DSFJPTUVfUExBVEZPUk1TIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUVMTEFOT1hfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19PTFBDX1hPMTc1IGlzIG5v
dCBzZXQKQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1TPXkKIyBDT05GSUdfQ09NTU9OX0NMSyBpcyBu
b3Qgc2V0CkNPTkZJR19IV1NQSU5MT0NLPXkKIyBDT05GSUdfSFdTUElOTE9DS19PTUFQIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFdTUElOTE9DS19RQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdTUElO
TE9DS19TUFJEIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdTUElOTE9DS19TVE0zMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0hXU1BJTkxPQ0tfU1VONkkgaXMgbm90IHNldAojIENPTkZJR19IU0VNX1U4NTAw
IGlzIG5vdCBzZXQKQ09ORklHX01BSUxCT1g9eQojIENPTkZJR19JTVhfTUJPWCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BMQVRGT1JNX01IVSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTUFEQV8zN1hYX1JX
VE1fTUJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1JPQ0tDSElQX01CT1ggaXMgbm90IHNldApDT05G
SUdfQUxURVJBX01CT1g9bQojIENPTkZJR19ISTM2NjBfTUJPWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJNjIyMF9NQk9YIGlzIG5vdCBzZXQKQ09ORklHX01BSUxCT1hfVEVTVD15CiMgQ09ORklHX1BP
TEFSRklSRV9TT0NfTUFJTEJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01fQVBDU19JUEMgaXMg
bm90IHNldAojIENPTkZJR19CQ01fUERDX01CT1ggaXMgbm90IHNldAojIENPTkZJR19TVE0zMl9J
UENDIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX0FEU1BfTUJPWCBpcyBub3Qgc2V0CiMgQ09ORklH
X01US19DTURRX01CT1ggaXMgbm90IHNldAojIENPTkZJR19TVU42SV9NU0dCT1ggaXMgbm90IHNl
dAojIENPTkZJR19TUFJEX01CT1ggaXMgbm90IHNldAojIENPTkZJR19RQ09NX0lQQ0MgaXMgbm90
IHNldApDT05GSUdfSU9NTVVfQVBJPXkKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwojIGVuZCBv
ZiBSZW1vdGVwcm9jIGRyaXZlcnMKCiMKIyBScG1zZyBkcml2ZXJzCiMKQ09ORklHX1JQTVNHPW0K
Q09ORklHX1JQTVNHX0NUUkw9bQpDT05GSUdfUlBNU0dfTlM9bQpDT05GSUdfUlBNU0dfUUNPTV9H
TElOSz1tCkNPTkZJR19SUE1TR19RQ09NX0dMSU5LX1JQTT1tCiMgZW5kIG9mIFJwbXNnIGRyaXZl
cnMKCkNPTkZJR19TT1VORFdJUkU9bQoKIwojIFNvdW5kV2lyZSBEZXZpY2VzCiMKCiMKIyBTT0Mg
KFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2
ZXJzCiMKIyBDT05GSUdfTUVTT05fQ0FOVkFTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVTT05fQ0xL
X01FQVNVUkUgaXMgbm90IHNldAojIENPTkZJR19NRVNPTl9HWF9TT0NJTkZPIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUVTT05fTVhfU09DSU5GTyBpcyBub3Qgc2V0CiMgZW5kIG9mIEFtbG9naWMgU29D
IGRyaXZlcnMKCiMKIyBBcHBsZSBTb0MgZHJpdmVycwojCiMgQ09ORklHX0FQUExFX1JUS0lUIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVBQTEVfU0FSVCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFwcGxlIFNv
QyBkcml2ZXJzCgojCiMgQVNQRUVEIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfQVNQRUVEX0xQQ19D
VFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNQRUVEX0xQQ19TTk9PUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0FTUEVFRF9VQVJUX1JPVVRJTkcgaXMgbm90IHNldAojIENPTkZJR19BU1BFRURfUDJBX0NU
UkwgaXMgbm90IHNldAojIENPTkZJR19BU1BFRURfU09DSU5GTyBpcyBub3Qgc2V0CiMgZW5kIG9m
IEFTUEVFRCBTb0MgZHJpdmVycwoKIyBDT05GSUdfQVQ5MV9TT0NfSUQgaXMgbm90IHNldAojIENP
TkZJR19BVDkxX1NPQ19TRlIgaXMgbm90IHNldAoKIwojIEJyb2FkY29tIFNvQyBkcml2ZXJzCiMK
IyBDT05GSUdfQkNNMjgzNV9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NPQ19CQ002M1hYIGlz
IG5vdCBzZXQKIyBDT05GSUdfU09DX0JSQ01TVEIgaXMgbm90IHNldAojIENPTkZJR19CQ01fUE1C
IGlzIG5vdCBzZXQKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNj
YWxlIFFvcklRIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfUVVJQ0NfRU5HSU5FIGlzIG5vdCBzZXQK
Q09ORklHX0RQQUEyX0NPTlNPTEU9eQojIGVuZCBvZiBOWFAvRnJlZXNjYWxlIFFvcklRIFNvQyBk
cml2ZXJzCgojCiMgZnVqaXRzdSBTb0MgZHJpdmVycwojCiMgZW5kIG9mIGZ1aml0c3UgU29DIGRy
aXZlcnMKCiMKIyBpLk1YIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfU09DX0lNWDhNIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgaS5NWCBTb0MgZHJpdmVycwoKIwojIElYUDR4eCBTb0MgZHJpdmVycwojCiMg
Q09ORklHX0lYUDRYWF9RTUdSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhQNFhYX05QRSBpcyBub3Qg
c2V0CiMgZW5kIG9mIElYUDR4eCBTb0MgZHJpdmVycwoKIwojIEVuYWJsZSBMaXRlWCBTb0MgQnVp
bGRlciBzcGVjaWZpYyBkcml2ZXJzCiMKQ09ORklHX0xJVEVYPXkKQ09ORklHX0xJVEVYX1NPQ19D
T05UUk9MTEVSPXkKIyBlbmQgb2YgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmljIGRy
aXZlcnMKCiMKIyBNZWRpYVRlayBTb0MgZHJpdmVycwojCiMgQ09ORklHX01US19DTURRIGlzIG5v
dCBzZXQKIyBDT05GSUdfTVRLX0RFVkFQQyBpcyBub3Qgc2V0CiMgQ09ORklHX01US19JTkZSQUNG
RyBpcyBub3Qgc2V0CiMgQ09ORklHX01US19QTUlDX1dSQVAgaXMgbm90IHNldAojIENPTkZJR19N
VEtfU0NQU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX01NU1lTIGlzIG5vdCBzZXQKIyBlbmQg
b2YgTWVkaWFUZWsgU29DIGRyaXZlcnMKCiMKIyBRdWFsY29tbSBTb0MgZHJpdmVycwojCiMgQ09O
RklHX1FDT01fR0VOSV9TRSBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01fR1NCSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1FDT01fTExDQyBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01fUlBNSCBpcyBub3Qg
c2V0CiMgQ09ORklHX1FDT01fU01FTSBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01fU01EX1JQTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1FDT01fU1BNIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9XQ05T
U19DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9JQ0NfQldNT04gaXMgbm90IHNldAojIGVu
ZCBvZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKIyBDT05GSUdfU09DX1JFTkVTQVMgaXMgbm90IHNl
dAojIENPTkZJR19ST0NLQ0hJUF9HUkYgaXMgbm90IHNldAojIENPTkZJR19ST0NLQ0hJUF9JT0RP
TUFJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1JPQ0tDSElQX0RUUE0gaXMgbm90IHNldAojIENPTkZJ
R19TT0NfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX1NPQ19URUdSQTIwX1ZPTFRBR0VfQ09V
UExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NPQ19URUdSQTMwX1ZPTFRBR0VfQ09VUExFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NPQ19USSBpcyBub3Qgc2V0CiMgQ09ORklHX1VYNTAwX1NPQ19JRCBp
cyBub3Qgc2V0CgojCiMgWGlsaW54IFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgWGlsaW54IFNvQyBk
cml2ZXJzCiMgZW5kIG9mIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERyaXZlcnMKCkNP
TkZJR19QTV9ERVZGUkVRPXkKCiMKIyBERVZGUkVRIEdvdmVybm9ycwojCiMgQ09ORklHX0RFVkZS
RVFfR09WX1NJTVBMRV9PTkRFTUFORCBpcyBub3Qgc2V0CkNPTkZJR19ERVZGUkVRX0dPVl9QRVJG
T1JNQU5DRT1tCiMgQ09ORklHX0RFVkZSRVFfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFVkZSRVFfR09WX1VTRVJTUEFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVkZSRVFfR09W
X1BBU1NJVkUgaXMgbm90IHNldAoKIwojIERFVkZSRVEgRHJpdmVycwojCiMgQ09ORklHX0FSTV9F
WFlOT1NfQlVTX0RFVkZSRVEgaXMgbm90IHNldAojIENPTkZJR19BUk1fSU1YX0JVU19ERVZGUkVR
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX01FRElBVEVLX0NDSV9ERVZGUkVRIGlzIG5vdCBzZXQK
Q09ORklHX1BNX0RFVkZSRVFfRVZFTlQ9eQojIENPTkZJR19ERVZGUkVRX0VWRU5UX0VYWU5PU19O
T0NQIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWRlJFUV9FVkVOVF9FWFlOT1NfUFBNVSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFVkZSRVFfRVZFTlRfUk9DS0NISVBfREZJIGlzIG5vdCBzZXQKQ09ORklH
X0VYVENPTj15CgojCiMgRXh0Y29uIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0VYVENPTl9BRENf
SkFDSz1tCkNPTkZJR19FWFRDT05fRlNBOTQ4MD15CkNPTkZJR19FWFRDT05fR1BJTz15CkNPTkZJ
R19FWFRDT05fTUFYMTQ1Nzc9bQpDT05GSUdfRVhUQ09OX01BWDMzNTU9bQojIENPTkZJR19FWFRD
T05fTUFYNzc2OTMgaXMgbm90IHNldApDT05GSUdfRVhUQ09OX01BWDg5OTc9eQpDT05GSUdfRVhU
Q09OX1BUTjUxNTA9bQojIENPTkZJR19FWFRDT05fUUNPTV9TUE1JX01JU0MgaXMgbm90IHNldApD
T05GSUdfRVhUQ09OX1JUODk3M0E9bQojIENPTkZJR19FWFRDT05fU001NTAyIGlzIG5vdCBzZXQK
IyBDT05GSUdfRVhUQ09OX1VTQl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX1VTQkNf
VFVTQjMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTU9SWSBpcyBub3Qgc2V0CkNPTkZJR19JSU89
bQpDT05GSUdfSUlPX0JVRkZFUj15CkNPTkZJR19JSU9fQlVGRkVSX0NCPW0KQ09ORklHX0lJT19C
VUZGRVJfRE1BPW0KQ09ORklHX0lJT19CVUZGRVJfRE1BRU5HSU5FPW0KQ09ORklHX0lJT19CVUZG
RVJfSFdfQ09OU1VNRVI9bQpDT05GSUdfSUlPX0tGSUZPX0JVRj1tCkNPTkZJR19JSU9fVFJJR0dF
UkVEX0JVRkZFUj1tCkNPTkZJR19JSU9fQ09ORklHRlM9bQpDT05GSUdfSUlPX1RSSUdHRVI9eQpD
T05GSUdfSUlPX0NPTlNVTUVSU19QRVJfVFJJR0dFUj0yCkNPTkZJR19JSU9fU1dfREVWSUNFPW0K
Q09ORklHX0lJT19TV19UUklHR0VSPW0KQ09ORklHX0lJT19UUklHR0VSRURfRVZFTlQ9bQoKIwoj
IEFjY2VsZXJvbWV0ZXJzCiMKQ09ORklHX0FEWEwzMTM9bQpDT05GSUdfQURYTDMxM19JMkM9bQoj
IENPTkZJR19BRFhMMzQ1X0kyQyBpcyBub3Qgc2V0CkNPTkZJR19BRFhMMzU1PW0KQ09ORklHX0FE
WEwzNTVfSTJDPW0KQ09ORklHX0FEWEwzNjc9bQpDT05GSUdfQURYTDM2N19JMkM9bQpDT05GSUdf
QURYTDM3Mj1tCkNPTkZJR19BRFhMMzcyX0kyQz1tCkNPTkZJR19CTUE0MDA9bQpDT05GSUdfQk1B
NDAwX0kyQz1tCkNPTkZJR19CTUMxNTBfQUNDRUw9bQpDT05GSUdfQk1DMTUwX0FDQ0VMX0kyQz1t
CkNPTkZJR19EQTI4MD1tCkNPTkZJR19EQTMxMT1tCkNPTkZJR19ETUFSRDA2PW0KIyBDT05GSUdf
RE1BUkQwOSBpcyBub3Qgc2V0CkNPTkZJR19ETUFSRDEwPW0KQ09ORklHX0ZYTFM4OTYyQUY9bQpD
T05GSUdfRlhMUzg5NjJBRl9JMkM9bQpDT05GSUdfSElEX1NFTlNPUl9BQ0NFTF8zRD1tCkNPTkZJ
R19LWFNEOT1tCkNPTkZJR19LWFNEOV9JMkM9bQojIENPTkZJR19LWENKSzEwMTMgaXMgbm90IHNl
dApDT05GSUdfTUMzMjMwPW0KQ09ORklHX01NQTc0NTU9bQpDT05GSUdfTU1BNzQ1NV9JMkM9bQoj
IENPTkZJR19NTUE3NjYwIGlzIG5vdCBzZXQKQ09ORklHX01NQTg0NTI9bQpDT05GSUdfTU1BOTU1
MV9DT1JFPW0KQ09ORklHX01NQTk1NTE9bQpDT05GSUdfTU1BOTU1Mz1tCkNPTkZJR19NWEM0MDA1
PW0KQ09ORklHX01YQzYyNTU9bQpDT05GSUdfU1RLODMxMj1tCkNPTkZJR19TVEs4QkE1MD1tCiMg
ZW5kIG9mIEFjY2VsZXJvbWV0ZXJzCgojCiMgQW5hbG9nIHRvIGRpZ2l0YWwgY29udmVydGVycwoj
CkNPTkZJR19BRDcwOTFSNT1tCkNPTkZJR19BRDcyOTE9bQpDT05GSUdfQUQ3NjA2PW0KQ09ORklH
X0FENzYwNl9JRkFDRV9QQVJBTExFTD1tCkNPTkZJR19BRDc5OVg9bQpDT05GSUdfQURJX0FYSV9B
REM9bQojIENPTkZJR19BVDkxX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUOTFfU0FNQTVEMl9B
REMgaXMgbm90IHNldAojIENPTkZJR19BWFAyMFhfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfQVhQ
Mjg4X0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTV9JUFJPQ19BREMgaXMgbm90IHNldAojIENP
TkZJR19CRVJMSU4yX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RBOTE1MF9HUEFEQyBpcyBub3Qg
c2V0CkNPTkZJR19FTlZFTE9QRV9ERVRFQ1RPUj1tCiMgQ09ORklHX0VYWU5PU19BREMgaXMgbm90
IHNldApDT05GSUdfSFg3MTE9bQpDT05GSUdfSU5BMlhYX0FEQz1tCiMgQ09ORklHX0lOR0VOSUNf
QURDIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1YN0RfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1Y
OFFYUF9BREMgaXMgbm90IHNldApDT05GSUdfTFA4Nzg4X0FEQz1tCiMgQ09ORklHX0xQQzE4WFhf
QURDIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDMzJYWF9BREMgaXMgbm90IHNldApDT05GSUdfTFRD
MjQ3MT1tCkNPTkZJR19MVEMyNDg1PW0KIyBDT05GSUdfTFRDMjQ5NyBpcyBub3Qgc2V0CkNPTkZJ
R19NQVgxMzYzPW0KIyBDT05GSUdfTUFYOTYxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDM0MjIg
aXMgbm90IHNldAojIENPTkZJR19NRURJQVRFS19NVDY1NzdfQVVYQURDIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVAyNjI5X0FEQyBpcyBub3Qgc2V0CkNPTkZJR19OQVU3ODAyPW0KIyBDT05GSUdfTlBD
TV9BREMgaXMgbm90IHNldApDT05GSUdfUUNPTV9WQURDX0NPTU1PTj1tCiMgQ09ORklHX1FDT01f
U1BNSV9JQURDIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fU1BNSV9WQURDPW0KIyBDT05GSUdfUUNP
TV9TUE1JX0FEQzUgaXMgbm90IHNldAojIENPTkZJR19SQ0FSX0dZUk9fQURDIGlzIG5vdCBzZXQK
Q09ORklHX1JONVQ2MThfQURDPW0KIyBDT05GSUdfUk9DS0NISVBfU0FSQURDIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlpHMkxfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0MyN1hYX0FEQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQRUFSX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NEX0FEQ19NT0RVTEFU
T1IgaXMgbm90IHNldAojIENPTkZJR19TVE0zMl9BRENfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NUTTMyX0RGU0RNX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19TVE0zMl9ERlNETV9BREMgaXMg
bm90IHNldAojIENPTkZJR19TVE1QRV9BREMgaXMgbm90IHNldApDT05GSUdfVElfQURDMDgxQz1t
CkNPTkZJR19USV9BRFMxMDE1PW0KIyBDT05GSUdfVFdMNDAzMF9NQURDIGlzIG5vdCBzZXQKQ09O
RklHX1RXTDYwMzBfR1BBREM9bQpDT05GSUdfVkY2MTBfQURDPW0KQ09ORklHX1ZJUEVSQk9BUkRf
QURDPW0KQ09ORklHX1hJTElOWF9YQURDPW0KIyBDT05GSUdfWElMSU5YX0FNUyBpcyBub3Qgc2V0
CiMgZW5kIG9mIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBBbmFsb2cgdG8gZGln
aXRhbCBhbmQgZGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwojCiMgZW5kIG9mIEFuYWxvZyB0
byBkaWdpdGFsIGFuZCBkaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCgojCiMgQW5hbG9nIEZy
b250IEVuZHMKIwpDT05GSUdfSUlPX1JFU0NBTEU9bQojIGVuZCBvZiBBbmFsb2cgRnJvbnQgRW5k
cwoKIwojIEFtcGxpZmllcnMKIwpDT05GSUdfSE1DNDI1PW0KIyBlbmQgb2YgQW1wbGlmaWVycwoK
IwojIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVycwojCkNPTkZJR19BRDcxNTA9bQoj
IGVuZCBvZiBDYXBhY2l0YW5jZSB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBDaGVtaWNhbCBT
ZW5zb3JzCiMKIyBDT05GSUdfQVRMQVNfUEhfU0VOU09SIGlzIG5vdCBzZXQKQ09ORklHX0FUTEFT
X0VaT19TRU5TT1I9bQpDT05GSUdfQk1FNjgwPW0KQ09ORklHX0JNRTY4MF9JMkM9bQpDT05GSUdf
Q0NTODExPW0KQ09ORklHX0lBUUNPUkU9bQojIENPTkZJR19QTVM3MDAzIGlzIG5vdCBzZXQKQ09O
RklHX1NDRDMwX0NPUkU9bQpDT05GSUdfU0NEMzBfSTJDPW0KQ09ORklHX1NDRDMwX1NFUklBTD1t
CkNPTkZJR19TQ0Q0WD1tCkNPTkZJR19TRU5TSVJJT05fU0dQMzA9bQpDT05GSUdfU0VOU0lSSU9O
X1NHUDQwPW0KQ09ORklHX1NQUzMwPW0KQ09ORklHX1NQUzMwX0kyQz1tCkNPTkZJR19TUFMzMF9T
RVJJQUw9bQpDT05GSUdfU0VOU0VBSVJfU1VOUklTRV9DTzI9bQpDT05GSUdfVlo4OVg9bQojIGVu
ZCBvZiBDaGVtaWNhbCBTZW5zb3JzCgojCiMgSGlkIFNlbnNvciBJSU8gQ29tbW9uCiMKQ09ORklH
X0hJRF9TRU5TT1JfSUlPX0NPTU1PTj1tCkNPTkZJR19ISURfU0VOU09SX0lJT19UUklHR0VSPW0K
IyBlbmQgb2YgSGlkIFNlbnNvciBJSU8gQ29tbW9uCgpDT05GSUdfSUlPX01TX1NFTlNPUlNfSTJD
PW0KCiMKIyBJSU8gU0NNSSBTZW5zb3JzCiMKIyBlbmQgb2YgSUlPIFNDTUkgU2Vuc29ycwoKIwoj
IFNTUCBTZW5zb3IgQ29tbW9uCiMKIyBlbmQgb2YgU1NQIFNlbnNvciBDb21tb24KCkNPTkZJR19J
SU9fU1RfU0VOU09SU19JMkM9bQpDT05GSUdfSUlPX1NUX1NFTlNPUlNfQ09SRT1tCgojCiMgRGln
aXRhbCB0byBhbmFsb2cgY29udmVydGVycwojCkNPTkZJR19BRDUwNjQ9bQpDT05GSUdfQUQ1Mzgw
PW0KQ09ORklHX0FENTQ0Nj1tCkNPTkZJR19BRDU1OTJSX0JBU0U9bQpDT05GSUdfQUQ1NTkzUj1t
CkNPTkZJR19BRDU2ODY9bQpDT05GSUdfQUQ1Njk2X0kyQz1tCkNPTkZJR19EUE9UX0RBQz1tCiMg
Q09ORklHX0RTNDQyNCBpcyBub3Qgc2V0CiMgQ09ORklHX0xQQzE4WFhfREFDIGlzIG5vdCBzZXQK
Q09ORklHX002MjMzMj1tCiMgQ09ORklHX01BWDUxNyBpcyBub3Qgc2V0CkNPTkZJR19NQVg1ODIx
PW0KQ09ORklHX01DUDQ3MjU9bQojIENPTkZJR19TVE0zMl9EQUMgaXMgbm90IHNldAojIENPTkZJ
R19USV9EQUM1NTcxIGlzIG5vdCBzZXQKQ09ORklHX1ZGNjEwX0RBQz1tCiMgZW5kIG9mIERpZ2l0
YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBJSU8gZHVtbXkgZHJpdmVyCiMKQ09ORklHX0lJ
T19EVU1NWV9FVkdFTj1tCkNPTkZJR19JSU9fU0lNUExFX0RVTU1ZPW0KQ09ORklHX0lJT19TSU1Q
TEVfRFVNTVlfRVZFTlRTPXkKQ09ORklHX0lJT19TSU1QTEVfRFVNTVlfQlVGRkVSPXkKIyBlbmQg
b2YgSUlPIGR1bW15IGRyaXZlcgoKIwojIEZpbHRlcnMKIwojIGVuZCBvZiBGaWx0ZXJzCgojCiMg
RnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCiMKCiMKIyBDbG9jayBHZW5lcmF0b3IvRGlz
dHJpYnV0aW9uCiMKIyBlbmQgb2YgQ2xvY2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlvbgoKIwojIFBo
YXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwojIGVuZCBvZiBQ
aGFzZS1Mb2NrZWQgTG9vcCAoUExMKSBmcmVxdWVuY3kgc3ludGhlc2l6ZXJzCiMgZW5kIG9mIEZy
ZXF1ZW5jeSBTeW50aGVzaXplcnMgRERTL1BMTAoKIwojIERpZ2l0YWwgZ3lyb3Njb3BlIHNlbnNv
cnMKIwojIENPTkZJR19CTUcxNjAgaXMgbm90IHNldApDT05GSUdfRlhBUzIxMDAyQz1tCkNPTkZJ
R19GWEFTMjEwMDJDX0kyQz1tCkNPTkZJR19ISURfU0VOU09SX0dZUk9fM0Q9bQpDT05GSUdfTVBV
MzA1MD1tCkNPTkZJR19NUFUzMDUwX0kyQz1tCkNPTkZJR19JSU9fU1RfR1lST18zQVhJUz1tCkNP
TkZJR19JSU9fU1RfR1lST19JMkNfM0FYSVM9bQpDT05GSUdfSVRHMzIwMD1tCiMgZW5kIG9mIERp
Z2l0YWwgZ3lyb3Njb3BlIHNlbnNvcnMKCiMKIyBIZWFsdGggU2Vuc29ycwojCgojCiMgSGVhcnQg
UmF0ZSBNb25pdG9ycwojCiMgQ09ORklHX0FGRTQ0MDQgaXMgbm90IHNldApDT05GSUdfTUFYMzAx
MDA9bQojIENPTkZJR19NQVgzMDEwMiBpcyBub3Qgc2V0CiMgZW5kIG9mIEhlYXJ0IFJhdGUgTW9u
aXRvcnMKIyBlbmQgb2YgSGVhbHRoIFNlbnNvcnMKCiMKIyBIdW1pZGl0eSBzZW5zb3JzCiMKQ09O
RklHX0FNMjMxNT1tCkNPTkZJR19ESFQxMT1tCkNPTkZJR19IREMxMDBYPW0KIyBDT05GSUdfSERD
MjAxMCBpcyBub3Qgc2V0CkNPTkZJR19ISURfU0VOU09SX0hVTUlESVRZPW0KQ09ORklHX0hUUzIy
MT1tCkNPTkZJR19IVFMyMjFfSTJDPW0KQ09ORklHX0hUVTIxPW0KIyBDT05GSUdfU0k3MDA1IGlz
IG5vdCBzZXQKQ09ORklHX1NJNzAyMD1tCiMgZW5kIG9mIEh1bWlkaXR5IHNlbnNvcnMKCiMKIyBJ
bmVydGlhbCBtZWFzdXJlbWVudCB1bml0cwojCiMgQ09ORklHX0JNSTE2MF9JMkMgaXMgbm90IHNl
dApDT05GSUdfRlhPUzg3MDA9bQpDT05GSUdfRlhPUzg3MDBfSTJDPW0KIyBDT05GSUdfS01YNjEg
aXMgbm90IHNldAojIENPTkZJR19JTlZfSUNNNDI2MDBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5WX01QVTYwNTBfSTJDIGlzIG5vdCBzZXQKQ09ORklHX0lJT19TVF9MU002RFNYPW0KQ09ORklH
X0lJT19TVF9MU002RFNYX0kyQz1tCkNPTkZJR19JSU9fU1RfTFNNNkRTWF9JM0M9bQojIGVuZCBv
ZiBJbmVydGlhbCBtZWFzdXJlbWVudCB1bml0cwoKIwojIExpZ2h0IHNlbnNvcnMKIwojIENPTkZJ
R19BREpEX1MzMTEgaXMgbm90IHNldApDT05GSUdfQURVWDEwMjA9bQpDT05GSUdfQUwzMDEwPW0K
Q09ORklHX0FMMzMyMEE9bQpDT05GSUdfQVBEUzkzMDA9bQpDT05GSUdfQVBEUzk5NjA9bQojIENP
TkZJR19BUzczMjExIGlzIG5vdCBzZXQKQ09ORklHX0JIMTc1MD1tCkNPTkZJR19CSDE3ODA9bQpD
T05GSUdfQ00zMjE4MT1tCiMgQ09ORklHX0NNMzIzMiBpcyBub3Qgc2V0CkNPTkZJR19DTTMzMjM9
bQpDT05GSUdfQ00zNjA1PW0KIyBDT05GSUdfQ00zNjY1MSBpcyBub3Qgc2V0CkNPTkZJR19HUDJB
UDAwMj1tCkNPTkZJR19HUDJBUDAyMEEwMEY9bQojIENPTkZJR19JUVM2MjFfQUxTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19JU0wyOTAxOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
SVNMMjkwMjggaXMgbm90IHNldAojIENPTkZJR19JU0wyOTEyNSBpcyBub3Qgc2V0CkNPTkZJR19I
SURfU0VOU09SX0FMUz1tCkNPTkZJR19ISURfU0VOU09SX1BST1g9bQpDT05GSUdfSlNBMTIxMj1t
CkNPTkZJR19SUFIwNTIxPW0KIyBDT05GSUdfTFRSNTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTFYw
MTA0Q1MgaXMgbm90IHNldApDT05GSUdfTUFYNDQwMDA9bQpDT05GSUdfTUFYNDQwMDk9bQpDT05G
SUdfTk9BMTMwNT1tCkNPTkZJR19PUFQzMDAxPW0KQ09ORklHX1BBMTIyMDMwMDE9bQpDT05GSUdf
U0kxMTMzPW0KQ09ORklHX1NJMTE0NT1tCkNPTkZJR19TVEszMzEwPW0KQ09ORklHX1NUX1VWSVMy
NT1tCkNPTkZJR19TVF9VVklTMjVfSTJDPW0KQ09ORklHX1RDUzM0MTQ9bQpDT05GSUdfVENTMzQ3
Mj1tCkNPTkZJR19TRU5TT1JTX1RTTDI1NjM9bQojIENPTkZJR19UU0wyNTgzIGlzIG5vdCBzZXQK
Q09ORklHX1RTTDI1OTE9bQojIENPTkZJR19UU0wyNzcyIGlzIG5vdCBzZXQKIyBDT05GSUdfVFNM
NDUzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTNTE4MkQgaXMgbm90IHNldAojIENPTkZJR19WQ05M
NDAwMCBpcyBub3Qgc2V0CkNPTkZJR19WQ05MNDAzNT1tCkNPTkZJR19WRU1MNjAzMD1tCkNPTkZJ
R19WRU1MNjA3MD1tCkNPTkZJR19WTDYxODA9bQojIENPTkZJR19aT1BUMjIwMSBpcyBub3Qgc2V0
CiMgZW5kIG9mIExpZ2h0IHNlbnNvcnMKCiMKIyBNYWduZXRvbWV0ZXIgc2Vuc29ycwojCkNPTkZJ
R19BSzg5NzQ9bQpDT05GSUdfQUs4OTc1PW0KIyBDT05GSUdfQUswOTkxMSBpcyBub3Qgc2V0CkNP
TkZJR19CTUMxNTBfTUFHTj1tCkNPTkZJR19CTUMxNTBfTUFHTl9JMkM9bQpDT05GSUdfTUFHMzEx
MD1tCiMgQ09ORklHX0hJRF9TRU5TT1JfTUFHTkVUT01FVEVSXzNEIGlzIG5vdCBzZXQKQ09ORklH
X01NQzM1MjQwPW0KQ09ORklHX0lJT19TVF9NQUdOXzNBWElTPW0KQ09ORklHX0lJT19TVF9NQUdO
X0kyQ18zQVhJUz1tCkNPTkZJR19TRU5TT1JTX0hNQzU4NDM9bQpDT05GSUdfU0VOU09SU19ITUM1
ODQzX0kyQz1tCiMgQ09ORklHX1NFTlNPUlNfUk0zMTAwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1lBTUFIQV9ZQVM1MzAgaXMgbm90IHNldAojIGVuZCBvZiBNYWduZXRvbWV0ZXIgc2Vuc29ycwoK
IwojIE11bHRpcGxleGVycwojCiMgQ09ORklHX0lJT19NVVggaXMgbm90IHNldAojIGVuZCBvZiBN
dWx0aXBsZXhlcnMKCiMKIyBJbmNsaW5vbWV0ZXIgc2Vuc29ycwojCiMgQ09ORklHX0hJRF9TRU5T
T1JfSU5DTElOT01FVEVSXzNEIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TRU5TT1JfREVWSUNFX1JP
VEFUSU9OPW0KIyBlbmQgb2YgSW5jbGlub21ldGVyIHNlbnNvcnMKCkNPTkZJR19JSU9fUkVTQ0FM
RV9LVU5JVF9URVNUPW0KQ09ORklHX0lJT19GT1JNQVRfS1VOSVRfVEVTVD1tCgojCiMgVHJpZ2dl
cnMgLSBzdGFuZGFsb25lCiMKIyBDT05GSUdfSUlPX0hSVElNRVJfVFJJR0dFUiBpcyBub3Qgc2V0
CkNPTkZJR19JSU9fSU5URVJSVVBUX1RSSUdHRVI9bQojIENPTkZJR19JSU9fU1RNMzJfTFBUSU1F
Ul9UUklHR0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NUTTMyX1RJTUVSX1RSSUdHRVIgaXMg
bm90IHNldAojIENPTkZJR19JSU9fVElHSFRMT09QX1RSSUdHRVIgaXMgbm90IHNldApDT05GSUdf
SUlPX1NZU0ZTX1RSSUdHRVI9bQojIGVuZCBvZiBUcmlnZ2VycyAtIHN0YW5kYWxvbmUKCiMKIyBM
aW5lYXIgYW5kIGFuZ3VsYXIgcG9zaXRpb24gc2Vuc29ycwojCiMgQ09ORklHX0lRUzYyNF9QT1Mg
aXMgbm90IHNldAojIENPTkZJR19ISURfU0VOU09SX0NVU1RPTV9JTlRFTF9ISU5HRSBpcyBub3Qg
c2V0CiMgZW5kIG9mIExpbmVhciBhbmQgYW5ndWxhciBwb3NpdGlvbiBzZW5zb3JzCgojCiMgRGln
aXRhbCBwb3RlbnRpb21ldGVycwojCiMgQ09ORklHX0FENTExMCBpcyBub3Qgc2V0CkNPTkZJR19B
RDUyNzI9bQpDT05GSUdfRFMxODAzPW0KQ09ORklHX01BWDU0MzI9bQpDT05GSUdfTUNQNDAxOD1t
CkNPTkZJR19NQ1A0NTMxPW0KQ09ORklHX1RQTDAxMDI9bQojIGVuZCBvZiBEaWdpdGFsIHBvdGVu
dGlvbWV0ZXJzCgojCiMgRGlnaXRhbCBwb3RlbnRpb3N0YXRzCiMKQ09ORklHX0xNUDkxMDAwPW0K
IyBlbmQgb2YgRGlnaXRhbCBwb3RlbnRpb3N0YXRzCgojCiMgUHJlc3N1cmUgc2Vuc29ycwojCiMg
Q09ORklHX0FCUDA2ME1HIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1QMjgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfRExITDYwRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RQUzMxMCBpcyBub3Qgc2V0CkNPTkZJ
R19ISURfU0VOU09SX1BSRVNTPW0KIyBDT05GSUdfSFAwMyBpcyBub3Qgc2V0CkNPTkZJR19JQ1Ax
MDEwMD1tCkNPTkZJR19NUEwxMTU9bQpDT05GSUdfTVBMMTE1X0kyQz1tCiMgQ09ORklHX01QTDMx
MTUgaXMgbm90IHNldApDT05GSUdfTVM1NjExPW0KIyBDT05GSUdfTVM1NjExX0kyQyBpcyBub3Qg
c2V0CkNPTkZJR19NUzU2Mzc9bQpDT05GSUdfSUlPX1NUX1BSRVNTPW0KIyBDT05GSUdfSUlPX1NU
X1BSRVNTX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1Q1NDAzIGlzIG5vdCBzZXQKQ09ORklHX0hQ
MjA2Qz1tCiMgQ09ORklHX1pQQTIzMjYgaXMgbm90IHNldAojIGVuZCBvZiBQcmVzc3VyZSBzZW5z
b3JzCgojCiMgTGlnaHRuaW5nIHNlbnNvcnMKIwojIGVuZCBvZiBMaWdodG5pbmcgc2Vuc29ycwoK
IwojIFByb3hpbWl0eSBhbmQgZGlzdGFuY2Ugc2Vuc29ycwojCiMgQ09ORklHX0lTTDI5NTAxIGlz
IG5vdCBzZXQKQ09ORklHX0xJREFSX0xJVEVfVjI9bQpDT05GSUdfTUIxMjMyPW0KQ09ORklHX1BJ
Tkc9bQpDT05GSUdfUkZENzc0MDI9bQpDT05GSUdfU1JGMDQ9bQpDT05GSUdfU1hfQ09NTU9OPW0K
Q09ORklHX1NYOTMxMD1tCiMgQ09ORklHX1NYOTMyNCBpcyBub3Qgc2V0CkNPTkZJR19TWDkzNjA9
bQojIENPTkZJR19TWDk1MDAgaXMgbm90IHNldAojIENPTkZJR19TUkYwOCBpcyBub3Qgc2V0CkNP
TkZJR19WQ05MMzAyMD1tCkNPTkZJR19WTDUzTDBYX0kyQz1tCiMgZW5kIG9mIFByb3hpbWl0eSBh
bmQgZGlzdGFuY2Ugc2Vuc29ycwoKIwojIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwoj
CiMgZW5kIG9mIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIFRlbXBlcmF0dXJl
IHNlbnNvcnMKIwojIENPTkZJR19JUVM2MjBBVF9URU1QIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9T
RU5TT1JfVEVNUD1tCkNPTkZJR19NTFg5MDYxND1tCkNPTkZJR19NTFg5MDYzMj1tCkNPTkZJR19U
TVAwMDY9bQojIENPTkZJR19UTVAwMDcgaXMgbm90IHNldApDT05GSUdfVE1QMTE3PW0KIyBDT05G
SUdfVFNZUzAxIGlzIG5vdCBzZXQKQ09ORklHX1RTWVMwMkQ9bQojIGVuZCBvZiBUZW1wZXJhdHVy
ZSBzZW5zb3JzCgpDT05GSUdfUFdNPXkKQ09ORklHX1BXTV9TWVNGUz15CiMgQ09ORklHX1BXTV9E
RUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9BVE1FTCBpcyBub3Qgc2V0CkNPTkZJR19QV01f
QVRNRUxfVENCPW0KIyBDT05GSUdfUFdNX0JDTTI4MzUgaXMgbm90IHNldAojIENPTkZJR19QV01f
QkVSTElOIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX0JSQ01TVEIgaXMgbm90IHNldAojIENPTkZJ
R19QV01fQ0xLIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX0NMUFM3MTFYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUFdNX0VQOTNYWCBpcyBub3Qgc2V0CkNPTkZJR19QV01fRlNMX0ZUTT15CiMgQ09ORklH
X1BXTV9ISUJWVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9JTVgxIGlzIG5vdCBzZXQKIyBDT05G
SUdfUFdNX0lNWDI3IGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX0lOVEVMX0xHTSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BXTV9JUVM2MjBBIGlzIG5vdCBzZXQKQ09ORklHX1BXTV9MUDM5NDM9eQojIENP
TkZJR19QV01fTFBDMThYWF9TQ1QgaXMgbm90IHNldAojIENPTkZJR19QV01fTFBDMzJYWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BXTV9MUFNTX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdN
X01US19ESVNQIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX01FRElBVEVLIGlzIG5vdCBzZXQKIyBD
T05GSUdfUFdNX01YUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9PTUFQX0RNVElNRVIgaXMgbm90
IHNldApDT05GSUdfUFdNX1BDQTk2ODU9bQojIENPTkZJR19QV01fUFhBIGlzIG5vdCBzZXQKIyBD
T05GSUdfUFdNX1JBU1BCRVJSWVBJX1BPRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9SQ0FSIGlz
IG5vdCBzZXQKIyBDT05GSUdfUFdNX1JFTkVTQVNfVFBVIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdN
X1JPQ0tDSElQIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX1NBTVNVTkcgaXMgbm90IHNldAojIENP
TkZJR19QV01fU0wyOENQTEQgaXMgbm90IHNldAojIENPTkZJR19QV01fU1BFQVIgaXMgbm90IHNl
dAojIENPTkZJR19QV01fU1BSRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9TVEkgaXMgbm90IHNl
dAojIENPTkZJR19QV01fU1RNMzIgaXMgbm90IHNldAojIENPTkZJR19QV01fU1RNMzJfTFAgaXMg
bm90IHNldAojIENPTkZJR19QV01fU1RNUEUgaXMgbm90IHNldAojIENPTkZJR19QV01fU1VOUExV
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9URUdSQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9U
SUVDQVAgaXMgbm90IHNldAojIENPTkZJR19QV01fVElFSFJQV00gaXMgbm90IHNldApDT05GSUdf
UFdNX1RXTD1tCiMgQ09ORklHX1BXTV9UV0xfTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX1ZJ
U0NPTlRJIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX1ZUODUwMCBpcyBub3Qgc2V0CgojCiMgSVJR
IGNoaXAgc3VwcG9ydAojCkNPTkZJR19JUlFDSElQPXkKQ09ORklHX0FMX0ZJQz15CiMgQ09ORklH
X0pDT1JFX0FJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfSU5UQ19JUlFQSU4gaXMgbm90
IHNldAojIENPTkZJR19SRU5FU0FTX0lSUUMgaXMgbm90IHNldAojIENPTkZJR19SRU5FU0FTX1Ja
QTFfSVJRQyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfUlpHMkxfSVJRQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NMMjhDUExEX0lOVEMgaXMgbm90IHNldAojIENPTkZJR19UUzQ4MDBfSVJRIGlz
IG5vdCBzZXQKQ09ORklHX1hJTElOWF9JTlRDPXkKIyBDT05GSUdfSU5HRU5JQ19UQ1VfSVJRIGlz
IG5vdCBzZXQKIyBDT05GSUdfSVJRX1VOSVBISUVSX0FJREVUIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUVTT05fSVJRX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19JTVhfSVJRU1RFRVIgaXMgbm90IHNl
dAojIENPTkZJR19JTVhfSU5UTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhZTk9TX0lSUV9DT01C
SU5FUiBpcyBub3Qgc2V0CiMgQ09ORklHX01TVF9JUlEgaXMgbm90IHNldAojIENPTkZJR19NQ0hQ
X0VJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTlBMVVNfU1A3MDIxX0lOVEMgaXMgbm90IHNldAoj
IGVuZCBvZiBJUlEgY2hpcCBzdXBwb3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90IHNldApD
T05GSUdfUkVTRVRfQ09OVFJPTExFUj15CiMgQ09ORklHX1JFU0VUX0ExMFNSIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVTRVRfQVRINzkgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9BWFMxMFggaXMg
bm90IHNldAojIENPTkZJR19SRVNFVF9CQ002MzQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRf
QkVSTElOIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfQlJDTVNUQiBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFU0VUX0JSQ01TVEJfUkVTQ0FMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfSFNESyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0lNWDcgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9J
TlRFTF9HVyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0syMTAgaXMgbm90IHNldAojIENPTkZJ
R19SRVNFVF9MQU5USVEgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9MUEMxOFhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVTRVRfTUNIUF9TUEFSWDUgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9N
RVNPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX01FU09OX0FVRElPX0FSQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFU0VUX05QQ00gaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9QSVNUQUNISU8g
aXMgbm90IHNldAojIENPTkZJR19SRVNFVF9RQ09NX0FPU1MgaXMgbm90IHNldAojIENPTkZJR19S
RVNFVF9RQ09NX1BEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX1JBU1BCRVJSWVBJIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVTRVRfUlpHMkxfVVNCUEhZX0NUUkwgaXMgbm90IHNldAojIENPTkZJ
R19SRVNFVF9TQ01JIGlzIG5vdCBzZXQKQ09ORklHX1JFU0VUX1NJTVBMRT15CiMgQ09ORklHX1JF
U0VUX1NPQ0ZQR0EgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9TVEFSRklWRV9KSDcxMDAgaXMg
bm90IHNldAojIENPTkZJR19SRVNFVF9TVU5QTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRf
U1VOWEkgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9USV9TQ0kgaXMgbm90IHNldApDT05GSUdf
UkVTRVRfVElfU1lTQ09OPXkKQ09ORklHX1JFU0VUX1RJX1RQUzM4MFg9eQojIENPTkZJR19SRVNF
VF9UTjQ4TV9DUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfVU5JUEhJRVIgaXMgbm90IHNl
dAojIENPTkZJR19SRVNFVF9VTklQSElFUl9HTFVFIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRf
WllOUSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9SRVNFVF9ISTM2NjAgaXMgbm90IHNldAoj
IENPTkZJR19DT01NT05fUkVTRVRfSEk2MjIwIGlzIG5vdCBzZXQKCiMKIyBQSFkgU3Vic3lzdGVt
CiMKQ09ORklHX0dFTkVSSUNfUEhZPXkKQ09ORklHX0dFTkVSSUNfUEhZX01JUElfRFBIWT15CiMg
Q09ORklHX1BIWV9MUEMxOFhYX1VTQl9PVEcgaXMgbm90IHNldAojIENPTkZJR19QSFlfUElTVEFD
SElPX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9YR0VORSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9MR01fUEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9DQU5fVFJBTlNDRUlWRVI9eQojIENP
TkZJR19QSFlfU1VONElfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1NVTjlJX1VTQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BIWV9TVU41MElfVVNCMyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9N
RVNPTjhfSERNSV9UWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NRVNPTjhCX1VTQjIgaXMgbm90
IHNldAojIENPTkZJR19QSFlfTUVTT05fR1hMX1VTQjIgaXMgbm90IHNldAojIENPTkZJR19QSFlf
TUVTT05fRzEyQV9NSVBJX0RQSFlfQU5BTE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01FU09O
X0cxMkFfVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NRVNPTl9HMTJBX1VTQjNfUENJRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NRVNPTl9BWEdfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BIWV9NRVNPTl9BWEdfTUlQSV9QQ0lFX0FOQUxPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9N
RVNPTl9BWEdfTUlQSV9EUEhZIGlzIG5vdCBzZXQKCiMKIyBQSFkgZHJpdmVycyBmb3IgQnJvYWRj
b20gcGxhdGZvcm1zCiMKIyBDT05GSUdfUEhZX0JDTTYzWFhfVVNCSCBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIWV9DWUdOVVNfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9CQ01fU1JfVVNCIGlz
IG5vdCBzZXQKQ09ORklHX0JDTV9LT05BX1VTQjJfUEhZPW0KIyBDT05GSUdfUEhZX0JDTV9OU19V
U0IyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX05TMl9VU0JfRFJEIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEhZX0JSQ01fU0FUQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9CUkNNX1VTQiBpcyBub3Qg
c2V0CiMgQ09ORklHX1BIWV9CQ01fU1JfUENJRSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBkcml2
ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKCkNPTkZJR19QSFlfQ0FERU5DRV9EUEhZPXkKQ09O
RklHX1BIWV9DQURFTkNFX0RQSFlfUlg9bQpDT05GSUdfUEhZX0NBREVOQ0VfU0FMVk89eQojIENP
TkZJR19QSFlfRlNMX0lNWDhNUV9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfTUlYRUxfTFZE
U19QSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfTUlYRUxfTUlQSV9EUEhZIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX0ZTTF9JTVg4TV9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0ZTTF9M
WU5YXzI4RyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ISTYyMjBfVVNCIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX0hJMzY2MF9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfSEkzNjcwX1VTQiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ISTM2NzBfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BI
WV9ISVNUQl9DT01CUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0hJU0lfSU5OT19VU0IyIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEhZX0lOR0VOSUNfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X0xBTlRJUV9WUlgyMDBfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9MQU5USVFfUkNVX1VT
QjIgaXMgbm90IHNldAojIENPTkZJR19BUk1BREEzNzVfVVNCQ0xVU1RFUl9QSFkgaXMgbm90IHNl
dAojIENPTkZJR19QSFlfQkVSTElOX1NBVEEgaXMgbm90IHNldAojIENPTkZJR19QSFlfQkVSTElO
X1VTQiBpcyBub3Qgc2V0CkNPTkZJR19QSFlfTVZFQlVfQTM3MDBfVVRNST15CiMgQ09ORklHX1BI
WV9NVkVCVV9BMzhYX0NPTVBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NVkVCVV9DUDExMF9V
VE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX0hTSUMgaXMgbm90IHNldApDT05G
SUdfUEhZX1BYQV8yOE5NX1VTQjI9eQojIENPTkZJR19QSFlfUFhBX1VTQiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9NTVAzX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NTVAzX0hTSUMgaXMg
bm90IHNldAojIENPTkZJR19QSFlfTVRLX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfTVRL
X1RQSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfTVRLX1VGUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BIWV9NVEtfWFNQSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfTVRLX0RQIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX1NQQVJYNV9TRVJERVMgaXMgbm90IHNldApDT05GSUdfUEhZX0xBTjk2Nlhf
U0VSREVTPXkKIyBDT05GSUdfUEhZX0NQQ0FQX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19QSFlfTUFQ
UEhPTkVfTURNNjYwMD1tCkNPTkZJR19QSFlfT0NFTE9UX1NFUkRFUz1tCiMgQ09ORklHX1BIWV9B
VEg3OV9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfUUNPTV9JUFE0MDE5X1VTQiBpcyBub3Qg
c2V0CiMgQ09ORklHX1BIWV9RQ09NX1FVU0IyIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9RQ09NX1VT
Ql9IUz15CiMgQ09ORklHX1BIWV9RQ09NX1VTQl9TTlBTX0ZFTVRPX1YyIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX1FDT01fVVNCX0hTSUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfUUNPTV9VU0Jf
SFNfMjhOTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9RQ09NX1VTQl9TUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9RQ09NX0lQUTgwNlhfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01UNzYy
MV9QQ0kgaXMgbm90IHNldAojIENPTkZJR19QSFlfUkFMSU5LX1VTQiBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIWV9SQ0FSX0dFTjNfVVNCMyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ST0NLQ0hJUF9E
UEhZX1JYMCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ST0NLQ0hJUF9JTk5PX0NTSURQSFkgaXMg
bm90IHNldAojIENPTkZJR19QSFlfUk9DS0NISVBfSU5OT19EU0lEUEhZIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX1JPQ0tDSElQX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfUk9DS0NISVBf
VFlQRUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfRVhZTk9TX0RQX1ZJREVPIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX0VYWU5PU19NSVBJX1ZJREVPIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0VY
WU5PU19QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1NBTVNVTkdfVUZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX1NBTVNVTkdfVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9VTklQSElF
Ul9VU0IyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1VOSVBISUVSX1VTQjMgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfVU5JUEhJRVJfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9VTklQSElF
Ul9BSENJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1NUX1NQRUFSMTMxMF9NSVBIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BIWV9TVF9TUEVBUjEzNDBfTUlQSFkgaXMgbm90IHNldAojIENPTkZJR19Q
SFlfU1RJSDQwN19VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfVEVHUkExOTRfUDJVIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEhZX0RBOFhYX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ETTgx
NlhfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfT01BUF9DT05UUk9MX1BIWSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RJX1BJUEUzIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9UVVNCMTIxMD1tCiMgQ09ORklH
X1BIWV9JTlRFTF9LRUVNQkFZX0VNTUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfSU5URUxfS0VF
TUJBWV9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfSU5URUxfTEdNX0NPTUJPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX0lOVEVMX0xHTV9FTU1DIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0lO
VEVMX1RIVU5ERVJCQVlfRU1NQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9YSUxJTlhfWllOUU1Q
IGlzIG5vdCBzZXQKIyBlbmQgb2YgUEhZIFN1YnN5c3RlbQoKQ09ORklHX1BPV0VSQ0FQPXkKQ09O
RklHX0RUUE09eQojIENPTkZJR19NQ0IgaXMgbm90IHNldApDT05GSUdfUkFTPXkKCiMKIyBBbmRy
b2lkCiMKIyBlbmQgb2YgQW5kcm9pZAoKQ09ORklHX0RBWD15CkNPTkZJR19OVk1FTT15CkNPTkZJ
R19OVk1FTV9TWVNGUz15CiMgQ09ORklHX05WTUVNX0lNWF9JSU0gaXMgbm90IHNldAojIENPTkZJ
R19OVk1FTV9JTVhfT0NPVFAgaXMgbm90IHNldAojIENPTkZJR19KWjQ3ODBfRUZVU0UgaXMgbm90
IHNldAojIENPTkZJR19OVk1FTV9MUEMxOFhYX0VFUFJPTSBpcyBub3Qgc2V0CiMgQ09ORklHX05W
TUVNX0xQQzE4WFhfT1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fTVhTX09DT1RQIGlzIG5v
dCBzZXQKIyBDT05GSUdfTVRLX0VGVVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUk9DSElQX09U
UEMgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9OSU5URU5ET19PVFAgaXMgbm90IHNldAojIENP
TkZJR19RQ09NX1FGUFJPTSBpcyBub3Qgc2V0CkNPTkZJR19OVk1FTV9TUE1JX1NEQU09eQojIENP
TkZJR19ST0NLQ0hJUF9FRlVTRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JPQ0tDSElQX09UUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05WTUVNX0JDTV9PQ09UUCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVN
X1NUTTMyX1JPTUVNIGlzIG5vdCBzZXQKIyBDT05GSUdfVU5JUEhJRVJfRUZVU0UgaXMgbm90IHNl
dAojIENPTkZJR19OVk1FTV9WRjYxMF9PQ09UUCBpcyBub3Qgc2V0CiMgQ09ORklHX01FU09OX01Y
X0VGVVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fU05WU19MUEdQUiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JBVkVfU1BfRUVQUk9NIGlzIG5vdCBzZXQKIyBDT05GSUdfU0MyN1hYX0VGVVNFIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1BSRF9FRlVTRSBpcyBub3Qgc2V0CkNPTkZJR19OVk1FTV9STUVN
PW0KIyBDT05GSUdfTlZNRU1fQlJDTV9OVlJBTSBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX0xB
WUVSU0NBUEVfU0ZQIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fU1VOUExVU19PQ09UUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05WTUVNX0FQUExFX0VGVVNFUyBpcyBub3Qgc2V0CgojCiMgSFcgdHJh
Y2luZyBzdXBwb3J0CiMKQ09ORklHX1NUTT1tCkNPTkZJR19TVE1fUFJPVE9fQkFTSUM9bQpDT05G
SUdfU1RNX1BST1RPX1NZU19UPW0KQ09ORklHX1NUTV9EVU1NWT1tCiMgQ09ORklHX1NUTV9TT1VS
Q0VfQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19TVE1fU09VUkNFX0hFQVJUQkVBVD1tCiMgZW5k
IG9mIEhXIHRyYWNpbmcgc3VwcG9ydAoKQ09ORklHX0ZQR0E9bQojIENPTkZJR19GUEdBX01HUl9T
T0NGUEdBIGlzIG5vdCBzZXQKIyBDT05GSUdfRlBHQV9NR1JfU09DRlBHQV9BMTAgaXMgbm90IHNl
dApDT05GSUdfQUxURVJBX1BSX0lQX0NPUkU9bQojIENPTkZJR19BTFRFUkFfUFJfSVBfQ09SRV9Q
TEFUIGlzIG5vdCBzZXQKIyBDT05GSUdfRlBHQV9NR1JfWllOUV9GUEdBIGlzIG5vdCBzZXQKQ09O
RklHX0ZQR0FfQlJJREdFPW0KQ09ORklHX0FMVEVSQV9GUkVFWkVfQlJJREdFPW0KQ09ORklHX1hJ
TElOWF9QUl9ERUNPVVBMRVI9bQpDT05GSUdfRlBHQV9SRUdJT049bQpDT05GSUdfT0ZfRlBHQV9S
RUdJT049bQpDT05GSUdfRlBHQV9ERkw9bQpDT05GSUdfRlBHQV9ERkxfQUZVPW0KQ09ORklHX0ZQ
R0FfREZMX05JT1NfSU5URUxfUEFDX04zMDAwPW0KIyBDT05GSUdfRlBHQV9NR1JfWllOUU1QX0ZQ
R0EgaXMgbm90IHNldAojIENPTkZJR19GUEdBX01HUl9WRVJTQUxfRlBHQSBpcyBub3Qgc2V0CkNP
TkZJR19GU0k9eQojIENPTkZJR19GU0lfTkVXX0RFVl9OT0RFIGlzIG5vdCBzZXQKQ09ORklHX0ZT
SV9NQVNURVJfR1BJTz15CkNPTkZJR19GU0lfTUFTVEVSX0hVQj1tCkNPTkZJR19GU0lfTUFTVEVS
X0FTUEVFRD15CiMgQ09ORklHX0ZTSV9TQ09NIGlzIG5vdCBzZXQKQ09ORklHX0ZTSV9TQkVGSUZP
PW0KQ09ORklHX0ZTSV9PQ0M9bQojIENPTkZJR19URUUgaXMgbm90IHNldApDT05GSUdfTVVMVElQ
TEVYRVI9eQoKIwojIE11bHRpcGxleGVyIGRyaXZlcnMKIwpDT05GSUdfTVVYX0FERzc5MkE9bQoj
IENPTkZJR19NVVhfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19NVVhfTU1JTz1tCiMgZW5kIG9mIE11
bHRpcGxleGVyIGRyaXZlcnMKCkNPTkZJR19QTV9PUFA9eQojIENPTkZJR19TSU9YIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0xJTUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVSQ09OTkVDVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPVU5URVIgaXMgbm90IHNldApDT05GSUdfUEVDST15CkNPTkZJR19Q
RUNJX0NQVT15CkNPTkZJR19IVEU9eQojIGVuZCBvZiBEZXZpY2UgRHJpdmVycwoKIwojIEZpbGUg
c3lzdGVtcwojCiMgQ09ORklHX1ZBTElEQVRFX0ZTX1BBUlNFUiBpcyBub3Qgc2V0CkNPTkZJR19G
U19JT01BUD15CkNPTkZJR19FWFQyX0ZTPXkKQ09ORklHX0VYVDJfRlNfWEFUVFI9eQojIENPTkZJ
R19FWFQyX0ZTX1BPU0lYX0FDTCBpcyBub3Qgc2V0CkNPTkZJR19FWFQyX0ZTX1NFQ1VSSVRZPXkK
Q09ORklHX0VYVDNfRlM9bQojIENPTkZJR19FWFQzX0ZTX1BPU0lYX0FDTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0VYVDNfRlNfU0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfRVhUNF9GUz1tCiMgQ09O
RklHX0VYVDRfRlNfUE9TSVhfQUNMIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUNF9GU19TRUNVUklU
WSBpcyBub3Qgc2V0CkNPTkZJR19FWFQ0X0RFQlVHPXkKQ09ORklHX0VYVDRfS1VOSVRfVEVTVFM9
bQpDT05GSUdfSkJEMj1tCiMgQ09ORklHX0pCRDJfREVCVUcgaXMgbm90IHNldApDT05GSUdfRlNf
TUJDQUNIRT15CiMgQ09ORklHX1JFSVNFUkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0pGU19GUz1t
CiMgQ09ORklHX0pGU19QT1NJWF9BQ0wgaXMgbm90IHNldApDT05GSUdfSkZTX1NFQ1VSSVRZPXkK
Q09ORklHX0pGU19ERUJVRz15CkNPTkZJR19KRlNfU1RBVElTVElDUz15CiMgQ09ORklHX1hGU19G
UyBpcyBub3Qgc2V0CkNPTkZJR19HRlMyX0ZTPW0KQ09ORklHX0JUUkZTX0ZTPXkKIyBDT05GSUdf
QlRSRlNfRlNfUE9TSVhfQUNMIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfRlNfQ0hFQ0tfSU5U
RUdSSVRZIGlzIG5vdCBzZXQKQ09ORklHX0JUUkZTX0ZTX1JVTl9TQU5JVFlfVEVTVFM9eQojIENP
TkZJR19CVFJGU19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0FTU0VSVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JUUkZTX0ZTX1JFRl9WRVJJRlkgaXMgbm90IHNldAojIENPTkZJR19OSUxG
UzJfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0ZTX1BP
U0lYX0FDTD15CkNPTkZJR19FWFBPUlRGUz15CiMgQ09ORklHX0VYUE9SVEZTX0JMT0NLX09QUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZJTEVfTE9DS0lORyBpcyBub3Qgc2V0CkNPTkZJR19GU19FTkNS
WVBUSU9OPXkKQ09ORklHX0ZTX0VOQ1JZUFRJT05fQUxHUz1tCkNPTkZJR19GU19WRVJJVFk9eQpD
T05GSUdfRlNfVkVSSVRZX0RFQlVHPXkKIyBDT05GSUdfRlNfVkVSSVRZX0JVSUxUSU5fU0lHTkFU
VVJFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ROT1RJRlkgaXMgbm90IHNldAojIENPTkZJR19JTk9U
SUZZX1VTRVIgaXMgbm90IHNldAojIENPTkZJR19GQU5PVElGWSBpcyBub3Qgc2V0CiMgQ09ORklH
X1FVT1RBIGlzIG5vdCBzZXQKQ09ORklHX1FVT1RBQ1RMPXkKIyBDT05GSUdfQVVUT0ZTNF9GUyBp
cyBub3Qgc2V0CkNPTkZJR19BVVRPRlNfRlM9bQpDT05GSUdfRlVTRV9GUz1tCkNPTkZJR19DVVNF
PW0KIyBDT05GSUdfVklSVElPX0ZTIGlzIG5vdCBzZXQKQ09ORklHX09WRVJMQVlfRlM9bQojIENP
TkZJR19PVkVSTEFZX0ZTX1JFRElSRUNUX0RJUiBpcyBub3Qgc2V0CkNPTkZJR19PVkVSTEFZX0ZT
X1JFRElSRUNUX0FMV0FZU19GT0xMT1c9eQpDT05GSUdfT1ZFUkxBWV9GU19JTkRFWD15CkNPTkZJ
R19PVkVSTEFZX0ZTX05GU19FWFBPUlQ9eQojIENPTkZJR19PVkVSTEFZX0ZTX01FVEFDT1BZIGlz
IG5vdCBzZXQKCiMKIyBDYWNoZXMKIwojIENPTkZJR19GU0NBQ0hFIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQ2FjaGVzCgojCiMgQ0QtUk9NL0RWRCBGaWxlc3lzdGVtcwojCkNPTkZJR19JU085NjYwX0ZT
PW0KIyBDT05GSUdfSk9MSUVUIGlzIG5vdCBzZXQKQ09ORklHX1pJU09GUz15CkNPTkZJR19VREZf
RlM9eQojIGVuZCBvZiBDRC1ST00vRFZEIEZpbGVzeXN0ZW1zCgojCiMgRE9TL0ZBVC9FWEZBVC9O
VCBGaWxlc3lzdGVtcwojCkNPTkZJR19GQVRfRlM9eQojIENPTkZJR19NU0RPU19GUyBpcyBub3Qg
c2V0CkNPTkZJR19WRkFUX0ZTPXkKQ09ORklHX0ZBVF9ERUZBVUxUX0NPREVQQUdFPTQzNwpDT05G
SUdfRkFUX0RFRkFVTFRfSU9DSEFSU0VUPSJpc284ODU5LTEiCkNPTkZJR19GQVRfREVGQVVMVF9V
VEY4PXkKQ09ORklHX0ZBVF9LVU5JVF9URVNUPW0KQ09ORklHX0VYRkFUX0ZTPXkKQ09ORklHX0VY
RkFUX0RFRkFVTFRfSU9DSEFSU0VUPSJ1dGY4IgpDT05GSUdfTlRGU19GUz15CkNPTkZJR19OVEZT
X0RFQlVHPXkKQ09ORklHX05URlNfUlc9eQpDT05GSUdfTlRGUzNfRlM9bQpDT05GSUdfTlRGUzNf
TFpYX1hQUkVTUz15CkNPTkZJR19OVEZTM19GU19QT1NJWF9BQ0w9eQojIGVuZCBvZiBET1MvRkFU
L0VYRkFUL05UIEZpbGVzeXN0ZW1zCgojCiMgUHNldWRvIGZpbGVzeXN0ZW1zCiMKQ09ORklHX1BS
T0NfRlM9eQpDT05GSUdfUFJPQ19TWVNDVEw9eQpDT05GSUdfUFJPQ19DSElMRFJFTj15CkNPTkZJ
R19LRVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05GSUdfQ09ORklHRlNfRlM9bQojIGVuZCBvZiBQ
c2V1ZG8gZmlsZXN5c3RlbXMKCkNPTkZJR19NSVNDX0ZJTEVTWVNURU1TPXkKQ09ORklHX09SQU5H
RUZTX0ZTPW0KQ09ORklHX0FERlNfRlM9bQojIENPTkZJR19BREZTX0ZTX1JXIGlzIG5vdCBzZXQK
Q09ORklHX0FGRlNfRlM9bQpDT05GSUdfRUNSWVBUX0ZTPXkKQ09ORklHX0VDUllQVF9GU19NRVNT
QUdJTkc9eQpDT05GSUdfSEZTX0ZTPW0KQ09ORklHX0hGU1BMVVNfRlM9eQpDT05GSUdfQkVGU19G
Uz1tCkNPTkZJR19CRUZTX0RFQlVHPXkKIyBDT05GSUdfQkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NSQU1GUz15CiMgQ09ORklHX0NSQU1GU19CTE9D
S0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZTIGlzIG5vdCBzZXQKQ09ORklHX1ZYRlNf
RlM9bQpDT05GSUdfTUlOSVhfRlM9bQpDT05GSUdfTUlOSVhfRlNfTkFUSVZFX0VORElBTj15CkNP
TkZJR19PTUZTX0ZTPW0KIyBDT05GSUdfSFBGU19GUyBpcyBub3Qgc2V0CkNPTkZJR19RTlg0RlNf
RlM9eQpDT05GSUdfUU5YNkZTX0ZTPXkKIyBDT05GSUdfUU5YNkZTX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX1JPTUZTX0ZTPW0KQ09ORklHX1JPTUZTX0JBQ0tFRF9CWV9CTE9DSz15CkNPTkZJR19S
T01GU19PTl9CTE9DSz15CiMgQ09ORklHX1BTVE9SRSBpcyBub3Qgc2V0CkNPTkZJR19TWVNWX0ZT
PXkKIyBDT05GSUdfVUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVJPRlNfRlMgaXMgbm90IHNl
dApDT05GSUdfTkxTPXkKQ09ORklHX05MU19ERUZBVUxUPSJpc284ODU5LTEiCkNPTkZJR19OTFNf
Q09ERVBBR0VfNDM3PW0KQ09ORklHX05MU19DT0RFUEFHRV83Mzc9eQojIENPTkZJR19OTFNfQ09E
RVBBR0VfNzc1IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NTA9eQpDT05GSUdfTkxT
X0NPREVQQUdFXzg1Mj1tCiMgQ09ORklHX05MU19DT0RFUEFHRV84NTUgaXMgbm90IHNldAojIENP
TkZJR19OTFNfQ09ERVBBR0VfODU3IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NjA9
bQojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQ
QUdFXzg2MiBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfODYzPW0KIyBDT05GSUdfTkxT
X0NPREVQQUdFXzg2NCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjUgaXMgbm90
IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzg2Nj1tCiMgQ09ORklHX05MU19DT0RFUEFHRV84Njkg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTM2IGlzIG5vdCBzZXQKQ09ORklHX05M
U19DT0RFUEFHRV85NTA9bQpDT05GSUdfTkxTX0NPREVQQUdFXzkzMj15CkNPTkZJR19OTFNfQ09E
RVBBR0VfOTQ5PW0KIyBDT05GSUdfTkxTX0NPREVQQUdFXzg3NCBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19JU084ODU5XzggaXMgbm90IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzEyNTA9bQpDT05G
SUdfTkxTX0NPREVQQUdFXzEyNTE9eQpDT05GSUdfTkxTX0FTQ0lJPXkKIyBDT05GSUdfTkxTX0lT
Tzg4NTlfMSBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8yPXkKIyBDT05GSUdfTkxTX0lT
Tzg4NTlfMyBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV80PW0KQ09ORklHX05MU19JU084
ODU5XzU9bQpDT05GSUdfTkxTX0lTTzg4NTlfNj15CkNPTkZJR19OTFNfSVNPODg1OV83PW0KQ09O
RklHX05MU19JU084ODU5Xzk9eQojIENPTkZJR19OTFNfSVNPODg1OV8xMyBpcyBub3Qgc2V0CiMg
Q09ORklHX05MU19JU084ODU5XzE0IGlzIG5vdCBzZXQKQ09ORklHX05MU19JU084ODU5XzE1PXkK
Q09ORklHX05MU19LT0k4X1I9bQpDT05GSUdfTkxTX0tPSThfVT1tCkNPTkZJR19OTFNfTUFDX1JP
TUFOPXkKQ09ORklHX05MU19NQUNfQ0VMVElDPW0KQ09ORklHX05MU19NQUNfQ0VOVEVVUk89eQoj
IENPTkZJR19OTFNfTUFDX0NST0FUSUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DWVJJ
TExJQyBpcyBub3Qgc2V0CkNPTkZJR19OTFNfTUFDX0dBRUxJQz15CkNPTkZJR19OTFNfTUFDX0dS
RUVLPW0KQ09ORklHX05MU19NQUNfSUNFTEFORD1tCiMgQ09ORklHX05MU19NQUNfSU5VSVQgaXMg
bm90IHNldApDT05GSUdfTkxTX01BQ19ST01BTklBTj15CkNPTkZJR19OTFNfTUFDX1RVUktJU0g9
bQpDT05GSUdfTkxTX1VURjg9eQojIENPTkZJR19VTklDT0RFIGlzIG5vdCBzZXQKQ09ORklHX0lP
X1dRPXkKIyBlbmQgb2YgRmlsZSBzeXN0ZW1zCgojCiMgU2VjdXJpdHkgb3B0aW9ucwojCkNPTkZJ
R19LRVlTPXkKQ09ORklHX0tFWVNfUkVRVUVTVF9DQUNIRT15CiMgQ09ORklHX1BFUlNJU1RFTlRf
S0VZUklOR1MgaXMgbm90IHNldAojIENPTkZJR19UUlVTVEVEX0tFWVMgaXMgbm90IHNldAojIENP
TkZJR19FTkNSWVBURURfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19LRVlfREhfT1BFUkFUSU9OUz15
CiMgQ09ORklHX1NFQ1VSSVRZX0RNRVNHX1JFU1RSSUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VD
VVJJVFkgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFlGUz15CkNPTkZJR19IQVZFX0hBUkRFTkVE
X1VTRVJDT1BZX0FMTE9DQVRPUj15CkNPTkZJR19IQVJERU5FRF9VU0VSQ09QWT15CiMgQ09ORklH
X1NUQVRJQ19VU0VSTU9ERUhFTFBFUiBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZ
X0RBQz15CkNPTkZJR19MU009ImxhbmRsb2NrLGxvY2tkb3duLHlhbWEsbG9hZHBpbixzYWZlc2V0
aWQsaW50ZWdyaXR5LGJwZiIKCiMKIyBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIwoKIwojIE1l
bW9yeSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9QQVRURVJO
PXkKQ09ORklHX0NDX0hBU19BVVRPX1ZBUl9JTklUX1pFUk89eQojIENPTkZJR19JTklUX1NUQUNL
X05PTkUgaXMgbm90IHNldApDT05GSUdfSU5JVF9TVEFDS19BTExfUEFUVEVSTj15CiMgQ09ORklH
X0lOSVRfU1RBQ0tfQUxMX1pFUk8gaXMgbm90IHNldApDT05GSUdfSU5JVF9PTl9BTExPQ19ERUZB
VUxUX09OPXkKQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkKQ09ORklHX0NDX0hBU19a
RVJPX0NBTExfVVNFRF9SRUdTPXkKQ09ORklHX1pFUk9fQ0FMTF9VU0VEX1JFR1M9eQojIGVuZCBv
ZiBNZW1vcnkgaW5pdGlhbGl6YXRpb24KCkNPTkZJR19SQU5EU1RSVUNUX05PTkU9eQojIGVuZCBv
ZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIyBlbmQgb2YgU2VjdXJpdHkgb3B0aW9ucwoKQ09O
RklHX1hPUl9CTE9DS1M9eQpDT05GSUdfQVNZTkNfQ09SRT1tCkNPTkZJR19BU1lOQ19NRU1DUFk9
bQpDT05GSUdfQVNZTkNfWE9SPW0KQ09ORklHX0FTWU5DX1BRPW0KQ09ORklHX0FTWU5DX1JBSUQ2
X1JFQ09WPW0KQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRvIGNvcmUgb3IgaGVscGVyCiMKQ09O
RklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZUFRP
X0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklHX0NSWVBUT19TS0NJUEhFUj15CkNP
TkZJR19DUllQVE9fU0tDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19IQVNIPXkKQ09ORklHX0NSWVBU
T19IQVNIMj15CkNPTkZJR19DUllQVE9fUk5HPXkKQ09ORklHX0NSWVBUT19STkcyPXkKQ09ORklH
X0NSWVBUT19STkdfREVGQVVMVD15CkNPTkZJR19DUllQVE9fQUtDSVBIRVIyPXkKQ09ORklHX0NS
WVBUT19BS0NJUEhFUj15CkNPTkZJR19DUllQVE9fS1BQMj15CkNPTkZJR19DUllQVE9fS1BQPXkK
Q09ORklHX0NSWVBUT19BQ09NUDI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZ
UFRPX01BTkFHRVIyPXkKIyBDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJMRV9URVNUUyBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fTUFOQUdFUl9FWFRSQV9URVNUUz15CkNPTkZJR19DUllQVE9f
R0YxMjhNVUw9eQpDT05GSUdfQ1JZUFRPX05VTEw9eQpDT05GSUdfQ1JZUFRPX05VTEwyPXkKQ09O
RklHX0NSWVBUT19DUllQVEQ9eQpDT05GSUdfQ1JZUFRPX0FVVEhFTkM9eQpDT05GSUdfQ1JZUFRP
X1RFU1Q9eQpDT05GSUdfQ1JZUFRPX0VOR0lORT15CgojCiMgUHVibGljLWtleSBjcnlwdG9ncmFw
aHkKIwpDT05GSUdfQ1JZUFRPX1JTQT1tCkNPTkZJR19DUllQVE9fREg9eQpDT05GSUdfQ1JZUFRP
X0RIX1JGQzc5MTlfR1JPVVBTPXkKQ09ORklHX0NSWVBUT19FQ0M9eQojIENPTkZJR19DUllQVE9f
RUNESCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRUNEU0E9bQpDT05GSUdfQ1JZUFRPX0VDUkRT
QT15CkNPTkZJR19DUllQVE9fU00yPXkKIyBDT05GSUdfQ1JZUFRPX0NVUlZFMjU1MTkgaXMgbm90
IHNldAoKIwojIEF1dGhlbnRpY2F0ZWQgRW5jcnlwdGlvbiB3aXRoIEFzc29jaWF0ZWQgRGF0YQoj
CkNPTkZJR19DUllQVE9fQ0NNPXkKQ09ORklHX0NSWVBUT19HQ009bQpDT05GSUdfQ1JZUFRPX0NI
QUNIQTIwUE9MWTEzMDU9bQojIENPTkZJR19DUllQVE9fQUVHSVMxMjggaXMgbm90IHNldApDT05G
SUdfQ1JZUFRPX1NFUUlWPXkKQ09ORklHX0NSWVBUT19FQ0hBSU5JVj15CgojCiMgQmxvY2sgbW9k
ZXMKIwpDT05GSUdfQ1JZUFRPX0NCQz15CkNPTkZJR19DUllQVE9fQ0ZCPXkKQ09ORklHX0NSWVBU
T19DVFI9eQpDT05GSUdfQ1JZUFRPX0NUUz15CkNPTkZJR19DUllQVE9fRUNCPXkKIyBDT05GSUdf
Q1JZUFRPX0xSVyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fT0ZCPW0KQ09ORklHX0NSWVBUT19Q
Q0JDPXkKQ09ORklHX0NSWVBUT19YQ1RSPXkKQ09ORklHX0NSWVBUT19YVFM9bQpDT05GSUdfQ1JZ
UFRPX0tFWVdSQVA9bQpDT05GSUdfQ1JZUFRPX05IUE9MWTEzMDU9eQpDT05GSUdfQ1JZUFRPX0FE
SUFOVFVNPXkKQ09ORklHX0NSWVBUT19IQ1RSMj15CkNPTkZJR19DUllQVE9fRVNTSVY9bQoKIwoj
IEhhc2ggbW9kZXMKIwpDT05GSUdfQ1JZUFRPX0NNQUM9eQpDT05GSUdfQ1JZUFRPX0hNQUM9eQpD
T05GSUdfQ1JZUFRPX1hDQkM9bQojIENPTkZJR19DUllQVE9fVk1BQyBpcyBub3Qgc2V0CgojCiMg
RGlnZXN0CiMKQ09ORklHX0NSWVBUT19DUkMzMkM9eQpDT05GSUdfQ1JZUFRPX0NSQzMyPW0KQ09O
RklHX0NSWVBUT19YWEhBU0g9eQpDT05GSUdfQ1JZUFRPX0JMQUtFMkI9eQpDT05GSUdfQ1JZUFRP
X0NSQ1QxMERJRj15CkNPTkZJR19DUllQVE9fQ1JDNjRfUk9DS1NPRlQ9eQpDT05GSUdfQ1JZUFRP
X0dIQVNIPW0KQ09ORklHX0NSWVBUT19QT0xZVkFMPXkKQ09ORklHX0NSWVBUT19QT0xZMTMwNT15
CkNPTkZJR19DUllQVE9fTUQ0PW0KQ09ORklHX0NSWVBUT19NRDU9eQpDT05GSUdfQ1JZUFRPX01J
Q0hBRUxfTUlDPXkKQ09ORklHX0NSWVBUT19STUQxNjA9bQpDT05GSUdfQ1JZUFRPX1NIQTE9eQpD
T05GSUdfQ1JZUFRPX1NIQTI1Nj15CkNPTkZJR19DUllQVE9fU0hBNTEyPXkKIyBDT05GSUdfQ1JZ
UFRPX1NIQTMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NNMz15CkNPTkZJR19DUllQVE9fU00z
X0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX1NUUkVFQk9HPXkKQ09ORklHX0NSWVBUT19XUDUxMj1t
CgojCiMgQ2lwaGVycwojCkNPTkZJR19DUllQVE9fQUVTPXkKQ09ORklHX0NSWVBUT19BRVNfVEk9
bQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIPW0KQ09ORklHX0NSWVBUT19CTE9XRklTSF9DT01NT049
bQojIENPTkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NBU1Rf
Q09NTU9OPW0KQ09ORklHX0NSWVBUT19DQVNUNT1tCiMgQ09ORklHX0NSWVBUT19DQVNUNiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRkNS
WVBUIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DSEFDSEEyMD15CkNPTkZJR19DUllQVE9fQVJJ
QT1tCkNPTkZJR19DUllQVE9fU0VSUEVOVD1tCkNPTkZJR19DUllQVE9fU000PXkKQ09ORklHX0NS
WVBUT19TTTRfR0VORVJJQz15CiMgQ09ORklHX0NSWVBUT19UV09GSVNIIGlzIG5vdCBzZXQKCiMK
IyBDb21wcmVzc2lvbgojCiMgQ09ORklHX0NSWVBUT19ERUZMQVRFIGlzIG5vdCBzZXQKQ09ORklH
X0NSWVBUT19MWk89bQpDT05GSUdfQ1JZUFRPXzg0Mj1tCiMgQ09ORklHX0NSWVBUT19MWjQgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fTFo0SEMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1pT
VEQ9eQoKIwojIFJhbmRvbSBOdW1iZXIgR2VuZXJhdGlvbgojCkNPTkZJR19DUllQVE9fQU5TSV9D
UFJORz15CkNPTkZJR19DUllQVE9fRFJCR19NRU5VPXkKQ09ORklHX0NSWVBUT19EUkJHX0hNQUM9
eQojIENPTkZJR19DUllQVE9fRFJCR19IQVNIIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJH
X0NUUj15CkNPTkZJR19DUllQVE9fRFJCRz15CkNPTkZJR19DUllQVE9fSklUVEVSRU5UUk9QWT15
CkNPTkZJR19DUllQVE9fS0RGODAwMTA4X0NUUj15CkNPTkZJR19DUllQVE9fSEFTSF9JTkZPPXkK
Q09ORklHX0NSWVBUT19IVz15CiMgQ09ORklHX0NSWVBUT19ERVZfQUxMV0lOTkVSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9FWFlOT1NfUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0RFVl9TNVAgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0FUTUVMX0FFUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfVERFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19ERVZfQVRNRUxfU0hBIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfQVRNRUxf
STJDPW0KIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9FQ0MgaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX0RFVl9BVE1FTF9TSEEyMDRBPW0KIyBDT05GSUdfQ1JZUFRPX0RFVl9RQ0UgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fREVWX1FDT01fUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0RFVl9JTUdURUNfSEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfWllOUU1QX0FF
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfWllOUU1QX1NIQTMgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fREVWX1ZJUlRJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZf
U0FGRVhDRUwgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0hJU0lfU0VDIGlzIG5vdCBz
ZXQKQ09ORklHX0NSWVBUT19ERVZfQU1MT0dJQ19HWEw9eQojIENPTkZJR19DUllQVE9fREVWX0FN
TE9HSUNfR1hMX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9TQTJVTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfS0VFTUJBWV9PQ1NfQUVTX1NNNCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19ERVZfS0VFTUJBWV9PQ1NfRUNDIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0RFVl9LRUVNQkFZX09DU19IQ1UgaXMgbm90IHNldApDT05GSUdfQVNZTU1FVFJJQ19L
RVlfVFlQRT15CiMgQ09ORklHX0FTWU1NRVRSSUNfUFVCTElDX0tFWV9TVUJUWVBFIGlzIG5vdCBz
ZXQKCiMKIyBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwojCiMgQ09ORklHX1NZ
U1RFTV9CTEFDS0xJU1RfS0VZUklORyBpcyBub3Qgc2V0CiMgZW5kIG9mIENlcnRpZmljYXRlcyBm
b3Igc2lnbmF0dXJlIGNoZWNraW5nCgpDT05GSUdfQklOQVJZX1BSSU5URj15CgojCiMgTGlicmFy
eSByb3V0aW5lcwojCkNPTkZJR19SQUlENl9QUT15CiMgQ09ORklHX1JBSUQ2X1BRX0JFTkNITUFS
SyBpcyBub3Qgc2V0CkNPTkZJR19MSU5FQVJfUkFOR0VTPXkKIyBDT05GSUdfUEFDS0lORyBpcyBu
b3Qgc2V0CkNPTkZJR19CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VT
RVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQojIENPTkZJR19DT1JESUMgaXMgbm90
IHNldApDT05GSUdfUFJJTUVfTlVNQkVSUz1tCkNPTkZJR19HRU5FUklDX1BDSV9JT01BUD15CkNP
TkZJR19HRU5FUklDX0lPTUFQPXkKCiMKIyBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwojCkNPTkZJ
R19DUllQVE9fTElCX0FFUz15CkNPTkZJR19DUllQVE9fTElCX0JMQUtFMlNfR0VORVJJQz15CkNP
TkZJR19DUllQVE9fTElCX0NIQUNIQV9HRU5FUklDPXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hB
PXkKQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOV9HRU5FUklDPXkKQ09ORklHX0NSWVBUT19M
SUJfQ1VSVkUyNTUxOT15CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X1JTSVpFPTEKQ09ORklH
X0NSWVBUT19MSUJfUE9MWTEzMDVfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1
PXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBMjBQT0xZMTMwNT15CkNPTkZJR19DUllQVE9fTElC
X1NIQTE9eQpDT05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9eQojIGVuZCBvZiBDcnlwdG8gbGlicmFy
eSByb3V0aW5lcwoKQ09ORklHX0xJQl9NRU1ORVE9eQpDT05GSUdfQ1JDX0NDSVRUPXkKQ09ORklH
X0NSQzE2PW0KQ09ORklHX0NSQ19UMTBESUY9bQpDT05GSUdfQ1JDNjRfUk9DS1NPRlQ9eQpDT05G
SUdfQ1JDX0lUVV9UPXkKQ09ORklHX0NSQzMyPXkKQ09ORklHX0NSQzMyX1NFTEZURVNUPXkKIyBD
T05GSUdfQ1JDMzJfU0xJQ0VCWTggaXMgbm90IHNldApDT05GSUdfQ1JDMzJfU0xJQ0VCWTQ9eQoj
IENPTkZJR19DUkMzMl9TQVJXQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfQklUIGlzIG5v
dCBzZXQKQ09ORklHX0NSQzY0PXkKQ09ORklHX0NSQzQ9eQojIENPTkZJR19DUkM3IGlzIG5vdCBz
ZXQKQ09ORklHX0xJQkNSQzMyQz15CkNPTkZJR19DUkM4PXkKQ09ORklHX1hYSEFTSD15CiMgQ09O
RklHX1JBTkRPTTMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHXzg0Ml9DT01QUkVTUz1tCkNP
TkZJR184NDJfREVDT01QUkVTUz1tCkNPTkZJR19aTElCX0lORkxBVEU9eQpDT05GSUdfWkxJQl9E
RUZMQVRFPXkKQ09ORklHX0xaT19DT01QUkVTUz15CkNPTkZJR19MWk9fREVDT01QUkVTUz15CkNP
TkZJR19aU1REX0NPTVBSRVNTPXkKQ09ORklHX1pTVERfREVDT01QUkVTUz15CkNPTkZJR19YWl9E
RUM9bQojIENPTkZJR19YWl9ERUNfWDg2IGlzIG5vdCBzZXQKQ09ORklHX1haX0RFQ19QT1dFUlBD
PXkKQ09ORklHX1haX0RFQ19JQTY0PXkKIyBDT05GSUdfWFpfREVDX0FSTSBpcyBub3Qgc2V0CiMg
Q09ORklHX1haX0RFQ19BUk1USFVNQiBpcyBub3Qgc2V0CiMgQ09ORklHX1haX0RFQ19TUEFSQyBp
cyBub3Qgc2V0CkNPTkZJR19YWl9ERUNfTUlDUk9MWk1BPXkKQ09ORklHX1haX0RFQ19CQ0o9eQoj
IENPTkZJR19YWl9ERUNfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0FMTE9DQVRPUj15
CkNPTkZJR19BU1NPQ0lBVElWRV9BUlJBWT15CkNPTkZJR19IQVNfSU9NRU09eQpDT05GSUdfTk9f
RE1BPXkKQ09ORklHX0RNQV9OT05DT0hFUkVOVF9NTUFQPXkKIyBDT05GSUdfRE1BX0FQSV9ERUJV
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQV9NQVBfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKQ09ORklH
X1NHTF9BTExPQz15CkNPTkZJR19HRU5FUklDX0FUT01JQzY0PXkKQ09ORklHX0NMWl9UQUI9eQoj
IENPTkZJR19JUlFfUE9MTCBpcyBub3Qgc2V0CkNPTkZJR19NUElMSUI9eQpDT05GSUdfT0lEX1JF
R0lTVFJZPXkKQ09ORklHX0ZPTlRfU1VQUE9SVD1tCkNPTkZJR19GT05UUz15CiMgQ09ORklHX0ZP
TlRfOHg4IGlzIG5vdCBzZXQKQ09ORklHX0ZPTlRfOHgxNj15CkNPTkZJR19GT05UXzZ4MTE9eQpD
T05GSUdfRk9OVF83eDE0PXkKQ09ORklHX0ZPTlRfUEVBUkxfOHg4PXkKIyBDT05GSUdfRk9OVF9B
Q09STl84eDggaXMgbm90IHNldApDT05GSUdfRk9OVF9NSU5JXzR4Nj15CkNPTkZJR19GT05UXzZ4
MTA9eQpDT05GSUdfRk9OVF8xMHgxOD15CiMgQ09ORklHX0ZPTlRfU1VOOHgxNiBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZPTlRfU1VOMTJ4MjIgaXMgbm90IHNldApDT05GSUdfRk9OVF9URVIxNngzMj15
CkNPTkZJR19GT05UXzZ4OD15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX1VBQ0NFU1NfTUVNQ1BZ
PXkKQ09ORklHX1NCSVRNQVA9eQojIENPTkZJR19QQVJNQU4gaXMgbm90IHNldAojIENPTkZJR19P
QkpBR0cgaXMgbm90IHNldAojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVzCgojCiMgS2VybmVsIGhh
Y2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwojCkNPTkZJR19DT05TT0xFX0xP
R0xFVkVMX0RFRkFVTFQ9NwpDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9RVUlFVD00CkNPTkZJR19N
RVNTQUdFX0xPR0xFVkVMX0RFRkFVTFQ9NAojIENPTkZJR19TWU1CT0xJQ19FUlJOQU1FIGlzIG5v
dCBzZXQKIyBlbmQgb2YgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25zCgpDT05GSUdfREVCVUdfS0VS
TkVMPXkKIyBDT05GSUdfREVCVUdfTUlTQyBpcyBub3Qgc2V0CgojCiMgQ29tcGlsZS10aW1lIGNo
ZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwojCkNPTkZJR19ERUJVR19JTkZPPXkKIyBDT05GSUdf
REVCVUdfSU5GT19OT05FIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lORk9fRFdBUkZfVE9PTENI
QUlOX0RFRkFVTFQ9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGNCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX0lORk9fRFdBUkY1IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19SRURV
Q0VEIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lORk9fQ09NUFJFU1NFRD15CiMgQ09ORklHX0RF
QlVHX0lORk9fU1BMSVQgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5GT19CVEY9eQpDT05GSUdf
UEFIT0xFX0hBU19TUExJVF9CVEY9eQpDT05GSUdfREVCVUdfSU5GT19CVEZfTU9EVUxFUz15CkNP
TkZJR19NT0RVTEVfQUxMT1dfQlRGX01JU01BVENIPXkKIyBDT05GSUdfR0RCX1NDUklQVFMgaXMg
bm90IHNldApDT05GSUdfRlJBTUVfV0FSTj0xMDI0CiMgQ09ORklHX1NUUklQX0FTTV9TWU1TIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVBREFCTEVfQVNNIGlzIG5vdCBzZXQKIyBDT05GSUdfSEVBREVS
U19JTlNUQUxMIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1NFQ1RJT05fTUlTTUFUQ0g9eQpDT05G
SUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09OTFk9eQpDT05GSUdfRlJBTUVfUE9JTlRFUj15CkNP
TkZJR19WTUxJTlVYX01BUD15CiMgQ09ORklHX0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQVSBpcyBu
b3Qgc2V0CiMgZW5kIG9mIENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMK
CiMKIyBHZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5zdHJ1bWVudHMKIwojIENPTkZJR19NQUdJ
Q19TWVNSUSBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19GUz15CiMgQ09ORklHX0RFQlVHX0ZTX0FM
TE9XX0FMTCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19GU19ESVNBTExPV19NT1VOVD15CiMgQ09O
RklHX0RFQlVHX0ZTX0FMTE9XX05PTkUgaXMgbm90IHNldAojIENPTkZJR19VQlNBTiBpcyBub3Qg
c2V0CkNPTkZJR19IQVZFX0tDU0FOX0NPTVBJTEVSPXkKIyBlbmQgb2YgR2VuZXJpYyBLZXJuZWwg
RGVidWdnaW5nIEluc3RydW1lbnRzCgojCiMgTmV0d29ya2luZyBEZWJ1Z2dpbmcKIwojIGVuZCBv
ZiBOZXR3b3JraW5nIERlYnVnZ2luZwoKIwojIE1lbW9yeSBEZWJ1Z2dpbmcKIwpDT05GSUdfUEFH
RV9FWFRFTlNJT049eQpDT05GSUdfREVCVUdfUEFHRUFMTE9DPXkKQ09ORklHX0RFQlVHX1BBR0VB
TExPQ19FTkFCTEVfREVGQVVMVD15CiMgQ09ORklHX1NMVUJfREVCVUcgaXMgbm90IHNldApDT05G
SUdfUEFHRV9QT0lTT05JTkc9eQojIENPTkZJR19ERUJVR19PQkpFQ1RTIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0hSSU5LRVJfREVCVUcgaXMgbm90IHNldApDT05GSUdfREVCVUdfU1RBQ0tfVVNBR0U9
eQpDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLPXkKIyBDT05GSUdfREVCVUdfVk0gaXMgbm90
IHNldApDT05GSUdfREVCVUdfTk9NTVVfUkVHSU9OUz15CiMgQ09ORklHX0RFQlVHX01FTU9SWV9J
TklUIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19XT1JLSU5HX05PU0FOSVRJWkVfQUREUkVTUz15
CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCkNPTkZJR19ERUJVR19TSElSUT15CgojCiMgRGVi
dWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKIwpDT05GSUdfUEFOSUNfT05fT09QUz15CkNPTkZJ
R19QQU5JQ19PTl9PT1BTX1ZBTFVFPTEKQ09ORklHX1BBTklDX1RJTUVPVVQ9MAojIENPTkZJR19T
T0ZUTE9DS1VQX0RFVEVDVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfREVURUNUX0hVTkdfVEFTSyBp
cyBub3Qgc2V0CkNPTkZJR19XUV9XQVRDSERPRz15CkNPTkZJR19URVNUX0xPQ0tVUD1tCiMgZW5k
IG9mIERlYnVnIE9vcHMsIExvY2t1cHMgYW5kIEhhbmdzCgojCiMgU2NoZWR1bGVyIERlYnVnZ2lu
ZwojCiMgQ09ORklHX1NDSEVEX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURTVEFUUyBp
cyBub3Qgc2V0CiMgZW5kIG9mIFNjaGVkdWxlciBEZWJ1Z2dpbmcKCkNPTkZJR19ERUJVR19USU1F
S0VFUElORz15CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4u
KQojCiMgQ09ORklHX0RFQlVHX1JUX01VVEVYRVMgaXMgbm90IHNldApDT05GSUdfREVCVUdfU1BJ
TkxPQ0s9eQojIENPTkZJR19ERUJVR19NVVRFWEVTIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1JX
U0VNUz15CiMgQ09ORklHX0RFQlVHX0xPQ0tJTkdfQVBJX1NFTEZURVNUUyBpcyBub3Qgc2V0CkNP
TkZJR19MT0NLX1RPUlRVUkVfVEVTVD15CkNPTkZJR19XV19NVVRFWF9TRUxGVEVTVD1tCkNPTkZJ
R19TQ0ZfVE9SVFVSRV9URVNUPW0KIyBlbmQgb2YgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2Nrcywg
bXV0ZXhlcywgZXRjLi4uKQoKQ09ORklHX0RFQlVHX0lSUUZMQUdTPXkKQ09ORklHX1dBUk5fQUxM
X1VOU0VFREVEX1JBTkRPTT15CkNPTkZJR19ERUJVR19LT0JKRUNUPXkKQ09ORklHX0hBVkVfREVC
VUdfQlVHVkVSQk9TRT15CgojCiMgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwojCkNPTkZJ
R19ERUJVR19MSVNUPXkKIyBDT05GSUdfREVCVUdfUExJU1QgaXMgbm90IHNldApDT05GSUdfREVC
VUdfU0c9eQpDT05GSUdfREVCVUdfTk9USUZJRVJTPXkKQ09ORklHX0JVR19PTl9EQVRBX0NPUlJV
UFRJT049eQojIGVuZCBvZiBEZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCgpDT05GSUdfREVC
VUdfQ1JFREVOVElBTFM9eQoKIwojIFJDVSBEZWJ1Z2dpbmcKIwpDT05GSUdfVE9SVFVSRV9URVNU
PXkKQ09ORklHX1JDVV9TQ0FMRV9URVNUPXkKQ09ORklHX1JDVV9UT1JUVVJFX1RFU1Q9eQpDT05G
SUdfUkNVX1JFRl9TQ0FMRV9URVNUPXkKIyBDT05GSUdfUkNVX1RSQUNFIGlzIG5vdCBzZXQKQ09O
RklHX1JDVV9FUVNfREVCVUc9eQojIGVuZCBvZiBSQ1UgRGVidWdnaW5nCgojIENPTkZJR19ERUJV
R19XUV9GT1JDRV9SUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19TQU1QTEVTIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1RSSUNUX0RFVk1FTSBpcyBub3Qgc2V0CgojCiMgbTY4ayBEZWJ1Z2dpbmcKIwpD
T05GSUdfQk9PVFBBUkFNPXkKQ09ORklHX0JPT1RQQVJBTV9TVFJJTkc9ImNvbnNvbGU9dHR5UzAs
MTkyMDAiCiMgQ09ORklHX0ZVTExERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19OT19LRVJORUxfTVNH
PXkKIyBlbmQgb2YgbTY4ayBEZWJ1Z2dpbmcKCiMKIyBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJh
Z2UKIwpDT05GSUdfS1VOSVQ9bQpDT05GSUdfS1VOSVRfREVCVUdGUz15CkNPTkZJR19LVU5JVF9U
RVNUPW0KIyBDT05GSUdfS1VOSVRfRVhBTVBMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1VO
SVRfQUxMX1RFU1RTIGlzIG5vdCBzZXQKQ09ORklHX05PVElGSUVSX0VSUk9SX0lOSkVDVElPTj1t
CkNPTkZJR19GQVVMVF9JTkpFQ1RJT049eQojIENPTkZJR19GQUlMU0xBQiBpcyBub3Qgc2V0CkNP
TkZJR19GQUlMX1BBR0VfQUxMT0M9eQpDT05GSUdfRkFVTFRfSU5KRUNUSU9OX1VTRVJDT1BZPXkK
Q09ORklHX0ZBSUxfTUFLRV9SRVFVRVNUPXkKIyBDT05GSUdfRkFJTF9JT19USU1FT1VUIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkFJTF9GVVRFWCBpcyBub3Qgc2V0CkNPTkZJR19GQVVMVF9JTkpFQ1RJ
T05fREVCVUdfRlM9eQpDT05GSUdfQ0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CiMgQ09ORklHX1JV
TlRJTUVfVEVTVElOR19NRU5VIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVsIFRlc3RpbmcgYW5k
IENvdmVyYWdlCgojIENPTkZJR19XQVJOX01JU1NJTkdfRE9DVU1FTlRTIGlzIG5vdCBzZXQKIyBD
T05GSUdfV0FSTl9BQklfRVJST1JTIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVsIGhhY2tpbmcK

--===============7419030049798714722==--

