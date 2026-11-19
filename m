Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057930;
	b=jp0EugeakeBI9OiWKb/80cxYijlg4r22sEozF2zbjOnbYW3oKYscBpFhdu9eEfzLgcwp
	 +OSivbZOXXxy1M+a0xnz5gKRZdTeECobO1JEUSrbKtP+7i2wF7ag6bdjb9UoP7o1/p7VI
	 IZ+jHI1AWHIXezRsbn844j8xlqz/gWKjoVSdt1N3qFExGnNdlfKunppDeQy2kXIqLm3FV
	 ovIR+SgIk05dIWQBTf4xteiuNd0JE8Qii3ivmT8Jg6t47sCtZwfNhhki5c/GkLArv5h85
	 JIRN/eqWWrcskV/pdWjfkUN1ZoAQkLf/dgNl/NL2vGw8MpMsx3nT9VXvEqvjsTFWYiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057930;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u1NGveBgCiJHKpM9csyMOra4dIKjLODHnphRcInqlh0=;
	b=yF6L7LLx1a1SGZEiE7c/SLna7elrWP81Esbb8H2MK8oEm5Yyg7wbfzrAk5itBikC4xF0
	 IygpHSi3bJkRU14tVAo8EqnQRvtolqu1hZgntm/iox6sdxcy7J3yg+rqCUe6LOuEN0wgh
	 KnBy8sW2JfJfb25KGpzPOnWQZOSGlaUG65vkR13gZfUHKbCroKFIVoUzatHlfD78AxcYp
	 VXtaxVzbZEk6nnS/M6kRLDB5TIrpr7VGcgwy63MTn8qKhdCcFSNFjuGIKCE4cQiyZWV8U
	 WmIDyXHcMhp+92VvUd5hKRlOc+oIqGKGI1g/A6ic6h+6IVJVzx35UaF9xv4elAHVQRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Yr+Nl/cx";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD904606A325
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 03:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD904606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yr+Nl/cx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795057930; x=1826593930;
  h=date:from:to:cc:subject:message-id;
  bh=QX/w3ZogtqDqPblWqyLJSvNQnPo5c91pCSgbBsGXuuY=;
  b=Yr+Nl/cxSLg73Xlgcz6hWUmBLP+jOY2OZac5pI3oxIvxgqW9jOSGX/xV
   IViYSWDAR/xs+z1Bh/rTtWrF6J8pxyYI1VMocoxXb6MD52j3H92KjgB5Z
   kx0tnHwy7E8W2FOXRuVIbjEc3gFf5EWgN1VZj86bpG4N0nm+t25D1MQ5y
   uznujjRExOTT/QGI+US/PB6NNHzL8sMdNc0I3SaV8WiJyqGgr0nAPTkAy
   SNmCD61B9nj22MyJuv8eOe5QV+9UY9Lh7gGmt9x5IiFpCZlF7KFsIBXCF
   p+oW2mVOfk/gEQq3c5vCwrdd6qX4aoIMyJgm+JA11TwzUoRCBfOd11l2X
   Q==;
X-CSE-ConnectionGUID: 3wtGYuXJQhqoEctdvnNBTw==
X-CSE-MsgGUID: LWe22nB3Q7Gy2EWnD1tqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3932695"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3932695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:12:09 -0800
X-CSE-ConnectionGUID: ODnZfJxDS4Oo8c6NgXHdNA==
X-CSE-MsgGUID: Mnr2wjrzSdKul8V+25fIMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10242405"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2026 19:12:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTsZB-000000003bt-3tXR;
	Thu, 19 Nov 2026 03:12:05 +0000
Date: Thu, 19 Nov 2026 04:11:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 272/460]
 include/linux/spi/spi.h:284:1: error: attributes should be specified before
 the declarator in a function definition
Message-ID: <20261119040205.imXaG5Cp-lkp@intel.com>
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
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261119/20261119040205.imXaG5Cp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119040205.imXaG5Cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119040205.imXaG5Cp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-ds3232.c:16:
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
   In file included from drivers/rtc/rtc-rx4581.c:31:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/rtc/rtc-rx4581.c: In function 'rx4581_set_reg':
>> drivers/rtc/rtc-rx4581.c:69:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Wimplicit-function-declaration]
      69 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_acpi_device
>> drivers/rtc/rtc-rx4581.c:69:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/rtc/rtc-rx4581.c: In function 'rx4581_get_reg':
   drivers/rtc/rtc-rx4581.c:82:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      82 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   drivers/rtc/rtc-rx4581.c: In function 'rx4581_get_datetime':
   drivers/rtc/rtc-rx4581.c:96:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      96 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   drivers/rtc/rtc-rx4581.c: In function 'rx4581_set_datetime':
   drivers/rtc/rtc-rx4581.c:172:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     172 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
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
>> drivers/spi/spi.c:53:40: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Wimplicit-function-declaration]
      53 |         struct spi_device       *spi = to_spi_device(dev);
         |                                        ^~~~~~~~~~~~~
         |                                        to_acpi_device
