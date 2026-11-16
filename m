Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831683;
	b=WEfsygeuoL921zDV6sOhiD0hs6+ubWrjGiFMBrzXQaZPQXQy+4GoHQutgvzaIeDEN6JG
	 RRBlQGEQbDKb/Yd+iQlDneXfnoHBXiaicKhRiTr2MOFZdDzWQKXwqqkEWVe8OnldXi3nB
	 FObZRXYUmKXbKV4RXBG/DuJOSKmPH/yeVLBDvcXz2vBxFzH0ZHubWXOsFedwKGT3lBN7a
	 tuIEzoFfqTP+t5arSxnAIYOX12hRb6S1pXOeuCpTjB9aftqsAYdmTK3SvTIcmlIFaLF4b
	 kdRRByuFb9KuWxQKXPWZTAO6BdaBoBsEWqq3Wc68a7FcYSvjmSiBbakkId7Z8wkv6jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831683;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=n1y1cMLIgngOrTUxtrgCxjYzM3WvEexl3bGMLYU832g=;
	b=V16flmquODPiFP2XNOuu/rwHdNTulxC3aOdpQSZWLa60M86msP1ZqgyKRrx3h/k2Dxjy
	 uybGDMwWAgWIVSgleMucB6L4mbAy76wG72bMXs5D6lpzOFWBigbX5uvHfo7PWkLM3gG4Y
	 63eMKXAXo5VcVI7qSxiJqWtdaklevHroQLbx2WFEb51VumNtMILq+FUFolGzo0FLvpFGD
	 yQPbeU8os7sONv2dUBVZ6t9SO6KTpocjoBhsuTa1U82QYwG/IT1tER2cCFffbul3xlsk3
	 FffX1Z4UAZi2BDUH2ir9h28b8c/va5YgGGEJZ8hbqnZuGmpAxHPIW8m2H1f7lg86yzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DW612OcN;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E47606A323
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 12:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E47606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DW612OcN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794831682; x=1826367682;
  h=date:from:to:cc:subject:message-id;
  bh=YU8BGcWUMVsXbBGRnyHMmjFcRYXGpid4BzcFhDDJHaU=;
  b=DW612OcNCzuqCOnFA6jQhkTOnCQUp2rrj5ihF5128KrF+mhb33TYSEYC
   on/Tdd49XYcvUj1v+7RMqMu65GehBuo/xtWmfkExsMJv4TKi8UByqlyWe
   ISSjYbSS7xZlzeXn8+mGes0nGbsZKn/OmRgIZ2AoO+wFiNZeye0V3/XjE
   hH8XRfOAEnC+u/r/Tkmlaacl14wq374sDpTX53Osmf0UDXUIPtcLw+kPs
   7sO6Vo69mLKxF48UJKlZx9k69cUeUUnKYEgvCHn/LzbelgaEOrR9xC6e9
   a7S4+3ygrSg059Xbdplm6BZX7fvrhzMZ7gfFb3DcCe3o/drQelgZVyoVQ
   g==;
X-CSE-ConnectionGUID: iXELmV1xQb+eOzdsZC/mtA==
X-CSE-MsgGUID: n6n8KBuFT22weuZbawpFKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3670825"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3670825"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:21:22 -0800
X-CSE-ConnectionGUID: W6kyVFP9SJyPD1hJZHkHNQ==
X-CSE-MsgGUID: CGMofdl5R0CRTKWYeqc64g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9853535"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2026 04:21:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSvi3-000000002gN-002m;
	Mon, 16 Nov 2026 12:21:19 +0000
Date: Mon, 16 Nov 2026 13:20:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1957/7428]
 leds-asus-aura-scsi.c:(.init.text+0x10): relocation truncated to fit:
 R_NIOS2_CALL26 against `scsi_register_device_handler'
Message-ID: <202611161335.ygnkBQdq-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Liang Haowen <nbg2974@gmail.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 6173959c7d4d578bce9b075577cbdf59877b1eea [1957/7428] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
:::::: branch date: 3 days ago
:::::: commit date: 13 days ago
config: nios2-randconfig-r2303-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161335.ygnkBQdq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161335.ygnkBQdq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611161335.ygnkBQdq-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/leds/rgb/leds-asus-aura-scsi.o: in function `asus_aura_init':
   leds-asus-aura-scsi.c:(.init.text+0x10): undefined reference to `scsi_register_device_handler'
>> leds-asus-aura-scsi.c:(.init.text+0x10): relocation truncated to fit: R_NIOS2_CALL26 against `scsi_register_device_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
