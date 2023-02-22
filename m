Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE192F3F
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677078382; x=1708614382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ZnL1l1qok/izto5hI7aoAu1aiWUVjeIhPqjsRU30xk=;
  b=SyTZBJ+SLzpOtaQjA0Scz1QYMAKkd365BrgPbiBx17A3S7tpSrEqpdK9
   8QIDn5P+NiSnF19HnMEjBrDpzC9f2X/Vo/+BL0qJAEpFV9/Xr4795MydA
   1TdvMfick52Vi7CfQ+8FBGHxxhSCAXvqYtAt414AKNb/YDhCustwiT895
   HNiDxlfWai+sai9+cTNiq6R56trjv6XwzuArCJUxw0UYzHvT5gaYptgQH
   gfGbW51F8aI0oBMxzcs7wlq9vuT12WozR26slLs/o8uE0PewRaGA/PWxn
   kf15YrFEbwjTzJOiYGS5PCDucXFo7TH0GO+d2WZCPYWPH3ZP1EXvlI+qL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331612791"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="331612791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 07:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846174160"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="846174160"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Feb 2023 07:06:20 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUqhH-0000Tr-1W;
	Wed, 22 Feb 2023 15:06:19 +0000
Date: Wed, 22 Feb 2023 23:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 7/7] ext4: improve inode table blocks counting in
 ext4_num_overhead_clusters
Message-ID: <202302222219.u328sqfs-lkp@intel.com>
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
In-Reply-To: <20230221115919.1918161-8-shikemeng@huaweicloud.com>
References: <20230221115919.1918161-8-shikemeng@huaweicloud.com>
TO: Kemeng Shi <shikemeng@huaweicloud.com>
TO: tytso@mit.edu
TO: adilger.kernel@dilger.ca
CC: linux-ext4@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: shikemeng@huaweicloud.com

Hi Kemeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.2 next-20230222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/ext4-properly-handle-error-of-ext4_init_block_bitmap-in-ext4_read_block_bitmap_nowait/20230221-115830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230221115919.1918161-8-shikemeng%40huaweicloud.com
patch subject: [PATCH 7/7] ext4: improve inode table blocks counting in ext4_num_overhead_clusters
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: riscv-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230222/202302222219.u328sqfs-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302222219.u328sqfs-lkp@intel.com/

New smatch warnings:
fs/ext4/balloc.c:153 ext4_num_overhead_clusters() error: uninitialized symbol 'block_cluster'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/block_cluster +153 fs/ext4/balloc.c

