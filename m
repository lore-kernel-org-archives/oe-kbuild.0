Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9F2236E8
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758682799; cv=none; b=KQXmbzWtTKtsddJse5PQhzfTqfi1dMpV6i1rbxr8AxUWh2aYVFcVHIFTKHBKnRjTNoIzpVoeqwEZDJYrvmj8WaaI2SAOe8sFlINyah4y1Ha7jvwwqfq1FELu3mxIr5nRa2PaUIfqQRtbtR3BoMpD3JexJDHy50AwX0JXxfkErz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758682799; c=relaxed/simple;
	bh=QBAXFGIxnHuyZYIvm3CvSoRR5dvlFW3uNgXrk+DeDy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHMYr5SEhv0gZE0ZoHlm3n2fYsb767hMfKI1qSIlE7zCr9DKzdEMN36oLjHgNb/ocguQsFQWm9Zvzgild14gr4g53FwvsJSWIMtEj0yjvZ/2Ir5DJQDU8jYfk8aHK5d6Z6vI6hhu92P7QzG5F44trAjaAaOZcbAmDGy7KVEYAt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhMe/O2X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhMe/O2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758682797; x=1790218797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QBAXFGIxnHuyZYIvm3CvSoRR5dvlFW3uNgXrk+DeDy4=;
  b=FhMe/O2X4uQw8lrX5Oxbn3O5W3DocpTXY7CgjQZBJiYH7OaJUt9DBssJ
   S4XH7GGjc8V0VpbPQ77nvqmyaIMrGQkbBtFNG+hVs/4qSTFcITg/WrOyF
   2FR5hd+0qNICHXnvB9/K6r102l/rNo3USKpIChWyWnsPCx2SgWT2U2NwE
   IzVuD8CukXBjjj5F8aL3/0lXeyci3JQdIWJrcBoQbiVP102iqNT5sGhXw
   Zwavzvnfy/pPo4XEEHGYGm6IC9YJv0iAeXalcNuFO0x+gtNYJRa4It+rg
   KhjQ1dsg5GmNuW7UO2SAOIFhsFp/88dZBIw0gxqs8kcx4K+UHp5bugYCk
   w==;
X-CSE-ConnectionGUID: kKNG8HseTbug4gbhjgvD8Q==
X-CSE-MsgGUID: xSm3ALwNQgCpg106N5d8iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60861517"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60861517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 19:59:56 -0700
X-CSE-ConnectionGUID: r5ylfgYjReSl0Vn33iBgdQ==
X-CSE-MsgGUID: SgilotqBSGCxFD7dBapI6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176206784"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Sep 2025 19:59:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1FjP-0003kX-0X;
	Wed, 24 Sep 2025 02:59:49 +0000
Date: Wed, 24 Sep 2025 10:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10231/11867] drivers/gpu/drm/xe/xe_configfs.c:282
 lookup_engine_info() error: we previously assumed 'mask' could be null (see
 line 278)
Message-ID: <202509241020.mrKHkcLR-lkp@intel.com>
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
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ce7f1a983b074f6cf8609068088ca3182c569ee4
commit: e2a9854d806e1cb95861a0f3c7125caaefd7ef03 [10231/11867] drm/xe/configfs: Allow to select by class only
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250923 (https://download.01.org/0day-ci/archive/20250924/202509241020.mrKHkcLR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509241020.mrKHkcLR-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_configfs.c:282 lookup_engine_info() error: we previously assumed 'mask' could be null (see line 278)

vim +/mask +282 drivers/gpu/drm/xe/xe_configfs.c

d09bc3edfe5c702 Lucas De Marchi 2025-05-28  256  
e2a9854d806e1cb Lucas De Marchi 2025-09-16  257  /*
e2a9854d806e1cb Lucas De Marchi 2025-09-16  258   * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
e2a9854d806e1cb Lucas De Marchi 2025-09-16  259   * instance in @pattern.
e2a9854d806e1cb Lucas De Marchi 2025-09-16  260   *
e2a9854d806e1cb Lucas De Marchi 2025-09-16  261   * Examples of inputs:
e2a9854d806e1cb Lucas De Marchi 2025-09-16  262   * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
e2a9854d806e1cb Lucas De Marchi 2025-09-16  263   *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
e2a9854d806e1cb Lucas De Marchi 2025-09-16  264   * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
e2a9854d806e1cb Lucas De Marchi 2025-09-16  265   *   mask == XE_HW_ENGINE_RCS_MASK
e2a9854d806e1cb Lucas De Marchi 2025-09-16  266   * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
e2a9854d806e1cb Lucas De Marchi 2025-09-16  267   */
e2a9854d806e1cb Lucas De Marchi 2025-09-16  268  static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  269  {
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  270  	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  271  		u8 instance;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  272  		u16 bit;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  273  
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  274  		if (!str_has_prefix(pattern, engine_info[i].cls))
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  275  			continue;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  276  
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  277  		pattern += strlen(engine_info[i].cls);
e2a9854d806e1cb Lucas De Marchi 2025-09-16 @278  		if (!mask && !*pattern)
e2a9854d806e1cb Lucas De Marchi 2025-09-16  279  			return &engine_info[i];
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  280  
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  281  		if (!strcmp(pattern, "*")) {
d09bc3edfe5c702 Lucas De Marchi 2025-05-28 @282  			*mask = engine_info[i].mask;
e2a9854d806e1cb Lucas De Marchi 2025-09-16  283  			return &engine_info[i];
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  284  		}
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  285  
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  286  		if (kstrtou8(pattern, 10, &instance))
e2a9854d806e1cb Lucas De Marchi 2025-09-16  287  			return NULL;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  288  
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  289  		bit = __ffs64(engine_info[i].mask) + instance;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  290  		if (bit >= fls64(engine_info[i].mask))
e2a9854d806e1cb Lucas De Marchi 2025-09-16  291  			return NULL;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  292  
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  293  		*mask = BIT_ULL(bit);
e2a9854d806e1cb Lucas De Marchi 2025-09-16  294  		return &engine_info[i];
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  295  	}
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  296  
e2a9854d806e1cb Lucas De Marchi 2025-09-16  297  	return NULL;
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  298  }
d09bc3edfe5c702 Lucas De Marchi 2025-05-28  299  

:::::: The code at line 282 was first introduced by commit
:::::: d09bc3edfe5c702463e2640314b7db2219242446 drm/xe/configfs: Add attribute to disable engines

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
