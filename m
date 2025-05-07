Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37B221287
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603896; cv=none; b=MSFpVGWQ9pskvHCSgb0+J4m8Rv7Vv4I6qjhbzMHTnZGOV0zJOIl1rVZr31lqttMt/1rSNFrcdtJ/5EB1eWcE6+Nw9qhHXo6+WR30TwKOcviHo9MBnZfAkgKSAOZTm5vkYr5Q+4Z2VRviMWQI53kN4nE7Y+RY41B3JqBdq1g8pVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603896; c=relaxed/simple;
	bh=ZF2ZLilY4oCdxIVmc0HAl7/Tar+2czstA3zh08EBzEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRDy6DytQ4mUlzX2ZlmgEe1EWhFNOpjAKrv3mE924X/il//DFRw6M5E5+sxzHtcWJEP4KmB2SEiaYFxaVyVrjGI15y2iPzLEbuR0JLwf74ZVmczAIdYDDr3zVrAqW5VznXdWgWW1VipyfvqLWl/qF0OBdJtiRdFnk+nTica2Eec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq5VFXuM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq5VFXuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603894; x=1778139894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZF2ZLilY4oCdxIVmc0HAl7/Tar+2czstA3zh08EBzEQ=;
  b=Xq5VFXuMwp1ecO7pcME86RtEwAodA84a1btzzUdI4W7R8LfrTvRaSGsa
   hzPB2YbNdB0Q50IctcrbwqSFBGOgTqkhOIYQmYtojcFxvTReOMHZmxdPv
   DDdo/82goc/sPKjyaj9743MqA+HIaXCzZTFKvUEWqT4DLeZb9SsotMxcQ
   IRjmFz1SNeANVpopg5WuLzxJPG3qdePsOwChqbLFwZDhWIzGHyloD3Xmw
   SF2vGExmrHlNHn1+yIkK3PH9v1FsMH+Y86GXZcwQw7bxvYYgpmPU5pkg4
   dXLQH/7iMVKQ0t48+da/PINFx6awB8fjeOavsOqY8nq0z5JFL0JwE65FN
   A==;
X-CSE-ConnectionGUID: OaBlVy98ThqAcIGAr/q4ew==
X-CSE-MsgGUID: j1ZOyrEYSqWNLj36NIxIrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59306066"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="59306066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:44:54 -0700
X-CSE-ConnectionGUID: 1YA2dKd9QfOjyYNHJrqCbA==
X-CSE-MsgGUID: dVEluSQySzKz6ogZ853ftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="166916498"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2025 00:44:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZST-0007LN-35;
	Wed, 07 May 2025 07:44:49 +0000
Date: Wed, 7 May 2025 15:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Message-ID: <202505071507.fun28Wyq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/acpi/acpi_ipmi.c:390:9: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
References: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas.schier@linux.dev>
CC: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
CC: Bill Wendling <morbo@google.com>
CC: Justin Stitt <justinstitt@google.com>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: patches@lists.linux.dev
CC: stable@vger.kernel.org
CC: Linux Kernel Functional Testing <lkft@linaro.org>
CC: Marcus Seyfarth <m.seyfarth@gmail.com>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebd297a2affadb6f6f4d2e5d975c1eda18ac762d]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Disable-Wdefault-const-init-field-unsafe/20250502-070313
base:   ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
patch link:    https://lore.kernel.org/r/20250501-default-const-init-clang-v1-2-3d2c6c185dbb%40kernel.org
patch subject: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-061-20250503 (https://download.01.org/0day-ci/archive/20250507/202505071507.fun28Wyq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071507.fun28Wyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071507.fun28Wyq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/acpi_ipmi.c:390:9: sparse: sparse: invalid initializer
>> drivers/acpi/acpi_ipmi.c:390:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:292:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:292:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:340:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:340:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:351:17: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:351:17: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:362:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:362:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:561:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c:561:9: sparse: sparse: invalid initializer
   drivers/acpi/acpi_ipmi.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, ...):
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
--
>> drivers/char/ipmi/ipmi_ipmb.c:126:17: sparse: sparse: invalid initializer
>> drivers/char/ipmi/ipmi_ipmb.c:126:17: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:292:17: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:292:17: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:345:17: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:345:17: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:360:25: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:360:25: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:413:9: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c:413:9: sparse: sparse: invalid initializer
   drivers/char/ipmi/ipmi_ipmb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
--
>> drivers/misc/hi6421v600-irq.c:144:9: sparse: sparse: invalid initializer
>> drivers/misc/hi6421v600-irq.c:144:9: sparse: sparse: invalid initializer
   drivers/misc/hi6421v600-irq.c:161:9: sparse: sparse: invalid initializer
   drivers/misc/hi6421v600-irq.c:161:9: sparse: sparse: invalid initializer
   drivers/misc/hi6421v600-irq.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
