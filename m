Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4070969
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tawydorr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701901567; x=1733437567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeYtszIQsx4X7KieNkFSHwUXFRpsBGJryIMzYRhhyAk=;
  b=Tawydorr+/k5R0A4B2mpvxWtxnM6wjWr8XZDOwRzFwu7UmOH9xKHejCl
   naODFcH19+3NeF8W+578q0oj2URz/CZXkU9Z740phKCJ/rdP5Xr8wLpXv
   JmdLCIeGETc+4ko84wj6dY8WTLkfvOvCAxucriFItB69impxag/z3w+HX
   BIvBLx3pkU0P+FB+PCkXYLWf8uYEQZd0bHGNaXQiW4rcP77+a2DYzqmSq
   eRZwKvLbxowveUiueR4cl7QkiMx+lcQbloZxCO2OC06403mcJpNNAuYJJ
   8SKErUZr10v8hMqUje30qHjK3ldE82yu0to4+E/ao/6BqAz37f4t+Pdfz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12852024"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12852024"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 14:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862245790"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862245790"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2023 14:26:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB0LD-000BUs-07;
	Wed, 06 Dec 2023 22:26:03 +0000
Date: Thu, 7 Dec 2023 06:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/edac/i10nm_base.c:712:3-9: ERROR: missing iounmap; ioremap
 on line 742 and execution via conditional on line 711
Message-ID: <202312070628.O5O5eKkw-lkp@intel.com>
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
TO: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
CC: Tony Luck <tony.luck@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: c545f5e412250555bd4e717d062b117f20bab418 EDAC/i10nm: Skip the absent memory controllers
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-103-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070628.O5O5eKkw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070628.O5O5eKkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312070628.O5O5eKkw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/edac/i10nm_base.c:712:3-9: ERROR: missing iounmap; ioremap on line 742 and execution via conditional on line 711
   drivers/edac/i10nm_base.c:718:3-9: ERROR: missing iounmap; ioremap on line 742 and execution via conditional on line 717
   drivers/edac/i10nm_base.c:722:3-9: ERROR: missing iounmap; ioremap on line 742 and execution via conditional on line 720
   drivers/edac/i10nm_base.c:734:4-10: ERROR: missing iounmap; ioremap on line 742 and execution via conditional on line 732
   drivers/edac/i10nm_base.c:746:4-10: ERROR: missing iounmap; ioremap on line 742 and execution via conditional on line 743

vim +712 drivers/edac/i10nm_base.c

c545f5e4122505 Qiuxu Zhuo 2023-07-10  696  
c945088384d00e Qiuxu Zhuo 2021-06-11  697  static int i10nm_get_ddr_munits(void)
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  698  {
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  699  	struct pci_dev *mdev;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  700  	void __iomem *mbase;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  701  	unsigned long size;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  702  	struct skx_dev *d;
c545f5e4122505 Qiuxu Zhuo 2023-07-10  703  	int i, lmc, j = 0;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  704  	u32 reg, off;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  705  	u64 base;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  706  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  707  	list_for_each_entry(d, i10nm_edac_list, list) {
dd7814b7853941 Qiuxu Zhuo 2023-01-13  708  		d->util_all = pci_get_dev_wrapper(d->seg, d->bus[res_cfg->util_all_bdf.bus],
dd7814b7853941 Qiuxu Zhuo 2023-01-13  709  						  res_cfg->util_all_bdf.dev,
dd7814b7853941 Qiuxu Zhuo 2023-01-13  710  						  res_cfg->util_all_bdf.fun);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30 @711  		if (!d->util_all)
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30 @712  			return -ENODEV;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  713  
dd7814b7853941 Qiuxu Zhuo 2023-01-13  714  		d->uracu = pci_get_dev_wrapper(d->seg, d->bus[res_cfg->uracu_bdf.bus],
dd7814b7853941 Qiuxu Zhuo 2023-01-13  715  					       res_cfg->uracu_bdf.dev,
dd7814b7853941 Qiuxu Zhuo 2023-01-13  716  					       res_cfg->uracu_bdf.fun);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  717  		if (!d->uracu)
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  718  			return -ENODEV;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  719  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  720  		if (I10NM_GET_SCK_BAR(d, reg)) {
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  721  			i10nm_printk(KERN_ERR, "Failed to socket bar\n");
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  722  			return -ENODEV;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  723  		}
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  724  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  725  		base = I10NM_GET_SCK_MMIO_BASE(reg);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  726  		edac_dbg(2, "socket%d mmio base 0x%llx (reg 0x%x)\n",
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  727  			 j++, base, reg);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  728  
c545f5e4122505 Qiuxu Zhuo 2023-07-10  729  		for (lmc = 0, i = 0; i < res_cfg->ddr_imc_num; i++) {
ba987eaaabf99b Qiuxu Zhuo 2023-01-13  730  			mdev = get_ddr_munit(d, i, &off, &size);
ba987eaaabf99b Qiuxu Zhuo 2023-01-13  731  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  732  			if (i == 0 && !mdev) {
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  733  				i10nm_printk(KERN_ERR, "No IMC found\n");
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  734  				return -ENODEV;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  735  			}
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  736  			if (!mdev)
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  737  				continue;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  738  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  739  			edac_dbg(2, "mc%d mmio base 0x%llx size 0x%lx (reg 0x%x)\n",
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  740  				 i, base + off, size, reg);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  741  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30 @742  			mbase = ioremap(base + off, size);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  743  			if (!mbase) {
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  744  				i10nm_printk(KERN_ERR, "Failed to ioremap 0x%llx\n",
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  745  					     base + off);
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  746  				return -ENODEV;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  747  			}
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  748  
c545f5e4122505 Qiuxu Zhuo 2023-07-10  749  			d->imc[lmc].mbase = mbase;
c545f5e4122505 Qiuxu Zhuo 2023-07-10  750  			if (i10nm_imc_absent(&d->imc[lmc])) {
c545f5e4122505 Qiuxu Zhuo 2023-07-10  751  				pci_dev_put(mdev);
c545f5e4122505 Qiuxu Zhuo 2023-07-10  752  				iounmap(mbase);
c545f5e4122505 Qiuxu Zhuo 2023-07-10  753  				d->imc[lmc].mbase = NULL;
c545f5e4122505 Qiuxu Zhuo 2023-07-10  754  				edac_dbg(2, "Skip absent mc%d\n", i);
c545f5e4122505 Qiuxu Zhuo 2023-07-10  755  				continue;
c545f5e4122505 Qiuxu Zhuo 2023-07-10  756  			} else {
c545f5e4122505 Qiuxu Zhuo 2023-07-10  757  				d->imc[lmc].mdev = mdev;
c545f5e4122505 Qiuxu Zhuo 2023-07-10  758  				lmc++;
c545f5e4122505 Qiuxu Zhuo 2023-07-10  759  			}
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  760  		}
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  761  	}
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  762  
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  763  	return 0;
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  764  }
d4dc89d069aab9 Qiuxu Zhuo 2019-01-30  765  

:::::: The code at line 712 was first introduced by commit
:::::: d4dc89d069aab9074e2493a4c2f3969a0a0b91c1 EDAC, i10nm: Add a driver for Intel 10nm server processors

:::::: TO: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
