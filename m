Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37A303A35
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672889; cv=none; b=R7ti8+2SXNZZap7YhwHGUzxEmzd+RwjgjVsD12nn4PBOoZvO8YWAlAyKpcgIrwj42lZuZlq0hGgultNbpG3rSrs8Dr7bdCp/lH+q63l1Al5BrmKNhFtYJfanoSuw06Sa9RlJr3z+SL3D6RSRTyQjO/0mt1ng13rY4iyXzT66XMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672889; c=relaxed/simple;
	bh=XVGp862IZFN752ZLPH2H3j+ogZwxHjDlribOPQHJ5w0=;
	h=Date:From:To:Subject:Message-ID; b=Gs/GLy1Uo5f+dHDWgqpquLLyiJYrAKCXnicIIPqANxfufmgZy7jJPhWSzgzHHbhHtrkVJdDWAOUKmkVO/b2/KxRQ+EMAOCBcbPiPSQv6sCTiqazxFjFmbTttpGJ5FrTZnClOCnyO5hAF6agAccftlkjXEZV8Hmt78a2BFN9mu34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8p1C9G4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8p1C9G4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773672888; x=1805208888;
  h=date:from:to:subject:message-id;
  bh=XVGp862IZFN752ZLPH2H3j+ogZwxHjDlribOPQHJ5w0=;
  b=n8p1C9G4JLWyQ25wKCCzfDfQ2sqvautplID3j7Q2/JHjc+Cux2xLWivR
   /QVSq+5keEqGc442YobLZKjDxrVFimWHZ9oJVlAWJONL9t6uCczspBcQ6
   lmQKeZi/d/VhA1UQ+TrU8srCgHapRjz0oeqFQyvkGN8kGfpy0S8kDLdNo
   0BXqGHGwBR4jeFCjY+cXlG0aH9k5h032PCE6x5/sIwZvIa4ZkYawYROmU
   mZjlhWRiWPecNWBBQqghvrLxoi+EVNOqp9JUIZlVOZH2e/kI1lpU3hffl
   hT1AG/OLcf1msq6XZeze7zlZHLlmR2iPfi/HnVKZEwIU3g2aM3OsiRV9l
   g==;
X-CSE-ConnectionGUID: VxGCkestRQi3GzIzmp5OBQ==
X-CSE-MsgGUID: 1VnpofetQcC3rpyxXohjuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62257618"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62257618"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:54:47 -0700
X-CSE-ConnectionGUID: rs5PbOsiQL2wFPRzzGNrsQ==
X-CSE-MsgGUID: 2Z6KDpk0TF6mpcaGE/dBcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221885974"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2026 07:54:46 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w29LA-000000004FN-0XsW
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Mar 2026 14:54:44 +0000
Date: Mon, 16 Mar 2026 15:54:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:locking/futex 4/8] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'both'
Message-ID: <202603161507.M8eOUotl-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   226e6782e81c88b9263e006a356f58dd8c15bef5
commit: e2c3ab5f1ceade109d683e16a92511c7f35156c6 [4/8] futex: Add support for unlocking robust futexes
:::::: branch date: 29 minutes ago
:::::: commit date: 29 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603161507.M8eOUotl-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'both'
#63: 
    2) The gaming emulators use both both 64-bit and compat 32-bit robust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
