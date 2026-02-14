Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E72C7404E
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771043101; cv=none; b=Zq+o/Vk2a4VvKCwdwCMoaPv4UX+5+f4JG6uL7kAafieKl+2Fj/K0l+TIwhUjohQSJ84PDr4CiWX84i+oHoOrPUyz1ZDs9OGsI+NxZx+c8IRYGewNS07u03NCUKJ38xXkBDUk+qna247Wgc1uD/vWHgNdQV8PWzMQqdAxI7XEevM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771043101; c=relaxed/simple;
	bh=znae5FFyzzRxLK+4q6VE/Kkq6vERMXyRT0SJDrzJmKY=;
	h=Date:From:To:Subject:Message-ID; b=K/GicMTywSJc/OinPV/jLhquS7Qthw35Z7uV7Gz01FEyeWJydfRo1ZYl1VOqjVdb1aABMalgTFh9QrEcHCQS/HOzDmOl3gzC/QVhfQFUvXgY4LYB1zifa0ouizpqgYoe7SN+Q0FNacxlpwgPK74tktNpP8lC4zKJ5LlB+1MSyFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1vdh9Xu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1vdh9Xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771043096; x=1802579096;
  h=date:from:to:subject:message-id;
  bh=znae5FFyzzRxLK+4q6VE/Kkq6vERMXyRT0SJDrzJmKY=;
  b=B1vdh9XuvVOUVycW1/GuTQe2YPm3c77vB5h6IkN6D2Tk/XCA2yjvAW0m
   SO/8PkcEl9x0PL1b6ZahkgQHBYk3qn3Q8HJ0l0FW092UOWwNMCkC5SVvs
   FjQLzuWrvYQhA/2BKZ7VkLUPJIp8ZssNziT39LpjtTOblZ8R/qa803ULx
   sAuk5Wb6EooenFXW2yT2YsEgs3k4KLTX5I80y2ssjpgWLIaahoiY2vflt
   6ErbuDIVm9ut3jacfvQ4gxZFXVoDFkcHPHgkROL6pqd9RNwmAip6FvPPB
   A40OfWHoP3qtHL/sQnfcYGcoBy7uQNw20gqtLEGfhXq6H+rk3uEBSibur
   w==;
X-CSE-ConnectionGUID: CmeRBFWPR9qIboVMh5xlmQ==
X-CSE-MsgGUID: wTMyRc1HQVimZ7z9PY7wnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82552730"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="82552730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 20:24:56 -0800
X-CSE-ConnectionGUID: fZ5mfbO0Q4+FRQXJ/Ci2bA==
X-CSE-MsgGUID: OpShhrmkQQ+lshH3MnDEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213113665"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2026 20:24:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr7DA-000000001lN-2DP5
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Feb 2026 04:24:52 +0000
Date: Sat, 14 Feb 2026 05:24:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tj-sched-ext:for-next 4/4] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-6-v1'
Message-ID: <202602140507.i7bxZUPb-lkp@intel.com>
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
TO: Ihor Solodrai <ihor.solodrai@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-next
head:   0b82cc331d2e23537670878c62c19ee3f4147a93
commit: 0b82cc331d2e23537670878c62c19ee3f4147a93 [4/4] selftests/sched_ext: Fix rt_stall flaky failure
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260214/202602140507.i7bxZUPb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-6-v1'
#37: 
Assisted-by: claude-opus-4-6-v1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
