Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051019;
	b=EnpHV5iSLM2d6dc2RWdcyleWlkFWdCc1iNW2hhtGNY1AzVRCecrIjKJDL/8DDaj29zoN
	 n7fNmHxQkCdg54u9yYx67RLCtiBEIgtRT+XAOen/wg7PL4XCaApkGPrXNX6/1RHBzw6D5
	 Xo7oOip23Y5k9L+ASqvJA4qmRx7XfPVBYkrBH39XskrgylqjN4aQKA5dB87nofK0OgB97
	 xlqZlL9UbIWy+Q0mbMTIDCgQm/rj+/SKwumBezBn1RmO+3rFkRdBM87S9evgVR8AlWniE
	 NulkVrgzvSoqnHc0M4kB80RIy3Jqm3Gg1jaJHAL2Yf1i3ddERijiX4jFh+fo0YZ0cmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051019;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+PNHSBcn4rGinlAOotuh2otgDwHr2SSknGF1eRglpTI=;
	b=hFEJDsG4svDUwwr80ZfhS7r3NFI6m0G/U/OqS1OD5hXMVSQHE0mNdWrjWZeA27nXotzI
	 y/S1neb/PI48tDf4Q1fxavMpZFgJYjGq6QJzoolMFF2z6AlSbk0XsD2M1G0TisXyQsPsc
	 N41Qc5VLirpaCWNE6Cf4cK8SQe221gNfmAH19gdiwcmSd/efaJgor5i7coBonrohZyJ0t
	 JiLHn5SbVnxdOgtMd6M3QhwMe5NYPdoOqU2k8m788ucnCdCoC1/WKv2kHDkK4up407QWO
	 zqkQYUnXGkG0vDKIkN4l81Dc45YFzbQjSVj+pFv7t/CX3kVwM0X0QPvq87QDcs6AjZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DP1Ca8H2;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A6606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 01:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079A6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DP1Ca8H2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051019; x=1826587019;
  h=date:from:to:cc:subject:message-id;
  bh=olqPI1X2fNJgZNTpF/2r0o607TJvPxAdxwXcTxZyihw=;
  b=DP1Ca8H2nrPju+vV5OR6UCwevSh0RRL6iA3rBiQFM1LLIdIjovdwyR1h
   zQBTVa1V2afKe2k/k0qgyvJPP+F5vyh4n+WY2jrTtaas1p8t8NLJDEXeJ
   ZL5iwpTMQsdgeaoHq6BW2oRnfFk+xZ8ia6+clSQT5wYV48oZtjJQy+VXB
   3N3pCt3yZDxBfaFdmieoZ2YuF1mn2K1PdUlp4EMrq5Sr5Y4TY2HcoO8+q
   JHrgH1sBJKvcZAuzNG5Q81gEKiD1fsO95vszs/378JuT6xlQdlWq16y8X
   vvbnxzxCiR5IKebx2VUjBQinjyD1fTZjd1smeQQeZ0aNTLpx1U+fltSjp
   A==;
X-CSE-ConnectionGUID: W8nhq9OdTrW6aJLh3oXvQg==
X-CSE-MsgGUID: 9pubt/J0R8yEjN98rpcXtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3904545"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3904545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:16:57 -0800
X-CSE-ConnectionGUID: doLH4CeDQgKx/eiNZ4wtMg==
X-CSE-MsgGUID: NdMy2E40TomuNmig08Qz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10333078"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2026 17:16:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqlg-000000003ZL-1t0K;
	Thu, 19 Nov 2026 01:16:52 +0000
Date: Thu, 19 Nov 2026 02:16:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 272/460]
 include/linux/spi/spi.h:284:1: error: attributes should be specified before
 the declarator in a function definition
