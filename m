Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65A21D00A
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768051618; cv=none; b=hTpgAi+ZlKQbPZaZTdxAs2H0AWV/i49eKQeB44jehGRsYb2MVmxeMwF9ACB/GtjgPckIxv8AGosSyZxli7RotJ38uMmZMDHf+Qzp0qEMohwF+tPshSKSUMPCEcUQ3Q6qC6AxxBRbMODN376mr00LmnBp6o8bgVIqGk4HVWUOKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768051618; c=relaxed/simple;
	bh=iVOAfuZi/38cNAnA65nH1KyzD8ldHYXy8m/LxqiKZjo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CpnyhHBWF0wGGBTvtjdceJvfTP8VO9/YajHHM4BJ94CrzsuS7KRYejd58B3DBusPZ7APztMhvDjAoEkIP4Ye5cjo4OPjVCT8mMKcpN1bFfepYwIt22K6ArmuJrW/wK/V9E1+ScNTrDOKD8GXpAGCBdflUXURoiK/I9qKW692wGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGypHEAY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGypHEAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768051618; x=1799587618;
  h=date:from:to:cc:subject:message-id;
  bh=iVOAfuZi/38cNAnA65nH1KyzD8ldHYXy8m/LxqiKZjo=;
  b=ZGypHEAYpz9GcxokWOOvHazjnBAKMwNlAiKjHIUL7X5QgpiplEPK9lxQ
   8DQPAvYDBFKI/Irbw7Rhdky7wEooKDkVRp3s1t++Kladgv3LMvtnN+BQF
   krGJI8EtyqaZHHK+3d5xwqqEOwn+heKyX7Xx8GA+7UlX+pk1n5P4FCnWt
   q+qYXhq74TmS6eHxlCGBoUz9dpsSRX6keF72X89s5Yi69UrJyhhqW2Elr
   qozh7MzUPK+Rz1z1weYoC9/+EVRe6QjHXkXGGCwxHwIt/75MU8md8O6Xp
   s8umRWojBJcAFMHtJh09dv+hfrR6LWb6xI0DQjygXD3FevKoUsfs77JY6
   Q==;
X-CSE-ConnectionGUID: kE9ChVhSTiGm2N5d3izRbA==
X-CSE-MsgGUID: 9Pzlnrx7RHWRDHm+4hbnEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69454229"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69454229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 05:26:57 -0800
X-CSE-ConnectionGUID: mddHtwPrQMu5AVwHslrwFA==
X-CSE-MsgGUID: 7MnBOQuTShKaYaEe5ltpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208528853"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2026 05:26:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veYzV-000000008g0-2Tap;
	Sat, 10 Jan 2026 13:26:53 +0000
Date: Sat, 10 Jan 2026 21:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3258/5095]
 sound/soc/codecs/rt5575.c:350:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601102146.i62KKMgq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/codecs/rt5575.c:350:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Oder Chiou <oder_chiou@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: 420739112e95c9bb286b4e87875706925970abd3 [3258/5095] ASoC: rt5575: Add the codec driver for the ALC5575
:::::: branch date: 33 hours ago
:::::: commit date: 5 days ago
config: csky-randconfig-r122-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102146.i62KKMgq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102146.i62KKMgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601102146.i62KKMgq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rt5575.c:350:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/rt5575.c:350:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   sound/soc/codecs/rt5575.c:351:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/rt5575.c:351:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   sound/soc/codecs/rt5575.c:352:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/rt5575.c:352:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +350 sound/soc/codecs/rt5575.c

420739112e95c9 Oder Chiou 2025-12-31  349  
420739112e95c9 Oder Chiou 2025-12-31 @350  MODULE_DESCRIPTION("ASoC ALC5575 driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
