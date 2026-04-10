Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C2078F4F
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 23:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775862976; cv=none; b=i1C4uU+m6r+Z5DolRyPZGQIv0rA7UvM5NZpvhdT5bZxki8qew9VIUziW31Qh5lSHpak2oERrKKlKUBchzmYvkMtXELtou9HYFiUn2M5ryBQYTxKgsaNNmW8zARZRTnkNWHL1QSUkHmWllV2jp2PIpEWUg1QaZsNiGFngjdeQWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775862976; c=relaxed/simple;
	bh=z+P1S7YjCLXm15EKfUKcNJwiE01bIMIGxYUZO91RmEc=;
	h=Date:From:To:Subject:Message-ID; b=pesYS/xATO1IZsg9ai0NJ4dKD4lXJ2J5/SzVd805x+ERWpKIxFzs3mfK4Ap0+PtvvJjoTvMdUu+MgTykzkN7TMELRRw7HqMFv45kfjN4+fhCwHYwiFPcEy2cV0FH5QTKsh1cLL/m/dqbTm5/3SgIOJEQnwo9tUuL+qjgiCupAIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJnJOwOW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJnJOwOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775862974; x=1807398974;
  h=date:from:to:subject:message-id;
  bh=z+P1S7YjCLXm15EKfUKcNJwiE01bIMIGxYUZO91RmEc=;
  b=QJnJOwOWarz3ul5MEgZJheBb2+sV9QB5JRM5SLeFLB5PUo5vMrg8mlxH
   E/EZiuLSqRZcJt9t/pOBY2dxI8zetfgrZjqsLekCFyCXx/Dk1JqVv35pN
   /Ve/WMUKI6MLoE0tGBhnMr47eQxUufRe88lzTO4AmbnZl9iR6S1anhtm9
   V1rTHdHYqzNe5TUb0IpH+XQWopvXfJFx83/eN0LTe81/liVjodjHjs6SE
   x8RztMEzj3upQLvTflzh34Ze8qpwU8OE9gRwBpBNUg3+lap6DSw8IrGnw
   tqiAaN4Spf3UooAr3mbFf2SX3aKvrRBuUpbahtywPqGs8wl2nlNJQhvCN
   w==;
X-CSE-ConnectionGUID: 3Q0EXWfqTp6Y50V2zB8eyg==
X-CSE-MsgGUID: 8QQ1i/cLRQytKWMfoNvqRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102347248"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="102347248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:16:14 -0700
X-CSE-ConnectionGUID: j+Lvt0KBT/O+9LGwuDdH+Q==
X-CSE-MsgGUID: 9Tpc0+LMQFylOv39CZrCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259687031"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 16:16:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBL59-00000000Ay9-1u9F
	for oe-kbuild@lists.linux.dev;
	Fri, 10 Apr 2026 23:16:11 +0000
Date: Sat, 11 Apr 2026 01:16:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bpf-next:master 73/77] checkpatch: ERROR:POINTER_LOCATION:
 "(foo*)" should be "(foo *)"
Message-ID: <202604110120.wKCMPiDT-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   e2e6a6ea2418e23d6afaf3c37e207f6ca85ba9d8
commit: b42eb55f6ca29d9cc9d2239f8665cca5f16efecb [73/77] selftests/bpf: update existing tests due to liveness changes
:::::: branch date: 37 minutes ago
:::::: commit date: 54 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260411/202604110120.wKCMPiDT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#64: FILE: tools/testing/selftests/bpf/progs/uninit_stack.c:79:
+		r1 = *(u64*)(r10 - 104);		\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
