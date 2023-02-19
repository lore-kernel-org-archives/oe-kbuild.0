Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745880F
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676791352; x=1708327352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZxEb4DAJayHgrA/i5zK6y7g3Tq5EDALrZm6HGZH8Nc=;
  b=TyY3zgFkGp9ybjfBoRBlBUZHQEOQr1G/gGhKMvCHR7BMRsEFvrjpNB8z
   hjkdFav74udb3NPIIGsWXP2DGCDYd2N34c25Lowm4Y1BDLhUHWLU87Ct0
   4GL4HwzqAVky+yqAs8XNspA2VIMKUnMlQnQ/BAOo97yh5EDZbE15ME0+h
   S4TsD2aIPAqkJQjb6YC7P8NQ9+FTEr5b5J2Hfua4Myu09CEUiVJ4ifkRV
   DsF22zsNa2ZYRUvLX9u35u/Cbx5QgJfsLKz6qQK0h7d3eoUUzOzTNklf5
   P55obN9nMGs9frCFbU8lTyWimj1RrnOemPLmTx0BY6MOg5jc8bYqwcWFd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="311860771"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="311860771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 23:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="703393226"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="703393226"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2023 23:22:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTe1k-000D8P-2f;
	Sun, 19 Feb 2023 07:22:28 +0000
Date: Sun, 19 Feb 2023 15:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/sun/sunhme.c:2961 happy_meal_pci_probe() warn:
 missing error code 'err'
Message-ID: <202302191530.YKNv9kNx-lkp@intel.com>
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
TO: Sean Anderson <seanga2@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 5b3dc6dda6b1af8a6117d99394a6db81ec9be3d5 sunhme: Regularize probe errors
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191530.YKNv9kNx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191530.YKNv9kNx-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/sun/sunhme.c:2961 happy_meal_pci_probe() warn: missing error code 'err'

vim +/err +2961 drivers/net/ethernet/sun/sunhme.c

