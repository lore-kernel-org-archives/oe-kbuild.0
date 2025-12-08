Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF33BB44
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 00:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765154322; cv=none; b=iw6erVk9JW2/JreasjUgXp3ETYu1He0mypOS8WlomZKRwZ62abkdzxURNRXHIzF3anpsfmHDt5F84VBFKZn+R9QxzZxghDClwxxHk6MqWMyHIzzUeBJ74Bo1VtmkSC509M16C30qo2BU+iuxHDi2NCEQxH9UewTu17EDJi7dZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765154322; c=relaxed/simple;
	bh=h1z+6FNjZu0q3wWl3vV3a8pAX+dMXo0xIQODIAAql1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7No69V8DQpOyNjnWAwF2So652OOd6CtYf+R28oLWdPMGp98He6Eo8PhLHPm70pZrDpOjdXWfuW3G/cL6zkzWV2eIZ4BI6yoc0GEkGQ/8E8NaUcxmu7npxy8Wvf9PvwA1unG+5CJg9mF/h3s2PDrBRR6dXls5+xxB97tZw6ZOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmEUrX+L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmEUrX+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765154320; x=1796690320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1z+6FNjZu0q3wWl3vV3a8pAX+dMXo0xIQODIAAql1I=;
  b=YmEUrX+LgM1diYt1eFHnv192ntbzgN3x15M3DkfZlB9BtVtl3/z24mcs
   qAyfzVdzDIzV+Z467Y6GLr8iWQscFmMRoW3M+k9A+xqqztPY5GxXs0Lnr
   QZucrmlsguVQzBTlr3dEG8m5zrZwmiz/R0DHzVVmMbQa3tHDiOSmDt7SR
   kaCVnW9QRjGtZqmlXrMNmQsDUjvuWgwAR7MJz+2qz8q3BVdxTXfTo0w8b
   /2awwK/P1CIjFGvZtIvE7E4Jtkle9C5AWw/qjRxYLoES4+noS/KXX7alp
   YNE01V0RTpuOh6sQfH18qdwlN8qFZstalHBf9hMQFIGEnEgshnxmK7LIF
   g==;
X-CSE-ConnectionGUID: fuU8sroPRWGA9+NCRAg1Ig==
X-CSE-MsgGUID: ntsB/1+nS26Ms3C3+uK8LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66282778"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66282778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 16:38:39 -0800
X-CSE-ConnectionGUID: uxZoaVm0SQOPCalnYjf+gw==
X-CSE-MsgGUID: yJc1tBZ5S0+RFirEIr2clQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="233167849"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2025 16:38:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSPGs-00000000Jjt-3twZ;
	Mon, 08 Dec 2025 00:38:34 +0000
Date: Mon, 8 Dec 2025 08:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0x792): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: dump_stack
Message-ID: <202512080809.p78cZP25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ye Bin <yebin10@huawei.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a454e6b1c604555c04501c77b7fedc5d98a779
commit: 6c2e6e2c1af1809d1d9cdbd50ac80f54f5995bdb dynamic_debug: add support for print stack
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: xtensa-randconfig-002-20251208 (https://download.01.org/0day-ci/archive/20251208/202512080809.p78cZP25-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080809.p78cZP25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512080809.p78cZP25-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x93e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   cfi_cmdset_0002.c:(.text+0xa18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0xfc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   cfi_cmdset_0002.c:(.text+0xfec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x1463): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6d0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x1710): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0x1af7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   cfi_cmdset_0002.c:(.text+0x1b3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0x1cf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   cfi_cmdset_0002.c:(.text+0x1d0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3a0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x222c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd94)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk.isra.0':
   cfi_cmdset_0002.c:(.text+0x24b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x2547): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x2e94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd94)
   cfi_cmdset_0002.c:(.text+0x2f72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd94)
   cfi_cmdset_0002.c:(.text+0x310c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd94)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x3202): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11cc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x15e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x1af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x1b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x1bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x1c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x1fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x738)
   cfi_cmdset_0002.c:(.xiptext+0x20c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x2b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x2e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x2f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable.isra.0':
   cfi_cmdset_0002.c:(.xiptext+0x367): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x376): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready.isra.0':
   cfi_cmdset_0002.c:(.xiptext+0x3c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x3de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset.isra.0':
   cfi_cmdset_0002.c:(.xiptext+0x4d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x4e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x4fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x528): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8cc)
   cfi_cmdset_0002.c:(.xiptext+0x546): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x56a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x57e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x593): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x5e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x60b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x61f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x64a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7ec)
   cfi_cmdset_0002.c:(.xiptext+0x653): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0x746): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x756): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x764): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8cc)
   cfi_cmdset_0002.c:(.xiptext+0x786): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
>> cfi_cmdset_0002.c:(.xiptext+0x792): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x7da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x803): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x818): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x82c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x8b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x8bd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x8cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x8d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x906): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1308)
   cfi_cmdset_0002.c:(.xiptext+0x927): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x944): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x95f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x993): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7ec)
   cfi_cmdset_0002.c:(.xiptext+0x99e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x9e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0xa1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xa2d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xa37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xa76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xa97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1308)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0xb08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xb9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xbaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xbb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xbbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xbce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xc02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xc34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1308)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0xcbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xccc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xd0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xd32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0xdb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xdc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xde2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0xeee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xefb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xf0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8cc)
   cfi_cmdset_0002.c:(.xiptext+0xf2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xf37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xf96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xffb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x106a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x1073): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x1079): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x1087): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x1090): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x10c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1308)
   cfi_cmdset_0002.c:(.xiptext+0x10e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x1100): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x111b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7ec)
   cfi_cmdset_0002.c:(.xiptext+0x1160): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0x11ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x11fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8cc)
   cfi_cmdset_0002.c:(.xiptext+0x123a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1245): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x78)
   cfi_cmdset_0002.c:(.xiptext+0x1253): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1273): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x1282): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x12d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x12ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1306): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x131a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1343): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x13a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x13b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x13d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x140b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x141e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x148e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7ec)
   cfi_cmdset_0002.c:(.xiptext+0x149a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   cfi_cmdset_0001.c:(.text+0x15e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf24)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   cfi_cmdset_0001.c:(.text+0x184e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc14)
   cfi_cmdset_0001.c:(.text+0x1937): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc14)
   cfi_cmdset_0001.c:(.text+0x1ab3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc14)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_cmdset_0001':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
