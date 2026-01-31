Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330678C9C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842455; cv=none; b=a1f6BHSLClkXyR07sEoOyOdvV9+GBWM23peWwNSX5jdOfZfpGbhUiyFBlqKzJgJUEYOpjMiMuzcO4Veo4vibcqjQO0wPGvKoGt6I8P3WHLjaDxzkAGLdk9WotfglMK8jU2YiMRDJByQtUbMyuMMrHHvDSL6ez1Oq1hFawpSgTsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842455; c=relaxed/simple;
	bh=LffOJBCP6DxokJWiSMK0HgacipQEbJjOLDO8r6DZpH0=;
	h=Date:From:To:Subject:Message-ID; b=dmJzzxN9qeDBm9rtYYCGX9kum6YvPBQ+CU8ORwJKztFZkI5gaaPCZTONdp5J8+FN8PwC1UO4Ego+VvPT+nJ+ae7Slv0SN3HtNzr8oYDDHml4Ji5DgqptsJBvrfuNswlRjnIqcpWyeBaoVYhLQauELLaeZKpPXFC5xI3Y6YtxDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCbSWy53; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCbSWy53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769842455; x=1801378455;
  h=date:from:to:subject:message-id;
  bh=LffOJBCP6DxokJWiSMK0HgacipQEbJjOLDO8r6DZpH0=;
  b=YCbSWy53KY5/3Gwk4nAEHQqDi4+RylNnAQKzZ6TK29YSm1Eq5riGgthn
   BFWgirJYCMfKUUvrgqh2xn9prUFOOy1/6wWuHks6XfEbPbOaaCY9JNzGb
   zJXZDRYvieiE/HVvIMlPcZg13Ht9dhfCaL5jS1854xIQvSbxWDaNBThYM
   XRNoXbd9aaIf/10EOJfjq3j5hh1YSEIhyadkh12lQx4+8Etu/nz5qvmkZ
   ptgSNWLml8rFsZ3Ph4yOegWd8Dy2GKD/12/OwbzN7vqdX5mj1Kz3Cs5bQ
   Ln1XzJwon/DTx/Zj2ydn5j17WkxL9s8qn9mUGLcNZcbDj86NAYm56cwKL
   Q==;
X-CSE-ConnectionGUID: 5eN+0uJqRiaEYRx3BpzLng==
X-CSE-MsgGUID: NknSNtoGT72H1UPb3QvkeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70804875"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70804875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:54:14 -0800
X-CSE-ConnectionGUID: Tqi1w3ejRQOGfg2X7tjruw==
X-CSE-MsgGUID: EB/57I2VRMmzCLnoz1x1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="231961046"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jan 2026 22:54:13 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm4rz-000000002f9-2nlL
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 06:54:11 +0000
Date: Sat, 31 Jan 2026 07:53:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 9/12] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202601310705.dUhtFkso-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 375e9ffb40c526e3a576632597082cccaa377a9d [9/12] selftests/bpf: Add fentry tracing multi func test
:::::: branch date: 8 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310705.dUhtFkso-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#153: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:63:
+		a = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#177: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:87:
+		b = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#202: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:112:
+		b = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#211: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:121:
+		e = (void*) value;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#211: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:121:
+		e = (void*) value;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#214: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:124:
+		f = value;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