0bf7e8379ce7e0 Jose R. Santos    2008-06-03   82  
2b59a2fd93873a Kemeng Shi        2023-02-21   83  /*
2b59a2fd93873a Kemeng Shi        2023-02-21   84   * Return the number of clusters used for file system metadata; this
d5b8f31007a937 Theodore Ts'o     2011-09-09   85   * represents the overhead needed by the file system.
d5b8f31007a937 Theodore Ts'o     2011-09-09   86   */
c197855ea14175 Stephen Hemminger 2014-05-12   87  static unsigned ext4_num_overhead_clusters(struct super_block *sb,
e187c6588d6ef3 Theodore Ts'o     2009-02-06   88  					   ext4_group_t block_group,
e187c6588d6ef3 Theodore Ts'o     2009-02-06   89  					   struct ext4_group_desc *gdp)
0bf7e8379ce7e0 Jose R. Santos    2008-06-03   90  {
2b59a2fd93873a Kemeng Shi        2023-02-21   91  	unsigned base_clusters, num_clusters;
2b59a2fd93873a Kemeng Shi        2023-02-21   92  	int block_cluster, inode_cluster;
2b59a2fd93873a Kemeng Shi        2023-02-21   93  	int itbl_cluster_start = -1, itbl_cluster_end = -1;
d5b8f31007a937 Theodore Ts'o     2011-09-09   94  	ext4_fsblk_t start = ext4_group_first_block_no(sb, block_group);
2b59a2fd93873a Kemeng Shi        2023-02-21   95  	ext4_fsblk_t end = start + EXT4_BLOCKS_PER_GROUP(sb) - 1;
2b59a2fd93873a Kemeng Shi        2023-02-21   96  	ext4_fsblk_t itbl_blk_start, itbl_blk_end;
0bf7e8379ce7e0 Jose R. Santos    2008-06-03   97  	struct ext4_sb_info *sbi = EXT4_SB(sb);
0bf7e8379ce7e0 Jose R. Santos    2008-06-03   98  
d5b8f31007a937 Theodore Ts'o     2011-09-09   99  	/* This is the number of clusters used by the superblock,
d5b8f31007a937 Theodore Ts'o     2011-09-09  100  	 * block group descriptors, and reserved block group
d5b8f31007a937 Theodore Ts'o     2011-09-09  101  	 * descriptor blocks */
2b59a2fd93873a Kemeng Shi        2023-02-21  102  	base_clusters = ext4_num_base_meta_clusters(sb, block_group);
2b59a2fd93873a Kemeng Shi        2023-02-21  103  	num_clusters = base_clusters;
2b59a2fd93873a Kemeng Shi        2023-02-21  104  
2b59a2fd93873a Kemeng Shi        2023-02-21  105  	/*
2b59a2fd93873a Kemeng Shi        2023-02-21  106  	 * Account and record inode table clusters if any cluster
2b59a2fd93873a Kemeng Shi        2023-02-21  107  	 * is in the block group, or inode table cluster range is
2b59a2fd93873a Kemeng Shi        2023-02-21  108  	 * [-1, -1] and won't overlap with block/inode bitmap cluster
2b59a2fd93873a Kemeng Shi        2023-02-21  109  	 * accounted below.
2b59a2fd93873a Kemeng Shi        2023-02-21  110  	 */
2b59a2fd93873a Kemeng Shi        2023-02-21  111  	itbl_blk_start = ext4_inode_table(sb, gdp);
2b59a2fd93873a Kemeng Shi        2023-02-21  112  	itbl_blk_end = itbl_blk_start + sbi->s_itb_per_group - 1;
2b59a2fd93873a Kemeng Shi        2023-02-21  113  	if (itbl_blk_start <= end && itbl_blk_end >= start) {
2b59a2fd93873a Kemeng Shi        2023-02-21  114  		itbl_blk_start = itbl_blk_start >= start ?
2b59a2fd93873a Kemeng Shi        2023-02-21  115  			itbl_blk_start : start;
2b59a2fd93873a Kemeng Shi        2023-02-21  116  		itbl_blk_end = itbl_blk_end <= end ?
2b59a2fd93873a Kemeng Shi        2023-02-21  117  			itbl_blk_end : end;
2b59a2fd93873a Kemeng Shi        2023-02-21  118  
2b59a2fd93873a Kemeng Shi        2023-02-21  119  		itbl_cluster_start = EXT4_B2C(sbi, itbl_blk_start - start);
2b59a2fd93873a Kemeng Shi        2023-02-21  120  		itbl_cluster_end = EXT4_B2C(sbi, itbl_blk_end - start);
2b59a2fd93873a Kemeng Shi        2023-02-21  121  
2b59a2fd93873a Kemeng Shi        2023-02-21  122  		num_clusters += itbl_cluster_end - itbl_cluster_start + 1;
2b59a2fd93873a Kemeng Shi        2023-02-21  123  		/* check if border cluster is overlapped */
2b59a2fd93873a Kemeng Shi        2023-02-21  124  		if (itbl_cluster_start == base_clusters - 1)
2b59a2fd93873a Kemeng Shi        2023-02-21  125  			num_clusters--;
2b59a2fd93873a Kemeng Shi        2023-02-21  126  	}
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  127  
d5b8f31007a937 Theodore Ts'o     2011-09-09  128  	/*
2b59a2fd93873a Kemeng Shi        2023-02-21  129  	 * For the allocation bitmaps, we first need to check to see
2b59a2fd93873a Kemeng Shi        2023-02-21  130  	 * if the block is in the block group.  If it is, then check
2b59a2fd93873a Kemeng Shi        2023-02-21  131  	 * to see if the cluster is already accounted for in the clusters
2b59a2fd93873a Kemeng Shi        2023-02-21  132  	 * used for the base metadata cluster and inode tables cluster.
d5b8f31007a937 Theodore Ts'o     2011-09-09  133  	 * Normally all of these blocks are contiguous, so the special
d5b8f31007a937 Theodore Ts'o     2011-09-09  134  	 * case handling shouldn't be necessary except for *very*
d5b8f31007a937 Theodore Ts'o     2011-09-09  135  	 * unusual file system layouts.
d5b8f31007a937 Theodore Ts'o     2011-09-09  136  	 */
d5b8f31007a937 Theodore Ts'o     2011-09-09  137  	if (ext4_block_in_group(sb, ext4_block_bitmap(sb, gdp), block_group)) {
b0dd6b70f0fda1 Theodore Ts'o     2012-06-07  138  		block_cluster = EXT4_B2C(sbi,
b0dd6b70f0fda1 Theodore Ts'o     2012-06-07  139  					 ext4_block_bitmap(sb, gdp) - start);
2b59a2fd93873a Kemeng Shi        2023-02-21  140  		if (block_cluster >= base_clusters &&
2b59a2fd93873a Kemeng Shi        2023-02-21  141  		    (block_cluster < itbl_cluster_start ||
2b59a2fd93873a Kemeng Shi        2023-02-21  142  		    block_cluster > itbl_cluster_end))
d5b8f31007a937 Theodore Ts'o     2011-09-09  143  			num_clusters++;
d5b8f31007a937 Theodore Ts'o     2011-09-09  144  	}
d5b8f31007a937 Theodore Ts'o     2011-09-09  145  
d5b8f31007a937 Theodore Ts'o     2011-09-09  146  	if (ext4_block_in_group(sb, ext4_inode_bitmap(sb, gdp), block_group)) {
d5b8f31007a937 Theodore Ts'o     2011-09-09  147  		inode_cluster = EXT4_B2C(sbi,
b0dd6b70f0fda1 Theodore Ts'o     2012-06-07  148  					 ext4_inode_bitmap(sb, gdp) - start);
2b59a2fd93873a Kemeng Shi        2023-02-21  149  		/*
2b59a2fd93873a Kemeng Shi        2023-02-21  150  		 * Additional check if inode bitmap is in just accounted
2b59a2fd93873a Kemeng Shi        2023-02-21  151  		 * block_cluster
2b59a2fd93873a Kemeng Shi        2023-02-21  152  		 */
2b59a2fd93873a Kemeng Shi        2023-02-21 @153  		if (inode_cluster != block_cluster &&
2b59a2fd93873a Kemeng Shi        2023-02-21  154  		    inode_cluster >= base_clusters &&
2b59a2fd93873a Kemeng Shi        2023-02-21  155  		    (inode_cluster < itbl_cluster_start ||
2b59a2fd93873a Kemeng Shi        2023-02-21  156  		    inode_cluster > itbl_cluster_end))
d5b8f31007a937 Theodore Ts'o     2011-09-09  157  			num_clusters++;
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  158  	}
d5b8f31007a937 Theodore Ts'o     2011-09-09  159  
d5b8f31007a937 Theodore Ts'o     2011-09-09  160  	return num_clusters;
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  161  }
c2ea3fde61f1df Theodore Ts'o     2008-10-10  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
