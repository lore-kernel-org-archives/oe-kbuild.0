Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B748265A
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679036402; x=1710572402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ef/PUcWGFqb3cHr/iX5C1Ri800Bzz2BSY7UJtv3pefo=;
  b=Q3kkznRiweQN5jCSdle25Yecry97nsLhQSq7EWB/mD1wWkIoIJIRZThA
   Bzp3pVPTayP+zpk8AHRpfoIomHWN/Sq/on6VjpUdYQsrMdA5kwUV0SJhs
   JMDzBjV3IWyW8ASiEWWD5yeZhvJEOaLdwsWXv7OwDFcjy5bhvWIVDTIQ1
   ms14fOVTlmwQudGJdZiKB1uCBoplCwmdvrZlfBSDwADNOXGfznG18C3Ka
   Dw1Q58XR2ojEOP67ppvs1n0Xhv7Ma0E//lb7UINfipHOcz4NORLLr5ErR
   HjR4AGmholyaH1ggkfLbriSsXbLzwwVm6vxrO0svRX43KwTYmFabcjb8k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318592989"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="318592989"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 00:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657456572"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="657456572"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Mar 2023 00:00:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd44F-0009AE-1c;
	Fri, 17 Mar 2023 06:59:59 +0000
Date: Fri, 17 Mar 2023 14:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:dev 16/43] fs/ext4/balloc.c:153
 ext4_num_overhead_clusters() error: uninitialized symbol 'block_cluster'.
Message-ID: <202303171446.eLEhZzAu-lkp@intel.com>
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
CC: linux-ext4@vger.kernel.org
TO: Kemeng Shi <shikemeng@huaweicloud.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   da8c7d2105be0c0028cfad712da9e17adf9a26eb
commit: e3c70113e2cbeb3dadb3768964920337eff290f6 [16/43] ext4: improve inode table blocks counting in ext4_num_overhead_clusters
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171446.eLEhZzAu-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303171446.eLEhZzAu-lkp@intel.com/

smatch warnings:
fs/ext4/balloc.c:153 ext4_num_overhead_clusters() error: uninitialized symbol 'block_cluster'.

vim +/block_cluster +153 fs/ext4/balloc.c

