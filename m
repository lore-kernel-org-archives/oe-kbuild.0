Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF926ED4F
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003445; cv=none; b=AXs+VKnU1sOoKEIFiRngAtFXg9JRu8WDBkHe9atiiS9kDn4STT8owfQxnbXtMbNS6e4JsYtEvMHrAHCGKb6UjCRlP9MMyVg6mgnVaVRR+Eg1R7kCE54Q8Mm4bHx+anLEzdEWr8L8BDQXfAc9/Zc91FQqSyqPWG7vkDfg/G/+Jgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003445; c=relaxed/simple;
	bh=dRuVlj1at3+5JkS7FVZ+1n8mcM3LQOlUu1+WTruq8mI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tP83DynENqmsYlKs0Q9+MM7+QoyfsSeOoM9WUSWzZr4HqLZwocIQjCcWPl6q/HA3C57ZzNmv9gtajzhuntoL0MxOXv6N8GwyLvY5KDlnJmpP5g8/MNuio/RA4mR5C9eYp4tZ84VUyRRBDNx62bcv9c4sg35bfHESx6O8Ntqb4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMatih5k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMatih5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787003443; x=1818539443;
  h=date:from:to:cc:subject:message-id;
  bh=dRuVlj1at3+5JkS7FVZ+1n8mcM3LQOlUu1+WTruq8mI=;
  b=OMatih5kLBVibYHt6n/KqHQvcf8ST7Co2vypC32Apf4jAkSltsfxmhmV
   ts9q0H0mEfa28h9SNXB0Q4vsdqpEZPHtpj2jG+eePshyzPi5u/WnOjtj9
   xNju3uT5OjiihMe/IG53pLJuGsqIiCNvDokDY19an6cT4Z6j8U/kTGJuM
   W1XWiLfNldTSPdF082QNlS6w++8miYeNQE+VzLAqbAkxxpq3rNzdCNFdR
   1o32IV1v9Jm5wye9a7Oi6R0pSyxPPOhqqWHwKzkxdsvYad0fCzid6TTnT
   OZOje41ltXOeSs5v0oyAv2SdQPqywB12dQ27g+lhHnLKa6/zTRhbXAmgz
   Q==;
X-CSE-ConnectionGUID: TwE+znafSCKqK3YsRgumEQ==
X-CSE-MsgGUID: 8sqsyp03Qs2rJ29jJn3FEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="86607069"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="86607069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 14:50:42 -0700
X-CSE-ConnectionGUID: tLNNnaV3TBGkSk7IY93a0g==
X-CSE-MsgGUID: lMCPlMSKSTaqWQQ1R+KvdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="269322019"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Aug 2026 14:50:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww5E7-000000006xx-0JiQ;
	Mon, 17 Aug 2026 21:50:39 +0000
Date: Mon, 17 Aug 2026 23:50:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@81d00000
 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x10' is not of
 type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608172358.mWGdFUFq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Inochi Amaoto <inochiama@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/riscv-dts-spacemit-k3-add-USB-controller-and-USB-phy-support/20260812-203140
head:   b6366af0c50a292c49c62e395c5e161a001eef83
commit: b6366af0c50a292c49c62e395c5e161a001eef83 riscv: dts: spacemit: k3: Add PCIe device node
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-2051-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172358.mWGdFUFq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172358.mWGdFUFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608172358.mWGdFUFq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80400000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80800000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80c00000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@81000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/phy@81d00000: failed to match any schema with compatible: ['spacemit,k3-combo-phy']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@81d00000 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80400000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80800000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80c00000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@81000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/phy@81d00000: failed to match any schema with compatible: ['spacemit,k3-combo-phy']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: phy@81d00000 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80400000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80800000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80c00000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@81000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/phy@81d00000: failed to match any schema with compatible: ['spacemit,k3-combo-phy']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@81d00000 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x14' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
