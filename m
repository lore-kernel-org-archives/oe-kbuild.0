Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C52DC788
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 00:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972677; cv=none; b=mpCbSt8Rd6PeO0CAATGRUMPhWC6jt/k4B809YP9w/sPX23SXBR5c56Zfrx8WSLw1WYPkIWlS5ATcI3C1Sc7PZ9AU/0GB9aGe5n48Cz2E7W9lfivGIT1jm2eOrkb73K4pV2qCsQ/bb6zTaWeh1/yY5UhiAC0ji/6F208ilWaNo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972677; c=relaxed/simple;
	bh=/hy6yeQt2yIzd/L9Yuo9rODiVTY1/T4LLt6Iuc3KUvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZht32IEjNjTUE2gPgU4fOsOmZqRcNuk3dorRmOmRGKYlVjEmWMlYfBLOXEGHCgK0DGc8cp881MlVH3ns10ZSjvBqCxhYvyx50sVbQs98XeQ+TIkrMLYaembe7V6M4gLKHuI24+ctPB2fVPmDW2onfLWhGyO4aLmu//mmYV6L6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3i/7L5r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3i/7L5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745972675; x=1777508675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hy6yeQt2yIzd/L9Yuo9rODiVTY1/T4LLt6Iuc3KUvM=;
  b=T3i/7L5rd6PCghfUYEMAsGza/bS3wDpoTFSYvP50DaBOiVe1wXbbl4qu
   sXnDTyKrx8X+Kt71L60IgBX8gz0gblZZCnlfNGyCAFElnv88bEW2edsbR
   AVx9rx15PtAUChLNrLlkeFXrHR5XPzCe9HypU13xbOhZxhuIWVjDU/h54
   3d9eEN15zsr+aSuFy3b8JTFtOPcNvjsi424M7CRwtIrD62nx8al16pWYR
   x7WwEbpYBIZopvQSp6okEzxpJbPh9EUAcwt6NgNC9ON3NRSYXf4/zKCes
   gOot9qcsdhvlpsSasPsyAHtkpgc6MElYZ1wuM2BSggtm1UIJLl8ozrgcE
   A==;
X-CSE-ConnectionGUID: /nI1OVb7Rzaw/8dU5jg4rw==
X-CSE-MsgGUID: 9TnXn363QA2bUolo52oM6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58251871"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58251871"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 17:24:34 -0700
X-CSE-ConnectionGUID: JdJ/sbW0Q8C44BW1+qsD3g==
X-CSE-MsgGUID: 44elbziLRjqgBrUie9cmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="138786385"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 17:24:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9vFW-00032P-3A;
	Wed, 30 Apr 2025 00:24:30 +0000
Date: Wed, 30 Apr 2025 08:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] ARM: dts: rockchip: Wifi improvements for Sonoff
 iHost
Message-ID: <202504300816.UPjewbSf-lkp@intel.com>
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
In-Reply-To: <20250427065013.99871-2-hao.zhang@coolkit.cn>
References: <20250427065013.99871-2-hao.zhang@coolkit.cn>
TO: Hao Zhang <hao.zhang@coolkit.cn>
TO: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: conor+dt@kernel.org
CC: heiko@sntech.de
CC: krzysztof.kozlowski+dt@linaro.org
CC: robh+dt@kernel.org
CC: linux-kernel@vger.kernel.org
CC: "hao.zhang" <hao.zhang@coolkit.cn>

Hi Hao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Zhang/ARM-dts-rockchip-Wifi-improvements-for-Sonoff-iHost/20250427-155046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250427065013.99871-2-hao.zhang%40coolkit.cn
patch subject: [PATCH 1/1] ARM: dts: rockchip: Wifi improvements for Sonoff iHost
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300816.UPjewbSf-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300816.UPjewbSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504300816.UPjewbSf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: mmc@ffc70000 (rockchip,rv1126-dw-mshc): Unevaluated properties are not allowed ('supports-sdio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
--
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: mmc@ffc70000 (rockchip,rv1126-dw-mshc): Unevaluated properties are not allowed ('supports-sdio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
