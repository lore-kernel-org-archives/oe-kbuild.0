Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E366262FC7
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Jul 2025 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705830; cv=none; b=RUqyH9TiNW1o+Ya7/xWCTBAgekjuSKopt4oZSzdKg50n1q/JZ/R65YQiyQDOuM31S5OuEvtcXYDwtQWxMIbiYmA/UgnDh7EZe+xvydJq6ZkSHihw6zrQSXevx3HnEHCi71F2eB+gMhoHbJ1r6dN+c3rRCa7OWQvdezFaDEJ9hVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705830; c=relaxed/simple;
	bh=yv2WvhXpkPY/7QlDhAKKvasaom5ea2uoThq2pvBWX9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kx2um+6sbg4auzU3oBjfc3cjyLo4gyHuswBD8af+MiXzMUSObciwPe7kGkv+V2DU26JernZKg9/5ukbutfviRKIvsf1KjN0cFWvzC1Tdt5mvWv4MVh7YSRLRR/hILLPJVvhPcgyk4tQhVA8tyj8sQrFmr9hCK90fHpK9BqTGD6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkUlWyo0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkUlWyo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752705828; x=1784241828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yv2WvhXpkPY/7QlDhAKKvasaom5ea2uoThq2pvBWX9c=;
  b=DkUlWyo0HlTMwK7+NFobPupk8c+J09mqfNRM+42cgqhcUu4Kd3yLnwuF
   Kbu6ETCTUBeRB8ofM/Usk5TMkztV5BNLrGpb6CqeF8N5CjpWCkfID9oca
   CkGrqTOvyj4kuNjAk8fAIr11zWBmw0tk/VEuT+wwae/f80dF2WK0HdXYb
   LQpFYfDdKzdfNzelTG9a1nxTPw4ZErm6ElGU56/4CWYiLAE+JiKUOudM3
   9tWSvS4W4O4w0jIaFO8DLljJv7bWO75+cMfyMJyZl0A9MrYTWdnXODyiJ
   Q/EuWmLowZy0UArSYFvBpymTTTC2Nz/mlS7v1CqiNINYYyULuDc2Oiwz9
   w==;
X-CSE-ConnectionGUID: fPg76UG/QVyk9pJpPujC8w==
X-CSE-MsgGUID: gS/8Fx2ZRfmMxxtumEDqjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57578845"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="57578845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:43:47 -0700
X-CSE-ConnectionGUID: 7yIOddMqT9i6CVhUHXjCIA==
X-CSE-MsgGUID: qxZeLLU4QJuOE3spCVAyjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="157297916"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2025 15:43:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucAqm-000Cv9-2E;
	Wed, 16 Jul 2025 22:43:44 +0000
Date: Thu, 17 Jul 2025 06:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
Message-ID: <202507170652.jjPqvP36-lkp@intel.com>
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
In-Reply-To: <20250715112456.101-6-kernel@airkyi.com>
References: <20250715112456.101-6-kernel@airkyi.com>
TO: Chaoyi Chen <kernel@airkyi.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Sandy Huang <hjc@rock-chips.com>
TO: Andy Yan <andy.yan@rock-chips.com>
TO: Yubing Zhang <yubing.zhang@rock-chips.com>
TO: Frank Wang <frank.wang@rock-chips.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Amit Sunil Dhamne <amitsd@google.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
TO: Dragan Simic <dsimic@manjaro.org>
TO: Johan Jonker <jbx6244@gmail.com>
TO: Diederik de Haas <didi.debian@cknow.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: dri-devel@lists.freedesktop.org

Hi Chaoyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250714]
[cannot apply to robh/for-next rockchip/for-next krzk/for-next krzk-dt/for-next v6.16-rc6 v6.16-rc5 v6.16-rc4 linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-connector-Add-displayport-connector-for-hotplug-notify/20250715-192802
base:   next-20250714
patch link:    https://lore.kernel.org/r/20250715112456.101-6-kernel%40airkyi.com
patch subject: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250716 (https://download.01.org/0day-ci/archive/20250717/202507170652.jjPqvP36-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507170652.jjPqvP36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507170652.jjPqvP36-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
