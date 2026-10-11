Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50937353A65
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749677; cv=none; b=lHThOWZ3fwpbEvOPVhbjoiEEvcCA399bfDo7u5PwH/uJREWtCWOmijD1iJUZOzM/BzW9o8S/NQvFRBjf6J/ZJ5XC6970FsBn9NlMK1zbRS/4576/xz4Vm9S/S60OHygSZkAzUueZxM6LrRw+dIHo3QlB3a8SA26vS8fOaOf4GhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749677; c=relaxed/simple;
	bh=Yzfp7nBOjWxb3+5v68ZjaFOZde8VJC+k4jeeayi1DsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DpPIczhLzh0MTfbzUnAon8+nEOvYxFj6MLeeGuf5xeaWHLMZR5eqsc9IZXYAOKP9g0XlZqgV0DfllWIa0lx2xiAsIdT9ydW2Bw+0InYAcnf8wXXsD4+lIgNpaSTG3uXgYhFGpEHQ208QA2RH/i1Zw8G3JBEbQznw3aquL8FJ+mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNADkj4W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNADkj4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791749674; x=1823285674;
  h=date:from:to:cc:subject:message-id;
  bh=Yzfp7nBOjWxb3+5v68ZjaFOZde8VJC+k4jeeayi1DsM=;
  b=jNADkj4WG/wYXfEFs+3inCVOWk2yk3+MWCaFITMz70q5pA3Uiwpi7v0D
   Ay1Luu4DEn1RTgTgomh/im9XesAqqiYOoQn3CXPp/F231BqDTo9Hvwl0g
   soRfv5DMKEfrXaXFVhxt0VX0Zr5gWd4NPDQsvd0Sa9wZQv4/wspSw66Cl
   bVKk6Q0rHzKgdYw+BM6STIznx9Q8VS6TTxbfUhNPhCGmJWNjCa05FlY4B
   F2kAAHVZnKBjRu6ZEQHjzHv31yhOD7cZU00C3OxB8wHvae48YWz9yXkMu
   1K8OVWdgkwOGZ2luyh5Vj+y0SxvgqeqcJfyo3uFHdn8X7PvvRJiDhqEja
   Q==;
X-CSE-ConnectionGUID: FWsskuMlSn2Izpvie0k12g==
X-CSE-MsgGUID: d1dvZpjFTUS6dTOV8mGOzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="479413"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="479413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 13:14:33 -0700
X-CSE-ConnectionGUID: Xl/NDFoKSbmG85gKHk9kWA==
X-CSE-MsgGUID: ZepD79apQ7aBh2op3z+ZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1193649"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2026 13:14:32 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFzwC-000000009e3-48FW;
	Sun, 11 Oct 2026 20:14:28 +0000
Date: Sun, 11 Oct 2026 22:14:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.4-armsoc/dts64 58/68]
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: csi@27c90000
 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202610112225.FULWvbSZ-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Amin Gattout <amin.gattout@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Riesch <michael.riesch@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.4-armsoc/dts64
head:   ae965b9856f033145e292b0c29082a26bcc45efd
commit: 5a610d237f689cde0a37a8fb3fb7c5a47fef0f84 [58/68] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576
:::::: branch date: 32 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261011/202610112225.FULWvbSZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610112225.FULWvbSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610112225.FULWvbSZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
