Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406D4BEE43
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789530171; cv=none; b=HrQA87CMs2mUf/SafenUgyo7RmjZBQU3gUA1VCAxbWyP4+/03ZRmEN26K1OwQc9rCw+zzcO5ZcIzTqG51XhalMcidj+RVNayouoR6Ir2OoX9G5xLVhqKqOr522UBX4NyfHv2t1nSQsVUJF48mNXtUp1+KU9RZAKK+z3TLFoYz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789530171; c=relaxed/simple;
	bh=aH+LeSMrKqF1cV8vFStFboV2IYCEqPR2Ic9D6rdOL30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnOoDv2refrINrYTHs+pZ/3628ZIEbLlMAwWLauwPAxFX4wjP7EEdcXNmZvtm139GiM/vRGc7OB+rPcM97iVfEr1YY2p+A0kEuLi81xmD7eH61p6/lzAb67YHBrVTit1YP+QqgkCvm82aKStMsgKRbyDY2VXHf/gNg4SSTgCglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq/9QQkS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq/9QQkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789530169; x=1821066169;
  h=date:from:to:cc:subject:message-id;
  bh=aH+LeSMrKqF1cV8vFStFboV2IYCEqPR2Ic9D6rdOL30=;
  b=mq/9QQkS9GetwnuimHzEvsdiwUlm0hn/StXFX0bTZPXCCP2iwZZBzrbe
   YSZ9YkM/uZVMEVCUCnQN1hreLlufIcd97HvNkNXRZ+KquGOcbyFobWDve
   9TKq79tjv7VHgfG8JFUdLDkrKmMKj7PuoOIfl+ncub9otDZB1T3NTsGbT
   bbqPwxWE7T3soShlMVuSuo2JYkKbF/qDjg03/EwrO8l85+6DJgtdxzmWI
   tdfSIFiKY467LzWymDk61W7gFcz1XidtEbBX9HjWbdhdPiTnLyT6ULf7e
   upxWMrOlHmnE3sx3I5oX3WtYXwmuiPnZAiIVfyNs/3LqZbbZLHUh4KIzZ
   g==;
X-CSE-ConnectionGUID: B+E5jCSJRumI1IxLyaaPKQ==
X-CSE-MsgGUID: PdBv0HpHQ+iOdPWe5Pe9IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89659965"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89659965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 20:42:49 -0700
X-CSE-ConnectionGUID: mINAKhEJS3ysiun6rpkSKw==
X-CSE-MsgGUID: G9j2TUmjTE+8S6rMLUei8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269522754"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2026 20:42:48 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6gXm-000000000uF-0PXk;
	Wed, 16 Sep 2026 03:42:46 +0000
Date: Wed, 16 Sep 2026 05:42:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 6/7]
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb:
 /soc/i2c@d4018800/temperature-sensor@4c: failed to match any schema with
 compatible: ['sensylink,ctf2301']
Message-ID: <202609160530.kgtYCIzk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Yixun Lan <dlan@kernel.org>
TO: Troy Mitchell <troy.mitchell@linux.dev>
CC: Yixun Lan <dlan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git dt-for-next
head:   c37ee906b45bc06782fa1b69f3a53bace67ace66
commit: ad17d98848df3907d6732673a139e9ed832b547d [6/7] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: riscv-randconfig-2051-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160530.kgtYCIzk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160530.kgtYCIzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609160530.kgtYCIzk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/i2c@d4018800/temperature-sensor@4c: failed to match any schema with compatible: ['sensylink,ctf2301']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
