Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A4A27AC54
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454927; cv=none; b=Bx9X4cI9Wzwjee3oY75iLHlEhaiiQOaZYJ42gIksYZowkZApMipwW6hHGtBelamRJlvTJ8NJQCEiuMdiS5C2SqifyyCIeDzPSr4bCEvmYCOtPN3uidQcedyBA2QEa0CmGx93SkocbcGCiARmJNxZk9oKH8octrrBEe7oZV2nX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454927; c=relaxed/simple;
	bh=KnP7rjQ/CT5n91jw2UTmMhQzE7FCYZJm1qKF0gDLUmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPDoo39S7GrZqPrynreyxtna3qbylUwpV+BkGdCsg6xFMW3Mqsn81YFQZwFgtOvFvjHjs+NR9zGM2wCTGdlwNaBzPQb49xDj7L28CvSly1f54c528onaMYGIrQxUr3qY7AO4N+NMmQxIrA7eqbhrF2/dss5HYB3FKKb14ZxrUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHwJTbHc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHwJTbHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454925; x=1800990925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnP7rjQ/CT5n91jw2UTmMhQzE7FCYZJm1qKF0gDLUmo=;
  b=fHwJTbHczGqchr/A8U7eEGEbJceftk7PIf1PvQ90ybiXzvoXHKbC7rjX
   6efro9cS01KDWs9bDg8s1PvdCTDv2USY/ItyCoyMj5uyaWUgI7Dzq1GFO
   9I9UGSaSP7d5dkpbYxzdIsLAv7PAEDcqIsQiXUoIPOwZILBXlvDcBGSnd
   quiLDIeD6mNH8ltUCFROFVd0aJ9qYyEuHDhqg+m0toXES3KdECXywJp3+
   XWKZXyHxwe8Eo0vBfhmNUAlYtlwq+bvFXTskrK3UZc9jabGaEPCZFiFSC
   9kGAR0rpBODVOwRLjc/uyZR2a3i4uHD19/yRnnM4oHQ/ZBWu5trydZVFF
   w==;
X-CSE-ConnectionGUID: lcXbwgSWT0+Ux3bUpjs6BA==
X-CSE-MsgGUID: 4UriZN/pRz+oo9hYLnJvuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74268262"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="74268262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:15:24 -0800
X-CSE-ConnectionGUID: fksM5JGFQ86n9Pd0BY88Jw==
X-CSE-MsgGUID: /oAHTHc/T4uPCtjG6DLE0g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 11:15:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkS3U-000000001aH-3Mu8;
	Mon, 26 Jan 2026 19:15:20 +0000
Date: Mon, 26 Jan 2026 20:15:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] MAINTAINERS: Add MAINTAINER for NXP S32G Serdes
 driver
Message-ID: <202601262033.u12bFIcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260126092159.815968-5-vincent.guittot@linaro.org>
References: <20260126092159.815968-5-vincent.guittot@linaro.org>
TO: Vincent Guittot <vincent.guittot@linaro.org>
TO: vkoul@kernel.org
TO: neil.armstrong@linaro.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: ciprianmarian.costea@oss.nxp.com
TO: s32@nxp.com
TO: p.zabel@pengutronix.de
TO: linux@armlinux.org.uk
TO: ghennadi.procopciuc@nxp.com
TO: bogdan-gabriel.roman@nxp.com
TO: Ionut.Vicovan@nxp.com
TO: alexandru-catalin.ionita@nxp.com
TO: linux-phy@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: netdev@vger.kernel.org
CC: Frank.li@nxp.com

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master pza/reset/next v6.19-rc7 next-20260123]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/dt-bindings-serdes-s32g-Add-NXP-serdes-subsystem/20260126-172534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260126092159.815968-5-vincent.guittot%40linaro.org
patch subject: [PATCH 4/4] MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262033.u12bFIcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601262033.u12bFIcc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/nxp,s32g-serdes.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
