Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E52258EFF
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 00:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774659182; cv=none; b=vCWkGjHKxXK3Wk5pBrJiuLx892sEuq318foZrTnZdaRfzVlD+9GJk96ZQYukWbSLv8HE94EOdO7nlgwkYEWSeKdSLJjqFDQ42LfA6sYuAnC8bzdgn1IxDXk9gAuhrGt8MPs87k4kEzCUckNfMcWoBihO8JkHRwJ4lrlZbKNCFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774659182; c=relaxed/simple;
	bh=94mojq0y0zveAyZLAyderx9pUpgdyOZlrGzXkYw2C/A=;
	h=Date:From:To:Subject:Message-ID; b=eYro7KlClmm1AY681FktuNtRbVN3kYsTPln4G4ttRhSvaaVdm3fxOyiQBhh6taenf2NlTgNdp6EqO1xf/PvKsyYkZig7xZNcMrJFfSJb+ifHvWkkHwSWotAZ3Dyas7J7hGRGxJ1MurO5Kbaa8ZZ9v2snVrs1QcI6IHnE+TE+SnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMj44sfT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMj44sfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774659180; x=1806195180;
  h=date:from:to:subject:message-id;
  bh=94mojq0y0zveAyZLAyderx9pUpgdyOZlrGzXkYw2C/A=;
  b=CMj44sfTYgOGJGERzG8Irkjvd+ZVbfkeaoADo+Chz78oyJdBjR8iD+II
   9mbDuGiIinHDwUc781FidnOtMzPuVV16jcWAAJQ09vMw9wEYTRq0+ZqNU
   YMNKBMq0dX8BGJN4bQQoUFgFTqvCNmUU4FvOk+6TiCgqAL8gNmRNg3HvY
   BSuRC9bwMZMkKrHsRE5Y+5Q5bb3aTT0PQK1jEGPV89QjS7kUhTJrTnJbE
   wPUDbImsYoLYJVwrcJR5GumXAof9qhT++nBVrLGAo6Vu6YUJLKLfIM4ZD
   NMUHpVSIJ6yB99+0o9gl62ZJcxcmOb+SQ5dkcbKDro4LfF575wlpirzgP
   Q==;
X-CSE-ConnectionGUID: P2MkNOtsRSWffvspb9jiQw==
X-CSE-MsgGUID: Bw5QLvMITLKdnjvnJuu5Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="101196826"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="101196826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:52:59 -0700
X-CSE-ConnectionGUID: lCsD4yU+QS6WeAsj1r8LGg==
X-CSE-MsgGUID: A0voZYnKSsaNOvQ70Voe+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="222149672"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2026 17:52:59 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Hv6-000000007az-2j7L
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 00:52:56 +0000
Date: Sat, 28 Mar 2026 01:52:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ast-bpf:stacklive 11/32] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202603280120.1ZQbGn4i-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   2c7480c8546af68d960edce3a011553f6e8bab9c
commit: f17f5633019576d19ff6a089b413d0314e9c16fa [11/32] selftests/bpf: Update tests for static stack liveness output
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280120.1ZQbGn4i-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#118: FILE: tools/testing/selftests/bpf/progs/uninit_stack.c:79:
+		r1 = *(u64*)(r10 - 104);		\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
