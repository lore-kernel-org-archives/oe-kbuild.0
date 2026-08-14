Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C872137A82C
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 21:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742748; cv=none; b=umcVoHqYk2XECpO9kJoSNu0nVSiv85+ICklmWRzDXZETxoeTJk3m004eTunWd3GbO728pvQaSVHrb6RtLzz9eCR0tcoG/4yawfUlVa/wEkBiQXJBAwmbUJqURENGVoYfw2vZ1NuOtBFKp3OHLUQ6Fb5g4lZNQyKKpVR35XhhL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742748; c=relaxed/simple;
	bh=M82+GvhhnMt3/mQxrfckHZCvWiVypBOXKbRl9xRg/+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m/2/2Yyfr9s2rEZNYSsAMHK3jDDdxKVAwqVzd3fikxIG7guZvbsBQcu3k1E6LA/mMN7SqouY9rrPUto7uRUmTDXOzfIapgSipcSPLTcyWFxdO8FAQomxpQ7VL6ZQ0bH23hxFmwkQg4CYyeq8JTfLoRWX/nxqhFP0AfHiCOW2URY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epv12jax; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epv12jax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786742747; x=1818278747;
  h=date:from:to:cc:subject:message-id;
  bh=M82+GvhhnMt3/mQxrfckHZCvWiVypBOXKbRl9xRg/+I=;
  b=epv12jaxN2VosfSEgyglxKpnUp+zVV7Ka/ZseEE1SB0N8jRbQttgLS/o
   QHi+n038S485kq9NwzhoJtVhwUpZo+ZmFjXUsNGoicJr374qYZwF2ASji
   XXhFvj/8qHFu38NA9HLFUDMTHzMzJp9fS+5ZMiTZtBNrpWY5B4ahGWxhz
   KWC9PaAD/LHjw8iJd/7lGm67vkVpLksrVwCIi2u0vbZRECSYsUAwEaq2I
   1Vaj27xgVZVUgQqMNklJPLshhDrcXQeejb83fBqSV2pUUsKrbUdg/+LpX
   kflL1S+ZgJ44rrvtsiMOtdap6kO/3FAtrIv3EziXaKgeSGTSnbb1X8sDG
   A==;
X-CSE-ConnectionGUID: 97YbEoJESyqDWrc+GvcLqw==
X-CSE-MsgGUID: GtAMA1vURvOk12ffE+t/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87346996"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87346996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 14:25:46 -0700
X-CSE-ConnectionGUID: CxnHLJCXSoKb5g+ZcgJx8g==
X-CSE-MsgGUID: QH/t5SKgS9G2/CTCxXeg8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="302563640"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2026 14:25:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuzPL-000000006JL-274O;
	Fri, 14 Aug 2026 21:25:43 +0000
Date: Fri, 14 Aug 2026 23:25:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb:
 nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <202608142331.KeRj7Vfy-lkp@intel.com>
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
head:   a5161661ae99f497affa83a5b8654e457cda6267
commit: 7044b13e008d7033f2e966603a507401b11f913a arm64: zynqmp: Remove undocumented arasan,has-mdma property
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260814/202608142331.KeRj7Vfy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142331.KeRj7Vfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7044b13e008d ("arm64: zynqmp: Remove undocumented arasan,has-mdma property")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608142331.KeRj7Vfy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
