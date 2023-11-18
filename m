Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB85251
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7v6hoCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700277047; x=1731813047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2nUaJ5xev2rPVw/TA89eQzn8qB0fu5dUrkn2gaeA37s=;
  b=e7v6hoCtiZtof2+/h9Q6qtlsPJLfGfXdw2wicvcMVEnI/EJgsQuoeBE6
   WXlthUkxxD3fi5C43Tve8W4U1Dp/7MFo/Y0kr81hh6SfiiVag1aKRjsa3
   hqY+lUR1HUIZbPi8S4OMA3COMcjrsRetoSDzfreAbUe61xUbwwL5fWbjA
   kX47mfbCM2vQmq1QY6LTrtllLKNNKpjvZ1EelW4dU8Wk3Kc6lUhld6uwn
   XW3+DUoxzydHooesF/VXcdA4Mnc01IypkKYe9gct//Tth38PBFXM+eRn/
   p2h2K/vKjGLz6eMELrifTkFG2aOOMcCW/onZp+aw5kjhDduMHuqqcirKc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390264074"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="390264074"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 19:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909589778"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="909589778"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2023 19:10:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4BjG-0003T5-26;
	Sat, 18 Nov 2023 03:10:43 +0000
Date: Sat, 18 Nov 2023 11:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 532/1905] diff -u
 tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
Message-ID: <202311181046.9vop2HVN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eff99d8edbed7918317331ebd1e365d8e955d65e
commit: 76db7aab1fca6688ddf9f388157521c442e0ffb8 [532/1905] tools headers UAPI: Sync include/uapi/linux/perf_event.h header with the kernel
:::::: branch date: 26 hours ago
:::::: commit date: 11 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181046.9vop2HVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311181046.9vop2HVN-lkp@intel.com/

Note: the linux-next/master HEAD eff99d8edbed7918317331ebd1e365d8e955d65e builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

     diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
     diff -u tools/include/uapi/linux/mount.h include/uapi/linux/mount.h
>>   diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
     diff -u tools/arch/x86/include/asm/disabled-features.h arch/x86/include/asm/disabled-features.h
     diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
     diff -u tools/arch/x86/include/uapi/asm/prctl.h arch/x86/include/uapi/asm/prctl.h
     diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
     diff -u tools/arch/s390/include/uapi/asm/kvm.h arch/s390/include/uapi/asm/kvm.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
