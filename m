Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFF23EAB2
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540786; cv=none; b=mMmqTnVwidf5IyzNaMwFnAkOx8oqbEayf7bQfX4ePETptdtHjUSMc10tMB7age9R5xHcEMSHrtIYKeU2ENB8yAkvefyXpZ9G2ldxTagQ5rrOqhg4s2oiWi5P0eYy3kDbu6T6V3XMShiFEQk9JNeIUnPduiinRPoScKM++Z3X198=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540786; c=relaxed/simple;
	bh=w9Qe0aod9qFewFQ866k5p7efZXKv7hWv4N/NDDjEY3Q=;
	h=Date:From:To:Subject:Message-ID; b=u4u5M/GF4sHkmIfJil6gYEYqcZ9yC8fXBXwJHkfMUA/+KJpMuEmFMZai7R39QaJFV7m9da5JE6jTM8rHEdM3E5UlBFakDmEVhFY9BvqRbtj2BtZPM5qMlBU1DFhTYYH15Y4sRhgagN9cPxnjrWKoolHx2JlVHn5qyWzEdcaKf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9zTkqbm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9zTkqbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771540786; x=1803076786;
  h=date:from:to:subject:message-id;
  bh=w9Qe0aod9qFewFQ866k5p7efZXKv7hWv4N/NDDjEY3Q=;
  b=K9zTkqbmFggJiYxilhLBRsk4Q8VEcCqK2daKbtVEJ3/KzV2NiCMgvymT
   CtQTSA8vOHWmmIR03bQQd3f8XatdAu1dZbnZj8HXVVbTdoamLL7K6KHhf
   5LwdtVnRSEz+bJZdIffZZqodARVDJdj2N3Z73bPQbzbv9ucmunWYM9V72
   XKZcACB328GKX3cP+1Qk5LivaDxZ3/0iBRchrv9NEl4ArZMsMoHV4unJ2
   a7UlJ928Rngtie3NYvPXBtohNOUpyGZaS9Kum2DCMFDBKWvd6UsBAlYDH
   TXgK7P7b2ZTUj19+fD9C9hu7mX4FXSHf2kcEKXIIfIxCjyohkmZV/94A1
   Q==;
X-CSE-ConnectionGUID: G5jqu2b7QAOv2bIUYXAD7Q==
X-CSE-MsgGUID: pf+JtnX0Qv6Avpp2H2+bHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90048151"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="90048151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 14:39:45 -0800
X-CSE-ConnectionGUID: Qztj2yejS7ius+Yb+AJfvA==
X-CSE-MsgGUID: 84AolaELRZyfUSTCI+v0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="245261050"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 14:39:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtCgP-0000000044d-3mfw
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 22:39:41 +0000
Date: Thu, 19 Feb 2026 23:39:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 40/42] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602192354.oXxhAy0H-lkp@intel.com>
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
commit: 24ea46a484fdd8d6ac6a90cfb927c1fa3d07d312 [40/42] hrtimer: Use linked timerqueue
:::::: branch date: 28 minutes ago
:::::: commit date: 28 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602192354.oXxhAy0H-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#11: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
