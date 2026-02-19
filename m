Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A232C945
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540787; cv=none; b=Uuxr1/VEbjodTRQptU57gtaG9GIfEPeOj7SEHVcqktBm32KRszs3/FV/B57W/qDTkbGspoYU6a64PgxxDO8LQZAZtDtkjVIYEpOaZ8qNoTCojlZaOOhgDiQpbUO4IXwvjK4OWcHTGBOAJ6v4Hr8IUpy3yMkK8bd0p+ymUMqDNLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540787; c=relaxed/simple;
	bh=X6V7c+9ZyKByia1L/d6yxzsa5P9qRYux+aEjhg9Xdvc=;
	h=Date:From:To:Subject:Message-ID; b=mPLI4GVKBzGnqlqZ2BTJoKLOcHTeToQ4PzoCfi8NleTFZtyqWzEKkQvGvGeYD4mourxh8fOXnDTQ4n93RE6peLOJczxj3AvqbOsIzsdy8U9FnBzP5X4xk5YB8p8Hd91ESB/aCKlAYNXKQC80GzyxoiiGaJn126e8L1Q/7i3vYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brg4+1Yj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brg4+1Yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771540787; x=1803076787;
  h=date:from:to:subject:message-id;
  bh=X6V7c+9ZyKByia1L/d6yxzsa5P9qRYux+aEjhg9Xdvc=;
  b=brg4+1YjDsvWxQ3aZiJ028oS7eRlJMJ9gQnUbIFcHJ4SgJuvZbqu6ikH
   f95VmQbbh703t/KJwMaWf/rc58Ux5BPsLyyVTXy4JQuUZpRodEplq883Q
   ugJ8Wz0UTGaByvp3wmEe6O9yOXydcE31EjazwoHYzoJtzkGarUAKX0mwS
   ZhucBklD78nmfv0bORrclXM3X3ow5tt7xAmgsE0kUwQuTQGSLuYsc2XV2
   Bm2iyC8edFXXfPFtz159CyW/2drsY3l7Yy/sSdcJjOyMlQEsUcWxEmbpa
   L88eNeGwTBuI9xUsH4ZJpfzl0Ui2kWQQRpWWIMd8Tg8Kp9APfklumG5nX
   A==;
X-CSE-ConnectionGUID: 5bE/MU2uTvekTreqrQfZww==
X-CSE-MsgGUID: +hCydTkLR96LhoR7vqNW3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90048152"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="90048152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 14:39:45 -0800
X-CSE-ConnectionGUID: 4g0Fb+DbQ5+JgFiJ6+jHBg==
X-CSE-MsgGUID: TMaH5SWDT4ugJ+w70kz6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="245261051"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 14:39:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtCgP-0000000044g-3wxe
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 22:39:41 +0000
Date: Thu, 19 Feb 2026 23:39:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 41/42] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602192302.PlLQNCob-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 59e5e1a3d7398874671508e65408cd3737c12fad [41/42] hrtimer: Try to modify timers in place
:::::: branch date: 28 minutes ago
:::::: commit date: 28 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602192302.PlLQNCob-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#21: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
