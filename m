Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585E849C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434240; cv=none; b=ibP5byQ/SbTqlBYOZmhmCQiGAk1s3GzFcaSGYFaAhmF5xQ3zzR/3A/9Hf7Bg/yghsbQgLB5xc4tC7xRt+RyubKn2wkIBguugU+8+pMbvr6m9NFX6wpmxmrlPMu6PZTF7Yz3cosSvPeTZeIbQwVkQNZJEwkshV4RrbU7uXXhg+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434240; c=relaxed/simple;
	bh=9CpQtsK/ZcKUJJ2FjwrUN/JEpMLd/havQaB+v5P37Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAYVmdiAOCStqqzLvFsamEWRlxclhjlTEXPoA44RurrHM4LBMHJJ8uotJmdTL0xMRZUjJLExb3hZ7Nkrfs1vq23scn24CIdGNQQ35544+UxqJa6fSx0jddq8E6EzfRAIGM83+5oMsPszp5pkhxkmgAHDO8Q9N3Df7lM0bEGI9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUfXwzVx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUfXwzVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764434238; x=1795970238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9CpQtsK/ZcKUJJ2FjwrUN/JEpMLd/havQaB+v5P37Ho=;
  b=UUfXwzVxUvf/arj30QW5ffIYhQDSWk3pbc3QRDCFIAfzTh+0Q+P3UBCc
   tdSBeyqE4HnG14e7mAylVGhUCIXfyTqFbD50bD+/4Dwy6C7ntframMY88
   EEJ14qmd2Xj5YQ7/6w5jsTJpUON+HG2ZhqHlyR5SraDVDpAY3LduoKqcc
   rM6Ju0iRGN/SNwEczP+6SZkW7Boebsjy/4MQpiEvJ2RKHmdufU4B6sSpm
   jOWMb7Wmr/DWo14zrv1khf1g2redr2baG0RCiWXpTq8Nq944RSyp3nTi0
   VbAtKt1hpwsE6nmf5oaKAs/6+J3bCzCLnN4aT/oAxr0TKL/6galEkZ8sr
   g==;
X-CSE-ConnectionGUID: OZeHh6cJQ/uCC8CsD4f12w==
X-CSE-MsgGUID: Owy8zO4cS4mfL0tDYiqx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="89074541"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="89074541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 08:37:18 -0800
X-CSE-ConnectionGUID: 9Z4an1UeS723dBZ4P8AvNA==
X-CSE-MsgGUID: L6x2ZfmUQ8up5jqDhzuIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="198617093"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Nov 2025 08:37:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPNwg-000000007Mb-3OPq;
	Sat, 29 Nov 2025 16:37:14 +0000
Date: Sun, 30 Nov 2025 00:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [conor:pinctrl 21/25] drivers/pinctrl/pinctrl-mpfs-mssio.c:353:6-14:
 WARNING: Unsigned expression compared with zero: function < 0
Message-ID: <202511300058.NCOUIU43-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   88f8a28f2ada6391ae9be73b9973f921aca27a3b
commit: d1b023c3a5107668f367b2bfec08d721e2b2e7dd [21/25] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-r062-20251129 (https://download.01.org/0day-ci/archive/20251130/202511300058.NCOUIU43-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511300058.NCOUIU43-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:353:6-14: WARNING: Unsigned expression compared with zero: function < 0

vim +353 drivers/pinctrl/pinctrl-mpfs-mssio.c

d1b023c3a51076 Conor Dooley 2025-09-24  327  
d1b023c3a51076 Conor Dooley 2025-09-24  328  static int mpfs_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel,
d1b023c3a51076 Conor Dooley 2025-09-24  329  				unsigned int gsel)
d1b023c3a51076 Conor Dooley 2025-09-24  330  {
d1b023c3a51076 Conor Dooley 2025-09-24  331  	struct mpfs_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
d1b023c3a51076 Conor Dooley 2025-09-24  332  	const struct group_desc *group;
d1b023c3a51076 Conor Dooley 2025-09-24  333  	const char **functions;
d1b023c3a51076 Conor Dooley 2025-09-24  334  
d1b023c3a51076 Conor Dooley 2025-09-24  335  	group = pinctrl_generic_get_group(pctrl_dev, gsel);
d1b023c3a51076 Conor Dooley 2025-09-24  336  	if (!group)
d1b023c3a51076 Conor Dooley 2025-09-24  337  		return -EINVAL;
d1b023c3a51076 Conor Dooley 2025-09-24  338  
d1b023c3a51076 Conor Dooley 2025-09-24  339  	functions = group->data;
d1b023c3a51076 Conor Dooley 2025-09-24  340  
d1b023c3a51076 Conor Dooley 2025-09-24  341  	for (int i = 0; i < group->grp.npins; i++) {
d1b023c3a51076 Conor Dooley 2025-09-24  342  		u32 function;
d1b023c3a51076 Conor Dooley 2025-09-24  343  
d1b023c3a51076 Conor Dooley 2025-09-24  344  		//TODO @Linus my new function being actually generic means that
d1b023c3a51076 Conor Dooley 2025-09-24  345  		// the mapping of function string to something the hardware
d1b023c3a51076 Conor Dooley 2025-09-24  346  		// understands only happens at this point.
d1b023c3a51076 Conor Dooley 2025-09-24  347  		// I think this is fine, because dt validation would whinge
d1b023c3a51076 Conor Dooley 2025-09-24  348  		// about something invalid, but it's the "catch" with my approach.
d1b023c3a51076 Conor Dooley 2025-09-24  349  		// The other option I considered was to provide a mapping
d1b023c3a51076 Conor Dooley 2025-09-24  350  		// function pointer that the driver can populate, but I think
d1b023c3a51076 Conor Dooley 2025-09-24  351  		// that's overkill.
d1b023c3a51076 Conor Dooley 2025-09-24  352  		function = mpfs_pinctrl_function_map(functions[i]);
d1b023c3a51076 Conor Dooley 2025-09-24 @353  		if (function < 0) {
d1b023c3a51076 Conor Dooley 2025-09-24  354  			dev_err(pctrl->dev, "invalid function %s\n", functions[i]);
d1b023c3a51076 Conor Dooley 2025-09-24  355  			return function;
d1b023c3a51076 Conor Dooley 2025-09-24  356  		}
d1b023c3a51076 Conor Dooley 2025-09-24  357  
d1b023c3a51076 Conor Dooley 2025-09-24  358  		mpfs_pinctrl_set_pin_func(pctrl, group->grp.pins[i], function);
d1b023c3a51076 Conor Dooley 2025-09-24  359  	}
d1b023c3a51076 Conor Dooley 2025-09-24  360  
d1b023c3a51076 Conor Dooley 2025-09-24  361  	return 0;
d1b023c3a51076 Conor Dooley 2025-09-24  362  }
d1b023c3a51076 Conor Dooley 2025-09-24  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
