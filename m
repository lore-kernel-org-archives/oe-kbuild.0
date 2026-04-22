Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AD35898
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776891762; cv=none; b=MmZDqvAeCuSNWUSdikYKoWa+tP/byT5RutOFlU1pvXyDRklarZH6TQJFfrWsf0SN/A+eLk1/E/o9AWW13cJeTv5VCqsb2jBqfOTpdfxdiDt1PhyRl6L+GpavOi45qjlHzcoTYDASxAAV/pMM3IxhTFIVAATWFAN5X8tbtxi4srA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776891762; c=relaxed/simple;
	bh=NDiBnYohOBWiXCplctuIY6eAxP/vvsmFv7MFyBEf324=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hQS9Wo2FWLCch77M6no5Z8pPQ1Jbfsm5Wzim8usRawhtTC4c0jnsYwfcYdLvPWDewKc2NoEOJOP8ZRxDT0r3Yu4BafZwGGf+9zwcmeWW2puv/pjo/sGskTtSmPcSkXHP/wFKZqo0bHLzptnNtwReBtnxacdWl0xY+Ab6VQ7BLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLn6lAQU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLn6lAQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776891762; x=1808427762;
  h=date:from:to:cc:subject:message-id;
  bh=NDiBnYohOBWiXCplctuIY6eAxP/vvsmFv7MFyBEf324=;
  b=LLn6lAQU7g3DQiB9x5rt0VCMsYlNdDP8Lbt8DAOArBmUu6BhDOQkfxhS
   HE97lOeuTls7eSHuQV03zeM1wGW1UDpLzf0faWynrmTRbk5tosHJt0ThB
   K8iewO7IrZB/af+k+4Fqa3tHSZN/b87imx8Ad3i9k+Qlrjvea2dm2Ce1B
   8pi2fIp8L73Nu/ljmp1C4+zBJDylLjqcqbuoJK7B1G/Pr92MruPTC+CLs
   WkQ97SBzRY1booN7b/6NtT4AHHAPi1DOQYl1AG8Z7vOQ7JMO628yU2fWD
   N8BqVBSKPwMK48NaDIQEcMcSoLBIp0kftEUCOUXyrao4hM99pBE6HrGNA
   Q==;
X-CSE-ConnectionGUID: LDBjSD6VQtGhRcTHKTT69g==
X-CSE-MsgGUID: EkLQjZeMSVO4yP0yJ2s+Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81463471"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81463471"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 14:02:41 -0700
X-CSE-ConnectionGUID: MrhtVuSgQPCNGjh+OMHkJA==
X-CSE-MsgGUID: ePQCcHgjS1y9bSEpn9SsiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236828284"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 22 Apr 2026 14:02:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFeiT-000000002rx-2v9i;
	Wed, 22 Apr 2026 21:02:37 +0000
Date: Wed, 22 Apr 2026 23:01:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 218/218]
 test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated
 before the last format character
Message-ID: <202604222218.BTmo8dxS-lkp@intel.com>
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
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   db8b81c14b7031c5b1420d57fbeb18056546ddcf
commit: b03efd8c92f9b56bbe0bbbea29f46916e942c963 [218/218] anolis: tools/selftest: add cpu identity coverage
:::::: branch date: 9 hours ago
:::::: commit date: 7 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260422/202604222218.BTmo8dxS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604222218.BTmo8dxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604222218.BTmo8dxS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   test_cpu_identity.c: In function 'test_identity_hierarchy_counts':
>> test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:943:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     944 |                  strrchr(expeller, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:945:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:945:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     946 |                  strrchr(expellee, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c: In function 'run_multi_child_parent_throttle_pressure':
>> test_cpu_identity.c:1555:76: warning: '/' directive output may be truncated writing 1 byte into a region of size between 0 and 4095 [-Wformat-truncation=]
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |                                                                            ^
   test_cpu_identity.c:1555:9: note: 'snprintf' output 3 or more bytes (assuming 4098) into a destination of size 4096
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1556 |                  parent_path, strrchr(normal, '/') + 1, strrchr(throttle_parent, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:1558:72: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                                                                        ^
   test_cpu_identity.c:1558:17: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1559 |                          throttle_parent_path, strrchr(children[i], '/') + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
