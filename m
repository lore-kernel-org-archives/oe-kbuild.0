Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794629365;
	b=vKzU2GNRAqaGarc+cNBBbNcKZUPgYQLrO9sM7KQFtWeV/0u+ChoDsphETBZaBkK1zzTn
	 SB60mpL8gs/g2APTT4jxz4WjAsX26NOg0s21VRX4YTU07Ijg2oYgZm07zeqXcWNjw1vKu
	 aVDfRIb4L39u3D/zKEOAXBAEhai+W+16pkUkXXaa8+YlcI9IgFulQcvAO2e4OOCxwqiEX
	 JprEb+V5/VCQERth8HEPlxugWAbk6qVKnuEM3uW+TpxjqIhg8UwYjuBYSprkHwoS7maUH
	 IwofMRu/y6Lhx1OJmPwdTjLwjmu8A23MzLrUqaEj5i3q0qJXgBaA9EY4BBXostXnpiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629365;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QWYaVYAksQFDq2vCfgKeoj/hL5tPZzopbQXLn5lBUCw=;
	b=4QXJ4fpE+HaaJFEa0GjlU9rht0hSQZt6mjHypjhbwEEz4mKbW6W8GUllVIGvgeqeMYOR
	 /VOC0uoY1r7Bsa9P5b3HKeurCaeNVxGUhHcR1yd5pN3UzpDFp5tbvLDPu7cynvKn2KPNt
	 j+3X6UbCOq/f00SwDsEE5chIusNk626YY8X/dV28A3gJc3PBwQg82ZPTJQHLvc3YXCtBk
	 tM0GfCC3D9CEAISlsU3yxQDQ6Ja5F/IZkHCeh4iLVxE9P9K6EQLwzzfy1Kiju9M5Bvb2F
	 lbmSvzhfQaUGfBcx5Wy5qiATsmM84GRV+LrZ3J0miku13GTUo149Np2m7CnRcwjLR/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4ygAk6x;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BD606A327
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 04:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48BD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4ygAk6x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794629365; x=1826165365;
  h=date:from:to:cc:subject:message-id;
  bh=r9p3yqSj/igf8o5NfdBxmtnEezkVtERqPECq/YLWQHw=;
  b=W4ygAk6xdB+yiEVXGisWzXvC9oY4babKO7l9NOxEyB+HrJ3orb9FKEwV
   VlKPKzMLF2WqS1dIEL/iVb6M+SSxyvXL6Wiwrbdza4d0edR0eUH613VBU
   G9GvIRSXupca0iPJEgtHbL4YpJfmSWxGiW2RYwWIXLQJhdtGMJOH1pBVh
   GowPKNc0Nlm7q1bT3Qh768Sw1HN6xmzfuw6xGH4vzjPQ5FHW3PVc95v2a
   xnnSYV5xdOSps+vVgYNgFmvISHuBKW19DnLPcPWr9wf0GJ+pyGe0/K8zr
   NYTYasb0vaOhZc02blxDQnpxMbhQJMcU6QWus+uCf6qIzSz4i8cLj663u
   A==;
X-CSE-ConnectionGUID: b/wRjVytTU2Mr5l75bx+Jg==
X-CSE-MsgGUID: QJNJ2a0eTauJSZGp5ERDRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3350379"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3350379"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 20:09:25 -0800
X-CSE-ConnectionGUID: fsKngCc1R2iUP4/tW3/VaA==
X-CSE-MsgGUID: kjIFHvzJQUm72rHn5PPsTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9019885"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2026 20:09:23 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS54r-000000001U3-1AwX;
	Sat, 14 Nov 2026 04:09:21 +0000
Date: Sat, 14 Nov 2026 05:08:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1957/7428] arc-linux-ld:
 leds-asus-aura-scsi.c:undefined reference to `scsi_register_device_handler'
Message-ID: <202611140551.WyqUtpYj-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/61/6173959c7d4d578bce9b075577cbdf59877b1eea-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Liang Haowen <nbg2974@gmail.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 6173959c7d4d578bce9b075577cbdf59877b1eea [1957/7428] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
:::::: branch date: 10 hours ago
:::::: commit date: 11 days ago
config: arc-randconfig-r2106-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140551.WyqUtpYj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140551.WyqUtpYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611140551.WyqUtpYj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/leds/rgb/leds-asus-aura-scsi.o: in function `asus_aura_init':
   leds-asus-aura-scsi.c:(.init.text+0x8): undefined reference to `scsi_register_device_handler'
>> arc-linux-ld: leds-asus-aura-scsi.c:(.init.text+0x8): undefined reference to `scsi_register_device_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
