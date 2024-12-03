Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51806F2FE
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202101; cv=none; b=EYhknwO2JD5bqVaTZDCAp165Hkh+6EPFQSo1p7dzZ12cGkaK5KoE6KckJaqGJny/P9fJJagzTwLIOgLk1vaABRo0P1YR2atre2wWaoJ7mC6c3PIBTXgB9szj+DnyxijrptOBCQcGuDyVlo+BXwSNLPdEpm/pY4kPFm7EeKpACDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202101; c=relaxed/simple;
	bh=grocGKBadiSa7gYcTg6ocNqCu7l0Sw6qC69yVppl+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hkfXdpt/ZfXcSuceorfmhj7QuzFW29Fq99J4XT92U2as476NNwMixNv/fbYu2JIY7nrvz8SCMlsONBoyPG9tC4LfqKvkPmShqiNa2qsPNL/8ZZvTh3hDNzav08KvVrxF/4Z08Ykc0UODIQ7+Zg0E9dVsU0O8ggYf7i3oXzQPamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCzbjNIZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCzbjNIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733202099; x=1764738099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grocGKBadiSa7gYcTg6ocNqCu7l0Sw6qC69yVppl+p8=;
  b=CCzbjNIZFjmH9RCqY2ivg7dxAohZQqGXms0KVvENqC+x+reY0c8BZYub
   6nP5kg0vUEAgwXxKf2jlreX1QW3Acbgpt2w73xKNMk7ERLhUgqbUteCo0
   S5oLVEDoRSqZESSt2nvQTGBW+GfPpi7Q1Pau6XelvOx2yLpxYLGBtRYmx
   xp7wysFzUe6i0omgIIsHJdQo2CkxsbSOWmz0sIV21ate2JdKcJhoFs8A0
   lFeTuxjvyi8he9HeRL+zfDTBsUfuHXJjzjUKVsccRHAc2nw6m5ByL75os
   taeK0AsmNWIuNZmuwDfvcLkuhRmdh8s7u36LZgbPq5lUFn/WPn/81jQrE
   w==;
X-CSE-ConnectionGUID: PvPuBx4HTpq05w9N2aNr+w==
X-CSE-MsgGUID: YSn4NihHT3axdJfVeD9Q8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44011857"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44011857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 21:01:37 -0800
X-CSE-ConnectionGUID: jIUSg8GQSVCNxrbxy11zJw==
X-CSE-MsgGUID: rP/v0cleTeeaRj0KTdBbNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93210163"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2024 21:01:35 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIL2T-00008R-1i;
	Tue, 03 Dec 2024 05:01:33 +0000
Date: Tue, 3 Dec 2024 13:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/cirrus/cs_dsp.c:486:6-18: opportunity for
 str_enabled_disabled(ctl -> enabled)
Message-ID: <202412031258.TH91OMZC-lkp@intel.com>
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
TO: James Ogletree <jogletre@opensource.cirrus.com>
CC: Lee Jones <lee@kernel.org>
CC: Jeff LaBundy <jeff@labundy.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: cb626376cbd00cd69329371519a8e9568baef715 mfd: cs40l50: Add support for CS40L50 core driver
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r054-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031258.TH91OMZC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412031258.TH91OMZC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/cirrus/cs_dsp.c:486:6-18: opportunity for str_enabled_disabled(ctl -> enabled)

vim +486 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c30 Simon Trimmer 2021-09-13  466  
7a3f924cee4bdfe Simon Trimmer 2023-03-28  467  static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg,
7a3f924cee4bdfe Simon Trimmer 2023-03-28  468  				 unsigned int off);
7a3f924cee4bdfe Simon Trimmer 2023-03-28  469  
7a3f924cee4bdfe Simon Trimmer 2023-03-28  470  static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
7a3f924cee4bdfe Simon Trimmer 2023-03-28  471  {
7a3f924cee4bdfe Simon Trimmer 2023-03-28  472  	struct cs_dsp *dsp = s->private;
7a3f924cee4bdfe Simon Trimmer 2023-03-28  473  	struct cs_dsp_coeff_ctl *ctl;
7a3f924cee4bdfe Simon Trimmer 2023-03-28  474  	unsigned int reg;
7a3f924cee4bdfe Simon Trimmer 2023-03-28  475  
7a3f924cee4bdfe Simon Trimmer 2023-03-28  476  	list_for_each_entry(ctl, &dsp->ctl_list, list) {
7a3f924cee4bdfe Simon Trimmer 2023-03-28  477  		cs_dsp_coeff_base_reg(ctl, &reg, 0);
7a3f924cee4bdfe Simon Trimmer 2023-03-28  478  		seq_printf(s, "%22.*s: %#8zx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
7a3f924cee4bdfe Simon Trimmer 2023-03-28  479  			   ctl->subname_len, ctl->subname, ctl->len,
7a3f924cee4bdfe Simon Trimmer 2023-03-28  480  			   cs_dsp_mem_region_name(ctl->alg_region.type),
7a3f924cee4bdfe Simon Trimmer 2023-03-28  481  			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
7a3f924cee4bdfe Simon Trimmer 2023-03-28  482  			   ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
7a3f924cee4bdfe Simon Trimmer 2023-03-28  483  			   ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
7a3f924cee4bdfe Simon Trimmer 2023-03-28  484  			   ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
7a3f924cee4bdfe Simon Trimmer 2023-03-28  485  			   ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
7a3f924cee4bdfe Simon Trimmer 2023-03-28 @486  			   ctl->enabled ? "enabled" : "disabled",
7a3f924cee4bdfe Simon Trimmer 2023-03-28  487  			   ctl->set ? "dirty" : "clean");
7a3f924cee4bdfe Simon Trimmer 2023-03-28  488  	}
7a3f924cee4bdfe Simon Trimmer 2023-03-28  489  
7a3f924cee4bdfe Simon Trimmer 2023-03-28  490  	return 0;
7a3f924cee4bdfe Simon Trimmer 2023-03-28  491  }
7a3f924cee4bdfe Simon Trimmer 2023-03-28  492  DEFINE_SHOW_ATTRIBUTE(cs_dsp_debugfs_read_controls);
7a3f924cee4bdfe Simon Trimmer 2023-03-28  493  

:::::: The code at line 486 was first introduced by commit
:::::: 7a3f924cee4bdfe85eda4e636213e79d3fda6182 firmware: cs_dsp: Add a debugfs entry containing control details

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
