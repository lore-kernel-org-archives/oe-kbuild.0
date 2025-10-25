Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E821A94F
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761420031; cv=none; b=Ko0jqzP0L+mI0pSw8yuZ13PKSHqlHbgTY8WfhhEeYVb3LXMfFJ/qC/8TQrbvFz8E4/PCGt/809WbQVwdlbCA6XZut41ifIap48qEbATc/23WSSy6qMiYTOr5vM63X7K789VV8q110ncNWsSmzauXTQPaQa1slHWuESqY3eXB49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761420031; c=relaxed/simple;
	bh=i1lZBM/puUf1CHMf6zpmJ8Dmyp0meepWfR49vmjoN+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKcSvVSt+NGOT71hlRbZyxr6xt9zL4aRJra/T0S/wV8ABMvmqZbXi/d0RLK1QzwPIZ54aL1w5/d76iEyeK4zQ9i9BlFnRRiijkzwUUaG6rYlz8fWIxi5Te2ndvzwQtOInctk/q0yBcd02XaCBwj1K78aepcUWzBBRXA3mYnZQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0GHB+GG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0GHB+GG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761420030; x=1792956030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1lZBM/puUf1CHMf6zpmJ8Dmyp0meepWfR49vmjoN+Y=;
  b=X0GHB+GGLAYF+C/GroDnpNjCqKoYuTfLqECeIIrtelyJghYI0GK1DNcL
   7efIRLXv008ORz5qCSgKHrh2KP3sskFPNJgnYBIiMlAf5DoyqWc1pW0SK
   tWik5Y2oxFQrjVsD2iqUCbbfPka64v26q9A1sJ6M6ELVhDqYAH5excNyG
   xWQa23nZN0BVNCy9Hm3t2LriVHgYUQMJDaeTCwvuJVIzJWyNSnt+CwuuZ
   N9HeGgwimNQZcFsz0uSgtcV/xFr5S76SzeLYE0VSca3XvKKV40f47TOTR
   YabJF5pc8DAIBWMAfGx5HQa8hGvMXvg/y4e6Kb2YlshfLGhq/X44o6a5Z
   Q==;
X-CSE-ConnectionGUID: Wu5Zi6wHSwGp9he4y5fQnw==
X-CSE-MsgGUID: E6kZAttSQLKNU8I63vwjfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62769966"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="62769966"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 12:20:29 -0700
X-CSE-ConnectionGUID: 3jVHF4AYRMqSi+kLQPfugw==
X-CSE-MsgGUID: YXZ2g1Q6RtOJgGc/Yw9uCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="189815521"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2025 12:20:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCjnP-000FXX-2k;
	Sat, 25 Oct 2025 19:19:45 +0000
Date: Sun, 26 Oct 2025 03:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: pointer_masking.c:216:25: warning: format string is not a string
 literal (potentially insecure)
Message-ID: <202510260342.qQLArXOY-lkp@intel.com>
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
TO: Charlie Jenkins <charlie@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bb956508c9d94935bedba4f13901fb2b7468e91
commit: 498d5b14db8c9118be139f668720c67bea2dc344 riscv: selftests: Fix warnings pointer masking test
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510260342.qQLArXOY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260342.qQLArXOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260342.qQLArXOY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> pointer_masking.c:216:25: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     216 |                 ksft_test_result_fail(err_pwrite_msg);
         |                                       ^~~~~~~~~~~~~~
   pointer_masking.c:216:25: note: treat the string as an argument to avoid this
     216 |                 ksft_test_result_fail(err_pwrite_msg);
         |                                       ^
         |                                       "%s", 
   pointer_masking.c:223:25: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     223 |                 ksft_test_result_fail(err_pwrite_msg);
         |                                       ^~~~~~~~~~~~~~
   pointer_masking.c:223:25: note: treat the string as an argument to avoid this
     223 |                 ksft_test_result_fail(err_pwrite_msg);
         |                                       ^
         |                                       "%s", 
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
