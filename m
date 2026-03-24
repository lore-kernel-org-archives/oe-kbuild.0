Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7F283FCE
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 05:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329304; cv=none; b=hJL+huJGGnIF/VTLH2t+0X9KBNKdX8SfU0V7Tv53qgr8LTmHFN+ZfWxg1Ea3qy/G5GZmz3Fo4SzkUWbbgQ1VHQoOUCT43xw30mFc0VoB3P3rZndJfDAg32ItdU2JS3K7DdyE86uk07NLYKUkcaW3J8WV63XUHKgzqyEyITsQKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329304; c=relaxed/simple;
	bh=0Lgt+OYxtWEzaF8YfCcxzpt6e0O9CNNyL4ZLEUVgqnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m8ZyLCn22g9Fx5gZdi7UCkbKchxVnyarVsoPta1DhKpeHGfW3DSbAQkkkExtTnFqFRF/2ZBOLuakGEzQVxP2tra9u8SgKjR2XUOC2Cr596oMM69R1yl5goeA9gjNNiWyAVf3lLbxyWsYnZcRuR5+kPa8xU8yyBIHcpDsQ8tnQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIAc0gz/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIAc0gz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774329303; x=1805865303;
  h=date:from:to:cc:subject:message-id;
  bh=0Lgt+OYxtWEzaF8YfCcxzpt6e0O9CNNyL4ZLEUVgqnw=;
  b=iIAc0gz/ZH7RBC4hdtBRecxm+od8GLNLKnDxDSaeuCGp9IAvoiiXOHll
   vsnAd39x490AOoi2gl5uFyl27hB5fHz/lJ5pFlTsiazkoXq94iB7zl0sW
   LyOKRN4sbtlanYiHxVyUXqlwSYARoDefK8Fz31gfDu6CJ+VFoLUaPZm3Y
   P0Y2HI0kTwNRTTdObhANFYunU4SsKIJ/pFweZW0ytWXUCkLQMEenkBFqK
   3kBrh2/Y/0J2lrI6RMUtEALHNQYJsPtNOVPnMsK7R8NwPyjGYh/y/QA+I
   TqnAKkN0FVRrxbTr5KuIL/D40EMFXkrUPEvAYLlxH2xw+Z0L8L3enqe1s
   w==;
X-CSE-ConnectionGUID: x9COf7nDSKmWhODLj8iZNQ==
X-CSE-MsgGUID: 0dfPuZUMRpyLbtpqddc5SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75531359"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75531359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:15:02 -0700
X-CSE-ConnectionGUID: IdY6VkcQQLOp1pgPugWTyA==
X-CSE-MsgGUID: njZ8RvHcSh+SycVN3XTHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228994434"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 22:15:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4u6U-000000003sx-0nWz;
	Tue, 24 Mar 2026 05:14:58 +0000
Date: Tue, 24 Mar 2026 13:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/bluetooth/btusb.c:4575 btusb_resume() warn: missing
 error code 'err'
