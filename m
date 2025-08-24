Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4F1FB3
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755999243; cv=none; b=OthunTmO2lTzEDki/hg+qNOQCttMITcSbTg6b2Fo9Y3ZoX81VsTuW+i0UkDRgNrf7XwJASjw1TpxGgDKMjMZ1sP0mKU2EsRJGmbilcmueduC8/vhEcfBrLEvIb1IJpZZ/idPYaomSsylohhP4JhYy7ikMx+5jFSJCQhkFtspV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755999243; c=relaxed/simple;
	bh=hxvM0ajakPEFL3ewZJlHDx4+fRmCWSQ6rQ5qHd0teBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBv+g8LdRiCQYPbWoAw/37d8BxkWRqn7V534wnsTfoWzKz3yEFIZxDDsNFGzB0QNiMBSXH4eTWdT/jUHmTbCLY6BEuDYXr88kRYcQVWq3y2ca/kICB0bJ/5NEwm7miqnQRrLgVhgr2mXXw4vBWQYERvT4A/8Wbl2kVUDlkfNVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncIO8akB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncIO8akB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755999241; x=1787535241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxvM0ajakPEFL3ewZJlHDx4+fRmCWSQ6rQ5qHd0teBs=;
  b=ncIO8akBjVglp0W3jiXgSEeikwEPQwRBNRhYwoR32HdmQZA1oQ6wxYjB
   WqRB2aDKAUdjokjdlS3u8nRTxgVKjEsa814e3O2BDibCp4ELu+nt70qk0
   002KieU6ow373yRvdKUVDZkOv1RJTJdLuJU7u51IA95ANU4AP+HEDr+kp
   +WftzqdJzcVyD12coSljGSJufKVIAWIoKNepyx1d1gzM3/9D86loYAUHg
   sek5JDxqM3TmrWhTN0WpqGl4oRDg7qLxFe0hI7q5o80UfCj3C6LAAApSL
   KgYNmruWyLk1JaKsxdpsYXi2KAK6Aod7yZ2dDkl/3XFrNHXG0YWl1xAUT
   Q==;
X-CSE-ConnectionGUID: bvoGryVhQTWYV3Fz7uEtOg==
X-CSE-MsgGUID: 8K5dNOSzS72yJdiC5QBv4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75709056"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75709056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 18:34:00 -0700
X-CSE-ConnectionGUID: qwJb1Z2QRiezD6ZPGdiStw==
X-CSE-MsgGUID: VRd8tKMtSTy06B4m9sk9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168205436"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2025 18:33:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upzbx-000Mgp-01;
	Sun, 24 Aug 2025 01:33:48 +0000
Date: Sun, 24 Aug 2025 09:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: ata: imx: Add a reference to
 ahci-common.yaml
Message-ID: <202508240923.9S4wpyJl-lkp@intel.com>
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
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-052-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240923.9S4wpyJl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240923.9S4wpyJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508240923.9S4wpyJl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[256, 2, 1, 0], [256, 0, 2, 0], [256, 1, 2, 1]] is too long
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
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[256, 2, 1, 0], [256, 0, 2, 0], [256, 1, 2, 1]] is too long
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
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[252, 2, 1, 0], [252, 0, 2, 0], [252, 1, 2, 1]] is too long
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
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[255, 2, 1, 0], [255, 0, 2, 0], [255, 1, 2, 1]] is too long
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
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[251, 2, 1, 0], [251, 0, 2, 0], [251, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phy-names: ['sata-phy', 'cali-phy0', 'cali-phy1'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: sata@5f020000 (fsl,imx8qm-ahci): phys: [[216, 2, 1, 0], [216, 0, 2, 0], [216, 1, 2, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