--
>> kernel/time/clocksource-wdtest.c:140:9: sparse: sparse: invalid initializer
>> kernel/time/clocksource-wdtest.c:140:9: sparse: sparse: invalid initializer
>> kernel/time/clocksource-wdtest.c:140:9: sparse: sparse: invalid initializer
>> kernel/time/clocksource-wdtest.c:140:9: sparse: sparse: invalid initializer
--
>> drivers/iio/buffer/industrialio-buffer-dma.c:154:9: sparse: sparse: invalid initializer
>> drivers/iio/buffer/industrialio-buffer-dma.c:154:9: sparse: sparse: invalid initializer
   drivers/iio/buffer/industrialio-buffer-dma.c:240:9: sparse: sparse: invalid initializer
   drivers/iio/buffer/industrialio-buffer-dma.c:240:9: sparse: sparse: invalid initializer
   drivers/iio/buffer/industrialio-buffer-dma.c:272:9: sparse: sparse: invalid initializer
   drivers/iio/buffer/industrialio-buffer-dma.c:272:9: sparse: sparse: invalid initializer
   drivers/iio/buffer/industrialio-buffer-dma.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
--
>> drivers/video/fbdev/smscufx.c:1788:9: sparse: sparse: invalid initializer
>> drivers/video/fbdev/smscufx.c:1788:9: sparse: sparse: invalid initializer
   drivers/video/fbdev/smscufx.c:1909:9: sparse: sparse: invalid initializer
   drivers/video/fbdev/smscufx.c:1909:9: sparse: sparse: invalid initializer
   drivers/video/fbdev/smscufx.c:1819:17: sparse: sparse: invalid initializer
   drivers/video/fbdev/smscufx.c:1819:17: sparse: sparse: invalid initializer
   drivers/video/fbdev/smscufx.c:827:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/smscufx.c:827:27: sparse:     expected unsigned int [usertype]
   drivers/video/fbdev/smscufx.c:827:27: sparse:     got restricted __le32 [usertype]
   drivers/video/fbdev/smscufx.c:830:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/smscufx.c:830:27: sparse:     expected unsigned int [usertype]
   drivers/video/fbdev/smscufx.c:830:27: sparse:     got restricted __le32 [usertype]
   drivers/video/fbdev/smscufx.c:832:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/smscufx.c:832:16: sparse:     expected unsigned short [usertype]
   drivers/video/fbdev/smscufx.c:832:16: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/smscufx.c:833:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/smscufx.c:833:16: sparse:     expected unsigned short [usertype]
   drivers/video/fbdev/smscufx.c:833:16: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/smscufx.c:834:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/smscufx.c:834:16: sparse:     expected unsigned short [usertype]
   drivers/video/fbdev/smscufx.c:834:16: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/smscufx.c:835:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/smscufx.c:835:16: sparse:     expected unsigned short [usertype]
   drivers/video/fbdev/smscufx.c:835:16: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/smscufx.c:838:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/smscufx.c:838:27: sparse:     expected unsigned int [usertype]
   drivers/video/fbdev/smscufx.c:838:27: sparse:     got restricted __le32 [usertype]
   drivers/video/fbdev/smscufx.c:841:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/smscufx.c:841:17: sparse:     expected unsigned short [usertype]
   drivers/video/fbdev/smscufx.c:841:17: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/smscufx.c:844:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/smscufx.c:844:17: sparse:     expected unsigned short [usertype]
   drivers/video/fbdev/smscufx.c:844:17: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/smscufx.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, arch/x86/include/asm/msr.h, ...):
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer
   include/linux/spinlock.h:406:9: sparse: sparse: invalid initializer

vim +390 drivers/acpi/acpi_ipmi.c

