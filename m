Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409B1E4AF
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 05:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774156081; cv=none; b=hzMVe+Jh1N0YY/8URnm7xCpV/KfLGjCMi+0Y56uQAHhzr8RMo7dqThtgmlse2xI4JSMTzxKu2JFSBYq4ubT09bnyLe+M2nN2QqLHF+quMqCFAEuV7yYyl9OzRoMyQ8jSg1Vv084n7gbhkFtVXj0O0RAZEXZnvILpGprkjoKuEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774156081; c=relaxed/simple;
	bh=ZtWAEDLfA3mMVoHi7sw/SgvqjWb1HOnQq0PlmsksA6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WkPjHkul6UeAb/W1j1Y3vOqcJB2EPVZZWNu2cN1Xihm1sub/+Sx8QKOTOfJICOlIwDKuSuz+T80R3DB2rgngesmTdD84FIbiH9TE1Dq1ZfHVThDMsJ0Uk3vpqVVmgqHG68PHd63ynGOPpdS9d4d+5x83srPNK1wTvjunATTmbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ezdupisq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ezdupisq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774156080; x=1805692080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZtWAEDLfA3mMVoHi7sw/SgvqjWb1HOnQq0PlmsksA6o=;
  b=EzdupisqLwX89Vsn8Ov+E3MV0cmaseWRsRLt6Jv2XEyOeQfQki5QEa1j
   Uu67Fl/AQCJxnzQor3JT7UYu9FHEDf+nWmAQ1QMQY5vDDU46qUoHZ97b1
   3FdwdTuvXlQzqZeebI0bkjqxrb6rIQ+PcZFzD6ea0ImZThWybr0+dHyJF
   RQYpTanGHW8+m0b3C3usMEHrVeP5TkdSAdlRScrH+4Pvzy8A9LNv4AU4y
   K4KwDeg9scQO1r8rxBbK16+60B9EuNBRqu4eDrmRyi6JwqY26iGBhXsxY
   +bHqreBhQg2IwVQqoNr97VgIAnVjNInFwLy5PhDGm/EX18aESIQOjVOYy
   A==;
X-CSE-ConnectionGUID: 6gBB/u4wSPiu97D090TeQw==
X-CSE-MsgGUID: fk4V1D9OTLuCK0L8CFrwFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75098175"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75098175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 22:07:59 -0700
X-CSE-ConnectionGUID: aD+4ixk8TPm2V2JHakF5Lw==
X-CSE-MsgGUID: SsPcMd2RT0GvcVohfHLXyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="220508302"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2026 22:07:58 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4B2Z-000000001in-0tYc;
	Sun, 22 Mar 2026 05:07:55 +0000
