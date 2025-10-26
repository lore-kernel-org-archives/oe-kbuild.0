Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8935B15F
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761478024; cv=none; b=V4FcKB6Oix+m/syqhSyxpUCOCRPYW2k4vmxQ3q13g5DC3CJ052bLZv2gqrbxxRvw0RvV2NzJIqULcciJz1agDlDImDPZRd4c9CWeKN4tDGJQPjd+48XhDAGEJaRXSSIH56B+VruSER61URSUdVKBe/xUYY8/ZCwH8QZY6t7Tdn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761478024; c=relaxed/simple;
	bh=RP8Gxfa4UXm87wP5juKjf0vzPk+SKbNaJFVAjgSxq9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8LLiQGPk7iHR3cY/8jb4jcD4UyuaYmID2LiuE0wBH9oHsjDwUXyS4M01Dsz55EK9tKmDSklGchCXcAzctMHT5ZkV/6VB1EkoMHAsC1oyUA7OBngi444zoZnXeUTWi9//bVx1pzhkyS8LCCmEZ7E7cT0gYmrb0F1u1ql7OXBDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSP1DFJ5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSP1DFJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761478022; x=1793014022;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RP8Gxfa4UXm87wP5juKjf0vzPk+SKbNaJFVAjgSxq9U=;
  b=jSP1DFJ5OEOJ0jMvswNOlM/PvegwthSTSuf8yg4pBWH1IUrmiVf5SLo2
   g1pWJG2S+4ePsTOh7i/SZgrBv78SRlUjk5FmrV0QgZtdLZjxAoxl38LK7
   fFJ5Jwu+4Ra9mx4sJ54XIXoM3hEbsFvAs2ERcUoDFmpVli9EazPyuJH0g
   a4hW0k1BeSIKkiFd/uqDvfF9dCnnwnKICk9QMlvL9/6JjgZ6Y1tx1xeVD
   P5yaUZB1UqmqGCWOAzv0b1ZFrkhHuS8WC8QmSc3PEVbxy2VckEbBlV9fS
   DP08UugXcJuXw0eEc8YniYlpdk/nK5JcR+JSU2F7Nat2y0qk4pQxgS3be
   g==;
X-CSE-ConnectionGUID: XNAhMgxKQLSU4Mr25ZJ3ow==
X-CSE-MsgGUID: izaCXVJiQBGI5qZwfXKiOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63622932"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63622932"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 04:27:01 -0700
X-CSE-ConnectionGUID: l7NehNMcQ5G7dGqg7DbW+g==
X-CSE-MsgGUID: 9yNNz7KfQ3yelevCvEBBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="188857996"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2025 04:27:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCytl-000G4z-2y;
	Sun, 26 Oct 2025 11:26:57 +0000
Date: Sun, 26 Oct 2025 19:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
Message-ID: <202510261909.eTmjHfiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/platform/x86/asus-wmi.c:1623:22: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251018101759.4089-6-lkml@antheas.dev>
References: <20251018101759.4089-6-lkml@antheas.dev>
TO: Antheas Kapenekakis <lkml@antheas.dev>
TO: platform-driver-x86@vger.kernel.org
TO: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <bentiss@kernel.org>
CC: Corentin Chary <corentin.chary@gmail.com>
CC: "Luke D . Jones" <luke@ljones.dev>
CC: Hans de Goede <hdegoede@redhat.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <benato.denis96@gmail.com>
CC: Antheas Kapenekakis <lkml@antheas.dev>

Hi Antheas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-simplify-RGB-init-sequence/20251018-182410
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251018101759.4089-6-lkml%40antheas.dev
patch subject: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-121-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261909.eTmjHfiY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261909.eTmjHfiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261909.eTmjHfiY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/platform/x86/asus-wmi.c:2650:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/platform/x86/asus-wmi.c:2650:33: sparse:     expected unsigned int [usertype] val
   drivers/platform/x86/asus-wmi.c:2650:33: sparse:     got restricted __le32 [usertype]
   drivers/platform/x86/asus-wmi.c:1573:9: sparse: sparse: context imbalance in 'asus_hid_register_listener' - wrong count at exit
   drivers/platform/x86/asus-wmi.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:237:25: sparse: sparse: context imbalance in 'asus_hid_unregister_listener' - wrong count at exit
>> drivers/platform/x86/asus-wmi.c:1623:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/platform/x86/asus-wmi.c:1601:25: sparse: signed value source

vim +1623 drivers/platform/x86/asus-wmi.c

6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1589  
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1590  static void kbd_led_update_all(struct work_struct *work)
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1591  {
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1592  	enum led_brightness value;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1593  	struct asus_wmi *asus;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1594  	bool registered, notify;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1595  	int ret;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1596  
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1597  	asus = container_of(work, struct asus_wmi, kbd_led_work);
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1598  
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1599  	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1600  		registered = asus->kbd_led_registered;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1601  		value = asus->kbd_led_wk;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1602  		notify = asus->kbd_led_notify;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1603  	}
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1604  
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1605  	if (!registered) {
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1606  		/*
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1607  		 * This workqueue runs under asus-wmi, which means probe has
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1608  		 * completed and asus-wmi will keep running until it finishes.
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1609  		 * Therefore, we can safely register the LED without holding
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1610  		 * a spinlock.
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1611  		 */
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1612  		ret = devm_led_classdev_register(&asus->platform_device->dev,
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1613  					    &asus->kbd_led);
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1614  		if (!ret) {
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1615  			scoped_guard(spinlock_irqsave, &asus_ref.lock)
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1616  				asus->kbd_led_registered = true;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1617  		} else {
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1618  			pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1619  			return;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1620  		}
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1621  	}
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1622  
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18 @1623  	if (value >= 0)
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1624  		do_kbd_led_set(&asus->kbd_led, value);
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1625  	if (notify) {
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1626  		scoped_guard(spinlock_irqsave, &asus_ref.lock)
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1627  			asus->kbd_led_notify = false;
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1628  		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1629  	}
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1630  }
6aed4b131ba1d1 Antheas Kapenekakis 2025-10-18  1631  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
