Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115333;
	b=TzCBPibxvndHyT3KXq85BECNXsnUsO6bZwwM6zANU2Oa3Rj4MluPuQOxrYbUjQXa5M1z
	 YkddCcD8zfv9nrJeft6IsgqFN6CGkO73JjkAkXUuEoHsdeZNRiK4I9dv/VyTn8DHvFnRv
	 W4HZzLwcjbDRu1ecd29hSYK7mnsZ+xRSqRxiY6jhNdSuqjZUJ0OgDs7EcDTPWlD5eVoJK
	 yiA8NUyll3qXRcKJ/Z6FFslTdwhHGCAQtdd3WE1qw8CiiojPnkYiXSm9cs7OCRPRlvyu8
	 3RXtzvHTXk9HT6h7U4IHx1sTzBAU0uwJp8LAmv4DNntp1AG23Oj2sf13B0oMWjpgIpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115333;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=2u9vsnlSDry7tcYmXQA1kM6FPXp38CFNRVuiLRvTquo=;
	b=agih66TOqqgE1KYucvNR6TH6rY+98mYTWJMlYByNq1iUOk07llqWY3DBMDNnBZ8PmBBz
	 ERyCJKqpvRj/iv4Ci2MvQ1HHzyjIavHNZrqnaE4Vb2Z4+fNQAIspl62bjwtcpYDOtVSxW
	 cy+bzj1t+/RP3X9l6Q8cBQvmw/P3OJCdJpY3kS8VgKjNJqp7NtRaWadeGU4PrzddQl5nN
	 JUJjkOdToiJ8Ak+JXtoaKttZkQMBZi6bpKmGtbVIpfXaDGWycoXeJaQxMuS3xnCI6kRsR
	 NF8/ynx8NW6zhi68S47OqPsLq5GJYbUujyAcgt5pjPyIHcbe/ERUDZD16FnPC3JrU8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1VsfZIS;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A7606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 19:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1VsfZIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795115332; x=1826651332;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LgaWu7BjZfkJnwoDWNRStqi+4g3aYfeYp3fpIAxfAIU=;
  b=d1VsfZISpYrUmXD935zjLma6ElU+66BUm9Rjcb/u5s0paClbtGPsuYXV
   WegMeGl3F54jIt/ruWEMiLOvkY0Ys277NlrUiAUYsG+v9hDn8bnPpeblN
   32c/Fvvm4lUddA2tkAHDYO4Ku87PM1r2udMdp9pnV2k1pvvSucaFTYkir
   JyIxgF7G5f51JmMRLJYYDyawMbKahVTZUQOjASpc5IaQsK8is6PO9d13g
   49zQ12WliDylAhEwjNA0zytL0eWv1AjoECedkzogJ0sUobYhl+IwmSkNG
   BjYur3HHjIV9eeSiZAmQNAbchLj9v+m2kMFRYR3cua5spgXzfOhRAd30s
   w==;
X-CSE-ConnectionGUID: dctzBhEBT062ttbUzI33Ig==
X-CSE-MsgGUID: zFR6WSdNR2WBcPRsjkwnMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3975385"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3975385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:08:51 -0800
X-CSE-ConnectionGUID: KeGuA6GfT+yE5JuL7vuiLw==
X-CSE-MsgGUID: WZ0La4GXSnaOITgMgfOEtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10595682"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2026 11:08:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU7V2-00000001GP3-20Rc;
	Thu, 19 Nov 2026 19:08:48 +0000
Date: Fri, 20 Nov 2026 03:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <202611200233.KNmMbpyn-lkp@intel.com>
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
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-randconfig-1001-20261119 (https://download.01.org/0day-ci/archive/20261120/202611200233.KNmMbpyn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200233.KNmMbpyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611200233.KNmMbpyn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/platform/vfio_amba.c:140:18: error: 'struct device_driver' has no member named 'support_driver_override'
     140 |                 .support_driver_override = true,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/platform/vfio_amba.c:140:44: error: initialization of 'const struct bus_type *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     140 |                 .support_driver_override = true,
         |                                            ^~~~
   drivers/vfio/platform/vfio_amba.c:140:44: note: (near initialization for 'vfio_amba_driver.drv.bus')


vim +140 drivers/vfio/platform/vfio_amba.c

36fe431f2811fa3 Antonios Motakis   2015-03-16  133  
36fe431f2811fa3 Antonios Motakis   2015-03-16  134  static struct amba_driver vfio_amba_driver = {
36fe431f2811fa3 Antonios Motakis   2015-03-16  135  	.probe = vfio_amba_probe,
36fe431f2811fa3 Antonios Motakis   2015-03-16  136  	.remove = vfio_amba_remove,
ec29d22caea85d9 Geert Uytterhoeven 2024-02-26  137  	.id_table = vfio_amba_ids,
36fe431f2811fa3 Antonios Motakis   2015-03-16  138  	.drv = {
36fe431f2811fa3 Antonios Motakis   2015-03-16  139  		.name = "vfio-amba",
722a3b248ee2110 Alex Williamson    2026-11-18 @140  		.support_driver_override = true,
36fe431f2811fa3 Antonios Motakis   2015-03-16  141  	},
70693f470848f05 Lu Baolu           2022-04-18  142  	.driver_managed_dma = true,
36fe431f2811fa3 Antonios Motakis   2015-03-16  143  };
36fe431f2811fa3 Antonios Motakis   2015-03-16  144  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
