Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CA214A93
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754080008; cv=none; b=F9ChYCj8wknGxD0cpaSVmvyJIybPVT/kvjXqjdekGvSm+LKR3YbsHpmdK40dfsluU3Hoi3MF+E60KNbxaarw8qTL5UyMqtEOZvmDQg54Re1G1HNv99FZZ3ieDgYqEQGS2jhyqvvta6M306Mj/PUIZzlaqL6pBZ7EKaiAyZV3ZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754080008; c=relaxed/simple;
	bh=qa7+J6E/Qg9qElnzD1WD8+qE0I5Q6Rec1SocuiovUlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjX/HyqfSivoaltu0AFv6xuUE1+lMKSlT2XhCaJt3gOaQ8XgvjZb2x/Bx7aRmBDXKPZI330OMqH0+FhdCr7uGWO4M3dGCCZjHJvPf9AD+aSL+1Nkjx9TG3x+1MDEU7E/S6mCdYOY6UpMqBv3RLqjJyWort/xUenLdoptvSpfszw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBRUQMtU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBRUQMtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754080007; x=1785616007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qa7+J6E/Qg9qElnzD1WD8+qE0I5Q6Rec1SocuiovUlI=;
  b=dBRUQMtUVcGhDOeTSq6lkT0gdWismB7Hg5aPPIHAJrBlsmhi1vGUOq+z
   J/6eAK31xzKI9PhN+HpmxbRt45QkzM+HSQVvXQMGu90QdGl7YZ8B/q38Q
   fjOqrk10ZW9JpwVvK62WZY/9OBoOTs+MaBhg5WDlu7jPrLCMSGAVD2Hn7
   OXa0Oy6WEDrphL4Lw78gStoLdpAKkOiq2BrStaxYcL++hXcSAj2TafI+9
   zKnwmk+9GlH+jywKGpsa3PERo5jtUjRFlqRkY1Q3ZOz+teRm/n2kXyltp
   /d3zHLHvITcBPaFWjMFOR14oCjFqMfKHS23y/P2pwEUMn48licQ2ZEKg2
   w==;
X-CSE-ConnectionGUID: mEROLviCTbuY8zIWN6l0AQ==
X-CSE-MsgGUID: Gv+FOwNqS+aU+ZyFMec3KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56326164"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56326164"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 13:26:46 -0700
X-CSE-ConnectionGUID: lQlPUjV/Sca5NwD/9hCYkA==
X-CSE-MsgGUID: PVGnk9dTSfqZGKE7Zp54Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167855217"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Aug 2025 13:26:45 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhwKw-0004uC-28;
	Fri, 01 Aug 2025 20:26:42 +0000
Date: Sat, 2 Aug 2025 04:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
Message-ID: <202508020427.JfMR6k6Y-lkp@intel.com>
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
In-Reply-To: <20250731221622.2187892-1-b-brnich@ti.com>
References: <20250731221622.2187892-1-b-brnich@ti.com>
TO: Brandon Brnich <b-brnich@ti.com>
TO: linux-kernel@vger.kernel.org
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Devarsh Thakkar <devarsht@ti.com>
CC: Udit Kumar <u-kumar1@ti.com>
CC: Darren Etheridge <detheridge@ti.com>
CC: Brandon Brnich <b-brnich@ti.com>

Hi Brandon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16 next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Brnich/arm64-dts-ti-k3-j722s-main-Add-E5010-JPEG-Encoder/20250801-061735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250731221622.2187892-1-b-brnich%40ti.com
patch subject: [PATCH] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020427.JfMR6k6Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020427.JfMR6k6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508020427.JfMR6k6Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: e5010@fd20000 (img,e5010-jpeg-enc): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: e5010@fd20000 (img,e5010-jpeg-enc): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: e5010@fd20000 (img,e5010-jpeg-enc): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: e5010@fd20000 (img,e5010-jpeg-enc): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
