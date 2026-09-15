Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1023A05C2
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458900; cv=none; b=rIwRGW8j4W4kwcI8rJ6MpmFzA/ddot0hY7XCAdW2ou8d6rKKtnwbLmaAMJ/r4qIv5lVw4bz8nAsj7vWugonYaP17UWLbt0UuOJxd2/mjd/QaAFlt1FEuD/ZA4slxjJeJZfzo8cbux/pa+nWCCYYOc/iMvyRkgCIjF3/TT56uDig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458900; c=relaxed/simple;
	bh=UZ6BTDi9zVoZAlhFLLgPItn5EuYvPJjWhoigTcIxDtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cRWOl8BYysJ8JJsqao5khcoyNj94/vxoj5s6qeKFKRzq0QjfhFVvOkhqr0+THo8roFqimFvHxAV6aKguN0dU5TVevS+kSp/pr3GAXx/rB6sI4iXzAiClris8h26hguGpNwYtZtlbKj0CiH6mDiMSi3fTpEhHN3ZQiUkZTw/389Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEN9j6ll; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEN9j6ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789458898; x=1820994898;
  h=date:from:to:cc:subject:message-id;
  bh=UZ6BTDi9zVoZAlhFLLgPItn5EuYvPJjWhoigTcIxDtQ=;
  b=cEN9j6ll/5rodP64H98uZLAiMMOfh7UAWjH1OdcxsS86sN8UEA54w8TU
   JyNVr9JgMlChuIQ4pq3ZbnIXDE7Y48M9OCGikQcB4IEcjsYU28pAHS0jf
   5uTEEGiOTfXQ5OqkJ/fldw/ieFU6RVx0b/bt4qejek5IZP44Y4cYHJKkS
   yopp01DYyJchkz1u918pUy4NU2KEEWDclkM1CugCHzTmNvgH2IrS/SaRb
   OHff59jjL5gsn8hyLYYjgr4MFIZTa2z/2IkQKA8eBQgSNYVcwcqBDUATM
   u3qGpBe1siy7GbORz6DUcdzg/dropN/gn0C/zxmu/eWfoD/pF4MN8LTLh
   g==;
X-CSE-ConnectionGUID: WXTqPc5OTcGUh4IymvyZnQ==
X-CSE-MsgGUID: bH24Cz76RhmAcMOB8PP4bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112582048"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112582048"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:54:51 -0700
X-CSE-ConnectionGUID: 1gxSRjM1SSySdgN8kWD2Gg==
X-CSE-MsgGUID: medOMkg8SR6bJYFPb5CdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270256137"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2026 00:54:50 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6O08-000000000XX-0me8;
	Tue, 15 Sep 2026 07:54:48 +0000
Date: Tue, 15 Sep 2026 09:54:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/buddy.o: warning: objtool:
 gpu_buddy_alloc_blocks+0x254: unreachable instruction
Message-ID: <202609150942.Qryq8Wr7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: Maarten Lankhorst <dev@lankhorst.se>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>
CC: Krzysztof Karas <krzysztof.karas@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: 8fe3fc37564920ae315d2b8780025f280859a530 gpu: Fix dependencies in CONFIG_GPU_BUDDY_KUNIT_TEST
date:   7 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r063-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150942.Qryq8Wr7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150942.Qryq8Wr7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8fe3fc375649 ("gpu: Fix dependencies in CONFIG_GPU_BUDDY_KUNIT_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150942.Qryq8Wr7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/buddy.o: warning: objtool: gpu_buddy_alloc_blocks+0x254: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
