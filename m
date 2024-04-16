Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A22517736
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713306377; cv=none; b=LXys/kT4guUwXyo3ufKlvcvjiSTb22QTeHEKDYgs1sLnHjFmYvZ0ZqqkepgJPpwOHaGWQQmX5XwBmjA3yXbsfvmhLW22yH9v1VhnX8CO6NZSzQJnkr0NVtHurKFlIflezUAOLOoOu0k6LsPxvUITDgEMuKeFOHgriIvitUQ6BmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713306377; c=relaxed/simple;
	bh=jw5pQU38eBmWwloggLIjgRk4E0Md3FFj+E2J0AqLvmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdmETAk8T9/onsNOXDQqccvNeI/Zw6lja6o2lOOrRDxTnAtJz5DOsyMJo6i15Yxin2v+Qxwr/eIFkFAUlNQ6LofY2WGkP/Q/DN1PXKxS9MGV1E/S8yipB659cV4EK6PDqpLFZg61r5DXSAh8XncttFbM8v5P4YjN/oPmQUIURj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoV72chX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoV72chX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713306374; x=1744842374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jw5pQU38eBmWwloggLIjgRk4E0Md3FFj+E2J0AqLvmY=;
  b=CoV72chXUB8ShaPpU47W/3Sg7Q2YXXPjVDrw1RpM0sLsrMQSqY6qfsc7
   l9JjrwyiF8i/uhB2+ZUjuo7vDDswoEgluTp5aoqcJJ1BRRrCZDk7DC87e
   ucoI8g68BpWUWV3gTX64HH4ESg+vhYvvTgfI7JmRsMtLjfdGVqKn9yNuR
   1QVj4u8GTIahmHhxcEqQ/E3130DNbAZSvVD0DJHx8NI6hgjvSAqrPgG1n
   Zfb5iSApG6rawOCmE3XX333/VrXSZxKKpbs4M68ifS0ZXg52QgOmWkMLg
   DaT0JVHaLOJBKnu38Q9iDgZZRZJYV30SJOXwVOXS2bJTgKt+w6LUcIruF
   A==;
X-CSE-ConnectionGUID: nCfBt8lWRhSbkBhm/x8TaQ==
X-CSE-MsgGUID: 8VKvi8rhTOaSqLzRdg6ZZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20166628"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="20166628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 15:26:14 -0700
X-CSE-ConnectionGUID: ZDzU6Y2PTC+7No5ynTwIhQ==
X-CSE-MsgGUID: g3nu8ID9R7qbmu3vYDvV9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="26967540"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2024 15:26:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwrFi-0005nI-2A;
	Tue, 16 Apr 2024 22:26:10 +0000
Date: Wed, 17 Apr 2024 06:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./../kselftest_harness.h:1152:30: error: format string is empty
Message-ID: <202404170611.Kkkdkvdy-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   96fca68c4fbf77a8185eb10f7557e23352732ea2
commit: 378193eff3399acb8529d0b553709e8f91d34fe3 selftests: kselftest_harness: let PASS / FAIL provide diagnostic
date:   7 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 7 weeks ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170611.Kkkdkvdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404170611.Kkkdkvdy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ./../kselftest_harness.h:1152:30: error: format string is empty [-Werror,-Wformat-zero-length]
    1152 |                               diagnostic ? "%s" : "", diagnostic);
         |                                                   ^~
   1 error generated.


vim +1152 tools/testing/selftests/hid/./../kselftest_harness.h

65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2023-01-25  1108  
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1109  void __run_test(struct __fixture_metadata *f,
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1110  		struct __fixture_variant_metadata *variant,
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1111  		struct __test_metadata *t)
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1112  {
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1113  	char test_name[LINE_MAX];
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1114  	const char *diagnostic;
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1115  
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1116  	/* reset test struct */
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1117  	t->exit_code = KSFT_PASS;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1118  	t->trigger = 0;
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1119  	memset(t->results->reason, 0, sizeof(t->results->reason));
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1120  
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1121  	snprintf(test_name, sizeof(test_name), "%s%s%s.%s",
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1122  		 f->name, variant->name[0] ? "." : "", variant->name, t->name);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1123  
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1124  	ksft_print_msg(" RUN           %s ...\n", test_name);
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1125  
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1126  	/* Make sure output buffers are flushed before fork */
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1127  	fflush(stdout);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1128  	fflush(stderr);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1129  
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1130  	t->pid = fork();
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1131  	if (t->pid < 0) {
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1132  		ksft_print_msg("ERROR SPAWNING TEST CHILD\n");
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1133  		t->exit_code = KSFT_FAIL;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1134  	} else if (t->pid == 0) {
92d25637a3a459 tools/testing/selftests/kselftest_harness.h    Li Zhijian       2021-12-17  1135  		setpgrp();
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1136  		t->fn(t, variant);
796a344fa4315f tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1137  		_exit(t->exit_code);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1138  	} else {
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1139  		__wait_for_test(t);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1140  	}
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1141  	ksft_print_msg("         %4s  %s\n",
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1142  		       __test_passed(t) ? "OK" : "FAIL", test_name);
9847d24af95c7f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1143  
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1144  	if (t->results->reason[0])
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1145  		diagnostic = t->results->reason;
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1146  	else if (t->exit_code == KSFT_PASS || t->exit_code == KSFT_FAIL)
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1147  		diagnostic = NULL;
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1148  	else
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1149  		diagnostic = "unknown";
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1150  
732e2035280bf4 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1151  	ksft_test_result_code(t->exit_code, test_name,
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28 @1152  			      diagnostic ? "%s" : "", diagnostic);
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  1153  }
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  1154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