Message-ID: <202603241305.Xuqep3Hq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bastien Nocera <hadess@hadess.net>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Paul Menzel <pmenzel@molgen.mpg.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 56493c8166df7afff1da8f02bd7f6060df681f8b Bluetooth: btusb: Use pm_ptr instead of #ifdef CONFIG_PM
date:   8 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 8 weeks ago
config: sparc-randconfig-r071-20260323 (https://download.01.org/0day-ci/archive/20260324/202603241305.Xuqep3Hq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603241305.Xuqep3Hq-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btusb.c:4575 btusb_resume() warn: missing error code 'err'

vim +/err +4575 drivers/bluetooth/btusb.c

7bee549e197c9c Oliver Neukum   2009-08-24  4556  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4557  static int btusb_resume(struct usb_interface *intf)
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4558  {
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4559  	struct btusb_data *data = usb_get_intfdata(intf);
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4560  	struct hci_dev *hdev = data->hdev;
7bee549e197c9c Oliver Neukum   2009-08-24  4561  	int err = 0;
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4562  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4563  	BT_DBG("intf %p", intf);
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4564  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4565  	if (--data->suspend_count)
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4566  		return 0;
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4567  
fd913ef7ce6194 Rajat Jain      2017-02-01  4568  	/* Disable only if not already disabled (keep it balanced) */
fd913ef7ce6194 Rajat Jain      2017-02-01  4569  	if (test_and_clear_bit(BTUSB_OOB_WAKE_ENABLED, &data->flags)) {
fd913ef7ce6194 Rajat Jain      2017-02-01  4570  		disable_irq(data->oob_wake_irq);
fd913ef7ce6194 Rajat Jain      2017-02-01  4571  		disable_irq_wake(data->oob_wake_irq);
fd913ef7ce6194 Rajat Jain      2017-02-01  4572  	}
fd913ef7ce6194 Rajat Jain      2017-02-01  4573  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4574  	if (!test_bit(HCI_RUNNING, &hdev->flags))
7bee549e197c9c Oliver Neukum   2009-08-24 @4575  		goto done;
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4576  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4577  	if (test_bit(BTUSB_INTR_RUNNING, &data->flags)) {
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4578  		err = btusb_submit_intr_urb(hdev, GFP_NOIO);
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4579  		if (err < 0) {
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4580  			clear_bit(BTUSB_INTR_RUNNING, &data->flags);
7bee549e197c9c Oliver Neukum   2009-08-24  4581  			goto failed;
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4582  		}
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4583  	}
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4584  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4585  	if (test_bit(BTUSB_BULK_RUNNING, &data->flags)) {
43c2e57f94c157 Marcel Holtmann 2009-02-04  4586  		err = btusb_submit_bulk_urb(hdev, GFP_NOIO);
43c2e57f94c157 Marcel Holtmann 2009-02-04  4587  		if (err < 0) {
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4588  			clear_bit(BTUSB_BULK_RUNNING, &data->flags);
7bee549e197c9c Oliver Neukum   2009-08-24  4589  			goto failed;
7bee549e197c9c Oliver Neukum   2009-08-24  4590  		}
7bee549e197c9c Oliver Neukum   2009-08-24  4591  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4592  		btusb_submit_bulk_urb(hdev, GFP_NOIO);
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4593  	}
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4594  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4595  	if (test_bit(BTUSB_ISOC_RUNNING, &data->flags)) {
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4596  		if (btusb_submit_isoc_urb(hdev, GFP_NOIO) < 0)
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4597  			clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4598  		else
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4599  			btusb_submit_isoc_urb(hdev, GFP_NOIO);
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4600  	}
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4601  
95f92928ad2215 Chris Lu        2024-07-04  4602  	if (data->resume)
95f92928ad2215 Chris Lu        2024-07-04  4603  		data->resume(hdev);
95f92928ad2215 Chris Lu        2024-07-04  4604  
7bee549e197c9c Oliver Neukum   2009-08-24  4605  	spin_lock_irq(&data->txlock);
7bee549e197c9c Oliver Neukum   2009-08-24  4606  	play_deferred(data);
7bee549e197c9c Oliver Neukum   2009-08-24  4607  	clear_bit(BTUSB_SUSPENDING, &data->flags);
7bee549e197c9c Oliver Neukum   2009-08-24  4608  	spin_unlock_irq(&data->txlock);
7bee549e197c9c Oliver Neukum   2009-08-24  4609  	schedule_work(&data->work);
7bee549e197c9c Oliver Neukum   2009-08-24  4610  
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4611  	return 0;
7bee549e197c9c Oliver Neukum   2009-08-24  4612  
7bee549e197c9c Oliver Neukum   2009-08-24  4613  failed:
7bee549e197c9c Oliver Neukum   2009-08-24  4614  	usb_scuttle_anchored_urbs(&data->deferred);
7bee549e197c9c Oliver Neukum   2009-08-24  4615  done:
7bee549e197c9c Oliver Neukum   2009-08-24  4616  	spin_lock_irq(&data->txlock);
7bee549e197c9c Oliver Neukum   2009-08-24  4617  	clear_bit(BTUSB_SUSPENDING, &data->flags);
7bee549e197c9c Oliver Neukum   2009-08-24  4618  	spin_unlock_irq(&data->txlock);
7bee549e197c9c Oliver Neukum   2009-08-24  4619  
7bee549e197c9c Oliver Neukum   2009-08-24  4620  	return err;
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4621  }
6a88adf2adf5d6 Marcel Holtmann 2008-11-30  4622  

:::::: The code at line 4575 was first introduced by commit
:::::: 7bee549e197c9c0e92b89857a409675c1d5e9dff Bluetooth: Add USB autosuspend support to btusb driver

:::::: TO: Oliver Neukum <oliver@neukum.org>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
