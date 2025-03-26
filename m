Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA4A49659
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743023237; cv=none; b=bPW8rOhhLQlqKRP9FXsP5I1z8EpgUQTVjvkg6qR7JBCRvjEmKxywHBic9Zr5Yv2aGMzb9oD4DF5Y89ZyrrJ/8djL0WAy/5yyZ6HgPLsr/tuOY8aHxAUrXyqJ37iLkdEmqa6wKEfIMvgtEFFY7Sb9fx3HJNyKlo7alpeCK8q+nZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743023237; c=relaxed/simple;
	bh=cN5Bwaf0/JJpEmznlF/lMGTx9ucmccm9ZEyYYJU/EZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEWV/yVLZ+K11Yb2yKGnK/m0LZRWjp8FItMgTZCgKz1DvBfA9dXC5laDkhoJcvxkg6t2OI43qewv3rxVFFFavo/ifXCQwHH0jgo17vGAVsdG3RIFpOBwYiwZiu9oVyMfAmCQ/FqPbUAuNxVu2VSUGyuIQbp3qJbJfGADI3zP1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9TkuqTf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9TkuqTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743023236; x=1774559236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cN5Bwaf0/JJpEmznlF/lMGTx9ucmccm9ZEyYYJU/EZo=;
  b=V9TkuqTfAdXJNaeRN/EkAKrSvGuL+p0t3/N67VP1PFU+jYkJ6TeM2tj8
   vB8g7p10g1Ec6lhHbplyXlakKsZCrTWWBaKKZRHWF/PL+85G80oEKWbVp
   8uUqIjNPdGy+HD3qpeH4Vw/UiEjxAX1HwSn9DA7w5GxGa0G5yymyzFijN
   Z3p/Mx1OXPb9tcxECjOtQ8Puy3tVkLNp6Igu1/UVAYYiy92yIXseaI1yl
   FnRbXIvOrO2c71Ymwz2GlBHTTIlsAP37fEMCZkWwWml9510wr+Uoej/bB
   hid0ZLDqiJ7JSYG/XKUB8QwClnblIDmJZ7NahVAHtxfe7/pG/0kk96Ple
   Q==;
X-CSE-ConnectionGUID: 8s2Eiv+yQCenL2os/09BhA==
X-CSE-MsgGUID: 50uQITGeREi9CB0XvyY8uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213797"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44213797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 14:07:15 -0700
X-CSE-ConnectionGUID: 44pwgIy5S56M/qrd1N0faw==
X-CSE-MsgGUID: qcgYYvZHSu+P+kkdf9D0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="130102701"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2025 14:07:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txXxv-00064p-1w;
	Wed, 26 Mar 2025 21:07:11 +0000
Date: Thu, 27 Mar 2025 05:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13192/13775] drivers/of/device.c:40
 of_dma_set_restricted_buffer() warn: iterator 'i' not incremented
Message-ID: <202503270544.UdZ3hnio-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0e871365f7f9aeb9b590e345458b2083e067cd13
commit: 31594827c3f41f3481ca40c45780b437c8aee56e [13192/13775] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250326 (https://download.01.org/0day-ci/archive/20250327/202503270544.UdZ3hnio-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503270544.UdZ3hnio-lkp@intel.com/

New smatch warnings:
drivers/of/device.c:40 of_dma_set_restricted_buffer() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/of/device.c:296 of_device_make_bus_id() warn: excess argument passed to 'dev_set_name'
drivers/of/device.c:300 of_device_make_bus_id() warn: excess argument passed to 'dev_set_name'
drivers/of/device.c:306 of_device_make_bus_id() warn: excess argument passed to 'dev_set_name'

vim +/i +40 drivers/of/device.c

f85ff3056cefdf Stephen Rothwell  2007-05-01  34  
f3cfd136aef018 Will Deacon       2021-08-16  35  static void
ce5cb67c664fbc Will Deacon       2021-08-16  36  of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
ce5cb67c664fbc Will Deacon       2021-08-16  37  {
31594827c3f41f Rob Herring (Arm  2025-03-17  38) 	struct device_node *of_node = dev->of_node;
31594827c3f41f Rob Herring (Arm  2025-03-17  39) 	struct of_phandle_iterator it;
31594827c3f41f Rob Herring (Arm  2025-03-17 @40) 	int rc, i = 0;
ce5cb67c664fbc Will Deacon       2021-08-16  41  
f3cfd136aef018 Will Deacon       2021-08-16  42  	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
f3cfd136aef018 Will Deacon       2021-08-16  43  		return;
f3cfd136aef018 Will Deacon       2021-08-16  44  
ce5cb67c664fbc Will Deacon       2021-08-16  45  	/*
ce5cb67c664fbc Will Deacon       2021-08-16  46  	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
ce5cb67c664fbc Will Deacon       2021-08-16  47  	 * the OF node having DMA configuration.
ce5cb67c664fbc Will Deacon       2021-08-16  48  	 */
31594827c3f41f Rob Herring (Arm  2025-03-17  49) 	if (!of_property_present(of_node, "memory-region"))
ce5cb67c664fbc Will Deacon       2021-08-16  50  		of_node = np;
ce5cb67c664fbc Will Deacon       2021-08-16  51  
31594827c3f41f Rob Herring (Arm  2025-03-17  52) 	of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
ce5cb67c664fbc Will Deacon       2021-08-16  53  		/*
ce5cb67c664fbc Will Deacon       2021-08-16  54  		 * There might be multiple memory regions, but only one
ce5cb67c664fbc Will Deacon       2021-08-16  55  		 * restricted-dma-pool region is allowed.
ce5cb67c664fbc Will Deacon       2021-08-16  56  		 */
31594827c3f41f Rob Herring (Arm  2025-03-17  57) 		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
31594827c3f41f Rob Herring (Arm  2025-03-17  58) 		    of_device_is_available(it.node)) {
31594827c3f41f Rob Herring (Arm  2025-03-17  59) 			if (!of_reserved_mem_device_init_by_idx(dev, of_node, i)) {
31594827c3f41f Rob Herring (Arm  2025-03-17  60) 				of_node_put(it.node);
31594827c3f41f Rob Herring (Arm  2025-03-17  61) 				return;
31594827c3f41f Rob Herring (Arm  2025-03-17  62) 			}
ce5cb67c664fbc Will Deacon       2021-08-16  63  		}
31594827c3f41f Rob Herring (Arm  2025-03-17  64) 		i++;
d17e37c41b7ed3 Liang He          2022-07-02  65  	}
ce5cb67c664fbc Will Deacon       2021-08-16  66  
f3cfd136aef018 Will Deacon       2021-08-16  67  	dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
ce5cb67c664fbc Will Deacon       2021-08-16  68  }
ce5cb67c664fbc Will Deacon       2021-08-16  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
