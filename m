Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201DA28B4FA
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353356; cv=none; b=g/srpwELwWhOUJAZxf61ann1lotBf+v2XOjeluwic06PIVmQdEUmusNfOEHhYq5GCJbAAyyaVV7ODXumtmRnIBiaTFAiJX4HuOv66okTMjj2DEQi1X9WYhtffXbQ7uCBW8KzjnTkjqpUR3wRBj8tsc5NLHCeITa7O5VuJIdm5G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353356; c=relaxed/simple;
	bh=t52yxMQiBl2ExuiszKwTM6tkuZpEX92o/ul8lmkKt04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SXQU80MM9VGM/Y93uuN+7D72J0n23zYtUr0kgn1LsE1Od/JmyM0ACvYEub0RBhi7GdPqsHLuME8Ga0CsOcLaNcm0194HRCq/EVxt8dsbJJRLiCm3NqncRa31fR6gyOFeaLQrSsLnlJovUr1aBZvS7pYH2AXAYCWPKI6awry8910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUOO4/Z8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUOO4/Z8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789353355; x=1820889355;
  h=date:from:to:cc:subject:message-id;
  bh=t52yxMQiBl2ExuiszKwTM6tkuZpEX92o/ul8lmkKt04=;
  b=YUOO4/Z8XgaWTgkMrDlDEArYpk7vumq+UzXMzNsfE79IAGQek9NbUrIA
   W3j/no1bCKRkAlYAvtXr+Q/6dFDfAFQJ3ZSIP/VFReufK0eMegJV3Wkj0
   ys2+yzfFguI3Nj8+kjUecEIEtRogJBm1gJc+hFh+MiYWc041ZlXf1KWD8
   HyH9hkwI9exsvuwFPxYMVq/E0ifT772KC+OcDUjxF7iJXXgjev6dEse30
   Y39DY6zT0kwjcHsfsdyKXboVxmUY1aSRNn9gW2VhcDAuetvz+pzOinDbl
   oXEmixHAlw0tibFgprKt7TzxsIor3nlhSaOemJwDTZJMRGvszNBJlI1Xd
   A==;
X-CSE-ConnectionGUID: fvKZyY5LTrqzKAniSwUcFg==
X-CSE-MsgGUID: 5i3nKy1wRzy8b/1WsLInmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93532563"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93532563"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 19:35:54 -0700
X-CSE-ConnectionGUID: mQHYIq9pSPKam5ULE0U6SA==
X-CSE-MsgGUID: BgsAdaTQRaW/YfMsv7DeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="748721"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Sep 2026 19:35:53 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5wXv-000000001pz-0nu9;
	Mon, 14 Sep 2026 02:35:51 +0000
Date: Mon, 14 Sep 2026 04:35:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/dt-bindings-indent-consistent 49/62]
 Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml:118:
 example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
Message-ID: <202609140441.aDAp5foP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml:118: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux n/dt-bindings-indent-consistent
head:   9fc9a987c51ef160f05d788d65ba63685ece6a06
commit: b36cd003070582fdc7cadbef808bdef3ecb8709b [49/62] WIP
:::::: branch date: 12 hours ago
:::::: commit date: 14 hours ago
config: microblaze-randconfig-2051-20260914 (https://download.01.org/0day-ci/archive/20260914/202609140441.aDAp5foP-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140441.aDAp5foP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609140441.aDAp5foP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml:93: example 0 [indent-consistent] indent mismatch (expected depth 1 * '  ')
   Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml:96: example 0 [indent-consistent] indent mismatch (expected depth 1 * '  ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml:70: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml:132: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml:133: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml:142: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml:143: example 0 [indent-consistent] indent mismatch (expected depth 3 * '    ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml:145: example 0 [indent-consistent] indent mismatch (expected depth 3 * '    ')
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml:146: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/soc/ti/k3-ringacc.yaml:89: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
>> Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml:118: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:71: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:72: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:73: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:74: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:78: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:79: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:80: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml:81: example 0 [indent-consistent] indent mismatch (expected depth 4 * '    ')
   Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml:180: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
   Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml:154: example 0 [indent-consistent] indent mismatch (expected depth 5 * '  ')
--
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:267: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:270: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:273: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:274: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:276: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:278: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:280: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:282: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:283: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml:285: example 0 [indent-consistent] indent mismatch (expected depth 0 * '    ')
>> Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml:155: example 0 [indent-consistent] indent mismatch (expected depth 1 * '    ')
   Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml:89: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml:247: example 0 [indent-consistent] indent mismatch (expected depth 3 * '    ')
   Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml:248: example 0 [indent-consistent] indent mismatch (expected depth 3 * '    ')
   Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml:67: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml:69: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml:70: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml:72: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')
   Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml:73: example 0 [indent-consistent] indent mismatch (expected depth 1 * '    ')
   Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml:113: example 0 [indent-consistent] indent mismatch (expected depth 3 * '    ')
   Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml:153: example 0 [indent-consistent] indent mismatch (expected depth 2 * '    ')

vim +118 Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml

e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29   97  
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29   98  examples:
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29   99    - |
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  100      scm_conf: scm-conf@100000 {
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  101          compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  102          reg = <0x00100000 0x1c000>;
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  103          #address-cells = <1>;
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  104          #size-cells = <1>;
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  105          ranges;
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  106  
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  107          serdes_ln_ctrl: mux-controller@4080 {
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  108              compatible = "mmio-mux";
e0f946915b23fd Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Roger Quadros 2020-06-29  109              reg = <0x00004080 0x50>;
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  110  
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  111              #mux-control-cells = <1>;
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  112              mux-reg-masks =
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  113                  <0x4080 0x3>, <0x4084 0x3>, /* SERDES0 lane0/1 select */
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  114                  <0x4090 0x3>, <0x4094 0x3>, /* SERDES1 lane0/1 select */
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  115                  <0x40a0 0x3>, <0x40a4 0x3>, /* SERDES2 lane0/1 select */
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  116                  <0x40b0 0x3>, <0x40b4 0x3>, /* SERDES3 lane0/1 select */
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26  117                  <0x40c0 0x3>, <0x40c4 0x3>, <0x40c8 0x3>, <0x40cc 0x3>;
9f3849be6f2f4a Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml Rob Herring   2021-05-26 @118                  /* SERDES4 lane0/1/2/3 select */

:::::: The code at line 118 was first introduced by commit
:::::: 9f3849be6f2f4ae368e61321f135c2734ab6dd8a dt-bindings: mfd: ti,j721e-system-controller: Fix mux node errors

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
