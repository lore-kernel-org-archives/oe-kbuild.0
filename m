Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7553524111B
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 18:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739038544; cv=none; b=k14QXa2NE5AwuAz8CXWATQDAQ0Xaj2Qi3yf3W+LyRf/rxwZkV0XLr2+ErczvhLmpxv+jHPHvbn1SH7M1H4ttbVmx+3G20+fXfoqey4RVexlqS7eq5tkkmbnGaA14UB2+rty+ws/XL1P3W9kT4+vaXb3vwu/doaDCUcppnMhm0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739038544; c=relaxed/simple;
	bh=0TPyjltRr8gRyGE3aDqToy61xpGZHRILOkIG1NEUrAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QC9uLswF6jkPmznWyeO0RY5nNlq+FDcoYPCd419+Zu2gKRThFUMxMinhepG0dVBPMbtS3KV549HzYGnIERLHMQJLi5bNjZABdh/p9187ltbYXavWId/l5JZA/jseapfUuZSkrDyqFuqSjeD3R20Zhmmjdlxp6wUsP9b0+GTk2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOKh/Y86; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOKh/Y86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739038542; x=1770574542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TPyjltRr8gRyGE3aDqToy61xpGZHRILOkIG1NEUrAM=;
  b=nOKh/Y868fNyp8DGRhlii6bpH0KmiNURGp4A6TezVtxq8u7b9AxIjqyC
   aqpvbVjLP8bx+giXKI87wmimktkS6whZFe4m3Wz/Epf1pHuPTHHt7Uh7y
   vIKwn4cKDZPYaieh9jHCDBf01dsNaKULLkBkpi4zxrq7uCXBuzBxd5lQb
   5nwPrTet9rJTr+xMJT3ubDhygCIWNnEXJuCbPfJ/7jlncG9yEKZqMrhUn
   ZLu/QH5k1Usg5hTiRuPugbx7gfkXB/jJ/75LwaEKCp8yB/G5C+1MYVTx2
   k2MBFwyqoSKqyh244QyEMFghnlBtT/+kTYguEiNoNgtHkZq9HEGk7IGIE
   Q==;
X-CSE-ConnectionGUID: GA+G8dXgSKi+uDFxu4XGmg==
X-CSE-MsgGUID: pVK3W4pAQJSdnFLKZoUovw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43325120"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43325120"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 10:15:42 -0800
X-CSE-ConnectionGUID: gi0j6EE3RnqUDgOP3pnwfw==
X-CSE-MsgGUID: 5+273fppQ+GZkxLjUk7iYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="112023281"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Feb 2025 10:15:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgpMg-0010Tx-2I;
	Sat, 08 Feb 2025 18:15:38 +0000
Date: Sun, 9 Feb 2025 02:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mtd:mtd/next 15/18] arch/arm64/boot/dts/hisilicon/hip05-d02.dtb:
 nor-flash@0: Unevaluated properties are not allowed ('partition@0',
 'partition@1000000', 'partition@300000' were unexpected)
Message-ID: <202502090251.I3B7TxRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
head:   3f930a52d7151addefa6d5ba9f7f2c17dc52db1d
commit: 038e2ba01cf5ff94dc8f740328ec565d18bb764e [15/18] dt-bindings: mtd: physmap: Ensure all properties are defined
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090251.I3B7TxRI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090251.I3B7TxRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502090251.I3B7TxRI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: /soc/local-bus@80380000: failed to match any schema with compatible: ['hisilicon,hisi-localbus', 'simple-bus']
   arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: nor-flash@0: $nodename:0: 'nor-flash@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: nor-flash@0: Unevaluated properties are not allowed ('partition@0', 'partition@1000000', 'partition@300000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: /soc/local-bus@80380000/cpld@100000000: failed to match any schema with compatible: ['hisilicon,hip05-cpld']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
