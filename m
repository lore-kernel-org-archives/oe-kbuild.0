Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8937CD41
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 23:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781306297; cv=none; b=mhpNxdfrnAodVSYu5bCIv1/QjG23d62dfiW2drzS3SYXfU1FCoHeFisgKNmOvTcnpgiuKE1Ez2FPRZEdqoi4lf2gilIG7REQVSKAv3d7qzqEnDHOzqVBzEnUhTwY0ErbBm7nwHzeWioQ9exERWAw+E6VbwoW7hXegYENeMXMDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781306297; c=relaxed/simple;
	bh=BlluvCW8qlMt96JwXD1E5f6GrC90LJvSClZZoY9IMjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I3YyZyE6Mw7ZPa5D+F0NhxUfF4BscLle99873KCVVXbtLV0FapP9HheiYsRKyhwxVnDk7oeGdPC1HVyBBATEKVF/64+9Xn1WQhEBzIOC3/v6ELrHiNrWQMj7idksHtX6BQXCijsLsMhSAqRS194LOJuBGrqIvUcztLViF5krjbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntwoocAR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntwoocAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781306296; x=1812842296;
  h=date:from:to:cc:subject:message-id;
  bh=BlluvCW8qlMt96JwXD1E5f6GrC90LJvSClZZoY9IMjs=;
  b=ntwoocARfyDsmXVvFMEw2XWzKvt5yed2O7CiUhFhhmF530TZizReRRs4
   9FPRd1oaV6It8Kh1O5GhiWQy1JPJP/NCiDHhWOR6m51hGJ9yIRRFJ330n
   SuDeF6D+GDcGf0JJ0SlnC3OgUQegD/rYXdv7smPxvtXh8/DtFrIpOiHBD
   8D53Su9uB8EOOxNvK7oy0VKlBrLt81PZBxyFelMrlAKAy1x/cUDLDmKDR
   krgewJRrmg58Eum9utG0pCZWr2kA7g65RwLbhcgivD2F3tnOTYRSO2tvy
   ntVBeuf4QO0FgzVgx4mbl5MIl+3F0GI0StL5F4IOmKt3SVdRX8V/uXO+f
   w==;
X-CSE-ConnectionGUID: dNc4gYWkSNi380s4JNqb3g==
X-CSE-MsgGUID: xNYYDe20TT6Sk/0fnU+MTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81992756"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="81992756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 16:18:15 -0700
X-CSE-ConnectionGUID: jlrSDUVoS3SyNmBk/y8Lww==
X-CSE-MsgGUID: PljOY1AhSzSN7jLrY4jimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="251221666"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2026 16:18:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYB8c-000000004ML-3Jyq;
	Fri, 12 Jun 2026 23:18:10 +0000
Date: Sat, 13 Jun 2026 01:18:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v7.3 10/11]
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000
 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq', 'tx-queue-0',
 'tx-queue-1', 'tx-queue-2', 'tx-queue-3', 'tx-queue-4', 'tx-queue-5',
 'tx-queue-6', 'tx-queue-7', 'rx-queue-0',...
Message-ID: <202606130125.n8KzeTCA-lkp@intel.com>
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
TO: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v7.3
head:   43ab793fb649a09c0b142075139fb88e73b4ee51
commit: 593856147ef292858ed5569bb5eebfcaeb932577 [10/11] arm64: dts: socfpga: agilex5: Add per-channel interrupts to gmac0
:::::: branch date: 26 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-2051-20260612 (https://download.01.org/0day-ci/archive/20260613/202606130125.n8KzeTCA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130125.n8KzeTCA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130125.n8KzeTCA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3', 'tx-queue-4', 'tx-queue-5', 'tx-queue-6', 'tx-queue-7', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'rx-queue-4', 'rx-queue-5', 'rx-queue-6', 'rx-queue-7'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4], [0, 202, 4], [0, 203, 4], [0, 204, 4], [0, 205, 4], [0, 206, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3', 'tx-queue-4', 'tx-queue-5', 'tx-queue-6', 'tx-queue-7', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'rx-queue-4', 'rx-queue-5', 'rx-queue-6', 'rx-queue-7'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4], [0, 202, 4], [0, 203, 4], [0, 204, 4], [0, 205, 4], [0, 206, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3', 'tx-queue-4', 'tx-queue-5', 'tx-queue-6', 'tx-queue-7', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'rx-queue-4', 'rx-queue-5', 'rx-queue-6', 'rx-queue-7'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4], [0, 202, 4], [0, 203, 4], [0, 204, 4], [0, 205, 4], [0, 206, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3', 'tx-queue-4', 'tx-queue-5', 'tx-queue-6', 'tx-queue-7', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'rx-queue-4', 'rx-queue-5', 'rx-queue-6', 'rx-queue-7'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4], [0, 202, 4], [0, 203, 4], [0, 204, 4], [0, 205, 4], [0, 206, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupt-names: ['macirq', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3', 'tx-queue-4', 'tx-queue-5', 'tx-queue-6', 'tx-queue-7', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'rx-queue-4', 'rx-queue-5', 'rx-queue-6', 'rx-queue-7'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): interrupts: [[0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4], [0, 202, 4], [0, 203, 4], [0, 204, 4], [0, 205, 4], [0, 206, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
