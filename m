Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6484A23
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 23:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718236343; cv=none; b=dL5wRM5luyuqE2RLFWV5rYEBB/4lcg/bcUhsHxVVEwZctZ2VP3jYrisgNTJLi8m0fW1fDj66Yw4El9wfJNInIvi9n9HyujR1qwfA0cC8opUSodfASJnPsnJe/9tbSe/zzhOznIvivKwi+lzjUrBq6SbywniRLA5OTgK4xqZdxXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718236343; c=relaxed/simple;
	bh=x/PVCeiUPV5A4W5cyXqaXThsvwpdDDuq7F0TWc65128=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AvIa+4y8AGIspfQPOuAwV1QAuHd/vsOzqxO5Bg77dQ/LLi+5UkeuSgXGrcylNht+xTuzVpgz0PyoV4OE/GNJonH6f44RAYLl9mimVwibYvfOyR5jYrplHY6j86KLrjcxvkxDP4SX9wkhC38OrV9wfrDCjYA5H4IbCQQKscxj1r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FD6tXmj2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FD6tXmj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718236341; x=1749772341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/PVCeiUPV5A4W5cyXqaXThsvwpdDDuq7F0TWc65128=;
  b=FD6tXmj2CZqx8/UPMcwHJUAmoqF61HBYn8RysMtS6E3dSqAIl6AkXHo7
   rkbrDZss9OFrarebAqnSY1rDWENgDi0MhknMRJpKgBaWPcjLfRcBvnXKJ
   w1cUdH5fXZzSwbIIcx+gccV4VLkVZoHwpnAq7aVGExM5Db6tw363xMUZV
   xx6VLpEQRRI760mySxe4DZ8Dw07a1gxaDP8Ky3tNdrOwMsrZuZRkP+VHK
   uBdGN0z1ILNbEXELOJAfdkHvCARAEHchn1Br5Qj0WlV1rvxRJ31ZPU8bO
   GgsTWhEGM3VpzcjKX4LMXdgSjGfWfTujYA8ARa/J4Juk/V2FhoNfVJeJb
   Q==;
X-CSE-ConnectionGUID: k6BMq6hlQvSYkie13G2riQ==
X-CSE-MsgGUID: vZaTS702Qwm7GXo225HNIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26143570"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="26143570"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 16:52:20 -0700
X-CSE-ConnectionGUID: ho51lrWfQ6y56Q3NGg18tg==
X-CSE-MsgGUID: ebvDOHsKSYSAt7TcTmm+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40018314"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2024 16:52:17 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHXlH-00021K-26;
	Wed, 12 Jun 2024 23:52:15 +0000
Date: Thu, 13 Jun 2024 07:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [driver-core:const_driver 12/12] drivers/usb/core/driver.c:80
 store_id() error: uninitialized symbol 'usb_dynid'.
Message-ID: <202406130740.HIr25kIC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   be520b87ec28aa3b5c908a859501fb601bd8b322
commit: be520b87ec28aa3b5c908a859501fb601bd8b322 [12/12] USB: move dynamic ids out of usb driver structures
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240613 (https://download.01.org/0day-ci/archive/20240613/202406130740.HIr25kIC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406130740.HIr25kIC-lkp@intel.com/

smatch warnings:
drivers/usb/core/driver.c:80 store_id() error: uninitialized symbol 'usb_dynid'.

vim +/usb_dynid +80 drivers/usb/core/driver.c

be520b87ec28aa Greg Kroah-Hartman 2024-06-11  69  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  70  static int store_id(const struct device_driver *driver, const struct usb_device_id *id)
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  71  {
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  72  	struct usb_dynids *u;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  73  	struct usb_dynid *usb_dynid;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  74  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  75  	u = usb_find_dynids(driver);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  76  	if (!u) {
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  77  		/* This driver has not stored any ids yet, so make a new entry for it */
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  78  		u = kmalloc(sizeof(*u), GFP_KERNEL);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  79  		if (!u) {
be520b87ec28aa Greg Kroah-Hartman 2024-06-11 @80  			kfree(usb_dynid);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  81  			return -ENOMEM;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  82  		}
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  83  		u->driver = driver;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  84  		INIT_LIST_HEAD(&u->list);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  85  		guard(spinlock)(&usb_dynids_lock);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  86  		list_add_tail(&u->node, &usb_dynids);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  87  	}
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  88  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  89  	/* Allocate a new entry and add it to the list of driver ids for this driver */
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  90  	usb_dynid = kmalloc(sizeof(*usb_dynid), GFP_KERNEL);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  91  	if (!usb_dynid)
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  92  		return -ENOMEM;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  93  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  94  	INIT_LIST_HEAD(&usb_dynid->node);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  95  	memcpy(&usb_dynid->id, id, sizeof(*id));
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  96  	list_add_tail(&usb_dynid->node, &u->list);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  97  	return 0;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  98  }
20dfdad74a2baa Alan Stern         2007-05-22  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
