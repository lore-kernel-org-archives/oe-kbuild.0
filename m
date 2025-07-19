Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8754121D59B
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752908506; cv=none; b=NF29DJI0GR4CFCrdHJ09WEAChdL2pRd+jYiuPmKbMEgRBdbf7F1QfG6vK5LjMtomFEDzzRVC1THBFLdNwRWIEbmm2OXzukolWXlrYd1Yj50ONdXTHdRIfZfbIwVrCrF9aLCS1GE7i7VLad6+VegAbhlpQykUlNRs+gMJu+O3pEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752908506; c=relaxed/simple;
	bh=sqei2R0QJlG6kq62HjbPCFNEazW4RFfD0nCErg+LOYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G3JEjR7OKgqYKLtpdUrHWTthNjEvx8mYKGpzKKuiVCbbV5hCs9OnoIpettsIY3Qo3fF8rux5Tyg/inefdrdOCUhlRzciYAjnRsuxF/kyvPkY6Mx5D2Kt3UaT1XeUMtOxTignpfHKIWuAX75nSEsaOlrMelqx0JNUCbyk0yjL2E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKmPuX3e; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKmPuX3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752908504; x=1784444504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqei2R0QJlG6kq62HjbPCFNEazW4RFfD0nCErg+LOYs=;
  b=nKmPuX3efbAiNqVb44EImyeFkBboPGNfdJ8RFJdEdb+VwtyDNLiIDH9D
   gQGmcYlVb6y49pth5KMyRnN8Dr6x3ByyN5MTSHLMGkQFsSbGXGEyaNzF1
   yUo1zeL8Mxa2x6dIHUlObGUPVOEAet7+/NxAPuykamAZteO0MZl5zU4rG
   eTIEQSlfxrqmz8cIdnHVGRCON2LNUpnz48/hv8C5HoxsdH2Up+drotOnV
   YHMr20BvPPqjXxRL0tZRDlaP830+4Xf+foHG90yYsLTbdSDqCoHYOuqv1
   5bfJh232dKdW+iWaj8LgT1FTkXgLK+sfBgj88Z7yqXKJsZzjf0QIcJLPG
   g==;
X-CSE-ConnectionGUID: gH1slWx2TIajAhumSAf8pw==
X-CSE-MsgGUID: rG+bUzluTdaZgpSmF+Beeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="65888108"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="65888108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 00:01:44 -0700
X-CSE-ConnectionGUID: tMHrcmWYTMeJ+zOxC1ExSg==
X-CSE-MsgGUID: U/Zig4FAQnC7cWwKjuBEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="158841459"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jul 2025 00:01:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud1Zk-000FIR-1d;
	Sat, 19 Jul 2025 07:01:40 +0000
Date: Sat, 19 Jul 2025 15:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/7] arm64: zynqmp: Remove undocumented arasan,has-mdma
 property
Message-ID: <202507191414.m4VMMAAP-lkp@intel.com>
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
In-Reply-To: <6567a0855ad73b5ff01d9945063014fbacdcc845.1752835501.git.michal.simek@amd.com>
References: <6567a0855ad73b5ff01d9945063014fbacdcc845.1752835501.git.michal.simek@amd.com>
TO: Michal Simek <monstr@monstr.eu>
TO: linux-kernel@vger.kernel.org
TO: monstr@monstr.eu
TO: michal.simek@xilinx.com
TO: git@xilinx.com
CC: Conor Dooley <conor+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
CC: "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6832a9317eee280117cd695fa885b2b7a7a38daf]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/arm64-zynqmp-Use-generic-spi-name-in-zcu111-revA/20250718-184904
base:   6832a9317eee280117cd695fa885b2b7a7a38daf
patch link:    https://lore.kernel.org/r/6567a0855ad73b5ff01d9945063014fbacdcc845.1752835501.git.michal.simek%40amd.com
patch subject: [PATCH 2/7] arm64: zynqmp: Remove undocumented arasan,has-mdma property
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-052-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191414.m4VMMAAP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191414.m4VMMAAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507191414.m4VMMAAP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
