Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7B41898F8
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766674122; cv=none; b=VFCO8I9VMy+mhN7cQUxWey0kj2nM+YGAc5TbcEiDGtu0Aga4l6nFNQRZkSZb+5oYJS+kKyrc/XO+9N7uXDK0WYb0GYh1UgF3GjRNoLBk6IJSpHHtl6Eq7rMEBj0gzgnXov1+46m3nwzKnNZcB9fAbeiH6YGuVkr+yeAetMQw7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766674122; c=relaxed/simple;
	bh=DksOJFmW71rj86mG8G+PhG27mprfTMufcQ3K/mqWl90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tvMiYXylAVMy25S/lZoxbz/lSOtyjoelyM4MvkAgHitZAAEt8imSS2SyVTzE/5jDw+q102V3v9K6NXHJA64exlRp2tMpdYdRHWVbBrFX8yiV0gQhk9qhLqvdJDZFyKLshikuKvIB5MJxdppDG8j3IGWn5CNT6R4QocOqwIYbUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrUuXv94; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrUuXv94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766674121; x=1798210121;
  h=date:from:to:cc:subject:message-id;
  bh=DksOJFmW71rj86mG8G+PhG27mprfTMufcQ3K/mqWl90=;
  b=OrUuXv94rs7fJ6Z7DKhZdBKHOeNl6nVIFsJJRMUxDErWPxpN+RCfPtn9
   9+HEjX+OqOcEABQ0cwRstlQwuTFc7oXTYM2CoKL+oBLmoBdK+j0VeBwhW
   OXuTwpJ7T5KOlzZ7EWBgpZ8JVkD0hdJ9elvsBqSuwCtS+A90TD1kxCLsB
   MSASzHRiSPU7KTtPIJ9308fg0Uf12JEarm5DTFwMU4y+ADwszpf3Dmpy4
   z0sG5MqosJb5rMDqRoe2UigMUL+aFNG65HmGFwyLMYQjv5szGuCr40rps
   54aj4i7qLX58U5Q5nnv+FoiblHlIQHBw+6sd7QTyt2HFwC9SFCBIirhF8
   w==;
X-CSE-ConnectionGUID: lDfvJPThSs6IlBmtkNytmg==
X-CSE-MsgGUID: AZmc+35WROiAGaC/C5UkJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85889371"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="85889371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 06:48:40 -0800
X-CSE-ConnectionGUID: 0s8r2Vc4Rl6dYWQv52u0IQ==
X-CSE-MsgGUID: bnWSNyBrRGmAZRTRwTRP0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204758725"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2025 06:48:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYmdo-000000004At-2cX6;
	Thu, 25 Dec 2025 14:48:36 +0000
Date: Thu, 25 Dec 2025 22:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: wcd9335_slimbus_irq(): unexpected
 end of section .text.wcd9335_slimbus_irq
Message-ID: <202512252246.o6yR92g9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-102-20251225 (https://download.01.org/0day-ci/archive/20251225/202512252246.o6yR92g9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252246.o6yR92g9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512252246.o6yR92g9-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: aw_dev_dsp_update_cfg.87610(): unexpected end of section .text.aw_dev_dsp_update_cfg.87610
>> vmlinux.o: error: objtool: wcd9335_slimbus_irq(): unexpected end of section .text.wcd9335_slimbus_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
