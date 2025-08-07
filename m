Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB226B75C
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580470; cv=none; b=En8GtCd9THLIIX/xdl9e9DrQmDlk1gv88JO6GfrXQ0xBB3Jtn07VwMIegFlkPs6Lg09V/wufA/7PaPlgHFl9pijccRWHtmZ1QKUhRR0TgooJIu48W9l2T7Jhn2uY/HIMjL2g49haATksSDIpsHRYQgsMvCfW4S5/Nw9doA9pqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580470; c=relaxed/simple;
	bh=aVb2upGtj+ep2jWaa/skKEaN/7selwblzP5+GtzdK0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6603fa8Wmx44+vjz1sJevW8vYv2PMCp0VvWEIfaOXL3eEK+ELQVFcNede5/ijubgeLMQ9hbCmVOJXeFJNnAKUee8EubiupGfZkF12q/lovWXTZI2mZhlL+k5Scyp59e4YHgMIU2r/T7z0ihC3CoVT38OQlIUwS1ER5GVahEJoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5Jr4Muh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5Jr4Muh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754580468; x=1786116468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVb2upGtj+ep2jWaa/skKEaN/7selwblzP5+GtzdK0I=;
  b=P5Jr4Muh1/Ws0A3vYnlppRk3GY0AkjB4r/qQAQ5EDDN4dmedscVuLArm
   JORHKBKQAS9GhcWdcegWMjfdwxJ+hJBAsLtSbyR6yyDjbeApd4lKKt1ck
   Xrcdww5j1ekKbMSXFbWnznYIOHTgy1NCZqSA2OUsfg2Tj8ee0RTbsrPID
   alCZeecpCYxW5MjMuf8A2+yIrk4g0yRud/QQ/mEszT1VzgaY2NGihCnge
   gOy3jEIsH/rOCVlGBjRFe0LLLRY+AKN80B3FHoLhWVHQmKn7OLD112qra
   +2jIJBgcI0FZcj6wRLsgS1PJ81XiAZXxJrcSroliWq/F2FXYoIp0oWrTu
   g==;
X-CSE-ConnectionGUID: u/joBuVGTkefa64hd78a+A==
X-CSE-MsgGUID: Y9S3MG/tTVqDWW/jPZsWkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56839418"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56839418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:27:47 -0700
X-CSE-ConnectionGUID: fRdWJ5ViSbycGxzmjZT1mw==
X-CSE-MsgGUID: gJvvZu5hRqO4CgIGbzzw+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165465846"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 08:27:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2Wu-0002vG-08;
	Thu, 07 Aug 2025 15:27:44 +0000
Date: Thu, 7 Aug 2025 23:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:ufs-lrbp-as-priv-data 9/34] ERROR: modpost:
 __ex_table+0x1d10 references non-executable section '.bss._key.47140'
Message-ID: <202508072359.d8vszRCf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
head:   1631680461b6bf4f11e2ca8b80155b548f856d6e
commit: c4aa511b4e9567ad25e707faf4ce94d07ab477d7 [9/34] scsi: core: Introduce scsi_host_update_can_queue()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072359.d8vszRCf-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072359.d8vszRCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072359.d8vszRCf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1b3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> .LASF818 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> .LASF2929 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> .LASF2931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> .LASF2933 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> .LASF2931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> .LASF2936 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> .LASF2931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> .LASF2939 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> .LASF2931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> .LASF2942 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> .LASF2931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> .LASF297 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> .LASF299 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> .LASF301 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> .LASF303 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> .LASF305 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> .LASF307 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> .LASF309 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bac (section: __ex_table) -> .LASF311 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb4 (section: __ex_table) -> .LASF313 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> .LASF315 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> .LASF317 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> .LASF319 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> .LASF321 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> .LASF323 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> .LASF325 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> .LASF327 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> .LASF329 (section: .debug_str)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> .LASF331 (section: .debug_str)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf0 (section: __ex_table) -> .LASF333 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf4 (section: __ex_table) -> .LASF335 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> .LASF337 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c00 (section: __ex_table) -> .LASF339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c08 (section: __ex_table) -> .LASF2732 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c0c (section: __ex_table) -> .LASF2734 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> .LASF2736 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c18 (section: __ex_table) -> .LASF2738 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c20 (section: __ex_table) -> .LASF2740 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c24 (section: __ex_table) -> .LASF2734 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c2c (section: __ex_table) -> .LASF2743 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c30 (section: __ex_table) -> .LASF2745 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> .LASF2747 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c3c (section: __ex_table) -> .LASF2734 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> .LASF2750 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> .LASF2734 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> .LASF2753 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> .LASF2734 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> .LASF2756 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> .LASF2734 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d10 (section: __ex_table) -> _key (section: .bss._key.47140)
>> ERROR: modpost: __ex_table+0x1d10 references non-executable section '.bss._key.47140'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d1c (section: __ex_table) -> sifive_gpio_driver (section: .data.rel.local.sifive_gpio_driver)
>> ERROR: modpost: __ex_table+0x1d1c references non-executable section '.data.rel.local.sifive_gpio_driver'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d20 (section: __ex_table) -> sifive_gpio_irqchip (section: .data.rel.ro.sifive_gpio_irqchip)
>> ERROR: modpost: __ex_table+0x1d20 references non-executable section '.data.rel.ro.sifive_gpio_irqchip'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .LASF1589 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .LASF1591 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> .LASF1593 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> .LASF1595 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .LASF1597 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> .LASF1599 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> .LASF1601 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> .LASF1599 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .LASF1604 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .LASF1606 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .LASF1608 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .LASF1610 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> .LASF1612 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> .LASF1614 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .LASF1616 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> .LASF1614 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .LASF1619 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> .LASF1621 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .LASF1623 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> .LASF1625 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .LASF2481 (section: .debug_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> .LASF2483 (section: .debug_str)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .LASF2485 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .LASF2487 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .LASF329 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .LASF326 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .LASF332 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .LASF326 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .LASF335 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd4 (section: __ex_table) -> .LASF326 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ddc (section: __ex_table) -> .LASF338 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ddc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de0 (section: __ex_table) -> .LASF340 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de8 (section: __ex_table) -> .LASF342 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> .LASF340 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .LASF345 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .LASF340 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF1738 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF1740 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .LASF240 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LASF242 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF244 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF246 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .LASF1383 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LASF1385 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .LASF1387 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .LASF1389 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .LASF1391 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> .LASF1393 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e48 (section: __ex_table) -> .LASF1395 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e4c (section: __ex_table) -> .LASF1397 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e4c references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
