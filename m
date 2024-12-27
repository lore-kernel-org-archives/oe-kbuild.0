Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F193D69
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735317441; cv=none; b=CwKVUaWEaoElsrYNWADclDL+CSr+SzItkGgIQc9js29C9dHbcYjXrqQuMRC2D0mdKTuJmotd16VqfMBWcNSnld0J1SAPtCM06c9PA91FznOVqT2u9hA2/FLTJGPjvsD+72rlk5oWYNoUMD6oW/bIgSnbLVoxTGFPiLhNITqdV4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735317441; c=relaxed/simple;
	bh=u9U33vj8evDX42ToLCc98gix23GwuVJ2IPz8wvpJ7O4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8Yu9ZYp6IaXlSXNJ0/DlqoHNHf79lKYYluMwS9O1KUySzfp4AaRwcA4Vk1UtjrRAtZENPSXj4Rksc5Gj2d5Bb3ttBjsllKbTnLVBzSVFoQc7ltWY2Uhrqh+/e0jCsdqLps9MU2yQ322jV82+UtvR1RZ5WiaKeA+oCKtQuyt5ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdb+QJZr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdb+QJZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735317439; x=1766853439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9U33vj8evDX42ToLCc98gix23GwuVJ2IPz8wvpJ7O4=;
  b=bdb+QJZrIibe31YaNe7j+XWeP5Bl7OCHDym0kgnqBnouH59d0oE5pj5w
   ykK557Yiqi2wj9OfE3GcJJO6FAfwYicE8XUyStuH6sv1rQY77oXgWzasY
   rAN2KwT6sbwYM96bUT4mjoGIMwlSVZR6ANSFPpTJtdMUGjWSs693dhMW8
   Rb/0B6h2FQNVIhGjGUXpBI//6UiWyrNUUGDWIZ6oKGJWiO1D2KxdbIiQb
   dzeiUF8cTdjbqQn4AsIb+v/oqqdLtLlC/LwJoTNVuofm0oyVOGh7pKjed
   1sdjtHtPOo1Lv/YWf2FYpHnZ7XrUqfX4rOEf+W3+8jWT9nZpOGtwgPObD
   g==;
X-CSE-ConnectionGUID: OXIWpgjfRki2bhBB/MQPyQ==
X-CSE-MsgGUID: 2TTV+YU/TP6xAo/1ITJtgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39403100"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39403100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 08:37:16 -0800
X-CSE-ConnectionGUID: T0rSHC2YRGecVFUbDqkvBw==
X-CSE-MsgGUID: Elcy4H74RZGmQ2DOPxlrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="131035475"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2024 08:37:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRDKr-0003Kw-1G;
	Fri, 27 Dec 2024 16:37:13 +0000
Date: Sat, 28 Dec 2024 00:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 70/123]
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb:
 /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema
 with compatible: ['parade,ps8830']
Message-ID: <202412280043.FIKOnZLO-lkp@intel.com>
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
TO: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 6f18b8d4142c3174e08136f0b1ce400441d53330 [70/123] arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14
:::::: branch date: 12 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280043.FIKOnZLO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280043.FIKOnZLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280043.FIKOnZLO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4662.11-4672.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
