Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154032E413
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 00:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771201761; cv=none; b=Yf8mkpIY8Qd+oMso4r5L3g5/xdXrTqUKaaghMsmCzk033hKQ7XUNZ4U1NkXXxT80qcISO4qQ5Ep1NOW64OSm8OMQkDjSmSLWADFfnAA1LewLEMApspn7Z6cI4ZywcbaRWsj2sBllS8R7bGumYnp/p2m3qRWOYoGnOuZcSJOV4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771201761; c=relaxed/simple;
	bh=hGs1qN2pA6DsB/BIXrosHd2OHmKCV9Sld79v6qR812Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U3ehalnB5y69Wqc97QzJKabbpyGGot6Z7cDSOWuJv7k80Fni2GOmKXL0UQ41QkvEJrDV/lzQXXY3T8FPSV7LiQwjwAClRC1wBgGYAkunRGabqKwDs9feDJ8hPR+VIgaBIPxRJHK+TuGjs7LA/2JCco9XP3wzi+4QtLMCtkvlV3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+5kR6gu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+5kR6gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771201759; x=1802737759;
  h=date:from:to:cc:subject:message-id;
  bh=hGs1qN2pA6DsB/BIXrosHd2OHmKCV9Sld79v6qR812Q=;
  b=I+5kR6guYDWea/3sRX4hhfeJSQC8R1w84IS7QOUHT7IcKnRwMdEWUDSO
   U44fUnxnk8uOwibSpuOQ2l2s3tYIWvVpnilzSlne7fw9dq79Uck1YsQTy
   Y8X4Rx+TRlBE3DKUanBAzfBk3KR5Wb5TycGR8mVgQEeE4r0vOHC+uy9TQ
   Sd3koGvREdwZytPQsPwU9CBopn5fQLISZL7cDpm4xpzoW2NEDhD1ZFJmY
   wTduLezTlwARi19Yhsns8iiUmbXNmiwAqd8wkQABrUQKhmvrTE5DVq00r
   rowzU8nUthuCn7SpclsQNfsLl+wEDLiCTIej4aO61J2d/kyWb07nwMsDp
   Q==;
X-CSE-ConnectionGUID: LHc05zCDRCS9CcIEU5skMQ==
X-CSE-MsgGUID: 8F9RYb5tQ9+VnJJtj+uy/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82923364"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="82923364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 16:29:18 -0800
X-CSE-ConnectionGUID: AZqcYarvS06pNanDGZrjWQ==
X-CSE-MsgGUID: frf9h4Q/R8i1X6P8L7V79w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218008730"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 Feb 2026 16:29:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrmUF-000000002HN-0MUB;
	Mon, 16 Feb 2026 00:29:15 +0000
Date: Mon, 16 Feb 2026 01:29:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202602160122.o6LTcchQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Macpaul Lin <macpaul.lin@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2051-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160122.o6LTcchQ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160122.o6LTcchQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602160122.o6LTcchQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
