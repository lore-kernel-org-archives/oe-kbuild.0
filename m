Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC172594
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 03:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725162033; cv=none; b=BXzcs+nUKweN2xSWUjKlPwxJ1Xs3fp64iwctqXKc/oNMit9gQZLonzUHu/WAlrob/Zhr2rQ4JTuiEW4dpq0ueiIbL8xRSCZIKHScJinbBMJYwC5ic0Rfvxgin5iFgrvknussLI/fbt+OeV5ykf42+qeMGpMKHgsSwQFM10MKURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725162033; c=relaxed/simple;
	bh=glwMCMdVgeDoDlUmKVh53TGfltODh3/U5H6Q6ckWrqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSG7KvgjWHEQFxANxnt+vlWZt5bpqRNTs3Xut5SQnfc4u4R9Xgr+/hktsoU7v3jFpDlW59sr3vbYAakFcSHqk4p0TaNM6G/m57MORKah/2xt9w0Ny9D0iurfghxJOn9Rf6s5q84FjZM6uGbV82MMG01HXMzB/8EQf5WuABOMfh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DF4CRfEH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DF4CRfEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725162030; x=1756698030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glwMCMdVgeDoDlUmKVh53TGfltODh3/U5H6Q6ckWrqs=;
  b=DF4CRfEHNgtXJUroSr0wyqaIaiX+LbEMrZeigykW6gxlpSXnzaDs32hh
   KfUR7Onk/jA1GKHWbjSqzy4eYXM1If+Ij+T6bNRGxFPPlFq1NGqBd3pI2
   z7VonK5xyE0dZXgVa35jg27YL1gT/MUqsfshjD+87zj8jU2UTOFi6/Mrc
   HLfbQnvVRj4ZF/q7p8FW+r7nB5MfoUXQC1CW+hBS0qMbILybHm092jRQp
   MAwnTn7EO0ppcXKBGQGsQfPqk4EWZwShmAJd7wiQxVD09UpY2N6IxVg2Z
   ObGejwK/BxEJXfnh6iDobwK86oUNMHVKvAiodH9BQVpQPYC4pi499R2sn
   g==;
X-CSE-ConnectionGUID: yuEJCxeIT4G0x8tDs8Dwqg==
X-CSE-MsgGUID: n8Zq8yMqSGSwnujwLIw2lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="41247586"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="41247586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 20:40:29 -0700
X-CSE-ConnectionGUID: 6RaAaC7cTLWW3/cwlrUlUg==
X-CSE-MsgGUID: u/bKYVY6RiOyz6nNiEQzYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="63958482"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2024 20:40:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skbRy-0003N4-35;
	Sun, 01 Sep 2024 03:40:26 +0000
Date: Sun, 1 Sep 2024 11:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/lpfc/lpfc_bsg.o: warning: objtool:
 lpfc_bsg_diag_loopback_run+0x8b0: unreachable instruction
Message-ID: <202409011136.jgRSCcq7-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Binbin Zhou <zhoubinbin@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6cd90e5ea72f35fa40f971c419e16142cd8272bf
commit: f60d251b27f6599b3407950924ac9b2c7a94b714 LoongArch: Add architectural preparation for CPUFreq
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-002-20240829 (https://download.01.org/0day-ci/archive/20240901/202409011136.jgRSCcq7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011136.jgRSCcq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409011136.jgRSCcq7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_bsg.o: warning: objtool: lpfc_bsg_diag_loopback_run+0x8b0: unreachable instruction


objdump-func vmlinux.o lpfc_bsg_diag_loopback_run:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
