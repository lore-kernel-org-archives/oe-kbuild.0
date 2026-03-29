Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045F140DFD3
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775139; cv=none; b=LkQcbc32GO0Huj3Vmxwd3l4qW1pjHFw/QQPShxZ/X12zafaY8wH6TaDjH6H+Vnk1Se3KRguf6FgudbyFzxhd7UHy8XCSlJ/SkL6uKg+vxEj2gySOpNR+PiwagqThk8K/AYFZPN1ol4XTnqhed8/k1RLidpzaFV4oQU0MtjEGYIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775139; c=relaxed/simple;
	bh=b98N+gYenJFSyHf1L+ANLT0H/NjztsL8rWl7fXkmHwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A92Wxx+/E0g/x3/cRe2kCEAXPZo+28fqJLA6itew+uRjn7ERn8UfBdRCrTwwO9aGVANQvCYq+Ks+SSkG6JD8vPXhvSFsBkG7Wm8LzhjepKfQlqWxmMlUNNp+Nkz9ZA7yFsi9dfyYb8a5LtoQpJrQIYlHEx/isYSw8967JNClZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4arh/Dd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4arh/Dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774775138; x=1806311138;
  h=date:from:to:cc:subject:message-id;
  bh=b98N+gYenJFSyHf1L+ANLT0H/NjztsL8rWl7fXkmHwg=;
  b=C4arh/DdhWuMaejl51yuVgBNgb4z1e9/NdZiRfIR48VRxEI0NrrvEWVS
   qNWxjPsC6HEgM7HtJDvls4oTK+7r+0/eZ3ZZw9XsHTH5RzeTHj4kuwcKs
   MqiWJ7JIo4YwCyrVGvkQWsTrx9P+hI2Auo+HL4qFTchhtujOV1SkGnUjx
   MR7xEYzL4OJ2hgMvMOFWiAuDZooPH1IP0JOeBjkucNIYa8GNDrdlLumpQ
   luPRUhciTeoPMvHbki0H1RgzxVFfGq+EBdakbMCA9WM5DucB4LYQoxQZF
   YcH0FXt4SsRBhJJNntqtQjdzu2FOiYezXpWGwsSXbEyf7cT1GW1rDixxj
   g==;
X-CSE-ConnectionGUID: 4qyQlmj7Tf2rYwJtnf2dZw==
X-CSE-MsgGUID: qDgtSCdURCG+AdGvIP5TLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74822902"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="74822902"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 02:05:37 -0700
X-CSE-ConnectionGUID: m/Kwr/VQQQOwqQFtMTJtZQ==
X-CSE-MsgGUID: VByNh/dzS12czQkeisLEPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="224939687"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Mar 2026 02:05:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6m5N-00000000CED-3aYS;
	Sun, 29 Mar 2026 09:05:33 +0000
Date: Sun, 29 Mar 2026 17:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/pxa_dma.c:595 clear_chan_irq() warn: variable
 dereferenced before check 'phy->vchan' (see line 593)
Message-ID: <202603291747.rkUqnuhi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbfffcca2bf0622b601b7eaf477aa29035169184
commit: 9fc2f03e85952ee52558ab844473a8284d924a56 dmaengine: pxa: Enable compile test
date:   1 year, 2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 2 months ago
config: powerpc64-randconfig-r072-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291747.rkUqnuhi-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603291747.rkUqnuhi-lkp@intel.com/

smatch warnings:
drivers/dma/pxa_dma.c:595 clear_chan_irq() warn: variable dereferenced before check 'phy->vchan' (see line 593)

vim +595 drivers/dma/pxa_dma.c

a57e16cf03339c2 Robert Jarzmik 2015-05-25  583  
a57e16cf03339c2 Robert Jarzmik 2015-05-25  584  static unsigned int clear_chan_irq(struct pxad_phy *phy)
a57e16cf03339c2 Robert Jarzmik 2015-05-25  585  {
a57e16cf03339c2 Robert Jarzmik 2015-05-25  586  	u32 dcsr;
a57e16cf03339c2 Robert Jarzmik 2015-05-25  587  	u32 dint = readl(phy->base + DINT);
a57e16cf03339c2 Robert Jarzmik 2015-05-25  588  
a57e16cf03339c2 Robert Jarzmik 2015-05-25  589  	if (!(dint & BIT(phy->idx)))
a57e16cf03339c2 Robert Jarzmik 2015-05-25  590  		return PXA_DCSR_RUN;
a57e16cf03339c2 Robert Jarzmik 2015-05-25  591  
a57e16cf03339c2 Robert Jarzmik 2015-05-25  592  	/* clear irq */
a57e16cf03339c2 Robert Jarzmik 2015-05-25 @593  	dcsr = phy_readl_relaxed(phy, DCSR);
a57e16cf03339c2 Robert Jarzmik 2015-05-25  594  	phy_writel(phy, dcsr, DCSR);
a57e16cf03339c2 Robert Jarzmik 2015-05-25 @595  	if ((dcsr & PXA_DCSR_BUSERR) && (phy->vchan))
a57e16cf03339c2 Robert Jarzmik 2015-05-25  596  		dev_warn(&phy->vchan->vc.chan.dev->device,
a57e16cf03339c2 Robert Jarzmik 2015-05-25  597  			 "%s(chan=%p): PXA_DCSR_BUSERR\n",
a57e16cf03339c2 Robert Jarzmik 2015-05-25  598  			 __func__, &phy->vchan);
a57e16cf03339c2 Robert Jarzmik 2015-05-25  599  
a57e16cf03339c2 Robert Jarzmik 2015-05-25  600  	return dcsr & ~PXA_DCSR_RUN;
a57e16cf03339c2 Robert Jarzmik 2015-05-25  601  }
a57e16cf03339c2 Robert Jarzmik 2015-05-25  602  

:::::: The code at line 595 was first introduced by commit
:::::: a57e16cf03339c20b09642f46f60190069ff70c7 dmaengine: pxa: add pxa dmaengine driver

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
