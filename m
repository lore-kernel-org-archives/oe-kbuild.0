Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48A377A9D
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 04:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361645; cv=none; b=JK3HVMv0ArfGOx/Rhv5qfQ0YihPTjqbSONMLMtjN9qarLdvVbiYng9OnnnE4nNhzLAUBC9WeiCMh43i7mx0zV2PSBPlp04Uh8dQhb9+QmFciOlD7VSLkmRD7d/6ayBWbStM9DdYz3OvTcr0vdp9iEJeMdAukN04nNVwhBeL0q9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361645; c=relaxed/simple;
	bh=tNWWe/SQsqDOQ+c5hnQOahdn6kjwrI1G90EyUUcbpNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PruMunvny54F/ivV+kjtrgGeSGrF+LqY4rXQeHYbZ5pIiDWbpkQ9OTuH41hCZlaUqi1A8yHWjBmLMfIOQC9wLmzrSkLMtxJ1R/oZR0yWUWBgTQ9CjYnm3srBnosIKPou25towg3YnnUKn+JwJj84WTp3XlxRYYZDCVYb21tWG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAZvfBB0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAZvfBB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789361644; x=1820897644;
  h=date:from:to:cc:subject:message-id;
  bh=tNWWe/SQsqDOQ+c5hnQOahdn6kjwrI1G90EyUUcbpNI=;
  b=DAZvfBB0PUdmWz5fZZll25/kX5NHWLG2Jm7i9orFnf4EUrUmOmLI6Xkw
   ewJDB6DSDPfIA75f8Bmv3XfGKq64mGzn7469u6SdcSPx0so7Sp2iMQTd4
   fXzEAXx1AGvaNwYoEVSfOzS4iM1Fl5heM+JjDOCbaPSL5exow8Ulu4V05
   a30h4OmvbSGZ3a3A9xGbSQJ56++4GVV2iga1cESnR+izXjqFwb/DTS/LB
   dwacnPXNY6LpVHjkC7eEMJ2OiflUqqUgd1xkohFZTPIU+Tlpngw16Rvog
   7SxxUZzlKI4T4TUnomXJW58bIdEKCjnFYiZEIC24SVjUNYm4MN4DgV1Xv
   w==;
X-CSE-ConnectionGUID: iE/hxU6yTzKpwq2xjjIqvg==
X-CSE-MsgGUID: mfzDr/j/TnqB+KY7OWkQxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89841430"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89841430"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:54:03 -0700
X-CSE-ConnectionGUID: hBKaP7t6QT6csID0oy125A==
X-CSE-MsgGUID: BBLui9SrSpy0q+0rnEw/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="940808"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 13 Sep 2026 21:54:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5yhb-000000002VP-47Lp;
	Mon, 14 Sep 2026 04:53:59 +0000
Date: Mon, 14 Sep 2026 12:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: drivers/char/hw_random/octeon-rng.ko:
 missing MODULE_DESCRIPTION()
Message-ID: <202609141244.BML7U3N9-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: d900723d78adec229996aefbab0dcaa66a177b77 modpost: use mod_warn() and mod_error(), clean up logging
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260914/202609141244.BML7U3N9-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141244.BML7U3N9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d900723d78ad ("modpost: use mod_warn() and mod_error(), clean up logging")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609141244.BML7U3N9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/char/hw_random/octeon-rng.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
