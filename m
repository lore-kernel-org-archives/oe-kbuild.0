Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAD21EB44
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jan 2025 23:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736723843; cv=none; b=dOFgZATYN1lEQOd/xZp+21QENkVi0v+uHlAOTbPpTc6PML81qiXVW2dTX3DB9tPwI1CoO3AwmQBJTjvij9ubP9VZ8qr+4x5UjXbrzn6aq0oaXsj4MqEjrqXYUnBpcXV9dswlN5u/Sog4hxVaDgP8v/MzXfbXweKlQlZMIF6HSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736723843; c=relaxed/simple;
	bh=aNlGwgnsr5jvvqCaJ79vPbvUKYpzescsDFO8flFt7EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INeEn9Es9f8j9kvtzakY4C5qjBoTX+waVq/f1p2SwN/Aw5fKScqteOODHYTixQKZEfCZnrLpFnwEVWjN+0QIVehXutdZSc6J3+3UirBaMM3MHdT0WpGwpvbdYQD5Fowa/JrW0SeyDgsnISbNjrRbUky3qvG4CYNGWGCKgTMqtPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9nCQpVP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9nCQpVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736723841; x=1768259841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNlGwgnsr5jvvqCaJ79vPbvUKYpzescsDFO8flFt7EM=;
  b=m9nCQpVPg0r+5dCsLHVt09HOZpqMCxUUsImoAppT4C30o25TW0n8Zm0G
   h0AZvxrOy/zxRYLhYH2xkSbcDqmGHRCsJqZnkUl+L0QO5QPl7QUd97qgT
   yO+2K4Fgj6X9/5h3BCMxLJEkQYQhF/wv7J16Kw7R825VO6uV+XXJuK4vA
   kLGLPWZcIxgowGcEfcTaGnRTi3u3rQmX1ZomZo5Iz0psrNBv73Pa7YMwL
   w2yID4gP+b8iq8ksXaXcD3z18OnCLOZSO71OIItgkYVkvTuDhim3HN5fh
   19htPVrwU1/Xvxcj8lJXA31Pf5UbsdI8jmtpFqYzm/DPefdfoYodrBcUC
   w==;
X-CSE-ConnectionGUID: of4ckbtrRweCcTDACnKHmw==
X-CSE-MsgGUID: QY0L+EXJSSOhQh0RbrRwQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48378413"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48378413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 15:17:20 -0800
X-CSE-ConnectionGUID: K8PhjI2gRGyzY/sQ1U5AsQ==
X-CSE-MsgGUID: nJy8C1ZURhaFqkzCQKskYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104452594"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2025 15:17:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX7Cm-000MV0-2F;
	Sun, 12 Jan 2025 23:17:16 +0000
Date: Mon, 13 Jan 2025 07:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/edac/sb_edac.c:1678:83: warning: '%u' directive output may
 be truncated writing between 1 and 10 bytes into a region of size between 0
 and 3
Message-ID: <202501130712.GGxdl8Rr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be548645527a131a097fdc884b7fca40c8b86231
commit: 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c ubsan: Tighten UBSAN_BOUNDS on GCC
date:   1 year, 8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 8 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20250113/202501130712.GGxdl8Rr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130712.GGxdl8Rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501130712.GGxdl8Rr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/sb_edac.c: In function '__populate_dimms':
>> drivers/edac/sb_edac.c:1678:83: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 3 [-Wformat-truncation=]
    1678 |                                                  "CPU_SrcID#%u_Ha#%u_Chan#%u_DIMM#%u",
         |                                                                                   ^~
   drivers/edac/sb_edac.c:1678:50: note: directive argument in the range [0, 4294967294]
    1678 |                                                  "CPU_SrcID#%u_Ha#%u_Chan#%u_DIMM#%u",
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/sb_edac.c:1677:33: note: 'snprintf' output between 31 and 51 bytes into a destination of size 32
    1677 |                                 snprintf(dimm->label, sizeof(dimm->label),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1678 |                                                  "CPU_SrcID#%u_Ha#%u_Chan#%u_DIMM#%u",
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1679 |                                                  pvt->sbridge_dev->source_id, pvt->sbridge_dev->dom, i, j);
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1678 drivers/edac/sb_edac.c

