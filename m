Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B82EA731
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779610338; cv=none; b=qR6TCNEoGaKTqajdM1zAG+/wn4JJmogfZYC43J8XkAfo+i7YXExnBHfQ1BROGBMkdRwa0Ja5Jk7/HaXDp5vQwH1ecowaXKAT2wHLusdFXkSlQVbGgIrEg69YxcdXXGEAhurnvRBXZE7TMlJKaXL6eXQoGZfCwEO3tAqGXtq6Rw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779610338; c=relaxed/simple;
	bh=Nme9ylcpgROWKAJQ3HBNjZPpFmUDRYxW1uVkvEohM38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJbjpghulkI5e+OwEoQOUSaoPds1ZS63ds5cdp2vf4mLi84RYCLbZ2USEUCAD4/pcQSbc/InCSL3m4+zj1lqdqvmF+s9S2jTeJFCSPFatQoIM8w+AtDwaUy7rY1PnvCrxURV9Bxe6CNQsqOeo3OY9k7tdmKZhqkUZw+y5nUPERE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ix84mPCy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ix84mPCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779610336; x=1811146336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nme9ylcpgROWKAJQ3HBNjZPpFmUDRYxW1uVkvEohM38=;
  b=Ix84mPCy9isXgsBk7ENbm6/8kHVH6vMhpPj4bChJQJPxzljwulaycy7Y
   vLfyoGbGJs3ZNKLn+wf19So3DjWwB5kCNozz3JwbL+6Zkm7ZB4YzVXZGK
   xpYrRF3p5xIeuLptackecbZHb9MLybPUVu0ilZhFmW4VDs3nBY83sOa1U
   siVz4U27mBdMD8l0EN2+dn+Qdqow2JGiI1cCV4lF5SbZMC3JA0j0rDjTx
   inGHB7bnJ1GXfB4EX88gGXZ6Pn3WbZwTnByIH79tQd+rEin56S9D6JFzy
   8SPo96C/xFKQg85h1kRiOmTrgP1ckJ8q+2dZjCO8wNBsRiU/8z7/Q9SdC
   g==;
X-CSE-ConnectionGUID: xOi8DIOXRgODzpRCVINP6g==
X-CSE-MsgGUID: iX2ppKUDS/ODFbLVwRBHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91859323"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91859323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 01:11:04 -0700
X-CSE-ConnectionGUID: 8LC7MMPjRIO5zB/0lxuB8Q==
X-CSE-MsgGUID: HIzhiZJsQamYWJ7p42Siqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="243125485"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 May 2026 01:11:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR3vI-00000000Bvd-1GaN;
	Sun, 24 May 2026 08:11:00 +0000
Date: Sun, 24 May 2026 10:10:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <202605241044.ov6xCavJ-lkp@intel.com>
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
In-Reply-To: <20260505061344.1785663-1-alexander.stein@ew.tq-group.com>
References: <20260505061344.1785663-1-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
CC: Markus Niebel <Markus.Niebel@ew.tq-group.com>
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux@ew.tq-group.com
CC: linux-renesas-soc@vger.kernel.org
CC: Alexander Stein <alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/arm64-dts-add-tqma9596la-mba95xxca/20260515-131916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260505061344.1785663-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v4 1/1] arm64: dts: add tqma9596la-mba95xxca
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2053-20260523 (https://download.01.org/0day-ci/archive/20260524/202605241044.ov6xCavJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241044.ov6xCavJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605241044.ov6xCavJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: ethernet@10,0 (pci1131,e101): clock-names:0: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,enetc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
