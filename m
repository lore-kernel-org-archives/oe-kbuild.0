Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBC18624
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivbaIPB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699866612; x=1731402612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NF/ehiGuqC0nXgBqosLBwxZeawFCn70zwMIup8fdqc=;
  b=ivbaIPB5iWR5EV1nfNT2AhF8Pv1uUdjhIq815f4tnTSjjCZI0HHtGRb1
   p5rzRRjo16bM1RrxMH5Lm9Er93EcuMyoqTesvnRPulkOoXVdNBfsP5Goe
   SOV3T5VTnANVtiAXQ8/Eh/MnadUXoKUj8uSpzyZT2HXEH63L8M0PuJUpO
   bGV/BZcEmLD5Zgut0fMoWoSQIB7keXN06rTleuxcsrZWNrWqHzjtHcH9y
   73P2KuZvk0aox8Pt3+MjOsnpdIH9fovGKbW/lFM1nazNBlr1g5YzUxlun
   qeWTLFw8xjHb+O+zjJVZwyP+rH2cZ++F8G4ArlCShmM1F337h6uAF2Gem
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="456893651"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="456893651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 01:10:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="1011485910"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1011485910"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Nov 2023 01:10:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2SxL-000Bz8-30;
	Mon, 13 Nov 2023 09:10:07 +0000
Date: Mon, 13 Nov 2023 17:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202311131712.xesxaMqm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Prasad Sodagudi <psodagud@codeaurora.org>
CC: Yogesh Lal <quic_ylal@quicinc.com>
CC: Elliot Berman <eberman@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
:::::: branch date: 1 year, 9 months ago
:::::: commit date: 2 years ago
config: x86_64-randconfig-123-20231113 (https://download.01.org/0day-ci/archive/20231113/202311131712.xesxaMqm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131712.xesxaMqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311131712.xesxaMqm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol 'ads_page_owner' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:28:6: sparse: sparse: symbol 'ads_slub_debug' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:29:15: sparse: sparse: symbol 'ads_vmalloc_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:30:15: sparse: sparse: symbol 'ads_pcpu_nr_pages' was not declared. Should it be static?
   drivers/android/android_debug_symbols.c:88:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/ads_page_owner +27 drivers/android/android_debug_symbols.c

b2df67a932b5cb Prasad Sodagudi 2020-10-28  26  
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @27  bool ads_page_owner;
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @28  bool ads_slub_debug;
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @29  unsigned long ads_vmalloc_nr_pages;
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @30  unsigned long ads_pcpu_nr_pages;
b2df67a932b5cb Prasad Sodagudi 2020-10-28  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
