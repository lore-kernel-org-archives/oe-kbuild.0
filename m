Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6322A4EB
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865602; cv=none; b=KAGmDoymiq1rJEP7UBMXUejRM9f2bUKdvjJ+MN5ICkok52jZ2VAq7gjXm0h+7Gi9y8JBsOlRkz13jQSA/yswfoU8GHWl757AzWS0guUKoL3CeJdo6UNQ4sJ/K+mHdaOQj6KujIJZzwxBuoly0kdFhiOGDQN06BHnd7HrcV8V7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865602; c=relaxed/simple;
	bh=wNW3U61eO8qAepDevy4uWIb7ZpVjTb5utO4XVjtURKY=;
	h=Date:From:To:Subject:Message-ID; b=ruc2PkpI27O6P60VCJV0z1pqfME7HuHA053kIt4jcN1m29UgYUa7SctV79oDW7jnCfcj41h2bqCm0sEi9lkjhLDSXfJVrxz24FPtbxGLY/XyA16ujEFOeCoxwatNDcikPnVSX+5plr9FNZKzYDzOKYF+Nqm2bhtFduAoAveFURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW5qUIOP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW5qUIOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770865602; x=1802401602;
  h=date:from:to:subject:message-id;
  bh=wNW3U61eO8qAepDevy4uWIb7ZpVjTb5utO4XVjtURKY=;
  b=DW5qUIOP3OYbKO095bF+aqL7lGv+Ju6BVDkMnejPRkB3s4ONZeZQ1gDW
   Ng2WTctf9/+DG0wgfLTZqG3CFC1HPQfWW9VQjgCZXwuRQqCEwDnqcwMCf
   ApAWW5TwD1AvFiezlEmN34gVSJhc5KJw71dPfWEWnZvlrqgkAvbpS2aOT
   FHIvF5hV8zF46+Kf37bIVBWM9qt2UBTXoG3CBJdToPcFGJ970sfNYr2Xr
   A5/4JAs/UZ14pzukRnh9HhwDX6KDTNAncd5PGwmaM337GfVQq7wlnj+I0
   BdPAQjpb7ZFVWs3zSjlRNnns9AhMC1YCbBgeGD2uoxhzj4hRJmW0Asu9b
   w==;
X-CSE-ConnectionGUID: QjR+/ppmS9qoBBLD3lnTcQ==
X-CSE-MsgGUID: D9dcITO3SrynSA+GA4BVDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89616178"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="89616178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 19:06:34 -0800
X-CSE-ConnectionGUID: c/8ahznlQXaY9SYqRa5yjA==
X-CSE-MsgGUID: rPan4Gp4TUafaqBNfttg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211450316"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2026 19:06:33 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqN2E-000000001Fj-3yCQ
	for oe-kbuild@lists.linux.dev;
	Thu, 12 Feb 2026 03:06:30 +0000
Date: Thu, 12 Feb 2026 04:06:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_4 12/13] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202602120456.1CAUekUW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_4
head:   a3f496c783e26237e1a9a5b1f5e6661d4e3c5f25
commit: a8148ff9b353ee9fc291a295028df8375377483a [12/13] selftests/bpf: Add tracing multi skel/pattern/ids attach tests
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260212/202602120456.1CAUekUW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#275: FILE: tools/testing/selftests/bpf/progs/tracing_multi.c:70:
+		a = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#296: FILE: tools/testing/selftests/bpf/progs/tracing_multi.c:91:
+		b = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#318: FILE: tools/testing/selftests/bpf/progs/tracing_multi.c:113:
+		b = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#324: FILE: tools/testing/selftests/bpf/progs/tracing_multi.c:119:
+		e = (void*) value;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#324: FILE: tools/testing/selftests/bpf/progs/tracing_multi.c:119:
+		e = (void*) value;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#326: FILE: tools/testing/selftests/bpf/progs/tracing_multi.c:121:
+		f = value;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