e92b297cc72ade Zhao Yakui    2010-12-08  375  
e92b297cc72ade Zhao Yakui    2010-12-08  376  static void ipmi_msg_handler(struct ipmi_recv_msg *msg, void *user_msg_data)
e92b297cc72ade Zhao Yakui    2010-12-08  377  {
e92b297cc72ade Zhao Yakui    2010-12-08  378  	struct acpi_ipmi_device *ipmi_device = user_msg_data;
26de0ab9841a16 Jakob Koschel 2022-03-24  379  	struct acpi_ipmi_msg *tx_msg = NULL, *iter, *temp;
2fb037b89a3125 Lv Zheng      2013-09-13  380  	struct device *dev = ipmi_device->dev;
06a8566bcf5cf7 Lv Zheng      2013-09-13  381  	unsigned long flags;
e92b297cc72ade Zhao Yakui    2010-12-08  382  
e92b297cc72ade Zhao Yakui    2010-12-08  383  	if (msg->user != ipmi_device->user_interface) {
50065300314e95 Lv Zheng      2013-09-13  384  		dev_warn(dev,
50065300314e95 Lv Zheng      2013-09-13  385  			 "Unexpected response is returned. returned user %p, expected user %p\n",
e92b297cc72ade Zhao Yakui    2010-12-08  386  			 msg->user, ipmi_device->user_interface);
6b68f03f95e3f0 Lv Zheng      2013-09-13  387  		goto out_msg;
e92b297cc72ade Zhao Yakui    2010-12-08  388  	}
50065300314e95 Lv Zheng      2013-09-13  389  
06a8566bcf5cf7 Lv Zheng      2013-09-13 @390  	spin_lock_irqsave(&ipmi_device->tx_msg_lock, flags);
26de0ab9841a16 Jakob Koschel 2022-03-24  391  	list_for_each_entry_safe(iter, temp, &ipmi_device->tx_msg_list, head) {
26de0ab9841a16 Jakob Koschel 2022-03-24  392  		if (msg->msgid == iter->tx_msgid) {
26de0ab9841a16 Jakob Koschel 2022-03-24  393  			tx_msg = iter;
26de0ab9841a16 Jakob Koschel 2022-03-24  394  			list_del(&iter->head);
e92b297cc72ade Zhao Yakui    2010-12-08  395  			break;
e92b297cc72ade Zhao Yakui    2010-12-08  396  		}
e92b297cc72ade Zhao Yakui    2010-12-08  397  	}
7b9844772237e3 Lv Zheng      2013-09-13  398  	spin_unlock_irqrestore(&ipmi_device->tx_msg_lock, flags);
e92b297cc72ade Zhao Yakui    2010-12-08  399  
26de0ab9841a16 Jakob Koschel 2022-03-24  400  	if (!tx_msg) {
50065300314e95 Lv Zheng      2013-09-13  401  		dev_warn(dev,
50065300314e95 Lv Zheng      2013-09-13  402  			 "Unexpected response (msg id %ld) is returned.\n",
50065300314e95 Lv Zheng      2013-09-13  403  			 msg->msgid);
7b9844772237e3 Lv Zheng      2013-09-13  404  		goto out_msg;
e92b297cc72ade Zhao Yakui    2010-12-08  405  	}
e92b297cc72ade Zhao Yakui    2010-12-08  406  
e92b297cc72ade Zhao Yakui    2010-12-08  407  	/* copy the response data to Rx_data buffer */
6b68f03f95e3f0 Lv Zheng      2013-09-13  408  	if (msg->msg.data_len > ACPI_IPMI_MAX_MSG_LENGTH) {
2fb037b89a3125 Lv Zheng      2013-09-13  409  		dev_WARN_ONCE(dev, true,
6b68f03f95e3f0 Lv Zheng      2013-09-13  410  			      "Unexpected response (msg len %d).\n",
6b68f03f95e3f0 Lv Zheng      2013-09-13  411  			      msg->msg.data_len);
8584ec6ae9cc38 Lv Zheng      2013-09-13  412  		goto out_comp;
8584ec6ae9cc38 Lv Zheng      2013-09-13  413  	}
50065300314e95 Lv Zheng      2013-09-13  414  
8584ec6ae9cc38 Lv Zheng      2013-09-13  415  	/* response msg is an error msg */
8584ec6ae9cc38 Lv Zheng      2013-09-13  416  	msg->recv_type = IPMI_RESPONSE_RECV_TYPE;
8584ec6ae9cc38 Lv Zheng      2013-09-13  417  	if (msg->recv_type == IPMI_RESPONSE_RECV_TYPE &&
8584ec6ae9cc38 Lv Zheng      2013-09-13  418  	    msg->msg.data_len == 1) {
8584ec6ae9cc38 Lv Zheng      2013-09-13  419  		if (msg->msg.data[0] == IPMI_TIMEOUT_COMPLETION_CODE) {
f513561455c31f Sinan Kaya    2017-03-23  420  			dev_dbg_once(dev, "Unexpected response (timeout).\n");
8584ec6ae9cc38 Lv Zheng      2013-09-13  421  			tx_msg->msg_done = ACPI_IPMI_TIMEOUT;
8584ec6ae9cc38 Lv Zheng      2013-09-13  422  		}
8584ec6ae9cc38 Lv Zheng      2013-09-13  423  		goto out_comp;
8584ec6ae9cc38 Lv Zheng      2013-09-13  424  	}
50065300314e95 Lv Zheng      2013-09-13  425  
e92b297cc72ade Zhao Yakui    2010-12-08  426  	tx_msg->rx_len = msg->msg.data_len;
6b68f03f95e3f0 Lv Zheng      2013-09-13  427  	memcpy(tx_msg->data, msg->msg.data, tx_msg->rx_len);
8584ec6ae9cc38 Lv Zheng      2013-09-13  428  	tx_msg->msg_done = ACPI_IPMI_OK;
50065300314e95 Lv Zheng      2013-09-13  429  
8584ec6ae9cc38 Lv Zheng      2013-09-13  430  out_comp:
e92b297cc72ade Zhao Yakui    2010-12-08  431  	complete(&tx_msg->tx_complete);
7b9844772237e3 Lv Zheng      2013-09-13  432  	acpi_ipmi_msg_put(tx_msg);
6b68f03f95e3f0 Lv Zheng      2013-09-13  433  out_msg:
e92b297cc72ade Zhao Yakui    2010-12-08  434  	ipmi_free_recv_msg(msg);
50065300314e95 Lv Zheng      2013-09-13  435  }
e92b297cc72ade Zhao Yakui    2010-12-08  436  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
