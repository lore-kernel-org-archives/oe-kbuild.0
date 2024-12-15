Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34875335C7
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734260551; cv=none; b=YW7SD738ceYtFIbXL7SsLsZBDsy7dcYP0xZeSu0LvzWhXtwJUJ27w/ylIvevGSnXFzrzltmh0GPIUQgjg2zfPS78jaerZdNx6EBp8B3ogECasp90x0Zg8YEpKnsG0OXZJcc4KuGbFGMjXmEzbaKfdUljRNjtvra+NIV81g2gS7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734260551; c=relaxed/simple;
	bh=Uu5u5O2PABsNPp6mZqOmINKthJcKdJ0xMfktoEODpkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XkdzsyWc/TJZ3D+Ema5asWqfelWcaZ2Ae4VXBarioFtnSnbvXLIkCkZKbuerS4rCeTrmIUyVqjkvHY6/sd/icyoP7u+KR4evQTgDI/syQspBnFffaIdcG034RHbna4q7/DA1nZgaaiwbKE+LCA6W08nW2Z+h3omsa1hBm9RQdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUbpCiJh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUbpCiJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734260550; x=1765796550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uu5u5O2PABsNPp6mZqOmINKthJcKdJ0xMfktoEODpkI=;
  b=lUbpCiJhvwm1pGlQxaf6/r+mXf6uFKYq8f6Yzg8Y2uawl/ceoV3SSrpo
   Bs4PeUNFNyYG70lxA6sOHDsFCupF0OdX91R1tnfVNix9d15YmaDLhGuU9
   X6qN6NtuYTIdvGJBeVGtTeZDV9i/Y2qkQCZBPFr1LqI5KuNnBoLAlHkpf
   qq+MgXvhIjW1kyVIu3uKM/5S/BX4Pdb0qfo46KjoUQNGJi9BfVIDzvesb
   SdfOogNnvn7tbISc1ZLXI+f46fDOAakTB0R7EMluMhZm/4hUk+3EeJOtU
   AHwCwTAfn7/sZAXZuuLZHtbYmAYwtAHsn38eS25KFmT6ITatbaXKUdbtb
   Q==;
X-CSE-ConnectionGUID: +BKv64BlQP2pV1xuvj7dWQ==
X-CSE-MsgGUID: dvLXZNBeS2i0Yqy9FyrJXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34386774"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34386774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 03:02:30 -0800
X-CSE-ConnectionGUID: 43NMDklOQeCZESd88lWN1g==
X-CSE-MsgGUID: 1TTUKM9xRlq1jAIwRwzpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101917485"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Dec 2024 03:02:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMmOI-000DZl-2H;
	Sun, 15 Dec 2024 11:02:26 +0000
Date: Sun, 15 Dec 2024 19:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/vsprintf.c:1652:9: warning: function 'va_format' might be a
 candidate for 'gnu_printf' format attribute
Message-ID: <202412151845.2F7FFs1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
commit: f566e1fbadb686e28f1c307e356114b2865ef588 kbuild: make multiple directory targets work
date:   4 years, 10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 years, 10 months ago
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20241215/202412151845.2F7FFs1J-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151845.2F7FFs1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412151845.2F7FFs1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/vsprintf.c: In function 'va_format':
>> lib/vsprintf.c:1652:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1652 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~


vim +1652 lib/vsprintf.c

71dca95d5cf5ece Andy Shevchenko 2014-10-13  1642  
3e5903eb9cff707 Petr Mladek     2019-04-17  1643  static char *va_format(char *buf, char *end, struct va_format *va_fmt,
3e5903eb9cff707 Petr Mladek     2019-04-17  1644  		       struct printf_spec spec, const char *fmt)
45c3e93d751ea50 Petr Mladek     2019-04-17  1645  {
45c3e93d751ea50 Petr Mladek     2019-04-17  1646  	va_list va;
45c3e93d751ea50 Petr Mladek     2019-04-17  1647  
3e5903eb9cff707 Petr Mladek     2019-04-17  1648  	if (check_pointer(&buf, end, va_fmt, spec))
3e5903eb9cff707 Petr Mladek     2019-04-17  1649  		return buf;
3e5903eb9cff707 Petr Mladek     2019-04-17  1650  
45c3e93d751ea50 Petr Mladek     2019-04-17  1651  	va_copy(va, *va_fmt->va);
45c3e93d751ea50 Petr Mladek     2019-04-17 @1652  	buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
45c3e93d751ea50 Petr Mladek     2019-04-17  1653  	va_end(va);
45c3e93d751ea50 Petr Mladek     2019-04-17  1654  
45c3e93d751ea50 Petr Mladek     2019-04-17  1655  	return buf;
45c3e93d751ea50 Petr Mladek     2019-04-17  1656  }
45c3e93d751ea50 Petr Mladek     2019-04-17  1657  

:::::: The code at line 1652 was first introduced by commit
:::::: 45c3e93d751ea50861c796da3cbfc848fa6ddf55 vsprintf: Factor out %pV handler as va_format()

:::::: TO: Petr Mladek <pmladek@suse.com>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
