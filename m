Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBB111B8
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jun 2023 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685713896; x=1717249896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9DkEZMjy0mxEB0CZFGeaBXxWd7Ep+GIIYRDlf8VoWQ=;
  b=YO8CSt8gIYz7tdi76Lek04KVBbINnUR+0XteArlwYuroE0cazSNYVOFj
   T0boRdlvzI2DqWl6lVQ3A08gXDO+mnuY/j1kwrpQn8rUeD/abJ1UqxSFc
   Z7X4zdAhpeA77bdYCs7MohetIEQtAPo3jjkHMmJ5JTlQ1dH3+bJfey2AK
   +DpxVVAM+5GEXTrwSx0VATcsRxKJRL29jPZ17YUo3OCr8FQ3ObG1pm2W7
   gAVkVv7LOs2HcYVFy7uJJ0zW56JsRVeTTiys2TzHlWxVPYUkvgoB8u3yT
   4cN1HHiaQQlQ1HSoSZYOHRl7LkqZP3TOEzAd5hg5PZEzCJHKnhfpLzhbw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="336235016"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="336235016"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 06:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="772890363"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="772890363"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 06:51:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q55Bl-0000Vh-1n;
	Fri, 02 Jun 2023 13:51:33 +0000
Date: Fri, 2 Jun 2023 21:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6080/6849] fs/btrfs/volumes.c:6412
 btrfs_map_block() error: we previously assumed 'mirror_num_ret' could be
 null (see line 6250)
