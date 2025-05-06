Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4B1ACED9
	for <oe-kbuild@lists.linux.dev>; Tue,  6 May 2025 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551048; cv=none; b=BPtSy/cOOAmH7HjpLqLnkxnhjeQeiz/xh01/nzel6/HOxrlw7GMZsM/w4T6XWXRk9hGZIjYRApIPBoQ2fFyJ7C1GHEsFgAh/T3bIf+6eaahFv0iadcykC0ojM7BORp1ZMIlqN08iefVFNORikPKRGWif8e4/OTioIXheCq+gTxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551048; c=relaxed/simple;
	bh=DCjFyaE5/cmtkXGs1k+1cWTwSWiOWb+kmvFzpnLERd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3bT1BRhrBl7g4aMkUBPZ5qylcrZxpPmxp7kCrFsw3pdYLjG89xvR9qzVGRs1dtZYOjlfXIgNq9L5tK5MCB1jxrZbo5NQx0pCHJPSB+q1AybbgYADWAl6xEMWz2fxCcuejZFfmC2VJApDNLLVPJXuwHTOAc2veTUpKwGbfEiElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JU681buE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JU681buE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746551047; x=1778087047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DCjFyaE5/cmtkXGs1k+1cWTwSWiOWb+kmvFzpnLERd0=;
  b=JU681buEkzP9G3E2uYshdKJSgBOAHMnKzIHKkzBTvXM6mNZp+bcikwli
   J4tTVW1SVoO/zhX8XSuvWkCzNSOjNvhTY62uCekL9djwDfodVcX+zGrN8
   lFMzmJxfk/W3dqzHptfdWU83pLC2U/nPPKNoFfiq5iiOjrH2iufZTJj0j
   BLWiLqhhMq8viHr2nshaa6sqU3V3W2sqnFD2IQERktqeiXXUIw250X+1Z
   5KubNKOE8oNw8xoUrStSNlpmJlbyJcV5DF6NH4Q6WM/vBfByITLPVDeR3
   ktWIdd8eC4dgTbZwDMqz0brpnfjE3vkiqt9R8KFpsdj6QmkdPHFvByeN8
   Q==;
X-CSE-ConnectionGUID: d2VNfPBXSLWxNux0Ph3Vog==
X-CSE-MsgGUID: 0colCh46Rt+XhiUELXhgtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51884943"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="51884943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 10:03:44 -0700
X-CSE-ConnectionGUID: iHQgDbd5STiXn3FE24Ujhw==
X-CSE-MsgGUID: znMzRg6KTCCxVoPx+2Svaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="140793320"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 10:03:42 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCLhk-00004M-1S;
	Tue, 06 May 2025 17:03:40 +0000
Date: Wed, 7 May 2025 01:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@1f
 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
Message-ID: <202505070125.cf5f57yG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Wunderlich <frank-w@public-files.de>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01f95500a162fca88cefab9ed64ceded5afabc12
commit: df768350a87031971a3c834b480aef6ad6f1f1a0 arm64: dts: mt7622: fix switch probe on bananapi-r64
date:   10 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250507/202505070125.cf5f57yG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070125.cf5f57yG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505070125.cf5f57yG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mediatek,pcie-mirror:0: 60 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): Unevaluated properties are not allowed ('mediatek,pcie-mirror' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@1f (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
