Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE20F2F25E1
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765881678; cv=none; b=UeM5FpUZcgs/NvqlJZ4MhoIzddEWTOQR8y1bNKvC38MFKb+CxwZxQl6pOumV2ztD4cd+EbCv+v4JmGLRkPs6Z29+lSgyI6i24SPoW/riNPTwW8dENAtpyizvncFuGVxhFkeK8HzwleDjzcW3SIRzaxsN+VOP+LW7ZxgmRGwOJzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765881678; c=relaxed/simple;
	bh=aR1rSVa7xYWE89yrr4dQ8Vn1a2psm+565d39/Y1nXOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ci0PpJCKMj4nn3dfwbn9Qaw8bFhtd0gftiqtKXa3L233boFHGjVlavVvtmibbyngUndXghwREJcv0plqVkWVsprF1L0ejtBiW5awSuJPzfN9ZzsQeBpRlRGqiwO7reRrfGOV8GklcpG4yehp04dIt4rsGXV9RIe6ralY3UTJBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxAVe04e; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxAVe04e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765881678; x=1797417678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aR1rSVa7xYWE89yrr4dQ8Vn1a2psm+565d39/Y1nXOc=;
  b=fxAVe04eBnorWRwx3XmfcYRSRdVRwT1jRKKKH6wyremTHnE2wvo7xkDe
   DsMEBwdCa5Rc1A7siRvBI77WIJOYRgsXdjSRh9BIkVZCB1Fv/+NarAo2V
   6dxEWMSD7DGKRgM40UPhotG5/xN9Kh5MVe7A40gtlp/Fe8v3m5JgueT+A
   KmaNVbLZmCsz0btZ8O4AG5WQMlMju9LUG1Zh8hHPPqR0YNXwJb2Wq2Jdj
   DZHVCOQdOYH2Elt1bPlWSQDiHq0Bgkp5SbzEngah8qvNuzz4RHNqjQORh
   K+Cv/XaPbFE3HVobHQe0k8mAT/nO8uq05pBBpLoVp6rgPJki3Hcawgas5
   A==;
X-CSE-ConnectionGUID: D13lr+KPR+yJ6SfmbCrwGQ==
X-CSE-MsgGUID: obYCkEZaQBSTbC+ObHEY3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67735854"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67735854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:41:17 -0800
X-CSE-ConnectionGUID: k18KW1vsTdi6T1lEQesVQg==
X-CSE-MsgGUID: qA5Mq9BCQiix9KDBH1pqiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197968333"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 02:41:15 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSUT-00000000356-1eek;
	Tue, 16 Dec 2025 10:41:13 +0000
Date: Tue, 16 Dec 2025 11:41:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/3] arm64: dts: mt8188-ciri: Split into base and
 overlays based on components
Message-ID: <202512161156.HiPopAzI-lkp@intel.com>
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
In-Reply-To: <20251208073306.75279-3-wenst@chromium.org>
References: <20251208073306.75279-3-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>

Hi Chen-Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20251216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-arm-mediatek-Add-generic-Ciri-base-board/20251208-154001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251208073306.75279-3-wenst%40chromium.org
patch subject: [RFC PATCH 2/3] arm64: dts: mt8188-ciri: Split into base and overlays based on components
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251216/202512161156.HiPopAzI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161156.HiPopAzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512161156.HiPopAzI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1281.7-1289.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
