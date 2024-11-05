Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD50F3BB21
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775313; cv=none; b=T1desfNq+fuA4nJrqmS5bu8YpXR1IfewKJEcl4QcgHC5KbS7iLjasVPU8RKcXLFRkY5xZy0oYJSD7NC5h55RLPTQWR5t6+QeRvyaZb1CNqunDc625uxrUxUoWgUeTWEAsJdFqzwr/7vIYH8i+0neHHNwe1NOK0YdPktZCNdvTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775313; c=relaxed/simple;
	bh=l323Vj/T+iJtOZ6tDqOXeJzsqzGFrM69xu2d0xJ92hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/cLZYzZPu9a7jK12M6aqHN3u97ihv/f37lKML7nDkNDPXPFy/gE21UH+cXPtMpplD87lO0S1RsXbIgrOBuxbKRYJNGVuinknwH1NUp0VcgShY6Iv4DSblwawsLdpIYZ/t3Jm1/wCN4Zjw9LL+Vf6vdOX+c6f2n7Id4S/F44HgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQji3VRb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQji3VRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730775312; x=1762311312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l323Vj/T+iJtOZ6tDqOXeJzsqzGFrM69xu2d0xJ92hg=;
  b=NQji3VRbXRYrUml0AKO4CHjMERjDsKaNndMPGGoynkPTEmUKGYMNFF3g
   zd1d5eMcNkP6PYAqLBdHxG8FpbIKXslRONld/vOv/DVJ94HZm6ks0UuOi
   OnvF+wrsPRQBKUlsurOcAMAgbYIewQz8xMqOmmMv6at1gy/9/AXH+o/to
   P/8N+N8L0X0KIEWw/BCPcQwzx8qKm178V3ImQvkO/rsJsw5wSYgw4ZvVy
   bPeI8qWx0UxyV+BrEJFl4EmVzGLFExyRLVAxkKYxtO8OdtMQVFQJMBshL
   VEfg8XnLiPj/grgFbWsFtYVjo0xA0wG+xmAsqfrVn1orX20blZGPLkMKp
   w==;
X-CSE-ConnectionGUID: XHxOeX+HT5Wp041jk75A1w==
X-CSE-MsgGUID: DGXn6bfZT4GKHSk/YLVDdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34192334"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34192334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:55:12 -0800
X-CSE-ConnectionGUID: KDdHoy42SI6+JzUncJQaYQ==
X-CSE-MsgGUID: IYB6q+7ERbCGmAmMGLYJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84185452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 18:55:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t89ib-000lWP-2V;
	Tue, 05 Nov 2024 02:54:57 +0000
Date: Tue, 5 Nov 2024 10:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 62/92]
 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: usbphy@5b100000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202411051048.2AcAzpUc-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Xu Yang <xu.yang_2@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   6c5789c9d2c06968532243daa235f6ff809ad71e
commit: e76d3aee909f24c09bc2b7851bab87356e2fe34d [62/92] arm64: dts: imx8qxp: change usbphy1 compatible
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051048.2AcAzpUc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051048.2AcAzpUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411051048.2AcAzpUc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
   arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: esai@59010000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: usbphy@5b100000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too long
   	['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy'] is too short
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx23-usbphy', 'fsl,imx7ulp-usbphy', 'fsl,vf610-usbphy']
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx28-usbphy', 'fsl,imx6ul-usbphy', 'fsl,imx6sl-usbphy', 'fsl,imx6sx-usbphy', 'fsl,imx6q-usbphy']
   	'fsl,imx6sll-usbphy' was expected
   	'fsl,imx8qxp-usbphy' is not one of ['fsl,imx8dxl-usbphy', 'fsl,imx8qm-usbphy', 'fsl,imx8ulp-usbphy']
   	'fsl,imx23-usbphy' was expected
   	'fsl,imx6ul-usbphy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@5b000000/usbphy@5b100000: failed to match any schema with compatible: ['fsl,imx8qxp-usbphy', 'fsl,imx7ulp-usbphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
