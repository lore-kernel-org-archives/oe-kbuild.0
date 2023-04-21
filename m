Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33B182
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Apr 2023 00:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682036347; x=1713572347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4hgxfob+ob7UTk5UWhX8umAnqecvc49X2DhxNZHESo=;
  b=ODREYJHDFBFKEduEbLlLERdh3iw0SisLDoBUDXz2cKmMBgQzKXbW7WOj
   /jwmPFn3eb5RJktKASE0s+RP3UbQda7HXA9YV7MiSGLS3VbZeoIJR4Dt7
   VhMEXj9mZx4BUoLPsLkFbVbNpZAzxmkTzxVZkEe6bBEQ+02XRSU5Uf8i2
   GYISVSgTR4SccZp0jVJAkTNQ7edhY3DBeED62FKI678BcX/T/uuXUddID
   b946ERbSEbLJqGTjKELGGRyIBFzxMxb68Nsut/WvxuiMtdXM4/nwOdHxx
   rh6z940xa3zvJJiShI8iASKWD4SE7RyoQ1xmB/7u677Ja6No4gjrB5LZ/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432162796"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="432162796"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 17:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="761385730"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="761385730"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2023 17:18:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppeUM-000gBy-0X;
	Fri, 21 Apr 2023 00:18:58 +0000
Date: Fri, 21 Apr 2023 08:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9137/13289] fs/ext4/verity.c:316
 ext4_get_verity_descriptor_location() error: uninitialized symbol
 'desc_size_disk'.