^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2943  
acb3f35f920b53 drivers/net/ethernet/sun/sunhme.c Rolf Eike Beer   2022-09-23  2944  	err = pci_enable_device(pdev);
acb3f35f920b53 drivers/net/ethernet/sun/sunhme.c Rolf Eike Beer   2022-09-23  2945  	if (err)
ef9467f8f08038 drivers/net/sunhme.c              Jurij Smakov     2006-12-03  2946  		goto err_out;
ef9467f8f08038 drivers/net/sunhme.c              Jurij Smakov     2006-12-03  2947  	pci_set_master(pdev);
ef9467f8f08038 drivers/net/sunhme.c              Jurij Smakov     2006-12-03  2948  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2949  	if (!strcmp(prom_name, "SUNW,qfe") || !strcmp(prom_name, "qfe")) {
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2950  		qp = quattro_pci_find(pdev);
d6f1e89bdbb873 drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2951  		if (IS_ERR(qp)) {
d6f1e89bdbb873 drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2952  			err = PTR_ERR(qp);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2953  			goto err_out;
d6f1e89bdbb873 drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2954  		}
d6f1e89bdbb873 drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2955  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2956  		for (qfe_slot = 0; qfe_slot < 4; qfe_slot++)
d6f1e89bdbb873 drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2957  			if (!qp->happy_meals[qfe_slot])
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2958  				break;
d6f1e89bdbb873 drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2959  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2960  		if (qfe_slot == 4)
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16 @2961  			goto err_out;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2962  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2963  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2964  	dev = alloc_etherdev(sizeof(struct happy_meal));
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2965  	if (!dev) {
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2966  		err = -ENOMEM;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2967  		goto err_out;
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2968  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2969  	SET_NETDEV_DEV(dev, &pdev->dev);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2970  
8f15ea42b64941 drivers/net/sunhme.c              Wang Chen        2008-11-12  2971  	hp = netdev_priv(dev);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2972  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2973  	hp->happy_dev = pdev;
db1a8611c87337 drivers/net/sunhme.c              David S. Miller  2008-08-29  2974  	hp->dma_dev = &pdev->dev;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2975  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2976  	spin_lock_init(&hp->happy_lock);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2977  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2978  	if (qp != NULL) {
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2979  		hp->qfe_parent = qp;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2980  		hp->qfe_ent = qfe_slot;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2981  		qp->happy_meals[qfe_slot] = dev;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2982  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2983  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2984  	hpreg_res = pci_resource_start(pdev, 0);
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2985  	err = -EINVAL;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2986  	if ((pci_resource_flags(pdev, 0) & IORESOURCE_IO) != 0) {
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2987  		printk(KERN_ERR "happymeal(PCI): Cannot find proper PCI device base address.\n");
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2988  		goto err_out_clear_quattro;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2989  	}
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2990  
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2991  	err = pci_request_regions(pdev, DRV_NAME);
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2992  	if (err) {
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2993  		printk(KERN_ERR "happymeal(PCI): Cannot obtain PCI resources, "
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2994  		       "aborting.\n");
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2995  		goto err_out_clear_quattro;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2996  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  2997  
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2998  	hpreg_base = ioremap(hpreg_res, 0x8000);
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  2999  	if (!hpreg_base) {
5b3dc6dda6b1af drivers/net/ethernet/sun/sunhme.c Sean Anderson    2022-09-23  3000  		err = -ENOMEM;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3001  		printk(KERN_ERR "happymeal(PCI): Unable to remap card memory.\n");
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3002  		goto err_out_free_res;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3003  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3004  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3005  	for (i = 0; i < 6; i++) {
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3006  		if (macaddr[i] != 0)
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3007  			break;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3008  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3009  	if (i < 6) { /* a mac address was given */
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3010  		for (i = 0; i < 6; i++)
a7639279c93c1e drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-08  3011  			addr[i] = macaddr[i];
a7639279c93c1e drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-08  3012  		eth_hw_addr_set(dev, addr);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3013  		macaddr[5]++;
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3014  	} else {
9e326acf567b60 drivers/net/sunhme.c              David S. Miller  2006-06-23  3015  #ifdef CONFIG_SPARC
ccf0dec6fcadb4 drivers/net/sunhme.c              Stephen Rothwell 2007-03-29  3016  		const unsigned char *addr;
de8d28b16f5614 drivers/net/sunhme.c              David S. Miller  2006-06-22  3017  		int len;
de8d28b16f5614 drivers/net/sunhme.c              David S. Miller  2006-06-22  3018  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3019  		if (qfe_slot != -1 &&
8e95a2026f3b43 drivers/net/sunhme.c              Joe Perches      2009-12-03  3020  		    (addr = of_get_property(dp, "local-mac-address", &len))
8e95a2026f3b43 drivers/net/sunhme.c              Joe Perches      2009-12-03  3021  			!= NULL &&
8e95a2026f3b43 drivers/net/sunhme.c              Joe Perches      2009-12-03  3022  		    len == 6) {
a96d317fb1a30b drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-01  3023  			eth_hw_addr_set(dev, addr);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3024  		} else {
a96d317fb1a30b drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-01  3025  			eth_hw_addr_set(dev, idprom->id_ethaddr);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3026  		}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3027  #else
a7639279c93c1e drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-08  3028  		u8 addr[ETH_ALEN];
a7639279c93c1e drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-08  3029  
a7639279c93c1e drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-08  3030  		get_hme_mac_nonsparc(pdev, addr);
a7639279c93c1e drivers/net/ethernet/sun/sunhme.c Jakub Kicinski   2021-10-08  3031  		eth_hw_addr_set(dev, addr);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3032  #endif
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3033  	}
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3034  
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3035  	/* Layout registers. */
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3036  	hp->gregs      = (hpreg_base + 0x0000UL);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3037  	hp->etxregs    = (hpreg_base + 0x2000UL);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3038  	hp->erxregs    = (hpreg_base + 0x4000UL);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3039  	hp->bigmacregs = (hpreg_base + 0x6000UL);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3040  	hp->tcvregs    = (hpreg_base + 0x7000UL);
^1da177e4c3f41 drivers/net/sunhme.c              Linus Torvalds   2005-04-16  3041  

:::::: The code at line 2961 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