7fd562b75d7752 Tony Luck             2017-05-23  1585  
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1586  static int __populate_dimms(struct mem_ctl_info *mci,
6696522957a192 Borislav Petkov       2017-05-25  1587  			    u64 knl_mc_sizes[KNL_MAX_CHANNELS],
6696522957a192 Borislav Petkov       2017-05-25  1588  			    enum edac_type mode)
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1589  {
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1590  	struct sbridge_pvt *pvt = mci->pvt_info;
6696522957a192 Borislav Petkov       2017-05-25  1591  	int channels = pvt->info.type == KNIGHTS_LANDING ? KNL_MAX_CHANNELS
6696522957a192 Borislav Petkov       2017-05-25  1592  							 : NUM_CHANNELS;
6696522957a192 Borislav Petkov       2017-05-25  1593  	unsigned int i, j, banks, ranks, rows, cols, npages;
c36e3e77687b39 Mauro Carvalho Chehab 2012-04-16  1594  	struct dimm_info *dimm;
c6e13b528f5a6c Mark A. Grondona      2011-10-18  1595  	enum mem_type mtype;
6696522957a192 Borislav Petkov       2017-05-25  1596  	u64 size;
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1597  
9e375446150714 Aristeu Rozanski      2014-06-02  1598  	mtype = pvt->info.get_memory_type(pvt);
50d1bb93672fa2 Aristeu Rozanski      2014-06-20  1599  	if (mtype == MEM_RDDR3 || mtype == MEM_RDDR4)
956b9ba156dbfd Joe Perches           2012-04-29  1600  		edac_dbg(0, "Memory is registered\n");
9e375446150714 Aristeu Rozanski      2014-06-02  1601  	else if (mtype == MEM_UNKNOWN)
de4772c621487f Tony Luck             2013-03-28  1602  		edac_dbg(0, "Cannot determine memory type\n");
9e375446150714 Aristeu Rozanski      2014-06-02  1603  	else
9e375446150714 Aristeu Rozanski      2014-06-02  1604  		edac_dbg(0, "Memory is unregistered\n");
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1605  
fec53af531dd04 Tony Luck             2014-12-02  1606  	if (mtype == MEM_DDR4 || mtype == MEM_RDDR4)
50d1bb93672fa2 Aristeu Rozanski      2014-06-20  1607  		banks = 16;
50d1bb93672fa2 Aristeu Rozanski      2014-06-20  1608  	else
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1609  		banks = 8;
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1610  
d0cdf9003140e9 Jim Snow              2015-12-03  1611  	for (i = 0; i < channels; i++) {
d389059685b468 Youquan Song          2022-07-22  1612  		u32 mtr, amap = 0;
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1613  
d0cdf9003140e9 Jim Snow              2015-12-03  1614  		int max_dimms_per_channel;
d0cdf9003140e9 Jim Snow              2015-12-03  1615  
d0cdf9003140e9 Jim Snow              2015-12-03  1616  		if (pvt->info.type == KNIGHTS_LANDING) {
d0cdf9003140e9 Jim Snow              2015-12-03  1617  			max_dimms_per_channel = 1;
d0cdf9003140e9 Jim Snow              2015-12-03  1618  			if (!pvt->knl.pci_channel[i])
d0cdf9003140e9 Jim Snow              2015-12-03  1619  				continue;
d0cdf9003140e9 Jim Snow              2015-12-03  1620  		} else {
d0cdf9003140e9 Jim Snow              2015-12-03  1621  			max_dimms_per_channel = ARRAY_SIZE(mtr_regs);
7d375bffa52477 Tony Luck             2015-05-18  1622  			if (!pvt->pci_tad[i])
7d375bffa52477 Tony Luck             2015-05-18  1623  				continue;
d389059685b468 Youquan Song          2022-07-22  1624  			pci_read_config_dword(pvt->pci_tad[i], 0x8c, &amap);
d0cdf9003140e9 Jim Snow              2015-12-03  1625  		}
d0cdf9003140e9 Jim Snow              2015-12-03  1626  
d0cdf9003140e9 Jim Snow              2015-12-03  1627  		for (j = 0; j < max_dimms_per_channel; j++) {
bc9ad9e40dbc4c Robert Richter        2019-11-06  1628  			dimm = edac_get_dimm(mci, i, j, 0);
d0cdf9003140e9 Jim Snow              2015-12-03  1629  			if (pvt->info.type == KNIGHTS_LANDING) {
d0cdf9003140e9 Jim Snow              2015-12-03  1630  				pci_read_config_dword(pvt->knl.pci_channel[i],
d0cdf9003140e9 Jim Snow              2015-12-03  1631  					knl_mtr_reg, &mtr);
d0cdf9003140e9 Jim Snow              2015-12-03  1632  			} else {
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1633  				pci_read_config_dword(pvt->pci_tad[i],
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1634  					mtr_regs[j], &mtr);
d0cdf9003140e9 Jim Snow              2015-12-03  1635  			}
956b9ba156dbfd Joe Perches           2012-04-29  1636  			edac_dbg(4, "Channel #%d  MTR%d = %x\n", i, j, mtr);
d389059685b468 Youquan Song          2022-07-22  1637  
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1638  			if (IS_DIMM_PRESENT(mtr)) {
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1639  				if (!IS_ECC_ENABLED(pvt->info.mcmtr)) {
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1640  					sbridge_printk(KERN_ERR, "CPU SrcID #%d, Ha #%d, Channel #%d has DIMMs, but ECC is disabled\n",
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1641  						       pvt->sbridge_dev->source_id,
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1642  						       pvt->sbridge_dev->dom, i);
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1643  					return -ENODEV;
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1644  				}
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1645  				pvt->channel[i].dimms++;
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1646  
50d1bb93672fa2 Aristeu Rozanski      2014-06-20  1647  				ranks = numrank(pvt->info.type, mtr);
d0cdf9003140e9 Jim Snow              2015-12-03  1648  
d0cdf9003140e9 Jim Snow              2015-12-03  1649  				if (pvt->info.type == KNIGHTS_LANDING) {
d0cdf9003140e9 Jim Snow              2015-12-03  1650  					/* For DDR4, this is fixed. */
d0cdf9003140e9 Jim Snow              2015-12-03  1651  					cols = 1 << 10;
d0cdf9003140e9 Jim Snow              2015-12-03  1652  					rows = knl_mc_sizes[i] /
d0cdf9003140e9 Jim Snow              2015-12-03  1653  						((u64) cols * ranks * banks * 8);
d0cdf9003140e9 Jim Snow              2015-12-03  1654  				} else {
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1655  					rows = numrow(mtr);
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1656  					cols = numcol(mtr);
d0cdf9003140e9 Jim Snow              2015-12-03  1657  				}
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1658  
deb09ddaff1435 Mauro Carvalho Chehab 2012-09-20  1659  				size = ((u64)rows * cols * banks * ranks) >> (20 - 3);
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1660  				npages = MiB_TO_PAGES(size);
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1661  
6f6da136046294 Qiuxu Zhuo            2018-09-18  1662  				edac_dbg(0, "mc#%d: ha %d channel %d, dimm %d, %lld MiB (%d pages) bank: %d, rank: %d, row: %#x, col: %#x\n",
e2f747b1f42a2f Qiuxu Zhuo            2017-05-23  1663  					 pvt->sbridge_dev->mc, pvt->sbridge_dev->dom, i, j,
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1664  					 size, npages,
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1665  					 banks, ranks, rows, cols);
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1666  
a895bf8b1e1ea4 Mauro Carvalho Chehab 2012-01-28  1667  				dimm->nr_pages = npages;
084a4fccef39ac Mauro Carvalho Chehab 2012-01-27  1668  				dimm->grain = 32;
12f0721c5a7040 Aristeu Rozanski      2015-06-12  1669  				dimm->dtype = pvt->info.get_width(pvt, mtr);
084a4fccef39ac Mauro Carvalho Chehab 2012-01-27  1670  				dimm->mtype = mtype;
084a4fccef39ac Mauro Carvalho Chehab 2012-01-27  1671  				dimm->edac_mode = mode;
d389059685b468 Youquan Song          2022-07-22  1672  				pvt->channel[i].dimm[j].rowbits = order_base_2(rows);
d389059685b468 Youquan Song          2022-07-22  1673  				pvt->channel[i].dimm[j].colbits = order_base_2(cols);
d389059685b468 Youquan Song          2022-07-22  1674  				pvt->channel[i].dimm[j].bank_xor_enable =
d389059685b468 Youquan Song          2022-07-22  1675  						GET_BITFIELD(pvt->info.mcmtr, 9, 9);
d389059685b468 Youquan Song          2022-07-22  1676  				pvt->channel[i].dimm[j].amap_fine = GET_BITFIELD(amap, 0, 0);
084a4fccef39ac Mauro Carvalho Chehab 2012-01-27  1677  				snprintf(dimm->label, sizeof(dimm->label),
7d375bffa52477 Tony Luck             2015-05-18 @1678  						 "CPU_SrcID#%u_Ha#%u_Chan#%u_DIMM#%u",
e2f747b1f42a2f Qiuxu Zhuo            2017-05-23  1679  						 pvt->sbridge_dev->source_id, pvt->sbridge_dev->dom, i, j);
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1680  			}
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1681  		}
eebf11a0166f01 Mauro Carvalho Chehab 2011-10-20  1682  	}
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1683  
4d475dde79b561 Qiuxu Zhuo            2017-05-25  1684  	return 0;
6696522957a192 Borislav Petkov       2017-05-25  1685  }
6696522957a192 Borislav Petkov       2017-05-25  1686  

:::::: The code at line 1678 was first introduced by commit
:::::: 7d375bffa52477c1be7db5a5dda99996582512c3 sb_edac: Fix support for systems with two home agents per socket

:::::: TO: Tony Luck <tony.luck@intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
