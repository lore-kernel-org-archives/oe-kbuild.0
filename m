Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F9A84E07
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 04:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756009489; cv=none; b=InxaJKT3H2Gpv58WPOMPAk/pQuzU3DVY53voMsAVoyJMYCirHSMEmxPaqn1/3ZNtrKdLu7kpO8a/JdOM12B9VZW2qK1COHGM9PxmexwcyREfXvGRT7MH/lXDKIv9vWLjSptv9AlESMpLC+4O5a76CXVorlF8y4ONvzFv3gywtAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756009489; c=relaxed/simple;
	bh=KcMVgmT162pCMcgHK66pXMrxnUT6dEnOte6vsrQX6WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mv6Ub+LWMlJ1ZBS0ldD5haFfnZKRT4tOF/OT1i4zLs3m9dPOfhrwHYJXZC8Ph7rjSJCOd4ZJ2mBGo0YLVKLMv7I+54+MIdTbgnuyATzttC3BDGgRXH6mDEh0nSD9mcOmW6qJlki2DW8YXr4ZnOh5rAhHZxf2q884AxKm19tzoKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn63PYji; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn63PYji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756009487; x=1787545487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KcMVgmT162pCMcgHK66pXMrxnUT6dEnOte6vsrQX6WA=;
  b=Dn63PYjiCsIt4ngdbsTdNii3G45tASy/ecuGRaxMShnRinZ2bYQmRX/h
   TeOP2YR3LcKHiDESc6kLukq2qVODNGJKnz5GBwn5bv26uvYoLrgvG/LQP
   QXeyukZU5HRHKu7XHoYjNREEhoj/v/QQ26mk/4pG6bDdte3johHAs954A
   y4xZipqJFtwqFBcl6X4Dcyo8q0vB8K2SWQZhRlVBZ2fpJUvIo4WPGUCp8
   ZlA+UQJC/gh+oGso4jhl67fgeTQjc3roZf4mREl46tO/vXZujkvbA0QQd
   S8A1/eHZZH57ryR1KPG3w66d0wwwmHRNo8JWQnsQmtKPGWDB3Jpbfmvy5
   A==;
X-CSE-ConnectionGUID: BHOEo55mSrmXm0CkbK+f4A==
X-CSE-MsgGUID: iu02OrrnRp+8uAwr24L9GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58179530"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58179530"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 21:24:47 -0700
X-CSE-ConnectionGUID: 4tzFLEY/Sc+Wh8Ce9fOVfg==
X-CSE-MsgGUID: DnuSLCzWTAi3hJKFpiZYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168534066"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Aug 2025 21:24:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq2Hb-000Ml1-0P;
	Sun, 24 Aug 2025 04:24:43 +0000
Date: Sun, 24 Aug 2025 12:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: ata: imx: Add a reference to
 ahci-common.yaml
Message-ID: <202508241258.95Ql4tpH-lkp@intel.com>
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
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20250823 (https://download.01.org/0day-ci/archive/20250824/202508241258.95Ql4tpH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241258.95Ql4tpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508241258.95Ql4tpH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[255, 2, 1, 0], [255, 0, 2, 0], [255, 1, 2, 1]] is too long
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
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[255, 2, 1, 0], [255, 0, 2, 0], [255, 1, 2, 1]] is too long
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
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
