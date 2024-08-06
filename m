Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF022AE99
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961053; cv=none; b=DtvJg8IdYh6FUKtxP/1lF3MOg7GS0jMVqKWh9jwXgEF+bcG8/4hr7SGEfsAStcMd06WN23rD/dn7mr0ngAg49U2Qg/OlBM3GIBNWrEJajxkuCnJFzoTb+sOETrXfYLee+/ebMKLA/TDkDg6mrODEyNNRGWuPqdYPdkoxMe7968w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961053; c=relaxed/simple;
	bh=5oyQO1F14YArVbkw6DQsIuzFNZpotHi5i8ETveoxMkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZ9dTYJrF3iW5/dnk2U/qWRR+6VQBG+3sVLzfAGfyMfLikSuikaGb00mpd9634rq7XK0UFermteejLhAEFblgNPGAqu6FFjKyntPOIuRON/ldTGvFYK2Upna4ZNMgFJcd4kRhOUQBVRsOiW0+RtzVWvWrUXMx81r6y3ddfnQ944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpyRN+Ap; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpyRN+Ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722961051; x=1754497051;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5oyQO1F14YArVbkw6DQsIuzFNZpotHi5i8ETveoxMkY=;
  b=dpyRN+Ap/21Sexyd4STIFWZVEiNMO6iOwEt6ho2fQLhY0Gt9RVlyYJDa
   JF2O88g2ZLJ2RM/uj1d6PTWFhEq0/dAwUCfcoixUO4F5HUHud2yp1bgNh
   B3iHuDPeRBlkWz7YunEZ8v6WiVwNXDjIqkjfuHmeQ6m6ouf5/tM5+8I+G
   Zga/Wxi0A0qLcpyTu8wcaGyBhZJ10vIXBmiQgIizsJh5Bf/LMlTwHP7lN
   x8ftry6KPfdl95WF+sd25zIx3LHJEcjmK6N3qrWO+ysP6jzgtBPnDAfvF
   ESP+E/rnhlf7yMTw4JfLsVeZF0HCMGgd7ZNRdAD1rmaheGvWdoUsiMoHu
   w==;
X-CSE-ConnectionGUID: UW2f2MJrTtKWyKrxxYBh2Q==
X-CSE-MsgGUID: LJ3B5XQxQnyQtjW+kleNdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20804758"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="20804758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 09:17:30 -0700
X-CSE-ConnectionGUID: WRnM5Qr8Spap19XsK75WuA==
X-CSE-MsgGUID: 2hsZ6b59SvarVY5BeXJ0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56781450"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2024 09:17:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbMsH-0004e4-1X;
	Tue, 06 Aug 2024 16:17:25 +0000
Date: Wed, 7 Aug 2024 00:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.11-next/dts64 17/17]
 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: spi@11009000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408070002.pqYyKpDc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rafał Miłecki" <rafal@milecki.pl>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.11-next/dts64
head:   8294c090a05d10fa17fc63ffdaa643f1d123addc
commit: 64b1cbad62cb11ab25ef87ed71561bad92ab93e2 [17/17] arm64: dts: mediatek: mt7981: add SPI controllers
:::::: branch date: 7 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240807/202408070002.pqYyKpDc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070002.pqYyKpDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408070002.pqYyKpDc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: spi@11009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: spi@1100b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/spi@1100b000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
--
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: spi@11009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: spi@1100b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/spi@1100b000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
--
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: spi@11009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: spi@1100a000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: spi@1100b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7981-spi-ipm' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/spi@1100b000: failed to match any schema with compatible: ['mediatek,mt7981-spi-ipm', 'mediatek,spi-ipm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
