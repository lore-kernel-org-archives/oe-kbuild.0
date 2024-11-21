Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5521C3052
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732188710; cv=none; b=iBLo7K7uHRhQmhcFDiyqMnjrPn4TB52Sm+ICusk+Pq1stuHMfPLxNUSk57R2T6TOkosXY4bTnwozboXCeg5dWB1GFO1g5FbI4GQJJimP8GhO4FIwTWVTtJdcVtiE+bCEXzp8yUjjNBEvBYSUM1N38HSHpKjJoVsHs/r+8LfVVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732188710; c=relaxed/simple;
	bh=TzrKNab33og+ug86AldRll0LIH6o5Ffopphnp/+PbP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyImOCm+Ui7YSGSH581P6/m1F60xdoB+5RID4HjaG4sHx2h7trLCm+cTvwJKMDZhVV3FQGYYrtKVI2+2V8o6d1cqpBfmH+e1hcZZtu+IlFL/NiGl8vrr0G4lrCkCQNQ+cZJKscucmE28m/LdTYSIDg/sGh9c6zPITKAqn87Zy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azrK0LG/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azrK0LG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732188709; x=1763724709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TzrKNab33og+ug86AldRll0LIH6o5Ffopphnp/+PbP4=;
  b=azrK0LG/NDGomvV7H2WsTMdQWXDLHjI+MbzGr9cIMEghxTMv6UrchNbe
   nrKng2IaG0eQ3BwuP5vnVCeELYYA/lzxY9NqntoUc9FzOogE7dpzf5bbg
   2gVdPtSCap1nfbUEdcH8hgmSMy+4arERFuEXO/tzgaO4RABUJGpcPEMe1
   kCznnGz5g12x3TXSb6LIiDI7HclLtt9HsFOHWbiDzOpKnifoAwMaKCzCh
   iU+ekJ5nVi/FipSJeV+zSwm3ds9aKuc5SAnpTL5QVBi9+1N3WE2CaSqsD
   j/x/RScF69xEqYMOUsmnKb1c3sSzh1OC6Jme1Z+2B3+FLsmtTCv3C34tT
   Q==;
X-CSE-ConnectionGUID: SNWyiRZ8TViKx9TMQypz3Q==
X-CSE-MsgGUID: 00tGVzgHRQ2wrRCDMXdYfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32350362"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="32350362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:31:48 -0800
X-CSE-ConnectionGUID: bYE3m7n2TgmX1+IF7iGLRg==
X-CSE-MsgGUID: L8/g8MSOTlukrOlqP3ty0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90209445"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2024 03:31:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE5PU-0002uD-29;
	Thu, 21 Nov 2024 11:31:44 +0000
Date: Thu, 21 Nov 2024 19:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/extents.c:2270 ext4_ext_find_hole() error: uninitialized
 symbol 'len'.