Message-ID: <20261119020747.MyvHiLUM-lkp@intel.com>
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
config: i386-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119020747.MyvHiLUM-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119020747.MyvHiLUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119020747.MyvHiLUM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/mux/adgs1408.c:12:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/mux/adgs1408.c: In function 'adgs1408_set':
>> drivers/mux/adgs1408.c:37:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Werror=implicit-function-declaration]
      37 |         struct spi_device *spi = to_spi_device(mux->chip->dev.parent);
         |                                  ^~~~~~~~~~~~~
         |                                  to_acpi_device
>> drivers/mux/adgs1408.c:37:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpio/gpio-pisosr.c:14:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
--
   In file included from drivers/gpio/gpio-max3191x.c:39:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/gpio/gpio-max3191x.c: In function 'max3191x_readout_locked':
>> drivers/gpio/gpio-max3191x.c:114:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Werror=implicit-function-declaration]
     114 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_acpi_device
>> drivers/gpio/gpio-max3191x.c:114:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpio/gpio-max7301.c:15:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/gpio/gpio-max7301.c: In function 'max7301_spi_write':
>> drivers/gpio/gpio-max7301.c:22:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Werror=implicit-function-declaration]
      22 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_acpi_device
>> drivers/gpio/gpio-max7301.c:22:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/gpio/gpio-max7301.c: In function 'max7301_spi_read':
   drivers/gpio/gpio-max7301.c:34:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      34 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/bus/moxtet.c:18:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/bus/moxtet.c: In function 'moxtet_find_topology':
>> drivers/bus/moxtet.c:341:24: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Werror=implicit-function-declaration]
     341 |         ret = spi_read(to_spi_device(moxtet->dev), buf, TURRIS_MOX_MAX_MODULES);
         |                        ^~~~~~~~~~~~~
         |                        to_acpi_device
>> drivers/bus/moxtet.c:341:24: warning: passing argument 1 of 'spi_read' makes pointer from integer without a cast [-Wint-conversion]
     341 |         ret = spi_read(to_spi_device(moxtet->dev), buf, TURRIS_MOX_MAX_MODULES);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        int
   include/linux/spi/spi.h:1583:29: note: expected 'struct spi_device *' but argument is of type 'int'
    1583 | spi_read(struct spi_device *spi, void *buf, size_t len)
         |          ~~~~~~~~~~~~~~~~~~~^~~
   drivers/bus/moxtet.c: In function 'moxtet_spi_read':
