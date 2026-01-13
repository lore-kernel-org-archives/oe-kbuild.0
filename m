Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BCC35CB7A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768283372; cv=none; b=aj5qeyDzlCYur8KcF0rGjXru4ZOD5J2JqWwM8MRIAhyWK0ruG+CN6fcPBeYfUP5ONTyOzlrbf40yWHhKbzLK5+/T9cCbvlBOoh2Y3YHZW7nvKLPl5ivVrDyr8OQ4SSXjcY2coipXSam94EWaZm4/P2s5UL38Wf5LJtVYpRxJe3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768283372; c=relaxed/simple;
	bh=meWmGmm+oNaevIUW7QsGdrTWH6ifgi/lIpzdm7J7Wws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqtYrcUxO9MtfdaxH8QFDmdQP6y3enEihUv2xAhmPiPgOwQuNkZZNpEVc5cOVgV2ugjXea4r21YTT++mbqyx5gDDfnxBGANEfLbElBYO6lEfcIbjxXgv/DxFv1/XT/d/b4aN4uiPekEdhWNngCDE8tIFC8qzTUesW93zs+HXi1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSwJP1xl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSwJP1xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768283370; x=1799819370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meWmGmm+oNaevIUW7QsGdrTWH6ifgi/lIpzdm7J7Wws=;
  b=nSwJP1xlaN0R0sJvN6zY1l5UP1XSbtVzBgzS/04ZkwaLfB5ItA/3itig
   F/SJC+Rc69lZEZ9ZfvcZkCSkPXP6lbqeCkSnLRaJ151meYt+E72T5zcnp
   eWD87IWldSWQ12lq4ZUnNzKSdKh8O1T9Yc0EjUKMys5vHtGNA32R5pS3Y
   zUl3/ckO1h3E1SrMTJWLeyP+AE6oxQnap5z5639Zt8F8RFSnu4ITK/jdv
   HxHnK5nW2k0UJa0+c5WXPq3r9ZomUPDM0/muSEmF71dzsvwsHjYwQI43X
   EI/dS7nzd3ytcD++Tx28q0dTgOtnytEwc74MwbQc1z+EDxtiDYNfA4RiT
   g==;
X-CSE-ConnectionGUID: PybRH9LqSLqJar/C1VWKEQ==
X-CSE-MsgGUID: E1+w7VzcRM2FedOxtrWiGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80206766"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80206766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:49:29 -0800
X-CSE-ConnectionGUID: NDGdEMFLQK+yNBt1rafwgQ==
X-CSE-MsgGUID: dGw+m2AxRC2PkoVWDjZUiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="234998176"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 21:49:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfXHQ-00000000EI8-29kv;
	Tue, 13 Jan 2026 05:49:24 +0000
Date: Tue, 13 Jan 2026 13:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/4] scripts/kernel-doc: fix logic to handle unissued
 warnings
Message-ID: <202601131310.4A2pZJUr-lkp@intel.com>
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
In-Reply-To: <afac0e4eec12bd5cc9a5040359f26058a3c1df1e.1768229902.git.mchehab+huawei@kernel.org>
References: <afac0e4eec12bd5cc9a5040359f26058a3c1df1e.1768229902.git.mchehab+huawei@kernel.org>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-fix-logic-to-handle-unissued-warnings/20260112-232714
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/afac0e4eec12bd5cc9a5040359f26058a3c1df1e.1768229902.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v2 1/4] scripts/kernel-doc: fix logic to handle unissued warnings
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260113/202601131310.4A2pZJUr-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131310.4A2pZJUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601131310.4A2pZJUr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/edac/octeon_edac-pc.c:33 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * EDAC CPU cache error callback
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get a pointer to the per-core table of reset vector pointers

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