Message-ID: <202411211928.G4jjzgui-lkp@intel.com>
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
TO: Zhang Yi <yi.zhang@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
commit: 6430dea07e85958fa87d0276c0c4388dd51e630b ext4: correct the hole length returned by ext4_map_blocks()
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arc-randconfig-r072-20241121 (https://download.01.org/0day-ci/archive/20241121/202411211928.G4jjzgui-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411211928.G4jjzgui-lkp@intel.com/

New smatch warnings:
fs/ext4/extents.c:2270 ext4_ext_find_hole() error: uninitialized symbol 'len'.

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/len +2270 fs/ext4/extents.c

bb5835edcdf8bf Theodore Ts'o    2019-08-11  2229  
bb5835edcdf8bf Theodore Ts'o    2019-08-11  2230  
a86c61812637c7 Alex Tomas       2006-10-11  2231  /*
6430dea07e8595 Zhang Yi         2024-01-27  2232   * ext4_ext_find_hole - find hole around given block according to the given path
140a52508a6838 Jan Kara         2016-03-09  2233   * @inode:	inode we lookup in
140a52508a6838 Jan Kara         2016-03-09  2234   * @path:	path in extent tree to @lblk
140a52508a6838 Jan Kara         2016-03-09  2235   * @lblk:	pointer to logical block around which we want to determine hole
140a52508a6838 Jan Kara         2016-03-09  2236   *
140a52508a6838 Jan Kara         2016-03-09  2237   * Determine hole length (and start if easily possible) around given logical
140a52508a6838 Jan Kara         2016-03-09  2238   * block. We don't try too hard to find the beginning of the hole but @path
140a52508a6838 Jan Kara         2016-03-09  2239   * actually points to extent before @lblk, we provide it.
140a52508a6838 Jan Kara         2016-03-09  2240   *
140a52508a6838 Jan Kara         2016-03-09  2241   * The function returns the length of a hole starting at @lblk. We update @lblk
140a52508a6838 Jan Kara         2016-03-09  2242   * to the beginning of the hole if we managed to find it.
a86c61812637c7 Alex Tomas       2006-10-11  2243   */
6430dea07e8595 Zhang Yi         2024-01-27  2244  static ext4_lblk_t ext4_ext_find_hole(struct inode *inode,
140a52508a6838 Jan Kara         2016-03-09  2245  				      struct ext4_ext_path *path,
140a52508a6838 Jan Kara         2016-03-09  2246  				      ext4_lblk_t *lblk)
a86c61812637c7 Alex Tomas       2006-10-11  2247  {
a86c61812637c7 Alex Tomas       2006-10-11  2248  	int depth = ext_depth(inode);
a86c61812637c7 Alex Tomas       2006-10-11  2249  	struct ext4_extent *ex;
140a52508a6838 Jan Kara         2016-03-09  2250  	ext4_lblk_t len;
a86c61812637c7 Alex Tomas       2006-10-11  2251  
a86c61812637c7 Alex Tomas       2006-10-11  2252  	ex = path[depth].p_ext;
a86c61812637c7 Alex Tomas       2006-10-11  2253  	if (ex == NULL) {
2f8e0a7c6c89f8 Zheng Liu        2014-11-25  2254  		/* there is no extent yet, so gap is [0;-] */
140a52508a6838 Jan Kara         2016-03-09  2255  		*lblk = 0;
2f8e0a7c6c89f8 Zheng Liu        2014-11-25  2256  		len = EXT_MAX_BLOCKS;
140a52508a6838 Jan Kara         2016-03-09  2257  	} else if (*lblk < le32_to_cpu(ex->ee_block)) {
140a52508a6838 Jan Kara         2016-03-09  2258  		len = le32_to_cpu(ex->ee_block) - *lblk;
140a52508a6838 Jan Kara         2016-03-09  2259  	} else if (*lblk >= le32_to_cpu(ex->ee_block)
a2df2a63407803 Amit Arora       2007-07-17  2260  			+ ext4_ext_get_actual_len(ex)) {
725d26d3f09ccb Aneesh Kumar K.V 2008-01-28  2261  		ext4_lblk_t next;
725d26d3f09ccb Aneesh Kumar K.V 2008-01-28  2262  
140a52508a6838 Jan Kara         2016-03-09  2263  		*lblk = le32_to_cpu(ex->ee_block) + ext4_ext_get_actual_len(ex);
725d26d3f09ccb Aneesh Kumar K.V 2008-01-28  2264  		next = ext4_ext_next_allocated_block(path);
140a52508a6838 Jan Kara         2016-03-09  2265  		BUG_ON(next == *lblk);
140a52508a6838 Jan Kara         2016-03-09  2266  		len = next - *lblk;
a86c61812637c7 Alex Tomas       2006-10-11  2267  	} else {
a86c61812637c7 Alex Tomas       2006-10-11  2268  		BUG();
a86c61812637c7 Alex Tomas       2006-10-11  2269  	}
140a52508a6838 Jan Kara         2016-03-09 @2270  	return len;
140a52508a6838 Jan Kara         2016-03-09  2271  }
140a52508a6838 Jan Kara         2016-03-09  2272  

:::::: The code at line 2270 was first introduced by commit
:::::: 140a52508a68387e22486659ff9eaa89a24f6e40 ext4: factor out determining of hole size

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
