Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171446;
	b=gNvOoa9i06csc62tBZd0BPqMXOGMAK7DB8svW59p3OdETOVIVff8oPIclCkiMxcQwlFa
	 D5RudKwsRoU1c1xUQq3tc8K7UXMKT/nsBn2M56fq9Q/c2o1zhoKfKknamohcSF2092vQe
	 bC2moeG4CMRwnH/W5ab1+9rnZFnhvihvN+9AR03TRjRQbUGLWR+FGq6wPKVwfN//6teBM
	 WEftUjJxAWcJKFyHlVxy0X9QjefJ3EA8tM0XqFx4V+OTGYh7H7vSnEScxmNPRGlaKcVr0
	 9Nybc0ADAQ9uhwkf+Hsh89BUY/8HEd3h7kcgIlqGqVT69f1Wsia43l6Stpvy1WeR2dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171446;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=ikUv9SLMMn7BvpOYqvb9FiRm+v4FZuFb1r1HGgjwdMI=;
	b=f9Ut4FmK/qqxTHUaZfaQ6jXBTeage4LgyArB/iuRWNTBgvM9Ezf2tfYLVlTL3wXCkAue
	 6S2JjN34Oeb4juqDe507HrOtNMpUipj3uw3q5yKw/c+RD2yFBtA5xVqW/+wt/1VTZokCv
	 5+7RMk+z0QWylWZ2ShDNEIZ1HJCb0LcJSfBsH67XwntbHY6Z+Nt5FP5faMxRJULXjp7Yj
	 Z5gswARsQcOoKOkb5JysOd9KxxQY5bqSAt7zYyMEAyoV6Sf/xVVod3ZnASEbDt7jHwKfn
	 MjtcECsPPcv1mcr6md55FNmzP+jTtTnptk67olwsyNEpsjFLMFGd+jMbY2jwA+3bCCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNASn5w2;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D4606A320
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 10:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNASn5w2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795171445; x=1826707445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zuOA0z0IcYYmvpkeBFtkQe/Z8ernzd8xR/WDnZvI+/k=;
  b=FNASn5w2K3Ij7yx+fSHRw/ndauloI06cbP44bqN4fAAOkqf3qsQ/OKlr
   UaW5Xxe9VH09acuJrLU69p0UAiZkfnOQWlyEWG5EWP9eDIvP6ITNO+cj/
   BIRmqR1p8J/UV2asV/dfonp+xutKNT/mFNH2fXh8t8ZrMlMYumSsEW1eR
   mWMem67+rQmx343eDDEZDM20HPs2/c9vgEMs3KYqW5pMhrsShLRrj+rgB
   LEAQ0KsbtMVhIX6Q2DkIQ9YOqXX5ohmJ9dgADSs03SrbwblMVvbnPhlEv
   HHsvUwXIg1lhk0EqlACicDw7Bbcpe83GlBBzaVVnyGb3z70gwzD3iY8kE
   w==;
X-CSE-ConnectionGUID: d0MJMt65SLW9LNXB3chSOA==
X-CSE-MsgGUID: Mx3+Jr2lSsyPYgHPxSvzCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3937982"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3937982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 02:44:04 -0800
X-CSE-ConnectionGUID: 7VSXPZ+zSwuleH6qHQyuIA==
X-CSE-MsgGUID: W+TJvVmtSPWMJQpUk0ks+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10933337"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2026 02:44:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUM64-00000001HZD-2oEm;
	Fri, 20 Nov 2026 10:44:00 +0000
Date: Fri, 20 Nov 2026 18:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
Message-ID: <202611201844.f7iWPFcy-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261118235645.2907908-1-alex@shazbot.org>
References: <20261118235645.2907908-1-alex@shazbot.org>
TO: Alex Williamson <alex@shazbot.org>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Alex Williamson <alex@shazbot.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>
CC: Johan Hovold <johan@kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: David Lechner <dlechner@baylibre.com>
CC: Armin Wolf <W_Armin@gmx.de>
CC: Thierry Reding <thierry.reding@kernel.org>
CC: Mike Rapoport <rppt@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Karl Mehltretter <kmehltretter@gmail.com>
CC: "Paul E . McKenney" <paulmck@kernel.org>
CC: Borislav Petkov <bp@alien8.de>
CC: Dapeng Mi <dapeng1.mi@linux.intel.com>
CC: Marco Elver <elver@google.com>
CC: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>
CC: Jeff Layton <jlayton@kernel.org>
CC: Bradley Morgan <brads@mainlining.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Petr Mladek <pmladek@suse.com>
CC: Pnina Feder <pnina.feder@mobileye.com>
CC: Mete Durlu <meted@linux.ibm.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/PCI-Allow-untainted-driver_override-for-PCI-stub-drivers/20261118-165643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-1-alex%40shazbot.org
patch subject: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261120/202611201844.f7iWPFcy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201844.f7iWPFcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611201844.f7iWPFcy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci-stub.c:40:17: error: 'struct device_driver' has no member named 'support_driver_override'
      40 |         .driver.support_driver_override = true,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-stub.c:40:43: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      40 |         .driver.support_driver_override = true,
         |                                           ^~~~
   drivers/pci/pci-stub.c:40:43: note: (near initialization for 'stub_driver.driver.name')
--
>> drivers/pci/pci-pf-stub.c:39:17: error: 'struct device_driver' has no member named 'support_driver_override'
      39 |         .driver.support_driver_override = true,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-pf-stub.c:39:43: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      39 |         .driver.support_driver_override = true,
         |                                           ^~~~
   drivers/pci/pci-pf-stub.c:39:43: note: (near initialization for 'pf_stub_driver.driver.name')


vim +40 drivers/pci/pci-stub.c

c70e0d9dfef3d82 Chris Wright    2008-11-25  34  
c70e0d9dfef3d82 Chris Wright    2008-11-25  35  static struct pci_driver stub_driver = {
c70e0d9dfef3d82 Chris Wright    2008-11-25  36  	.name		= "pci-stub",
c70e0d9dfef3d82 Chris Wright    2008-11-25  37  	.id_table	= NULL,	/* only dynamic id's */
c70e0d9dfef3d82 Chris Wright    2008-11-25  38  	.probe		= pci_stub_probe,
18c7a349d072a22 Lu Baolu        2022-04-18  39  	.driver_managed_dma = true,
907f70ec2397402 Alex Williamson 2026-11-18 @40  	.driver.support_driver_override = true,
c70e0d9dfef3d82 Chris Wright    2008-11-25  41  };
c70e0d9dfef3d82 Chris Wright    2008-11-25  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
