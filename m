Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0B67E
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683203507; x=1714739507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HPBG/Cn/k7Sd24wTRIHvRMeDkzXAzu+r/R7Z7TvZ+s=;
  b=MJRY4uov8+pbZ/lsOCaIdlW1D0/dWIOgw61Z6e8XV9pyI0BXsaEKuJdM
   zq/JbMRlEhVCm3zhPnChmod0DF+MYVZQaCvG9vOxiviAGZITNFMsIJ8mA
   mXTxieX1d9M+VkkYOYRwHVSGSowSGP50lBujOFKmKDsCAsasyl9A4FKTY
   yYJ1KXRfLWjkkb5K/OEuqU9PLNpVIkXk3KbNNnc3JqBnKr++rt1oy9/Uh
   TVDOiYf6ufivz9MAdXyPuNminuHSpDZY0gOw3flgNcqsGaWPoXMeFiDJr
   RQ4OUzHUba1zcuBivuCprc7REtg+h1w0I3NXA6oQpFxw1zG3fTCkspfbm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435226507"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="435226507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 05:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729777443"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="729777443"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 May 2023 05:31:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puY7I-0002uf-1u;
	Thu, 04 May 2023 12:31:24 +0000
Date: Thu, 4 May 2023 20:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-simtec.c:126 simtec_i2c_probe() warn:
 'res->start' from __request_region() not released on lines: 126.
Message-ID: <202305042021.ngFDsm4y-lkp@intel.com>
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
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: "Martyna Szapar-Mudlaw" <martyna.szapar-mudlaw@linux.intel.com>
CC: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1a5304fecee523060f26e2778d9d8e33c0562df3
commit: 3246a10752a7120878740f345f3956997777b3d6 ice: Add support for XDP multi-buffer on Tx side
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230504/202305042021.ngFDsm4y-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305042021.ngFDsm4y-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-simtec.c:126 simtec_i2c_probe() warn: 'res->start' from __request_region() not released on lines: 126.
drivers/net/ethernet/intel/ice/ice_txrx.c:1304 ice_clean_rx_irq() error: uninitialized symbol 'cached_ntu'.

Old smatch warnings:
drivers/net/ethernet/intel/ice/ice_txrx.c:999 ice_build_skb() error: uninitialized symbol 'nr_frags'.

vim +126 drivers/i2c/busses/i2c-simtec.c

