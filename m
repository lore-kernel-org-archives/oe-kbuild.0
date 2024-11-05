Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D2134AC
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794347; cv=none; b=FXGfQlv3wqaVXZ+bi6B0D1qRiQlx01zggpwNKFsSSARFGI+7Gs7Pep2d4iPKA4rtHBLWik4BICdCrto0BY0v1UbqhtfTe7llIdDe9Ul5p+AT3qGoTwqKQ4KlTwBgu2sh+VsC1htfch/Rkyu0f23BvvewdPTFoCV38hGVhCQer+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794347; c=relaxed/simple;
	bh=dhATLPrsj6+XWJhfrIoPdhUw27N2hAikdcS4Xb5docg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+1dzcuWuR2In6r1bjrJ8sWz2n+6Cht+RAXS3JR5dakTOW4fUjljsG3LxcQWPe4WXF1bSRE6L0ulPLp71MHUaZFMY0p7BebNWWCmmPTjOdpUo1oeNbeLhhNSx39iXSRBSObMA7YCZWT130CVRNWlf/kJI0qZj02kh+ocJU39sF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxNhyegf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxNhyegf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730794346; x=1762330346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dhATLPrsj6+XWJhfrIoPdhUw27N2hAikdcS4Xb5docg=;
  b=HxNhyegfe5dsV/kJSR9dx/dZpDabrHRGKGjJAYhK6POJlmCJmJ4iuqyA
   w+xS9JoNLrd41d0pS+1UtbXfSxqi7UQ4iKAgl6MwUK3Zac7xi3OzEzTPQ
   f0s+O6QblpprZLJIZSNDwAf43vcjXdtIFqIl1mNDKF74t+y7D1vjLwgv0
   VSLVW1n79wbf4JjqXpLfW37gcPG6W1aIwQYCfoEU8fa5s0TOHlj28ROJ5
   9FYsz+5R8ngPy5w6AKFvuhgaAi2uDQlPGhVTPfB57xTNG/jtcJnedO/9d
   QsF1xupUYa85Ie9jL2Qk4lLs++RJRMQPbOCu+TIR7gWzdBU7ktpfV6mYM
   g==;
X-CSE-ConnectionGUID: 5J229PFcTQmB5dtpojW8Vg==
X-CSE-MsgGUID: togE4t3HSUafNjt7FYNqIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18145291"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="18145291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:12:17 -0800
X-CSE-ConnectionGUID: MjWj0gayR2mod5TfvqsgEA==
X-CSE-MsgGUID: F7yepkBKRpiUtbcGxytIgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83809606"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 00:12:15 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Efc-000lnx-1l;
	Tue, 05 Nov 2024 08:12:12 +0000
Date: Tue, 5 Nov 2024 16:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 80/92]
 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb:
 /soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with
 compatible: ['microchip,mcp23018']
Message-ID: <202411051626.CvMUrJb9-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   6c5789c9d2c06968532243daa235f6ff809ad71e
commit: 2b5a5006a68b199a52a6e6e4468260ae010bb8a7 [80/92] arm64: dts: imx8mp: Add Boundary Device Nitrogen8MP Universal SMARC Carrier Board
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051626.CvMUrJb9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051626.CvMUrJb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411051626.CvMUrJb9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: /: failed to match any schema with compatible: ['boundary,imx8mp-nitrogen-smarc-universal-board', 'boundary,imx8mp-nitrogen-smarc-som', 'fsl,imx8mp']
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: /: failed to match any schema with compatible: ['boundary,imx8mp-nitrogen-smarc-universal-board', 'boundary,imx8mp-nitrogen-smarc-som', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: /soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with compatible: ['microchip,mcp23018']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
