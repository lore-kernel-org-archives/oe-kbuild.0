Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790A359A68
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 23:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780011614; cv=none; b=STjkkN3QD+w5istBopG8EWc+fJHmqyqjpJeUOupauFkGafB76qiOyRlcokGCQV4Sa/9xqtAoS8i7rGAFMD7zc6IlzPsH2E2ck1sZxi6okpCXrqHW3EJu/pN57nN4RyEjM3+qI8KDkVyzyCurgizW9SqRWcDXnOXIKSwY9UIxUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780011614; c=relaxed/simple;
	bh=VuK+ObASXpm+5Iw83wNJfFc0x3OT39yMUWEhM4NFWTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X779J7vQ2UuSO+2etbVO8eHV4RPkR5N/hD2UFYefNh2MzvPUFrWOLoaUqBn4ewtwOFfdFZKuBawIVkyOIGTEAF+j1oF9esymAfvnM18hxAZ7hNmC5tKL5m7c0+4z7emzwjVgOJYvn+kqJHGCptoMBoctnywK6ZtYfKWfu/olLYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUUDXdO3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUUDXdO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780011613; x=1811547613;
  h=date:from:to:cc:subject:message-id;
  bh=VuK+ObASXpm+5Iw83wNJfFc0x3OT39yMUWEhM4NFWTA=;
  b=lUUDXdO3wBFdXLmHQ/2WwikTYUjcUdA64W05+9sTdTNArvT1M1h7h5Jr
   ghS8XHREzyT2DrxLuqHt2vaQjFUxOwtNAG0bumWIew3zHNNwUPVSkkAvp
   TYtPcyqmrLZzyuH2IRX1QXL8kDtNuNij1vdXUgmwuSCsdiScZfPNrYYa+
   2qgpec7BNU8U6Lkr1VpBycdak9FCzyZoev71d3wdrS7aEGgIG6vFsTAjD
   Fh6Cv4Gvqz7u/4XH4UTJBZSkRjbW1NMZpYK10mI+6jEvPTQIJ3qc8a6SI
   rMiGT0CAI5Nj+cuKMvKpamaggUdkU485wAjisK2AwDfDr+DylzcRbQo9B
   w==;
X-CSE-ConnectionGUID: hK3L0zavSkGD14D+0hTgdA==
X-CSE-MsgGUID: oyQrD/opTjSzUG6sm6QV0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80011028"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80011028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 16:40:12 -0700
X-CSE-ConnectionGUID: v4PWUUi6RkiXqADuhRp+7w==
X-CSE-MsgGUID: T+fBp9gOQAmSriA+g4jSfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238291235"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2026 16:40:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSkKf-000000006Y4-281z;
	Thu, 28 May 2026 23:40:09 +0000
Date: Fri, 29 May 2026 07:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: clang: error: unsupported option '-fbasic-block-address-map'
 for target 'riscv32-unknown-linux-gnu'
Message-ID: <202605290746.MxvQ65Dc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/xur-google-com/kconfig-Remove-the-architecture-specific-config-for-AutoFDO/20260528-054727, commit: 9d09d5316cd7b6993cc7417cf72856ca6e6887e8"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rong Xu <xur@google.com>
CC: 0day robot <lkp@intel.com>
CC: Kees Cook <kees@kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kconfig-Remove-the-architecture-specific-config-for-AutoFDO/20260528-054727
head:   9d09d5316cd7b6993cc7417cf72856ca6e6887e8
commit: 9d09d5316cd7b6993cc7417cf72856ca6e6887e8 kconfig: Remove the architecture specific config for Propeller
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-r051-20260529 (https://download.01.org/0day-ci/archive/20260529/202605290746.MxvQ65Dc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290746.MxvQ65Dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605290746.MxvQ65Dc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unsupported option '-fbasic-block-address-map' for target 'riscv32-unknown-linux-gnu'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
