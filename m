Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACA8F54
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187902; cv=none; b=gbBSGWGbT67SZrb9eR5Y+VwQfL/ZWlaGWSyFIn+80bGJ9MXrbmxlcROSfy8Jw8gik18nkPJ5b+g/cnAMl31aXLIvbtXq37NhxuGuZ2qPz55Vd4LyyvKgndqVrB4OlqjiRyvR9HLJdE6pfL0HoNij4406Y5rMi9bO5M4WmSaou4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187902; c=relaxed/simple;
	bh=3w0P69d8QKo43JhTXRRnikldcpKdLClV31I40fYexPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aUVzyZK9WX96gfoVf9Wyl+DPAq1GraqFgl+lofkZsfO6Gygr1pwEy3qyXDouZW4Kkrak8/xnnnhtZSSeVEjRkEuvOl90+xuFAgU4WoY6E9bRqEbixNYPdoNYQRlatjlWsj/D1fcBse0RKoNnNLEG1k7sPkNB5yfCx4bpA/WNaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STgnrxCB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STgnrxCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750187900; x=1781723900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3w0P69d8QKo43JhTXRRnikldcpKdLClV31I40fYexPA=;
  b=STgnrxCBy/KR8xCw0AV4lrVhBjBGE4fCOqiQ2KoKZMaiYuaQermcOXHG
   i5TLwA+KkJYMe4h1L3dz70mG0O/suwQH/ECdZtpQoDXbBgaFDm5VU1X3l
   9/Iwnv+IxHOkaNDfbvUdwENY/36bBp2Xu0ex7+A6xUAqXyGD+HpHTf0nw
   Fr6TboULxM+62pmVkxo3KozYKqWnFzT+jJMTPEAwfQkWvrOQFQEWv3AJ9
   YZ95HwRAjxSNq2gy5wDjJi9PKNtTe4DeQt406wNWuvZm5K1bMn3uC8bZ9
   GB3oc5QTae6Q+ULEyl1hDi46qEbADatNjBLX7cQd05VXAXnNLJZDZQfdn
   Q==;
X-CSE-ConnectionGUID: YLFkfKRSQYmy7dOR4xgnCQ==
X-CSE-MsgGUID: CKcN45BPQZKg94gvfQNw5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523480"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52523480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 12:18:19 -0700
X-CSE-ConnectionGUID: rIRYxmC3RzmTU/5qnJNEJA==
X-CSE-MsgGUID: aeX4BfEHT3CLFgG5gSvNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="148803234"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:18:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRbp2-000I10-0o;
	Tue, 17 Jun 2025 19:18:16 +0000
Date: Wed, 18 Jun 2025 03:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5
 support
Message-ID: <202506180214.neATvNOV-lkp@intel.com>
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
In-Reply-To: <20250616212214.139585-3-inindev@gmail.com>
References: <20250616212214.139585-3-inindev@gmail.com>
TO: John Clark <inindev@gmail.com>
TO: heiko@sntech.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: John Clark <inindev@gmail.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on next-20250617]
[cannot apply to robh/for-next arm64/for-next/core clk/clk-next kvmarm/next shawnguo/for-next soc/for-next linus/master v6.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Clark/dt-bindings-arm-rockchip-add-FriendlyElec-NanoPi-M5-board/20250617-052437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250616212214.139585-3-inindev%40gmail.com
patch subject: [PATCH v1 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180214.neATvNOV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180214.neATvNOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506180214.neATvNOV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts:36.12-42.5: Warning (unit_address_vs_reg): /gpio-keys/button@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: spi-nor@0 (jedec,spi-nor): $nodename:0: 'spi-nor@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: pmic@23 (rockchip,rk806): Unevaluated properties are not allowed ('rk806_dvs1_null', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: hym8563@51 (haoyu,hym8563): $nodename:0: 'hym8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: hym8563@51 (haoyu,hym8563): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: gpio-keys (gpio-keys): 'button@1' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
