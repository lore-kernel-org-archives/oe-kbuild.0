Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449A1A0B1E
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723808576; cv=none; b=LuJ11xLavqzvB6Dn2UeS0gNR9NHzTEyW9b/uSFTc/OwlfvYPl4JuytOFpBt0qlayh9jVL9vg/Bjw4u01GXJOk4L3soQV+ig638sYdWxP3KSM9mtPHqKLxdbqL09z7Cm8Ll+xcIdQBeF6hfcQMHJXTSfgCY5+X4J/9MPak8ticvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723808576; c=relaxed/simple;
	bh=bk0asE0lBG4tk2RUxY0qHzxAoU/Dm9pYL3BCzV0qzx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WEv5iUzY5LRv2AGDTVyAswU3ms109Ymbew6kO8FQbi5Dj0gwgUrwrwicRfOUvTwVmJ1KQUOKMMQWZOlT2PN5Q5V+4g4dMHoBK9kAbTfE345iJ+8ILD6hP7jA+Cc36VADDLDHbLMtiXFjd69i2p7odCVFjTmDIMhiRDr+51HZDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxiPZyvM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxiPZyvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723808574; x=1755344574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bk0asE0lBG4tk2RUxY0qHzxAoU/Dm9pYL3BCzV0qzx0=;
  b=BxiPZyvMBEnO02ro/2mc+Z8suZ/DiqRuieF9GlEtQkDwo6rj73nfLZGe
   lpiPkIGiV6k2UQKzZmX4QFepwm5YCcd9V90ifaO6TCtElons0kZWDJlF5
   zLmu55klhUTxB2fukhtxch4bmaB+YwVCvhcmj7QkHhWVkQd41OG8EJwCm
   3fimyop4QmOSJ1Axe47x70rx8UWUJKlZJ3DFxlAw261OPH8NelPdf3cPe
   tx/oSoH0ckls0NykB7wXpbLRcK44TS5KxGvWjIslasgzLh3eLw1nlhyPZ
   AAiSwAH1apaFWsjC2stTBsVrrxY3/vwb4ZKmTzD/TSft23hRLXPmqyZoz
   g==;
X-CSE-ConnectionGUID: xGbfGjl2Q3Oo673c7WmbNA==
X-CSE-MsgGUID: IcyzKgYoS1KNKt39e+AVNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22246405"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="22246405"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 04:42:53 -0700
X-CSE-ConnectionGUID: hNDshqRGSmK+C31wv4qemg==
X-CSE-MsgGUID: O1KYvdmJRLq6iIOLsZ6nFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="59670431"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2024 04:42:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sevM2-0006N0-0G;
	Fri, 16 Aug 2024 11:42:50 +0000
Date: Fri, 16 Aug 2024 19:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4489/4951] vm_util.c:175:15: error: conflicting
 types for 'rss_anon'; have 'long unsigned int(void)'
Message-ID: <202408161939.8NlR80IY-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Zhu <alexlzhu@fb.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Usama Arif <usamaarif642@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   367b5c3d53e57d51a5878816804652963da90950
commit: 2cab584b86c2596d7d9c7216927c6043dac917b8 [4489/4951] mm: selftest to verify zero-filled pages are mapped to zeropage
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161939.8NlR80IY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408161939.8NlR80IY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vm_util.c:175:15: error: conflicting types for 'rss_anon'; have 'long unsigned int(void)'
     175 | unsigned long rss_anon(void)
         |               ^~~~~~~~
   In file included from vm_util.c:11:
   vm_util.h:42:10: note: previous declaration of 'rss_anon' with type 'uint64_t(void)' {aka 'long long unsigned int(void)'}
      42 | uint64_t rss_anon(void);
         |          ^~~~~~~~


vim +175 tools/testing/selftests/mm/vm_util.c

642bc52aed9c99 tools/testing/selftests/vm/vm_util.c Muhammad Usama Anjum 2022-04-28  174  
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13 @175  unsigned long rss_anon(void)
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  176  {
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  177  	unsigned long rss_anon = 0;
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  178  	FILE *fp;
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  179  	char buffer[MAX_LINE_LENGTH];
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  180  
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  181  	fp = fopen(STATUS_FILE_PATH, "r");
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  182  	if (!fp)
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  183  		ksft_exit_fail_msg("%s: Failed to open file %s\n", __func__, STATUS_FILE_PATH);
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  184  
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  185  	if (!check_for_pattern(fp, "RssAnon:", buffer, sizeof(buffer)))
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  186  		goto err_out;
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  187  
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  188  	if (sscanf(buffer, "RssAnon:%10lu kB", &rss_anon) != 1)
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  189  		ksft_exit_fail_msg("Reading status error\n");
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  190  
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  191  err_out:
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  192  	fclose(fp);
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  193  	return rss_anon;
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  194  }
2cab584b86c259 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-13  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
