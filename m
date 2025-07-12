Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56703B672
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752292977; cv=none; b=qbXKx8Bfkdj6VSYA2sxpz1SynPRXh65DXq60EaCFG5q8kxeKXxtkf4z6q7ufr1l8R0j3Qk/z3OUFaYo2P9VNl4cZwGOyIutm+YpXn3q2tImC6jZG/05NjTqoMhku35a7AvPnTiejlMgl1rk/lxIoBeAxc3osCSXvMTtqNved+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752292977; c=relaxed/simple;
	bh=x+vSOQjuO3IKygkgrjkpZjLX9dTVUJ1g6Pq4YgwC7cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/5HHfNb970JB0oB2ZpdMxZA6+tGNG3mm/q8DPTnYJxrMo3EQiHiynCbx/1t5yL7Dm1+6VyCTdy3kvyPllDGYm9F8vprhtUPPSxFZVdBX2uYDdCafrXcnIri6qgjLdVeqCdLeWZ2mQwlV9Ks5PpOxHU4f+s8dJtsO+2NbkbMR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOktfXIx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOktfXIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752292976; x=1783828976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+vSOQjuO3IKygkgrjkpZjLX9dTVUJ1g6Pq4YgwC7cg=;
  b=XOktfXIx1GohGaNrfcccUg2aPYk2E5QFtEoZ8ilqQ6pc1OfxWZLn9B/E
   zyP4Xqq1Z3iWxro12OORwr1dTdW1yejnvxNIkoWvmqzLslf03OzbYGg+r
   jwG47N62PoBHSx08ZwFSLYm4xDcu1upKohxmDdJTiKRk5ZWjOQ4F6Lhqh
   Ia0e7oDkkZmrNLWt7VJLFw4Bvgkc+00vbONP1qapyS6y2WQRWrTuFZR9+
   h3QAdxbyhjXe+cmoxGNcyKpZJx+jQ3Fmzv3QpwEvfANhPYLlTmDK6RJgE
   GYodU42enqt//HGUuG+JxMi60ywr+qcuHV6Jf9xI1wfAWk2B5r0H5Abyl
   g==;
X-CSE-ConnectionGUID: P6+lq97PSRyo0uia3w4eVg==
X-CSE-MsgGUID: DwZCMVAySOer4YNxnXZkPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72032153"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="72032153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 21:02:55 -0700
X-CSE-ConnectionGUID: NNmLp4yHRHm/f29Q3+6+4g==
X-CSE-MsgGUID: D/cE/rIsRq2LP/MBPm0HAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="187500629"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2025 21:02:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaRRr-00072Z-0h;
	Sat, 12 Jul 2025 04:02:51 +0000
Date: Sat, 12 Jul 2025 12:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 03/12] arm64: dts: s32g: change pinctrl node into the
 new mfd node
Message-ID: <202507121152.n46AvPko-lkp@intel.com>
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
In-Reply-To: <20250710142038.1986052-4-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-4-andrei.stefanescu@oss.nxp.com>
TO: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
TO: linus.walleij@linaro.org
TO: brgl@bgdev.pl
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: chester62515@gmail.com
TO: mbrugger@suse.com
TO: Ghennadi.Procopciuc@nxp.com
TO: larisa.grigore@nxp.com
TO: lee@kernel.org
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: festevam@gmail.com
TO: aisheng.dong@nxp.com
TO: ping.bai@nxp.com
TO: gregkh@linuxfoundation.org
TO: rafael@kernel.org
TO: srini@kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: s32@nxp.com
CC: clizzi@redhat.com
CC: aruizrui@redhat.com
CC: eballetb@redhat.com
CC: echanude@redhat.com
CC: kernel@pengutronix.de
CC: imx@lists.linux.dev
CC: vincent.guittot@linaro.org

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v6.16-rc5]
[cannot apply to shawnguo/for-next next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20250710-222538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250710142038.1986052-4-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v7 03/12] arm64: dts: s32g: change pinctrl node into the new mfd node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121152.n46AvPko-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121152.n46AvPko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507121152.n46AvPko-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: pinctrl@4009c000 (nxp,s32g2-siul2): 'gpio-reserved-ranges' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: pinctrl@4009c000 (nxp,s32g2-siul2): 'gpio-reserved-ranges' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
--
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: pinctrl@4009c000 (nxp,s32g3-siul2): 'gpio-reserved-ranges' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
