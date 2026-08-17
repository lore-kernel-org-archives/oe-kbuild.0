Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CAB34CDD
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 01:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786929570; cv=none; b=na1R2FjfHUNVSokZPYTD3SvRyvUu79DJfjKsvHlXq8yomF2EXEmXwXS2FjHHw/TMo2twetXrDuLMw3v1zFxTOO7MpFymrrqXBn9Ss1MPNfV9+aTq1RtqUUJdtPe/jRvvfgisaEoQqDx17niA69m5tgUtD9Ak3MoBld4+4zUnY6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786929570; c=relaxed/simple;
	bh=JMqVE0AHBRcmKIFq2q0IJfRZ4kZuJbVYnIfp9XRvYEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRFc886gtHHjeAJQ3YYnbogUKRs4DVAUBPgB4CuHiuh5z4ZKRfhAfkaOyLzROb3cbnUVfvnfReVtNemfIBsyKhV4T443xRgIAYHGOnCSRKO94A0QW7OAAykcvwdzTr8oFvRiIbjjYSkRox90uvOhjoiXrtBGtiR4DM0fqbAxYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVqrjhZC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVqrjhZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786929568; x=1818465568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMqVE0AHBRcmKIFq2q0IJfRZ4kZuJbVYnIfp9XRvYEY=;
  b=KVqrjhZCx4VPjkn1MlFKDoaVrEYzfYTYHxQmrQOm3XNOzCZUm0PWOii4
   rOrezMmjc2fBiHlNs/hln5J9w7e2Xz/r1RqpIIJnpYCbT88zpUdeCIYLO
   DPTC6mifhgrxqBp5Lr3w/LWc2SpKHkHYHp2Eyl/31ZGWysPlCp/3keCwt
   86OQsmUXF/QdzYYHdvcFiiGO4vxlrh7jxNDp1Mh8/X5FUg/w11wrPj/59
   gpGBbVnZiFyCGpJ9+mPIoXLS7tk6sdht2QljIi2/x1W4cPQ/FMp+H8QdS
   sPdiw5tJAkMLA7OnPI7IIn9QNk02pL0ZmI3pHsh6azbF4FE3Ebi2yE+Lc
   A==;
X-CSE-ConnectionGUID: 3fAqFWayTI2UkdnC5Gfl2g==
X-CSE-MsgGUID: bReygJZoTYWvPtYHiQtH2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91217174"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="91217174"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 18:19:27 -0700
X-CSE-ConnectionGUID: 0de7xu4rSmyMNDbtMq492w==
X-CSE-MsgGUID: j9Qk1K2uQWu2dWVcPy/EBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="269972400"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Aug 2026 18:19:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvm0a-000000006iz-3cCF;
	Mon, 17 Aug 2026 01:19:24 +0000
Date: Mon, 17 Aug 2026 03:18:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: agilex5: update channel
 interrupts for gmac1 and gmac2
Message-ID: <202608170303.tLRv4IM1-lkp@intel.com>
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
In-Reply-To: <20260626042541.1091774-2-dinguyen@kernel.org>
References: <20260626042541.1091774-2-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: devicetree@vger.kernel.org
CC: muhammad.nazim.amirul.nazle.asmade@altera.com

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.2]
[cannot apply to next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/arm64-dts-socfpga-agilex5-update-channel-interrupts-for-gmac1-and-gmac2/20260808-023339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260626042541.1091774-2-dinguyen%40kernel.org
patch subject: [PATCH 2/2] arm64: dts: socfpga: agilex5: update channel interrupts for gmac1 and gmac2
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2052-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170303.tLRv4IM1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170303.tLRv4IM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170303.tLRv4IM1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 207, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 224, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 207, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 224, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 207, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 224, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 207, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 224, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 207, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 224, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
