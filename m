Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703392F12AB
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271865; cv=none; b=eHWvFOUDSsNIpNtE56wwSTGZtOgthxOrgnf7GbZNS5ij23QRoKRn54wuGDPoPGh1m5jHGTVGCqUO7LHT4xGeOstDswyzJad5EA8W3anu7KPyYVJKqvjlERjxYEa+wGtMxZ8WXOr8+6NfYfB7TLGKJn6G9Cz0LgaKriGyyuhotrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271865; c=relaxed/simple;
	bh=mYNVF7JEpDl1NLr0RcJY1HvZKdr+tcytoEckyRIzRxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ON9VF4U+juk4f0FUSdPN08MBVAJUNsxyiMzXfnZGrqqmYAzxh/EP1UCx40VD+xdM83OVfYTxAXArBwAgBvrPWlP1QL/nAgeIYWn6Ho6w+b+gRG//sj8NPbq0cfi0BtKlrGqo8ng5scoT6GJuCOBswccEJ5fN9S2qryxhjlaGj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5O3hZTG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5O3hZTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768271863; x=1799807863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYNVF7JEpDl1NLr0RcJY1HvZKdr+tcytoEckyRIzRxw=;
  b=l5O3hZTG/cjrfUNdkoA9JOSt/Uq8JwsfUWEEw05X4/c/BAjTKO2LCo49
   eY8sgxylhPkIqfy1I5WtPZbLgtW69UsXTLEy1OOIY86xXileRGilxBmoj
   2nmiQQU5cIaAcirJlfreSs25O1cD2kekIlhJp76YGXZuNfh/dr0s//vEQ
   fKaxMQd3LfX5HKCr383iC3yrSaVvaWjcPN5WsojZojgGxMealCAiOY2gy
   M7XXsyyoXsIJfsGprqSuzakPwPA6ARm94Ya1mkwMkRS2qwkU55FWgHMFy
   CQvpKXYaVsHFhnLzvsuixVfV9BlCe57dpXmHgbQWbNemc+KJHyvLsw79B
   A==;
X-CSE-ConnectionGUID: KRJ76DuETZ2oTuIKVbWxUQ==
X-CSE-MsgGUID: /tNieUTxQomj4fqs5Yovag==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69284775"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69284775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:37:43 -0800
X-CSE-ConnectionGUID: UrwwMcYIRQCxOXmFZVKDRg==
X-CSE-MsgGUID: +l7yNLh/QimrqcLMXzQSzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204161678"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 18:37:41 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUHr-0000000012T-2mCG;
	Tue, 13 Jan 2026 02:37:39 +0000
Date: Tue, 13 Jan 2026 03:37:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued
 warnings
Message-ID: <202601130359.7zkjimDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
References: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Randy Dunlap <rdunlap@infradead.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-fix-logic-to-handle-unissued-warnings/20260112-193100
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued warnings
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260113/202601130359.7zkjimDV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130359.7zkjimDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601130359.7zkjimDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/powerpc/platforms/powernv/opal-irqchip.c:297 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * opal_event_request(unsigned int opal_event_nr) - Request an event
--
>> Warning: arch/powerpc/platforms/pseries/io_event_irq.c:64 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Find the data portion of an IO Event section from event log.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
