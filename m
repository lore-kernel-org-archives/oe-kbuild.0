Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0836426D4F1
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 01:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758592097; cv=none; b=ibysRzeNeXeEaS9hgrnOl14wFfEm939nkpNgdDCKd011OfWMDtFL/UG/BN/bo4cq+4L6YG0mS/N2vv9lkOg2PNBj9jaMZvlEUU7Kujo9rVdA5VXGRKpTrDuCw9kbvZXmH6qSewpzpCWOepbcxGEbGlI+HgBV+F+XzFVLx6GTkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758592097; c=relaxed/simple;
	bh=vCKygnhmE3CTOkE7GOdCiF21O+EU6X2MV+daAi3Lqfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjI5HtMbm0oFmUYGx2INPAbjFYH5BWbM1YMUPSfHmE8AR6eO8gFI+GbhFdz3FgS7G93qTTXRX/Tx/B0ul9rvaUNYYDdaYHrYzvju7Zcfp/K/t0ie+3AivKZWP0mrlo1PsdPzT1XkxYX+tIftUjCHrW4Qi6nEcQFCmO1HrF+g1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPYR3X/L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPYR3X/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758592096; x=1790128096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCKygnhmE3CTOkE7GOdCiF21O+EU6X2MV+daAi3Lqfs=;
  b=LPYR3X/LZAX61DN366S81Yg5nMnsb4EOnwmtVQTfoKhn/ADtd8giwxbu
   aQoFFhiGqEt0l0e2N4au7/LDQy/nJFJRVul/+zKH96Y1UQfJD01UVnBPA
   /r0x59COswiQAuL4TGfb/DibPB5GimziUMHXUXcw6breugVSYXkcWi134
   S8wMjsFH4WgIWss7O6yA0GpA3EPS36of+aw5RTl9j1N1zPJYvO42KXMdb
   U5vRilXK6htWyHS//eZIS2Cs3j7MRVcd2h501aDkFoHYnGGiK5sZc+TiQ
   5VvJQHemZUnK3zBBaRwFXY3DkHwpoZcFfSEw6BAnes38O0Sd9RoJ7KisF
   A==;
X-CSE-ConnectionGUID: ESjQHYtJTYKG8Q6WZXp1Pg==
X-CSE-MsgGUID: Yx1InSCKSMae+AidGgvAQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78307645"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="78307645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:48:13 -0700
X-CSE-ConnectionGUID: i/xVYRQARzyQl13De/avWg==
X-CSE-MsgGUID: eilfRXfvSGattnFiFDmcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="177411291"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 18:48:12 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0s8O-0002dH-12;
	Tue, 23 Sep 2025 01:48:03 +0000
Date: Tue, 23 Sep 2025 09:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 7/7] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
Message-ID: <202509230913.WjTgipiq-lkp@intel.com>
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
In-Reply-To: <20250922012039.323-8-kernel@airkyi.com>
References: <20250922012039.323-8-kernel@airkyi.com>
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
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
TO: Dragan Simic <dsimic@manjaro.org>
TO: Johan Jonker <jbx6244@gmail.com>
TO: Diederik de Haas <didi.debian@cknow.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Peter Robinson <pbrobinson@gmail.com>
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org

Hi Chaoyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next linus/master v6.17-rc7 next-20250922]
[cannot apply to rockchip/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/usb-typec-Add-default-HPD-device-when-register-DisplayPort-altmode/20250922-092549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250922012039.323-8-kernel%40airkyi.com
patch subject: [PATCH v4 7/7] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-052-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230913.WjTgipiq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230913.WjTgipiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230913.WjTgipiq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
