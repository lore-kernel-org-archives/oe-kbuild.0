Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6F01D14F8
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733070871; cv=none; b=Vg1rINgfM+/9bSD0Jta7MSCHiKwlwKCnGt9dK5o1UPpvshT5kZSh5u47BaxFkV7FAoyDByx7f/k5NzjrqaJ3JsRGaaIKMVOLNH6uHy3zvVHpOxYOIxwXrLWB5BXFYhNEofJp6RHJLhBzPJ2liZc+L2vqwZtZEulnfNuRZiBqYh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733070871; c=relaxed/simple;
	bh=Spguxy3N2kVMvOmfawWq7+8Dxd3DykU81tRGJ85hv4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H20Hd93Mnm9k0DgRXkuhHhfm9VGzTIRs7o1itQWNrFBComoHBscFE4Dl/UCSPksmNiIeZHWIfHkQaORLwpd/7i09T40WFYALvNqrc1vpJji4WWu382MXdDY8E+B/GsXE5g2uHhqbL2Ho2HOJHssMtG/38aQfOTHgfhUQ83lkZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4LBIYPG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4LBIYPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733070869; x=1764606869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Spguxy3N2kVMvOmfawWq7+8Dxd3DykU81tRGJ85hv4Y=;
  b=G4LBIYPG2EP1v4f16hsvPv5zzLBsAogAI6MVRRiasYQETATqCUkAX7F0
   S3p8aLRtP0Qxe8sVDugr8XwHAdGV6yL6iTYvZb887xK4f+d5mkjarDgJW
   d2J0MUZwrRKF4deKAbu4a91gvYtabXlQCiNayVerMRlwZQCwZeqI0Lp4L
   EluZVyfZt9LTqJJlbUr73gJfUoY+MJixmhFy+FtSoUqB3DvNCG09wSI4J
   DG1oBPs+2rZth9mDkbMpZWAPeKkEdbzFhIOquIxggs+w5sl21fq8Ge6KO
   71qzB3LU9zSpE9zPwk7v6R6AXalzdkXkJjLo/KRJ74SNKa75mZlFSDj+b
   g==;
X-CSE-ConnectionGUID: LwQejF1hQlOqgnStm7XJLA==
X-CSE-MsgGUID: +7pAcG7URgOgzsSMqn+Imw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44619795"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="44619795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 08:34:26 -0800
X-CSE-ConnectionGUID: ozn2hSXOT9qbVHkW7vPO+A==
X-CSE-MsgGUID: /z7alpQLQoW/d0i+VVbHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92808981"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 08:34:26 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHmtq-0001g9-2k;
	Sun, 01 Dec 2024 16:34:22 +0000
Date: Mon, 2 Dec 2024 00:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/cirrus/cs_dsp.c:480:6-18: opportunity for
 str_enabled_disabled(ctl -> enabled)
Message-ID: <202412020003.ac5pjcVQ-lkp@intel.com>
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
TO: Simon Trimmer <simont@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 7a3f924cee4bdfe85eda4e636213e79d3fda6182 firmware: cs_dsp: Add a debugfs entry containing control details
date:   1 year, 8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 8 months ago
config: arc-randconfig-r052-20241117 (https://download.01.org/0day-ci/archive/20241202/202412020003.ac5pjcVQ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412020003.ac5pjcVQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/cirrus/cs_dsp.c:480:6-18: opportunity for str_enabled_disabled(ctl -> enabled)

vim +480 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c3 Simon Trimmer 2021-09-13  460  
7a3f924cee4bdf Simon Trimmer 2023-03-28  461  static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg,
7a3f924cee4bdf Simon Trimmer 2023-03-28  462  				 unsigned int off);
7a3f924cee4bdf Simon Trimmer 2023-03-28  463  
7a3f924cee4bdf Simon Trimmer 2023-03-28  464  static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
7a3f924cee4bdf Simon Trimmer 2023-03-28  465  {
7a3f924cee4bdf Simon Trimmer 2023-03-28  466  	struct cs_dsp *dsp = s->private;
7a3f924cee4bdf Simon Trimmer 2023-03-28  467  	struct cs_dsp_coeff_ctl *ctl;
7a3f924cee4bdf Simon Trimmer 2023-03-28  468  	unsigned int reg;
7a3f924cee4bdf Simon Trimmer 2023-03-28  469  
7a3f924cee4bdf Simon Trimmer 2023-03-28  470  	list_for_each_entry(ctl, &dsp->ctl_list, list) {
7a3f924cee4bdf Simon Trimmer 2023-03-28  471  		cs_dsp_coeff_base_reg(ctl, &reg, 0);
7a3f924cee4bdf Simon Trimmer 2023-03-28  472  		seq_printf(s, "%22.*s: %#8zx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
7a3f924cee4bdf Simon Trimmer 2023-03-28  473  			   ctl->subname_len, ctl->subname, ctl->len,
7a3f924cee4bdf Simon Trimmer 2023-03-28  474  			   cs_dsp_mem_region_name(ctl->alg_region.type),
7a3f924cee4bdf Simon Trimmer 2023-03-28  475  			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
7a3f924cee4bdf Simon Trimmer 2023-03-28  476  			   ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
7a3f924cee4bdf Simon Trimmer 2023-03-28  477  			   ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
7a3f924cee4bdf Simon Trimmer 2023-03-28  478  			   ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
7a3f924cee4bdf Simon Trimmer 2023-03-28  479  			   ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
7a3f924cee4bdf Simon Trimmer 2023-03-28 @480  			   ctl->enabled ? "enabled" : "disabled",
7a3f924cee4bdf Simon Trimmer 2023-03-28  481  			   ctl->set ? "dirty" : "clean");
7a3f924cee4bdf Simon Trimmer 2023-03-28  482  	}
7a3f924cee4bdf Simon Trimmer 2023-03-28  483  
7a3f924cee4bdf Simon Trimmer 2023-03-28  484  	return 0;
7a3f924cee4bdf Simon Trimmer 2023-03-28  485  }
7a3f924cee4bdf Simon Trimmer 2023-03-28  486  DEFINE_SHOW_ATTRIBUTE(cs_dsp_debugfs_read_controls);
7a3f924cee4bdf Simon Trimmer 2023-03-28  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
