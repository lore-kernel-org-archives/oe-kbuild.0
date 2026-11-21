Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246492;
	b=2nIsGGzcabcacvLaaKj9riOh7H5dGS8RDCB3RZYByQNTj66WaKqZTp4YutiIzZz8KlvR
	 xI6seHlydhaTgNpBVYaA3GemB4ShOI9jRHzRia1QSPuTY2qakIwgX3XjIeKaaXEu20Fmv
	 inRDoKzp/lUGgmdoGbmpP93QM3Kgi+SmRp4Ni1GAjqYM0kTaY0Mq2NC0dm9lN3oR5C3VP
	 lhxM9ZVvwmRpmirObMiclBt249IhNcu94hp4XgP6QuTIffDZE44CmQT03vVN6BFJyiVte
	 YmJlpQtrE00ta8GUU43PiMUbWorFzH9evaHrKYMNfpbtubgagSJvmy7E+TxqviyBMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246492;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Ty2coRFqwRxbpvZOt8M2nUifEYKC/nW220ih+CrvQ5o=;
	b=RzEjgthPtaEhnAFyGBPTtAbTzzfiIVNrnkPucYlHLZ8c3b4k4uOzJ8gQg6b7hecf5KLu
	 arAcHIjUdJzTTdGT8fUAuUEYiEFipsX2gpTxuSBK9YEhJ2XXOeMp6opuBoG9G/hx+ibxa
	 qGmKZa/bNnDF/eYdG2tlOO+L3YwUvTNE9ZJcuGVGUN5sAgiBodaBNKr92VKyCHLtpwEPp
	 /Vn9idZQnyNmydSNRe+Mybil2rdR4nBkWsiMRe4NpWS3QQzApL8cPoi9b6j6Dga2Kdwus
	 lo3UxK5t8OyhMU3qlNZvI/OpZCnIVXfTR+ZsDJZlssby1ln2qWP0sXwOpLlyJ06Xa4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nn04mrQP;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7C6606A325
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 07:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7C6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nn04mrQP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795246491; x=1826782491;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PCwqmoze7BmDS/uAZWWUO9ptnyxjfcNchma5ZmUBH0I=;
  b=Nn04mrQPTMLhcpcaiORY3Fqo2emSJh+FoIiSLgvg5T9LKZ0HCqJxdizW
   hIDvw5xb1AJQln1Kwqbk3iFFWwoxyRoHUttcPz2DEAzs8QZ9NrApqG8e3
   +yHd//oJOwttWrnRVAngVXIhnmAIczTzZuBNEYVYf8M9SUoTw8l/Agbez
   aVTpbZh0G/6PmqEB19apjT8EkCgIJ6gM5rfmeM5+UdeJe2tW+QbGdIK4U
   mcEQrQoRw7DUv2rCAIcMH/ljGewloooudvnCCtJONe2mEGifMFBvyDb8d
   Y++oTMDblY4G9XEyJ9EOqD9rlScfJnHDWlLEivyY0uds2NyJJsGjpmhzD
   w==;
X-CSE-ConnectionGUID: Y9OM47vZSgaNPvJ7IEoshg==
X-CSE-MsgGUID: XIFY8Kz3R4OIVRSv8o0nLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4206621"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4206621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 23:34:50 -0800
X-CSE-ConnectionGUID: DiAuJhnvRKiHvgpRXv2vNA==
X-CSE-MsgGUID: 5xjhDVgYTPu7IJoax93RBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11144395"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2026 23:34:49 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUfcU-00000001JjT-3NyX;
	Sat, 21 Nov 2026 07:34:46 +0000
Date: Sat, 21 Nov 2026 15:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
Message-ID: <202611211550.M3lFLEKu-lkp@intel.com>
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
In-Reply-To: <20261119051507.3306075-1-alex@shazbot.org>
References: <20261119051507.3306075-1-alex@shazbot.org>
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

[auto build test ERROR on kvms390/next]
[also build test ERROR on awilliam-vfio/next soc/for-next awilliam-vfio/for-linus linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/s390-vfio-Allow-untainted-use-of-driver_override/20261118-221504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20261119051507.3306075-1-alex%40shazbot.org
patch subject: [PATCH] s390/vfio: Allow untainted use of driver_override
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261121/202611211550.M3lFLEKu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211550.M3lFLEKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611211550.M3lFLEKu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/crypto/vfio_ap_drv.c:65:17: error: 'struct device_driver' has no member named 'support_driver_override'
      65 |         .driver.support_driver_override = true,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/crypto/vfio_ap_drv.c:65:43: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      65 |         .driver.support_driver_override = true,
         |                                           ^~~~
   drivers/s390/crypto/vfio_ap_drv.c:65:43: note: (near initialization for 'vfio_ap_drv.driver.name')


vim +65 drivers/s390/crypto/vfio_ap_drv.c

1fde573413b549 Tony Krowiak    2018-09-25  57  
31aae32ca1258a Julian Wiedmann 2021-05-14  58  static struct ap_driver vfio_ap_drv = {
260f3ea1413823 Tony Krowiak    2020-10-14  59  	.probe = vfio_ap_mdev_probe_queue,
260f3ea1413823 Tony Krowiak    2020-10-14  60  	.remove = vfio_ap_mdev_remove_queue,
3f85d1df26a9d9 Tony Krowiak    2021-09-30  61  	.in_use = vfio_ap_mdev_resource_in_use,
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  62  	.on_config_changed = vfio_ap_on_cfg_changed,
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  63  	.on_scan_complete = vfio_ap_on_scan_complete,
31aae32ca1258a Julian Wiedmann 2021-05-14  64  	.ids = ap_queue_ids,
66fe1c784ba4f6 Alex Williamson 2026-11-18 @65  	.driver.support_driver_override = true,
31aae32ca1258a Julian Wiedmann 2021-05-14  66  };
31aae32ca1258a Julian Wiedmann 2021-05-14  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
