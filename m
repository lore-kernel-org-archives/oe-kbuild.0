Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0BA2C9A
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754020229; cv=none; b=pIMpA+SCQbOHiQmxmrz00rMuRBkg7dXJs5l2gz8RTaz4+JBByGWF7iXKYEOyvTwgHALKF5nh/sRHDrlD+qoGC9xzG72+zZQNKTeCsHuII7lUQH4gpj3KPb/+pRz8Gq0OiE5CEikGRI9LYT4o+cOkPJBTKL4WXrF+jgIi+fTSTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754020229; c=relaxed/simple;
	bh=nMuMmYE0U22FB7Z1m+uxe2cv96WnIHQgAca5VWegvjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGoupubSPPgHGK0KSsAIW9Z53ohWKSoPzB8OQ7hcAsxUQqjsoR9Dik1gFTxdyEEAiqsciIFaIBE7TNY2h5rmOxww0o6MRdDFZmjY6HFx5z1T0/jGlHQhB5UrQgYNbPL+RmtNe+J50RqPxZR2VyGbJvU9lF0/q3xqT/e4crdsRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZHDyVq6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZHDyVq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754020228; x=1785556228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMuMmYE0U22FB7Z1m+uxe2cv96WnIHQgAca5VWegvjM=;
  b=iZHDyVq6zTEFbW3AbniAmFJAOtqdIANXNO7lG2umaxUSbG4nsXGgygvz
   I5VEpVHNo4NExKxeJwUVIhmWexvr67Q9GgGQMxewL53FSRR1t7AI+twxG
   UXHAw3nKQun3pDtdNxJCs6uwm1GmV4hcTduwBGVsWNF8IKbBrXzHGkUud
   papMgvSopgXqz7EjYUy8e0+jDWz7/ud/BU+ixs3viM3x1sSybTNWKt9Wy
   DHMbfp158u7DpLWPfCa9KKZM9zJdV1DjOE6zxYGPh34JgRsSQD+meoUhT
   iQozSe0GSn48HnZccQXmmHF7Pe3bP5LAb4IOOb1c75lNkaDF4BlECajj6
   Q==;
X-CSE-ConnectionGUID: MmlNbpadQOyj3UUWPl8SUg==
X-CSE-MsgGUID: LoKtqt9+QLOSFobgcKliUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56227249"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56227249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 20:50:23 -0700
X-CSE-ConnectionGUID: r/1Jc4bwQk+JaihvcWsExA==
X-CSE-MsgGUID: CzVQA6uiQwmwCyxQ8QzwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194276971"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2025 20:50:22 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhgmh-00018V-1M;
	Fri, 01 Aug 2025 03:50:19 +0000
Date: Fri, 1 Aug 2025 05:50:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/boot/dts/virt.dts:48.6-71.4: Warning
 (unit_address_vs_reg): /pci: node has a reg or ranges property, but no unit
 name
