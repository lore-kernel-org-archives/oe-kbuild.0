Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F02F189B9F
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719417; cv=none; b=FuGaiO9upSwQmEUGMB/LPxK+1cnu6+nHqYXBD+44qhnSRyES7gZ2HK7gIBjcZeorK/4W4+sJ16Q/ZsmO5v4R25yX0jr/PIrvz9IvkI6fw9FAZ/S/PZK9jZHNar8voMtGY/wdIWdU6ePkdXthBi28zWPQ1fVTh6jdBZBiq/SpxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719417; c=relaxed/simple;
	bh=gpgz4ura26mD+07gfsB+klt+QssO/HpLqBwRunurD/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/Q3y2gCDADGmpUcGHn4oQEwYaufh64vqPy6PgwUPkNNQFmMuAsQT0vDJ0l5wrFfqFX2mlycUEhUM2RjEmEs7M2hB3JrjWk+J/tfaGujFK2RliNXL0JVu2GaDkpiUaJIE0xL9OlFeNhYtjT37AFgFDG5fBXjRSRP8G19vgwwZCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9H5VnGI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9H5VnGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719415; x=1765255415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gpgz4ura26mD+07gfsB+klt+QssO/HpLqBwRunurD/4=;
  b=K9H5VnGIFXZyh4nvmGL5nM+mzNadG+RKtoASUGbvwyAkRgjpNEIk6nfg
   K9jVFtD7L+d5VaEIqpH57GeAwRaoth1cjcRbqar4V1idSEjvLqozn4qvY
   hMj9Th1YVFGTCHZeUo1DdvOhaBQvYn7yLHA+ZE2WIxPxTbaRD9sDZeL55
   h/Je1LbtL+Kmsrbz4128HPkLtElEBKM5R00AV/VSSo2PxzKzPhf4XJpFs
   0JaSauVvYywAv7GoJOruf6VDMBgvd+KQTmaZkB2fnN7taFG0zBMseWGtk
   k/yz3BkB8pToK6XX3+z9XD0Ssm1RnNTWWzEuu1tynFUUswzfr6oQz/JCn
   Q==;
X-CSE-ConnectionGUID: zJzaB7+6R5SrumsARR4gQg==
X-CSE-MsgGUID: SuINw8OvRHKct73mLeMNRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416114"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:43:35 -0800
X-CSE-ConnectionGUID: RNu1yt6jQguIu+qnvxQ0Cw==
X-CSE-MsgGUID: sisYPDYVR8CB+MbHMC1C0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94801535"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2024 20:43:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVcJ-0003uA-1N;
	Mon, 09 Dec 2024 04:43:31 +0000
Date: Mon, 9 Dec 2024 12:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/alloc_tag.c:586:36-42: opportunity for str_on_off(enable)
Message-ID: <202412081333.H3Za88q0-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 4835f747d3ed181bf2c67930fe06b2c01a5d2323 alloc_tag: support for page allocation tag compression
date:   4 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-052-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081333.H3Za88q0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412081333.H3Za88q0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/alloc_tag.c:586:36-42: opportunity for str_on_off(enable)

vim +586 lib/alloc_tag.c

0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  557  
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  558  /* See: Documentation/mm/allocation-profiling.rst */
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  559  static int __init setup_early_mem_profiling(char *str)
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  560  {
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  561  	bool compressed = false;
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  562  	bool enable;
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  563  
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  564  	if (!str || !str[0])
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  565  		return -EINVAL;
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  566  
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  567  	if (!strncmp(str, "never", 5)) {
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  568  		enable = false;
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  569  		mem_profiling_support = false;
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  570  		pr_info("Memory allocation profiling is disabled!\n");
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  571  	} else {
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  572  		char *token = strsep(&str, ",");
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  573  
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  574  		if (kstrtobool(token, &enable))
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  575  			return -EINVAL;
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  576  
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  577  		if (str) {
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  578  
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  579  			if (strcmp(str, "compressed"))
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  580  				return -EINVAL;
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  581  
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  582  			compressed = true;
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  583  		}
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  584  		mem_profiling_support = true;
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  585  		pr_info("Memory allocation profiling is enabled %s compression and is turned %s!\n",
4835f747d3ed18 Suren Baghdasaryan 2024-10-23 @586  			compressed ? "with" : "without", enable ? "on" : "off");
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  587  	}
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  588  
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  589  	if (enable != mem_alloc_profiling_enabled()) {
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  590  		if (enable)
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  591  			static_branch_enable(&mem_alloc_profiling_key);
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  592  		else
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  593  			static_branch_disable(&mem_alloc_profiling_key);
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  594  	}
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  595  	if (compressed != static_key_enabled(&mem_profiling_compressed)) {
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  596  		if (compressed)
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  597  			static_branch_enable(&mem_profiling_compressed);
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  598  		else
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  599  			static_branch_disable(&mem_profiling_compressed);
4835f747d3ed18 Suren Baghdasaryan 2024-10-23  600  	}
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  601  
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  602  	return 0;
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  603  }
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  604  early_param("sysctl.vm.mem_profiling", setup_early_mem_profiling);
8d469d0bee74d3 Suren Baghdasaryan 2024-03-21  605  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
