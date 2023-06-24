Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA757F
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jun 2023 04:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687579889; x=1719115889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAFNTecR5Zl9ItmWD2KVB/wySEOmrBXcSLNStfCHXdc=;
  b=VpoiiPbszlSrUUH8+kpRwNvM4IGdGs8qHa2VxC7Icm3zOBGNFG6+09A6
   gIQy5gsTV+E4SmgTqWLiFn5RCQ1j2m5S29fF2RRGP4E+gzmylbpxnpLRQ
   9Su4GDuRIixv4T83xbrNPldI/4JihKbscVzz+HL/201BFMEJSaeanzr/O
   omOBsjomxEwLRmt6j0SqHk43eCaMfMhuNHnCldVzurWpWP+AZ4/XW4DW+
   CINY8bO/enf4W8sJAf2OzKHQ29GJmO0S+8gr9T3VkBoW608sWfcp0L5U6
   lfCvGvoNH7jFWHp8X9GloYwFCAWnhyDfybdrJLPQTHmhLcrjc6Za423Ub
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="390991476"
X-IronPort-AV: E=Sophos;i="6.01,154,1684825200"; 
   d="scan'208";a="390991476"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 21:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="715521627"
X-IronPort-AV: E=Sophos;i="6.01,154,1684825200"; 
   d="scan'208";a="715521627"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Jun 2023 21:11:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCucQ-0008iV-1U;
	Sat, 24 Jun 2023 04:11:26 +0000
Date: Sat, 24 Jun 2023 12:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-fix-2j 11/17] lib/test_dynamic_debug.c:102:1: sparse:
 sparse: symbol 'map_disjoint_bits_classnames' was not declared. Should it be
 static?
Message-ID: <202306241240.VNDPVuzl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   4098fc4c48d0cb803788c4eeee53e03ddd157200
commit: b03647afea5bd503a87dcfee0569af044c8cca6d [11/17] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP & CONFIG_DRM_USE_DYNAMIC_DEBUG
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: um-randconfig-s053-20230621 (https://download.01.org/0day-ci/archive/20230624/202306241240.VNDPVuzl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241240.VNDPVuzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306241240.VNDPVuzl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_dynamic_debug.c:102:1: sparse: sparse: symbol 'map_disjoint_bits_classnames' was not declared. Should it be static?
>> lib/test_dynamic_debug.c:115:1: sparse: sparse: symbol 'map_level_num_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:118:1: sparse: sparse: symbol 'map_disjoint_names_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:121:1: sparse: sparse: symbol 'map_level_names_classnames' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
