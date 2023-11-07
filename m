Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE5328D5
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHlmdzny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699374628; x=1730910628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tIZdB2QAtg3Gs6LQ6jo2e2Y67kkuJGL6bnElEKSxBc=;
  b=gHlmdznyzV1stnik1JX6Dq6BwLweG3EuS5u8cT+OIsdKPRxr21oSqB84
   5nOQqsZETl1kCm8lKkyutMjOsCZutStgiqMl8i2Ua9nVQwgKNmJhTs0d7
   1RuZzvcdiiVEp/l0tkv/pUjvHSu7GjoHOKbm89jO6I8gF+zYDZo55zT8e
   cNS5EWnCJAC9SXVgBfIiWnEJjetxE7ukpqfH9HoCw7bkcD8Kg/5/or3LL
   ikQIrToRROqoMNe4K/hPrD9+xSFyWIie/8PxQ+lHdSXaoQBHHsmhBIpeA
   j7Twy/10MKM28dfLWuHyEK99t4sL9sgoWLoRXA5vWHlq5VDrydiddZWsy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="379942845"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="379942845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 08:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886346697"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="886346697"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Nov 2023 08:30:26 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Oy8-0007Dn-2Z;
	Tue, 07 Nov 2023 16:30:24 +0000
Date: Wed, 8 Nov 2023 00:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/greybus/gb-beagleplay.c:347:24: sparse: sparse: restricted
 __le16 degrades to integer
Message-ID: <202311072329.Xogj7hGW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ayush Singh <ayushdevel1325@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: ec558bbfea671ac020a6dc6be8bf8f0ee556cce0 greybus: Add BeaglePlay Linux Driver
date:   11 days ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-122-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072329.Xogj7hGW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072329.Xogj7hGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/greybus/gb-beagleplay.c:347:24: sparse: sparse: restricted __le16 degrades to integer

vim +347 drivers/greybus/gb-beagleplay.c

ec558bbfea671a Ayush Singh 2023-10-17  338  
ec558bbfea671a Ayush Singh 2023-10-17  339  static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
ec558bbfea671a Ayush Singh 2023-10-17  340  {
ec558bbfea671a Ayush Singh 2023-10-17  341  	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
ec558bbfea671a Ayush Singh 2023-10-17  342  	struct hdlc_payload payloads[2];
ec558bbfea671a Ayush Singh 2023-10-17  343  
ec558bbfea671a Ayush Singh 2023-10-17  344  	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
ec558bbfea671a Ayush Singh 2023-10-17  345  		msg->header->operation_id, msg->header->type, cport);
ec558bbfea671a Ayush Singh 2023-10-17  346  
ec558bbfea671a Ayush Singh 2023-10-17 @347  	if (msg->header->size > RX_HDLC_PAYLOAD)
ec558bbfea671a Ayush Singh 2023-10-17  348  		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
ec558bbfea671a Ayush Singh 2023-10-17  349  
ec558bbfea671a Ayush Singh 2023-10-17  350  	memcpy(msg->header->pad, &cport, sizeof(cport));
ec558bbfea671a Ayush Singh 2023-10-17  351  
ec558bbfea671a Ayush Singh 2023-10-17  352  	payloads[0].buf = msg->header;
ec558bbfea671a Ayush Singh 2023-10-17  353  	payloads[0].len = sizeof(*msg->header);
ec558bbfea671a Ayush Singh 2023-10-17  354  	payloads[1].buf = msg->payload;
ec558bbfea671a Ayush Singh 2023-10-17  355  	payloads[1].len = msg->payload_size;
ec558bbfea671a Ayush Singh 2023-10-17  356  
ec558bbfea671a Ayush Singh 2023-10-17  357  	hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 2);
ec558bbfea671a Ayush Singh 2023-10-17  358  	greybus_message_sent(bg->gb_hd, msg, 0);
ec558bbfea671a Ayush Singh 2023-10-17  359  
ec558bbfea671a Ayush Singh 2023-10-17  360  	return 0;
ec558bbfea671a Ayush Singh 2023-10-17  361  }
ec558bbfea671a Ayush Singh 2023-10-17  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
