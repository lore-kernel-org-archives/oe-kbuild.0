Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E381A76B2
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722359936; cv=none; b=BqiFA413N0oRCK+rmJgBhoAt7pjJC0zpQEKa55+E1a1H2CuyYmRSHHyiv6NcdJNh5PDbZae36PHInnVulQUswxPhYgDvEGyI9375/mMsR9cQMq7lo+GfuFJ+s5sx5bRien1KdSzQGJ4rHMDEd+DyMef6nlqC07p+J+K+aZoKu/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722359936; c=relaxed/simple;
	bh=nAtEJ43YpDsZPrEHTXsqtRm3KAsQYitcYY2CCr62GKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOGH4jydBOWOJ/G2s6YOHEi843oBHttw5tzxtT7R9HPF5Mmsoai6c/5LFdCGNhlb/oLU2mGRS7pF8ncnIU/hnS0VVRKn4gwPYDM0wa5E2lfLGOp2OMtg0+tpB66IH1M+vFFeQQy6PvckZl/LtyCOQ5gSiMbvoZXU9v1+zUAXTbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsQLrc1L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsQLrc1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722359935; x=1753895935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAtEJ43YpDsZPrEHTXsqtRm3KAsQYitcYY2CCr62GKE=;
  b=JsQLrc1LcjhMatUDQhx5iSaZUKcVl7YMuUuLL+4Nu2el4gagTh9euw7E
   LVXnyXdggh+R022QsMjWzMLsE/IRmRcRwABYWpOsfXCiy73aB+Rk3sCMj
   kklvUBPOUWB6c/WBCu5wmAmpRWXYLheIHQP/Ur8M8EHhJWGNfDr5OcpKH
   RNoSZiHopZ1dM9gav78eipXFCC5Y2wMLKIKc1/sciuWQt7KcmDdu9BfZL
   ENwmjL5GXzXELE9szEs7NVEvwCzZWb/sVUYD2rR/PkLHD/iTAe7gLCtXe
   DAx7Cw8v52ENnxqQrjdqLctQGAkBGQ6tccD43bihuh3S4yknciavIKO2K
   Q==;
X-CSE-ConnectionGUID: br0MQR5pTcmvnR/sVsLAFg==
X-CSE-MsgGUID: RmvY6KP5S8+uilmZJqFqig==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20333760"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20333760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 10:18:54 -0700
X-CSE-ConnectionGUID: oUnyyRBHRlGr8AuIQH1r7w==
X-CSE-MsgGUID: +Xh2EKtKTta2FpKf3o4Myg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="55006600"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2024 10:18:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYqUr-000tA8-29;
	Tue, 30 Jul 2024 17:18:49 +0000
Date: Wed, 31 Jul 2024 01:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.9-main 37/58]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000:
 compatible:0: 'mediatek,mt7988-xhci' is not one of ['mediatek,mt2701-xhci',
 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci',
 'mediatek,mt7629-xhci', 'mediatek,m...
Message-ID: <202407310103.nj1yCQwI-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-main
head:   959c1ad797a5a85d12c6f551250af0a137f9f248
commit: d7acb897a81fb93e2c143d15e356a4ef82148c68 [37/58] dts: arm64: mediatek: add MT7988A reference board device tree
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310103.nj1yCQwI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310103.nj1yCQwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310103.nj1yCQwI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11009000: clock-names:3: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: compatible:0: 'mediatek,mt7988-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: #address-cells: 1 was expected
--
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11009000: clock-names:3: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: compatible:0: 'mediatek,mt7988-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #address-cells: 1 was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
