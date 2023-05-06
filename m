Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5F7E
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 04:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683347260; x=1714883260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTpqtLGojiRI0ZX2uew9TEedM+EverML/tnpImE8ja0=;
  b=W7glF9AJRAKQ1FnFOn61a6RGwJucYXrSgplDcU2a3enr151V/PKIzrhS
   CKxcOV3YbBjNGIMmKx8FjDpJraBiZj/sbWaJNDiY2GuUe5KJTDZlfjc2a
   s8lG7reE7jbv0yx7VBqIOOAmElnPoRFRe3a46/akNaattutO8xka1lOeS
   Ubkfwpd0m7p8LD8qQS/oMAKpsTY2KQyjs5Utj495kZEmz2JMoaMGJBaQ4
   i9KEC1ZhYNr6e/bwVB2eEnYHEJUPHmwMoURBJa1BIHNaiX8wOVGULOXBs
   T04TW9fCRrDNX+KjZVbAFVI+kMN4ZD66BggmQpUYCM5NEU+CbLAl3qBAa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412587642"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="412587642"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 21:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="728370678"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="728370678"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 May 2023 21:27:38 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv9WD-00019B-1J;
	Sat, 06 May 2023 04:27:37 +0000
Date: Sat, 6 May 2023 12:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/verity.c:316 ext4_get_verity_descriptor_location() error:
 uninitialized symbol 'desc_size_disk'.
Message-ID: <202305061203.XAeJO5DP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matthew Wilcox <willy@infradead.org>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1e1337881b0e9844d687982aa54b31b1269b11
commit: b23fb762785babc1d6194770c88432da037c8a64 ext4: Convert pagecache_read() to use a folio
date:   4 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m041-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061203.XAeJO5DP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305061203.XAeJO5DP-lkp@intel.com/

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