Message-ID: <202306022143.zoQGZHa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Christoph,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
commit: f34e3e7526318e4fcda5b043c8d5e90cfac652c2 [6080/6849] btrfs: rename __btrfs_map_block to btrfs_map_block
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20230531 (https://download.01.org/0day-ci/archive/20230602/202306022143.zoQGZHa1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306022143.zoQGZHa1-lkp@intel.com/

smatch warnings:
fs/btrfs/volumes.c:6412 btrfs_map_block() error: we previously assumed 'mirror_num_ret' could be null (see line 6250)

vim +/mirror_num_ret +6412 fs/btrfs/volumes.c

03793cbbc80fe6 Christoph Hellwig 2022-08-06  6234  
f34e3e7526318e Christoph Hellwig 2023-05-31  6235  int btrfs_map_block(struct btrfs_fs_info *fs_info, enum btrfs_map_op op,
103c19723c80bf Christoph Hellwig 2022-11-15  6236  		    u64 logical, u64 *length,
4c664611791239 Qu Wenruo         2021-09-15  6237  		    struct btrfs_io_context **bioc_ret,
103c19723c80bf Christoph Hellwig 2022-11-15  6238  		    struct btrfs_io_stripe *smap, int *mirror_num_ret,
103c19723c80bf Christoph Hellwig 2022-11-15  6239  		    int need_raid_map)
0b86a832a1f38a Chris Mason       2008-03-24  6240  {
0b86a832a1f38a Chris Mason       2008-03-24  6241  	struct extent_map *em;
0b86a832a1f38a Chris Mason       2008-03-24  6242  	struct map_lookup *map;
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6243  	u64 map_offset;
593060d756e0c2 Chris Mason       2008-03-25  6244  	u64 stripe_offset;
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6245  	u32 stripe_nr;
9d644a623ec48e David Sterba      2015-02-20  6246  	u32 stripe_index;
cff8267228c14e David Sterba      2019-05-17  6247  	int data_stripes;
cea9e4452ebaf1 Chris Mason       2008-04-09  6248  	int i;
de11cc12df1733 Li Zefan          2011-12-01  6249  	int ret = 0;
03793cbbc80fe6 Christoph Hellwig 2022-08-06 @6250  	int mirror_num = (mirror_num_ret ? *mirror_num_ret : 0);
f2d8d74d7874f8 Chris Mason       2008-04-21  6251  	int num_stripes;
5f50fa918f0c17 Qu Wenruo         2023-02-22  6252  	int num_copies;
a236aed14ccb06 Chris Mason       2008-04-29  6253  	int max_errors = 0;
4c664611791239 Qu Wenruo         2021-09-15  6254  	struct btrfs_io_context *bioc = NULL;
472262f35a6b34 Stefan Behrens    2012-11-06  6255  	struct btrfs_dev_replace *dev_replace = &fs_info->dev_replace;
472262f35a6b34 Stefan Behrens    2012-11-06  6256  	int dev_replace_is_ongoing = 0;
4ced85f81a7a67 Qu Wenruo         2023-02-07  6257  	u16 num_alloc_stripes;
53b381b3abeb86 David Woodhouse   2013-01-29  6258  	u64 raid56_full_stripe_start = (u64)-1;
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6259  	u64 max_len;
89b798ad1b42b1 Nikolay Borisov   2019-06-03  6260  
4c664611791239 Qu Wenruo         2021-09-15  6261  	ASSERT(bioc_ret);
0b3d4cd371edb6 Liu Bo            2017-03-14  6262  
5f50fa918f0c17 Qu Wenruo         2023-02-22  6263  	num_copies = btrfs_num_copies(fs_info, logical, fs_info->sectorsize);
5f50fa918f0c17 Qu Wenruo         2023-02-22  6264  	if (mirror_num > num_copies)
5f50fa918f0c17 Qu Wenruo         2023-02-22  6265  		return -EINVAL;
5f50fa918f0c17 Qu Wenruo         2023-02-22  6266  
420343131970fd Michal Rostecki   2021-01-27  6267  	em = btrfs_get_chunk_map(fs_info, logical, *length);
1c3ab6dfa0692c Qu Wenruo         2023-03-02  6268  	if (IS_ERR(em))
1c3ab6dfa0692c Qu Wenruo         2023-03-02  6269  		return PTR_ERR(em);
420343131970fd Michal Rostecki   2021-01-27  6270  
95617d69326ce3 Jeff Mahoney      2015-06-03  6271  	map = em->map_lookup;
cff8267228c14e David Sterba      2019-05-17  6272  	data_stripes = nr_data_stripes(map);
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6273  
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6274  	map_offset = logical - em->start;
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6275  	max_len = btrfs_max_io_len(map, op, map_offset, &stripe_nr,
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6276  				   &stripe_offset, &raid56_full_stripe_start);
f8a02dc6fd38da Christoph Hellwig 2023-01-21  6277  	*length = min_t(u64, em->len - map_offset, max_len);
593060d756e0c2 Chris Mason       2008-03-25  6278  
cb5583dd52fab4 David Sterba      2018-09-07  6279  	down_read(&dev_replace->rwsem);
472262f35a6b34 Stefan Behrens    2012-11-06  6280  	dev_replace_is_ongoing = btrfs_dev_replace_is_ongoing(dev_replace);
53176dde0acd8f David Sterba      2018-04-05  6281  	/*
53176dde0acd8f David Sterba      2018-04-05  6282  	 * Hold the semaphore for read during the whole operation, write is
53176dde0acd8f David Sterba      2018-04-05  6283  	 * requested at commit time but must wait.
53176dde0acd8f David Sterba      2018-04-05  6284  	 */
472262f35a6b34 Stefan Behrens    2012-11-06  6285  	if (!dev_replace_is_ongoing)
cb5583dd52fab4 David Sterba      2018-09-07  6286  		up_read(&dev_replace->rwsem);
472262f35a6b34 Stefan Behrens    2012-11-06  6287  
f2d8d74d7874f8 Chris Mason       2008-04-21  6288  	num_stripes = 1;
cea9e4452ebaf1 Chris Mason       2008-04-09  6289  	stripe_index = 0;
fce3bb9a1bd492 Li Dongyang       2011-03-24  6290  	if (map->type & BTRFS_BLOCK_GROUP_RAID0) {
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6291  		stripe_index = stripe_nr % map->num_stripes;
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6292  		stripe_nr /= map->num_stripes;
de48373454acea Anand Jain        2017-10-12  6293  		if (!need_full_stripe(op))
28e1cc7d1baf80 Miao Xie          2014-09-12  6294  			mirror_num = 1;
c7369b3faea230 David Sterba      2019-05-31  6295  	} else if (map->type & BTRFS_BLOCK_GROUP_RAID1_MASK) {
de48373454acea Anand Jain        2017-10-12  6296  		if (need_full_stripe(op))
f2d8d74d7874f8 Chris Mason       2008-04-21  6297  			num_stripes = map->num_stripes;
2fff734fafa742 Chris Mason       2008-04-29  6298  		else if (mirror_num)
f188591e987e21 Chris Mason       2008-04-09  6299  			stripe_index = mirror_num - 1;
dfe25020689bb2 Chris Mason       2008-05-13  6300  		else {
30d9861ff9520e Stefan Behrens    2012-11-06  6301  			stripe_index = find_live_mirror(fs_info, map, 0,
30d9861ff9520e Stefan Behrens    2012-11-06  6302  					    dev_replace_is_ongoing);
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6303  			mirror_num = stripe_index + 1;
dfe25020689bb2 Chris Mason       2008-05-13  6304  		}
2fff734fafa742 Chris Mason       2008-04-29  6305  
611f0e00a27fe0 Chris Mason       2008-04-03  6306  	} else if (map->type & BTRFS_BLOCK_GROUP_DUP) {
de48373454acea Anand Jain        2017-10-12  6307  		if (need_full_stripe(op)) {
f2d8d74d7874f8 Chris Mason       2008-04-21  6308  			num_stripes = map->num_stripes;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6309  		} else if (mirror_num) {
f188591e987e21 Chris Mason       2008-04-09  6310  			stripe_index = mirror_num - 1;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6311  		} else {
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6312  			mirror_num = 1;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6313  		}
2fff734fafa742 Chris Mason       2008-04-29  6314  
321aecc65671ae Chris Mason       2008-04-16  6315  	} else if (map->type & BTRFS_BLOCK_GROUP_RAID10) {
9d644a623ec48e David Sterba      2015-02-20  6316  		u32 factor = map->num_stripes / map->sub_stripes;
321aecc65671ae Chris Mason       2008-04-16  6317  
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6318  		stripe_index = (stripe_nr % factor) * map->sub_stripes;
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6319  		stripe_nr /= factor;
321aecc65671ae Chris Mason       2008-04-16  6320  
de48373454acea Anand Jain        2017-10-12  6321  		if (need_full_stripe(op))
f2d8d74d7874f8 Chris Mason       2008-04-21  6322  			num_stripes = map->sub_stripes;
321aecc65671ae Chris Mason       2008-04-16  6323  		else if (mirror_num)
321aecc65671ae Chris Mason       2008-04-16  6324  			stripe_index += mirror_num - 1;
dfe25020689bb2 Chris Mason       2008-05-13  6325  		else {
3e74317ad773ba Jan Schmidt       2012-04-27  6326  			int old_stripe_index = stripe_index;
30d9861ff9520e Stefan Behrens    2012-11-06  6327  			stripe_index = find_live_mirror(fs_info, map,
30d9861ff9520e Stefan Behrens    2012-11-06  6328  					      stripe_index,
30d9861ff9520e Stefan Behrens    2012-11-06  6329  					      dev_replace_is_ongoing);
3e74317ad773ba Jan Schmidt       2012-04-27  6330  			mirror_num = stripe_index - old_stripe_index + 1;
dfe25020689bb2 Chris Mason       2008-05-13  6331  		}
53b381b3abeb86 David Woodhouse   2013-01-29  6332  
ffe2d2034bbb34 Zhao Lei          2015-01-20  6333  	} else if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK) {
de48373454acea Anand Jain        2017-10-12  6334  		if (need_raid_map && (need_full_stripe(op) || mirror_num > 1)) {
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6335  			/*
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6336  			 * Push stripe_nr back to the start of the full stripe
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6337  			 * For those cases needing a full stripe, @stripe_nr
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6338  			 * is the full stripe number.
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6339  			 *
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6340  			 * Originally we go raid56_full_stripe_start / full_stripe_len,
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6341  			 * but that can be expensive.  Here we just divide
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6342  			 * @stripe_nr with @data_stripes.
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6343  			 */
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6344  			stripe_nr /= data_stripes;
53b381b3abeb86 David Woodhouse   2013-01-29  6345  
53b381b3abeb86 David Woodhouse   2013-01-29  6346  			/* RAID[56] write or recovery. Return all stripes */
53b381b3abeb86 David Woodhouse   2013-01-29  6347  			num_stripes = map->num_stripes;
6dead96c1a1e09 Qu Wenruo         2022-05-13  6348  			max_errors = btrfs_chunk_max_errors(map);
53b381b3abeb86 David Woodhouse   2013-01-29  6349  
462b0b2a86c4d5 Qu Wenruo         2022-06-17  6350  			/* Return the length to the full stripe end */
462b0b2a86c4d5 Qu Wenruo         2022-06-17  6351  			*length = min(logical + *length,
462b0b2a86c4d5 Qu Wenruo         2022-06-17  6352  				      raid56_full_stripe_start + em->start +
a97699d1d61071 Qu Wenruo         2023-02-17  6353  				      (data_stripes << BTRFS_STRIPE_LEN_SHIFT)) - logical;
53b381b3abeb86 David Woodhouse   2013-01-29  6354  			stripe_index = 0;
53b381b3abeb86 David Woodhouse   2013-01-29  6355  			stripe_offset = 0;
53b381b3abeb86 David Woodhouse   2013-01-29  6356  		} else {
53b381b3abeb86 David Woodhouse   2013-01-29  6357  			/*
53b381b3abeb86 David Woodhouse   2013-01-29  6358  			 * Mirror #0 or #1 means the original data block.
53b381b3abeb86 David Woodhouse   2013-01-29  6359  			 * Mirror #2 is RAID5 parity block.
53b381b3abeb86 David Woodhouse   2013-01-29  6360  			 * Mirror #3 is RAID6 Q block.
53b381b3abeb86 David Woodhouse   2013-01-29  6361  			 */
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6362  			stripe_index = stripe_nr % data_stripes;
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6363  			stripe_nr /= data_stripes;
53b381b3abeb86 David Woodhouse   2013-01-29  6364  			if (mirror_num > 1)
cff8267228c14e David Sterba      2019-05-17  6365  				stripe_index = data_stripes + mirror_num - 2;
53b381b3abeb86 David Woodhouse   2013-01-29  6366  
53b381b3abeb86 David Woodhouse   2013-01-29  6367  			/* We distribute the parity blocks across stripes */
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6368  			stripe_index = (stripe_nr + stripe_index) % map->num_stripes;
de48373454acea Anand Jain        2017-10-12  6369  			if (!need_full_stripe(op) && mirror_num <= 1)
28e1cc7d1baf80 Miao Xie          2014-09-12  6370  				mirror_num = 1;
53b381b3abeb86 David Woodhouse   2013-01-29  6371  		}
8790d502e4401a Chris Mason       2008-04-03  6372  	} else {
593060d756e0c2 Chris Mason       2008-03-25  6373  		/*
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6374  		 * After this, stripe_nr is the number of stripes on this
47c5713f4737e4 David Sterba      2015-02-20  6375  		 * device we have to walk to find the data, and stripe_index is
47c5713f4737e4 David Sterba      2015-02-20  6376  		 * the number of our device in the stripe array
593060d756e0c2 Chris Mason       2008-03-25  6377  		 */
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6378  		stripe_index = stripe_nr % map->num_stripes;
6ded22c1bfe6a8 Qu Wenruo         2023-02-17  6379  		stripe_nr /= map->num_stripes;
a1d3c4786a4b9c Jan Schmidt       2011-08-04  6380  		mirror_num = stripe_index + 1;
8790d502e4401a Chris Mason       2008-04-03  6381  	}
e042d1ec441798 Josef Bacik       2016-04-12  6382  	if (stripe_index >= map->num_stripes) {
5d163e0e68ce74 Jeff Mahoney      2016-09-20  6383  		btrfs_crit(fs_info,
5d163e0e68ce74 Jeff Mahoney      2016-09-20  6384  			   "stripe index math went horribly wrong, got stripe_index=%u, num_stripes=%u",
e042d1ec441798 Josef Bacik       2016-04-12  6385  			   stripe_index, map->num_stripes);
e042d1ec441798 Josef Bacik       2016-04-12  6386  		ret = -EINVAL;
e042d1ec441798 Josef Bacik       2016-04-12  6387  		goto out;
e042d1ec441798 Josef Bacik       2016-04-12  6388  	}
593060d756e0c2 Chris Mason       2008-03-25  6389  
472262f35a6b34 Stefan Behrens    2012-11-06  6390  	num_alloc_stripes = num_stripes;
1faf3885067d5b Qu Wenruo         2023-02-07  6391  	if (dev_replace_is_ongoing && dev_replace->tgtdev != NULL &&
1faf3885067d5b Qu Wenruo         2023-02-07  6392  	    op != BTRFS_MAP_READ)
1faf3885067d5b Qu Wenruo         2023-02-07  6393  		/*
1faf3885067d5b Qu Wenruo         2023-02-07  6394  		 * For replace case, we need to add extra stripes for extra
1faf3885067d5b Qu Wenruo         2023-02-07  6395  		 * duplicated stripes.
1faf3885067d5b Qu Wenruo         2023-02-07  6396  		 *
1faf3885067d5b Qu Wenruo         2023-02-07  6397  		 * For both WRITE and GET_READ_MIRRORS, we may have at most
1faf3885067d5b Qu Wenruo         2023-02-07  6398  		 * 2 more stripes (DUP types, otherwise 1).
1faf3885067d5b Qu Wenruo         2023-02-07  6399  		 */
1faf3885067d5b Qu Wenruo         2023-02-07  6400  		num_alloc_stripes += 2;
2c8cdd6ee4e7f6 Miao Xie          2014-11-14  6401  
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6402  	/*
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6403  	 * If this I/O maps to a single device, try to return the device and
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6404  	 * physical block information on the stack instead of allocating an
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6405  	 * I/O context structure.
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6406  	 */
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6407  	if (smap && num_alloc_stripes == 1 &&
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6408  	    !((map->type & BTRFS_BLOCK_GROUP_RAID56_MASK) && mirror_num > 1) &&
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6409  	    (!need_full_stripe(op) || !dev_replace_is_ongoing ||
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6410  	     !dev_replace->tgtdev)) {
5f50fa918f0c17 Qu Wenruo         2023-02-22  6411  		set_io_stripe(smap, map, stripe_index, stripe_offset, stripe_nr);
03793cbbc80fe6 Christoph Hellwig 2022-08-06 @6412  		*mirror_num_ret = mirror_num;
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6413  		*bioc_ret = NULL;
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6414  		ret = 0;
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6415  		goto out;
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6416  	}
03793cbbc80fe6 Christoph Hellwig 2022-08-06  6417  
1faf3885067d5b Qu Wenruo         2023-02-07  6418  	bioc = alloc_btrfs_io_context(fs_info, num_alloc_stripes);
4c664611791239 Qu Wenruo         2021-09-15  6419  	if (!bioc) {
de11cc12df1733 Li Zefan          2011-12-01  6420  		ret = -ENOMEM;
de11cc12df1733 Li Zefan          2011-12-01  6421  		goto out;
de11cc12df1733 Li Zefan          2011-12-01  6422  	}
1faf3885067d5b Qu Wenruo         2023-02-07  6423  	bioc->map_type = map->type;
608769a4e41cce Nikolay Borisov   2020-07-02  6424  
18d758a2d81a97 Qu Wenruo         2023-02-17  6425  	/*
18d758a2d81a97 Qu Wenruo         2023-02-17  6426  	 * For RAID56 full map, we need to make sure the stripes[] follows the
18d758a2d81a97 Qu Wenruo         2023-02-17  6427  	 * rule that data stripes are all ordered, then followed with P and Q
18d758a2d81a97 Qu Wenruo         2023-02-17  6428  	 * (if we have).
18d758a2d81a97 Qu Wenruo         2023-02-17  6429  	 *
18d758a2d81a97 Qu Wenruo         2023-02-17  6430  	 * It's still mostly the same as other profiles, just with extra rotation.
18d758a2d81a97 Qu Wenruo         2023-02-17  6431  	 */
18d758a2d81a97 Qu Wenruo         2023-02-17  6432  	if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK && need_raid_map &&
18d758a2d81a97 Qu Wenruo         2023-02-17  6433  	    (need_full_stripe(op) || mirror_num > 1)) {
18d758a2d81a97 Qu Wenruo         2023-02-17  6434  		/*
18d758a2d81a97 Qu Wenruo         2023-02-17  6435  		 * For RAID56 @stripe_nr is already the number of full stripes
18d758a2d81a97 Qu Wenruo         2023-02-17  6436  		 * before us, which is also the rotation value (needs to modulo
18d758a2d81a97 Qu Wenruo         2023-02-17  6437  		 * with num_stripes).
18d758a2d81a97 Qu Wenruo         2023-02-17  6438  		 *
18d758a2d81a97 Qu Wenruo         2023-02-17  6439  		 * In this case, we just add @stripe_nr with @i, then do the
18d758a2d81a97 Qu Wenruo         2023-02-17  6440  		 * modulo, to reduce one modulo call.
18d758a2d81a97 Qu Wenruo         2023-02-17  6441  		 */
18d758a2d81a97 Qu Wenruo         2023-02-17  6442  		bioc->full_stripe_logical = em->start +
18d758a2d81a97 Qu Wenruo         2023-02-17  6443  			((stripe_nr * data_stripes) << BTRFS_STRIPE_LEN_SHIFT);
18d758a2d81a97 Qu Wenruo         2023-02-17  6444  		for (i = 0; i < num_stripes; i++)
18d758a2d81a97 Qu Wenruo         2023-02-17  6445  			set_io_stripe(&bioc->stripes[i], map,
18d758a2d81a97 Qu Wenruo         2023-02-17  6446  				      (i + stripe_nr) % num_stripes,
18d758a2d81a97 Qu Wenruo         2023-02-17  6447  				      stripe_offset, stripe_nr);
18d758a2d81a97 Qu Wenruo         2023-02-17  6448  	} else {
18d758a2d81a97 Qu Wenruo         2023-02-17  6449  		/*
18d758a2d81a97 Qu Wenruo         2023-02-17  6450  		 * For all other non-RAID56 profiles, just copy the target
18d758a2d81a97 Qu Wenruo         2023-02-17  6451  		 * stripe into the bioc.
18d758a2d81a97 Qu Wenruo         2023-02-17  6452  		 */
608769a4e41cce Nikolay Borisov   2020-07-02  6453  		for (i = 0; i < num_stripes; i++) {
18d758a2d81a97 Qu Wenruo         2023-02-17  6454  			set_io_stripe(&bioc->stripes[i], map, stripe_index,
18d758a2d81a97 Qu Wenruo         2023-02-17  6455  				      stripe_offset, stripe_nr);
608769a4e41cce Nikolay Borisov   2020-07-02  6456  			stripe_index++;
608769a4e41cce Nikolay Borisov   2020-07-02  6457  		}
593060d756e0c2 Chris Mason       2008-03-25  6458  	}
de11cc12df1733 Li Zefan          2011-12-01  6459  
2b19a1fef7be74 Liu Bo            2017-03-14  6460  	if (need_full_stripe(op))
d20983b40e828f Miao Xie          2014-07-03  6461  		max_errors = btrfs_chunk_max_errors(map);
de11cc12df1733 Li Zefan          2011-12-01  6462  
73c0f228250ff7 Liu Bo            2017-03-14  6463  	if (dev_replace_is_ongoing && dev_replace->tgtdev != NULL &&
2b19a1fef7be74 Liu Bo            2017-03-14  6464  	    need_full_stripe(op)) {
be5c7edbfdf111 Qu Wenruo         2023-02-07  6465  		handle_ops_on_dev_replace(op, bioc, dev_replace, logical,
6143c23ccced76 Naohiro Aota      2021-02-04  6466  					  &num_stripes, &max_errors);
ad6d620e2a5704 Stefan Behrens    2012-11-06  6467  	}
472262f35a6b34 Stefan Behrens    2012-11-06  6468  
4c664611791239 Qu Wenruo         2021-09-15  6469  	*bioc_ret = bioc;
4c664611791239 Qu Wenruo         2021-09-15  6470  	bioc->num_stripes = num_stripes;
4c664611791239 Qu Wenruo         2021-09-15  6471  	bioc->max_errors = max_errors;
4c664611791239 Qu Wenruo         2021-09-15  6472  	bioc->mirror_num = mirror_num;
ad6d620e2a5704 Stefan Behrens    2012-11-06  6473  
cea9e4452ebaf1 Chris Mason       2008-04-09  6474  out:
73beece9ca07c0 Liu Bo            2015-07-17  6475  	if (dev_replace_is_ongoing) {
53176dde0acd8f David Sterba      2018-04-05  6476  		lockdep_assert_held(&dev_replace->rwsem);
53176dde0acd8f David Sterba      2018-04-05  6477  		/* Unlock and let waiting writers proceed */
cb5583dd52fab4 David Sterba      2018-09-07  6478  		up_read(&dev_replace->rwsem);
73beece9ca07c0 Liu Bo            2015-07-17  6479  	}
0b86a832a1f38a Chris Mason       2008-03-24  6480  	free_extent_map(em);
de11cc12df1733 Li Zefan          2011-12-01  6481  	return ret;
0b86a832a1f38a Chris Mason       2008-03-24  6482  }
0b86a832a1f38a Chris Mason       2008-03-24  6483  

:::::: The code at line 6412 was first introduced by commit
:::::: 03793cbbc80fe616498f8141f853575b2d140222 btrfs: add fast path for single device io in __btrfs_map_block

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
