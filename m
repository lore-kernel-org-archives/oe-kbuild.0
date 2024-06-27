Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1513C9CA
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487165; cv=none; b=MxRtRNTkujtknZjlZojZOtM5+Wkv4rXn2AgBrpCAuVt/ifSTQMxEtShECKcZFuxhJCaV76K3nRI+klTHVjz2FOfSCbLU1hH+d6CCS7pcKfSrugItmxD1JHxRyhEdNeJCis4E5J8fsVHsq8SUyaHEJtXSWnDJ+eHUnB9fGEpSFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487165; c=relaxed/simple;
	bh=3Bup+y56Plnzf622H36s/DHZUbdZl1nd8Vu+cXhsGMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYmachvU0RPMGdBK2iruYO+gG6uehkVCbhAqaHPpwAkjQcPuKx5uGXAXDiCAhhFQQbZUyxNghkJzQOvGLzLEagsoICS+wLd+oeenB9hiQSHnuGLwtiMy0mVg3T8cAZArQiNvrat9xwxmOP457vQYPzuFarl3XFtviAHnpNLPNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btPwx7/o; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btPwx7/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719487163; x=1751023163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Bup+y56Plnzf622H36s/DHZUbdZl1nd8Vu+cXhsGMs=;
  b=btPwx7/o1yHxFNpWDA3vjKEal+J6YqSZjuxFaBC511B25H4Arv17r5Ko
   K1RTZa4DICUq3NztlYhPqJrfzfB3RbvZNgco/Kwxz9Rc9cdJDUz5yEpPK
   Zy/7r9j78bM6wz0T6O0sSmGD1PoXAzEeHt4hgES9IfvPtLUFjUczM6jRJ
   lsRssAKAA2BbDIKdoVnATb6Qj01YD+c7wkHOei/Htn+YNGDKubGkA1U+K
   /8iuzvpSloMqPQlsiAldigkWENoRTUQB9zbO/KEPI0BDFY5aQezrPPMyU
   6JducsEshwBvG01+59pXrU6udMMHo0cNx3+Qzr0H+HjM1Za8NGpau2rBr
   g==;
X-CSE-ConnectionGUID: FmAxFJpwQdCiM17ckj24sA==
X-CSE-MsgGUID: Ol4miCfnToCqfb8mHmdg2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="12280111"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="12280111"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 04:19:22 -0700
X-CSE-ConnectionGUID: JE5HJ4HOT1e7r/opfxfCWQ==
X-CSE-MsgGUID: c9FLv8LES0O35NYuzIrP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="44408706"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2024 04:19:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMn9r-000G9O-2H;
	Thu, 27 Jun 2024 11:19:19 +0000
Date: Thu, 27 Jun 2024 19:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7931/8719] statmount_test_ns.c:27:17: warning:
 format not a string literal and no format arguments
Message-ID: <202406271913.5Vxny2Tc-lkp@intel.com>
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
TO: Josef Bacik <josef@toxicpanda.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: f0f1033dd078339a6588b571fe1243e2a2c5e519 [7931/8719] selftests: add a test for the foreign mnt ns extensions
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271913.5Vxny2Tc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406271913.5Vxny2Tc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   statmount_test_ns.c: In function 'handle_result':
>> statmount_test_ns.c:27:17: warning: format not a string literal and no format arguments [-Wformat-security]
      27 |                 ksft_test_result_pass(testname);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:29:17: warning: format not a string literal and no format arguments [-Wformat-security]
      29 |                 ksft_test_result_fail(testname);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:31:17: warning: format not a string literal and no format arguments [-Wformat-security]
      31 |                 ksft_exit_fail_msg(testname);
         |                 ^~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:33:17: warning: format not a string literal and no format arguments [-Wformat-security]
      33 |                 ksft_test_result_skip(testname);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c: In function 'test_listmount_ns':
>> statmount_test_ns.c:322:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
     322 |                 write(child_ready_pipe[1], &nr_mounts, sizeof(nr_mounts));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> statmount_test_ns.c:323:17: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
     323 |                 read(parent_ready_pipe[0], &cval, sizeof(cval));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:331:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
     331 |         read(child_ready_pipe[0], &nr_mounts, sizeof(nr_mounts));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:335:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
     335 |         write(parent_ready_pipe[1], &pval, sizeof(pval));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +27 tools/testing/selftests/filesystems/statmount/statmount_test_ns.c

f0f1033dd07833 Josef Bacik 2024-06-24  23  
f0f1033dd07833 Josef Bacik 2024-06-24  24  static void handle_result(int ret, const char *testname)
f0f1033dd07833 Josef Bacik 2024-06-24  25  {
f0f1033dd07833 Josef Bacik 2024-06-24  26  	if (ret == NSID_PASS)
f0f1033dd07833 Josef Bacik 2024-06-24 @27  		ksft_test_result_pass(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  28  	else if (ret == NSID_FAIL)
f0f1033dd07833 Josef Bacik 2024-06-24  29  		ksft_test_result_fail(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  30  	else if (ret == NSID_ERROR)
f0f1033dd07833 Josef Bacik 2024-06-24  31  		ksft_exit_fail_msg(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  32  	else
f0f1033dd07833 Josef Bacik 2024-06-24  33  		ksft_test_result_skip(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  34  }
f0f1033dd07833 Josef Bacik 2024-06-24  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
