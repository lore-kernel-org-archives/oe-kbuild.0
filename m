Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2043DEA5
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451616; cv=none; b=Lp/t+3QbqAzzvFm9kG1RlZN4tGStEvmbO5Eye+HOYC4OcvmdmAiMByRO0S3WU51f1ipzkn7HGdDNQiAj4jfvnyQIC5z4OPk+KvMNI9T9YXGbACoAy6/EzPR1IAnQ+5jACYqwggyzNX05ZKddy3+pf7CzjlQY2tzuukVaG3G0Gaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451616; c=relaxed/simple;
	bh=KNtqp+9GOczZYCYg3opCP+Ik4WENgnpmSjYQaxxAqGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NsdSx9NdRUOEOPzlQxI9fjKwgMO3AVWOoFS3r7BV4NTUzL1HxqsIQOrF66a6GbOn+KVdx1SI2FbgyrMGEWIZqZxHOdMoMvxuwrAGZjct5pLiki2wcQMOvb5XFQqwRzH+fdfzG0h0RYFLnoHT1ZGPtp48TU7T5Hb0krDRJdNoK3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVEhuUgT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVEhuUgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789451614; x=1820987614;
  h=date:from:to:cc:subject:message-id;
  bh=KNtqp+9GOczZYCYg3opCP+Ik4WENgnpmSjYQaxxAqGg=;
  b=iVEhuUgTDmnSu4lDj5eaelOeMy3dmEry9dTqNeC3bHiGSR48dxDthZg8
   B5ciSWKq/YxOTywKbN48RX4lS8QzuYY2pGKOuogfR+uHnnx42ni60HuUP
   Pujtc44Ux0cpV7X3DfooE/KUe5px7BmSeJyPYHDXGomiveM43REaTdhR5
   +vuNDgi/dV1k43/y6+SKZM/eQVmLNpucvirmLT/BA2kx7ns0OwRXqMm3o
   8A3K/Dcwa9BhuviBtQOPNWiNcQVdp18pfID8Gb7FZnPI66j5feKBh91Ed
   UpSjgT0+bcQLl33tYZKpSrfcZCTFW/UFd5JswVNXz3yit7MuswGjoH4+A
   Q==;
X-CSE-ConnectionGUID: NhBYcsAsQT+39C6xvtBNGw==
X-CSE-MsgGUID: SpgkbdLJTMye70Tz5tfoOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92315590"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92315590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:53:33 -0700
X-CSE-ConnectionGUID: RHGo8GsgR6CGdEqay+EFvQ==
X-CSE-MsgGUID: /fif3J/JRkKhpQm/q4M5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278132002"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2026 22:53:31 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6M6i-000000000WI-3Fbz;
	Tue, 15 Sep 2026 05:53:28 +0000
Date: Tue, 15 Sep 2026 07:53:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 64/67] cram_perf_tool.c:301:22: error: implicit declaration of function
 'cram_demoted'
Message-ID: <202609150704.QvEr2yMO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: d4e896495e7d06e84215944451022685a471db99 [64/67] selftests/dax: add the CRAM anon tier tests
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260915/202609150704.QvEr2yMO-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150704.QvEr2yMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150704.QvEr2yMO-lkp@intel.com/

Note: the gourryinverse/scratch/gourry/managed_nodes/rfc6-complete HEAD 0423df59f3f085592c3ff59834eeae067ee75158 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   cram_perf_tool.c: In function 'arm_batch':
>> cram_perf_tool.c:301:22: error: implicit declaration of function 'cram_demoted' [-Wimplicit-function-declaration]
     301 |                 d0 = cram_demoted();
         |                      ^~~~~~~~~~~~
>> cram_perf_tool.c:302:13: error: implicit declaration of function 'cram_demote' [-Wimplicit-function-declaration]
     302 |         if (cram_demote(p, len))
         |             ^~~~~~~~~~~
   cram_perf_tool.c:293:22: warning: variable 'd1' set but not used [-Wunused-but-set-variable]
     293 |         long d0 = 0, d1 = 0;
         |                      ^~
   cram_perf_tool.c:293:14: warning: variable 'd0' set but not used [-Wunused-but-set-variable]
     293 |         long d0 = 0, d1 = 0;
         |              ^~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