>> drivers/spi/spi.c:53:40: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/spi/spi.c: In function 'modalias_show':
>> drivers/spi/spi.c:63:40: error: initialization of 'const struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      63 |         const struct spi_device *spi = to_spi_device(dev);
         |                                        ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_device_messages_show':
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:154:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/spi/spi.c:560:40: error: initialization of 'const struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     560 |         const struct spi_device *spi = to_spi_device(dev);
         |                                        ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_uevent':
   drivers/spi/spi.c:585:48: error: initialization of 'const struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     585 |         const struct spi_device         *spi = to_spi_device(dev);
         |                                                ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_probe':
   drivers/spi/spi.c:598:48: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     598 |         struct spi_device               *spi = to_spi_device(dev);
         |                                                ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function 'spi_remove':
>> drivers/spi/spi.c:631:30: error: passing argument 1 of 'sdrv->remove' makes pointer from integer without a cast [-Wint-conversion]
     631 |                 sdrv->remove(to_spi_device(dev));
         |                              ^~~~~~~~~~~~~~~~~~
         |                              |
         |                              int
   drivers/spi/spi.c:631:30: note: expected 'struct spi_device *' but argument is of type 'int'
   drivers/spi/spi.c: In function 'spi_shutdown':
>> drivers/spi/spi.c:640:40: error: passing argument 1 of 'sdrv->shutdown' makes pointer from integer without a cast [-Wint-conversion]
     640 |                         sdrv->shutdown(to_spi_device(dev));
         |                                        ^~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        int
   drivers/spi/spi.c:640:40: note: expected 'struct spi_device *' but argument is of type 'int'
   drivers/spi/spi.c: In function 'spi_dev_check':
   drivers/spi/spi.c:836:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     836 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   drivers/spi/spi.c: In function '__unregister':
>> drivers/spi/spi.c:3870:31: error: passing argument 1 of 'spi_unregister_device' makes pointer from integer without a cast [-Wint-conversion]
    3870 |         spi_unregister_device(to_spi_device(dev));
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   drivers/spi/spi.c:1069:47: note: expected 'struct spi_device *' but argument is of type 'int'
    1069 | void spi_unregister_device(struct spi_device *spi)
         |                            ~~~~~~~~~~~~~~~~~~~^~~
   drivers/spi/spi.c: In function 'acpi_spi_find_device_by_adev':
>> drivers/spi/spi.c:5359:16: error: returning 'int' from a function with return type 'struct spi_device *' makes pointer from integer without a cast [-Wint-conversion]
    5359 |         return to_spi_device(dev);
         |                ^~~~~~~~~~~~~~~~~~
--
   In file included from sound/soc/codecs/cs35l56-shared.c:20:
>> include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   sound/soc/codecs/cs35l56-shared.c: In function 'cs35l56_spi_system_reset':
>> sound/soc/codecs/cs35l56-shared.c:515:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_acpi_device'? [-Wimplicit-function-declaration]
     515 |         struct spi_device *spi = to_spi_device(cs35l56_base->dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_acpi_device
>> sound/soc/codecs/cs35l56-shared.c:515:34: error: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
..


vim +284 include/linux/spi/spi.h

8ae12a0d85987dc David Brownell  2006-01-08  279  
d962608ce2188a1 Dragos Bogdan   2020-12-21  280  /* Make sure that SPI_MODE_KERNEL_MASK & SPI_MODE_USER_MASK don't overlap */
d962608ce2188a1 Dragos Bogdan   2020-12-21  281  static_assert((SPI_MODE_KERNEL_MASK & SPI_MODE_USER_MASK) == 0,
d962608ce2188a1 Dragos Bogdan   2020-12-21  282  	      "SPI_MODE_USER_MASK & SPI_MODE_KERNEL_MASK must not overlap");
d962608ce2188a1 Dragos Bogdan   2020-12-21  283  
b92d6bdb8a97a9e Bart Van Assche 2026-11-15 @284  static inline struct spi_device *to_spi_device(struct device *dev)
b92d6bdb8a97a9e Bart Van Assche 2026-11-15  285  	__attribute__((overloadable))
b92d6bdb8a97a9e Bart Van Assche 2026-11-15  286  {
b92d6bdb8a97a9e Bart Van Assche 2026-11-15  287  	return container_of(dev, struct spi_device, dev);
b92d6bdb8a97a9e Bart Van Assche 2026-11-15  288  }
b92d6bdb8a97a9e Bart Van Assche 2026-11-15  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
