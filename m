Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3203A1D54FA
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754805376; cv=none; b=j7nXr3Ju+kFTphV95u2PkwV7g4Mw2OLwbG2J28LZ+ylPKe4JfQ2wSnJdHYAZARJ5U1gbOAVvi4bdU2jadEM1yj7lU5TQebIZouhaMwM+SlFP9B7AP5ugYgfaRC4/YJHcvGkDzCgoVdxaSe0Nl3Mk0RXapsqb/ublZl0L4jvzdAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754805376; c=relaxed/simple;
	bh=LSNmCe/sEnOyy3VPv1egf5Gw4959L7KtPgdhB4Ftkvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRy3/BjtA80BPY3CMroOqYcAOWMncuRN48D/lXLkqYdVdqFSc9iKMo+HFx4bMLzDLrXhWxk9ZKutRy24tWFcB+g2gdom4WuBz3Vl3zZvaGDa1yXPVqw/9E8VEDFui4e9LpimQ+VQ84GzDpmYZ29gW6unp4nUGIBRpOYpL6oLgnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GX10dCnj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GX10dCnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754805374; x=1786341374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSNmCe/sEnOyy3VPv1egf5Gw4959L7KtPgdhB4Ftkvc=;
  b=GX10dCnj3d1ibTtLVYJGOt7TvLFCt6MMBeC1JDEH8oCVlfRtdkRKmb1/
   v1vgY8/kmphRwITdsVbUk9K6kvBSBvD8ceLeR6gUZbOQRxQFrda1If0cE
   V8AoyQdOkNitaueh6XDnzZHLr15L9cP29mQ6wLqZYspdvjU4ffZ3tJiAb
   JEWcZNIO4N9M9MpRYgKWVPHEIWZvla3ZMeuIVAC3RJS3gGmJjBqda+qyL
   Aqe6PiCVZatHf40vCaYCWJZ3dlFbJbsfIRbg2i05z5A3yUFTrjxv4yB7F
   zKvtHGVsvUGP2yvFXwmYgYJPB0w17tK+7Fve2v8QwLvce8eUyrrTGRwkp
   Q==;
X-CSE-ConnectionGUID: 9YWdCwA2RK2/jDWhgWx21g==
X-CSE-MsgGUID: d4nInzN4RYSRTy5oG5A+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="59704737"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59704737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 22:56:13 -0700
X-CSE-ConnectionGUID: Opt/xu1QQy6e4sqon7p7vg==
X-CSE-MsgGUID: 1+TbbpksSrSBB3yYU55WHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="202826743"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2025 22:56:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukz2P-0005BB-2f;
	Sun, 10 Aug 2025 05:56:09 +0000
Date: Sun, 10 Aug 2025 13:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 573/801]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230
 (ti,pbias-omap2): 'regulator-name' is a required property
Message-ID: <202508101358.STblyqeg-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: dc5ecafbf01ab011788c3643d871b4f3d6306414 [573/801] dt-bindings: regulator: Convert ti,pbias-omap to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-054-20250807 (https://download.01.org/0day-ci/archive/20250810/202508101358.STblyqeg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508101358.STblyqeg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508101358.STblyqeg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): compatible: ['ti,omap2-scm', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230 (ti,pbias-omap2): compatible: ['ti,pbias-omap2', 'ti,pbias-omap'] is too long
   	from schema $id: http://devicetree.org/schemas/ti,pbias-omap.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230 (ti,pbias-omap2): reg: [[560, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,pbias-omap.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230 (ti,pbias-omap2): 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,pbias-omap.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
