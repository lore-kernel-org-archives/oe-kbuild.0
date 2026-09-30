Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C84582EA
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 07:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754660; cv=none; b=TkgEmRb3nNKykBg8tyTjXlh5G8N9eVvYEUmWG/ISHj1A6XdH8LM0v/sEw74ubaQ+AMKWrbkQVTAzN5VpoWI2XH9Nx4XSJr5y7paInvvKJohekIGf0Xhe8z1WvKWVTCsZcoK3p61dRRjhvRobg7JYmQp+ZM6Pfx3H27jxDXm3Ipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754660; c=relaxed/simple;
	bh=0wm0zCrMvqzStvw2F0y5CqnZiuPRn9sja+StM/OQPKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cwfjyIHVFhDS4Zgsn6njqqzMQYep15xjlAk+FqFSsLac8TICoj/IvG0pvR/FnvoITYZoNKIA0DwDlJpFwISjxcgDmxJhdEMuby1VMZoNKR6QvZ+HYGXtjlr3wGFiCDcWG9yMw+bNJZcotq+w/nCU2Smcrq3qkgZUKZRUq6gLr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRWdNdo4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRWdNdo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790754659; x=1822290659;
  h=date:from:to:cc:subject:message-id;
  bh=0wm0zCrMvqzStvw2F0y5CqnZiuPRn9sja+StM/OQPKs=;
  b=DRWdNdo4EKbxnkzshvnhCG7zSr42aywMJuy9H9BHX5V65SNYAe6WHT5O
   eBhlXXe1gjR6JIo2rSTSZfNcGgY4VUwvpRMFZFZELFLpuIojF6fcrTDQK
   DQomDTbODbjcvNtARIP8fsXPyjQQLSUrVXLeLq7xi6P+g6T3vsTcfnAcI
   dvDeahq2Btcj9VAR7bZaK1dPi0hWB3qI6hnQ7ScYT8Mur17sNR/lbZV/F
   r5v96xsXOnOw6T1r8tdIb4aVBdBSSR8zt91kXdDtOA/7HbYkcEJz+HIO2
   d7+RnzRxxwxv3t8w5VNufFJOpG7QkatrKvIjYwyyYWzekbuzrPfp2tnkT
   g==;
X-CSE-ConnectionGUID: ma/Xtti6R7+SaNcy/lDpRg==
X-CSE-MsgGUID: sAEC/x3nRQybXJ/hdcidvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93972448"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93972448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:50:58 -0700
X-CSE-ConnectionGUID: GCRm1Vi5SJqE5p5eiUADsQ==
X-CSE-MsgGUID: OAf6a4YmRlW5TFMNN1auaQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 00:50:57 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBp5b-000000001mh-1dD0;
	Wed, 30 Sep 2026 07:50:55 +0000
Date: Wed, 30 Sep 2026 09:50:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 17/26]
 ctlv.c:1740:52: warning: format '%llu' expects argument of type 'long long
 unsigned int', but argument 5 has type '__u64' {aka 'long unsigned int'}
Message-ID: <202609300903.dKo7SR8n-lkp@intel.com>
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
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 632e6dd46feb3a874a82d83535f9e3fd973231b3 [17/26] selftests/ctlv: Add the wire-format selftests
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609300903.dKo7SR8n-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300903.dKo7SR8n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300903.dKo7SR8n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ctlv.c: In function 'device_a_continuation_of_a_series_that_moved_on':
>> ctlv.c:1740:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    1740 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                 ~~~^
         |                                                    |
         |                                                    long long unsigned int
         |                                                 %lu
    1741 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
         |                                                           ~~~~~~~~~~
         |                                                           |
         |                                                           __u64 {aka long unsigned int}
   ctlv.c:1740:76: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    1740 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                                         ~~~^
         |                                                                            |
         |                                                                            long long unsigned int
         |                                                                         %lu
    1741 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
    1742 |                  generation + 1);
         |                  ~~~~~~~~~~~~~~                                             
         |                             |
         |                             __u64 {aka long unsigned int}
   ctlv.c: In function 'intro_an_availability_change_between_two_fragments':
   ctlv.c:2416:52: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    2416 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                 ~~~^
         |                                                    |
         |                                                    long long unsigned int
         |                                                 %lu
    2417 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
         |                                                           ~~~~~~~~~~
         |                                                           |
         |                                                           __u64 {aka long unsigned int}
   ctlv.c:2416:76: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
    2416 |                  "reason=%u expected-generation=%llu current-generation=%llu",
         |                                                                         ~~~^
         |                                                                            |
         |                                                                            long long unsigned int
         |                                                                         %lu
    2417 |                  CTLV_VALIDATION_REASON_STALE_GENERATION, generation,
    2418 |                  generation + 1);
         |                  ~~~~~~~~~~~~~~                                             
         |                             |
         |                             __u64 {aka long unsigned int}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
