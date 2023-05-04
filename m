Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DA10EC
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 05:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683179158; x=1714715158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RM7T1yMQAFHotPb8GmZC73oYgG1pl0kYAQR9RlNHbrg=;
  b=Mn7RkMqeOV8mWZOkSrfbs5f4ADTOXnp8AGpqc0PNbJUxxcpy+cUwgpyL
   sgkmv5v0i4+DirLlfoOxfjqnaK/nVxzRoX6tWCzbHXx+QjjOzBM5eeyqh
   v/tVmVH8dLDOPQR14doHhLan9na+2AMpzBJ8Y65NBu1u/kiW9Q9EWTOiW
   rjQAu1P9nGS//fa5o/N2e1NdlSQM5NEvoL+/y/wYgUnXJtcCVk4125PWe
   N+oeyjoQ0ZonBehY8A0NzL1iZdiY0dm+cIAx56eX7lmfDkQjxyFoOv8Ap
   8dHR9BinbibodisXnVYh0ThzZ1x8oi06/i/n20LIvYAISrvr9o5IzYqGQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333208239"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="333208239"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 22:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786384684"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="786384684"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 May 2023 22:45:51 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puRmo-0002c2-0j;
	Thu, 04 May 2023 05:45:50 +0000
Date: Thu, 4 May 2023 13:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/super.c:4722 ext4_check_feature_compatibility() warn:
 bitwise AND condition is false here
