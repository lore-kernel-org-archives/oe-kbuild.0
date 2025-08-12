Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5162F169AE6
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754971986; cv=none; b=sQqmYZlyn/erZO+FM8QjD4mTNc/qya9l1Co4V9ENBfFW9BmtLp+K4WYndP/vN28He1XP21GbpI0sy8v7a1+Szg6QVvkI1ZIdmWETVvjbBwFGK2Kig+TTk2WoxA4/c/H/LMxDLF8yCrHI9An3yaJ96ev/dkqbZnlaUkJ/5HdjeJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754971986; c=relaxed/simple;
	bh=ZPBncExctwPgrLB5KxbsREbdi+CwXMNBkr9stVdHLUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHkfGvMNOEJR9kfYM3POg4Czo8jYzRnl26xazbq2qAhCVqU8PaY7pbG1+dSQj55clUTU2e9g9oTL26qq0rIYq0GxhlpKTor0gEStiH+zRUGGiVpxfdn2zxE0vsdsS0jU5lOOYCyhYaQIbcTxD544UIv+fLIVb/+gmLcSv3OdwVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtytETaA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtytETaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754971985; x=1786507985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPBncExctwPgrLB5KxbsREbdi+CwXMNBkr9stVdHLUU=;
  b=EtytETaAkgBZBcy4+pclzFzGxfv9vkpD0I7hWUb0YuaCVgQiXNwfw1ux
   RMK6ZT6nSJDIgjLFWZNXO2Bhann2TxjYhVf/zr8PLVaPmkb13KJwfdrTs
   LRuVR8zOLyriMRL2EEcsH5BFVHuLTR/VmLvvn68H4XJVCF2lxebLqRTnT
   kjk7vHrO0vjdEcjnYQnaW+s6IPUCYzvDY9s72loa01qTNYvLj5ORwSsif
   hWYdXNAVDyUIzbGv7YUD6sGUEjk4+u5bXk4sMxwkal71WvS3LhjMlJjBw
   ugtKGuSg0KX1rcfU0sFMsT9trfn98XQCwWMe3F/1uwIMRRz//8IKdeDma
   Q==;
X-CSE-ConnectionGUID: WsXmlmAOSjOrUGXa2qhg1w==
X-CSE-MsgGUID: wxyaOz/mSXudYlp/4c6xbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57382811"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57382811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 21:13:04 -0700
X-CSE-ConnectionGUID: ms8FoknWSfmqse1BLZirPQ==
X-CSE-MsgGUID: IK/LXevmQOObitQM8fK1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="196933528"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2025 21:13:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulgNg-0006P6-22;
	Tue, 12 Aug 2025 04:13:00 +0000
Date: Tue, 12 Aug 2025 12:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/12] arch/mips/boot/dts/mti/malta.dts:54.17-83.4:
 Warning (avoid_unnecessary_addr_size): /flash@1e000000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508121124.vV1vY373-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   c2a1a5ede4717e6f12d49fe5177a66d40cbf4847
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/12] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 11 hours ago
:::::: commit date: 15 hours ago
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20250812/202508121124.vV1vY373-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121124.vV1vY373-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508121124.vV1vY373-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/mti/malta.dts:44.33-52.4: Warning (unit_address_vs_reg): /interrupt-controller@20: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/malta.dts:90.11-93.5: Warning (unit_address_vs_reg): /system-controller@1f000000/lcd@410: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/malta.dts:103.6-116.4: Warning (unit_address_vs_reg): /isa: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/mti/malta.dts:54.17-83.4: Warning (avoid_unnecessary_addr_size): /flash@1e000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

vim +54 arch/mips/boot/dts/mti/malta.dts

