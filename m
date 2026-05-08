Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153B37F73C
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231336; cv=none; b=BXK08KQ2axR4dgHe4WZimqMvpOhZhVEc7gbcshwXJTPWThs9H/ROD1AEgEFlsS119I/Kc1sx8v5IvnflylUJGc4deUpF+uYtpcvmHMOTvNKE/v9iGejLkksp06EMa5A2rBBEZZRYvg48yDpXu9N2YQCDaSYXRPvouK0SYFflh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231336; c=relaxed/simple;
	bh=tJPNZnwdaaLktkKkCnCRU/clSfCr5H6WL1V0nYo7d7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iptGa9D/T9bIcYkjhiRGiGuCnAKju8PaBOBQoxUkERjALlbB3FtZ61IQzbzSRTJxhIIv+uysOvMS98Ub54iAzk8/G7jujWNhv2s3VzzwML/+I23co5WXUWo0QsFNNDAYeaEtgDLyL2CQ9vEjZNgf5h9p077PEZgVDTqu9UO2Pt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIERKFjf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIERKFjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778231334; x=1809767334;
  h=date:from:to:cc:subject:message-id;
  bh=tJPNZnwdaaLktkKkCnCRU/clSfCr5H6WL1V0nYo7d7M=;
  b=nIERKFjf2b2VljiS5M2bhQt1AY11gyQqDRPt2wyIPmoRlI7WipZqtmEh
   dnxEU3OJr6Z1G7Igx7edewgV8zPB8i95FnNrtn/L+tykM4IgZgnFeTjdC
   JJqis7l0UK9YkS4hyNoV7dvzcyOR8dF63OFQsuSuDjR1JpCa8sahcCgZD
   ObPGp2Xon4TreXzdoAglz2hDne/uJLOaVPD3Ex9Lc4DWm/EATYciS2bxS
   /qLpRuxYibDcHBOoO8Yg1inNGCwoTL4rAjHqb3M2G4JzLJgwxrOWnG/Oa
   h8AVDCeU9FBaDfizjliOjx31a27HAV2nTIFuo8j84sSGB8bNW+1dNnu3z
   g==;
X-CSE-ConnectionGUID: rRWbYoyPQDeUtbFV9e015g==
X-CSE-MsgGUID: EKHrg+f1Q+2Y/YlXVLg6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="81761518"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="81761518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:08:54 -0700
X-CSE-ConnectionGUID: Z3u2ohn3SQaHdjD/WkoOqw==
X-CSE-MsgGUID: 1pVgw/CQQIenWUrGgNCHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="233661581"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2026 02:08:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLHCV-0000000078T-05g4;
	Fri, 08 May 2026 09:08:51 +0000
Date: Fri, 08 May 2026 11:08:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb:
 pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605081127.h5FTWN01-lkp@intel.com>
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
TO: Julien Massot <julien.massot@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: cfe035d8662cfbd6edff9bd89c4b516bbb34c350 arm64: dts: mt6359: Rename RTC node to match binding expectations
date:   12 months ago
:::::: branch date: 11 months ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260508/202605081127.h5FTWN01-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081127.h5FTWN01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cfe035d8662c ("arm64: dts: mt6359: Rename RTC node to match binding expectations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081127.h5FTWN01-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
