Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552F286D4E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692160; cv=none; b=Ewyw+HhqvMWYoMCrZ/PJCb7lCQOA+GsJE0iCzYEUM45NMDuEKR4yuEzJNFB72Bx/E2G38FM9B6rhddMgLT3Dn2fiwlzQZKQPyvEXlJD8C9DdogYG8xWUndGYa1ljAdwfSI+83ceWy0tsc+1w0wBqOoC2WCTbup14Om+sDd2KDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692160; c=relaxed/simple;
	bh=8FgRXjfbX1gb0ADYoNS2jobrIGgKGFB5bMNPwc7n4bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJtZlX00d0Wxm154ncxQGqlCBwSk64OAgpytdhjAQDxlrjefgmKtBYTtpqe/e+DuYzi0dOMs4wJV9CBn4nPCDraTYqg2nADeyaX1sn/EkkNwrKqz/2a+//gp6st2P1/w5NzpZ/2t/nypw4rCHNG6JQcT8i0TrpdMACgvJDQs+Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRJUcXew; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRJUcXew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750692158; x=1782228158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8FgRXjfbX1gb0ADYoNS2jobrIGgKGFB5bMNPwc7n4bE=;
  b=PRJUcXewX/VXHGezhMlaVGpbb2PDxAWQ1BYfGT+j8rYssAW3LK7jOQ3O
   PMC0HpYF5sERLFcmaLBDYMgycoewnKkiCW1fgCwKzU+jieiwxDeqrTNiP
   AeMUYqFJ2qYo3bVTevVk/8XU2psYgs/9X6cFf4HNZE1YN3O/K5LjxSoJ4
   cAcp7ViFItnMNBLfBIu3zzAyozPJmtrc31FdRTr3W2BYE+vJSFc2ljQC+
   zmcYkXfdYYbORzV9wAaagKbKiC7GYQbe5JdCmL9+WKP0VDnkAIL/J2Bdb
   3R+lyIYZC2RTP7vIZDzboIYK3mjTO034AbTaD6tO6q5c9UzkqEXi2Vidf
   w==;
X-CSE-ConnectionGUID: fDExrfDVTk2GdKOGbj1KLg==
X-CSE-MsgGUID: IGO5QQvhS6q1bm3mWkFVeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52873966"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52873966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 08:22:36 -0700
X-CSE-ConnectionGUID: rPmcFfNPTTuLnXterz+Waw==
X-CSE-MsgGUID: I+bYWB5PSrGvmGYxZ75P1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152144485"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 08:22:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTj0D-000P2U-08;
	Mon, 23 Jun 2025 15:22:33 +0000
Date: Mon, 23 Jun 2025 23:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
Message-ID: <202506232309.c44hG0Cq-lkp@intel.com>
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
In-Reply-To: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
References: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
TO: Jakob Unterwurzacher <jakobunt@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Quentin Schulz <quentin.schulz@cherry.de>
TO: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
TO: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
TO: Dragan Simic <dsimic@manjaro.org>
TO: Diederik de Haas <didi.debian@cknow.org>
TO: Farouk Bouabid <farouk.bouabid@cherry.de>
TO: Johan Jonker <jbx6244@gmail.com>
CC: stable@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Jakob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakob-Unterwurzacher/arm64-dts-rockchip-use-cs-gpios-for-spi1-on-ringneck/20250620-193703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250620113549.2900285-1-jakob.unterwurzacher%40cherry.de
patch subject: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250621 (https://download.01.org/0day-ci/archive/20250623/202506232309.c44hG0Cq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232309.c44hG0Cq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506232309.c44hG0Cq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-lvds-9904379.dtb: spi1: spi1-csn0-gpio: {'rockchip,pins': [[3, 9, 0, 150]], 'phandle': 87} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-lvds-9904379.dtb: spi1: spi1-csn1-gpio: {'rockchip,pins': [[3, 10, 0, 150]], 'phandle': 88} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: spi1: spi1-csn0-gpio: {'rockchip,pins': [[3, 9, 0, 150]], 'phandle': 87} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: spi1: spi1-csn1-gpio: {'rockchip,pins': [[3, 10, 0, 150]], 'phandle': 88} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