Message-ID: <202304210812.6fG0lptN-lkp@intel.com>
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
TO: Matthew Wilcox <willy@infradead.org>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44bf136283e567b2b62653be7630e7511da41da2
commit: b23fb762785babc1d6194770c88432da037c8a64 [9137/13289] ext4: Convert pagecache_read() to use a folio
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-m041-20230416 (https://download.01.org/0day-ci/archive/20230421/202304210812.6fG0lptN-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304210812.6fG0lptN-lkp@intel.com/

New smatch warnings:
fs/ext4/verity.c:316 ext4_get_verity_descriptor_location() error: uninitialized symbol 'desc_size_disk'.

Old smatch warnings:
fs/ext4/verity.c:205 ext4_end_enable_verity() warn: missing error code 'err'
fs/ext4/verity.c:315 ext4_get_verity_descriptor_location() warn: missing unwind goto?

vim +/desc_size_disk +316 fs/ext4/verity.c

c93d8f88580921 Eric Biggers 2019-07-22  268  
c93d8f88580921 Eric Biggers 2019-07-22  269  static int ext4_get_verity_descriptor_location(struct inode *inode,
c93d8f88580921 Eric Biggers 2019-07-22  270  					       size_t *desc_size_ret,
c93d8f88580921 Eric Biggers 2019-07-22  271  					       u64 *desc_pos_ret)
c93d8f88580921 Eric Biggers 2019-07-22  272  {
c93d8f88580921 Eric Biggers 2019-07-22  273  	struct ext4_ext_path *path;
c93d8f88580921 Eric Biggers 2019-07-22  274  	struct ext4_extent *last_extent;
c93d8f88580921 Eric Biggers 2019-07-22  275  	u32 end_lblk;
c93d8f88580921 Eric Biggers 2019-07-22  276  	u64 desc_size_pos;
c93d8f88580921 Eric Biggers 2019-07-22  277  	__le32 desc_size_disk;
c93d8f88580921 Eric Biggers 2019-07-22  278  	u32 desc_size;
c93d8f88580921 Eric Biggers 2019-07-22  279  	u64 desc_pos;
c93d8f88580921 Eric Biggers 2019-07-22  280  	int err;
c93d8f88580921 Eric Biggers 2019-07-22  281  
c93d8f88580921 Eric Biggers 2019-07-22  282  	/*
c93d8f88580921 Eric Biggers 2019-07-22  283  	 * Descriptor size is in last 4 bytes of last allocated block.
c93d8f88580921 Eric Biggers 2019-07-22  284  	 * See ext4_write_verity_descriptor().
c93d8f88580921 Eric Biggers 2019-07-22  285  	 */
c93d8f88580921 Eric Biggers 2019-07-22  286  
c93d8f88580921 Eric Biggers 2019-07-22  287  	if (!ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS)) {
c93d8f88580921 Eric Biggers 2019-07-22  288  		EXT4_ERROR_INODE(inode, "verity file doesn't use extents");
c93d8f88580921 Eric Biggers 2019-07-22  289  		return -EFSCORRUPTED;
c93d8f88580921 Eric Biggers 2019-07-22  290  	}
c93d8f88580921 Eric Biggers 2019-07-22  291  
c93d8f88580921 Eric Biggers 2019-07-22  292  	path = ext4_find_extent(inode, EXT_MAX_BLOCKS - 1, NULL, 0);
c93d8f88580921 Eric Biggers 2019-07-22  293  	if (IS_ERR(path))
c93d8f88580921 Eric Biggers 2019-07-22  294  		return PTR_ERR(path);
c93d8f88580921 Eric Biggers 2019-07-22  295  
c93d8f88580921 Eric Biggers 2019-07-22  296  	last_extent = path[path->p_depth].p_ext;
c93d8f88580921 Eric Biggers 2019-07-22  297  	if (!last_extent) {
c93d8f88580921 Eric Biggers 2019-07-22  298  		EXT4_ERROR_INODE(inode, "verity file has no extents");
7ff5fddaddf2cc Ye Bin       2022-09-24  299  		ext4_free_ext_path(path);
c93d8f88580921 Eric Biggers 2019-07-22  300  		return -EFSCORRUPTED;
c93d8f88580921 Eric Biggers 2019-07-22  301  	}
c93d8f88580921 Eric Biggers 2019-07-22  302  
c93d8f88580921 Eric Biggers 2019-07-22  303  	end_lblk = le32_to_cpu(last_extent->ee_block) +
c93d8f88580921 Eric Biggers 2019-07-22  304  		   ext4_ext_get_actual_len(last_extent);
c93d8f88580921 Eric Biggers 2019-07-22  305  	desc_size_pos = (u64)end_lblk << inode->i_blkbits;
7ff5fddaddf2cc Ye Bin       2022-09-24  306  	ext4_free_ext_path(path);
c93d8f88580921 Eric Biggers 2019-07-22  307  
c93d8f88580921 Eric Biggers 2019-07-22  308  	if (desc_size_pos < sizeof(desc_size_disk))
c93d8f88580921 Eric Biggers 2019-07-22  309  		goto bad;
c93d8f88580921 Eric Biggers 2019-07-22  310  	desc_size_pos -= sizeof(desc_size_disk);
c93d8f88580921 Eric Biggers 2019-07-22  311  
c93d8f88580921 Eric Biggers 2019-07-22  312  	err = pagecache_read(inode, &desc_size_disk, sizeof(desc_size_disk),
c93d8f88580921 Eric Biggers 2019-07-22  313  			     desc_size_pos);
c93d8f88580921 Eric Biggers 2019-07-22  314  	if (err)
c93d8f88580921 Eric Biggers 2019-07-22  315  		return err;
c93d8f88580921 Eric Biggers 2019-07-22 @316  	desc_size = le32_to_cpu(desc_size_disk);
c93d8f88580921 Eric Biggers 2019-07-22  317  
c93d8f88580921 Eric Biggers 2019-07-22  318  	/*
c93d8f88580921 Eric Biggers 2019-07-22  319  	 * The descriptor is stored just before the desc_size_disk, but starting
c93d8f88580921 Eric Biggers 2019-07-22  320  	 * on a filesystem block boundary.
c93d8f88580921 Eric Biggers 2019-07-22  321  	 */
c93d8f88580921 Eric Biggers 2019-07-22  322  
c93d8f88580921 Eric Biggers 2019-07-22  323  	if (desc_size > INT_MAX || desc_size > desc_size_pos)
c93d8f88580921 Eric Biggers 2019-07-22  324  		goto bad;
c93d8f88580921 Eric Biggers 2019-07-22  325  
c93d8f88580921 Eric Biggers 2019-07-22  326  	desc_pos = round_down(desc_size_pos - desc_size, i_blocksize(inode));
c93d8f88580921 Eric Biggers 2019-07-22  327  	if (desc_pos < ext4_verity_metadata_pos(inode))
c93d8f88580921 Eric Biggers 2019-07-22  328  		goto bad;
c93d8f88580921 Eric Biggers 2019-07-22  329  
c93d8f88580921 Eric Biggers 2019-07-22  330  	*desc_size_ret = desc_size;
c93d8f88580921 Eric Biggers 2019-07-22  331  	*desc_pos_ret = desc_pos;
c93d8f88580921 Eric Biggers 2019-07-22  332  	return 0;
c93d8f88580921 Eric Biggers 2019-07-22  333  
c93d8f88580921 Eric Biggers 2019-07-22  334  bad:
c93d8f88580921 Eric Biggers 2019-07-22  335  	EXT4_ERROR_INODE(inode, "verity file corrupted; can't find descriptor");
c93d8f88580921 Eric Biggers 2019-07-22  336  	return -EFSCORRUPTED;
c93d8f88580921 Eric Biggers 2019-07-22  337  }
c93d8f88580921 Eric Biggers 2019-07-22  338  

:::::: The code at line 316 was first introduced by commit
:::::: c93d8f88580921c84d2213161ef3c22560511b84 ext4: add basic fs-verity support

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
