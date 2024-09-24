Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A71B85D1
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 04:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727153945; cv=none; b=AoNkq45XT4Z5rbm0s0+ZD97gM0krlV3pkrVhrYSRLNF8QfKn9Hpl98BADORz+di+7zrfNIrNhKsuaqWPKT3jlorsluVIEImZ5imCglodNqjZg6HbcK93J0D49KZSvCt3g179LDHtK7iwHgdNCKjiw+ONLltDgvZ0KFsLeToaVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727153945; c=relaxed/simple;
	bh=/VUWzcYti37Sfp17eY9XziuwTJRR6JlZRqkkzLYp01s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I9XM8fPRQ4SKBzY0eSVqi1OOt3iL438W5O1g7tkTFZw6kNY105DsT4CLU5xb9cGEnuu9l/oTbDZ2vXpheYcpnNzVkKQdwxxa4FuDVg5/dvcW5kzSwtOcq7lUkA7kcJghwprpg4uRkSMBVcOEmZ+p7+a4SSjeiJstqOBhb8DeHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuTU/SR1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuTU/SR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727153944; x=1758689944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VUWzcYti37Sfp17eY9XziuwTJRR6JlZRqkkzLYp01s=;
  b=VuTU/SR1IyUq1UpO269Ez4DvBb/PQCyEf/SmC7mFbKKFTm6TSiCpgLpY
   YHvgzC9qhD+4lwt2qkcLK5J/8mfAtzOIU+3MkQjsGmLgG+xkZusIlD8j6
   IhYsoryYoawrZl1SrTuA13gZcGnNnmm1WeEsLk/kxPvZaTz4snl2GBQbE
   2tuxwurJoR7D1GlkEouImK7ObKXVlkN6hBVsgNJZHGUhzCBwzR963OhP0
   WwIs4w/UeORqpE7KxB0NYzZ7axigy1AUnWtble+4X8y7A2Vw9sVuCqM/Q
   zCjNaKT8lbmJcanDbdCdTtgvHNU8M7k+l0uI6h98KTQ/+F0LRNB7YcROo
   A==;
X-CSE-ConnectionGUID: 6wReNR4STAeGtccggObH9w==
X-CSE-MsgGUID: bWSfqXWWSSiFbQXPt/A6lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48661026"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="48661026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 21:59:03 -0700
X-CSE-ConnectionGUID: iN3zQoiITUSIaIgqxPBftw==
X-CSE-MsgGUID: wxjMUEdQQ8GZnN7Ao6RQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76063841"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 21:59:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssxda-000HxF-2S;
	Tue, 24 Sep 2024 04:58:58 +0000
Date: Tue, 24 Sep 2024 12:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/8250/8250_port.c:2964
 serial8250_request_std_resource() warn: 'port->membase' from ioremap() not
 released on lines: 2964.
Message-ID: <202409241229.d2yab8Vq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r072-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241229.d2yab8Vq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241229.d2yab8Vq-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_port.c:2964 serial8250_request_std_resource() warn: 'port->membase' from ioremap() not released on lines: 2964.
drivers/net/ethernet/smsc/smc91x.c:2056 smc_probe() warn: 'dev->irq' from request_irq() not released on lines: 2056.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +2964 drivers/tty/serial/8250/8250_port.c

b6830f6df8914f Peter Hurley      2015-06-27  2922  
b6830f6df8914f Peter Hurley      2015-06-27  2923  /*
b6830f6df8914f Peter Hurley      2015-06-27  2924   * Resource handling.
b6830f6df8914f Peter Hurley      2015-06-27  2925   */
b6830f6df8914f Peter Hurley      2015-06-27  2926  static int serial8250_request_std_resource(struct uart_8250_port *up)
b6830f6df8914f Peter Hurley      2015-06-27  2927  {
b6830f6df8914f Peter Hurley      2015-06-27  2928  	unsigned int size = serial8250_port_size(up);
b6830f6df8914f Peter Hurley      2015-06-27  2929  	struct uart_port *port = &up->port;
b6830f6df8914f Peter Hurley      2015-06-27  2930  	int ret = 0;
b6830f6df8914f Peter Hurley      2015-06-27  2931  
b6830f6df8914f Peter Hurley      2015-06-27  2932  	switch (port->iotype) {
b6830f6df8914f Peter Hurley      2015-06-27  2933  	case UPIO_AU:
b6830f6df8914f Peter Hurley      2015-06-27  2934  	case UPIO_TSI:
b6830f6df8914f Peter Hurley      2015-06-27  2935  	case UPIO_MEM32:
b6830f6df8914f Peter Hurley      2015-06-27  2936  	case UPIO_MEM32BE:
bd94c4077a0b2e Masahiro Yamada   2015-10-28  2937  	case UPIO_MEM16:
b6830f6df8914f Peter Hurley      2015-06-27  2938  	case UPIO_MEM:
6e690d54cfa802 Yi Yang           2022-06-28  2939  		if (!port->mapbase) {
6e690d54cfa802 Yi Yang           2022-06-28  2940  			ret = -EINVAL;
b6830f6df8914f Peter Hurley      2015-06-27  2941  			break;
6e690d54cfa802 Yi Yang           2022-06-28  2942  		}
b6830f6df8914f Peter Hurley      2015-06-27  2943  
b6830f6df8914f Peter Hurley      2015-06-27  2944  		if (!request_mem_region(port->mapbase, size, "serial")) {
b6830f6df8914f Peter Hurley      2015-06-27  2945  			ret = -EBUSY;
b6830f6df8914f Peter Hurley      2015-06-27  2946  			break;
b6830f6df8914f Peter Hurley      2015-06-27  2947  		}
b6830f6df8914f Peter Hurley      2015-06-27  2948  
b6830f6df8914f Peter Hurley      2015-06-27  2949  		if (port->flags & UPF_IOREMAP) {
4bdc0d676a6431 Christoph Hellwig 2020-01-06  2950  			port->membase = ioremap(port->mapbase, size);
b6830f6df8914f Peter Hurley      2015-06-27  2951  			if (!port->membase) {
b6830f6df8914f Peter Hurley      2015-06-27  2952  				release_mem_region(port->mapbase, size);
b6830f6df8914f Peter Hurley      2015-06-27  2953  				ret = -ENOMEM;
b6830f6df8914f Peter Hurley      2015-06-27  2954  			}
b6830f6df8914f Peter Hurley      2015-06-27  2955  		}
b6830f6df8914f Peter Hurley      2015-06-27  2956  		break;
b6830f6df8914f Peter Hurley      2015-06-27  2957  
b6830f6df8914f Peter Hurley      2015-06-27  2958  	case UPIO_HUB6:
b6830f6df8914f Peter Hurley      2015-06-27  2959  	case UPIO_PORT:
b6830f6df8914f Peter Hurley      2015-06-27  2960  		if (!request_region(port->iobase, size, "serial"))
b6830f6df8914f Peter Hurley      2015-06-27  2961  			ret = -EBUSY;
b6830f6df8914f Peter Hurley      2015-06-27  2962  		break;
b6830f6df8914f Peter Hurley      2015-06-27  2963  	}
b6830f6df8914f Peter Hurley      2015-06-27 @2964  	return ret;
b6830f6df8914f Peter Hurley      2015-06-27  2965  }
b6830f6df8914f Peter Hurley      2015-06-27  2966  

:::::: The code at line 2964 was first introduced by commit
:::::: b6830f6df8914faae9561bb245860c21af9b9e9b serial: 8250: Split base port operations from universal driver

:::::: TO: Peter Hurley <peter@hurleysoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
