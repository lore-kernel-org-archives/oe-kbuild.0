Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35C7B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678531191; x=1710067191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Jih5SxHfeQiTLm4bG0PK+ctNgr4s2r+iZX96xqBhko=;
  b=W3hMc54Ib3jMnX4GwQVEPWXYME00gMj5NliIn142s4V9xagpghpKmool
   4FKD4cqPwp/TdBD6MJqcppM3q9ONe9utVCHNFf8OupaJcdwNFsl84sxmH
   QpiJSOtTxKd1QNaEcgpv0jUIURsxzDTn0iSUq0UgPc/C9HsLvCvBDHKg8
   pl/VRIlGUEwyMwq0QmP43MAbs0GEhz6T8aXucZi9lY1aNMTZWnzDJSC9y
   uPg7nCtwSZJDK6ksFsx4Rsf77ZryI2N5tpF9tgxAdrZaUuCqVsb3tgzGn
   IAurfeAEFYYibLQA9FW4DHFT/Gabb1CT0QJMxeJObTppyzvXDcYzOmE7M
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="320744655"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="320744655"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 02:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="747027101"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="747027101"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2023 02:39:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pawdf-0004Vt-3A;
	Sat, 11 Mar 2023 10:39:47 +0000
Date: Sat, 11 Mar 2023 18:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ata/pata_parport/pata_parport.c:446 pi_init_one() warn:
 possible memory leak of 'pi'
Message-ID: <202303111822.IHNchbkp-lkp@intel.com>
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
TO: Ondrej Zary <linux@zary.sk>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef5f68cc1f829b492b19cd4df5af4454aa816b93
commit: 72f2b0b2185099dce354c805009f591dda3ab73d drivers/block: Move PARIDE protocol modules to drivers/ata/pata_parport
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230311/202303111822.IHNchbkp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303111822.IHNchbkp-lkp@intel.com/

New smatch warnings:
drivers/ata/pata_parport/pata_parport.c:446 pi_init_one() warn: possible memory leak of 'pi'
drivers/ata/pata_parport/comm.c:64 comm_read_regr() warn: inconsistent indenting
drivers/ata/pata_parport/comm.c:164 comm_write_block() warn: inconsistent indenting

Old smatch warnings:
drivers/ata/pata_parport/pata_parport.c:445 pi_init_one() warn: unsigned 'pi->dev.id' is never less than zero.
drivers/ata/pata_parport/comm.c:168 comm_write_block() warn: inconsistent indenting
drivers/ata/pata_parport/comm.c:172 comm_write_block() warn: inconsistent indenting

vim +/pi +446 drivers/ata/pata_parport/pata_parport.c

246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  417  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  418  static struct pi_adapter *pi_init_one(struct parport *parport,
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  419  			struct pi_protocol *pr, int mode, int unit, int delay)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  420  {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  421  	struct pardev_cb par_cb = { };
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  422  	char scratch[512];
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  423  	const struct ata_port_info *ppi[] = { &pata_parport_port_info };
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  424  	struct ata_host *host;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  425  	struct pi_adapter *pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  426  	struct pi_device_match match = { .parport = parport, .proto = pr };
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  427  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  428  	/*
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  429  	 * Abort if there's a device already registered on the same parport
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  430  	 * using the same protocol.
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  431  	 */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  432  	if (bus_for_each_dev(&pata_parport_bus_type, NULL, &match, pi_find_dev))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  433  		return NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  434  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  435  	pi = kzalloc(sizeof(struct pi_adapter), GFP_KERNEL);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  436  	if (!pi)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  437  		return NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  438  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  439  	/* set up pi->dev before pi_probe_unit() so it can use dev_printk() */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  440  	pi->dev.parent = &pata_parport_bus;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  441  	pi->dev.bus = &pata_parport_bus_type;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  442  	pi->dev.driver = &pr->driver;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  443  	pi->dev.release = pata_parport_dev_release;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  444  	pi->dev.id = ida_alloc(&pata_parport_bus_dev_ids, GFP_KERNEL);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  445  	if (pi->dev.id < 0)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23 @446  		return NULL; /* pata_parport_dev_release will do kfree(pi) */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  447  	dev_set_name(&pi->dev, "pata_parport.%u", pi->dev.id);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  448  	if (device_register(&pi->dev)) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  449  		put_device(&pi->dev);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  450  		goto out_ida_free;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  451  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  452  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  453  	pi->proto = pr;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  454  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  455  	if (!try_module_get(pi->proto->owner))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  456  		goto out_unreg_dev;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  457  	if (pi->proto->init_proto && pi->proto->init_proto(pi) < 0)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  458  		goto out_module_put;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  459  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  460  	pi->delay = (delay == -1) ? pi->proto->default_delay : delay;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  461  	pi->mode = mode;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  462  	pi->port = parport->base;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  463  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  464  	par_cb.private = pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  465  	pi->pardev = parport_register_dev_model(parport, DRV_NAME, &par_cb,
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  466  						pi->dev.id);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  467  	if (!pi->pardev)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  468  		goto out_module_put;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  469  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  470  	if (!pi_probe_unit(pi, unit, scratch)) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  471  		dev_info(&pi->dev, "Adapter not found\n");
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  472  		goto out_unreg_parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  473  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  474  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  475  	pi->proto->log_adapter(pi, scratch, 1);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  476  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  477  	host = ata_host_alloc_pinfo(&pi->pardev->dev, ppi, 1);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  478  	if (!host)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  479  		goto out_unreg_parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  480  	dev_set_drvdata(&pi->dev, host);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  481  	host->private_data = pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  482  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  483  	ata_port_desc(host->ports[0], "port %s", pi->pardev->port->name);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  484  	ata_port_desc(host->ports[0], "protocol %s", pi->proto->name);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  485  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  486  	pi_connect(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  487  	if (ata_host_activate(host, 0, NULL, 0, &pata_parport_sht))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  488  		goto out_unreg_parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  489  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  490  	return pi;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  491  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  492  out_unreg_parport:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  493  	pi_disconnect(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  494  	parport_unregister_device(pi->pardev);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  495  	if (pi->proto->release_proto)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  496  		pi->proto->release_proto(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  497  out_module_put:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  498  	module_put(pi->proto->owner);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  499  out_unreg_dev:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  500  	device_unregister(&pi->dev);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  501  out_ida_free:
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  502  	ida_free(&pata_parport_bus_dev_ids, pi->dev.id);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  503  	return NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  504  }
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  505  

:::::: The code at line 446 was first introduced by commit
:::::: 246a1c4c6b7ffba88a2553d2b88f7b6280f253a2 ata: pata_parport: add driver (PARIDE replacement)

:::::: TO: Ondrej Zary <linux@zary.sk>
:::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
