Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13791D5CD4
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755992312; cv=none; b=m/jsGgn2LoFRg1NQ/SoSJ7C7pbi+BxqrmnZBj1bTSHlllAtNwjrLLmAUZTLrDVC0eMY8cekRgXNGZBCFhqiKV7kxwnAJAf1zLXRWRWGsiI0K0MVd6WydCJQTC0uNs9hNEgiSlw2vQXW3TxY3/tCS8pTgHW0L8T7M88Y9f53v5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755992312; c=relaxed/simple;
	bh=sVF3aYLoXLFA91wXmeMWxxMl+7zEHGOgvwknrfhF68k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QnrancTxMiuQmLYuWdoQnZdMmjuO/lIZEygbY3mqOb0RMjdPaH4HieuarcDNhbGECef3Nda9J3RR6Nj0IOF9rSPNbInlaWyK33NTTvrdz4Bo0AmCNHKoo9OY+F/GpDYz+PYnQV+klrwFoErmPvYd3bKsEn8GjwDP9/5KMWpXLrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKs1QOgW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKs1QOgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755992310; x=1787528310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVF3aYLoXLFA91wXmeMWxxMl+7zEHGOgvwknrfhF68k=;
  b=FKs1QOgWI6RCTa8vehC2aP/ADGhfbRMfHRxd+tpauUOLR4CMCP5cuvdT
   bmKw3CCBvPGesgULH2ULojD6Lg2THVHE2/bl5dH3JsD5C1XI6pAwB0CP5
   9d4adF4WjoHUHeNACZ4UIGvDg9ya091ovTIoY+uQujTG9eQoYszXix0Yo
   +ga99DiWtKUKrhiaTcicZ/YQOmWkqlYg/Qe5fCfTj7oZpnZsSzDTnQ6ox
   BggY1reCCQC5bnknocd8hpLFG2TwXuBp8upsAg3yGCuSNotQkteWjh5Wk
   eFjkVeiK/0U/P+lnUhFIWW4ulUD9uc0rqUdGTaGHI6Xhxf4Pj4ew0fwTv
   g==;
X-CSE-ConnectionGUID: jZFNzBXvQyqcn0wRFGLxmg==
X-CSE-MsgGUID: nIadrgL+Spqv+310K0Ck7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62068546"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62068546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:38:29 -0700
X-CSE-ConnectionGUID: 5t7T0YSbSW2wkq6anCpr2Q==
X-CSE-MsgGUID: u6/Fn61PQbSxtVC9h8r9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206145699"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2025 16:38:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxoJ-000Met-1O;
	Sat, 23 Aug 2025 23:38:19 +0000
Date: Sun, 24 Aug 2025 07:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: ata: imx: Add a reference to
 ahci-common.yaml
Message-ID: <202508240722.8sMEscQw-lkp@intel.com>
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
In-Reply-To: <20250822175830.91682-1-festevam@gmail.com>
References: <20250822175830.91682-1-festevam@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: cassel@kernel.org
CC: dlemoal@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-ide@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: Fabio Estevam <festevam@gmail.com>

Hi Fabio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-Estevam/dt-bindings-ata-imx-Add-a-reference-to-ahci-common-yaml/20250823-020351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250822175830.91682-1-festevam%40gmail.com
patch subject: [PATCH] dt-bindings: ata: imx: Add a reference to ahci-common.yaml
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-053-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240722.8sMEscQw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240722.8sMEscQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508240722.8sMEscQw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[256, 2, 1, 0], [256, 0, 2, 0], [256, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[256, 2, 1, 0], [256, 0, 2, 0], [256, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[252, 2, 1, 0], [252, 0, 2, 0], [252, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[255, 2, 1, 0], [255, 0, 2, 0], [255, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[251, 2, 1, 0], [251, 0, 2, 0], [251, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
