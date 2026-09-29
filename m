Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85403CA4B6
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 02:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650361; cv=none; b=G0u2iz7XaplmBHY94aP3Pxo+7JEb2IvlhhFOSPJPBNIthH1pUvYFUO1wvTz5Z/jf2A/iOTd16nDDhTnnkGhDgAZnp6AgJUAinuS0TZ17q4m1GHfqEKig0js1pquyNGdFxNsleq2E0GFbAX6GlTmfYiWYLX9I8LASwXEbRee/uTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650361; c=relaxed/simple;
	bh=s4YgYyrFYiEn0ZZe6ZGXZXC9eQZbMbGfNbmL46/w56c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSalHGgN8A8jzWjXe9Vwequp9qAhGHJZvg+taakh/8wE4z01kYwLHbhgTzXPtCdnENkd5QoV3D802naKkZAvbXjhwHiYuJj5WmHWe6o687hQG3aGUCmGXkwF1YonuDSzi+eiC+S2x+wcoLdG43by2Hb53hTEcmrFPiBw8EkBwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW9es/Te; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW9es/Te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790650358; x=1822186358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4YgYyrFYiEn0ZZe6ZGXZXC9eQZbMbGfNbmL46/w56c=;
  b=JW9es/TeEuhUyHaYVLUOm0y23KPpidSUepoLHJXawL+cv+z3D4im2jwl
   TX0EOiT7EeVPbrEvTUEIcL3ZiUD6VwL1Jh3sbww8sVXQAa3+yasfMrwFw
   ovkEiuQDED4RTDAHIWjkSxMgxALSIArdL1gzzN2/3FqqL4bLvESCqsjZv
   QQfgEusrz12ipH9qif87bTO4lXRf3Q7DhO41yJob5rAcVTsSRLmXVPLkh
   6RcXYfPrQZdzo1Z/48mmJ/GIxYNoU3Go30efLSjunvUwPNJR6jT0i87Pz
   4w8gk1pHYHGQrSZXy2IKeS9XGexD50mEGhzYcfGLM0SCdgWUcZYmWFVtr
   g==;
X-CSE-ConnectionGUID: yENxvSKSQVWZKCYECXfFHA==
X-CSE-MsgGUID: XUL7cwcpQCeH13cy0l/CKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91222496"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91222496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 19:52:38 -0700
X-CSE-ConnectionGUID: qeyEkFI3TmSyzeo4AlRmHw==
X-CSE-MsgGUID: mPwxsHvQQeO07vsyTL8GjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="273849521"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2026 19:52:37 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBNxK-000000001Fz-3fJF;
	Tue, 29 Sep 2026 02:52:34 +0000
Date: Tue, 29 Sep 2026 04:52:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] ACPI: button: Report wakeup key only for power button
 wakeups
Message-ID: <202609290454.LJrhMCb3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260922024232.816-1-baorliu@amd.com>
References: <20260922024232.816-1-baorliu@amd.com>
TO: "Baorui.Liu" <baorliu@amd.com>
TO: rafael@kernel.org
CC: lenb@kernel.org
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: acpica-devel@lists.linuxfoundation.org
CC: "Baorui.Liu" <baorliu@amd.com>

