Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490C10E7
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680211578; x=1711747578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToUO1coEhoYRrfQIvXisBOgCYJdRjTWeR3hOp7tcsbA=;
  b=fsrawqCMlGCw+A9wTIJGwHAdBdEEfrz6RMf+3xbQow2t9i4j2dVAtZ8a
   uIn+ntl70Fb9DvLvIUMRm8B339N/mbSbpOTJvMYPTTKKOHk64IQkNJnAf
   3XmYby2tY7An/P+trtXH5DVNULr2/bm+dn76zWYU81kH6enEo6IyWkLnv
   DBv5FVsuWOEEKxQUhz20qZf4LvBGpyCE9r2QVorAMOBnTOb6EGPXgxs0n
   waZ+SMsft+a/XvB3rJA/LwXq/XkJtgYINtE2XGFla2xzzB/9Y6cTxP2b1
   d3irhIr4UsSvLjSfnX1FtlD2oawQlLqwoORtOuuwpXFhOLz757eBnsnuU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340016080"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="340016080"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 14:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678353820"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="678353820"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 14:26:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phzmc-000LDm-1p;
	Thu, 30 Mar 2023 21:26:10 +0000
Date: Fri, 31 Mar 2023 05:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ata/libahci_platform.c:551 ahci_platform_get_resources()
 warn: passing zero to 'ERR_PTR'
Message-ID: <202303310509.vTRnuZuL-lkp@intel.com>
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
TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bb95a1662f8b97c443984550a7aefbe5a1a064e
commit: e28b3abf8020a884bd3b7758ea8915365af8fadf ata: libahci_platform: Convert to using devm bulk clocks API
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310509.vTRnuZuL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303310509.vTRnuZuL-lkp@intel.com/

smatch warnings:
drivers/ata/libahci_platform.c:551 ahci_platform_get_resources() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +551 drivers/ata/libahci_platform.c

b1a9edbda040a4 Antoine Tenart            2014-07-30  512  
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  513  			rc = ahci_platform_get_phy(hpriv, port, dev, child);
d7f76f36a8b4dc Nishka Dasgupta           2019-08-15  514  			if (rc) {
d7f76f36a8b4dc Nishka Dasgupta           2019-08-15  515  				of_node_put(child);
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  516  				goto err_out;
d7f76f36a8b4dc Nishka Dasgupta           2019-08-15  517  			}
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  518  
b1a9edbda040a4 Antoine Tenart            2014-07-30  519  			enabled_ports++;
b1a9edbda040a4 Antoine Tenart            2014-07-30  520  		}
b1a9edbda040a4 Antoine Tenart            2014-07-30  521  		if (!enabled_ports) {
b1a9edbda040a4 Antoine Tenart            2014-07-30  522  			dev_warn(dev, "No port enabled\n");
b1a9edbda040a4 Antoine Tenart            2014-07-30  523  			rc = -ENODEV;
b1a9edbda040a4 Antoine Tenart            2014-07-30  524  			goto err_out;
b1a9edbda040a4 Antoine Tenart            2014-07-30  525  		}
b1a9edbda040a4 Antoine Tenart            2014-07-30  526  
b1a9edbda040a4 Antoine Tenart            2014-07-30  527  		if (!hpriv->mask_port_map)
b1a9edbda040a4 Antoine Tenart            2014-07-30  528  			hpriv->mask_port_map = mask_port_map;
b1a9edbda040a4 Antoine Tenart            2014-07-30  529  	} else {
b1a9edbda040a4 Antoine Tenart            2014-07-30  530  		/*
b1a9edbda040a4 Antoine Tenart            2014-07-30  531  		 * If no sub-node was found, keep this for device tree
b1a9edbda040a4 Antoine Tenart            2014-07-30  532  		 * compatibility
b1a9edbda040a4 Antoine Tenart            2014-07-30  533  		 */
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  534  		rc = ahci_platform_get_phy(hpriv, 0, dev, dev->of_node);
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  535  		if (rc)
acbd573354bb7b Mikko Perttunen           2014-06-17  536  			goto err_out;
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  537  
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  538  		rc = ahci_platform_get_regulator(hpriv, 0, dev);
c7d7ddee7e24ee Gregory CLEMENT           2015-01-15  539  		if (rc == -EPROBE_DEFER)
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  540  			goto err_out;
b1a9edbda040a4 Antoine Tenart            2014-07-30  541  	}
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  542  	pm_runtime_enable(dev);
eac7e072d7e99f Tejun Heo                 2018-08-06  543  	pm_runtime_get_sync(dev);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  544  	hpriv->got_runtime_pm = true;
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  545  
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  546  	devres_remove_group(dev, NULL);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  547  	return hpriv;
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  548  
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  549  err_out:
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  550  	devres_release_group(dev, NULL);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25 @551  	return ERR_PTR(rc);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  552  }
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  553  EXPORT_SYMBOL_GPL(ahci_platform_get_resources);
fd990556f0fa25 Bartlomiej Zolnierkiewicz 2014-03-25  554  

:::::: The code at line 551 was first introduced by commit
:::::: fd990556f0fa25446c6bfa9cf4c9e49d387d4472 ata: move library code from ahci_platform.c to libahci_platform.c

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
