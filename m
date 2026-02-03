Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9322FB997
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770102528; cv=none; b=qGWqoRzbiZVJlEMgxuiVlV7CsDLoHiEXJlg3dK3ha9xT+zdDLxjDiXLHZ8DJzwubleqC03GI/aUSKtywBY9eB0H40uM+RsaSEha1jtBcIxrPthbcvivhzzoVPn3srmC0Gpr1H8utgdraZUCsd3UXum/ShKGcGYka6Bmekc50iO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770102528; c=relaxed/simple;
	bh=4Nirk6jvKIsc9szNTCz8QDbYr6Brmtc8uolrOccXmYg=;
	h=Date:From:To:Subject:Message-ID; b=R9yCv6XBA4dcpktgKoFsvtYMIC4LuTsJPu0OMakvLMj4jWDNB3UxqDdk2Dd/pRAQG1BrUzdQd7+YYIatuAnl+ehIuer8iaf4k7NN11ywy9EdDcsw3HVrXlp2X++Y00Zbb8luj+NlRIzdpIjkL2uIQbC6j7K2JKPSblx+0kXp3mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U86iG7lP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U86iG7lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770102527; x=1801638527;
  h=date:from:to:subject:message-id;
  bh=4Nirk6jvKIsc9szNTCz8QDbYr6Brmtc8uolrOccXmYg=;
  b=U86iG7lP67J2A/ydNQJkTroXikKm5oDy1sjLHSqi2MSoPzp/pvkyDIpu
   FPItn5+dExsAS/tcqWBwSAOpKi4QJ60pe4iynAgfOTR3SPPJAiDi7LzsY
   d+Bf+PTx3/A224QjtjZaRMuwlQcH6UliR4g6wwexDaOHwOrXuZGJ2CdFn
   z2dZE21Oac4pz3abc4V/cgPRZGDNJyi6Cbi89tWvXKUX0GQilJ8oJje+m
   u1sqSVo3piuwRa8JMcQ75cflpOyEBNsjU7qx1IbtXNZous1XQsKl/3bbk
   dDo8Wk3i4ulmTI2O4irOQ7QpFqrT+2DSQiEkhKrQkrU4UvIgjrOreF5zS
   w==;
X-CSE-ConnectionGUID: lP3CeiNuSBCbtxRfIOf+qg==
X-CSE-MsgGUID: hVeTQVJ6Sq6b4o4eP8aKMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96723026"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="96723026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 23:08:46 -0800
X-CSE-ConnectionGUID: ISVpdJQKRGK/BxjniSA6HQ==
X-CSE-MsgGUID: MOjTgLIVT7+j/iEHhxxBZw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2026 23:08:46 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnAWh-000000003KN-3wF5
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Feb 2026 07:08:43 +0000
Date: Tue, 03 Feb 2026 08:08:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 10/12] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202602030849.VyfiJUQb-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   0a9d4c1906494daea274a91b38fd1b4b86408a55
commit: 8c3839df5291bfe09e47b3f5fdec79a33b934d43 [10/12] selftests/bpf: Add fentry tracing multi func test
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602030849.VyfiJUQb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#167: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:63:
+		a = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#191: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:87:
+		b = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#216: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:112:
+		b = (void*) value;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#225: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:121:
+		e = (void*) value;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#225: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:121:
+		e = (void*) value;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#228: FILE: tools/testing/selftests/bpf/progs/tracing_multi_check.c:124:
+		f = value;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
