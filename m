Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908BA169AE6
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099214; cv=none; b=iK5SDRQacMvW8RxxJC4XWk0web1nXAehrDdKF868MgtRXaKom7mRogruDmvW+lCTCCF2T3ShvAeOyDp9wjE/MOasw7THFubKv6nX0n9VgaW0UfkWQsfjdcNN9rMk/I/icBGF67cF93/i1Z8QHDxFx/UvgTWm1+NIlSD1P350d2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099214; c=relaxed/simple;
	bh=IgjJv9yQ0ICyp8Rf5O4nVjPlribCcxgFcLpKLyTr5Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrVRiE/30LICiel9nls8ijV+GP5dAHyKtnQDTh9TUdcgGlnBV56P+iMzRz8gQR/eyjcfv6P4VPxyo84QvbNFFb9QQTpSxXuWCORM6ZeYqEy414/DkYlOpAaqeykEtEwDD335xdUQ6ktT+nqRa83MW6kwjjGKcp3ghoDMHGlZm58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBxiB+Eg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBxiB+Eg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757099213; x=1788635213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IgjJv9yQ0ICyp8Rf5O4nVjPlribCcxgFcLpKLyTr5Mw=;
  b=TBxiB+EgDKlX5WN9YA/93gueKWrCC+l8hxuq1KEcUIPRlJ298n1/ki+N
   gRnvl1xtONZDGNENZE44DPjq76kk7MraWDFFU2LPswsdRF3dhX6KcwQ+6
   kxx2Eh78zTMYCpIRWaf3VCMUmqnsMxTyd5mpHwIYMnyPVKOjy4fRzrm3P
   1Vp4BFDXOMRPMQiLoGfm2rheOLxi1yamtteOqiRgHy3fL3+1X6rtcB8Vs
   Go/R2ZMkk2VbXi8dmQ9OGiWDAwQDjnNjqRYHFKnRSG0lVV/9Bh1iEEfxY
   9CvfVTZfd54Aunx2CdLjiwAJ3d2F4T7VuEvqiCJsGoB2bkncys2QdDCZ0
   Q==;
X-CSE-ConnectionGUID: e3Lw6f+WTnid59imuUXqBA==
X-CSE-MsgGUID: 40M/qAOcTdCOPcHq/fb4NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70884832"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="70884832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 12:06:52 -0700
X-CSE-ConnectionGUID: TOQMSb5ORqWT4OgzX1Z70w==
X-CSE-MsgGUID: H7EOyy3XSR6UXCct05eVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="171785033"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2025 12:06:51 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uublo-0000k3-2V;
	Fri, 05 Sep 2025 19:06:48 +0000
Date: Sat, 6 Sep 2025 03:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm: dts: sun4i-emac enable dma rx in sun4i
Message-ID: <202509060228.oxXq7DhZ-lkp@intel.com>
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
In-Reply-To: <tencent_64909A540A8CD9063D28DEFD0A684AF9B709@qq.com>
References: <tencent_64909A540A8CD9063D28DEFD0A684AF9B709@qq.com>
TO: Conley Lee <conleylee@foxmail.com>
TO: kuba@kernel.org
TO: davem@davemloft.net
TO: wens@csie.org
TO: mripard@kernel.org
CC: netdev@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-sunxi@lists.linux.dev
CC: Conley Lee <conleylee@foxmail.com>

Hi Conley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Conley-Lee/arm-dts-sun4i-emac-enable-dma-rx-in-sun4i/20250901-171031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/tencent_64909A540A8CD9063D28DEFD0A684AF9B709%40qq.com
patch subject: [PATCH] arm: dts: sun4i-emac enable dma rx in sun4i
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250902 (https://download.01.org/0day-ci/archive/20250906/202509060228.oxXq7DhZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060228.oxXq7DhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509060228.oxXq7DhZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-cubieboard.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-itead-iteaduino-plus.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-marsboard.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-pcduino.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
--
>> arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
