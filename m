Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DD3002A9
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 02:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786847670; cv=none; b=dnQMixxQd52w2LttCbpqhe3ymhN2lTlfaIMYK3lkqAOG/VUKBdoMDmW8FnEKV3ObMTbl1tCMzJebstYQEGnJvAHF4iq7NNTDW+Ea9+hilfq+UUSh04N9EsfROuY7gF4ycvBIYBC3iutQEsybsJc5xbtX+VhVVg0EkqH+zgUURE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786847670; c=relaxed/simple;
	bh=ijv0RpsZo8+raA+Ir0jZUCvuRKT1LPoqep4KdoCJ9u8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lbMDYI11pcddVrsz4ubeoApdlqp+hqwDoPgWzkT1Z7V4LcR2ZAc/WsZ9lit6dr5jJORS1+Bn6JgPu6waGCcXueV++J5wheJIgrqitATARV5Kqlov//7+DpnMQ2XzEMhCnMunP2Cq9v5n95TPytHbeT1wtvzMGdUmRt+yakbJXDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggDBmbcJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggDBmbcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786847669; x=1818383669;
  h=date:from:to:cc:subject:message-id;
  bh=ijv0RpsZo8+raA+Ir0jZUCvuRKT1LPoqep4KdoCJ9u8=;
  b=ggDBmbcJErhY2EGwxQ4CzeeBr1MJr5wjdhGHmPVxAHkZieeIuu0sL37/
   GZVQhh/CUm1E/se+RT9mfMYD/mnN1pQx2xEyTJfJPkXd2uVvgoendt8Of
   Fm77ttkIhL3zAXVwKi6Re9MAF/r592rR4fzCOcFheBX8GE7ODyPtpV4pe
   y1YcCX+KqfukM2pHqA/8ZczP1+X22MpQbzZ833J+sueNNIF5GeyOuq8lq
   588ekYtAhjl6llBAZP7ARlGkQaSB1qZie717t7DNSS+Smm2iUN4buM09Q
   VrWlf0w2BykAOW9DQdcbdzT3lG3UnSGMhH2vPhguhzROjbjyyYH6AafHJ
   w==;
X-CSE-ConnectionGUID: Sj94idL9S9mOAMIYMNvKag==
X-CSE-MsgGUID: ZFQlceNMR9K7ZZkek24EPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87390540"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87390540"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 19:34:28 -0700
X-CSE-ConnectionGUID: NF1xSyCFQlKEIJn9nhcyng==
X-CSE-MsgGUID: Pr3dItoQQ6yEamS59dRD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260801722"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2026 19:34:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvQhd-00000000ch4-0xX8;
	Sun, 16 Aug 2026 02:34:25 +0000
Date: Sun, 16 Aug 2026 10:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12873/15435] WARNING: modpost: vmlinux:
 unexpected non-allocatable section '.romvec'.
Message-ID: <202608161047.5d3NuaL7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: bbeb002cdd3772d1c0156ebd2ca828a2d61612ec [12873/15435] modpost: use mod_warn() and mod_error(), clean up logging
:::::: branch date: 34 hours ago
:::::: commit date: 8 days ago
config: m68k-randconfig-r112-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161047.5d3NuaL7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161047.5d3NuaL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161047.5d3NuaL7-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: unexpected non-allocatable section '.romvec'.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
