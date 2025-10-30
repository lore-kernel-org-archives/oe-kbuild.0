Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480CF1E834E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761801005; cv=none; b=g3fwl7CWDyJFmvXAuXfdEChZK8OoShj8Q2TeieHA8xjZ2EfIm68aGLjCpyX0i1mqCbKL9m3KJK6MYatJ9uJOp4i060BDKNBup1oGQ80be0u7ks6YNXxGXoP5r6OskwcRgewN68M7pHa6q80AvLzR+MqP6p7RyatihVwDrVIHMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761801005; c=relaxed/simple;
	bh=tvnLgE+9Kn8rOK4Rt2rNWPbz5t6lZe5xr10I8S2s0Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTGkOO3cVWrWJ/BdNszBlf4qiIra44j/Na7LHPYpjxaAMO+dASzgkF2pdnyNNTb3X/6UbRIREe8PgZ1CmJP75y72e7mM5zY/qqynAu9MnU6BIf/eKzKxGukSN72TPQAsg1m/oZ+jxAZ1pdvCtQSmROJ6eiDCH9P1ovBJeDMLUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qph86rBT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qph86rBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761801003; x=1793337003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvnLgE+9Kn8rOK4Rt2rNWPbz5t6lZe5xr10I8S2s0Ms=;
  b=Qph86rBThK/MTlBiJxlIJRP43hJ+w5wWfuhfcZI2k5jEnQ2gJqYv51eK
   IrY3vKBTbV3F4oidxANG/SF/GMj+4NtbNH3HfeDz28J3wFFpOULHcSJQK
   DIAlj/pnU2m1xo9DN+8zLkz5BDQ9NjrqD7gH9qZKvVyQWZga1Mev573wE
   rSxRJrAg5FmoypW+xE+LGlizyYZbeTtTLsiontDs09ShcSeSGhnNel2Rl
   CNzKkyDlgAYKfhWrZWoA/Rj9p8wRMNvWz8r89SX2d+muBZ8b5mk/zpeDS
   LrKJxqwmtcAkHq1Fh6rn2YMIQ5I23yInwnvlhwFsOazpJ7quOcEzWyNSG
   Q==;
X-CSE-ConnectionGUID: xqQMkJR+RB6lL7Q/QWIp8Q==
X-CSE-MsgGUID: jwN2pf48TNCz5lEUAUBUfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63843926"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63843926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 22:09:31 -0700
X-CSE-ConnectionGUID: Um0cvAtiSSyXGdJqyFPJjw==
X-CSE-MsgGUID: TANv43rURsSarrc+GzDUqg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 22:09:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEKue-000LUA-00;
	Thu, 30 Oct 2025 05:09:28 +0000
Date: Thu, 30 Oct 2025 13:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/alloc_tag.c:776:63-70: WARNING: Consider using %pe to print
 PTR_ERR()
Message-ID: <202510301310.irLH4k9j-lkp@intel.com>
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
TO: Casey Chen <cachen@purestorage.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Yuanyuan Zhong <yzhong@purestorage.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 780138b123816d717dbc0771d4c87e9a8a01963d alloc_tag: check mem_profiling_support in alloc_tag_init
date:   5 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301310.irLH4k9j-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301310.irLH4k9j-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/alloc_tag.c:776:63-70: WARNING: Consider using %pe to print PTR_ERR()

vim +776 lib/alloc_tag.c

c944bf60c16a65 Suren Baghdasaryan 2024-06-01  739  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  740  static int __init alloc_tag_init(void)
22d407b164ff79 Suren Baghdasaryan 2024-03-21  741  {
22d407b164ff79 Suren Baghdasaryan 2024-03-21  742  	const struct codetag_type_desc desc = {
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  743  		.section		= ALLOC_TAG_SECTION_NAME,
22d407b164ff79 Suren Baghdasaryan 2024-03-21  744  		.tag_size		= sizeof(struct alloc_tag),
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  745  #ifdef CONFIG_MODULES
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  746  		.needs_section_mem	= needs_section_mem,
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  747  		.alloc_section_mem	= reserve_module_tags,
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  748  		.free_section_mem	= release_module_tags,
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  749  		.module_replaced	= replace_module,
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  750  #endif
22d407b164ff79 Suren Baghdasaryan 2024-03-21  751  	};
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  752  	int res;
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  753  
780138b123816d Casey Chen         2025-05-13  754  	sysctl_init();
780138b123816d Casey Chen         2025-05-13  755  
780138b123816d Casey Chen         2025-05-13  756  	if (!mem_profiling_support) {
780138b123816d Casey Chen         2025-05-13  757  		pr_info("Memory allocation profiling is not supported!\n");
780138b123816d Casey Chen         2025-05-13  758  		return 0;
780138b123816d Casey Chen         2025-05-13  759  	}
780138b123816d Casey Chen         2025-05-13  760  
780138b123816d Casey Chen         2025-05-13  761  	if (!proc_create_seq(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op)) {
780138b123816d Casey Chen         2025-05-13  762  		pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME);
780138b123816d Casey Chen         2025-05-13  763  		shutdown_mem_profiling(false);
780138b123816d Casey Chen         2025-05-13  764  		return -ENOMEM;
780138b123816d Casey Chen         2025-05-13  765  	}
780138b123816d Casey Chen         2025-05-13  766  
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  767  	res = alloc_mod_tags_mem();
780138b123816d Casey Chen         2025-05-13  768  	if (res) {
780138b123816d Casey Chen         2025-05-13  769  		pr_err("Failed to reserve address space for module tags, errno = %d\n", res);
780138b123816d Casey Chen         2025-05-13  770  		shutdown_mem_profiling(true);
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  771  		return res;
780138b123816d Casey Chen         2025-05-13  772  	}
22d407b164ff79 Suren Baghdasaryan 2024-03-21  773  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  774  	alloc_tag_cttype = codetag_register_type(&desc);
0db6f8d7820a4b Suren Baghdasaryan 2024-10-23  775  	if (IS_ERR(alloc_tag_cttype)) {
780138b123816d Casey Chen         2025-05-13 @776  		pr_err("Allocation tags registration failed, errno = %ld\n", PTR_ERR(alloc_tag_cttype));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
