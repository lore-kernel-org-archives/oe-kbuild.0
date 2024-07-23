Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0198913BAD5
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721778179; cv=none; b=fpu/4/mo2UkFV0D7S4snKubm8DzEgEyCcW6Bzo+0jxVn5wJLgDUj/it0znAfXNegXg+xQZy+jDA1Ei1VGj4kpCNPkY+sGdortyEe8eNhgvuG9FYda7RENRutELe2eo3Ffy/MYUtQM5skBtAPUclB7ub6RWpOiPXC2MWiwoC+H6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721778179; c=relaxed/simple;
	bh=v7wVQqDh5i9Es4SQRTKO1TRD2PJlEGoQDRgRzohIv3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+G1TANzY/P/+ns3701YksGHKOKz/iW5Migz7Xt/Zv8bOCwgbGamI4/zxDTe2K+6Lcn5OkSIx9Dt4hjVwiHsIvrvYnoHBxDd6lN4/nDaDvWYM5paEMm4zzq4wOQ8/DUKMRQP/BNX0TSd7NZv5SMYDISGl6Y9xLM7KH5NYNudrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+VigvDT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+VigvDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721778177; x=1753314177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v7wVQqDh5i9Es4SQRTKO1TRD2PJlEGoQDRgRzohIv3A=;
  b=b+VigvDTI1JcwUidwGjoNDi17x8aB4lRFIWlMNdH9PdcBt9L1oNyoAzo
   KU9WbDIr8m7Qaym234dhpqlmvPTTDBOGlrs7/qiFZ6ja/jEVrg5KBlMxW
   SjAxlhNHxlgm5t2eMhnhiUDLxFFkYOlxUAdewJSmht6px9Wa3EQ87lk1B
   /BmnJm/yh0APuKJk3t//xAOGlDy9GKFj0yWC6+jPAor2rWW5/3umQlR7Q
   jr+iR5qqB6j+955tT3X+LhoDqH2ioTARiwAA2CxqyR301R4En+oRzyFTP
   xZDGN49xWosdG5KzHMxvW2s3oEGZrxlPXVkBGYYOcXBUsw7Z9B9P3M/so
   A==;
X-CSE-ConnectionGUID: xUIzPLMpSki4qxgtBeawBA==
X-CSE-MsgGUID: uPq3ebu6SGiPdU2fHr2XGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19306057"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="19306057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 16:42:56 -0700
X-CSE-ConnectionGUID: pybNmBY0QXyDSUCUuP+mHw==
X-CSE-MsgGUID: ZLi4HraXTSilL0uBxvgQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="83406513"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2024 16:42:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWP9h-000mSg-1f;
	Tue, 23 Jul 2024 23:42:53 +0000
Date: Wed, 24 Jul 2024 07:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jmondi:imx8mp/iob-gitlab/v6.9/extensible-format-v6+bls-v2+fix
 25/79] arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000:
 rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
Message-ID: <202407240703.4roBaKWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/iob-gitlab/v6.9/extensible-format-v6+bls-v2+fix
head:   c9e9794a6644f6f903b0a867783d4d1c49e2dbeb
commit: e3a052ed7a909d2f9d7f52992b1ee842745c9347 [25/79] arm64: dts: freescale: Add Au-Zone Maivin Starter Kit
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240703.4roBaKWN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240703.4roBaKWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407240703.4roBaKWN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1717.11-1728.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'nvmem-cell-names', 'nvmem-cells', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: rx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
