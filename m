Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA078820
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 03:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grR0s+TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700623647; x=1732159647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UYnckek+Wm7AVd2UWYpHtixd+slSncj1xi5179QukrI=;
  b=grR0s+TD+OEhiqkiYpHkhvP/W7iQc5tQq14uVOADFmNgn293r87QZ6VF
   CNat7Fk9rntTR+on1rppnzQ3LbatxaXO5ZfL2yx6PMBXsUiN12md1t6Ij
   8zQDTvOWaiK/HfgOOkyJnz3mIGOWTLgN84zLTXlD0V2F1CKo3Scg8+LcH
   WMd260jsxnMASNNDbfyY/PDl1k6T77FYyTZ3D8fBfeNF/XoDbWEACzCsa
   2k9KFR3qoGnuGTWW0NjF9awevhzm6yUpA0zTOOfpBlgn8Q+bajUzy5b6a
   /3YiX3GGqCqAeq83cF2L0Q49jJUCLEn/mUjCC5uJ9taH5zX2TsmFqRNed
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390834826"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="390834826"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 19:27:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857515622"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="857515622"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 19:27:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5dsn-0008bi-1P;
	Wed, 22 Nov 2023 03:26:56 +0000
Date: Wed, 22 Nov 2023 11:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pcmoore-lsm:next 12/23] lsm_list_modules_test.c:104:22: error:
 'LSM_ID_IMA' undeclared; did you mean 'LSM_ID_YAMA'?
Message-ID: <202311221047.a9Dww3vY-lkp@intel.com>
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
TO: Paul Moore <paul@paul-moore.com>
CC: Roberto Sassu <roberto.sassu@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next
head:   afe576a62062cf944372fff2b6510b621ec454f2
commit: edd71f8e266c7ba15eedfec338864e53ddde1c25 [12/23] lsm: drop LSM_ID_IMA
:::::: branch date: 29 hours ago
:::::: commit date: 9 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221047.a9Dww3vY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311221047.a9Dww3vY-lkp@intel.com/

All errors (new ones prefixed by >>):

   lsm_list_modules_test.c: In function 'correct_lsm_list_modules':
>> lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared (first use in this function); did you mean 'LSM_ID_YAMA'?
     104 |                 case LSM_ID_IMA:
         |                      ^~~~~~~~~~
         |                      LSM_ID_YAMA
   lsm_list_modules_test.c:104:22: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
