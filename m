Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051017;
	b=G+3k17lBqoWWhMwQeS2ERTKzH+FTZuSbGHWEVAcwy62Xi92n+6CHdJFQPRTRaFRSmqJT
	 PBp7AFc+QUhVdt08eF59W405cNJBCUiemz5k73+J7UjnStFcdk7gDU5iY0+b8T3QJfe8x
	 r50vL5r8hnsdFnDYV5sFOArxD2u09ktbDg4IOPRBDsnvhq2hcawaZ+YHRsn/zHsrbqsvd
	 dBo4WX46VXreKjI8Dt41jtM9wuRbiFEfGBqfCNDaAb1RbJAmy7Hny4rgo4mJt2jvcdjoh
	 i/M/E2Nf4WgC1pd7RRnbdCM1ecmyMwxM9yjFEToA/xe8466rW7Da135ayYGKwwrsaqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051017;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ASAo4C/KkDKpN2Fpef2bp7wbIjUPDgpz2SHNkEdQ5eY=;
	b=wOi8+VD/VuxsbwVjzHUuBoTANmMBaRku594+xcmBXyKrxh2dS9XP0RxrDCssNJw3kwcA
	 Xo3/WSUOqkpTY22Iivy8eXupC5UM0SadquplJ3k4dIdI52uHkASck6YKZDeECNRUBmfse
	 iNYpt4cQmLtRf2Qx8Mmc/rhmwfcBWugZtEJugwshubdOrCQGOVI5QSuKryxRarkhXQZ18
	 Pnx5JwwHFUCqT/lWcaAjcdaXQ3XvhsWAfg/SJtBXKC7UuXLgTHmVibKro8NFbnmugPX92
	 rjcoAiK4RhB1qcOZWFhfMGAjKULkVaVvdE2UK5qxh14/Kd7IbMExkaOszFe6cXJPAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXbCIwD3;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF11606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 01:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXbCIwD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051017; x=1826587017;
  h=date:from:to:cc:subject:message-id;
  bh=GssfwhZ49glL7R3SCA6dOjrajQQQORY8uoq/d7JItlU=;
  b=BXbCIwD3y0ivkffixKKa9ZFUYlCrcWLlLS1C/mO5Xzjw6sl39hYoqzcK
   7D0exLMn+QVm0W5giGlxmEBFZWR7nIZDX+v/b6I/Df4KYEfRXOb5zoS7L
   7cPGmQ+dVA6c4i+V7M8F0v2SSfkIip6MqMCg6pTEWWbjJhDiyyRc6qmZZ
   ZGS6TcBnD8T7nw7Z5eiQIGHroZwm5QH1b1AemL//89GbhvJZjzuOLAEy1
   tGHvNpK82+lqyZPc5dVU6+eJSxkRmnVtL3fpFVtpDIhTjQrwio4tBvtnm
   mglp+QCKuO99XI+4DVx0vy3xCAgdJWvayZpT/38+H6T7I4yXym2zUDb+R
   g==;
X-CSE-ConnectionGUID: VG5du8gMQmK9ycoM3Jiy8g==
X-CSE-MsgGUID: sYWaz+o3S6GoHkMlG7pexQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3746106"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3746106"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:16:57 -0800
X-CSE-ConnectionGUID: Y63eMS13QDOmUopmydEE6g==
X-CSE-MsgGUID: BYuvqqksT3+21LMhqIO2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10683018"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 17:16:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqlg-000000003ZN-2SU3;
	Thu, 19 Nov 2026 01:16:52 +0000
Date: Thu, 19 Nov 2026 02:16:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 272/460]
 drivers/usb/host/max3421-hcd.c:344:34: error: initialization of 'struct
 spi_device *' from 'int' makes pointer from integer without a cast
Message-ID: <20261119021342.6rIvSt98-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   754c0efaaee1c85b67fd7f8a45f7be89900b661f
commit: b92d6bdb8a97a9e35c1baf80d282833e714e75de [272/460] spi: Convert to_spi_device() into an inline function
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-2000-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119021342.6rIvSt98-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119021342.6rIvSt98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119021342.6rIvSt98-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/host/max3421-hcd.c:61:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'spi_rd8':
   drivers/usb/host/max3421-hcd.c:344:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_usb_device'? [-Wimplicit-function-declaration]
     344 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
         |                                  to_usb_device
>> drivers/usb/host/max3421-hcd.c:344:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/usb/host/max3421-hcd.c: In function 'spi_wr8':
   drivers/usb/host/max3421-hcd.c:369:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     369 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'spi_rd_buf':
   drivers/usb/host/max3421-hcd.c:393:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     393 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'spi_wr_buf':
   drivers/usb/host/max3421-hcd.c:419:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     419 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_transfer_out':
   drivers/usb/host/max3421-hcd.c:525:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     525 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_select_and_start_urb':
   drivers/usb/host/max3421-hcd.c:631:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     631 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_check_unlink':
   drivers/usb/host/max3421-hcd.c:766:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     766 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_handle_error':
   drivers/usb/host/max3421-hcd.c:852:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     852 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_transfer_in_done':
   drivers/usb/host/max3421-hcd.c:941:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     941 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_irq_handler':
   drivers/usb/host/max3421-hcd.c:1136:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1136 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_reset_hcd':
   drivers/usb/host/max3421-hcd.c:1285:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1285 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_spi_thread':
   drivers/usb/host/max3421-hcd.c:1374:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1374 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_urb_enqueue':
   drivers/usb/host/max3421-hcd.c:1501:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1501 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_hub_control':
   drivers/usb/host/max3421-hcd.c:1674:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1674 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