>> drivers/bus/moxtet.c:397:33: warning: passing argument 1 of 'spi_sync_transfer' makes pointer from integer without a cast [-Wint-conversion]
     397 |         ret = spi_sync_transfer(to_spi_device(moxtet->dev), &xfer, 1);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/spi/spi.h:1537:38: note: expected 'struct spi_device *' but argument is of type 'int'
    1537 | spi_sync_transfer(struct spi_device *spi, struct spi_transfer *xfers,
         |                   ~~~~~~~~~~~~~~~~~~~^~~
   drivers/bus/moxtet.c: In function 'moxtet_device_write':
>> drivers/bus/moxtet.c:435:25: warning: passing argument 1 of 'spi_write' makes pointer from integer without a cast [-Wint-conversion]
     435 |         ret = spi_write(to_spi_device(moxtet->dev), moxtet->tx,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   include/linux/spi/spi.h:1560:30: note: expected 'struct spi_device *' but argument is of type 'int'
    1560 | spi_write(struct spi_device *spi, const void *buf, size_t len)
         |           ~~~~~~~~~~~~~~~~~~~^~~
   drivers/bus/moxtet.c: In function 'output_write':
   drivers/bus/moxtet.c:539:25: warning: passing argument 1 of 'spi_write' makes pointer from integer without a cast [-Wint-conversion]
     539 |         err = spi_write(to_spi_device(moxtet->dev), moxtet->tx,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   include/linux/spi/spi.h:1560:30: note: expected 'struct spi_device *' but argument is of type 'int'
    1560 | spi_write(struct spi_device *spi, const void *buf, size_t len)
         |           ~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/spi/spi.c:35:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/spi/spi.c: In function 'spidev_release':
>> drivers/spi/spi.c:53:40: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Werror=implicit-function-declaration]
      53 |         struct spi_device       *spi = to_spi_device(dev);
         |                                        ^~~~~~~~~~~~~
         |                                        to_acpi_device
>> drivers/spi/spi.c:53:40: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/spi/spi.c: In function 'modalias_show':
>> drivers/spi/spi.c:63:40: warning: initialization of 'const struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      63 |         const struct spi_device *spi = to_spi_device(dev);
         |                                        ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_messages_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:175:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     175 | SPI_STATISTICS_SHOW(messages);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfers_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:176:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     176 | SPI_STATISTICS_SHOW(transfers);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_errors_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:177:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     177 | SPI_STATISTICS_SHOW(errors);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_timedout_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:178:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     178 | SPI_STATISTICS_SHOW(timedout);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_spi_sync_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:180:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     180 | SPI_STATISTICS_SHOW(spi_sync);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_spi_sync_immediate_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:181:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     181 | SPI_STATISTICS_SHOW(spi_sync_immediate);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_spi_async_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:182:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     182 | SPI_STATISTICS_SHOW(spi_async);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_bytes_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
--
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:189:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     189 |         SPI_STATISTICS_SHOW_NAME(transfer_bytes_histo##index,           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:203:1: note: in expansion of macro 'SPI_STATISTICS_TRANSFER_BYTES_HISTO'
     203 | SPI_STATISTICS_TRANSFER_BYTES_HISTO(11, "2048-4095");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfer_bytes_histo12_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:189:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     189 |         SPI_STATISTICS_SHOW_NAME(transfer_bytes_histo##index,           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:204:1: note: in expansion of macro 'SPI_STATISTICS_TRANSFER_BYTES_HISTO'
     204 | SPI_STATISTICS_TRANSFER_BYTES_HISTO(12, "4096-8191");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfer_bytes_histo13_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:189:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     189 |         SPI_STATISTICS_SHOW_NAME(transfer_bytes_histo##index,           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:205:1: note: in expansion of macro 'SPI_STATISTICS_TRANSFER_BYTES_HISTO'
     205 | SPI_STATISTICS_TRANSFER_BYTES_HISTO(13, "8192-16383");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfer_bytes_histo14_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:189:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     189 |         SPI_STATISTICS_SHOW_NAME(transfer_bytes_histo##index,           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:206:1: note: in expansion of macro 'SPI_STATISTICS_TRANSFER_BYTES_HISTO'
     206 | SPI_STATISTICS_TRANSFER_BYTES_HISTO(14, "16384-32767");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfer_bytes_histo15_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:189:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     189 |         SPI_STATISTICS_SHOW_NAME(transfer_bytes_histo##index,           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:207:1: note: in expansion of macro 'SPI_STATISTICS_TRANSFER_BYTES_HISTO'
     207 | SPI_STATISTICS_TRANSFER_BYTES_HISTO(15, "32768-65535");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfer_bytes_histo16_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:189:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     189 |         SPI_STATISTICS_SHOW_NAME(transfer_bytes_histo##index,           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:208:1: note: in expansion of macro 'SPI_STATISTICS_TRANSFER_BYTES_HISTO'
     208 | SPI_STATISTICS_TRANSFER_BYTES_HISTO(16, "65536+");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_transfers_split_maxsize_show':
   drivers/spi/spi.c:154:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |         struct spi_device *spi = to_spi_device(dev);                    \
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c:169:1: note: in expansion of macro 'SPI_STATISTICS_ATTRS'
     169 | SPI_STATISTICS_ATTRS(name, file)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:172:9: note: in expansion of macro 'SPI_STATISTICS_SHOW_NAME'
     172 |         SPI_STATISTICS_SHOW_NAME(field, __stringify(field),             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:210:1: note: in expansion of macro 'SPI_STATISTICS_SHOW'
     210 | SPI_STATISTICS_SHOW(transfers_split_maxsize);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_match_device':
   drivers/spi/spi.c:560:40: warning: initialization of 'const struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     560 |         const struct spi_device *spi = to_spi_device(dev);
         |                                        ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_uevent':
   drivers/spi/spi.c:585:48: warning: initialization of 'const struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     585 |         const struct spi_device         *spi = to_spi_device(dev);
         |                                                ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_probe':
   drivers/spi/spi.c:598:48: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     598 |         struct spi_device               *spi = to_spi_device(dev);
         |                                                ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_remove':
>> drivers/spi/spi.c:631:30: warning: passing argument 1 of 'sdrv->remove' makes pointer from integer without a cast [-Wint-conversion]
     631 |                 sdrv->remove(to_spi_device(dev));
         |                              ^~~~~~~~~~~~~~~~~~
         |                              |
         |                              int
   drivers/spi/spi.c:631:30: note: expected 'struct spi_device *' but argument is of type 'int'
   drivers/spi/spi.c: In function 'spi_shutdown':
>> drivers/spi/spi.c:640:40: warning: passing argument 1 of 'sdrv->shutdown' makes pointer from integer without a cast [-Wint-conversion]
     640 |                         sdrv->shutdown(to_spi_device(dev));
         |                                        ^~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        int
   drivers/spi/spi.c:640:40: note: expected 'struct spi_device *' but argument is of type 'int'
   drivers/spi/spi.c: In function 'spi_dev_check':
   drivers/spi/spi.c:836:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     836 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function '__unregister':
>> drivers/spi/spi.c:3870:31: warning: passing argument 1 of 'spi_unregister_device' makes pointer from integer without a cast [-Wint-conversion]
    3870 |         spi_unregister_device(to_spi_device(dev));
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   drivers/spi/spi.c:1069:47: note: expected 'struct spi_device *' but argument is of type 'int'
    1069 | void spi_unregister_device(struct spi_device *spi)
         |                            ~~~~~~~~~~~~~~~~~~~^~~
   drivers/spi/spi.c: In function 'of_find_spi_device_by_node':
>> drivers/spi/spi.c:5272:41: warning: pointer/integer type mismatch in conditional expression
    5272 |         return dev ? to_spi_device(dev) : NULL;
         |                                         ^
   drivers/spi/spi.c: In function 'acpi_spi_find_device_by_adev':
>> drivers/spi/spi.c:5359:16: warning: returning 'int' from a function with return type 'struct spi_device *' makes pointer from integer without a cast [-Wint-conversion]
    5359 |         return to_spi_device(dev);
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +284 include/linux/spi/spi.h

8ae12a0d85987d David Brownell  2006-01-08  279  
d962608ce2188a Dragos Bogdan   2020-12-21  280  /* Make sure that SPI_MODE_KERNEL_MASK & SPI_MODE_USER_MASK don't overlap */
d962608ce2188a Dragos Bogdan   2020-12-21  281  static_assert((SPI_MODE_KERNEL_MASK & SPI_MODE_USER_MASK) == 0,
d962608ce2188a Dragos Bogdan   2020-12-21  282  	      "SPI_MODE_USER_MASK & SPI_MODE_KERNEL_MASK must not overlap");
d962608ce2188a Dragos Bogdan   2020-12-21  283  
b92d6bdb8a97a9 Bart Van Assche 2026-11-15 @284  static inline struct spi_device *to_spi_device(struct device *dev)
b92d6bdb8a97a9 Bart Van Assche 2026-11-15  285  	__attribute__((overloadable))
b92d6bdb8a97a9 Bart Van Assche 2026-11-15  286  {
b92d6bdb8a97a9 Bart Van Assche 2026-11-15  287  	return container_of(dev, struct spi_device, dev);
b92d6bdb8a97a9 Bart Van Assche 2026-11-15  288  }
b92d6bdb8a97a9 Bart Van Assche 2026-11-15  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
