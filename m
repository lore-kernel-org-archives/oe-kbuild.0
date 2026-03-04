Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C53A453A
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633696; cv=none; b=TAXwGOVkCDCNuGDcvIPNbWRC5B7FVQFC4g3Tvq15gaelU+kJsc5PnQ17CT3408PsGJGj2c6POZQDc7y+QjN0uV96uPuyzEhxbhTHr0tcBvuigK13vPcuYO5qAN5bfZEQLicX/Q/FvmKxynKIapWRpI1PsnyU53AFDeU1cM0gsuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633696; c=relaxed/simple;
	bh=6RqdBaDlPI5PZm7mGbYuC0JwpVR/GnLWt1pFZkgNHGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a9Xg8pgSECHzsIh9/5poa9my2Kmob5DQUAM4AXQriix4c2SFHr/ddiiGLjeCoevU2PaTmm+Iq/PG6c2bZREmG1HJh8WztajeXRtpyj37Tt29bNFTcAXHR0gKLqrduMHUQZR2zkllqT+OX9zXcZHu4Z2r0DUaywcwYPNyAVHfMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCX27rEc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCX27rEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772633694; x=1804169694;
  h=date:from:to:cc:subject:message-id;
  bh=6RqdBaDlPI5PZm7mGbYuC0JwpVR/GnLWt1pFZkgNHGg=;
  b=YCX27rEcSAPUCzeQnlxkAHPeD0Ynx5Rvv09mMfUuHu7CpMeMgvP+HwVM
   hdLNdNUlpvm7VnHmmGf5f+4Wj7eZY5LJyONcGsP6kT8rWZ8rz8DskLJxx
   4R4csFJfuokoCweS4u7vzYxxvx5dnFiVbTkOMoIarndTenmizCpWldnku
   c70OsXl0KvhXX2nT9PkYvx3uAVHCEpHIBLf7wP6u5+hzPTiFmP5+pW5CT
   KZLpnqROtYtuwWMTd6j1u/xQwbR7fDle8lJDf8S4muAhIXf6SCPCqgjD8
   6j0uPGwlpCkeWrcWJXFRVBGBWf3ObaEcuGq7+t1wcCByzNt6LDpnL+qgP
   A==;
X-CSE-ConnectionGUID: iWK38NerSgiNE1TG5/WPcw==
X-CSE-MsgGUID: 0RzMc2doTj60uK4kHNCeOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73391404"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73391404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:14:54 -0800
X-CSE-ConnectionGUID: 52yene8mShC8f95A3/CLtA==
X-CSE-MsgGUID: o42DxcL1TL65pdu8y8fwAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="245005888"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 06:14:52 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmzy-000000003oh-06qr;
	Wed, 04 Mar 2026 14:14:50 +0000
Date: Wed, 04 Mar 2026 22:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/btrfs/raid56.c:1154 get_rbio_vertical_errors() error: we
 previously assumed 'faila' could be null (see line 1148)
Message-ID: <202603042249.M8gyAc0e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
commit: 9ba67fd616d6cfbf8b90c336195819e7494645bb btrfs: raid56: prepare recover_vertical() to support bs > ps cases
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: sparc64-randconfig-r073-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042249.M8gyAc0e-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603042249.M8gyAc0e-lkp@intel.com/

smatch warnings:
fs/btrfs/raid56.c:1154 get_rbio_vertical_errors() error: we previously assumed 'faila' could be null (see line 1148)

vim +/faila +1154 fs/btrfs/raid56.c

53b381b3abeb86f David Woodhouse 2013-01-29  1135  
75b47033296595e Qu Wenruo       2022-11-07  1136  /*
67da05b3f28166b Colin Ian King  2023-01-17  1137   * Return the total number of errors found in the vertical stripe of @sector_nr.
75b47033296595e Qu Wenruo       2022-11-07  1138   *
75b47033296595e Qu Wenruo       2022-11-07  1139   * @faila and @failb will also be updated to the first and second stripe
75b47033296595e Qu Wenruo       2022-11-07  1140   * number of the errors.
75b47033296595e Qu Wenruo       2022-11-07  1141   */
9ba67fd616d6cfb Qu Wenruo       2025-11-14  1142  static int get_rbio_vertical_errors(struct btrfs_raid_bio *rbio, int sector_nr,
75b47033296595e Qu Wenruo       2022-11-07  1143  				    int *faila, int *failb)
75b47033296595e Qu Wenruo       2022-11-07  1144  {
75b47033296595e Qu Wenruo       2022-11-07  1145  	int stripe_nr;
75b47033296595e Qu Wenruo       2022-11-07  1146  	int found_errors = 0;
75b47033296595e Qu Wenruo       2022-11-07  1147  
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07 @1148  	if (faila || failb) {
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1149  		/*
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1150  		 * Both @faila and @failb should be valid pointers if any of
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1151  		 * them is specified.
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1152  		 */
75b47033296595e Qu Wenruo       2022-11-07  1153  		ASSERT(faila && failb);
75b47033296595e Qu Wenruo       2022-11-07 @1154  		*faila = -1;
75b47033296595e Qu Wenruo       2022-11-07  1155  		*failb = -1;
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1156  	}
75b47033296595e Qu Wenruo       2022-11-07  1157  
75b47033296595e Qu Wenruo       2022-11-07  1158  	for (stripe_nr = 0; stripe_nr < rbio->real_stripes; stripe_nr++) {
75b47033296595e Qu Wenruo       2022-11-07  1159  		int total_sector_nr = stripe_nr * rbio->stripe_nsectors + sector_nr;
75b47033296595e Qu Wenruo       2022-11-07  1160  
75b47033296595e Qu Wenruo       2022-11-07  1161  		if (test_bit(total_sector_nr, rbio->error_bitmap)) {
75b47033296595e Qu Wenruo       2022-11-07  1162  			found_errors++;
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1163  			if (faila) {
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1164  				/* Update faila and failb. */
75b47033296595e Qu Wenruo       2022-11-07  1165  				if (*faila < 0)
75b47033296595e Qu Wenruo       2022-11-07  1166  					*faila = stripe_nr;
75b47033296595e Qu Wenruo       2022-11-07  1167  				else if (*failb < 0)
75b47033296595e Qu Wenruo       2022-11-07  1168  					*failb = stripe_nr;
75b47033296595e Qu Wenruo       2022-11-07  1169  			}
75b47033296595e Qu Wenruo       2022-11-07  1170  		}
ad3daf1c3f5bcbb Qu Wenruo       2022-11-07  1171  	}
75b47033296595e Qu Wenruo       2022-11-07  1172  	return found_errors;
75b47033296595e Qu Wenruo       2022-11-07  1173  }
75b47033296595e Qu Wenruo       2022-11-07  1174  

:::::: The code at line 1154 was first introduced by commit
:::::: 75b47033296595efb208cc563cbb8cf4fb7c3ebc btrfs: raid56: migrate recovery and scrub recovery path to use error_bitmap

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
