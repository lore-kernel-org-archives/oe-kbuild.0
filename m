Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE43DA7D6
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219286; cv=none; b=S/ZT3t6Bw6v5yWS9W59va4gtxICS6/A5jZSNOKEkeOXBvd54axLlGp4+goZM4BkMIcuyq3O5EzFsB5enEghDppnoq30op4xYxT+9rnTG6zwgbflM5ZOUukbg3fawX18MBD5G1RsdRQw8h6L/8Fm98MbeNXr6S6I1qbBJi+kitBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219286; c=relaxed/simple;
	bh=+wb2hPXpAUn+Qux2FpnOwtoeWZd8PFplb534AjUGqYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIuUjC8GWUuIggYmT15uUnRTofsoeMM5dix+agjyUyao0m7xpkc67VqlQhtW6mnzepEugqlFhmyA+SV2WC7J2M+CavsmMtEvN49hpV5DzIhVByJomu9uHIcM9gyz53HuPC8hfXu7L21xsciK8chqBREwhwKBFrYvS7wCHiwZVbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBuphn8q; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBuphn8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790219282; x=1821755282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wb2hPXpAUn+Qux2FpnOwtoeWZd8PFplb534AjUGqYI=;
  b=FBuphn8qe2UF5UhV8T3c6b97PdA6n8TCUdm1jMO1F+qWB7GD07NMPtVv
   xmh98JwdK3ltY2fnIarcTwJ4xER9lbnlriDtfXBVU3Kp3ymwH6SMbnS1h
   WDDLZ53pyuJHANFeuWdz4fRpknj499/uGeHcwqTzZE4zw5gZp4mH4ISjz
   6HQl23ukFh8Cv/UMptuaSA1w/rZlstGjs7OgzLOmCLMAdvzuC7m/GUQbs
   fk21bixUL6kFACBPgrMWAiFhYUfJKHsCwUzJKkpeDGkQN2yRAIGAiNnxm
   nuyhT8DcRfXHoNjZBzWh/Yxwml6spqla6Uu7TMmzPnW3L7NdkNcTHfOcZ
   Q==;
X-CSE-ConnectionGUID: gWl2Eoz/Sn+3VnZCy/Jg2A==
X-CSE-MsgGUID: DcVRCUBvQkiT7mkBTJRGLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89884775"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="89884775"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:08:01 -0700
X-CSE-ConnectionGUID: x5tX7wg5RnSvleAwEuXo7g==
X-CSE-MsgGUID: GO8ZTFLIRq6JjxpKlGR3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4993273"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 20:08:01 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ZoU-000000000BG-0Ymb;
	Thu, 24 Sep 2026 03:07:58 +0000
Date: Thu, 24 Sep 2026 05:07:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
Message-ID: <202609240500.IrPqcYL6-lkp@intel.com>
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
In-Reply-To: <20260914174651.6195-1-francesco@dolcini.it>
References: <20260914174651.6195-1-francesco@dolcini.it>
TO: Francesco Dolcini <francesco@dolcini.it>
TO: Nishanth Menon <nm@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.3-rc4]
[cannot apply to next-20260923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/arm64-dts-ti-k3-am62p5-verdin-build-zinnia-dtbs/20260914-194650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260914174651.6195-1-francesco%40dolcini.it
patch subject: [PATCH v1] arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20260924/202609240500.IrPqcYL6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240500.IrPqcYL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240500.IrPqcYL6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dtb: memory@9c800000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dtb: memory@9c900000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dtb: memory@9b800000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dtb: memory@9b900000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dtb: memory@9c800000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dtb: memory@9c900000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dtb: memory@9b800000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dtb: memory@9b900000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
