Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3C26F2B0
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 01:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783733417; cv=none; b=dSpEp0QZgR4gxruGLJf5HDp4qtluYxz55gZsk9j7w30Nppi+YgU0qhymqdL78ZuXorwJX50Y5ikn/arkjjR6Q1kWlSFvTErLzV9VYYg9/7AnTwdcSyL7FgAMAwvWD1CQSDcyKpP4Q+F2qBoPuVCsW3Pgkmij0uGpMQaj86guwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783733417; c=relaxed/simple;
	bh=BGWdV/F/DVjGXUEoBeWWSTm7YwWglwbXCO1e0vJF2U8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NtDsHTuV6ROmfVrm8YZSgrRl6h+MOZC1UXAcMGZ9rSg9/kKEovhl+UDQUy9d1mLi1lrWFfN5IZvzgZW0d3tmgFWK9XzKHrXn1NcROuw0/SJpihLt2oYxWMjkACD8G/rC0BBRy1HxXM3gPzqdhcPT+cNeqx0COVM5SnbcvrCixm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eI0JPd6p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eI0JPd6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783733407; x=1815269407;
  h=date:from:to:cc:subject:message-id;
  bh=BGWdV/F/DVjGXUEoBeWWSTm7YwWglwbXCO1e0vJF2U8=;
  b=eI0JPd6pm2zLUj4MZyzRPUxaU5unPdRZhzCc+36OxEJU7qITOYZdsqlz
   SRi8/dw5YJelYOUXkbzbLYBYZh6T2tNoO2SbrjvjQbyFBj8UFicyBuRRp
   QBPjP146sorGlkd7SmFb+TEDy6i9NEq4GrfB2gOZmUYFLSTbrBdBSUV55
   8aitK53sNc1tegz1+cumb8wj6ptRJbfn8p9E8VLbUFHiEBjKpfMsBURrG
   ybwtWlPNRrvTzw1x8nYG/zg4jfKOPl0792NE4SK3BPQvji8H64Ag3xwNH
   ADo1v8LxbO6v2s7wKABKIDrN0/YCWdv0ewyT2O48/CJgNX+9Gio6AICYm
   w==;
X-CSE-ConnectionGUID: 6TQFTlrsQiyDEOto6udYxw==
X-CSE-MsgGUID: f4KA1pS/TYq1ZqHlNNBBSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84311177"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84311177"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:30:04 -0700
X-CSE-ConnectionGUID: Q1gnVYL4SYCxeIYiQcHxfw==
X-CSE-MsgGUID: 5uOnEpmdToeJg5DGBZdtpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258613405"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2026 18:30:03 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMXY-000000003Gr-3xxS;
	Sat, 11 Jul 2026 01:30:00 +0000
Date: Sat, 11 Jul 2026 03:29:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: srv6_mobile_send.c:60:18: warning: 'plen' may be used
 uninitialized
Message-ID: <202607110359.ePqo7PmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yuya Kusakabe <yuya.kusakabe@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yuya-Kusakabe/seg6-add-support-for-the-SRv6-End-MAP-behavior/20260710-171238
head:   15a633eda320fd75c637aca18deb3620faa75214
commit: 15a633eda320fd75c637aca18deb3620faa75214 selftests: seg6: add selftest for End.MAP behavior
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260711/202607110359.ePqo7PmV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110359.ePqo7PmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607110359.ePqo7PmV-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   srv6_mobile_send.c: In function 'main':
>> srv6_mobile_send.c:60:18: warning: 'plen' may be used uninitialized [-Wmaybe-uninitialized]
      60 |         uint32_t plen = htonl(len);
         |                  ^~~~
>> srv6_mobile_send.c:59:18: warning: 'nexthdr' may be used uninitialized [-Wmaybe-uninitialized]
      59 |         uint32_t nexthdr = htonl(IPPROTO_ICMPV6);
         |                  ^~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
