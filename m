Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF081DF247
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765636431; cv=none; b=efa7LnjwjEzB5nnGFJQDZ+01fy+03f0bR/9S1Uk05URC6I9gaDi/82Kd4OQiZyHTrmUbOE+oamcKejmD/pf9cMcRx4i0gZWHL7efO3JcVVSuPHKGkJiSHsHT7MKnfOEm8mFDvr2f04bbPbJa8uIrUo0/lu0P8ZTggb9MWVwJZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765636431; c=relaxed/simple;
	bh=guPTnZTg6SpB+/r/V+qK3+zNNGM44R3F4bscauCWw0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUR5rF/MxN4HwEigvieJJT7h210Ou04Ggf1q1vKpfNLaM8vntr7PwW35gthrSCdLj5x7YUdMBWiGxdqeMHG6qe1tl3v31MisUY3gBfgTHYIgz11/MHhWTSOJTjKvhHgGpusKk+NQOoE+sXwlcnWb06NERkOj/36sX+UuRddzGt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/aUN/Fi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/aUN/Fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765636429; x=1797172429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guPTnZTg6SpB+/r/V+qK3+zNNGM44R3F4bscauCWw0k=;
  b=P/aUN/Fi9tc7hgmcNM9zqzJODaNUWiBvXcEhhixVc/BTLFbe8/dRULf7
   z5G2d9W1I0MC9OUIzM5yfgxILp2HLwnaXI6aNZ5lbxANEqQFZlxr2R6wW
   AR9PRlPlnB07D/ybWx0+YcpXJ4ol7sREWPzk8zMh0XluHLzXYaWN2rPpz
   f5xZiyW2xPK4ZV0yF4mkrnY6fu2mEn2OsEsEruJ5Ncw7aZOH86qH1JgUg
   cpj52DmAJt/x7+17tWiKoTPFcaZxqqgR/VmBm0rHCLcjsHzrE5RR4L/WN
   fePvf1IhnrQPPs50GdYSyPqcu/FUz3u0LeAs9SpzsnQirmT78mpMeZQAk
   g==;
X-CSE-ConnectionGUID: qT04MMKLSRaVCEexsB+rLQ==
X-CSE-MsgGUID: OtCCwcvZS5eWx4w6DLf5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67683020"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67683020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:33:49 -0800
X-CSE-ConnectionGUID: H3qaEIGrQBCwgkTTz6yvhw==
X-CSE-MsgGUID: Fs/I8JVvSLivYDGezm7EUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="198150440"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 06:33:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQgr-000000007k5-3wwo;
	Sat, 13 Dec 2025 14:33:45 +0000
Date: Sat, 13 Dec 2025 22:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [litex-hub:litex-rebase 9/15] drivers/pwm/pwm-litex.c:145:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202512132236.mrOzzmcV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pwm/pwm-litex.c:145:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Craviee <dcraviee@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   bf1103a7647b9e371007e1f7d02827190e619900
commit: a01d86edbade9e99668c9bee6db06e8680a8dd4e [9/15] LiteX: driver for PWM
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc-randconfig-r121-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132236.mrOzzmcV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132236.mrOzzmcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512132236.mrOzzmcV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pwm/pwm-litex.c: note: in included file:
   include/linux/pwm.h:13:1: sparse: sparse: bad integer constant expression
   include/linux/pwm.h:13:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
>> drivers/pwm/pwm-litex.c:145:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-litex.c:145:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pwm/pwm-litex.c:146:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-litex.c:146:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pwm/pwm-litex.c:147:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-litex.c:147:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pwm/pwm-litex.c:147:1: sparse: sparse: bad integer constant expression
   drivers/pwm/pwm-litex.c:147:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +145 drivers/pwm/pwm-litex.c

a01d86edbade9e Daniel Craviee 2020-12-22  144  
a01d86edbade9e Daniel Craviee 2020-12-22 @145  MODULE_DESCRIPTION("LiteX PWM driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
