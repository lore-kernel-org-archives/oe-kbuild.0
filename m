Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128384C8FF7
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658538; cv=none; b=fVsF7YbEr92CZZ5iucAlrGmQXfMCU9ty4p6f3P8vz5tQNWaOHYneEcC/xa8mbN7jf+af+9MAEnJESadQ4NnXmv1Gn/y12vCr3b56Zt/BFHmRlMnAU3OUcKcFnnm4naOiOd7g3ho8D6GnLrHPuEUWdCUXE2J46GIcYIYhivcxah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658538; c=relaxed/simple;
	bh=Vx2KhmM2ooHbaVmhMDxjvgQV8ZkqbsCl8KRJoLkq9b4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJ5HGP1aGT+7B7+gP2/Px3W/R1TVCMgREz2bh7hE+fNemJhIdbahU1OwNblgpt7+J7NAe0+udR5OPf9u+XCJBsHddFrIjd28qtVlRnQweY1AgfRiUTiWLNIahsbYWF4gWEuZDbasrWdXXgizPHHoIr3n3XpH4yAwZ+6i7itllJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpQ5AYHv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpQ5AYHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780658536; x=1812194536;
  h=date:from:to:cc:subject:message-id;
  bh=Vx2KhmM2ooHbaVmhMDxjvgQV8ZkqbsCl8KRJoLkq9b4=;
  b=MpQ5AYHvmiyEOHauYhE2MoK06ayDnVDg/BzHMzGSRSnvCgDrlIcoRsxh
   0/eMGWTP0C7SYjZ9wiBzC9+DYywzkXKoZUn+/XHpuIIAfrp9BRXEfLsNm
   oty9Lg2VMpD9AyIjUPv8tafdOJ1Vz716b03BxoHe3hHTcbpF0cMimdD7Q
   U2prdAlGgw9uv1BS4UuoDN2oF8gjPHuS+0KCmWPLctb6cbyWFDvVkU4Xs
   THEXGWdlIIqe2IO0EILycsI56hNTQXgsMNxExgryDuTfJmxnOQxpostw2
   HqdAx0UlTNijR4fESZRbuJawu7//y53mPZRaxnkroNzE0LQGS57jvQAUZ
   g==;
X-CSE-ConnectionGUID: TKyI+SVdSkKSbjn8jyL/pQ==
X-CSE-MsgGUID: YKlMPJc5S26FFZQzF+iLxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81614086"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81614086"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 04:22:15 -0700
X-CSE-ConnectionGUID: PyrQKD67Ta2DRilFOmvwZQ==
X-CSE-MsgGUID: SMH2//3PTuyZF4rQjjM38A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2026 04:22:14 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVScu-000000002Yf-2DNo;
	Fri, 05 Jun 2026 11:22:12 +0000
Date: Fri, 05 Jun 2026 13:21:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8] futex_wait.c:170:9:
 warning: 'shared_data' may be used uninitialized
Message-ID: <202606051332.M8rxYFr6-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Edward,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d7c970e477a170f747392effd61753561f1e7251
commit: 503d529cb0405cb434c6ce5cd9f5a911c454105e [8/8] ANDROID: futex: Skip when futex_waitv/shmget not implemented
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260605/202606051332.M8rxYFr6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051332.M8rxYFr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606051332.M8rxYFr6-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   futex_wait.c: In function 'main':
>> futex_wait.c:170:9: warning: 'shared_data' may be used uninitialized [-Wmaybe-uninitialized]
     170 |         shmdt(shared_data);
         |         ^~~~~~~~~~~~~~~~~~
   futex_wait.c:51:35: note: 'shared_data' was declared here
      51 |         u_int32_t f_private = 0, *shared_data;
         |                                   ^~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