bcda9f1eb0de0e Ben Dooks      2007-05-01   59  
bcda9f1eb0de0e Ben Dooks      2007-05-01   60  static int simtec_i2c_probe(struct platform_device *dev)
bcda9f1eb0de0e Ben Dooks      2007-05-01   61  {
bcda9f1eb0de0e Ben Dooks      2007-05-01   62  	struct simtec_i2c_data *pd;
bcda9f1eb0de0e Ben Dooks      2007-05-01   63  	struct resource *res;
bcda9f1eb0de0e Ben Dooks      2007-05-01   64  	int size;
bcda9f1eb0de0e Ben Dooks      2007-05-01   65  	int ret;
bcda9f1eb0de0e Ben Dooks      2007-05-01   66  
bcda9f1eb0de0e Ben Dooks      2007-05-01   67  	pd = kzalloc(sizeof(struct simtec_i2c_data), GFP_KERNEL);
46797a2adbf0cd Jingoo Han     2014-05-13   68  	if (pd == NULL)
bcda9f1eb0de0e Ben Dooks      2007-05-01   69  		return -ENOMEM;
bcda9f1eb0de0e Ben Dooks      2007-05-01   70  
bcda9f1eb0de0e Ben Dooks      2007-05-01   71  	platform_set_drvdata(dev, pd);
bcda9f1eb0de0e Ben Dooks      2007-05-01   72  
bcda9f1eb0de0e Ben Dooks      2007-05-01   73  	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
bcda9f1eb0de0e Ben Dooks      2007-05-01   74  	if (res == NULL) {
bcda9f1eb0de0e Ben Dooks      2007-05-01   75  		dev_err(&dev->dev, "cannot find IO resource\n");
bcda9f1eb0de0e Ben Dooks      2007-05-01   76  		ret = -ENOENT;
bcda9f1eb0de0e Ben Dooks      2007-05-01   77  		goto err;
bcda9f1eb0de0e Ben Dooks      2007-05-01   78  	}
bcda9f1eb0de0e Ben Dooks      2007-05-01   79  
593308259bbd33 Julia Lawall   2009-07-05   80  	size = resource_size(res);
bcda9f1eb0de0e Ben Dooks      2007-05-01   81  
bcda9f1eb0de0e Ben Dooks      2007-05-01   82  	pd->ioarea = request_mem_region(res->start, size, dev->name);
bcda9f1eb0de0e Ben Dooks      2007-05-01   83  	if (pd->ioarea == NULL) {
bcda9f1eb0de0e Ben Dooks      2007-05-01   84  		dev_err(&dev->dev, "cannot request IO\n");
bcda9f1eb0de0e Ben Dooks      2007-05-01   85  		ret = -ENXIO;
bcda9f1eb0de0e Ben Dooks      2007-05-01   86  		goto err;
bcda9f1eb0de0e Ben Dooks      2007-05-01   87  	}
bcda9f1eb0de0e Ben Dooks      2007-05-01   88  
bcda9f1eb0de0e Ben Dooks      2007-05-01   89  	pd->reg = ioremap(res->start, size);
bcda9f1eb0de0e Ben Dooks      2007-05-01   90  	if (pd->reg == NULL) {
bcda9f1eb0de0e Ben Dooks      2007-05-01   91  		dev_err(&dev->dev, "cannot map IO\n");
bcda9f1eb0de0e Ben Dooks      2007-05-01   92  		ret = -ENXIO;
bcda9f1eb0de0e Ben Dooks      2007-05-01   93  		goto err_res;
bcda9f1eb0de0e Ben Dooks      2007-05-01   94  	}
bcda9f1eb0de0e Ben Dooks      2007-05-01   95  
bcda9f1eb0de0e Ben Dooks      2007-05-01   96  	/* setup the private data */
bcda9f1eb0de0e Ben Dooks      2007-05-01   97  
bcda9f1eb0de0e Ben Dooks      2007-05-01   98  	pd->adap.owner = THIS_MODULE;
bcda9f1eb0de0e Ben Dooks      2007-05-01   99  	pd->adap.algo_data = &pd->bit;
bcda9f1eb0de0e Ben Dooks      2007-05-01  100  	pd->adap.dev.parent = &dev->dev;
bcda9f1eb0de0e Ben Dooks      2007-05-01  101  
ea1558ce149d28 Wolfram Sang   2022-08-11  102  	strscpy(pd->adap.name, "Simtec I2C", sizeof(pd->adap.name));
bcda9f1eb0de0e Ben Dooks      2007-05-01  103  
bcda9f1eb0de0e Ben Dooks      2007-05-01  104  	pd->bit.data = pd;
bcda9f1eb0de0e Ben Dooks      2007-05-01  105  	pd->bit.setsda = simtec_i2c_setsda;
bcda9f1eb0de0e Ben Dooks      2007-05-01  106  	pd->bit.setscl = simtec_i2c_setscl;
bcda9f1eb0de0e Ben Dooks      2007-05-01  107  	pd->bit.getsda = simtec_i2c_getsda;
bcda9f1eb0de0e Ben Dooks      2007-05-01  108  	pd->bit.getscl = simtec_i2c_getscl;
bcda9f1eb0de0e Ben Dooks      2007-05-01  109  	pd->bit.timeout = HZ;
bcda9f1eb0de0e Ben Dooks      2007-05-01  110  	pd->bit.udelay = 20;
bcda9f1eb0de0e Ben Dooks      2007-05-01  111  
bcda9f1eb0de0e Ben Dooks      2007-05-01  112  	ret = i2c_bit_add_bus(&pd->adap);
bcda9f1eb0de0e Ben Dooks      2007-05-01  113  	if (ret)
bcda9f1eb0de0e Ben Dooks      2007-05-01  114  		goto err_all;
bcda9f1eb0de0e Ben Dooks      2007-05-01  115  
bcda9f1eb0de0e Ben Dooks      2007-05-01  116  	return 0;
bcda9f1eb0de0e Ben Dooks      2007-05-01  117  
bcda9f1eb0de0e Ben Dooks      2007-05-01  118   err_all:
bcda9f1eb0de0e Ben Dooks      2007-05-01  119  	iounmap(pd->reg);
bcda9f1eb0de0e Ben Dooks      2007-05-01  120  
bcda9f1eb0de0e Ben Dooks      2007-05-01  121   err_res:
42543aeb48e370 Anton Vasilyev 2017-08-10  122  	release_mem_region(pd->ioarea->start, size);
bcda9f1eb0de0e Ben Dooks      2007-05-01  123  
bcda9f1eb0de0e Ben Dooks      2007-05-01  124   err:
bcda9f1eb0de0e Ben Dooks      2007-05-01  125  	kfree(pd);
bcda9f1eb0de0e Ben Dooks      2007-05-01 @126  	return ret;
bcda9f1eb0de0e Ben Dooks      2007-05-01  127  }
bcda9f1eb0de0e Ben Dooks      2007-05-01  128  

:::::: The code at line 126 was first introduced by commit
:::::: bcda9f1eb0de0e1108c8b2765e5b7afa0dfb6c9f i2c: New Simtec I2C bus driver

:::::: TO: Ben Dooks <ben@fluff.org>
:::::: CC: Jean Delvare <khali@hyperion.delvare>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