e81a8c7dabac05 Paul Burton 2015-09-22  10  
e8823d26b4f18f Paul Burton 2015-05-22  11  / {
e8823d26b4f18f Paul Burton 2015-05-22  12  	#address-cells = <1>;
e8823d26b4f18f Paul Burton 2015-05-22  13  	#size-cells = <1>;
e8823d26b4f18f Paul Burton 2015-05-22  14  	compatible = "mti,malta";
38ec82fe21cd99 Paul Burton 2016-09-19  15  
38ec82fe21cd99 Paul Burton 2016-09-19  16  	cpu_intc: interrupt-controller {
38ec82fe21cd99 Paul Burton 2016-09-19  17  		compatible = "mti,cpu-interrupt-controller";
38ec82fe21cd99 Paul Burton 2016-09-19  18  
38ec82fe21cd99 Paul Burton 2016-09-19  19  		interrupt-controller;
38ec82fe21cd99 Paul Burton 2016-09-19  20  		#interrupt-cells = <1>;
38ec82fe21cd99 Paul Burton 2016-09-19  21  	};
38ec82fe21cd99 Paul Burton 2016-09-19  22  
38ec82fe21cd99 Paul Burton 2016-09-19  23  	gic: interrupt-controller@1bdc0000 {
38ec82fe21cd99 Paul Burton 2016-09-19  24  		compatible = "mti,gic";
38ec82fe21cd99 Paul Burton 2016-09-19  25  		reg = <0x1bdc0000 0x20000>;
38ec82fe21cd99 Paul Burton 2016-09-19  26  
38ec82fe21cd99 Paul Burton 2016-09-19  27  		interrupt-controller;
38ec82fe21cd99 Paul Burton 2016-09-19  28  		#interrupt-cells = <3>;
38ec82fe21cd99 Paul Burton 2016-09-19  29  
38ec82fe21cd99 Paul Burton 2016-09-19  30  		/*
38ec82fe21cd99 Paul Burton 2016-09-19  31  		 * Declare the interrupt-parent even though the mti,gic
38ec82fe21cd99 Paul Burton 2016-09-19  32  		 * binding doesn't require it, such that the kernel can
38ec82fe21cd99 Paul Burton 2016-09-19  33  		 * figure out that cpu_intc is the root interrupt
38ec82fe21cd99 Paul Burton 2016-09-19  34  		 * controller & should be probed first.
38ec82fe21cd99 Paul Burton 2016-09-19  35  		 */
38ec82fe21cd99 Paul Burton 2016-09-19  36  		interrupt-parent = <&cpu_intc>;
38ec82fe21cd99 Paul Burton 2016-09-19  37  
38ec82fe21cd99 Paul Burton 2016-09-19  38  		timer {
38ec82fe21cd99 Paul Burton 2016-09-19  39  			compatible = "mti,gic-timer";
38ec82fe21cd99 Paul Burton 2016-09-19  40  			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
38ec82fe21cd99 Paul Burton 2016-09-19  41  		};
38ec82fe21cd99 Paul Burton 2016-09-19  42  	};
38ec82fe21cd99 Paul Burton 2016-09-19  43  
38ec82fe21cd99 Paul Burton 2016-09-19  44  	i8259: interrupt-controller@20 {
38ec82fe21cd99 Paul Burton 2016-09-19  45  		compatible = "intel,i8259";
38ec82fe21cd99 Paul Burton 2016-09-19  46  
38ec82fe21cd99 Paul Burton 2016-09-19  47  		interrupt-controller;
38ec82fe21cd99 Paul Burton 2016-09-19  48  		#interrupt-cells = <1>;
38ec82fe21cd99 Paul Burton 2016-09-19  49  
38ec82fe21cd99 Paul Burton 2016-09-19  50  		interrupt-parent = <&gic>;
38ec82fe21cd99 Paul Burton 2016-09-19  51  		interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
38ec82fe21cd99 Paul Burton 2016-09-19  52  	};
0a46ffa3604ec6 Paul Burton 2016-09-19  53  
97af8e1cb31870 Paul Burton 2016-09-19 @54  	flash@1e000000 {

:::::: The code at line 54 was first introduced by commit
:::::: 97af8e1cb31870c6f4ca175d5eada7be5cc65e0f MIPS: Malta: Probe pflash via DT

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
