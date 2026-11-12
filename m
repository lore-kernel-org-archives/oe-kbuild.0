Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484309;
	b=5qupWRzodKjJ6qnZuY8R7q7YQlqFgyyYygiLJCoidEhjPguHNg19oFTjcWtwteno5Mdq
	 xECTLF9M7Q7uWwnPpHdXTBtofkOndWyF6jkfWAf+gcC3D9W1XnjooyJAxO/9VNOYBPsUX
	 13kfclux4cjo4ys0btHFpPd9N8s5g7uA8U4nUiNIhLsEZ4fmXY/CYXlr7XL+5ZexLwzs1
	 2ms9XWaiS6l6o4RA+2UrF19x63fR77ogRKWHGyse0TnUKLXcMpbWfX51uoxvwiqAw5LcO
	 jfMXsXLxWTjXFyrmApW9Qjo6iNjvyOclyJh9b9d1joYd9daNt489SoOduTJjRSGZrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=dVuaUbQCYz0WXQDw4+Ha++h+nFHZ+MjlJxUxWA+FG1A=;
	b=i2fuZDk5TWTrYdqrRjtLzecQWFIu3g1Sgkzt8kJZt2Dv4CAvUOXkBb3isMj4zv7tZjfu
	 HAgUOxQyvz1uUFbKhGlTu5sSAtB8Ns5xRxWZKu9fnWC6aCAgvHhDJRsaimTSR94DBNxKY
	 rYNhQ9DULOsCBGdUk3VqJJjjG89GPj5zW/uxoK+Tq5Hu7MyDhyjaZH0AzUj9D26mkDwaZ
	 SQppxT9/avuklKW+5eHR6m45Y5MlEyVFzBkx5hlYxRSQ4374LHgSpsSpET2RmWajy4RuF
	 L7hsoVnLoCKxaQYliZaZxXNg4JcSdV5Hi8O/CwGsYDr/l2dCiRz0bjrSEKOmqNgaB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cjs44B9e;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E997606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 11:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E997606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cjs44B9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794484309; x=1826020309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bziLipEo9MQYDygzNyEKB8JYBuuyQgeyY1kf/99EUAw=;
  b=Cjs44B9eGNLE2QkqiNmGjzyL8WmW1jIdkZgMllVrRf5yZW0DMtE+CA8q
   ZZ4Gs0RDhwDsu3+cIGiidEC1F3gKDl1FUhU6uUM2nAtecg7jwLGclllPH
   m1AEdC7YgIgCM5Z4Fjd+3jV9bAQ+oPEl72l2+5rOGNl+Pf/BDv/BEE4j1
   DLZ5FNEizP/Dq86GuPGSdxpPiInQSM53s/gM1c5sVrNF4Ra1JLj8lEGEx
   S/fwyNE+NhTXXtkfbli6zCRRsmfyq+Sye8WA2iqdZCLjnLlH16iKN1Z/2
   UDk3Sd8RPXD3cCdVRvXNhSkjYbgmLSimmDcbG2jtv4RmjTV5nHItM7vgJ
   g==;
X-CSE-ConnectionGUID: zWUybwUwTcyhevJLzlaQyg==
X-CSE-MsgGUID: Q1NBfMbHTe2Z3+5iCuAcTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3298897"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3298897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:51:48 -0800
X-CSE-ConnectionGUID: W9SlgBn6RUSAnC/ycR7fmQ==
X-CSE-MsgGUID: aj3kyFfTRFmYPv1kjwvmKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8569503"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2026 03:51:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRTLE-000000011EZ-3JeO;
	Thu, 12 Nov 2026 11:51:44 +0000
Date: Thu, 12 Nov 2026 19:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 02/14] platform/x86: add backend for macsmc in intel
 macs
Message-ID: <202611121938.R4y5zvbW-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261029085504.3547-3-atharvatiwarilinuxdev@gmail.com>
References: <20261029085504.3547-3-atharvatiwarilinuxdev@gmail.com>
TO: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Hi Atharva,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on groeck-staging/hwmon groeck-staging/hwmon-next groeck-staging/watchdog groeck-staging/watchdog-next jic23-iio/togreg linus/master v7.4-rc2 next-20261111]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/treewide-Add-backend-for-macsmc/20261029-045158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20261029085504.3547-3-atharvatiwarilinuxdev%40gmail.com
patch subject: [RFC PATCH 02/14] platform/x86: add backend for macsmc in intel macs
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611121938.R4y5zvbW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121938.R4y5zvbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611121938.R4y5zvbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from drivers/platform/x86/macsmc-acpi.c:11:
   drivers/platform/x86/macsmc-acpi.c: In function 'apple_smc_acpi_port_read':
