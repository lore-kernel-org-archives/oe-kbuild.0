Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627F338B7AA
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 22:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786919189; cv=none; b=cblOXUhINapc/w6iivCdi541I8vf3melviW/9DKj5Jl7G8cYxauZN26LlexPnAnL58Ko9EUplKaHAR/bwspHOxsjA8nX3YCHb2HP8yUKL/OcUl4xq+sNEBntpHNek/5CcivBPgeTtWbYEtN8ntBo9joDT/Q7K/QjExPH+9gz4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786919189; c=relaxed/simple;
	bh=BSCcti4UCA5qGDf2v9U1L4uEpMvJ+C47IwShF0Qi/5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rM4hMTUUs5lQy7I9dLuC/YxGouR1Jb691bHBnZnUXD+Xqkrf32GK9A2jKaCBfkagWIFuqOxQufAQ2iC6yrxLaRuYRtQ01rXJca7vSuQhhXPEzJfyhvkiiStPG85xsyElQXiizoKnrP68UMflbYLKiwo/BZwcVB1T+TXTqlL1Wck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fT1zOBV7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fT1zOBV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786919185; x=1818455185;
  h=date:from:to:cc:subject:message-id;
  bh=BSCcti4UCA5qGDf2v9U1L4uEpMvJ+C47IwShF0Qi/5U=;
  b=fT1zOBV7mh9AJWeV4LbnW23mZtO5xkNIqk8gvFDVfkKrdUQd94w2R/04
   SJAoHd9VUGglW6rdffJxOw2eD1WkVbU42vrU5t87KthDvnZqshkvYz3kV
   04/BOJQ4cN6+zcZ0R7YxhPLWYG+J9ivIYIb5PHv8B/FsOteyCXAOmkorn
   fxDsh/JZi/Ma7jJ+7Jk2en+XzywRYolFK0ob+5oZx3YMpY/dEn2VTX5X2
   AlQDRekAUuKy5ATX/c4OSRcNA01LnzmNUx34VLBldu9+p/lpLw5MIXO8u
   d7fbQU0J1JDf7pK7XP6Fv63wWAl6sRR7HvstMms82nXiDvin96pOLQiej
   A==;
X-CSE-ConnectionGUID: qgF2YGZwRWiqDEH4+ezeXQ==
X-CSE-MsgGUID: 4FFEQtw4TU6GNf+G/PqWeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98060417"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="98060417"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 15:26:25 -0700
X-CSE-ConnectionGUID: 11zmA+65QjOq8YDHEQ3ceg==
X-CSE-MsgGUID: 958PhhVRTd2kxtIJWKx17Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="266730465"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2026 15:26:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvjJ8-000000006gP-36eO;
	Sun, 16 Aug 2026 22:26:22 +0000
Date: Mon, 17 Aug 2026 00:26:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:agilex5_edac_v2 7/7]
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: eccmgr
 (altr,socfpga-agilex5-ecc-manager): 'reset-names' is a required property
Message-ID: <202608170020.6NvJxizI-lkp@intel.com>
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
TO: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git agilex5_edac_v2
head:   2f6f54c923312196982ca95d84eacc0f23e7d61b
commit: 2f6f54c923312196982ca95d84eacc0f23e7d61b [7/7] arm64: dts: socfpga: agilex5: add support for the ECC manager
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/archive/20260817/202608170020.6NvJxizI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170020.6NvJxizI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170020.6NvJxizI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:152.9-219.4: Warning (unit_address_vs_reg): /eccmgr: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: eccmgr (altr,socfpga-agilex5-ecc-manager): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/edac/altr,socfpga-ecc-manager.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:152.9-219.4: Warning (unit_address_vs_reg): /eccmgr: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: eccmgr (altr,socfpga-agilex5-ecc-manager): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/edac/altr,socfpga-ecc-manager.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:152.9-219.4: Warning (unit_address_vs_reg): /eccmgr: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: eccmgr (altr,socfpga-agilex5-ecc-manager): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/edac/altr,socfpga-ecc-manager.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:152.9-219.4: Warning (unit_address_vs_reg): /eccmgr: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: eccmgr (altr,socfpga-agilex5-ecc-manager): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/edac/altr,socfpga-ecc-manager.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:152.9-219.4: Warning (unit_address_vs_reg): /eccmgr: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: eccmgr (altr,socfpga-agilex5-ecc-manager): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/edac/altr,socfpga-ecc-manager.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
