Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19686334
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 04:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776140760; cv=none; b=XEUGLugq7q3sPZ138J2wuKT/BwaJwlR9YlKCNTj6Ni9cPfhFGQIHK17ZqQVy8Eu+0c6U41VgMh3pV6sz6m2KrWlqs20DU7yGuNsnOBywOyGno2ngpo1DRWfK8xltsphZ6D6bMy6rQ7m4VrwzMYA+DeZAcBDTAiCGu5O+v0b7t3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776140760; c=relaxed/simple;
	bh=P58uHog1cVPXKIU6k8ye2MF1TQj2Zt/5KMQ6uVX3U5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewdyPirTNLay2PzZqZqPR+uBy7F2fDaQva92+Y5eEt7krU4599OpMhvm2LAuQX0oDW+8JPQ74BtLfHTBAFALbrnBVJ+Xwl8DDyIjHqxFCjSV0Iaqtsjw7KbnhVfME7G4bpSNyzFR269x3w8qQlXJBpmZPrOPAEOYdN4fSU6SCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gV87+C7e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gV87+C7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776140758; x=1807676758;
  h=date:from:to:cc:subject:message-id;
  bh=P58uHog1cVPXKIU6k8ye2MF1TQj2Zt/5KMQ6uVX3U5E=;
  b=gV87+C7eu38XpHvDyxUK/A4ZQn1sGKyznc6XgJ81T8GFJqtg8IITZKsg
   4FfKmGlDZkhSDoAvWz5JugNPAH9LDOptLiH48Yna5x6Uc6XWjnp6m1P9M
   KfQZiWYZ8+AtsxjLQsxWjxVUHPw57htAGp/BdTBRiOPIB6AgaByqm5l2l
   HRM4jnuZB8szWcIcHDClM0sZ5AWETEmo4Xw7eicNXi0dHfiMD89IgIm4F
   uUoWEg+Ibz4s0X4diITBNaXVHtt4MgCXzY9IEJKxPRy8WpA4um6G6AiYd
   OA5Vhce00TuRZDfG+xu+Glcmx82EBkhU12L8TMe+Pax4DJB5al3BJNOdS
   A==;
X-CSE-ConnectionGUID: qxySWHtKSC+0YT4v80OQ0Q==
X-CSE-MsgGUID: yimnpSGuRaSJ8dSxcGTmpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80972457"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="80972457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 21:25:57 -0700
X-CSE-ConnectionGUID: SwL15NKSShmAEkJa7e1IOw==
X-CSE-MsgGUID: pOUfPMRyQBGIouo2aUhwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="229095696"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Apr 2026 21:25:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCVLV-000000000JB-49J3;
	Tue, 14 Apr 2026 04:25:53 +0000
Date: Tue, 14 Apr 2026 06:25:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0',
 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes:
 '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202604140627.xcZN9GzO-lkp@intel.com>
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
head:   fbfb6bd927c9ac6ea155471cc7ced8e16b37c2cb
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   6 months ago
:::::: branch date: 79 minutes ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2051-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140627.xcZN9GzO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140627.xcZN9GzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6bd92bb2047 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140627.xcZN9GzO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
