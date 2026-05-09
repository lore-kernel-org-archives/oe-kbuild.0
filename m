Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE6E27A92E
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 04:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778300844; cv=none; b=h9V6xUOUXOCWoAl4GzG9JnGeeNn1qCCa/OlorYlEZMd8rcAtuMhLs+yzeGjekI7xVAdwTWPZ2Hd01yvc+88MIFCP3FKdaxnwpiNiq5npcsBjNE3T/al1NEJH/9mXsPGoZUjSo93cS1O0LMwTwzKJE6cmz+qNV8AAEOdwe+FXwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778300844; c=relaxed/simple;
	bh=1QnHuzm6F3mlQMFWp8gdAdPVYpreiwoJXOELuyBSgGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=exO3y4t707YlzZn57FV5LgZYDcDbmvRAIiYaOGg44JAfzxWxvfknUaWtP4I4WFBrAbWKmLTbyoZE4OLP0EUBtM2Xn/iyIOcYZWUo6AsqqBUPGRzammUq5kfr8daw0EnSVNdvkKa88fgcus8vpBA6M/23hfPgnfytdwBdXd9j0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJnsfkQ+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJnsfkQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778300843; x=1809836843;
  h=date:from:to:cc:subject:message-id;
  bh=1QnHuzm6F3mlQMFWp8gdAdPVYpreiwoJXOELuyBSgGw=;
  b=RJnsfkQ+uerR7fOX+ZudY4QpqbUv3TEN5I0HTQuFt1jg/1dZ6GJcpk8P
   xiXdsRRpiusENp4Sh1EjAnCqpDhWPwP+Lb9B86W2r0ck7u/WTr67vn6M2
   rtwfzrYMGXykctDDhLX2zscqUV9vA9CfrcHYdUeYsKj1KV7fri4Vl/J9E
   vbaHixAGKNWKR/9qjlnoyb5+DgpVRXSKQz7fNhu34KX2qi4jcveaOX2GZ
   8T7dCZcaJspzJtSGXLoTpUP6jcOi194wUr7Zp2m9Hq9CGhimKumwe8ImA
   fUJlhPhF7bko8TGr+BReTC00Nca1iBNK9bf/PHAa1IAtzDCTjxZ46L4az
   g==;
X-CSE-ConnectionGUID: lchAhmhPQNq6F3OzWXD3vg==
X-CSE-MsgGUID: MawbuIy0QpeFYJT+9lyXQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="83146821"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="83146821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 21:27:22 -0700
X-CSE-ConnectionGUID: s5CZYd3nSLCEoTAJiWcWHQ==
X-CSE-MsgGUID: XNECJe/zSYibLCvuc1JxLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="260669894"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2026 21:27:21 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLZHb-000000007MJ-0wPu;
	Sat, 09 May 2026 04:27:19 +0000
Date: Sat, 09 May 2026 06:26:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb:
 nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <202605090642.wWFSUpOX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70390501d1944d4e5b8f7352be180fceb3a44132
commit: 7044b13e008d7033f2e966603a507401b11f913a arm64: zynqmp: Remove undocumented arasan,has-mdma property
date:   8 months ago
:::::: branch date: 53 minutes ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260509/202605090642.wWFSUpOX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090642.wWFSUpOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7044b13e008d ("arm64: zynqmp: Remove undocumented arasan,has-mdma property")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090642.wWFSUpOX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
