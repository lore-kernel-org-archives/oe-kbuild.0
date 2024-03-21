Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18391C05
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Mar 2024 04:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710995317; cv=none; b=JY7wxQnywI6TgaapZK5YNqKMaYO3aT9AE26No91zKx5m1V9VvkEYnbmNUwN4e51mL8U+rnbzBf/2if/OYV5PRqB+eZN5OayvJm9QM+JZLFeXo5iZMXH2KUi1Qo25l7fByjDzE9AK6eFM6E76BlrLl+LncePz4UnFthzHRhgDjiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710995317; c=relaxed/simple;
	bh=cldq7yMGaBWIS48Q4+KAaYGxLuiJ1BfU1AeyuFDjSPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCEGwVqczfXqXfYpQXzvu79L7c0J0vCXmUNfJyDmCGS9nHOXmGlMQTMOGeO3RI1Z0qbdJglrJDOcx96GRiLihgkCojDPXcR7z8Ko9kCobF8eycYpHVUd53qeg1CFjcPCDk2wRPCQpqcdVX2R6vn+whCND5Xaw34nwvSP8CNVgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTVYn7Dd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTVYn7Dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710995314; x=1742531314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cldq7yMGaBWIS48Q4+KAaYGxLuiJ1BfU1AeyuFDjSPk=;
  b=gTVYn7DdJFvwRXzmZCDy4mMrjp7JNUTvtIY30Rufil8pDc6oocQMcPRB
   RCcawAllImT6o+0PrYTGbb2ynoMdJG5xrWg0qtjZWCfrL1Y9/L6/R/te0
   mungpj8i845qEFbgNf6ibY/DBlLb2OI8UabiLcSez1lu7vpvLd9IYV5S0
   4sXIe8z0OmQBolsM00hSKArf2X04Je0Hd9x/DjUvhn3L8gdl6p60XkFwW
   ooqm4rfpUOPsxH9ccYEav/cCu0iDYuvipZGpp0KmPg3aIVKbWroW4xTeZ
   r9c9ZKJpHJntJcWLxv1fSPTN4PQgOgDFWjaV2MxPa9AKY6oSVp1jOna5D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17099991"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="17099991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 21:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14452789"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2024 21:28:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnA2Z-000JAL-0R;
	Thu, 21 Mar 2024 04:28:31 +0000
Date: Thu, 21 Mar 2024 12:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] tools/rtla: Use tools/build makefiles to build rtla
Message-ID: <202403211207.MQN0DSRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <facb7d2e23dbf5e8a411a9e9d02b7c8baab99b88.1709914259.git.bristot@kernel.org>
References: <facb7d2e23dbf5e8a411a9e9d02b7c8baab99b88.1709914259.git.bristot@kernel.org>
TO: Daniel Bristot de Oliveira <bristot@kernel.org>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux/master]
[also build test ERROR on v6.8 next-20240320]
[cannot apply to linus/master rostedt-trace/for-next rostedt-trace/for-next-urgent acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Bristot-de-Oliveira/tools-tracing-Use-tools-build-makefiles-on-latency-collector/20240309-015731
base:   linux/master
patch link:    https://lore.kernel.org/r/facb7d2e23dbf5e8a411a9e9d02b7c8baab99b88.1709914259.git.bristot%40kernel.org
patch subject: [PATCH 3/3] tools/rtla: Use tools/build makefiles to build rtla
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211207.MQN0DSRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403211207.MQN0DSRb-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: cannot find tools/tracing/latency/fixdep-in.o: No such file or directory
   collect2: error: ld returned 1 exit status
   make[5]: *** [Makefile:50: tools/tracing/latency/fixdep] Error 1
   make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
   make[3]: *** [Makefile:11: latency] Error 2
   make[3]: *** Waiting for unfinished jobs....
>> /usr/bin/ld: cannot find tools/tracing/rtla/fixdep-in.o: No such file or directory
   collect2: error: ld returned 1 exit status
   make[5]: *** [Makefile:50: tools/tracing/rtla/fixdep] Error 1
   make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
   make[3]: *** [Makefile:20: rtla] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
