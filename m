Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE01A9F88
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496204; cv=none; b=JUS7hTt5LeIRIqhrCgSWHed4sotugs6QtevudOjVaZVC9BYjosB7k7Ivb9sNuUBGXbEEoLxF0W+xOQ+MioVSRy+2dfgl3klCE5j7RZxYEJwNkzJqJ1r4r2hJzc2PpPmFChzM2XlAqN9c1rhX5T4Qj8i6aBnCqit2LIj/sE98Avs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496204; c=relaxed/simple;
	bh=3krhLYCHvpz34oJOSp9ZZX8BmwwSRkSz4s0ucZcMj6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9HqFEY1QGGPH8fNEomC1DO9HfS8sFg/DLyjitb0ebvHEPISU9xAnlCQD6J9R6gIfKYWGtMp/sd5AHUQGfltpApQ3plVg+YYJQbhW58633A3UKekPQudh3JSvylUeHK/CCzSUWAB2FFDHMkpNIlcDel4gT7RbwaO6sc8mFLOUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwFYBxrT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwFYBxrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496202; x=1798032202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3krhLYCHvpz34oJOSp9ZZX8BmwwSRkSz4s0ucZcMj6o=;
  b=PwFYBxrTIqsx/wp6fVtiMoiWC9iriTq3+URTh/i+g9F0jMdjy5XrqnFv
   caP4jeleZHqSB6Jc089SIZBcaMvEDe+/oG7KDXIj8/aMZtFgnYTHozCdq
   dl/c2ymYCFVTMYZJZaajjI5sl1ff3gCFyLSP8Wnn/Y3vr5sxBE1JaF/sg
   KLRqWzHoDq7ydQlFESn1yzzIdzauI2bklCVv9dg0jjDRp2VFp5Vzbog/z
   kI04BZ/lfOkrjS1xGxDUHH9xyJ/qd6+TJHwt+Ye2xQOiOyXrFR6NCSrHZ
   sNVwNp+EO0MunSTDegYUGuZZF44ui/A4QkmKAinL0HICGrvKWhFHbydZz
   Q==;
X-CSE-ConnectionGUID: oaacsFIDRuKn1apDcphyEQ==
X-CSE-MsgGUID: w1oO8dy9TOWu8xVm8aJFDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68226158"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68226158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:23:22 -0800
X-CSE-ConnectionGUID: 5yb7joUGQnaIui1K1lHTLA==
X-CSE-MsgGUID: vx5ho6HBSJupWRrncUzsmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199691767"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 05:23:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2MA-000000001xd-2ILy;
	Tue, 23 Dec 2025 13:23:18 +0000
Date: Tue, 23 Dec 2025 21:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/8] phy: axiado: add Arasan eMMC-PHY for Axiado
Message-ID: <202512232108.SCc2Ad7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/axiado/phy-axiado-emmc.c:258:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-2-5457d0ebcdb4@axiado.com>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-2-5457d0ebcdb4@axiado.com>
TO: "Tzu-Hao Wei" <twei@axiado.com>
TO: SriNavmani A <srinavmani@axiado.com>
TO: Prasad Bolisetty <pbolisetty@axiado.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Harshit Shah <hshah@axiado.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Michal Simek <monstr@monstr.eu>
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: "Tzu-Hao Wei" <twei@axiado.com>

Hi Tzu-Hao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzu-Hao-Wei/dt-bindings-phy-axiado-ax3000-emmc-phy-add-Axiado-eMMC-PHY-document/20251222-165544
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-2-5457d0ebcdb4%40axiado.com
patch subject: [PATCH 2/8] phy: axiado: add Arasan eMMC-PHY for Axiado
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: loongarch-randconfig-r133-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232108.SCc2Ad7g-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232108.SCc2Ad7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512232108.SCc2Ad7g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/axiado/phy-axiado-emmc.c:258:1: sparse: sparse: bad integer constant expression
   drivers/phy/axiado/phy-axiado-emmc.c:258:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/axiado/phy-axiado-emmc.c:259:1: sparse: sparse: bad integer constant expression
   drivers/phy/axiado/phy-axiado-emmc.c:259:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/phy/axiado/phy-axiado-emmc.c:260:1: sparse: sparse: bad integer constant expression
   drivers/phy/axiado/phy-axiado-emmc.c:260:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/phy/axiado/phy-axiado-emmc.c:260:1: sparse: sparse: bad integer constant expression
   drivers/phy/axiado/phy-axiado-emmc.c:260:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +258 drivers/phy/axiado/phy-axiado-emmc.c

c69e10e2d9b006a SriNavmani A 2025-12-22  257  
c69e10e2d9b006a SriNavmani A 2025-12-22 @258  MODULE_DESCRIPTION("AX3000 eMMC PHY Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
