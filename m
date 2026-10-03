Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF17421257
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028560; cv=none; b=jB7VAAYdspeYpohjvsztO9Pkqr8nejlMQXbvwueXe/zrE7gqJPaUPBcYSuSFOha2s/WicD7s7SizeeGDGOkyMu2uTgY8PFdOrkYLtrzXhTFmKKUVCz6zh07pPoDq2aR3lP6ZH6m2RslatKW6VxPj9fAhvf2lXZX/ixK8u5/QVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028560; c=relaxed/simple;
	bh=nm6YN4tO/RwXz9ssT0IoLeFPT/PpWiERPWxA1pZGPWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HggDCxc4D2lteGfmFfRMRZeBiIxf48lPoiJ0EB4TEQJd3aOM9JQrFxnqT+QzyTdNeJ1CwhS6faUl6y4bRpw7a8y41jSyguOO2/3nO4nJb/QDOIy/1h5BHZTfteEE/slOdla9YZHWzg4felJ2Gg5+XybL1qdKcp6X2FHk+0FUNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GogBRx0e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GogBRx0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791028558; x=1822564558;
  h=date:from:to:cc:subject:message-id;
  bh=nm6YN4tO/RwXz9ssT0IoLeFPT/PpWiERPWxA1pZGPWM=;
  b=GogBRx0eUwh9iXie9fw/+nhrT29OVVTekV87TpK7mxHE71RvvXdYGyfT
   7tw+NOAQXvQwjuU2OTsZ/rCH98jgjUaqEqRyht51zSf782xv++UxSJ4jf
   Pzy0fFFjEwHi7k56rn8XefZGZYietWHpIIsIGV7VSEo0vKfsqtZhACUe5
   qlLElAvOYY4jfK1dD7FSBd0gApMus29anFvwzpeOFwiU3JOtvmZlis8uc
   +Eg3KZxacbf1YhhOzsWcJPtxotdK3THLLnb9dT9hY8VsYH9E33d2OyKJd
   o7ZQaETTZEhahhiu+ftQufmNkbE0SITay0uBmBTdENa/RVmWFguau0fgB
   Q==;
X-CSE-ConnectionGUID: 7PYrvx9FT6285sWNzkf3Gw==
X-CSE-MsgGUID: 0UuXx1HXRA+g6phc47qchg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="113554043"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="113554043"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 04:55:58 -0700
X-CSE-ConnectionGUID: Kiu+LzxgQBiVjJ5q1tCAaQ==
X-CSE-MsgGUID: D5dy6uGVQjqf/Ybs185F5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275963547"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2026 04:55:56 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCyLJ-0000000012Z-23s6;
	Sat, 03 Oct 2026 11:55:53 +0000
Date: Sat, 03 Oct 2026 13:55:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/core/dev.o: warning: objtool:
 __netif_receive_skb_core.constprop.0+0x770: unreachable instruction
Message-ID: <202610031300.KVVwBiwb-lkp@intel.com>
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
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
commit: a9b460225e47a3d98296eba71c62ff0ad58a2032 net: always inline some skb helpers
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r2105-20261002 (https://download.01.org/0day-ci/archive/20261003/202610031300.KVVwBiwb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031300.KVVwBiwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9b460225e47 ("net: always inline some skb helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031300.KVVwBiwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.o: warning: objtool: __netif_receive_skb_core.constprop.0+0x770: unreachable instruction
   net/core/dev.o: warning: objtool: netdev_run_todo+0x1d4: unreachable instruction
   net/core/dev.o: warning: objtool: unregister_netdevice_many_notify+0x254: unreachable instruction
   net/core/dev.o: warning: objtool: register_netdevice+0x88: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
