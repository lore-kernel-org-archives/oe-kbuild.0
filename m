Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D83CFF4A
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147918; cv=none; b=Wwkdar49EkDK+Fi7kAZuyent1A7zxm3FTDPKjMbQ6jbwpexUtha1tXj4qnqIYFqKSZQBDgQ2BkvD7SByHl2T0m2qyfOgzV74j6TKt4V/HYH+m6h+o8dzF8e3avfUg1kkmxtTfvNkwqrvI/UuXgEDUjpVu18VS3qhvkGEagt8WmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147918; c=relaxed/simple;
	bh=OyCrxCx/Zp2g6O9nfll9i6YnF9T01m+nZq0Ibgz4SLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=atM+CVEu/efYLetqbcvrWxqVcUkQK8whxYZI/vKvgDxMTvpO33Qyk7gPlXXQbLJHnDcDCY6kFbTbsw+cpvuMCHB4z1dgyssk98oBuY8W8ZThDd79w1x/zboH1UoCVozl5pd6fnFfIHwbbyX97d8BM8FAPOaq3/yxJEOVmyygslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rlj/sAGq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rlj/sAGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778147916; x=1809683916;
  h=date:from:to:cc:subject:message-id;
  bh=OyCrxCx/Zp2g6O9nfll9i6YnF9T01m+nZq0Ibgz4SLg=;
  b=Rlj/sAGqaxjJBJr6k3WNgxAW2fUH/kR25MI8cEQARrqYISKMcVkG+gah
   +AesL0nnGLjZfqIIYko09mQEAbx3v0Gi6ttLMyL4YDV1Y86SQz0Z93Frt
   yZrRDaVZJuk4eZwWH1BHkP+2iFrLqWFAVbiM5la+wgrFnl4V090yu32qQ
   60Ur8jCjrUu9k4fmvSTH8Pgq5EtTmWOYpGrxUezMVkIt4ayRZ4Tf02uhN
   WrmR8+vBUNV2ZgUcahwBa16umlHsCgMe1qVy9ng5+kMRDdLuYboOohZd0
   gPoxTFIOw/UhLi7KLHC/+yr7LavJCV2qMBmmf8Azz2cJHqe384HRd4Mwg
   Q==;
X-CSE-ConnectionGUID: RSv0MJPLRyaJbeujuB0cQQ==
X-CSE-MsgGUID: gVgDgGYPR3KISwl5L6K6AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78992327"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78992327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:58:36 -0700
X-CSE-ConnectionGUID: 687CrFkERqS0kTfQU8Z9Xw==
X-CSE-MsgGUID: WMD538VjTYCUwISiQuOxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233758075"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 02:58:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKvV2-000000006on-3Eok;
	Thu, 07 May 2026 09:58:32 +0000
Date: Thu, 07 May 2026 11:58:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0:
 label 'comb_intr_p1' defined but never referenced
Message-ID: <202605071119.pNsPqwDR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'comb_intr_p1' defined but never referenced"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Golle <daniel@makrotopia.org>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-misc-fsl-qoriq-mc-drop-trailing-whitespace/20260430-163453
head:   c553182e0670fe0fd68c50cf7dd3acf767475883
commit: 570758ea908d5c36820da86ff3265cea8b9f56f6 dt-bindings: wire example style check into dt_binding_check
date:   2 weeks ago
:::::: branch date: 7 days ago
:::::: commit date: 2 weeks ago
config: microblaze-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260507/202605071119.pNsPqwDR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071119.pNsPqwDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071119.pNsPqwDR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'comb_intr_p1' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'comb_rx_imp_p1' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'comb_tx_imp_p1' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'u2_intr_p0' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'u2_intr_p1' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'u3_intr_p0' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'u3_rx_imp_p0' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: label 'u3_tx_imp_p0' defined but never referenced
   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml (original)
   +++ Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml (canonical)

vim +/comb_intr_p1 +73 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml

9c5fc8e1ac24e3 Chunfeng Yun 2022-07-06  70  
9c5fc8e1ac24e3 Chunfeng Yun 2022-07-06  71  examples:
9c5fc8e1ac24e3 Chunfeng Yun 2022-07-06  72    - |
9c5fc8e1ac24e3 Chunfeng Yun 2022-07-06 @73      efuse@11c10000 {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
