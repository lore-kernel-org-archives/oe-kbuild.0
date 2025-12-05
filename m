Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221E31ED71
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764921612; cv=none; b=lcuspGhV0fysx42xBJY41nYORyVFZuIKKPMwGJd6YaTSKxhHwBrB4vD3vaW/cEpWAdp2IbkQdz2xgYyNP8ijGKMsf8d1tQInQZi5nLhWBnOWznGRr0VKgVirt48BK3wGXf7Wcjxp0UkuPxImahIW3WvngfwqCmCDxk7zaeytYDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764921612; c=relaxed/simple;
	bh=v8XN5uohshKM5kbTxt+7pRs9zsoWrCKEqn90xE19Ld0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JrAHHXOyzJ+2xX75EUZAUBlVJI0XIaZkvaYre47w+tERVg0sNNu+lBJLOLc53X9wSWJM8/0XTplDIIWCrlD2ltVUwP2pNzfR+8vuEHB4isQPtS24RuUDaOOtVVd9qkNe44CsU5mjwQ6O7fPfgT0NIDjv3zXhNQUA21mddi/H3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvLKARmh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvLKARmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764921598; x=1796457598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8XN5uohshKM5kbTxt+7pRs9zsoWrCKEqn90xE19Ld0=;
  b=kvLKARmh+HcsR+cb1FtZDjdVMDt957IXrYX5z0EqI3BKlQ1lBnOT/vcl
   SsCIPD0vx6/TLsoOIZbV8yObAKpC5DZFSgXY/T1m4Vg7/008FoC9rPviv
   mso8Qj9mE+QpN9NVNapqsECMs1eTqf0EfO7BoUvWXJk7jV4/c9N0Ts8Y+
   JZC8z7OUCgrUbea/KuZIdpHJUyaYK+20/6w8FpFTODxQL6Uxa6Cuc527d
   MVif9vh5Xoez/OEZvEnvf3Aw6RFuHLEiwEgrHmv3VAPOCjVFlLtIp2C87
   ZsNbbqGH7MLdqEB+TXlqRMnJoOtJygA0Py1KdVO9p8eptCeE+e7hJYcQa
   g==;
X-CSE-ConnectionGUID: eofYyBVyRrqmGLMwzT6Irg==
X-CSE-MsgGUID: TRjLtXGIQIiJON35hVcU+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70803185"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70803185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 23:59:51 -0800
X-CSE-ConnectionGUID: YYewx07fSa2wnIq91kHQLg==
X-CSE-MsgGUID: qMpNGC1oQgqmSfqI12lqPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="199713227"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2025 23:59:50 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRQjD-000000000s5-1pCa;
	Fri, 05 Dec 2025 07:59:47 +0000
Date: Fri, 5 Dec 2025 08:59:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt/linus 18/87]
 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202512050857.uVqPLMR4-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/linus
head:   7209ff310083315386570bf8d001a0845fe7ab8c
commit: a6dcff26eb4dcb9178917c8c49b10265ee5f749c [18/87] yamllint: Drop excluding quoted values with ',' from checks
:::::: branch date: 6 weeks ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-2051-20251205 (https://download.01.org/0day-ci/archive/20251205/202512050857.uVqPLMR4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050857.uVqPLMR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512050857.uVqPLMR4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +19 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml

b245bd0eb43f8f Frank Li 2025-04-11   8  
b245bd0eb43f8f Frank Li 2025-04-11   9  description:
b245bd0eb43f8f Frank Li 2025-04-11  10    The Video Data Order Adapter (VDOA) is present on the i.MX6q. Its sole purpose
b245bd0eb43f8f Frank Li 2025-04-11  11    is to reorder video data from the macroblock tiled order produced by the CODA
b245bd0eb43f8f Frank Li 2025-04-11  12    960 VPU to the conventional raster-scan order for scanout.
b245bd0eb43f8f Frank Li 2025-04-11  13  
b245bd0eb43f8f Frank Li 2025-04-11  14  maintainers:
b245bd0eb43f8f Frank Li 2025-04-11  15    - Frank Li <Frank.Li@nxp.com>
b245bd0eb43f8f Frank Li 2025-04-11  16  
b245bd0eb43f8f Frank Li 2025-04-11  17  properties:
b245bd0eb43f8f Frank Li 2025-04-11  18    compatible:
b245bd0eb43f8f Frank Li 2025-04-11 @19      const: "fsl,imx6q-vdoa"
b245bd0eb43f8f Frank Li 2025-04-11  20  
b245bd0eb43f8f Frank Li 2025-04-11  21    reg:
b245bd0eb43f8f Frank Li 2025-04-11  22      maxItems: 1
b245bd0eb43f8f Frank Li 2025-04-11  23  
b245bd0eb43f8f Frank Li 2025-04-11  24    interrupts:
b245bd0eb43f8f Frank Li 2025-04-11  25      maxItems: 1
b245bd0eb43f8f Frank Li 2025-04-11  26  
b245bd0eb43f8f Frank Li 2025-04-11  27    clocks:
b245bd0eb43f8f Frank Li 2025-04-11  28      maxItems: 1
b245bd0eb43f8f Frank Li 2025-04-11  29  

:::::: The code at line 19 was first introduced by commit
:::::: b245bd0eb43f8f12353d9a61228eb4a61eff267b dt-bindings: media: convert fsl-vdoa.txt to yaml format

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
