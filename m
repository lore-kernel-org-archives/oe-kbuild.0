Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD061376A01
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782880255; cv=none; b=s/QNqtgPJNWGyqT9yadaist3Eqsx73BmzQ/PuFpik2IXMP/KBz0/BC72khzH5heP8q+7wGwliSMyjNgIfzUNTRo0hkfPLySGmwWcxt/RZocIn6uxn9PFYN0+qefQKm8U6YPw66eX9Jn3YtrACoVCCz8NycMGaw0tLGWvgrAoUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782880255; c=relaxed/simple;
	bh=hoqbLtYxhCIwoq3hdqZT5nRnX5wZ4oVRVoMxFf8RJm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+HmDedv4Afun50OLOxAKHntX5lR4HbF3IpN1gHeqYivlza24dSSJhL1n1RdZK51N+nNHIaq/8hHljp3Cc8NF+6IwW8XwwPn+/rVCXqmSWMLnPDWcj7gAqyrXwmV/Q2WSl3hKTTPYRb+7hlIk1dX4PxL7/LSam/+DtCnhujrBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZmzu8qP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZmzu8qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782880251; x=1814416251;
  h=date:from:to:cc:subject:message-id;
  bh=hoqbLtYxhCIwoq3hdqZT5nRnX5wZ4oVRVoMxFf8RJm8=;
  b=AZmzu8qPEUrQgscVsD1C3egP+FYgG8lkkjcxTdoX0pjDZWJc0ynuhS0T
   kpBaiYuVudylyoPiuywy2bmdSdO+2f9DChqN68zwUZSaiL/DduhDOFuHb
   j5qAUvubKsc8w/FSZ9pmIy5cOXvZUoERuMgohe0mLNiiaqyVdfkRA3e16
   XNM+GZ+DOU+Rww6TYuPutysjGBZVP7s73c+j/b06hdd5d7YaLCXoVg/yH
   BcW0YiMKbX/IExh3zPPxedqEc668jDaRkxqLoGaL70eRQTwgkvcCR7pv2
   fpZB4pkcfXXxCTIpDRcTQk5OVv/zPDkQH1boDanRfBZiQ/L7eriV5L0bl
   w==;
X-CSE-ConnectionGUID: cVhoXdjZQzWBgWZmVqCjow==
X-CSE-MsgGUID: ODfWYGg+TA6zcHk+0S9Swg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87436571"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87436571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 21:30:50 -0700
X-CSE-ConnectionGUID: 7naDhDKxQAaoaQx3vywidQ==
X-CSE-MsgGUID: ORI3UlKLTiqdQh/a/d9OqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="246102743"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2026 21:30:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wemaz-000000008wd-1aoP;
	Wed, 01 Jul 2026 04:30:45 +0000
Date: Wed, 01 Jul 2026 12:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xe0): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: ftrace_likely_update
Message-ID: <202607011208.piBfzCPm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gopi Krishna Menon <krishnagopi487@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

Hi Gopi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: xtensa-randconfig-001-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011208.piBfzCPm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011208.piBfzCPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d496b6f42eb0 ("mtd: cfi: use struct_size() helper for cfiq allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607011208.piBfzCPm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0xa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_probe.c:(.xiptext+0xc5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
>> cfi_probe.c:(.xiptext+0xe0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0x100): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0x10f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0x11f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0x132): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x15e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_probe.c:(.xiptext+0x182): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x19f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x214): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x2ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x88)
   cfi_probe.c:(.xiptext+0x306): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x88)
   cfi_probe.c:(.xiptext+0x327): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_probe.c:(.xiptext+0x336): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_probe.c:(.xiptext+0x359): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x430): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x474): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x54a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x5a1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x5be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xd0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0xd42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xe9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0xeab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x12c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x17eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0x189a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk.isra.13':
   cfi_cmdset_0002.c:(.text+0x1daf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x1dc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x2116): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7e4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x22a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7e4)
   cfi_cmdset_0002.c:(.text+0x2302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7e4)
   cfi_cmdset_0002.c:(.text+0x240a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7e4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x259a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8c8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x26bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0x26ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x50)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x291a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0x2946): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x50)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x2c72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb94)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x137): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x152): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x15a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x160): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x16c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x174): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x18c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x1a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x868)
   cfi_cmdset_0002.c:(.xiptext+0x20f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x228): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x236): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready.isra.7':
   cfi_cmdset_0002.c:(.xiptext+0x25e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_cmdset_0002.c:(.xiptext+0x270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x28b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset.isra.8':
   cfi_cmdset_0002.c:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x32c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x342): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x3ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x3e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x3fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x40b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x432): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x450): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb88)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable.isra.16':
   cfi_cmdset_0002.c:(.xiptext+0x492): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
