Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913D18EAB
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 02:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713236306; cv=none; b=trGq1eNZ0k2Xy57JWTMOFbySOdjanIlHFwwydHC1fry8Iog6CMegYyhMtybLskMTTMsske7Y/szLuhii7BSoLqFHqfe6/rvQw++jzEua0/mWzphjoZxzDdzC1Nzql5gs8zuu4RhcDCtIeq8pzvddXjPtHJkVlRfVOVhUsNUTvFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713236306; c=relaxed/simple;
	bh=u7TfWg2NlMEEgGAM/4Ty0JXSbz4KlltOyM/kiDr7U1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gE0v4MbP3Jx+lZ69au9JyR2DsPN/iFdFIa0Q/9SjDlytuPRxccaPJ/qihq5SGOjS+CPorSPVBd4zD4Udf/X0MU5GWQLz9VAo6ZxhhoPg7PRLwSOZj95pX3Lcfet/a4YlotjqRLl2NVi7wMxdh5WStLm1FuqBG1ColAau6OFAdgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+Q0TJXg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+Q0TJXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713236304; x=1744772304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u7TfWg2NlMEEgGAM/4Ty0JXSbz4KlltOyM/kiDr7U1A=;
  b=c+Q0TJXgyE0XgOxnueFbwPWp5do1xr1meQ9zqzzJw/BoeSzzeCFIdVKA
   xgh1VY7vbxXKSYYfy50ErWrtt/NGnFLOcSPUtntmcNDAjg/9cHpEDCxk/
   YdpEwQtSQHyAkKcyBgklyZDwdTu21MIcIjVNAzJHupWkBqlr+9t/eiAye
   hJntqEywp+7Y/mZVL5ygm+jld5KgpuEpMn42GxVN7t8X/4/6XuWTXUvyo
   ltWG/27yRQ0uipxAMn48dhb/KTv+u/RXE0yse32nUAbc+SSz+zqafZ5kS
   4050yXfjqC8+XwsgCHpVYppO8nNnjPhsFZ1yyWSE2eudBtRAc70lcfmed
   A==;
X-CSE-ConnectionGUID: OywUIGnjSrqKucIMX3RImQ==
X-CSE-MsgGUID: 34kO2JVZSBmjRKJJfojGfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19256854"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19256854"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 19:58:23 -0700
X-CSE-ConnectionGUID: 3Y7JwLiHQpCm1hTzFJGeWQ==
X-CSE-MsgGUID: ITUZoQi4QwCDnk76vzWmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26767873"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 19:58:21 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwZ1X-0004tM-0v;
	Tue, 16 Apr 2024 02:58:19 +0000
Date: Tue, 16 Apr 2024 10:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5507/6266] ../kselftest_harness.h:1167:9:
 warning: ignoring return value of 'asprintf' declared with attribute
 'warn_unused_result'
Message-ID: <202404161023.K0EsnDmF-lkp@intel.com>
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
TO: Edward Liaw <edliaw@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: c19377e23d4cb45f69c5d226ae3436f7fa818c8f [5507/6266] selftests/harness: remove use of LINE_MAX
:::::: branch date: 21 hours ago
:::::: commit date: 3 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161023.K0EsnDmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404161023.K0EsnDmF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tls.c:24:
   ../kselftest_harness.h: In function '__run_test':
>> ../kselftest_harness.h:1167:9: warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result' [-Wunused-result]
    1167 |         asprintf(&test_name, "%s%s%s.%s", f->name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1168 |                  variant->name[0] ? "." : "", variant->name, t->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/kvm_test_harness.h:11,
                    from x86_64/fix_hypercall_test.c:12:
   ../kselftest_harness.h: In function '__run_test':
>> ../kselftest_harness.h:1167:9: warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result' [-Wunused-result]
    1167 |         asprintf(&test_name, "%s%s%s.%s", f->name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1168 |                  variant->name[0] ? "." : "", variant->name, t->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics


vim +1167 tools/testing/selftests/net/../kselftest_harness.h

65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2023-01-25  1153  
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1154  void __run_test(struct __fixture_metadata *f,
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1155  		struct __fixture_variant_metadata *variant,
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1156  		struct __test_metadata *t)
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1157  {
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1158  	struct __test_xfail *xfail;
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11  1159  	char *test_name;
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1160  	const char *diagnostic;
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1161  
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1162  	/* reset test struct */
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1163  	t->exit_code = KSFT_PASS;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1164  	t->trigger = 0;
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1165  	memset(t->results->reason, 0, sizeof(t->results->reason));
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1166  
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11 @1167  	asprintf(&test_name, "%s%s%s.%s", f->name,
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11  1168  	         variant->name[0] ? "." : "", variant->name, t->name);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1169  
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1170  	ksft_print_msg(" RUN           %s ...\n", test_name);
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1171  
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1172  	/* Make sure output buffers are flushed before fork */
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1173  	fflush(stdout);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1174  	fflush(stderr);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1175  
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1176  	t->pid = fork();
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1177  	if (t->pid < 0) {
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1178  		ksft_print_msg("ERROR SPAWNING TEST CHILD\n");
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1179  		t->exit_code = KSFT_FAIL;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1180  	} else if (t->pid == 0) {
92d25637a3a459 tools/testing/selftests/kselftest_harness.h    Li Zhijian       2021-12-17  1181  		setpgrp();
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1182  		t->fn(t, variant);
796a344fa4315f tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1183  		_exit(t->exit_code);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1184  	} else {
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1185  		__wait_for_test(t);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1186  	}
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1187  	ksft_print_msg("         %4s  %s\n",
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1188  		       __test_passed(t) ? "OK" : "FAIL", test_name);
9847d24af95c7f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1189  
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1190  	/* Check if we're expecting this test to fail */
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1191  	for (xfail = variant->xfails; xfail; xfail = xfail->next)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1192  		if (xfail->test == t)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1193  			break;
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1194  	if (xfail)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1195  		t->exit_code = __test_passed(t) ? KSFT_XPASS : KSFT_XFAIL;
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1196  
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1197  	if (t->results->reason[0])
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1198  		diagnostic = t->results->reason;
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1199  	else if (t->exit_code == KSFT_PASS || t->exit_code == KSFT_FAIL)
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1200  		diagnostic = NULL;
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1201  	else
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1202  		diagnostic = "unknown";
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1203  
732e2035280bf4 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1204  	ksft_test_result_code(t->exit_code, test_name,
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1205  			      diagnostic ? "%s" : "", diagnostic);
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11  1206  	free(test_name);
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  1207  }
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  1208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