Message-ID: <202305041321.u1en7XZ0-lkp@intel.com>
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
TO: Jason Yan <yanaijie@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1a5304fecee523060f26e2778d9d8e33c0562df3
commit: 54902099b1d8b62bea7cfd949aa3acd9eae1c3db ext4: move dax and encrypt checking into ext4_check_feature_compatibility()
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: nios2-randconfig-m031-20230503 (https://download.01.org/0day-ci/archive/20230504/202305041321.u1en7XZ0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305041321.u1en7XZ0-lkp@intel.com/

New smatch warnings:
fs/ext4/super.c:4722 ext4_check_feature_compatibility() warn: bitwise AND condition is false here

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
fs/ext4/super.c:2802 ext4_check_opt_consistency() warn: bitwise AND condition is false here
fs/ext4/super.c:2810 ext4_check_opt_consistency() warn: bitwise AND condition is false here
fs/ext4/super.c:2813 ext4_check_opt_consistency() warn: bitwise AND condition is false here
fs/ext4/super.c:4036 ext4_register_li_request() error: we previously assumed 'ext4_li_info' could be null (see line 4018)

vim +4722 fs/ext4/super.c

b26458d151019e Jason Yan 2022-09-16  4639  
d7f3542b321962 Jason Yan 2022-09-16  4640  static int ext4_check_feature_compatibility(struct super_block *sb,
d7f3542b321962 Jason Yan 2022-09-16  4641  					    struct ext4_super_block *es,
d7f3542b321962 Jason Yan 2022-09-16  4642  					    int silent)
d7f3542b321962 Jason Yan 2022-09-16  4643  {
54902099b1d8b6 Jason Yan 2023-03-23  4644  	struct ext4_sb_info *sbi = EXT4_SB(sb);
54902099b1d8b6 Jason Yan 2023-03-23  4645  
d7f3542b321962 Jason Yan 2022-09-16  4646  	if (le32_to_cpu(es->s_rev_level) == EXT4_GOOD_OLD_REV &&
d7f3542b321962 Jason Yan 2022-09-16  4647  	    (ext4_has_compat_features(sb) ||
d7f3542b321962 Jason Yan 2022-09-16  4648  	     ext4_has_ro_compat_features(sb) ||
d7f3542b321962 Jason Yan 2022-09-16  4649  	     ext4_has_incompat_features(sb)))
d7f3542b321962 Jason Yan 2022-09-16  4650  		ext4_msg(sb, KERN_WARNING,
d7f3542b321962 Jason Yan 2022-09-16  4651  		       "feature flags set on rev 0 fs, "
d7f3542b321962 Jason Yan 2022-09-16  4652  		       "running e2fsck is recommended");
d7f3542b321962 Jason Yan 2022-09-16  4653  
d7f3542b321962 Jason Yan 2022-09-16  4654  	if (es->s_creator_os == cpu_to_le32(EXT4_OS_HURD)) {
d7f3542b321962 Jason Yan 2022-09-16  4655  		set_opt2(sb, HURD_COMPAT);
d7f3542b321962 Jason Yan 2022-09-16  4656  		if (ext4_has_feature_64bit(sb)) {
d7f3542b321962 Jason Yan 2022-09-16  4657  			ext4_msg(sb, KERN_ERR,
d7f3542b321962 Jason Yan 2022-09-16  4658  				 "The Hurd can't support 64-bit file systems");
d7f3542b321962 Jason Yan 2022-09-16  4659  			return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4660  		}
d7f3542b321962 Jason Yan 2022-09-16  4661  
d7f3542b321962 Jason Yan 2022-09-16  4662  		/*
d7f3542b321962 Jason Yan 2022-09-16  4663  		 * ea_inode feature uses l_i_version field which is not
d7f3542b321962 Jason Yan 2022-09-16  4664  		 * available in HURD_COMPAT mode.
d7f3542b321962 Jason Yan 2022-09-16  4665  		 */
d7f3542b321962 Jason Yan 2022-09-16  4666  		if (ext4_has_feature_ea_inode(sb)) {
d7f3542b321962 Jason Yan 2022-09-16  4667  			ext4_msg(sb, KERN_ERR,
d7f3542b321962 Jason Yan 2022-09-16  4668  				 "ea_inode feature is not supported for Hurd");
d7f3542b321962 Jason Yan 2022-09-16  4669  			return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4670  		}
d7f3542b321962 Jason Yan 2022-09-16  4671  	}
d7f3542b321962 Jason Yan 2022-09-16  4672  
d7f3542b321962 Jason Yan 2022-09-16  4673  	if (IS_EXT2_SB(sb)) {
d7f3542b321962 Jason Yan 2022-09-16  4674  		if (ext2_feature_set_ok(sb))
d7f3542b321962 Jason Yan 2022-09-16  4675  			ext4_msg(sb, KERN_INFO, "mounting ext2 file system "
d7f3542b321962 Jason Yan 2022-09-16  4676  				 "using the ext4 subsystem");
d7f3542b321962 Jason Yan 2022-09-16  4677  		else {
d7f3542b321962 Jason Yan 2022-09-16  4678  			/*
d7f3542b321962 Jason Yan 2022-09-16  4679  			 * If we're probing be silent, if this looks like
d7f3542b321962 Jason Yan 2022-09-16  4680  			 * it's actually an ext[34] filesystem.
d7f3542b321962 Jason Yan 2022-09-16  4681  			 */
d7f3542b321962 Jason Yan 2022-09-16  4682  			if (silent && ext4_feature_set_ok(sb, sb_rdonly(sb)))
d7f3542b321962 Jason Yan 2022-09-16  4683  				return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4684  			ext4_msg(sb, KERN_ERR, "couldn't mount as ext2 due "
d7f3542b321962 Jason Yan 2022-09-16  4685  				 "to feature incompatibilities");
d7f3542b321962 Jason Yan 2022-09-16  4686  			return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4687  		}
d7f3542b321962 Jason Yan 2022-09-16  4688  	}
d7f3542b321962 Jason Yan 2022-09-16  4689  
d7f3542b321962 Jason Yan 2022-09-16  4690  	if (IS_EXT3_SB(sb)) {
d7f3542b321962 Jason Yan 2022-09-16  4691  		if (ext3_feature_set_ok(sb))
d7f3542b321962 Jason Yan 2022-09-16  4692  			ext4_msg(sb, KERN_INFO, "mounting ext3 file system "
d7f3542b321962 Jason Yan 2022-09-16  4693  				 "using the ext4 subsystem");
d7f3542b321962 Jason Yan 2022-09-16  4694  		else {
d7f3542b321962 Jason Yan 2022-09-16  4695  			/*
d7f3542b321962 Jason Yan 2022-09-16  4696  			 * If we're probing be silent, if this looks like
d7f3542b321962 Jason Yan 2022-09-16  4697  			 * it's actually an ext4 filesystem.
d7f3542b321962 Jason Yan 2022-09-16  4698  			 */
d7f3542b321962 Jason Yan 2022-09-16  4699  			if (silent && ext4_feature_set_ok(sb, sb_rdonly(sb)))
d7f3542b321962 Jason Yan 2022-09-16  4700  				return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4701  			ext4_msg(sb, KERN_ERR, "couldn't mount as ext3 due "
d7f3542b321962 Jason Yan 2022-09-16  4702  				 "to feature incompatibilities");
d7f3542b321962 Jason Yan 2022-09-16  4703  			return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4704  		}
d7f3542b321962 Jason Yan 2022-09-16  4705  	}
d7f3542b321962 Jason Yan 2022-09-16  4706  
d7f3542b321962 Jason Yan 2022-09-16  4707  	/*
d7f3542b321962 Jason Yan 2022-09-16  4708  	 * Check feature flags regardless of the revision level, since we
d7f3542b321962 Jason Yan 2022-09-16  4709  	 * previously didn't change the revision level when setting the flags,
d7f3542b321962 Jason Yan 2022-09-16  4710  	 * so there is a chance incompat flags are set on a rev 0 filesystem.
d7f3542b321962 Jason Yan 2022-09-16  4711  	 */
d7f3542b321962 Jason Yan 2022-09-16  4712  	if (!ext4_feature_set_ok(sb, (sb_rdonly(sb))))
d7f3542b321962 Jason Yan 2022-09-16  4713  		return -EINVAL;
d7f3542b321962 Jason Yan 2022-09-16  4714  
54902099b1d8b6 Jason Yan 2023-03-23  4715  	if (sbi->s_daxdev) {
54902099b1d8b6 Jason Yan 2023-03-23  4716  		if (sb->s_blocksize == PAGE_SIZE)
54902099b1d8b6 Jason Yan 2023-03-23  4717  			set_bit(EXT4_FLAGS_BDEV_IS_DAX, &sbi->s_ext4_flags);
54902099b1d8b6 Jason Yan 2023-03-23  4718  		else
54902099b1d8b6 Jason Yan 2023-03-23  4719  			ext4_msg(sb, KERN_ERR, "unsupported blocksize for DAX\n");
54902099b1d8b6 Jason Yan 2023-03-23  4720  	}
54902099b1d8b6 Jason Yan 2023-03-23  4721  
54902099b1d8b6 Jason Yan 2023-03-23 @4722  	if (sbi->s_mount_opt & EXT4_MOUNT_DAX_ALWAYS) {
54902099b1d8b6 Jason Yan 2023-03-23  4723  		if (ext4_has_feature_inline_data(sb)) {
54902099b1d8b6 Jason Yan 2023-03-23  4724  			ext4_msg(sb, KERN_ERR, "Cannot use DAX on a filesystem"
54902099b1d8b6 Jason Yan 2023-03-23  4725  					" that may contain inline data");
54902099b1d8b6 Jason Yan 2023-03-23  4726  			return -EINVAL;
54902099b1d8b6 Jason Yan 2023-03-23  4727  		}
54902099b1d8b6 Jason Yan 2023-03-23  4728  		if (!test_bit(EXT4_FLAGS_BDEV_IS_DAX, &sbi->s_ext4_flags)) {
54902099b1d8b6 Jason Yan 2023-03-23  4729  			ext4_msg(sb, KERN_ERR,
54902099b1d8b6 Jason Yan 2023-03-23  4730  				"DAX unsupported by block device.");
54902099b1d8b6 Jason Yan 2023-03-23  4731  			return -EINVAL;
54902099b1d8b6 Jason Yan 2023-03-23  4732  		}
54902099b1d8b6 Jason Yan 2023-03-23  4733  	}
54902099b1d8b6 Jason Yan 2023-03-23  4734  
54902099b1d8b6 Jason Yan 2023-03-23  4735  	if (ext4_has_feature_encrypt(sb) && es->s_encryption_level) {
54902099b1d8b6 Jason Yan 2023-03-23  4736  		ext4_msg(sb, KERN_ERR, "Unsupported encryption level %d",
54902099b1d8b6 Jason Yan 2023-03-23  4737  			 es->s_encryption_level);
54902099b1d8b6 Jason Yan 2023-03-23  4738  		return -EINVAL;
54902099b1d8b6 Jason Yan 2023-03-23  4739  	}
54902099b1d8b6 Jason Yan 2023-03-23  4740  
d7f3542b321962 Jason Yan 2022-09-16  4741  	return 0;
d7f3542b321962 Jason Yan 2022-09-16  4742  }
d7f3542b321962 Jason Yan 2022-09-16  4743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