>> drivers/platform/x86/macsmc-acpi.c:149:35: warning: format '%lX' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     149 |                 dev_dbg(smc->dev, "port/read: read len failed, key: 0x%X, len: 0x%lX\n", key, len);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/platform/x86/macsmc-acpi.c:149:17: note: in expansion of macro 'dev_dbg'
     149 |                 dev_dbg(smc->dev, "port/read: read len failed, key: 0x%X, len: 0x%lX\n", key, len);
         |                 ^~~~~~~
   drivers/platform/x86/macsmc-acpi.c:149:84: note: format string is defined here
     149 |                 dev_dbg(smc->dev, "port/read: read len failed, key: 0x%X, len: 0x%lX\n", key, len);
         |                                                                                  ~~^
         |                                                                                    |
         |                                                                                    long unsigned int
         |                                                                                  %X
   drivers/platform/x86/macsmc-acpi.c: In function 'apple_smc_acpi_port_write':
   drivers/platform/x86/macsmc-acpi.c:182:35: warning: format '%lX' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     182 |                 dev_dbg(smc->dev, "port/write: write len failed, key: 0x%X, len: 0x%lX\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/platform/x86/macsmc-acpi.c:182:17: note: in expansion of macro 'dev_dbg'
     182 |                 dev_dbg(smc->dev, "port/write: write len failed, key: 0x%X, len: 0x%lX\n",
         |                 ^~~~~~~
   drivers/platform/x86/macsmc-acpi.c:182:86: note: format string is defined here
     182 |                 dev_dbg(smc->dev, "port/write: write len failed, key: 0x%X, len: 0x%lX\n",
         |                                                                                    ~~^
         |                                                                                      |
         |                                                                                      long unsigned int
         |                                                                                    %X


vim +149 drivers/platform/x86/macsmc-acpi.c

1b3026c3fbd9417 Atharva Tiwari 2026-10-29  132  
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  133  static int apple_smc_acpi_port_read(struct apple_smc_acpi *smc, u8 cmd, smc_key key,
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  134  				void *buffer, size_t len)
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  135  {
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  136  	int ret;
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  137  
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  138  	ret = apple_smc_acpi_port_valid(smc);
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  139  	if (ret)
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  140  		return ret;
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  141  
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  142  	if (apple_smc_acpi_port_write_cmd(smc, cmd) || apple_smc_acpi_port_write_key(smc, key)) {
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  143  		dev_dbg(smc->dev, "port/read: read argument failed, key: 0x%X, cmd: 0x%X\n",
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  144  				key, cmd);
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  145  		return -EIO;
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  146  	}
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  147  
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  148  	if (apple_smc_acpi_port_write_byte(smc, len)) {
1b3026c3fbd9417 Atharva Tiwari 2026-10-29 @149  		dev_dbg(smc->dev, "port/read: read len failed, key: 0x%X, len: 0x%lX\n", key, len);
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  150  		return -EIO;
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  151  	}
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  152  
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  153  	for (ret = 0; ret < len; ret++) {
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  154  		if (apple_smc_acpi_port_wait(smc,
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  155  				SMC_IO_STATUS_AWAITING_DATA | SMC_IO_STATUS_BUSY,
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  156  				SMC_IO_STATUS_AWAITING_DATA | SMC_IO_STATUS_BUSY)) {
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  157  			dev_dbg(smc->dev, "port/read: read failed, key: 0x%X\n", key);
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  158  			return -EIO;
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  159  		}
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  160  		((u8 *)buffer)[ret] = inb(smc->port_base + SMC_IO_DATA_PORT);
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  161  	}
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  162  
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  163  	return apple_smc_acpi_port_wait(smc, 0, SMC_IO_STATUS_BUSY);
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  164  }
1b3026c3fbd9417 Atharva Tiwari 2026-10-29  165  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
