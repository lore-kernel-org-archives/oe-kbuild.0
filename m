Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09532C939
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540787; cv=none; b=AEIeJAVdjSr6JJZFVRaJzOJFLij/CqpBWiV2J1/QpDhBNftgEZT+1K3sgxPi/HwUcUrXr7LwBr00SCGEiCheBPzCexX292+PTfmI1a/2d0R3MHvRErhtHg+OvTnbZpHuIPTqlyRvi31bj8Iyq343eJAsPBAY+YikHw6rcXRQJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540787; c=relaxed/simple;
	bh=10ah3vBnxKz9I5y8CEpsgxHr808zGwe5jXsHARam2yQ=;
	h=Date:From:To:Subject:Message-ID; b=AvM3HpIB9xnvPRXsMhhgqRY4C9KczwynUgni5rZyxuup4rypqfM5+23nZkj2YmQph1i6OaEGrB8uhzysjNgFe3B0QL8RdXFf4ZDz54XDCyQ6STv/DWmmFkk9oAUQdVjSwokc25I40uv5zVInNn8oV54TYzuZm02YeWffo6yHmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAo5BvpI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAo5BvpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771540787; x=1803076787;
  h=date:from:to:subject:message-id;
  bh=10ah3vBnxKz9I5y8CEpsgxHr808zGwe5jXsHARam2yQ=;
  b=GAo5BvpIT9EOwCZJ1msSPjSqQm346MWLm70K7XsPWu1G3qP1YwEj02gK
   y6i+dROvlsqOobBXGHF6xOQqGbZ3clJNqKg58QhPBg7vKK/4E6aYfmLzY
   On3Xe+x9TI730NbdeBNi70WzJCGbeJOVrlflPTUzv8/Olv8wNUk1Vyymu
   wl/kSm0k6s8ompUZwPdaOdztTuvFk8hsjE0nVcES8Fj86YL5h8TsgY8/b
   0Kw0+KOLu5BTqsUVma2C9cgGvjxo+ZrM4cXT2NZFlOzdt4Ig/tG0/bpCJ
   U01XwZS2hcpa7PARX7YHKLRMNCQgApOaNKunYhgYeCLEiK68NKSWGURhH
   g==;
X-CSE-ConnectionGUID: kFNj0LcJT6qUz7Wq4adu5A==
X-CSE-MsgGUID: mpp2ZQ8sT6S+JF2pKEK1wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90048150"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="90048150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 14:39:45 -0800
X-CSE-ConnectionGUID: 0hJsl73MQm+n4Fo5tYxLqQ==
X-CSE-MsgGUID: 34E0tJZzRTOwnRNvvboRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="245261049"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 14:39:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtCgP-0000000044b-3cY3
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 22:39:41 +0000
Date: Thu, 19 Feb 2026 23:38:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 39/42] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602192344.2AAqx9RU-lkp@intel.com>
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
commit: a82944eb72b56921922f8074d3ceacc55d8f333c [39/42] timerqueue: Provide linked timerqueue
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602192344.2AAqx9RU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#15: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
