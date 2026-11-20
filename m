Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215848;
	b=Xjbr3eMBJkGLFCk3JIYlJ5K0lhZEObaCsVxRzvyXGRMEbyALo38l6QGzl6xWSSNKzGh9
	 VQs4+HMQFciJw4ZBVdBMsSc4q/0jj9wy7CmXenTPaa08jOEQpUzEkNb2eCoM0YWRniYSy
	 vYseYG6BbqzXxiwHoq/fcudRF4YB3VGX1HT8YUbeikIDoQlJDEWkYFpKlTSDv8dzuOlpG
	 P1Gv2YuzcRqZoUnaMnVR1eh/8KU0PMzx9bDbh1sqPDiHZZcTgyaKChz8lNz1OTyvM08Eh
	 CmEl6bvp0mJ1DOfx8B/mDnTDXhnjqFFfx49dDwCq6lGKTRJIJX6sTlbNvs4BCEJGc3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215848;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Ci+htxTOBjBttPmyK/pK6dk6MaqFnmepnyabx7f4+Kg=;
	b=P5BmSJXjgTbupsoRLSM9MmnUusmL3ybZlw2hjCDUtHcgejzAbmE2hc+tdFX8DaTNbbSC
	 bqAyvqbqGU7L2xLRapKCtPGr+mFjLM4VIeeU+b6YnK7ytjEFTVa9LO1gyhw4OpOxzmrtq
	 U1PKzLjFeB8+vN1xhpcsprT+VUl4cMpmpU4SC+wutJAun8ljGskavmVkDhA0/jl6AuuBo
	 5ELp+owtT2ZhAosieQPzYufdaRRyH+p4j+vll9G0de5lItE0x2U6C/RiZMkNoIxTcgWKv
	 rWQc0tzRrOUYSKJZCmyTDGAXWBNKaUSVYHyU3kVp46zPwK5e9AL2y1I4eM4UtpQoTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YiPnEom7;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76136606A692
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 23:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76136606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YiPnEom7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795215847; x=1826751847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qEXgrKLE2A6qcdi3IGBdTq1QySmu7RwNDRToqou0tGM=;
  b=YiPnEom7Vz48fdZCpNOG/p2uEEk/YD22WqkiFVnDmWzDD3u+z+HG33SR
   bsdfTSkFPp+cXuBa+Q5xxwYkDe0Utpw/zIymq06vqB2GARbiqY12OeJh8
   zFIo2HmKJPlNDdvzOnKYF/YhYALnOl+Gw2zWBrZ3ili8e3Twl8nJHcf96
   0sccfnf/3RDeRL1gB0g83SyvQM8rA+sNHw5mjYWfsHRmNLekTJZbFqrk0
   ex6YGBTBaY+sYoU6MhuVtCAaIl9mSS7QrkRWc+GcOSfarqqHBDXtdOky5
   6oIRczRd60bzy3WTbYKQkSGw1Tsg4+pF8pnZnEcvgticSA8yUZKCeLcew
   A==;
X-CSE-ConnectionGUID: mqAKHmrsQmG0weuqK0p1Vg==
X-CSE-MsgGUID: wZ0IGLiNSI+f6pASoNCmqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3994248"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3994248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:04:06 -0800
X-CSE-ConnectionGUID: iJbyQhjZTSOTdOpJR+AGOg==
X-CSE-MsgGUID: Hl5wGxQUS6CJw6MS5Fka7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10709973"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2026 15:04:05 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUXeE-00000001Ird-38SB;
	Fri, 20 Nov 2026 23:04:02 +0000
Date: Sat, 21 Nov 2026 07:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
Message-ID: <202611210647.e89eu8Ah-lkp@intel.com>
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
:::::: Manual check reason: "same reports for this branch"
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/PCI-Allow-untainted-driver_override-for-PCI-stub-drivers/20261118-165643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-1-alex%40shazbot.org
patch subject: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-1002-20261121 (https://download.01.org/0day-ci/archive/20261121/202611210647.e89eu8Ah-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210647.e89eu8Ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611210647.e89eu8Ah-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pci-stub.c:40:10: error: 'struct device_driver' has no member named 'support_driver_override'
     .driver.support_driver_override = true,
             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-stub.c:40:36: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     .driver.support_driver_override = true,
                                       ^~~~
   drivers/pci/pci-stub.c:40:36: note: (near initialization for 'stub_driver.driver.name')


vim +40 drivers/pci/pci-stub.c

c70e0d9dfef3d8 Chris Wright    2008-11-25  34  
c70e0d9dfef3d8 Chris Wright    2008-11-25  35  static struct pci_driver stub_driver = {
c70e0d9dfef3d8 Chris Wright    2008-11-25  36  	.name		= "pci-stub",
c70e0d9dfef3d8 Chris Wright    2008-11-25  37  	.id_table	= NULL,	/* only dynamic id's */
c70e0d9dfef3d8 Chris Wright    2008-11-25  38  	.probe		= pci_stub_probe,
18c7a349d072a2 Lu Baolu        2022-04-18  39  	.driver_managed_dma = true,
907f70ec239740 Alex Williamson 2026-11-18 @40  	.driver.support_driver_override = true,
c70e0d9dfef3d8 Chris Wright    2008-11-25  41  };
c70e0d9dfef3d8 Chris Wright    2008-11-25  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
