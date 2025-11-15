Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48824A21
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 00:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763167919; cv=none; b=PltdwMof/9AYXxpT/yCuJgEna7O/wo6q9S53eC4nXMFaN5FGTY0V7v9ylLc1y/a5oTCFd0+MzC6WgwP7EIV0vG/2IhH0SgI3F+6D9jheF0k6QNe5AFnxxY9dGCcjFhvSufVjdFjOJ6k6LiomotRbYCbUr4JEH2E3WjljleyqzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763167919; c=relaxed/simple;
	bh=EdWwjIbYcpLaqk9fA49GZPvRnQXcKlZjm+/yE7pVYJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MPQr4AsHlI4cjWpvaRrcJa3Lj17CAA8RZoCtVqpcye7o9FA7cQn2vEqFpIqja8bZLznnMbzymEojQqp39b1R1nKbAqMB3U4u9TwBbfEcJFTLwxehOHEN+sj2G5MTTnelOjaMkR46/pnQAdMPJe0ScNbENzNDsigNAPv1DZaJLVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=at1WRwpt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="at1WRwpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763167918; x=1794703918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdWwjIbYcpLaqk9fA49GZPvRnQXcKlZjm+/yE7pVYJ8=;
  b=at1WRwptQreeSPe2ICSQNrUBqgtZzq9F7RYwEfhV0fL5SvAddjTROH/X
   7f5H1TqoLma4mivmd8zwaZ7IyHXLZkTmSNiPiBWF4H1k6l+mL1rCV8QvY
   dapyEBmdFpsGNhCIabexGfCE1nQhqCYlGQqYRSc/9Fny73h9P76UMd37j
   sgZnBUvpM1mTBaFhpvlE0zW9YW6nMfkE8XioHcyONzgpzdkgzGBl7RlTK
   8Cq9Uo8OSv6d9L+zYh1Yzu2hN8FM7YA9J3qkR2dXJUv2h2lIDbieeWNMA
   0FgC0bfret++TT/39LsgPIokZSyvlV1GZjXHloc001uZTMr3sSC6d3amz
   g==;
X-CSE-ConnectionGUID: n7M9PGHbTOy50JTKkBxB3A==
X-CSE-MsgGUID: pvAmeh64T2Gsgm9qvbFURQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76730936"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="76730936"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 16:51:58 -0800
X-CSE-ConnectionGUID: N3jv+hs0R4qn2S9B2t4PpQ==
X-CSE-MsgGUID: wQgscU5wQb+AAAcY+csnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="227249104"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2025 16:51:56 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK4WA-0007YL-0m;
	Sat, 15 Nov 2025 00:51:54 +0000
Date: Sat, 15 Nov 2025 08:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3458/8918] sound/soc/codecs/cs-amp-lib.c:534
 cs_amp_create_debugfs() warn: 'dir' is an error pointer or valid
Message-ID: <202511150837.pTOmpYet-lkp@intel.com>
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
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f2995693867bfb26197b117cd55624ddc57582f
commit: cdd27fa3298ad2f39788804f7d09ab31af2b416c [3458/8918] ASoC: cs-amp-lib: Add helpers for factory calibration
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: um-randconfig-r073-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150837.pTOmpYet-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511150837.pTOmpYet-lkp@intel.com/

smatch warnings:
sound/soc/codecs/cs-amp-lib.c:534 cs_amp_create_debugfs() warn: 'dir' is an error pointer or valid

vim +/dir +534 sound/soc/codecs/cs-amp-lib.c

267b9cdee522d0 Richard Fitzgerald 2025-09-09  515  
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  516  /**
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  517   * cs_amp_create_debugfs - create a debugfs directory for a device
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  518   *
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  519   * @dev: pointer to struct device
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  520   *
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  521   * Creates a node under "cirrus_logic" in the root of the debugfs filesystem.
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  522   * This is for Cirrus-specific debugfs functionality to be grouped in a
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  523   * defined way, independently of the debugfs provided by ALSA/ASoC.
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  524   * The general ALSA/ASoC debugfs may not be enabled, and does not necessarily
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  525   * have a stable layout or naming convention.
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  526   *
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  527   * Return: Pointer to the dentry for the created directory, or -ENODEV.
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  528   */
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  529  struct dentry *cs_amp_create_debugfs(struct device *dev)
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  530  {
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  531  	struct dentry *dir;
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  532  
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  533  	dir = debugfs_lookup("cirrus_logic", NULL);
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21 @534  	if (!dir)
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  535  		dir = debugfs_create_dir("cirrus_logic", NULL);
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  536  
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  537  	return debugfs_create_dir(dev_name(dev), dir);
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  538  }
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  539  EXPORT_SYMBOL_NS_GPL(cs_amp_create_debugfs, "SND_SOC_CS_AMP_LIB");
cdd27fa3298ad2 Richard Fitzgerald 2025-10-21  540  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
