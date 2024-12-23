Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BE9259489
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945752; cv=none; b=ZdFsq+dEuXvLSXWrQsm7ysL3/NUWSJLJHacSsdDSWXDzXcDINpIgw/Ms8C0epWlAPQOCmDKX35VzSB6u5GYwEVMZKsSg3yBkhIH6NeB2wAA193tXlZj8ppNxHtvqxxheK5kuNKnIJD1AY96hO2WuTTmTOvoZtDcNz2F9V2AcZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945752; c=relaxed/simple;
	bh=iW9jwNnifuUWM0ZgLm1g2pcxnynnrXXGM11aWTZv7ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6f1SV5fjUoX0ccJae/1TA/aa+mV6LDsZ59DuT0guBmGYqV3mHYCZjdw4pEKnAy4uRyDmbZGqWZkFM9aLDBGtFben3MVKGLPrH16pMEv/toxLH0VC4N0cNjv9+aC1IdEavBnnKrBZ0Pdb0AIl68VzlzzLvdLkHQdzBmCON6XBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIOzSRh+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIOzSRh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734945749; x=1766481749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iW9jwNnifuUWM0ZgLm1g2pcxnynnrXXGM11aWTZv7ho=;
  b=MIOzSRh+5+MxHzgaGWWoQQff8dlksxSAyJWLNzTtCvj80M+/Q3SyS0IT
   XjrRgFHfU+g+lB1brFik49rHD4X5QVjqphUAChqovduFK1wYKHMCpBDu6
   vBlsqvsVFzioTSpQJjowcag5bEocLwUfKuaBWKMZFHgHsQg3PyAwn4NzA
   FRH9kpw3K8sS9LV8oBBQgFF4Ds+Giccld3gfuGfB5P+E3gktIiPVOhoXl
   93vcNc6VaKFXuoVRQ+OaqVjtbnC0GiAnz7bduHn7DmfdaOHOIkecEs/NE
   1E2vBc9rHDJsE5kUV4rDKOfkpJCBOz4zZbrH8KCzMLHQjma21NJ/arCHz
   A==;
X-CSE-ConnectionGUID: QOk+/7h2QIiD9k57gbbftA==
X-CSE-MsgGUID: tyirfpxZTIOsjrTjzpHMDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39186069"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="39186069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 01:22:29 -0800
X-CSE-ConnectionGUID: oLhvK+ymR42UAXvOBQBH0g==
X-CSE-MsgGUID: +6uhocw3T8WqUVmGvINo4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99238954"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Dec 2024 01:22:28 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPedt-0003Vb-1v;
	Mon, 23 Dec 2024 09:22:25 +0000
Date: Mon, 23 Dec 2024 17:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2:
 near "and": syntax error
Message-ID: <202412231736.X51BS00s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r071-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231736.X51BS00s-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412231736.X51BS00s-lkp@intel.com/

smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
