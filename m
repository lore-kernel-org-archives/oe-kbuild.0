Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70C30BF67
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989390; cv=none; b=q4lh1jyKajUKQtyn7/NFjIcvXo2Irs1oVVZEXGr+Eancur6/JtGMJ29imsIcKJAnK3a5s15ytXisDyCuKfkRE760/eMv4dYrWLw56af+uKL8eGWRybt7oekC0ujLaB14osXFXh6SBKlT+tVgrMeQs321scjHjh6R3ULsHYtEMXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989390; c=relaxed/simple;
	bh=WtiWgMfEk37CDSr8z62SeUvKZsTApSdnV1B/OuqEE3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=acsPWg1+SOy4G0EQ2a/ibHMp093F0wbmQCaRYx9hU5Oy20vi+AsbTbWSHRSIrsWK10ecUc2EL/Ee5kWkB/QAjqnM+cdJy7QRjPK1ctC5H44WhN1tJOA5B08Zaqs4RC1OHfVHBoQdV5hk5w8MiJFuiJYmNIoV9ORpJJcSaoegjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9nL+NXC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9nL+NXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779989388; x=1811525388;
  h=date:from:to:cc:subject:message-id;
  bh=WtiWgMfEk37CDSr8z62SeUvKZsTApSdnV1B/OuqEE3o=;
  b=k9nL+NXCko5rO6UIv/lYLuPKksB7o0IeGefG20caq/+RD6BG1q2MiIrx
   i8ciGMq5/7HXZ7ITSgq/u6R4yhQsqY2T/Po1+6jTS97caDRXN4ytNNqYl
   1GLyv5LEPiVH9FUi9W+2tGE2Vu2aWYMknKWUT460McNinzzAR7QISU9Ku
   P6L8F1GHrh4QgiShBXTBA5FAZcpbnphMRDoxuAO2YCuJCAQjvecjVY02R
   3WEcEzpQYByTgls5VAG0xt1aokkzi/mDt/gacEM4iVmGuhZ/sl/V9ejdO
   xxSwkEjIBymmpPdRv/FJEQdEMI4zkEB88/qNcyuDd/Xe9eUoitQt7HMBl
   Q==;
X-CSE-ConnectionGUID: FUIosYOPSfmnAXrGk06jsA==
X-CSE-MsgGUID: Xgp1KfQcTquJ0mYmx7+IuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80690277"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80690277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:29:48 -0700
X-CSE-ConnectionGUID: +rgefCF8TuKuT5RjSPEx/w==
X-CSE-MsgGUID: M7CX+IAzQjuEqNB2tGaKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="247555712"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 10:29:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSeYC-000000006EH-3OnC;
	Thu, 28 May 2026 17:29:44 +0000
Date: Fri, 29 May 2026 01:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: clang: error: unsupported option '-fbasic-block-address-map'
 for target 'powerpc-unknown-linux-gnu'
Message-ID: <202605290118.P3evGuve-lkp@intel.com>
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
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc-randconfig-r111-20260528 (https://download.01.org/0day-ci/archive/20260529/202605290118.P3evGuve-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290118.P3evGuve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605290118.P3evGuve-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unsupported option '-fbasic-block-address-map' for target 'powerpc-unknown-linux-gnu'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
