Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608334B68F
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772764548; cv=none; b=da/9uHPTY/hJ/nZDdWaIF0YSIY2uBsLjVSn5fonpOGQfcW4jMwxtZBiIejymetyn47ajlF1/ZRKSVlF8kDUtfNpQ3naj7DC5WlWOKMKK2nt2IlEIezKrl2fN73/zDqsLgUYoKX7gcJurxein/q6MXQgEZpJgE0dhhU8WdPZdhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772764548; c=relaxed/simple;
	bh=YSLETI1bBszrcB7RTDFeTwPf+n1CO+XotM9U76RRqcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jefySUo0KsiOoPc3Mmfqhk74XjL5xo9gNFf6dXHfVZOhKwL+vnjGz4fyozaqkhkd2p6Z9OH5JDL9aLzvNgSw1alU6TNXHF2kfMhUToaIXDzotBdGJP47Bl9Lvc/HY76z9xgMBTM6+mD1gSg26bRebYcHQ7vkBlFwOJNJw9fEibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joHJWKt5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joHJWKt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772764546; x=1804300546;
  h=date:from:to:cc:subject:message-id;
  bh=YSLETI1bBszrcB7RTDFeTwPf+n1CO+XotM9U76RRqcY=;
  b=joHJWKt53bH+1GLO96T85mcLfDJQ3j2y7F2tNyo5io+QTTMyB70qtNpP
   dZ/dxOCxnRLtk/TNHaD4BluEpwVWlzmKfl118cdb1LdMu2Y7TddJ6mruh
   1MXeVqNvqPhN9tkUow0SZL3MLuEcUBAGJMaiGOp0xmd9dd7eJa/++CmVK
   ojTfiAXvOzuxeWuBcmiu7LDEAo0Esy5D3BwB/NaAPGo051QN4XSh6c0wt
   E+hWFMnyXj6LoO1p/8/AV74YNMHRPVZ6oe8Ghm59myQwzrRRvNxh1b78C
   1o8CPLVPaNBfYf23XyvFKOegN7/Zj4q+YNWf8jWxcdCMQ2WvATTbHy23l
   g==;
X-CSE-ConnectionGUID: lguWnlVFSHqGSkP6GYoMTw==
X-CSE-MsgGUID: Hkxnx75dS5WrvqL+NJCZYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84198713"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84198713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:35:46 -0800
X-CSE-ConnectionGUID: wzfgK1mtRPG8O1RJuFg+1A==
X-CSE-MsgGUID: WcHC2USTTv+j3i/3Dt+XNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223008497"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2026 18:35:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyL2T-000000000Dp-0lX7;
	Fri, 06 Mar 2026 02:35:41 +0000
Date: Fri, 06 Mar 2026 10:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/cs-amp-lib.c:534 cs_amp_create_debugfs()
 warn: 'dir' is an error pointer or valid
Message-ID: <202603061059.rrDYtOyJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
commit: cdd27fa3298ad2f39788804f7d09ab31af2b416c ASoC: cs-amp-lib: Add helpers for factory calibration
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r071-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061059.rrDYtOyJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603061059.rrDYtOyJ-lkp@intel.com/

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
