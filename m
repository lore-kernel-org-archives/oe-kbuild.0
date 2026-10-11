Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D978F15A85A
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 05:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791696236; cv=none; b=JpGDY7kqCNVH5hGLFk6tR0TF5kare1vveCVlavQERf091TB3M7cTygNLap1E6HY0POwgcm53iUkRuhca7daEqet6Q1KGbsVR6Si5SZrxCgfjnqsC/yuO2timbQTKhm16KtkM10Uz8eEhJRicnPU8sTlN0X1nwLIOf36tHNdtvGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791696236; c=relaxed/simple;
	bh=1vesvqDyeVFptv+SsyNpLgxJeqtGnLx0XO1W4YtICWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jA6ZpzBh90WjQ/64HG6J+l9bULfk0bu1oBQtfocHovQzJqKHq5LF7KBgMC8SxJUJ73Efgz2Lb3rxVbXygrpZin+l938L/prLCd/DOkkm+5K+deXo7gOGBtDFF52Uuj2v7yjEU0d1pwtIKK9xLNaIBuWsfyIkULzoqLbV4Dv62qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtNbGx9S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtNbGx9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791696234; x=1823232234;
  h=date:from:to:cc:subject:message-id;
  bh=1vesvqDyeVFptv+SsyNpLgxJeqtGnLx0XO1W4YtICWU=;
  b=YtNbGx9SHTNdKsUwOgmvhjd6NYyMIlLA38iu00sCPxTBAXI0iDIghUoy
   inLzPQZaKhiIHc7sf6GySJ/tPqe92Rryx+OKwidiYqa8vtcB2/wcbJb/+
   ggLeE48XhOCbFegVUFhzWAsNLxS45aeXA78jQhnq2n1BFnCKK272f5U9i
   VTyawZBO/ANYdYZzBDOy9+8HRq9ACPDKx0IFz8Zi9xCdUsAKQix4vzHe8
   WOkUQEYBR1UsWZxwG1J3rZsW5x5RNMXGOcDjxP6o0c19Trq8liSuBKbDI
   nzehEG+lHVFxnbT7Z6l8Uvz6wOMNAAybY82bqYClcbQYc3zS5Cwcg9/wU
   w==;
X-CSE-ConnectionGUID: rmWoFYxZTJ+2UCnsrQiMKA==
X-CSE-MsgGUID: E0lkzkPzSPOoYrsutZbdUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="445163"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="445163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 22:23:53 -0700
X-CSE-ConnectionGUID: xpm/dsVeSfanPPJh57Cncw==
X-CSE-MsgGUID: s+Uk94iZQmuJ6HJPt8i07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="936877"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Oct 2026 22:23:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFm2H-000000009Q7-2SzS;
	Sun, 11 Oct 2026 05:23:49 +0000
Date: Sun, 11 Oct 2026 07:22:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.4-armsoc/dts64 58/68]
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: csi@27c90000
 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202610110708.IfDVeGkL-lkp@intel.com>
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
:::::: branch date: 17 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261011/202610110708.IfDVeGkL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110708.IfDVeGkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610110708.IfDVeGkL-lkp@intel.com/

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
