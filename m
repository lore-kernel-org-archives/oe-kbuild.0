Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5923ABB2
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754569374; cv=none; b=kGjzICfUCa9aMRoNHhWjJkA2VpK2kfEsg1W1fe15dX+cyFXp3NnxBySPJIhHFiBw2P4+nanQnuGna24gG8WtbIlFkSiGBXSKZkfkZrMHPKHQfm74Hp4w9A7MyIgVRi0cZ/xICn7rSwosxer4zR/wj6DtJ290S64w5jACUyzR4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754569374; c=relaxed/simple;
	bh=LeC26jvmnG+lGdF1ndLvKWA5KWo0URDVk9ZRrEQ4KfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJM2LDoQBmZKBj7ET+EDnBZwrzngW0Zf5U6t/+eWjtCtt34yuMv+5VC7S5nIzhjV0U339JSbmWzaZUmMNFBXQu6FfQCles2njRnZS92Zx2lTqnxsrL4R0+aw/sNtQ35dpkAR41x91jEmd2s/VjjWsl2zYv/U81Hd3hqlBDkHf9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnE6W4G3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnE6W4G3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754569373; x=1786105373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LeC26jvmnG+lGdF1ndLvKWA5KWo0URDVk9ZRrEQ4KfI=;
  b=TnE6W4G3GZjuqosLsrV4MT+/I+Wg9Y2400vOyO0NMG1lWLCxCLZWLw6R
   pNG/dlsRISikFB7tfmxLM9QU3vPX2LNKvD2OX1A/Qq9iEcw/FC6qwX8zs
   PzZOkAMRWwKYulX5PPT+N4rJofB4brE9ivn/4UxD6tEEsMuj1Ystw08D7
   0zy7qQxtnUs1dVsgyCKW4ra5VSng+9KBvBWRm/xGV/4Ou79Q02vK74TbU
   PTLfs4/pVrc41gRDOK3ogFkJaB6d0uQ7y4e5zQbdOifDZoCU8UEhzqs34
   NXY9TntiuMrc47RxkagLkEEvznLrAC9Aepx4qLEMkC5GywkJMi5gO2Hz2
   Q==;
X-CSE-ConnectionGUID: qfkGBRIHSz2hK1yl8609Bw==
X-CSE-MsgGUID: rZd/4V0xQiWTSPfg10WZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55938929"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55938929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 05:22:51 -0700
X-CSE-ConnectionGUID: K5evOiwxSpOYbkDTj1dAog==
X-CSE-MsgGUID: /XC4nbfBTVeP4YEyXyjLVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169302773"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 05:22:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujzdw-0002m1-00;
	Thu, 07 Aug 2025 12:22:48 +0000
Date: Thu, 7 Aug 2025 20:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 245/801]
 Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml:
 skyworks,short-detection-threshold-volt: missing type definition
Message-ID: <202508072041.qJm7e4Hq-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: fc91eb8355daa97e4319a10a8e8f5414bb4a4fa4 [245/801] dt-bindings: leds: Convert backlight/skyworks,sky81452-backlight to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072041.qJm7e4Hq-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072041.qJm7e4Hq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072041.qJm7e4Hq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
>> Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
>> Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/aspeed,ast2400-cf-fsi-master.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