Hi Baorui.Liu,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v7.3-rc5 next-20260928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baorui-Liu/ACPI-button-Report-wakeup-key-only-for-power-button-wakeups/20260922-104232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260922024232.816-1-baorliu%40amd.com
patch subject: [PATCH v4] ACPI: button: Report wakeup key only for power button wakeups
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-2100-20260928 (https://download.01.org/0day-ci/archive/20260929/202609290454.LJrhMCb3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290454.LJrhMCb3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609290454.LJrhMCb3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `acpi_suspend_enter':
>> drivers/acpi/sleep.c:643:(.text+0x147f324): undefined reference to `acpi_button_power_wakeup_pending'


vim +643 drivers/acpi/sleep.c

e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  589  
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  590  /**
2c6e33c366bff2 drivers/acpi/sleep/main.c Len Brown             2008-04-23  591   *	acpi_suspend_enter - Actually enter a sleep state.
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  592   *	@pm_state: ignored
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  593   *
50ad147aa09c82 drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-24  594   *	Flush caches and go to sleep. For STR we have to call arch-specific
50ad147aa09c82 drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-24  595   *	assembly, which in turn call acpi_enter_sleep_state().
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  596   *	It's unfortunate, but it works. Please fix if you're feeling frisky.
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  597   */
2c6e33c366bff2 drivers/acpi/sleep/main.c Len Brown             2008-04-23  598  static int acpi_suspend_enter(suspend_state_t pm_state)
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  599  {
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  600  	acpi_status status = AE_OK;
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  601  	u32 acpi_state = acpi_target_sleep_state;
979f11b060c0b3 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  602  	int error;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  603  
bb3632c6101b2f drivers/acpi/sleep.c      Todd E Brandt         2014-06-06  604  	trace_suspend_resume(TPS("acpi_suspend"), acpi_state, true);
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  605  	switch (acpi_state) {
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  606  	case ACPI_STATE_S1:
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  607  		barrier();
3f6f49c7854c92 drivers/acpi/sleep.c      Len Brown             2012-07-26  608  		status = acpi_enter_sleep_state(acpi_state);
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  609  		break;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  610  
e9b3aba887f47f drivers/acpi/sleep/main.c Rafael J. Wysocki     2007-07-17  611  	case ACPI_STATE_S3:
d6a77ead21b69c drivers/acpi/sleep.c      Konrad Rzeszutek Wilk 2013-05-14  612  		if (!acpi_suspend_lowlevel)
d6a77ead21b69c drivers/acpi/sleep.c      Konrad Rzeszutek Wilk 2013-05-14  613  			return -ENOSYS;
f1a2003e22f6b5 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  614  		error = acpi_suspend_lowlevel();
979f11b060c0b3 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  615  		if (error)
979f11b060c0b3 drivers/acpi/sleep.c      Rafael J. Wysocki     2011-02-08  616  			return error;
f5ee87df7a4dab drivers/acpi/sleep.c      Hanjun Guo            2021-06-02  617  		pr_info("Low-level resume complete\n");
ef25ba04760159 drivers/acpi/sleep.c      Rafael J. Wysocki     2015-10-07  618  		pm_set_resume_via_firmware();
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  619  		break;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  620  	}
bb3632c6101b2f drivers/acpi/sleep.c      Todd E Brandt         2014-06-06  621  	trace_suspend_resume(TPS("acpi_suspend"), acpi_state, false);
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  622  
b6dacf63e9fb2e drivers/acpi/sleep.c      Matthew Garrett       2010-05-11  623  	/* This violates the spec but is required for bug compatibility. */
50ffba1bd3120b drivers/acpi/sleep.c      Bob Moore             2009-02-23  624  	acpi_write_bit_register(ACPI_BITREG_SCI_ENABLE, 1);
65df78473ffbf3 drivers/acpi/sleep/main.c Rafael J. Wysocki     2008-11-26  625  
3f6f49c7854c92 drivers/acpi/sleep.c      Len Brown             2012-07-26  626  	/* Reprogram control registers */
3f6f49c7854c92 drivers/acpi/sleep.c      Len Brown             2012-07-26  627  	acpi_leave_sleep_state_prep(acpi_state);
c95d47a868f35c drivers/acpi/sleep/main.c Rafael J. Wysocki     2008-01-08  628  
81320b20cf47de drivers/acpi/sleep.c      Baorui.Liu            2026-09-22  629  	/*
81320b20cf47de drivers/acpi/sleep.c      Baorui.Liu            2026-09-22  630  	 * ACPI 3.0 (P62): OSPM should clear the fixed power-button status bit
81320b20cf47de drivers/acpi/sleep.c      Baorui.Liu            2026-09-22  631  	 * so the event does not reach userspace as KEY_POWER. Remember that a
81320b20cf47de drivers/acpi/sleep.c      Baorui.Liu            2026-09-22  632  	 * power-button wake occurred so button resume can report KEY_WAKEUP
81320b20cf47de drivers/acpi/sleep.c      Baorui.Liu            2026-09-22  633  	 * and acpi_pm_finish() can emit a PM wakeup event.
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  634  	 */
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  635  	if (ACPI_SUCCESS(status) && (acpi_state == ACPI_STATE_S3)) {
51468a9d3a8024 drivers/acpi/sleep.c      Al Stone              2013-11-20  636  		acpi_event_status pwr_btn_status = ACPI_EVENT_FLAG_DISABLED;
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  637  
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  638  		acpi_get_event_status(ACPI_EVENT_POWER_BUTTON, &pwr_btn_status);
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  639  
18864cc4892d20 drivers/acpi/sleep.c      Lv Zheng              2016-08-04  640  		if (pwr_btn_status & ACPI_EVENT_FLAG_STATUS_SET) {
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  641  			acpi_clear_event(ACPI_EVENT_POWER_BUTTON);
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  642  			pwr_btn_event_pending = true;
81320b20cf47de drivers/acpi/sleep.c      Baorui.Liu            2026-09-22 @643  			acpi_button_power_wakeup_pending();
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  644  		}
c10d7a13846bff drivers/acpi/sleep.c      Daniel Drake          2012-05-10  645  	}
872d83d00f6702 drivers/acpi/sleep/main.c Arnaud Patard         2006-04-27  646  
a3627f67b1d5dd drivers/acpi/sleep/main.c Shaohua Li            2007-06-20  647  	/*
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  648  	 * Disable all GPE and clear their status bits before interrupts are
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  649  	 * enabled. Some GPEs (like wakeup GPEs) have no handlers and this can
a508939e15356d drivers/acpi/sleep.c      Chu Guangqing         2025-11-25  650  	 * prevent them from producing spurious interrupts.
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  651  	 *
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  652  	 * acpi_leave_sleep_state() will reenable specific GPEs later.
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  653  	 *
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  654  	 * Because this code runs on one CPU with disabled interrupts (all of
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  655  	 * the other CPUs are offline at this time), it need not acquire any
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  656  	 * sleeping locks which may trigger an implicit preemption point even
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  657  	 * if there is no contention, so avoid doing that by using a low-level
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  658  	 * library routine here.
a3627f67b1d5dd drivers/acpi/sleep/main.c Shaohua Li            2007-06-20  659  	 */
22db06337f590d drivers/acpi/sleep.c      Rafael J. Wysocki     2023-06-14  660  	acpi_hw_disable_all_gpes();
d5a64513c6a171 drivers/acpi/sleep.c      Rafael J. Wysocki     2010-04-09  661  	/* Allow EC transactions to happen. */
c2b46d679b30c5 drivers/acpi/sleep.c      Lv Zheng              2016-08-03  662  	acpi_ec_unblock_transactions();
a3627f67b1d5dd drivers/acpi/sleep/main.c Shaohua Li            2007-06-20  663  
2a6b69765ad794 drivers/acpi/sleep.c      Matthew Garrett       2010-05-28  664  	suspend_nvs_restore();
2a6b69765ad794 drivers/acpi/sleep.c      Matthew Garrett       2010-05-28  665  
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  666  	return ACPI_SUCCESS(status) ? 0 : -EFAULT;
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  667  }
^1da177e4c3f41 drivers/acpi/sleep/main.c Linus Torvalds        2005-04-16  668  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
