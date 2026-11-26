Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731129;
	b=ifjFEObbId1KDhbBW4n+VJgL0NLzmd4wU0Wkqm8M1Rq+sKrDKVK/BW2WA/pQjECDx0JZ
	 04N0c8QozvqrI2QVIL6i3YxTYHg/JV/p4SfXyWyhhkBhv2tzP9LxEh9KNxfgD/Xbof5Uz
	 S0A3E9V371z9ioWTJQox/2aZ6WDPKuJrlcykwVIR2qYJuQrXQl1z7CLKG4qivAc01kOCf
	 9t4j4WhD4sc4yqBDPxGyEBifShackJU3JUhReHETyoKyb2Been1PHkHyrfxr7i0HQNYLY
	 OXl5LFAoUIXYmxNPbE4LYlmDz+0BcRRtMBG9SpvMIad8ESlTOkISeJKGGjK00QQzlHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NQP1uJl33+Gvy0sQYmwpDtGnPEun5k0Kw6mZCKkoacs=;
	b=smyw7hOmdKi1TybvT1xxcIDvmWo7XnstqGs/fnba7h+2UnO86lyXINgHtb2OvkYFNmCC
	 FU+AFIkqk4D9xaCJ2mxy5Vghp5BbCVFzzag4vDgVO0L4tpw/YZc7g9SdqhxKadC3y4RUM
	 UV6NUi9tSq1exBtTYDddk6seopU+Ch6Y2CPVK99L7uDaOCy117CMaU7CazoNJrbZW//wz
	 rk307VRzVIa78dOCRFtpmnpCuywe7V/Qya+NRLpcjSAJz1Ge2cMkjuTR+ul7AAWjCyEun
	 m7ko06kGYfY12H6j/oNN5PpTd1wiu3qtEvUhUjtD1w+p8sy8yNMrBFvJYIfI92rEboA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kiFwiWxV;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C363606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C363606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kiFwiWxV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795731129; x=1827267129;
  h=date:from:to:cc:subject:message-id;
  bh=0ajmT3zjqdWRWU58B/jg+yec9HfhDZEzpA42a8WZRxw=;
  b=kiFwiWxVJg50+aYmi1rawHVjDbGSxorYecHbvm5YLhkZ99ykTBQgOxWy
   E7gM9KQtgWV58R6KEE9XqFBnfCBDNcV1Q3OtcMlY3QxkZbpgClpHTFaGj
   EIu0YZhIr+SxlHAb4GdA1RciQQXP0ATsikGK/+xzC+hUwbIGrrwtefFzM
   Zjcigm7FbCV7KjStMCbQVw9EyXTjUnEEZDDHO5W8cFYbx08+2RzQi/Srq
   1hNDijqCX5GeUl7uOoG2s4A6LicZ5roiQbxcapRBVMwM2Fjts+KHA7be2
   GE2rosnVLeLB4c1APOTg6+92m1uH+Dl9+lnfD/cH6XCeR2U3PUGG7YOmi
   A==;
X-CSE-ConnectionGUID: wmBTk7y3Ssaa+JAya5zoaw==
X-CSE-MsgGUID: mn42PyM1RA+h+vmTJ0lQ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4661140"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4661140"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 14:12:09 -0800
X-CSE-ConnectionGUID: CkNC5FjfRpmFO6T4Snknnw==
X-CSE-MsgGUID: TlRtkdQAS7yTWnlqtsdKow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12592939"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2026 14:12:07 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWhhF-000000000Cc-1MIT;
	Thu, 26 Nov 2026 22:12:05 +0000
Date: Thu, 26 Nov 2026 23:11:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.18/linux 1/1] vgetrandom-chacha.S:17:10: fatal
 error: ../../../../arch/s390/kernel/vdso/vgetrandom-chacha.S: No such file or
 directory
Message-ID: <20261126230416.jrk2LBfJ-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   84b7c8dbb653e54e47389c38a0ec88188b902c44
commit: adf8f940e450dea8c64f47317b5048f8c9492e72 [1/1] selftests: vDSO: getrandom: Fix path to s390 chacha implementation
:::::: branch date: 8 days ago
:::::: commit date: 2 months ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261126/20261126230416.jrk2LBfJ-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126230416.jrk2LBfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126230416.jrk2LBfJ-lkp@intel.com/

Note: the intel-lts/6.18/linux HEAD 84b7c8dbb653e54e47389c38a0ec88188b902c44 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> vgetrandom-chacha.S:17:10: fatal error: ../../../../arch/s390/kernel/vdso/vgetrandom-chacha.S: No such file or directory
      17 | #include "../../../../arch/s390/kernel/vdso/vgetrandom-chacha.S"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