Date: Sun, 22 Mar 2026 13:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v0 1/1] exfat: add limited FALLOC_FL_ZERO_RANGE support
Message-ID: <202603221252.dVVrrOrL-lkp@intel.com>
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
In-Reply-To: <20260319043553.301185-2-dxdt@dev.snart.me>
References: <20260319043553.301185-2-dxdt@dev.snart.me>
TO: David Timber <dxdt@dev.snart.me>
TO: linkinjeon@kernel.org
TO: sj1557.seo@samsung.com
CC: yuezhang.mo@sony.com
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: David Timber <dxdt@dev.snart.me>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260318]
[cannot apply to brauner-vfs/vfs.all v7.0-rc4 v7.0-rc3 v7.0-rc2 linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Timber/exfat-add-limited-FALLOC_FL_ZERO_RANGE-support/20260319-185700
base:   next-20260318
patch link:    https://lore.kernel.org/r/20260319043553.301185-2-dxdt%40dev.snart.me
patch subject: [PATCH v0 1/1] exfat: add limited FALLOC_FL_ZERO_RANGE support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221252.dVVrrOrL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603221252.dVVrrOrL-lkp@intel.com/

smatch warnings:
fs/exfat/file.c:183 exfat_fallocate() warn: inconsistent returns '&inode->i_rwsem'.

vim +183 fs/exfat/file.c

98d917047e8b7f4 Namjae Jeon  2020-03-02   94  
bf1797960c20f3d David Timber 2026-02-28   95  /*
bf1797960c20f3d David Timber 2026-02-28   96   * Preallocate space for a file. This implements exfat's fallocate file
bf1797960c20f3d David Timber 2026-02-28   97   * operation, which gets called from sys_fallocate system call. User space
1178dacb657facf David Timber 2026-03-19   98   * requests len bytes at offset.
1178dacb657facf David Timber 2026-03-19   99   *
1178dacb657facf David Timber 2026-03-19  100   * In contrary to fat, FALLOC_FL_ALLOCATE_RANGE can be done without zeroing out
1178dacb657facf David Timber 2026-03-19  101   * the newly allocated clusters by leaving the valid data length(VDL) field
1178dacb657facf David Timber 2026-03-19  102   * unchanged.
1178dacb657facf David Timber 2026-03-19  103   *
1178dacb657facf David Timber 2026-03-19  104   * Due to the inherent limitation of the VDL scheme, FALLOC_FL_ZERO_RANGE is
1178dacb657facf David Timber 2026-03-19  105   * only possible when the requested range covers EOF.
bf1797960c20f3d David Timber 2026-02-28  106   */
bf1797960c20f3d David Timber 2026-02-28  107  static long exfat_fallocate(struct file *file, int mode,
bf1797960c20f3d David Timber 2026-02-28  108  			  loff_t offset, loff_t len)
bf1797960c20f3d David Timber 2026-02-28  109  {
bf1797960c20f3d David Timber 2026-02-28  110  	struct inode *inode = file->f_mapping->host;
1178dacb657facf David Timber 2026-03-19  111  	loff_t newsize, isize;
bf1797960c20f3d David Timber 2026-02-28  112  	int err = 0;
bf1797960c20f3d David Timber 2026-02-28  113  
bf1797960c20f3d David Timber 2026-02-28  114  	/* No support for other modes */
1178dacb657facf David Timber 2026-03-19  115  	switch (mode) {
1178dacb657facf David Timber 2026-03-19  116  	case FALLOC_FL_ALLOCATE_RANGE:
1178dacb657facf David Timber 2026-03-19  117  	case FALLOC_FL_ZERO_RANGE:
1178dacb657facf David Timber 2026-03-19  118  	case FALLOC_FL_ZERO_RANGE|FALLOC_FL_KEEP_SIZE:
1178dacb657facf David Timber 2026-03-19  119  		break;
1178dacb657facf David Timber 2026-03-19  120  	default:
bf1797960c20f3d David Timber 2026-02-28  121  		return -EOPNOTSUPP;
1178dacb657facf David Timber 2026-03-19  122  	}
bf1797960c20f3d David Timber 2026-02-28  123  
bf1797960c20f3d David Timber 2026-02-28  124  	/* No support for dir */
bf1797960c20f3d David Timber 2026-02-28  125  	if (!S_ISREG(inode->i_mode))
1178dacb657facf David Timber 2026-03-19  126  		return mode & FALLOC_FL_ZERO_RANGE ? -EINVAL : -EOPNOTSUPP;
bf1797960c20f3d David Timber 2026-02-28  127  
bf1797960c20f3d David Timber 2026-02-28  128  	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
bf1797960c20f3d David Timber 2026-02-28  129  		return -EIO;
bf1797960c20f3d David Timber 2026-02-28  130  
bf1797960c20f3d David Timber 2026-02-28  131  	inode_lock(inode);
bf1797960c20f3d David Timber 2026-02-28  132  
1178dacb657facf David Timber 2026-03-19  133  	newsize = offset + len;
1178dacb657facf David Timber 2026-03-19  134  	isize = i_size_read(inode);
1178dacb657facf David Timber 2026-03-19  135  
1178dacb657facf David Timber 2026-03-19  136  	if (mode & FALLOC_FL_ZERO_RANGE) {
1178dacb657facf David Timber 2026-03-19  137  		struct exfat_inode_info *ei = EXFAT_I(inode);
1178dacb657facf David Timber 2026-03-19  138  		loff_t saved_validsize = ei->valid_size;
1178dacb657facf David Timber 2026-03-19  139  
1178dacb657facf David Timber 2026-03-19  140  		/* The requested range must span to or past EOF */
1178dacb657facf David Timber 2026-03-19  141  		if (newsize < isize) {
1178dacb657facf David Timber 2026-03-19  142  			err = -EOPNOTSUPP;
1178dacb657facf David Timber 2026-03-19  143  			goto error;
1178dacb657facf David Timber 2026-03-19  144  		}
1178dacb657facf David Timber 2026-03-19  145  
1178dacb657facf David Timber 2026-03-19  146  		/* valid_size can only be truncated */
1178dacb657facf David Timber 2026-03-19  147  		if (offset < ei->valid_size)
1178dacb657facf David Timber 2026-03-19  148  			ei->valid_size = offset;
1178dacb657facf David Timber 2026-03-19  149  		/* If offset >= ei->valid_size, the range is already zeroed so that'd be no-op */
1178dacb657facf David Timber 2026-03-19  150  
1178dacb657facf David Timber 2026-03-19  151  		if (!(mode & FALLOC_FL_KEEP_SIZE) && isize < newsize) {
1178dacb657facf David Timber 2026-03-19  152  			err = exfat_cont_expand(inode, newsize);
1178dacb657facf David Timber 2026-03-19  153  			if (err) {
1178dacb657facf David Timber 2026-03-19  154  				/* inode unchanged - revert valid_size */
1178dacb657facf David Timber 2026-03-19  155  				ei->valid_size = saved_validsize;
1178dacb657facf David Timber 2026-03-19  156  				goto error;
1178dacb657facf David Timber 2026-03-19  157  			}
1178dacb657facf David Timber 2026-03-19  158  			/* inode invalidated in exfat_cont_expand() */
1178dacb657facf David Timber 2026-03-19  159  		} else {
1178dacb657facf David Timber 2026-03-19  160  			/* update inode */
1178dacb657facf David Timber 2026-03-19  161  			inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
1178dacb657facf David Timber 2026-03-19  162  
1178dacb657facf David Timber 2026-03-19  163  			mark_inode_dirty(inode);
1178dacb657facf David Timber 2026-03-19  164  
1178dacb657facf David Timber 2026-03-19  165  			if (IS_SYNC(inode))
1178dacb657facf David Timber 2026-03-19  166  				return write_inode_now(inode, 1);
1178dacb657facf David Timber 2026-03-19  167  		}
1178dacb657facf David Timber 2026-03-19  168  
1178dacb657facf David Timber 2026-03-19  169  		/* drop cache after the new valid_size */
1178dacb657facf David Timber 2026-03-19  170  		if (ei->valid_size != saved_validsize)
1178dacb657facf David Timber 2026-03-19  171  			truncate_pagecache(inode, ei->valid_size);
1178dacb657facf David Timber 2026-03-19  172  	} else { /* mode == FALLOC_FL_ALLOCATE_RANGE */
1178dacb657facf David Timber 2026-03-19  173  		if (newsize <= isize)
bf1797960c20f3d David Timber 2026-02-28  174  			goto error;
bf1797960c20f3d David Timber 2026-02-28  175  
bf1797960c20f3d David Timber 2026-02-28  176  		/* This is just an expanding truncate */
bf1797960c20f3d David Timber 2026-02-28  177  		err = exfat_cont_expand(inode, newsize);
1178dacb657facf David Timber 2026-03-19  178  	}
bf1797960c20f3d David Timber 2026-02-28  179  
bf1797960c20f3d David Timber 2026-02-28  180  error:
bf1797960c20f3d David Timber 2026-02-28  181  	inode_unlock(inode);
bf1797960c20f3d David Timber 2026-02-28  182  
bf1797960c20f3d David Timber 2026-02-28 @183  	return err;
bf1797960c20f3d David Timber 2026-02-28  184  }
bf1797960c20f3d David Timber 2026-02-28  185  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
