Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118477;
	b=1iqTh07zYS/SN+IXRckYV0CH8JEebSZ/SKD5S9hl08nMIyK90HdgimK0rWeYoZhMQyxs
	 WkrI1SSKkbhO+0iYwYNStkWWm5S3HhHaf086RXLey5kjdQ8MI+5OpimScAp/sG5ysITFF
	 9ib4uU11F3v7LkUCoPAiRG8YguAKYFKUapaaafiORo+EniO0KBXsYxgmbKvtudAGOkfrg
	 rhQOeVDeaM5nKpjqfAFtvbVeJvIOHPJQoUEmxac2zNhbgwlXrFTXOFWM+HbikxUkRwX5y
	 qD1fp/tkwMBMdWkToqXD76hzW9+A/ESc7SD/ZqjA8XcPZifScie/2uV+SX7KFnpihyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118477;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=cWjSpJJRzF6/1Um9T0DGFcT5smo3VNDwXGCdr5N1qTU=;
	b=Q3jGyApU8deRDobCr/2JDEDqZaPc5C39Q4P4rzqvLAmy+0b8wJeS6N9vpXixR/38R3vg
	 bYYwhWYPFBMxcMta4hJL+63abLLomee0iVcvuYPwD/Bhle/Pq/sKDUroh+QidhY54v8qZ
	 nCNZadyS8jajspRPgf6ExdUFcr0/cN+PL+RL4vzLvsNKC19TziOblPVcSk90a7RBlqyQK
	 vY5yk6ujXIiQgCmbDfaB83JSl86BBHV4sUpW9motxU1i2Tn8+uzILUvOZVxWyqZePtoWr
	 LyZj+ykj/YcPXmsyYM7HJ4St4pafQNiaSYcktLMB1PpH3Z6b0CCl++WUbs55D+FSWfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHYQp+Jb;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27703606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 20:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27703606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHYQp+Jb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795118477; x=1826654477;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gFSrY0cPLn5CzJa8t7Nn2kT+tUNJ0oBsusRG2GsVNx8=;
  b=aHYQp+Jb52p6ruiZ4fkR5Z4oUGHziIc6x364uLY74Tk56XZ8uZcyw7LQ
   Q6Jk8TRwq40cGeqUNUweJB2XIrCEXl0C9YlovkJXXnWcbbSUR7/MUVgWZ
   hclirenENoJ/P9QN0vIHYf6IKBYgO1mWBSX3HhZQIYocWu3DAh1G62vOQ
   rEueWf4QVGsMVdvIcqhHwqXNnxndBLkUQxY5zr9RRwAAFM/b1OST5ex/5
   RZ2XgBtEYTtUTJ5h6X6MHpVHk6ubg7EigLl7wfbXnf2Ibu5XzbbbHgduW
   p0IZVor79QAguwDvel/Z3VYpePxAmosZBdGVbCA+tOeVFy65CGGZc/7/l
   w==;
X-CSE-ConnectionGUID: 5A9XeiOSSYuqxdJKFZKnDw==
X-CSE-MsgGUID: CuXvvAFKQTSeLAj6k3fv7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3993842"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3993842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:01:17 -0800
X-CSE-ConnectionGUID: sevJ6X6eQgGEOYU1Vz8xcQ==
X-CSE-MsgGUID: 7gvkMxq1QNevGCSWyaZXwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10875440"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 12:01:15 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU8Jl-00000001GUD-0hF1;
	Thu, 19 Nov 2026 20:01:13 +0000
Date: Fri, 20 Nov 2026 04:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <202611200348.62aJTdIu-lkp@intel.com>
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
CC: llvm@lists.linux.dev
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
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261120/202611200348.62aJTdIu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200348.62aJTdIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611200348.62aJTdIu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/mlx5/main.c:1455:8: error: field designator 'support_driver_override' does not refer to any field in type 'struct device_driver'
    1455 |                     .support_driver_override = true },
         |                     ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1455 drivers/vfio/pci/mlx5/main.c

88faa5e8ead62a Yishai Hadas    2022-02-24  1448  
6fadb021266d03 Yishai Hadas    2022-02-24  1449  static struct pci_driver mlx5vf_pci_driver = {
6fadb021266d03 Yishai Hadas    2022-02-24  1450  	.name = KBUILD_MODNAME,
6fadb021266d03 Yishai Hadas    2022-02-24  1451  	.id_table = mlx5vf_pci_table,
6fadb021266d03 Yishai Hadas    2022-02-24  1452  	.probe = mlx5vf_pci_probe,
6fadb021266d03 Yishai Hadas    2022-02-24  1453  	.remove = mlx5vf_pci_remove,
722a3b248ee211 Alex Williamson 2026-11-18  1454  	.driver	= { .pm = pm_ptr(&mlx5vf_pm_ops),
722a3b248ee211 Alex Williamson 2026-11-18 @1455  		    .support_driver_override = true },
88faa5e8ead62a Yishai Hadas    2022-02-24  1456  	.err_handler = &mlx5vf_err_handlers,
c490513c818d1e Jason Gunthorpe 2022-05-19  1457  	.driver_managed_dma = true,
6fadb021266d03 Yishai Hadas    2022-02-24  1458  };
6fadb021266d03 Yishai Hadas    2022-02-24  1459  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
