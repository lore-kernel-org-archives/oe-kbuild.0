Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745350;
	b=44ygILw5D7bOeCshOwQ7gGI4zOHSuqrbRe0YWLr5aSae/KbcCVVxgEhywoeo/dp/FUP6
	 udXOiJw0XHcXJE7Mq6UYzofdb/ayrHThQJB3k8Dl9xIpgoYYpVeSrlr+zOBrLi2t1qrao
	 1IyzcK+mTSETSLghRs0foWuI1aLOLbtdqt+jWXS32ipBsPISB0aKsINwtMwRoE0a/rxnl
	 LvOys77TLA2AgBcs/RTueAbNRuj3mvenFvg6/jLUZ10rL+vVrDaCSGcFaR/0EzTsq3Rm/
	 rYon+0sYePSjDk1FmeL+xPyNktkvzPJ1IsxqqLwsPU1/ia9V/vRVUwFlY26Sfrla2Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745350;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hrMO/xCJRpUAMrm0sUOMiDykzuAv9nsB2lADcpnzArU=;
	b=M4DmFRQCXvcUJhNHicny1PnjEMGn5xkGHQ+edT53jd7ifrdQv3GcZnRuzHo+nGgSpQ5a
	 wARLOdPeeSnvyRmQ+mH0RLDFJxWjQnaMhdggH/JA4dO9MSs+HT7bT34cFYofFirWkuGy8
	 nAP2ulVncpsPCNRbwvshbyU55yGt4xvF6+Q065YM7+fYwS87klY7HXwbWDY9dCXJd+KPv
	 pCbUeBzzdcBmZPc1V71FuagEOYkaMoTJ1AtpM92IlQq4tqmYpS5itueIkt+rfbY7fXAkp
	 PrY7/tVv/eWz7T5OiZcavniyTbjyp09tVqO0RzlI8kPoADjoGjwc1TMzUoraMAsC1lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBBzkehm;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E733606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 12:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E733606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBBzkehm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794745350; x=1826281350;
  h=date:from:to:cc:subject:message-id;
  bh=UABtTtlp5+c6LTYGaXIAubWbT7rcTMLzRwM/fX72tiI=;
  b=NBBzkehmdjhidnmp9uG2RniZmt78/k9R1RDPHufq8g+bsbtw5jVEVCo5
   3I8wUc0RWrxLkyL6FQbywqOUdPdL30ngRY0XdCv7ZEQbz2xyLeYwtsr0r
   OPJPhhD8XsVm2JwTX4auOSUKIIxeldY4dMjE0CRceS9ob/YpkgWAeV2TL
   i5tXRbNIO8vO06RET1VRgsLDWi6MV+CienBKfdLrOSIbSxUSfyQPkeZUH
   GT4nSiByzCn2GR4l8TYzzhy43ybxIObZzV6csAx94wbkNCokw2Olw3nk4
   FwXYXSX5pJfqszEJt0hkwOPrRhE2uiHVjkupKPCFrJJR9MhGf9fh5hcUG
   g==;
X-CSE-ConnectionGUID: v3tYz6WPREKMfFNrkgeXeQ==
X-CSE-MsgGUID: N4gmo326Tp+9sbxSJThVbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3530694"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3530694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:22:29 -0800
X-CSE-ConnectionGUID: MIWMSjtpTd2MJVeGe/xNSw==
X-CSE-MsgGUID: rwbJwmG6T9O/IkMOeoxHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9465603"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Nov 2026 04:22:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZFZ-000000002Aq-2O4S;
	Sun, 15 Nov 2026 12:22:25 +0000
Date: Sun, 15 Nov 2026 13:21:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_all_2 52/68] ctlv.c:1791:52:
 warning: format '%llu' expects argument of type 'long long unsigned int', but
 argument 5 has type '__u64' {aka 'long unsigned int'}
Message-ID: <202611151313.4a8fagS0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: a81126ff58172d1ce767b1e83109c9d408538b57 [52/68] selftests/ctlv: Add message-format tests
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261115/202611151313.4a8fagS0-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151313.4a8fagS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151313.4a8fagS0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ctlv.c: In function 'device_a_continuation_of_a_series_that_moved_on':
>> ctlv.c:1791:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    1791 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                 ~~~^
         |                                                    |
         |                                                    long long unsigned int
         |                                                 %lu
    1792 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
         |                                                           ~~~~~~~~~~
         |                                                           |
         |                                                           __u64 {aka long unsigned int}
   ctlv.c:1791:76: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    1791 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                                         ~~~^
         |                                                                            |
         |                                                                            long long unsigned int
         |                                                                         %lu
    1792 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
    1793 |                  generation + 1);
         |                  ~~~~~~~~~~~~~~                                             
         |                             |
         |                             __u64 {aka long unsigned int}
   ctlv.c: In function 'intro_an_availability_change_between_two_fragments':
   ctlv.c:2491:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    2491 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                 ~~~^
         |                                                    |
         |                                                    long long unsigned int
         |                                                 %lu
    2492 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
         |                                                           ~~~~~~~~~~
         |                                                           |
         |                                                           __u64 {aka long unsigned int}
   ctlv.c:2491:76: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    2491 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                                         ~~~^
         |                                                                            |
         |                                                                            long long unsigned int
         |                                                                         %lu
    2492 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
    2493 |                  generation + 1);
         |                  ~~~~~~~~~~~~~~                                             
         |                             |
         |                             __u64 {aka long unsigned int}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
