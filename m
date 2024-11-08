Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E21D0147
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731050216; cv=none; b=i/zVTvYs1x9C09etP/eH8M3DpYE/NJZcnorxiLMNEsQnyarI1+KEwWB4ctfX7/uocnJgytGrSRicoOxXy21IWHl2Vf6lVlDHGZL9aKBUfq4vIBToDfe8tdmYchn0gVMIkD9GiWoimuQ8pWspWfAgLaC/xIgQkVD6S1ho/+TISG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731050216; c=relaxed/simple;
	bh=LrN/hHmQkGjYMbos31/F49FxcRD7VrYVkg9eVZEEsqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QE9u5ajsUpfssj17unrVCjtpuLsc1yh2PL1xa9WyO5QptURTL29eAGD6W3cKjyVxNmy+25okJmc3pNgw4MmshUbWMwrNn2dyoHSb11aGViS+EAg4lR7zGI+bHZ1olNnCte9JXRUS/fRW3WWQDABx55JrHTT9b2D2Ix/zH2vSI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSeBgG2d; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSeBgG2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731050215; x=1762586215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrN/hHmQkGjYMbos31/F49FxcRD7VrYVkg9eVZEEsqU=;
  b=mSeBgG2dd1c8lOaY4ILNESHih3uYmc6UKtpRjNhAvDUDEX498ugRw14G
   fV+kv0Unfp/WkNTeZC9+DPjy0BF+2v9eL7+GJAfPyKaax869xxw5j78yE
   iA7CWRi5M8mrcAcQjEaJ0G1H7C7kPPn2u7+oRmSva6VlTBZuVEFdp7ZZX
   RM/Mqffsegb9KuLCwePF2X9sVbd2bcmdNoE+UnBA03P4KZWkMNmSn5lyC
   Btap0JNPjzGTpQOmSwCfaxoD9PhdCaIPTNdViOUCBDItz1ZWXMzEhN0L7
   fnvW3GZ7ZZ4qoV2xGcl749/CXaIMlWwLLFWtEwbUQxLM1rK5KxjEgVFsF
   Q==;
X-CSE-ConnectionGUID: Ly9hx25qT3qq7aTWsfJnxg==
X-CSE-MsgGUID: UGG6DCW8Rfy+h+qqZf4pPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33782592"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="33782592"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 23:16:54 -0800
X-CSE-ConnectionGUID: 07kOfFC1Qpy8Lbg/GLfWaA==
X-CSE-MsgGUID: jEGKw27zTEy7mvHcz3xkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90552434"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 23:16:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9JEh-000r8c-0M;
	Fri, 08 Nov 2024 07:16:51 +0000
Date: Fri, 8 Nov 2024 15:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: rockchip: enable USB3 on NanoPC-T6
Message-ID: <202411081458.24Y18aok-lkp@intel.com>
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
In-Reply-To: <20241106130314.1289055-1-rick.wertenbroek@gmail.com>
References: <20241106130314.1289055-1-rick.wertenbroek@gmail.com>
TO: Rick Wertenbroek <rick.wertenbroek@gmail.com>
CC: rick.wertenbroek@heig-vd.ch
CC: Rick Wertenbroek <rick.wertenbroek@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
CC: John Clark <inindev@gmail.com>
CC: "Hugh Cole-Baker" <sigmaris@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Rick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rick-Wertenbroek/arm64-dts-rockchip-enable-USB3-on-NanoPC-T6/20241106-211902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241106130314.1289055-1-rick.wertenbroek%40gmail.com
patch subject: [PATCH] arm64: dts: rockchip: enable USB3 on NanoPC-T6
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241108/202411081458.24Y18aok-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081458.24Y18aok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411081458.24Y18aok-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /hdmi@fde80000: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: phy@fed90000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound: 'simple-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /hdmi@fde80000: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: phy@fed90000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: sound: 'simple-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
