Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1137F730
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 19:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206110; cv=none; b=cvt+2OyJwALWenGyHODOsiW4Qd3VXo8nex7FbmZf0MFHyRfX65oHIidc6nlYSR90iAsz8JL1BHYdQT+U2Vumq1GR4r4Y5rrMxbk+539MMTC1awjtc0/eEUUxUYUEJ1f4fkscfMhUIXRobfFqG/8/D0GQBSPNjWitYSHyk8g8omQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206110; c=relaxed/simple;
	bh=idtADD1L3QWNU9OxNAXHrkcsXJSBSD4rmCL7NBBRQ98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eQLIzm+sWx4/p/p7y999qKtHq2yZKiVxcChlzKD71YQ6AVVqDdzsKZwb44eGeFMWJ7JJ0MsEV/IpBHqDxPK5ttDGYLnK03mcQhi/3xYdXSPqq50Jijt5Qg3SXKA5EW1BVBOdyErKMAS/ptgLJp+ZpSDGINjKKLoNd9yo/zfZwtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/8oZduU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/8oZduU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788206109; x=1819742109;
  h=date:from:to:cc:subject:message-id;
  bh=idtADD1L3QWNU9OxNAXHrkcsXJSBSD4rmCL7NBBRQ98=;
  b=S/8oZduUDDNm+wT5tGHkPSaYk9jt1SHPaVAF818zfPRv5ipp3hioQmY5
   2le5A9wvNQUfKCJ0B5YFQUMfM5BDzmbJviXGnZJ0lgaXAFXFHlZfPI/JT
   fPiuh6t0KIcjpda9ZmyjCu7mibKCeeSJFTy7/8NTRvaf97ZWTsRpZvpD+
   PcXwn8JmQxHm1xkrpizMvl6AacAXFP2CJiO9OgA5OnjPHQhzGUITqiJJX
   Ty2zOxIKnHwu6opC4S/derK8+RUP+IyJqd4T2Rd9IcuyUALy+MckKlP/F
   khVIw3shmyKM8AjpdB/4hac6/b4Lyq8c9RcfY851E4UxamkmPa/fLXR0z
   g==;
X-CSE-ConnectionGUID: we0qZihARM2ubH3FdeD9jA==
X-CSE-MsgGUID: UZzyYO0mTT+JioH2Wk77mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88632410"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88632410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:55:09 -0700
X-CSE-ConnectionGUID: vkZxatlaS1O02v0wWTWPmg==
X-CSE-MsgGUID: DXnXitqzR0GIgoL+/g+9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="269468236"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Aug 2026 12:55:03 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x185t-000000000Zb-1DJV;
	Mon, 31 Aug 2026 19:55:01 +0000
Date: Mon, 31 Aug 2026 21:54:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1394/1691] ../wrappers.h:116:32: error:
 'O_DIRECTORY' undeclared
Message-ID: <202608312120.xS2opzRG-lkp@intel.com>
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
TO: Jori Koolstra <jkoolstra@xs4all.nl>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   89c07d98716a13454ec3fd9f97689e812cc71bd4
commit: f54e04941355e0c97b0ce825964afd2a89a54f6a [1394/1691] selftest: add tests for open*(O_CREAT|O_DIRECTORY)
:::::: branch date: 4 hours ago
:::::: commit date: 11 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260831/202608312120.xS2opzRG-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312120.xS2opzRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608312120.xS2opzRG-lkp@intel.com/

Note: the linux-next/master HEAD 89c07d98716a13454ec3fd9f97689e812cc71bd4 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from fscontext_ns_test.c:33:
   ../wrappers.h: In function 'openat_o_mkdir':
>> ../wrappers.h:116:32: error: 'O_DIRECTORY' undeclared (first use in this function)
     116 |                        flags | O_DIRECTORY | O_CREAT, mode);
         |                                ^~~~~~~~~~~
   ../wrappers.h:116:32: note: each undeclared identifier is reported only once for each function it appears in
>> ../wrappers.h:116:46: error: 'O_CREAT' undeclared (first use in this function)
     116 |                        flags | O_DIRECTORY | O_CREAT, mode);
         |                                              ^~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
