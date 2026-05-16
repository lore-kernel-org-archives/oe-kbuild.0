Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C03E1701
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778936373; cv=none; b=J10qRkfH01tO8PCzkvJpJREEhb19WGzwRW65VZmC45Wzm+RuA1gRp+gOKmkyO8+Tw7jDKHfn1WsNGrOtSKp9hSDMtO2c8O8Et1J9RiEl8+iM+nJIg+N0lTvJRZskHLTLYQTK04wGnRk9Cje+tVOXHU4O7Uk9Hymvwqa9JGhH6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778936373; c=relaxed/simple;
	bh=u58+n90rxq+1iJ4sGjtcWf9u3bI77Gj6O+TQ/rTjIgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6PDg05fIT4cemBzEqbDiv0DFOG83DnNqQtWBgVMKaOekabEVql3HoQ4jIj3MtwUO6NYxhHsmcV9GT0RdwXA0ggujeW4cScfpoNdvyIHZu0xRp5/VB80x5bBkx6PfkgHbVH0lN9b1oujxbUrcAGx9YPbv9z3Tiy2e9jkleC3z4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfJkZMYi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfJkZMYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778936371; x=1810472371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u58+n90rxq+1iJ4sGjtcWf9u3bI77Gj6O+TQ/rTjIgs=;
  b=MfJkZMYiTZmU7sXVBpf9HdXe0jlTl9vDALK+Jzy+Q5aG8mqafRqxXOHc
   TC2e09eDvN9EeB2KoCAKlmIwwjGjovm8CmZEEFyXmzs1TKuWKxDwY/BK+
   txwm+BhJDpFb0gwx1daOMTUpFDJUd41WY63H1xW85TDQFbTihV5se7xvY
   3q0UazO67wtLtSmuuFULidPkBe9VkYmpPDn2HqLdwjVrzRaxc3xsBkUos
   6z+2iGNiYyED9gLeyKItGfDAnPh4mBzOJIvPV6WJmH6TEvSQyzkag7CiZ
   Lwqlljg+p/ZUwi8eJy2o/0Xe9E42tugf77LcvtV3mLFgSGs0dKDHAAcM0
   w==;
X-CSE-ConnectionGUID: cZnxdKljT9SNtjF3yhT1yQ==
X-CSE-MsgGUID: Rri9Qg68RIyl9wkLLpWaIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83483627"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="83483627"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 05:59:31 -0700
X-CSE-ConnectionGUID: Mup9xqPVQOS1BogfGVJDZg==
X-CSE-MsgGUID: 0XvRC2XZSMmOLhqxJqw2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="243930067"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 05:59:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOEc3-000000009Kv-100U;
	Sat, 16 May 2026 12:59:27 +0000
Date: Sat, 16 May 2026 14:58:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Message-ID: <202605161403.GMSdycJa-lkp@intel.com>
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
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
References: <20260511165942.2774868-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Liu Ying <victor.liu@nxp.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Clark <robin.clark@oss.qualcomm.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Abhinav Kumar <abhinav.kumar@linux.dev>
TO: Jessica Zhang <jesszhan0024@gmail.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Nas Chung <nas.chung@chipsnmedia.com>
TO: Jackson Lee <jackson.lee@chipsnmedia.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Mirela Rabulea <mirela.rabulea@nxp.com>
TO: Detlev Casanova <detlev.casanova@collabora.com>
TO: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
TO: Heiko Stuebner <heiko@sntech.de>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on remoteproc/rproc-next drm-misc/drm-misc-next linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-Consolidate-sram-property-definition/20260515-204630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260511165942.2774868-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: Consolidate "sram" property definition
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: powerpc-randconfig-2051-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161403.GMSdycJa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161403.GMSdycJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605161403.GMSdycJa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/ebony.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/powerpc/boot/dts/ebony.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440gp', 'ibm,uic']
   arch/powerpc/boot/dts/ebony.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440gp', 'ibm,uic']
   arch/powerpc/boot/dts/ebony.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440gp', 'ibm,uic']
   arch/powerpc/boot/dts/ebony.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440gp', 'ibm,uic']
   arch/powerpc/boot/dts/ebony.dtb: /cpc: failed to match any schema with compatible: ['ibm,cpc-440gp']
   arch/powerpc/boot/dts/ebony.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gp', 'ibm,plb4']
   arch/powerpc/boot/dts/ebony.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gp', 'ibm,plb4']
>> arch/powerpc/boot/dts/ebony.dtb: plb (ibm,plb-440gp): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': [32, 8, 10, 1]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
>> arch/powerpc/boot/dts/ebony.dtb: plb (ibm,plb-440gp): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': [32, 8, 10, 1]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
   arch/powerpc/boot/dts/ebony.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-440gp']
   arch/powerpc/boot/dts/ebony.dtb: /plb/sram: failed to match any schema with compatible: ['ibm,sram-440gp']
   arch/powerpc/boot/dts/ebony.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440gp']
   arch/powerpc/boot/dts/ebony.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440gp', 'ibm,mcmal']
   arch/powerpc/boot/dts/ebony.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440gp', 'ibm,mcmal']
   arch/powerpc/boot/dts/ebony.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/ebony.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/ebony.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/ebony.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440gp', 'ibm,ebc']
--
   arch/powerpc/boot/dts/taishan.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440gx', 'ibm,uic']
   arch/powerpc/boot/dts/taishan.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440gx', 'ibm,uic']
   arch/powerpc/boot/dts/taishan.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440gx', 'ibm,uic']
   arch/powerpc/boot/dts/taishan.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-440gx', 'ibm,uic']
   arch/powerpc/boot/dts/taishan.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-440gx', 'ibm,uic']
   arch/powerpc/boot/dts/taishan.dtb: /cpc: failed to match any schema with compatible: ['ibm,cpc-440gp']
   arch/powerpc/boot/dts/taishan.dtb: /l2c: failed to match any schema with compatible: ['ibm,l2-cache-440gx', 'ibm,l2-cache']
   arch/powerpc/boot/dts/taishan.dtb: /l2c: failed to match any schema with compatible: ['ibm,l2-cache-440gx', 'ibm,l2-cache']
   arch/powerpc/boot/dts/taishan.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gx', 'ibm,plb4']
   arch/powerpc/boot/dts/taishan.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gx', 'ibm,plb4']
>> arch/powerpc/boot/dts/taishan.dtb: plb (ibm,plb-440gx): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': [32, 8, 10, 1]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
>> arch/powerpc/boot/dts/taishan.dtb: plb (ibm,plb-440gx): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': [32, 8, 10, 1]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
   arch/powerpc/boot/dts/taishan.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-440gp']
   arch/powerpc/boot/dts/taishan.dtb: /plb/sram: failed to match any schema with compatible: ['ibm,sram-440gp']
   arch/powerpc/boot/dts/taishan.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440gp']
   arch/powerpc/boot/dts/taishan.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440gx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/taishan.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440gx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440gx', 'ibm,opb']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440gx', 'ibm,opb']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440gx', 'ibm,ebc']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440gx', 'ibm,ebc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