--
   In file included from drivers/input/touchscreen/ads7846.c:29:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/touchscreen/ads7846.c: In function 'ads7846_read12_ser':
   drivers/input/touchscreen/ads7846.c:354:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Wimplicit-function-declaration]
     354 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/input/touchscreen/ads7846.c:354:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/input/touchscreen/ads7846.c: In function 'ads7845_read12_ser':
   drivers/input/touchscreen/ads7846.c:436:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     436 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
--
   In file included from drivers/input/touchscreen/tsc2005.c:15:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/touchscreen/tsc2005.c: In function 'tsc2005_cmd':
   drivers/input/touchscreen/tsc2005.c:33:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Wimplicit-function-declaration]
      33 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/input/touchscreen/tsc2005.c:33:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   In file included from drivers/misc/lis3lv02d/lis3lv02d_spi.c:14:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/misc/lis3lv02d/lis3lv02d_spi.c: In function 'lis3lv02d_spi_suspend':
   drivers/misc/lis3lv02d/lis3lv02d_spi.c:110:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Wimplicit-function-declaration]
     110 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/misc/lis3lv02d/lis3lv02d_spi.c:110:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/misc/lis3lv02d/lis3lv02d_spi.c: In function 'lis3lv02d_spi_resume':
   drivers/misc/lis3lv02d/lis3lv02d_spi.c:121:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~


vim +344 drivers/usb/host/max3421-hcd.c

2d53139f31626b David Mosberger      2014-04-28  339  
2d53139f31626b David Mosberger      2014-04-28  340  static u8
2d53139f31626b David Mosberger      2014-04-28  341  spi_rd8(struct usb_hcd *hcd, unsigned int reg)
2d53139f31626b David Mosberger      2014-04-28  342  {
05dfa5c9bc3793 David Mosberger-Tang 2014-05-28  343  	struct max3421_hcd *max3421_hcd = hcd_to_max3421(hcd);
2d53139f31626b David Mosberger      2014-04-28 @344  	struct spi_device *spi = to_spi_device(hcd->self.controller);
2d53139f31626b David Mosberger      2014-04-28  345  	struct spi_transfer transfer;
2d53139f31626b David Mosberger      2014-04-28  346  	struct spi_message msg;
2d53139f31626b David Mosberger      2014-04-28  347  
2d53139f31626b David Mosberger      2014-04-28  348  	memset(&transfer, 0, sizeof(transfer));
2d53139f31626b David Mosberger      2014-04-28  349  
2d53139f31626b David Mosberger      2014-04-28  350  	spi_message_init(&msg);
2d53139f31626b David Mosberger      2014-04-28  351  
05dfa5c9bc3793 David Mosberger-Tang 2014-05-28  352  	max3421_hcd->tx->data[0] =
05dfa5c9bc3793 David Mosberger-Tang 2014-05-28  353  		(field(reg, MAX3421_SPI_REG_SHIFT) |
2d53139f31626b David Mosberger      2014-04-28  354  		 field(MAX3421_SPI_DIR_RD, MAX3421_SPI_DIR_SHIFT));
2d53139f31626b David Mosberger      2014-04-28  355  
05dfa5c9bc3793 David Mosberger-Tang 2014-05-28  356  	transfer.tx_buf = max3421_hcd->tx->data;
05dfa5c9bc3793 David Mosberger-Tang 2014-05-28  357  	transfer.rx_buf = max3421_hcd->rx->data;
2d53139f31626b David Mosberger      2014-04-28  358  	transfer.len = 2;
2d53139f31626b David Mosberger      2014-04-28  359  
2d53139f31626b David Mosberger      2014-04-28  360  	spi_message_add_tail(&transfer, &msg);
2d53139f31626b David Mosberger      2014-04-28  361  	spi_sync(spi, &msg);
2d53139f31626b David Mosberger      2014-04-28  362  
05dfa5c9bc3793 David Mosberger-Tang 2014-05-28  363  	return max3421_hcd->rx->data[1];
2d53139f31626b David Mosberger      2014-04-28  364  }
2d53139f31626b David Mosberger      2014-04-28  365  

:::::: The code at line 344 was first introduced by commit
:::::: 2d53139f31626bad6f8983d8e519ddde2cbba921 Add support for using a MAX3421E chip as a host driver.

:::::: TO: David Mosberger <davidm@egauge.net>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
