Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35B17C7AF
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903282; cv=none; b=ahxQMwMxljElFQbxLozk3vbjNwEZVF6ViXKlgU1VFx4E9J9pJQJTYKOSV3VzDzm8oGsfX+jYbyKFY8K/L32hnI34mgeGmp/Qj4ylILankBRtBuNDpykhKMDif0/q1hugHMCb/mus9DORBtoD4bvwvilxkVsCKZ1ERc2fQoR/Aqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903282; c=relaxed/simple;
	bh=XykexB2ql+HZEEelWKcBfz9F2Fr87syHQm47I019HJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGJpb288JdktfdXxRR+6mUwDOa0GMnzbcnrgfmOvf0YmAMuXPu8Nt2vwbl/zDCHCxy4F9aU4+mPi7QFAoU3bdgshwrlxitmqaF0r9o+T8Q7P9qwkufudAF9I/5htTOAbEgPY5VbqYR8lwS2VLsy6F5pQ3vl0TRDYVb+OynMz/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2f5JLvB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2f5JLvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725903280; x=1757439280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XykexB2ql+HZEEelWKcBfz9F2Fr87syHQm47I019HJ4=;
  b=c2f5JLvBmHBlTV2yEdOj/xoEoZ8ePyhIX6IpiPXH2qnbn4myH1wUp2gN
   U2f889YLZd+eFTc6cj7sO/vPRX/zq1L0tAO92cJaLMPdcYBEVNiujsojU
   qr6lgN6DNXUIZXwOsZ/PoAHKqjdpHZ6m7BvyAXZ96A/ZlaZ5rUT9FiS0G
   Z+NikMmbjv9O9L7UQGxtCGnz7YxglQ1mzG9B+JDO3c+4zmPLifFrxILU+
   WogzFZktQVs3t+sxENVoeQ69jG3oJSosu9Nbcy28i3ckQTBNB+H+n5PNe
   R/Zkgby7UzrLTlIqsCwkOnrPeVJzrVB0eHOMtOpLNLGI7N1Utslk+HgL8
   A==;
X-CSE-ConnectionGUID: C9IYXepJRdOv4fo4MXbAdQ==
X-CSE-MsgGUID: /wMJ9FCTSWyonRO4uGCLcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24161992"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24161992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 10:34:39 -0700
X-CSE-ConnectionGUID: Y0Q+r8dZTn6z7O5PQj39/Q==
X-CSE-MsgGUID: TYUmq9KmRSyB9jZrE4u1HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71345225"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2024 10:34:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sniHc-000F1k-1A;
	Mon, 09 Sep 2024 17:34:36 +0000
Date: Tue, 10 Sep 2024 01:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10082/10516] make[1]: *** No rule to make target
 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S',
 needed by 'kselftest/vDSO/vdso_test_chacha'.
Message-ID: <202409100141.Rlp428HN-lkp@intel.com>
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
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: b5a41108f625371b79cd92976a1a528274d3a0b5 [10082/10516] selftests: vDSO: open code basic chacha instead of linking to libsodium
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100141.Rlp428HN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409100141.Rlp428HN-lkp@intel.com/

Note: the linux-next/master HEAD 100cc857359b5d731407d1038f7e76cd0e871d94 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> make[1]: *** No rule to make target 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S', needed by 'kselftest/vDSO/vdso_test_chacha'.
   make[1]: Target 'all' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
