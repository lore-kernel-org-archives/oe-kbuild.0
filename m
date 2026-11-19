Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107232;
	b=U9GPQIV04CsWAPaaSFZDkFCmcYycPXj2+OlCx9rycj/LVlC8Y8dOlfejCCmVHLqAsWFH
	 4CDZ7FFBezqspUXULUoFBkBsESZzN2OgRpdb2skYDuE0kR6lXeQWuZN4bew0fnx9gSElY
	 3pmClaD1nl/niU2XrCGmPYvKPTVGV1A+vmZ9+gZTVnjGls04cFESm1Vs0hCY8aqRHPaGM
	 3skJPPWcr/34y+XJY7647OYM3+2rHcWbT505Q+T9tIWpOjWH2+mTyLGFRYYcRJDX5nNeX
	 AOYs0/hj4nfSQ3/tMVi0NFwNV+aQTO2KaDFAh2bYoX48Cv49ZlPpymhpdRIu1idJNkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107232;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=l9SKg8VuMXSVhvjlobRb2vSgKr9ri26s/kWWxPy2IXk=;
	b=Fz7dIyQ/bQhI7rDLms3jBm2rdhnbwmvZu06SZs1L/dfOCnGaBDcJKOMgKF29iYLxPJsD
	 6Sju8LaYu3el+2y6SY1wLbj9t4P80OoLWKJW4DykRN4lP/rjAdRCdzDFPzBAELENeqrtW
	 WHjKSKWLKOYhX82BGNM3zelf/BkSM7yZHC5/JK0mZKvxp7HQ04kFWPAZeZGZjfUz4faFG
	 7uxNYe3MZt4l2a1cSVispF414/m5maQbvFFwQFGAqENDyQSEkJfGOsnrl60Bdhg6xl9Bx
	 EPrz3DYHzTJxWUt2Z05gJ+6HsqPoQqpykjOW445/TMnBupnYJaQVMDl7JInXRB+AYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfFIsLyP;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521C960A2617
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 16:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521C960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfFIsLyP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795107231; x=1826643231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ri1aeLH76AiZzyiznxy/hcEwlhj8Dwbe7Z8813Ot4l8=;
  b=MfFIsLyPyU81VtZhFD5mB6rO0ey4e7004G8sfygxOlA2sWyIv7fqymIP
   pZ0qBwNYGfIwCkxIFmIU53E1hKWKE3VSFJSC1go1r+cEMEY7TPo7HWe4A
   460YSKqNnOVVlcgFdHy4dmq/LX25UUMS/kdQnOe5OqpoHRLY1f9/jVKoJ
   dLloSRfJUlkWV81rpYj4jl6CqyhlyvzNJAIJiMJgstTZ++72I64LI9quU
   Ou22SA/oPIzdCLAVzqhMDTlCj91qbQUrcVkEG7KTUACtpOWOTq9zlsAq8
   1Gv66yPpMXrY2HJnddYJPWprDkdp7bsqPwwHO289X3Dib4M51SLkuXc3o
   Q==;
X-CSE-ConnectionGUID: R9qOcV6uS1OP4oVReiDI7A==
X-CSE-MsgGUID: M9L3ZlmkR7WLjHDh9PYIuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3957968"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3957968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:53:51 -0800
X-CSE-ConnectionGUID: IKIUycu6SruJJCXkE1SEMQ==
X-CSE-MsgGUID: F+4c8ng4RgmfVg0EB/POMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10693802"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2026 08:53:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU5ON-00000001GA6-2U1r;
	Thu, 19 Nov 2026 16:53:47 +0000
Date: Fri, 20 Nov 2026 00:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <202611200026.gDtr55Vd-lkp@intel.com>
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
In-Reply-To: <20261118235645.2907908-2-alex@shazbot.org>
References: <20261118235645.2907908-2-alex@shazbot.org>
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

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on linus/master v7.4-rc3 next-20261116]
[cannot apply to awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/vfio-Allow-untainted-use-of-driver_override/20261118-165644
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-2-alex%40shazbot.org
patch subject: [PATCH] vfio: Allow untainted use of driver_override
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261120/202611200026.gDtr55Vd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200026.gDtr55Vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611200026.gDtr55Vd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci.c:264:30: error: 'struct device_driver' has no member named 'support_driver_override'
     264 |                             .support_driver_override = true },
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/pci/vfio_pci.c:264:56: error: initialization of 'void (*)(struct device *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     264 |                             .support_driver_override = true },
         |                                                        ^~~~
   drivers/vfio/pci/vfio_pci.c:264:56: note: (near initialization for 'vfio_pci_driver.driver.coredump')
--
>> drivers/vfio/pci/mlx5/main.c:1455:22: error: 'struct device_driver' has no member named 'support_driver_override'
    1455 |                     .support_driver_override = true },
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/pci/mlx5/main.c:1455:48: error: initialization of 'void (*)(struct device *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1455 |                     .support_driver_override = true },
         |                                                ^~~~
   drivers/vfio/pci/mlx5/main.c:1455:48: note: (near initialization for 'mlx5vf_pci_driver.driver.coredump')


vim +264 drivers/vfio/pci/vfio_pci.c

6a5f427bee12c82 Simon Song      2026-10-05  255  
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  256  static struct pci_driver vfio_pci_driver = {
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  257  	.name			= "vfio-pci",
cc6711b0bf36de0 Max Gurtovoy    2021-08-26  258  	.id_table		= vfio_pci_table,
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  259  	.probe			= vfio_pci_probe,
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  260  	.remove			= vfio_pci_remove,
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  261  	.sriov_configure	= vfio_pci_sriov_configure,
6a5f427bee12c82 Simon Song      2026-10-05  262  	.err_handler		= &vfio_pci_err_handlers,
722a3b248ee2110 Alex Williamson 2026-11-18  263  	.driver		= { .pm = pm_ptr(&vfio_pci_pm_ops),
722a3b248ee2110 Alex Williamson 2026-11-18 @264  			    .support_driver_override = true },
70693f470848f05 Lu Baolu        2022-04-18  265  	.driver_managed_dma	= true,
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  266  };
ff53edf6d6ab097 Max Gurtovoy    2021-08-26  267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
