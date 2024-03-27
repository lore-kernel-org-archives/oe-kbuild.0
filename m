Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DFB1EB35
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Mar 2024 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711579427; cv=none; b=K8J3ZfhW+7EXPet1Ct+dy58JKR+Vwk767tsYjmDfX2vLgeQiJ7clkD+32zn4Rp92z8CveRKLC/sngd6AfSwCYc+XGsQWFOswHInIaNdUdAOP/zHuje4NiVKHwVIEqDoUnjH+4uABuATZotgM9j/bJ9i42FRFNK8zs2NIFeN73I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711579427; c=relaxed/simple;
	bh=p9p29KgNC3sbGfRPs3ONdeQKEsJOS7B6hyhE5AkQ9NY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6Aeew/J0+I+RDe4dfV57R6EvJyyUazp1+3gP4i4Be74AInPwR2o3FnELzOQXbUcsw19UAALZa2qubT4mT7DaSVGfGS8j+8ceTyMWZeadznJImIqJ+PKvOrKHpaha2fLT1xKxfE0kwD/xFyqzfP/wXTA4xOAMTXXoD5Fzi/R66g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jop4p/jt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jop4p/jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711579426; x=1743115426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9p29KgNC3sbGfRPs3ONdeQKEsJOS7B6hyhE5AkQ9NY=;
  b=Jop4p/jtAnKfWHgCyy3/VrsVr1f0aYSWRcBO7WTftSfLEbNrTxYoAERu
   UrhxxczjmP+hfKxQBnj7iGueQpRswAIePv4uIHKwMmOF2F/1HtMWr6VH3
   64SRBUZ1t/4EfFkIUgBWcR4LxyZprvgUAaB74AYZmmML6nrY6KdkGV5gF
   tNRrh5fkG0IYxuVScQ85HUeMDcEWFkoweToE/PmWmUvnrfjxqQX5TDchC
   xLqYzRGs/mZ4T1nOxuVDlk4O802EdQi6NqG5oJdF+ZGhuGhxFibyRBE7A
   Z3CubcMbxMec9y4to1iLmEnYr4IFYBLU4diCuQR9s8VdMemXQXNqdYWYO
   A==;
X-CSE-ConnectionGUID: qt5F4pQLS0uW9oKESGaEtQ==
X-CSE-MsgGUID: ICsqigI2SMGobHTcvyWOeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6902809"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6902809"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 15:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="20967907"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2024 15:43:44 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpbzh-0001ZS-28;
	Wed, 27 Mar 2024 22:43:41 +0000
Date: Thu, 28 Mar 2024 06:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:kselftest-clone3-set-tid 2/2] clone3_set_tid.c:136:43:
 warning: format '%d' expects argument of type 'int', but argument 3 has type
 'size_t' {aka 'long unsigned int'}
Message-ID: <202403280640.wfzWalmq-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kselftest-clone3-set-tid
head:   6ed9d474840a027cb6b1c5c16fbce9ed626c9dc8
commit: 6ed9d474840a027cb6b1c5c16fbce9ed626c9dc8 [2/2] kselftest/clone3: Make test names for set_tid test stable
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280640.wfzWalmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403280640.wfzWalmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from clone3_set_tid.c:23:
   clone3_set_tid.c: In function 'test_clone3_set_tid':
>> clone3_set_tid.c:136:43: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     137 |                          desc, set_tid_size, flags);
         |                                ~~~~~~~~~~~~
         |                                |
         |                                size_t {aka long unsigned int}
   ../kselftest.h:210:39: note: in definition of macro 'ksft_test_result'
     210 |                 ksft_test_result_pass(fmt, ##__VA_ARGS__);\
         |                                       ^~~
   clone3_set_tid.c:136:53: note: format string is defined here
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                                    ~^
         |                                                     |
         |                                                     int
         |                                                    %ld
>> clone3_set_tid.c:136:43: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     137 |                          desc, set_tid_size, flags);
         |                                ~~~~~~~~~~~~
         |                                |
         |                                size_t {aka long unsigned int}
   ../kselftest.h:212:39: note: in definition of macro 'ksft_test_result'
     212 |                 ksft_test_result_fail(fmt, ##__VA_ARGS__);\
         |                                       ^~~
   clone3_set_tid.c:136:53: note: format string is defined here
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                                    ~^
         |                                                     |
         |                                                     int
         |                                                    %ld


vim +136 tools/testing/selftests/clone3/clone3_set_tid.c

41585bbeeef940 Adrian Reber 2019-11-15  116  
6ed9d474840a02 Mark Brown   2023-11-14  117  static void test_clone3_set_tid(const char *desc,
6ed9d474840a02 Mark Brown   2023-11-14  118  				pid_t *set_tid,
41585bbeeef940 Adrian Reber 2019-11-15  119  				size_t set_tid_size,
41585bbeeef940 Adrian Reber 2019-11-15  120  				int flags,
41585bbeeef940 Adrian Reber 2019-11-15  121  				int expected,
41585bbeeef940 Adrian Reber 2019-11-15  122  				int expected_pid,
41585bbeeef940 Adrian Reber 2019-11-15  123  				bool wait_for_it)
41585bbeeef940 Adrian Reber 2019-11-15  124  {
41585bbeeef940 Adrian Reber 2019-11-15  125  	int ret;
41585bbeeef940 Adrian Reber 2019-11-15  126  
41585bbeeef940 Adrian Reber 2019-11-15  127  	ksft_print_msg(
41585bbeeef940 Adrian Reber 2019-11-15  128  		"[%d] Trying clone3() with CLONE_SET_TID to %d and 0x%x\n",
41585bbeeef940 Adrian Reber 2019-11-15  129  		getpid(), set_tid[0], flags);
41585bbeeef940 Adrian Reber 2019-11-15  130  	ret = call_clone3_set_tid(set_tid, set_tid_size, flags, expected_pid,
41585bbeeef940 Adrian Reber 2019-11-15  131  				  wait_for_it);
41585bbeeef940 Adrian Reber 2019-11-15  132  	ksft_print_msg(
41585bbeeef940 Adrian Reber 2019-11-15  133  		"[%d] clone3() with CLONE_SET_TID %d says: %d - expected %d\n",
41585bbeeef940 Adrian Reber 2019-11-15  134  		getpid(), set_tid[0], ret, expected);
6ed9d474840a02 Mark Brown   2023-11-14  135  
6ed9d474840a02 Mark Brown   2023-11-14 @136  	ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
6ed9d474840a02 Mark Brown   2023-11-14  137  			 desc, set_tid_size, flags);
41585bbeeef940 Adrian Reber 2019-11-15  138  }
6ed9d474840a02 Mark Brown   2023-11-14  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
