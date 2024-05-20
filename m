Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C518030
	for <oe-kbuild@lists.linux.dev>; Mon, 20 May 2024 05:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716181653; cv=none; b=DxeJn4Sd3MACsvospASXKKTZWRvfZMRfDmHQg0Nb+ozdEzOKG+ul4wrBg7w0POkjy/xBXnqLcFHx3gyewAtCMj4uZ0sXpFOA8LfUU5DFKjFrIvWaF5yVDOov9YW3zYpeGFKzJeEMvLCxiDO1jlXuteHjVBoJJqQL/YkJOdacbek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716181653; c=relaxed/simple;
	bh=7FgjyPJo5UeEV0gYpG4rX9Ky42M03HSpvYgXVQ93uIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAS4PyJbRf6YIKPxE8x2Kx148MMLhtHWmftLFTwri4qlMNF2nFe6k3wVR7ha1qe34DoFBbnOfaqGw0sxuUq6fdlrwDU0ZtlgTUbebY5sIzHA2k+KtI+Yh/n11quu4nhSJ2e571uiGyXurM3CReB0hbWZnGYdXA0zEwkFwN0bJvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8DUwVmB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8DUwVmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716181653; x=1747717653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FgjyPJo5UeEV0gYpG4rX9Ky42M03HSpvYgXVQ93uIU=;
  b=e8DUwVmBMHt2ujvBArDLXlia8na/NG/FEcP3GDgtGKbyiHn0oafX00hH
   kYzXB4FMmg4HqVHh/BOB4r3tb3QxQx7trazoUARrvRfqztDEpTaB+7Gfs
   GPwQWB+VjV/XBhsIOcgXkhuOHaWEkQG5H4blkB73neD3L6LxYDh2APbqI
   0GI9cUFn7DyakbiDIR9yQTwO/M5gsL6pupS/6XN7BGctvTPb9m+R9pflg
   o2sROwPTCXQ3pw8TI1KDoPtG6k9S9wPUenwMkM0zIuGpjq0/VJy0tfFET
   DAb+0Kct8TjQ6bMhYxwArwfRz6bjHXNZQd/LBzbPypQm9iUHrZc3LIId6
   A==;
X-CSE-ConnectionGUID: bPJTUCo8Qmy3XJpBB9xHQQ==
X-CSE-MsgGUID: w76KAAq6SsKqRNv95lokTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12161182"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12161182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 22:07:32 -0700
X-CSE-ConnectionGUID: QfHocn9TRxCrLiv1PyHV6w==
X-CSE-MsgGUID: dWR8KH2ST6iddQ9OkDqLcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32566123"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2024 22:07:31 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8vF8-0004eC-2y;
	Mon, 20 May 2024 05:07:27 +0000
Date: Mon, 20 May 2024 13:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 grpci2_of_driver (section: .data) -> grpci2_of_match (section: .init.rodata)
Message-ID: <202405201257.Uk7LHoFV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
commit: 94d6cb68124b7a63f24fcc345795ba5f9a27e694 modpost: pass struct module pointer to check_section_mismatch()
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: sparc-randconfig-002-20240520 (https://download.01.org/0day-ci/archive/20240520/202405201257.Uk7LHoFV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405201257.Uk7LHoFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405201257.Uk7LHoFV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: leon_pci_init (section: .text) -> pci_assign_unassigned_resources (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: grpci2_of_driver (section: .data) -> grpci2_of_match (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: grpci1_of_driver (section: .data) -> grpci1_of_match (section: .init.rodata)
ERROR: modpost: "ebus_dma_irq_enable" [drivers/parport/parport_pc.ko] undefined!
ERROR: modpost: "ebus_dma_unregister" [drivers/parport/parport_pc.ko] undefined!
ERROR: modpost: "ebus_dma_register" [drivers/parport/parport_pc.ko] undefined!
ERROR: modpost: "ns87303_lock" [drivers/parport/parport_pc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
