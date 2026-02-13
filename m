Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737C17555
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770943366; cv=none; b=KM4xosWlo6kLEQpviHeRa4JLT6+rLTukSyZA8vrEg6vMR5Ncjvy0/T2ovVxEow7S5lkmyteRyf2wTTX6KVdIt4ipVRYCXJ/JrzMtsU2uSAf47LHxO81IMjPargi6Y51T3HC2WstZFBokO/JHHNDDN6RKJzSPa9OYLRihaMNXXiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770943366; c=relaxed/simple;
	bh=eIGAx1KONQeYn1MTkkZesPpqW4ppgP1+LWO6JfGxP38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TWxSiVLY6BXJ5xHyZEtHZ5VfANcPkcK00LfQxDML7NRseq6XRExNvY7iggBP/yxVN2TVjC4duzn/SXAKa4N+fNnhnYFsXTEU1teThvBQB7i+DWsiRMeNHkIm7CvL565pCXP3f/yrJ2VXkxi1UNG7WGMOGCgpjOLEveNpD1WbtSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHO1liLB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHO1liLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770943365; x=1802479365;
  h=date:from:to:cc:subject:message-id;
  bh=eIGAx1KONQeYn1MTkkZesPpqW4ppgP1+LWO6JfGxP38=;
  b=NHO1liLBfm3bvIZchCw7IJ1NSG/BFQQ27zZ6v9XpJbq9xRUBV38U3fHs
   5GCgxt708Y+afDOOPSJ1S9m/OhJIHt/gB/hKxMz8U1PTgX5s3f0RbbyLI
   nxBvvpt3YrqDJUBhHDbWpbYCC7dq/oIL/xL4lc4poinsnzwNBVOEBaitc
   YnA2jxFStG/ky5Ekc6BUUpHSpeWOKu+EgW7wEnPwRvBRm0Addpk5+519w
   0TR8rg0wNJOB4lxjnKqITCtld6b4Pmm5dFJuFE4iGSo7AknnpVzuz9QJV
   g7O/6LFJNUrUFyR02hWyyY9UC4/o9Q7vCYW7jkE9VyCev7ii0o+ov8QWx
   A==;
X-CSE-ConnectionGUID: whVDtFE6Scyy4DWxOKS6GQ==
X-CSE-MsgGUID: s7b/Vv/ZSEG0MU1BXlVhNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72309815"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72309815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 16:42:44 -0800
X-CSE-ConnectionGUID: CQgcehmqTkmU6//H/6xWrw==
X-CSE-MsgGUID: M93lxWV4SrmjJJF8l5ZN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="216948514"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2026 16:42:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqhGa-00000000uIy-33rG;
	Fri, 13 Feb 2026 00:42:40 +0000
Date: Fri, 13 Feb 2026 08:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/gpio/gpio-tb10x.c:35 Cannot find identifier
 on line:
Message-ID: <202602130801.7IAQfW3M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   582a1ef360a05bff4350bbf6e383f61d26b804f0
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260213/202602130801.7IAQfW3M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130801.7IAQfW3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602130801.7IAQfW3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpio/gpio-tb10x.c:35 Cannot find identifier on line:
    * @base: register base address
   Warning: drivers/gpio/gpio-tb10x.c:36 Cannot find identifier on line:
    * @domain: IRQ domain of GPIO generated interrupts managed by this controller
   Warning: drivers/gpio/gpio-tb10x.c:37 Cannot find identifier on line:
    * @irq: Interrupt line of parent interrupt controller
   Warning: drivers/gpio/gpio-tb10x.c:38 Cannot find identifier on line:
    * @chip: Generic GPIO chip structure associated with this GPIO controller
   Warning: drivers/gpio/gpio-tb10x.c:39 Cannot find identifier on line:
    */
   Warning: drivers/gpio/gpio-tb10x.c:40 Cannot find identifier on line:
   struct tb10x_gpio {
   Warning: drivers/gpio/gpio-tb10x.c:41 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
           void __iomem *base;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
