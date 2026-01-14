Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C6311588
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768370848; cv=none; b=FL9BHh3wEcX8WaUdxtKGDPIJi1uzjYPvROv9h9R+oqKVcVBYyZ8vc3IyJuNO0aDrPGsbiCQ6+m2xmMw5TM5STWm2yQ+oo4HNIIml7fpYvJX9ZJD3v2t4wtp6uEhqu1XeMZOV8Jz1NjMAkWxdPj1KxgqixxBSMCYENXRcoArISFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768370848; c=relaxed/simple;
	bh=TGE+GruDduZsQX38uwAyyBG5FhJB4SR+Bb4JA6FpWf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tZ1mLM3M6Rl5C4q+DVJmtJgofDjlSQMDClThd4/CTm1QqPqeZfE9hGbtj4WA8UT6Cp+wxPsxAUYbRELsMPn9DYojFNc36SiZp1XA2rOo/ZB2yP6QE62mcZ8vcWB5HsCZKg/DiqF9ZrV/VuD23DMpm+fPKZllADAY9FlvUPYkNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QexgZYpL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QexgZYpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768370840; x=1799906840;
  h=date:from:to:cc:subject:message-id;
  bh=TGE+GruDduZsQX38uwAyyBG5FhJB4SR+Bb4JA6FpWf4=;
  b=QexgZYpL7MnjA55tms8M/mMCOeU+IGQZhP7e0+BOlXSRu83482FU7grY
   BljCJmi5/jCyis7c7Dp6Q/c5kUcblufK5KEO09BkoROfYl/nIS06Pd97w
   k2mw5BY5GcL57sMPuACQ2heaWCWpGwirgH0/5Ro6DqAmUwrMd16bpFxuj
   BX+EpPDhmk/pup1qmcQyCXFR4jl63Ctdzx6bfxmDykgqtb2qb0jHrGkTA
   hhSWzBt1iwU4mRtGcUo0mKwM3hdmBzeiP/eDD8I8+ZJrT8X8Pze3yi8Le
   xTu2cLLYdVKgdHHQeCy8pYVbhiEqs7O43pFArFxvJrqONjiwLjg/M5960
   g==;
X-CSE-ConnectionGUID: 2LX5fy6pQUeBRXLCAbotbA==
X-CSE-MsgGUID: i/9gZjIHSgOXXz+UFCZWCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81028783"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="81028783"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:07:16 -0800
X-CSE-ConnectionGUID: ayHNAgQHTuCGV/cbRMabgA==
X-CSE-MsgGUID: 06wbx4A9Sa+ivZXRfH3uTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205007540"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 22:07:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfu2D-00000000Fu8-12aF;
	Wed, 14 Jan 2026 06:07:13 +0000
Date: Wed, 14 Jan 2026 14:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/base/regmap/regmap-irq.o: warning: objtool:
 read_irq_data+0x2d8: unreachable instruction
Message-ID: <202601141424.TUzxALlJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Mathieu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b54345928fa1dbde534e32ecaa138678fd5d2135
commit: 1c12fbdf40e17df2efc24bf2009a0c3bfa75bfa7 regmap: irq: Add support for chips without separate IRQ status
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260114/202601141424.TUzxALlJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141424.TUzxALlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601141424.TUzxALlJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/regmap-irq.o: warning: objtool: read_irq_data+0x2d8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
