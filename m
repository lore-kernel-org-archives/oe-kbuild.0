Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929925;
	b=bLB+xQmhYcvyeNKoOXUaL+afY+TM5bOwwA4ZEGwmTcnzLlHaxvbOo1/XBMJg9jB0RkZT
	 sC+oFwk1k10gf1hUQEEH7b7a3xIGXSqGMNKTbeq4LdKAnxJWpW6KMnoklDk5/F77EVgwq
	 uu5qJQ3pILqhgg8Gk438oW16u5FbVVNwl9GhGp/A1es5RRc/vLLU4/AKZ+7IXfDWxbBts
	 DuHGd1fZGPpxZzoEYYVWJ9TUHGivvoATT7y6weaCH0vxXLv854LVv5ze8rVVZQzN3MZ3R
	 8Q3X7ImT7Fwi80e/Xo3VlXSrtf4ZjhT2d/+5BQxDFm8tpiA8wBll57wk4imVXbUM5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929925;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DxkFf0u2aKXB/IvfkYFRZ3ReuYJev85k4PpR9YNlw+k=;
	b=o1V4zdMP8/GuFeNLoGcoWEKefUDWry65//v3kNjYPoeHfHZ0yKFbYVfZ9gW5KeaavMq/
	 la2B5hNGQzt7iEU8ecqeNTojZYBeuDa8h4xexBUXHrV9rYh/LAUXI3DpZCm6z6It6zlxO
	 KgOWlVz8CGRLNXJFFPMWYsnUcb9cMh2X0MjAiecv3YAs+yL/aMFcOFnPnG3XH/iAFbPXR
	 77eR764JaFO8O6UdEwgSpP4XpFhm7bqOtVjS2jp+0S+P+o2UTazOLJxLumWlBMJwrU7sh
	 eA+4puM/oM/1RQxj4oQ7AGjydZLfwiEHcYt0P4CZ249ALFloIAxDArkrZ/7H1MCsf5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXwW1jiy;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55793606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 15:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55793606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXwW1jiy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794929924; x=1826465924;
  h=date:from:to:cc:subject:message-id;
  bh=lColYXq3YcUmuPQKphIdt7gQbpZOLwCxLg8Qc5Hf9Eg=;
  b=FXwW1jiy/Y5B5AXwpZyVR4ICRshMteRYeD+0+kjBayd8/YfzxIwSpyTG
   wLWwhiVVwk0deHhwh8xvNKLaupGkLUvhx7sJkl/aVp5rDOSFkJh1QZRo/
   EuZNUEwWFK/+q1JVVknbuRWM/jLUgmOpyIdswXV9sOtfoJ8oPYk4+t+oT
   gFG6py9LmiLoR7n4ei/iSGptmEhsIjwPkYN5RoEjg/GcXGtvxT8ZUMaa0
   ioOziFiVFl4yNGMlyg/+D6bgIcjzcnubKTCQJ+gbIMiOBb4b5WQQgGzfV
   5+dw0E4Zq1+fddnxpztVsxah2BNhrEcOoKKLMssd96yBReE761WzREwJ3
   A==;
X-CSE-ConnectionGUID: sl9eMVgdTBifMPFRmH9wcA==
X-CSE-MsgGUID: 3noS/68BSVSEUC9IWYN3jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3697723"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3697723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 07:38:35 -0800
X-CSE-ConnectionGUID: DDmjm9rITpmrXrPTW3P8hw==
X-CSE-MsgGUID: 1hn/oR/9RLuZ7uO0CbEl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9717230"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 07:38:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTLGS-0000000039K-0G6S;
	Tue, 17 Nov 2026 15:38:32 +0000
Date: Tue, 17 Nov 2026 16:38:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-leds:for-leds-next 7/40]
 leds-asus-aura-scsi.c:(.init.text+0x8): relocation truncated to fit:
 R_OR1K_INSN_REL_26 against undefined symbol `scsi_register_device_handler'
Message-ID: <20261117163235.GDLSCRfO-lkp@intel.com>
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
CC: linux-leds@vger.kernel.org
TO: Liang Haowen <nbg2974@gmail.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   c92d6666ffaca04015e91df3b1789c15c965e3d2
commit: 6173959c7d4d578bce9b075577cbdf59877b1eea [7/40] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
:::::: branch date: 2 hours ago
:::::: commit date: 2 weeks ago
config: openrisc-randconfig-2200-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117163235.GDLSCRfO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117163235.GDLSCRfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117163235.GDLSCRfO-lkp@intel.com/

Note: the lee-leds/for-leds-next HEAD c92d6666ffaca04015e91df3b1789c15c965e3d2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/leds/rgb/leds-asus-aura-scsi.o: in function `asus_aura_init':
   leds-asus-aura-scsi.c:(.init.text+0x8): undefined reference to `scsi_register_device_handler'
>> leds-asus-aura-scsi.c:(.init.text+0x8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `scsi_register_device_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
