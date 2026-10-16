Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF24BEE52
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156329; cv=none; b=oal2k8zF5Q+OLTkIWEHMdb33MwRKsF3KCNkHHSnc/JA43ZMlpH6/aObwjVVCDTWeS7xkOzFyMrV3EgamefdG2pS1/4TMz5oEF/O834a+nJlK3QfsBEyw5FWAgQlaXJZTl8mMA12177YqrybUOnzyDD8JLdSgIJHZQG3qkcm+cAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156329; c=relaxed/simple;
	bh=0+ro486yeaO3bt2Ko9kqujgBLXTqn/Vj7abg57PC4PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pdaMOdDUjwPfqq+pjoSVLpbeTliN90OHQr9VFk8wkVuQu2IM5EyXGqH27Ec3XiXe3nLv8WMFM59SDxmvuJX6iwp/oIyvfGR50hS1QryMIfoBU0+eXn9eru9gOoWfYSupuDMsiSnnsqabIq57T0H0Uj94CIvEwtjppsGGWX7QRNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE5ctjT+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE5ctjT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792156325; x=1823692325;
  h=date:from:to:cc:subject:message-id;
  bh=0+ro486yeaO3bt2Ko9kqujgBLXTqn/Vj7abg57PC4PE=;
  b=LE5ctjT+pqqF74nPh3QnVVYnxhEONHfMrYiu6v7uJio9HRKe9OTR5YsJ
   /nBrT1Qa9kmjbdjztLN8tYPMLxvHzZyRyraPLTleVi8Z7cgREoyAzM99K
   62lR4YwlYfmibxZEfr6rK65EN/yka8lyFmBz9Cm/Rr+X+HITLVv050Hsn
   oeNnEv+A0C8ddNYcF083Qoe5NcPq/H4TdAA+6gzjln6W01K4GlyU6qq5w
   ZcWLARNZ+FisjtlbBxOGj+KlCnjOhfICZq89JZGQTTqExbhJwpJ6chDIU
   YdvE9TUms9CxAUadyTiizHR21n0XkxCZ61mSnWFiWTFSbKR5pWXktCppl
   g==;
X-CSE-ConnectionGUID: bwRZG8y8RBWTNqy527k+qA==
X-CSE-MsgGUID: 8mLp2DuWSRu/BLrzwHjDFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="943084"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="943084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:12:02 -0700
X-CSE-ConnectionGUID: 1FBikxe4R46QGJwAufpv/A==
X-CSE-MsgGUID: vfe4ePJFSg2fqHrI32DQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2268185"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2026 06:12:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHhj3-00000000CEp-2wzV;
	Fri, 16 Oct 2026 13:11:57 +0000
Date: Fri, 16 Oct 2026 15:11:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6 1/1] futex_wait.c:170:9:
 warning: 'shared_data' may be used uninitialized
Message-ID: <202610161540.gXWoQXH3-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b9d5e9a3a59c79fd6ec703c9780ab38ad1c0505d
commit: 48cca27bda625d2b0085f2c6efe01e9fab0c4f52 [1/1] ANDROID: futex: Skip when futex_waitv/shmget not implemented
:::::: branch date: 14 hours ago
:::::: commit date: 2 years, 10 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261016/202610161540.gXWoQXH3-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161540.gXWoQXH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610161540.gXWoQXH3-lkp@intel.com/

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