0bf7e8379ce7e01 Jose R. Santos    2008-06-03   82  
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   83  /*
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   84   * Return the number of clusters used for file system metadata; this
d5b8f31007a9377 Theodore Ts'o     2011-09-09   85   * represents the overhead needed by the file system.
d5b8f31007a9377 Theodore Ts'o     2011-09-09   86   */
c197855ea14175a Stephen Hemminger 2014-05-12   87  static unsigned ext4_num_overhead_clusters(struct super_block *sb,
e187c6588d6ef31 Theodore Ts'o     2009-02-06   88  					   ext4_group_t block_group,
e187c6588d6ef31 Theodore Ts'o     2009-02-06   89  					   struct ext4_group_desc *gdp)
0bf7e8379ce7e01 Jose R. Santos    2008-06-03   90  {
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   91  	unsigned base_clusters, num_clusters;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   92  	int block_cluster, inode_cluster;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   93  	int itbl_cluster_start = -1, itbl_cluster_end = -1;
d5b8f31007a9377 Theodore Ts'o     2011-09-09   94  	ext4_fsblk_t start = ext4_group_first_block_no(sb, block_group);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   95  	ext4_fsblk_t end = start + EXT4_BLOCKS_PER_GROUP(sb) - 1;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21   96  	ext4_fsblk_t itbl_blk_start, itbl_blk_end;
0bf7e8379ce7e01 Jose R. Santos    2008-06-03   97  	struct ext4_sb_info *sbi = EXT4_SB(sb);
0bf7e8379ce7e01 Jose R. Santos    2008-06-03   98  
d5b8f31007a9377 Theodore Ts'o     2011-09-09   99  	/* This is the number of clusters used by the superblock,
d5b8f31007a9377 Theodore Ts'o     2011-09-09  100  	 * block group descriptors, and reserved block group
d5b8f31007a9377 Theodore Ts'o     2011-09-09  101  	 * descriptor blocks */
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  102  	base_clusters = ext4_num_base_meta_clusters(sb, block_group);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  103  	num_clusters = base_clusters;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  104  
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  105  	/*
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  106  	 * Account and record inode table clusters if any cluster
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  107  	 * is in the block group, or inode table cluster range is
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  108  	 * [-1, -1] and won't overlap with block/inode bitmap cluster
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  109  	 * accounted below.
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  110  	 */
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  111  	itbl_blk_start = ext4_inode_table(sb, gdp);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  112  	itbl_blk_end = itbl_blk_start + sbi->s_itb_per_group - 1;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  113  	if (itbl_blk_start <= end && itbl_blk_end >= start) {
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  114  		itbl_blk_start = itbl_blk_start >= start ?
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  115  			itbl_blk_start : start;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  116  		itbl_blk_end = itbl_blk_end <= end ?
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  117  			itbl_blk_end : end;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  118  
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  119  		itbl_cluster_start = EXT4_B2C(sbi, itbl_blk_start - start);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  120  		itbl_cluster_end = EXT4_B2C(sbi, itbl_blk_end - start);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  121  
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  122  		num_clusters += itbl_cluster_end - itbl_cluster_start + 1;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  123  		/* check if border cluster is overlapped */
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  124  		if (itbl_cluster_start == base_clusters - 1)
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  125  			num_clusters--;
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  126  	}
0bf7e8379ce7e01 Jose R. Santos    2008-06-03  127  
d5b8f31007a9377 Theodore Ts'o     2011-09-09  128  	/*
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  129  	 * For the allocation bitmaps, we first need to check to see
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  130  	 * if the block is in the block group.  If it is, then check
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  131  	 * to see if the cluster is already accounted for in the clusters
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  132  	 * used for the base metadata cluster and inode tables cluster.
d5b8f31007a9377 Theodore Ts'o     2011-09-09  133  	 * Normally all of these blocks are contiguous, so the special
d5b8f31007a9377 Theodore Ts'o     2011-09-09  134  	 * case handling shouldn't be necessary except for *very*
d5b8f31007a9377 Theodore Ts'o     2011-09-09  135  	 * unusual file system layouts.
d5b8f31007a9377 Theodore Ts'o     2011-09-09  136  	 */
d5b8f31007a9377 Theodore Ts'o     2011-09-09  137  	if (ext4_block_in_group(sb, ext4_block_bitmap(sb, gdp), block_group)) {
b0dd6b70f0fda17 Theodore Ts'o     2012-06-07  138  		block_cluster = EXT4_B2C(sbi,
b0dd6b70f0fda17 Theodore Ts'o     2012-06-07  139  					 ext4_block_bitmap(sb, gdp) - start);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  140  		if (block_cluster >= base_clusters &&
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  141  		    (block_cluster < itbl_cluster_start ||
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  142  		    block_cluster > itbl_cluster_end))
d5b8f31007a9377 Theodore Ts'o     2011-09-09  143  			num_clusters++;
d5b8f31007a9377 Theodore Ts'o     2011-09-09  144  	}
d5b8f31007a9377 Theodore Ts'o     2011-09-09  145  
d5b8f31007a9377 Theodore Ts'o     2011-09-09  146  	if (ext4_block_in_group(sb, ext4_inode_bitmap(sb, gdp), block_group)) {
d5b8f31007a9377 Theodore Ts'o     2011-09-09  147  		inode_cluster = EXT4_B2C(sbi,
b0dd6b70f0fda17 Theodore Ts'o     2012-06-07  148  					 ext4_inode_bitmap(sb, gdp) - start);
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  149  		/*
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  150  		 * Additional check if inode bitmap is in just accounted
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  151  		 * block_cluster
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  152  		 */
e3c70113e2cbeb3 Kemeng Shi        2023-02-21 @153  		if (inode_cluster != block_cluster &&
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  154  		    inode_cluster >= base_clusters &&
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  155  		    (inode_cluster < itbl_cluster_start ||
e3c70113e2cbeb3 Kemeng Shi        2023-02-21  156  		    inode_cluster > itbl_cluster_end))
d5b8f31007a9377 Theodore Ts'o     2011-09-09  157  			num_clusters++;
0bf7e8379ce7e01 Jose R. Santos    2008-06-03  158  	}
d5b8f31007a9377 Theodore Ts'o     2011-09-09  159  
d5b8f31007a9377 Theodore Ts'o     2011-09-09  160  	return num_clusters;
0bf7e8379ce7e01 Jose R. Santos    2008-06-03  161  }
c2ea3fde61f1df1 Theodore Ts'o     2008-10-10  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
