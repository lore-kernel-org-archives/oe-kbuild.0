Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC6201004
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766253107; cv=none; b=faVHtAShrICt/3A6cX9YV2gzG8N+EsLDIYspht6ekfdYzx+0uCjJ9KCVUFP3bGFwfR6KTQIORRqV6fju2Wg771ZIVOM32h/j/IIU7tWGXSGTybulhfJUrdmPE1i0+LVG84n6kwJWC11nqfvsqD76CCZjMZEPsU/q+raepKPMX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766253107; c=relaxed/simple;
	bh=PCMpNXmpCzihgtIkYGvzTBWfSXW+KTG9FVzDGSGSkNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BtJzO8zdoP5pySRgf9YmQW/aMT/K2440dr7GsRigteiKkcyl2uZSWn4QYnAt20jvpXfSljYa2Ihci43Bpbi0i2RXedccE6iEbrzMe7MlkkVV1Xht/szw/+1F94NLkegbwIwh//wwqomyvCY+BouiQOGcgPcSBle961pfO6f5o70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/zicgo0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/zicgo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766253106; x=1797789106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCMpNXmpCzihgtIkYGvzTBWfSXW+KTG9FVzDGSGSkNw=;
  b=L/zicgo0Ded0ZFrEuFWfb3OEKGUJRGX9ZhC0kv2PTxEaJPmjgd9Cw6nJ
   75a4sOwUflJV9B710RZA3RfjRP9SPNd7izp4yHZUzU9/n2pftcfrwd3pI
   HaIzjSLKQZnLoYPQcCdw9Afv4u7wsO9QXChBgZ2J2PgQl4t06uuSZOHjb
   qX/oQipYngmfxcGcKetEuVj8pEmDHXLv+yFdBLFprRio3wtC/97c+9vOF
   g9rtayMrWHnX0zewSKJYErd9g2Dls9H6Z9mWixGb0chVPgzFVOh9W97JW
   k9rhC8x6hrAmsH7BMAgjqK/Xcg2XOSCO5Rv5VygWsSs5eMkjJrtAYcANM
   w==;
X-CSE-ConnectionGUID: ZZi+hlphRbKFe4JkPXGrpw==
X-CSE-MsgGUID: JZA9HDZKQE21H2TnKqm7xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79634326"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79634326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:51:46 -0800
X-CSE-ConnectionGUID: 5O50tWluRGaQMyG6We8Ngw==
X-CSE-MsgGUID: 0zKGDYAZSb+YxI/VAHe5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199389661"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 09:51:44 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX17G-000000004j6-2eJo;
	Sat, 20 Dec 2025 17:51:42 +0000
Date: Sat, 20 Dec 2025 18:50:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mediatek/dt64 11/27]
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match
 any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202512201840.Pqy833QR-lkp@intel.com>
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
CC: arm@kernel.org
TO: Mateusz Koza <mateusz.koza@grinn-global.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/dt64
head:   9b2d2beaefcfa17259fdbce16d59d660894147cb
commit: f4d1eace54f7b12369935a698af29bca7cf3db49 [11/27] arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
:::::: branch date: 6 weeks ago
:::::: commit date: 10 weeks ago
config: arm64-randconfig-2052-20251219 (https://download.01.org/0day-ci/archive/20251220/202512201840.Pqy833QR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201840.Pqy833QR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512201840.Pqy833QR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