Message-ID: <202508010555.VHB3uhTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2d282e1dfb3d8cb95b5ccdea43f2411f27201db
commit: 47812144d39566da3f1dbc7a615f656969f99337 xtensa: migrate to the generic rule for built-in DTB
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: xtensa-virt_defconfig (https://download.01.org/0day-ci/archive/20250801/202508010555.VHB3uhTJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010555.VHB3uhTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508010555.VHB3uhTJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/xtensa/boot/dts/virt.dts:48.6-71.4: Warning (unit_address_vs_reg): /pci: node has a reg or ranges property, but no unit name

vim +48 arch/xtensa/boot/dts/virt.dts

775f1f7eacede5 Max Filippov 2018-11-05   3  
775f1f7eacede5 Max Filippov 2018-11-05   4  / {
775f1f7eacede5 Max Filippov 2018-11-05   5  	compatible = "cdns,xtensa-iss";
775f1f7eacede5 Max Filippov 2018-11-05   6  	#address-cells = <1>;
775f1f7eacede5 Max Filippov 2018-11-05   7  	#size-cells = <1>;
775f1f7eacede5 Max Filippov 2018-11-05   8  	interrupt-parent = <&pic>;
775f1f7eacede5 Max Filippov 2018-11-05   9  
775f1f7eacede5 Max Filippov 2018-11-05  10  	chosen {
775f1f7eacede5 Max Filippov 2018-11-05  11  		bootargs = "console=ttyS0,115200n8 debug";
775f1f7eacede5 Max Filippov 2018-11-05  12  	};
775f1f7eacede5 Max Filippov 2018-11-05  13  
775f1f7eacede5 Max Filippov 2018-11-05  14  	memory@0 {
775f1f7eacede5 Max Filippov 2018-11-05  15  		device_type = "memory";
775f1f7eacede5 Max Filippov 2018-11-05  16  		reg = <0x00000000 0x80000000>;
775f1f7eacede5 Max Filippov 2018-11-05  17  	};
775f1f7eacede5 Max Filippov 2018-11-05  18  
775f1f7eacede5 Max Filippov 2018-11-05  19  	cpus {
775f1f7eacede5 Max Filippov 2018-11-05  20  		#address-cells = <1>;
775f1f7eacede5 Max Filippov 2018-11-05  21  		#size-cells = <0>;
775f1f7eacede5 Max Filippov 2018-11-05  22  		cpu@0 {
775f1f7eacede5 Max Filippov 2018-11-05  23  			compatible = "cdns,xtensa-cpu";
775f1f7eacede5 Max Filippov 2018-11-05  24  			reg = <0>;
775f1f7eacede5 Max Filippov 2018-11-05  25  			clocks = <&osc>;
775f1f7eacede5 Max Filippov 2018-11-05  26  		};
775f1f7eacede5 Max Filippov 2018-11-05  27  	};
775f1f7eacede5 Max Filippov 2018-11-05  28  
775f1f7eacede5 Max Filippov 2018-11-05  29  	clocks {
775f1f7eacede5 Max Filippov 2018-11-05  30  		osc: osc {
775f1f7eacede5 Max Filippov 2018-11-05  31  			#clock-cells = <0>;
775f1f7eacede5 Max Filippov 2018-11-05  32  			compatible = "fixed-clock";
775f1f7eacede5 Max Filippov 2018-11-05  33  			clock-frequency = <40000000>;
775f1f7eacede5 Max Filippov 2018-11-05  34  		};
775f1f7eacede5 Max Filippov 2018-11-05  35  	};
775f1f7eacede5 Max Filippov 2018-11-05  36  
775f1f7eacede5 Max Filippov 2018-11-05  37  	pic: pic {
775f1f7eacede5 Max Filippov 2018-11-05  38  		compatible = "cdns,xtensa-pic";
775f1f7eacede5 Max Filippov 2018-11-05  39  		/* one cell: internal irq number,
775f1f7eacede5 Max Filippov 2018-11-05  40  		 * two cells: second cell == 0: internal irq number
775f1f7eacede5 Max Filippov 2018-11-05  41  		 *            second cell == 1: external irq number
775f1f7eacede5 Max Filippov 2018-11-05  42  		 */
775f1f7eacede5 Max Filippov 2018-11-05  43  		#address-cells = <0>;
775f1f7eacede5 Max Filippov 2018-11-05  44  		#interrupt-cells = <2>;
775f1f7eacede5 Max Filippov 2018-11-05  45  		interrupt-controller;
775f1f7eacede5 Max Filippov 2018-11-05  46  	};
775f1f7eacede5 Max Filippov 2018-11-05  47  
775f1f7eacede5 Max Filippov 2018-11-05 @48  	pci {

:::::: The code at line 48 was first introduced by commit
:::::: 775f1f7eacede583ec25ed56e58c4483f2b29265 xtensa: virt: add defconfig and DTS

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
