Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B082D8767
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766402; cv=none; b=R9/uKHHnwoYNnGnZTR++odJd2qXBKL65bIAC52AxxzDTvJM2Ya4hDL1VkPWcP8IFCUTT/uVynWPABRD4nFEr3JYtSZr9U1IMl5VSn9Tt8LQJ6/nGwx2JMXD9VeXbc9/rJrUJ1YcOWMXB6skm67u2sRxSPgJXicqnUhtOwe7ZZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766402; c=relaxed/simple;
	bh=k4gHiEk9N2mw70B3ep5Gol2qxtBf9t8mUteK+1MSbX4=;
	h=Date:From:To:Subject:Message-ID; b=Un+zEQ6aOPQsrdZclos3Orctc4gI7KSINLW5Lm57gProzbUtbR6YWvSSZC6tNnusHjvz8GpH6ehi8JiE+83gug3y/nAGo03gN9sU/+zadZu9aODzkc7DEXl49i2OxeE/kZLtvWI0y+z3vHJ9VAeg9SyGQ/UqzJ0P5OK5OQDBXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXQELdhQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXQELdhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770766401; x=1802302401;
  h=date:from:to:subject:message-id;
  bh=k4gHiEk9N2mw70B3ep5Gol2qxtBf9t8mUteK+1MSbX4=;
  b=kXQELdhQiI8NOrzxR5eptoboGmVZg2qk4+hyvYSOzl6E8cjRuqiFfeZX
   9ts+03/RNhOzQSDiEvrpTJID2+wm0Q4LwGxhkuFisdwkMPJelGnm/5/4P
   /kzO+OcT/kW2Z0q5nKcrbj845fx9eHUq6OUAZmN1NvAX/CPXsBGbKQ2Xa
   5D9avSEAGgjzLPiclFJ65fZNy+vDkIWqAplrU7goWGu6JgibgGR+4NqhY
   H5qk4hxmSeypNpdLCad1K8V/rSVVhSxWIog2m1QW7GbYkNw9LcQjXZdKH
   qvNjyotSe0olUCrpEunxXl8bicSEMGItw4fvADRt0kXLq//CJRcEY8dpq
   w==;
X-CSE-ConnectionGUID: RZ/J86YBQhWVgLBCdH7PRQ==
X-CSE-MsgGUID: Xz4D5qzZQIWFp2FV1dBEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71802521"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71802521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:33:21 -0800
X-CSE-ConnectionGUID: Qf3qga1YSUy/rdp2Bqi/Tw==
X-CSE-MsgGUID: XHTlQXTRTOydO5OT95dFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216232111"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2026 15:33:21 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpxEM-000000000xJ-0vSF
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 23:33:18 +0000
Date: Wed, 11 Feb 2026 00:33:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 3/20] checkpatch:
 WARNING:BAD_SIGN_OFF: Use a single space after Co-developed-by:
Message-ID: <202602110052.ECCZnlGs-lkp@intel.com>
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
TO: George Guo <guodongtai@kylinos.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   92860256402cce9fa6268763365f5333a56c1428
commit: f0e4b1b6e295299f5c9c79ad546dedbdf7132f45 [3/20] LoongArch: Add 128-bit atomic cmpxchg support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260211/202602110052.ECCZnlGs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Use a single space after Co-developed-by:
#22: 
Co-developed-by:: Xi Ruoyao <xry111@xry111.site>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
