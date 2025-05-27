Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4C374EA
	for <oe-kbuild@lists.linux.dev>; Tue, 27 May 2025 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308331; cv=none; b=F5kKIFsz/kcybvZRg3fIu95DvipYTnnc8tkDeH0NbEHSz3+xuZrnlvtJblpyxG16rubTRRKoadRdfwgDjk2/GdrIa+3IYAHpFPrGw/hy39jef4a8b2Rdqz5Cn0rHi9chRuJEylmvof0uXCmmlpXgNQ6OU30xset/5KMrJg8f/kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308331; c=relaxed/simple;
	bh=Dq1n4e3NXrR8ro/xN5KR+ePd+Tatxbgh+glDovzB1Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXdnyJqnZ4nrcwZKGEqLdHDvoMg4b/TeW3P3X/YGLxMKn9PyrpH0eDm9TXNDCcFF+rJIgLVIjD0s1KkCSM8nwA8xPjYE5MVFbsajyxjk0VToELru0dCxqJOBII50QujhfnG9c31jO30XP56mYIQBoiufh+jfHkj+pdXA6IyLJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OY7Y23UX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OY7Y23UX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748308330; x=1779844330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dq1n4e3NXrR8ro/xN5KR+ePd+Tatxbgh+glDovzB1Hc=;
  b=OY7Y23UXjdoMef5Q+QLuiChzOkAxtC8EddmSwPz1REPnsufxfG6S9VRl
   IZ0u6JvHgCD+G+7xz62arUPmG93OMhw0w5YzXfaQoR6PbETpYsYYZPdOG
   kg+LXksdsLuogibWPYA9QH5ic+xw8zkyG+DNS3apDS9IMANO/293s52Bs
   Sr2Z3s+wS2vEsjJcgTyuMI7i9/1FCCRh6drrqSWbBs+sOYEE/R4L5FLse
   fgNMPtxLKkt4N+khp+lf038a4RknZJEHhu7EX2IN+1dC+kAYtfVjKgaDj
   0WPE+l5bODUOT7nJHGP7tnShXNK/m9THGteUhhVtqHtq5xDgvMP/2+vus
   Q==;
X-CSE-ConnectionGUID: +RwuYeU3TH2gpPtoHCcwfg==
X-CSE-MsgGUID: 28Ws78yuTL+kGiVFipx9Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50441031"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="50441031"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:12:05 -0700
X-CSE-ConnectionGUID: drhU1vcZQKKOt5tfGSEPbg==
X-CSE-MsgGUID: VZCNVTTLTqa+6TPPMZLrqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143026314"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2025 18:12:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJirK-000Smi-1r;
	Tue, 27 May 2025 01:12:02 +0000
Date: Tue, 27 May 2025 09:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12809/13629] drivers/base/regmap/regmap-irq.o:
 warning: objtool: read_irq_data+0x39c: unreachable instruction
Message-ID: <202505270936.QwschN4V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
commit: 1c12fbdf40e17df2efc24bf2009a0c3bfa75bfa7 [12809/13629] regmap: irq: Add support for chips without separate IRQ status
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270936.QwschN4V-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270936.QwschN4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505270936.QwschN4V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/regmap-irq.o: warning: objtool: read_irq_data+0x39c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
