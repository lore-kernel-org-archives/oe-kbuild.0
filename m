Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740957;
	b=MMX+giqwD1eWQLlp0cwgqiIzq+2/XGVE9OFmJSNfaGecJMb0zT1gPZj3ikiMBW4UjVgJ
	 K2J8Q7lnIk4y9098oYCp998EZuh4nRb4S3AvkGgYF6+n7Rjannvb8ycbhps2SJ8JR0/Y8
	 hFal70Fh511hWLLVI17z1FPG2LRYGf5o6emo9T01Z/QXdmx/h0eYENYXoZEvtuZVf59JH
	 bl+ipJabyM81SU5b1v3zPev6hBvoG+hSwUE/5BZZmoSVWNdhZzLbibZOoDtPGwRGlXaXA
	 bKssgo4QHFBuUidPhaO4jGyY7J0XIfx7dP74CJBW0anohnJxkxbyGKWPOQBF4kTXwVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ByBFMGt13qd9tnDbszizH7d2H1ACyJAd0+kTuwQ44D8=;
	b=i0WShMwnZ6HgRXwaWn4G/IRx3E53WAGVO6M7C1Nv8HqzoB8pkWziob+2YcnAV/bzmouv
	 z+/nmpWtNm0s669E4kRD3BgxHQbD8H1o8OEFbxJYWgqYoCPm++3GD2itP1HniQqyTZPBl
	 o4+g8CZO3Mcv6Xjn6QD9prPfPZh53sdo+y9UHtoJNypumATN35Jv1STrZZCSpLR5ubdTd
	 EqLDR0egC+ygzj2B4FB6ad9GIvFjSWAn3f3oDVmH0brgFoXFbH58qvioHUziF6SHvJRHn
	 mK/0ElYCwsX8hN87O8vHaa3Emi9RRXhBsaUxyxv8z9eaJORThOy5wzvtkmz2Sic5ltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="GKuX8Xq/";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB587606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 11:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB587606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKuX8Xq/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794740957; x=1826276957;
  h=date:from:to:cc:subject:message-id;
  bh=7Al8fQA3/fLYxLzBCt1a7dDECBDZYcVK7W9BvelPFlI=;
  b=GKuX8Xq/6+sz0H36MJkoZV8UKfoiy0MvpEnUytnQFSyWnolE8+zTP0H4
   XOdxS3Ra+t0qeuzmUVYknFrx9LQpgYsQmL33TaSU0GdFHSb4aSM2V3e0C
   Q3XCzTmJ0aJLdTvuZLgwYRaD8HiQbSAqSadlbJdZbxqV2mwb2WdA0gc1e
   OlKmjApdJdaoXPdvK9UxsdrepY4lnaq2f/WPQRDD44dsO07yIGri7MFDX
   hkNXwtHiCzjnO2BtdnyNuctX8rKZr1ksJYRv9xQJGsaN2VL2smJ9MOBPM
   NhoZGz/M/eJBYIwiE0F1P0fFScMTXbanmp86ywrCZ9grb+UPHUXCpX9Oh
   g==;
X-CSE-ConnectionGUID: suvvyfY4T2uDsn1qCV4a5A==
X-CSE-MsgGUID: gOg4qPDOQZWv7oBeQ61lnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3383029"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3383029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 03:09:17 -0800
X-CSE-ConnectionGUID: kDa7YxpgTkaHvQnW9o5vmw==
X-CSE-MsgGUID: E+3goxJUT0qeaOhv4Rvdjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9396429"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2026 03:09:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSY6j-0000000029u-0z6B;
	Sun, 15 Nov 2026 11:09:13 +0000
Date: Sun, 15 Nov 2026 12:08:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_all_2 52/68]
 aarch64-linux-gnu-gcc: error: unrecognized command-line option '-m32'
Message-ID: <202611151131.3gK6LubT-lkp@intel.com>
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
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261115/202611151131.3gK6LubT-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151131.3gK6LubT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151131.3gK6LubT-lkp@intel.com/

Note: the jpirko-mlxsw/wip_attestation_all_2 HEAD 7ff5e548abbc2312431d4eea9ad283347963a6e2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> aarch64-linux-gnu-gcc: error: unrecognized command-line option '-m32'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
