Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAB02773D3
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 04:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780634837; cv=none; b=RUtbC86xirkgy8AyyjwCFikXC+kim0pLguDRZBlHif21zrnMZVOo4emmSxT2szHCxnJxg8PONhXxAiIjYtcZBprNfuF0kvUUiuxhVpblB6LZt72vgQ+qj/ZJbER1vnWr4uqRsgraQR74T1ovveN8SHd3Zz2gVUdObJxh0IZtgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780634837; c=relaxed/simple;
	bh=+ClBZa4gzZVLONfruri5NDsaeSMGrN8FfvsONZgDMuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tmIgzXX8rDfCKHtJ9F3+1+sPqlHC7V1+EDTe8cdKM0VeJOVncXROCNY3MrYN63KWGZxieRluytNRhBnDcojcOREN3c5gFEKuYQcCK+ZyqfBRvEgZqsWrDj+m67Mu6lvnDU0Rte6f31IUpOWYr8EFvotdnhBAC8hnrhHYkc7vG4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRw1vtUM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRw1vtUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780634836; x=1812170836;
  h=date:from:to:cc:subject:message-id;
  bh=+ClBZa4gzZVLONfruri5NDsaeSMGrN8FfvsONZgDMuA=;
  b=cRw1vtUMb0wumoCcVU4hiBizffabUwM2G0XIomd7DmpOB3ZA1dXE47RO
   Oe7OzHrcQG7CLCBIrR2UzxlzZjbFevy8wBaIVzteiosr0AdXZzVYHoWmD
   C2wNQGhuxcCT63DnfLvTISW9mDP4JEh9KCD4xKLUrQSWzLiDQZNT/MPgQ
   viYyX+kqJRzYInO0vEqan6SY/XAOATJwXUYVdGaNlBahRMoyWQdy2CUiz
   h5vVm1Szk9wC378a/LK6AoOrm6M9+sK1uuL0XD+GrdsXFBE8ALQOHdfLP
   q5ydw2Hg247LzCqoXdDrk5LpGN+viVWOQBwNFprY0hVv2BNDtC9v9kFwh
   Q==;
X-CSE-ConnectionGUID: YgaCItLjQkemrhKiq4d8vA==
X-CSE-MsgGUID: SmnwMKqBRimVvVKiPDHLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69002339"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="69002339"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 21:47:15 -0700
X-CSE-ConnectionGUID: s4a6xcp6SjuJ2Fdk0+0a9w==
X-CSE-MsgGUID: hnyd8cYHRDaiFKLslwkr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="244602641"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2026 21:47:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVMSc-00000000FXe-1eaN;
	Fri, 05 Jun 2026 04:47:10 +0000
Date: Fri, 05 Jun 2026 12:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/bd71828-power.c:900:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202606051253.ZjKMUNMa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andreas Kemnade <andreas@kemnade.info>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 5bff79dad20a51fed3ff6d78f6b60321cd145a99 power: supply: Add bd718(15/28/78) charger driver
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260605/202606051253.ZjKMUNMa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5bff79dad20a ("power: supply: Add bd718(15/28/78) charger driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606051253.ZjKMUNMa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/bd71828-power.c:900:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +900 drivers/power/supply/bd71828-power.c

5bff79dad20a51 Andreas Kemnade 2025-09-18  804  
5bff79dad20a51 Andreas Kemnade 2025-09-18  805  static int bd7182x_get_irqs(struct platform_device *pdev,
5bff79dad20a51 Andreas Kemnade 2025-09-18  806  			    struct bd71828_power *pwr)
5bff79dad20a51 Andreas Kemnade 2025-09-18  807  {
5bff79dad20a51 Andreas Kemnade 2025-09-18  808  	int i, irq, ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  809  	static const struct bd7182x_irq_res bd71815_irqs[] = {
5bff79dad20a51 Andreas Kemnade 2025-09-18  810  		BDIRQ("bd71815-dcin-rmv", BD_ISR_NAME(dcin_removed)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  811  		BDIRQ("bd71815-dcin-clps-out", BD_ISR_NAME(clps_out)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  812  		BDIRQ("bd71815-dcin-clps-in", BD_ISR_NAME(clps_in)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  813  		BDIRQ("bd71815-dcin-ovp-res", BD_ISR_NAME(dcin_ovp_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  814  		BDIRQ("bd71815-dcin-ovp-det", BD_ISR_NAME(dcin_ovp_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  815  		BDIRQ("bd71815-dcin-mon-res", BD_ISR_NAME(dcin_mon_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  816  		BDIRQ("bd71815-dcin-mon-det", BD_ISR_NAME(dcin_mon_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  817  
5bff79dad20a51 Andreas Kemnade 2025-09-18  818  		BDIRQ("bd71815-vsys-uv-res", BD_ISR_NAME(vsys_uv_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  819  		BDIRQ("bd71815-vsys-uv-det", BD_ISR_NAME(vsys_uv_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  820  		BDIRQ("bd71815-vsys-low-res", BD_ISR_NAME(vsys_low_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  821  		BDIRQ("bd71815-vsys-low-det",  BD_ISR_NAME(vsys_low_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  822  		BDIRQ("bd71815-vsys-mon-res",  BD_ISR_NAME(vsys_mon_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  823  		BDIRQ("bd71815-vsys-mon-det",  BD_ISR_NAME(vsys_mon_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  824  		BDIRQ("bd71815-chg-wdg-temp", BD_ISR_NAME(chg_wdg_temp)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  825  		BDIRQ("bd71815-chg-wdg",  BD_ISR_NAME(chg_wdg)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  826  		BDIRQ("bd71815-rechg-det", BD_ISR_NAME(rechg_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  827  		BDIRQ("bd71815-rechg-res", BD_ISR_NAME(rechg_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  828  		BDIRQ("bd71815-ranged-temp-transit", BD_ISR_NAME(temp_transit)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  829  		BDIRQ("bd71815-chg-state-change", BD_ISR_NAME(chg_state_changed)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  830  		BDIRQ("bd71815-bat-temp-normal", bd71828_temp_bat_hi_res),
5bff79dad20a51 Andreas Kemnade 2025-09-18  831  		BDIRQ("bd71815-bat-temp-erange", bd71828_temp_bat_hi_det),
5bff79dad20a51 Andreas Kemnade 2025-09-18  832  		BDIRQ("bd71815-bat-rmv", BD_ISR_NAME(bat_removed)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  833  		BDIRQ("bd71815-bat-det", BD_ISR_NAME(bat_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  834  
5bff79dad20a51 Andreas Kemnade 2025-09-18  835  		/* Add ISRs for these */
5bff79dad20a51 Andreas Kemnade 2025-09-18  836  		BDIRQ("bd71815-therm-rmv", BD_ISR_NAME(therm_rmv)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  837  		BDIRQ("bd71815-therm-det", BD_ISR_NAME(therm_det)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  838  		BDIRQ("bd71815-bat-dead", BD_ISR_NAME(bat_dead)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  839  		BDIRQ("bd71815-bat-short-res", BD_ISR_NAME(bat_short_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  840  		BDIRQ("bd71815-bat-short-det", BD_ISR_NAME(bat_short)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  841  		BDIRQ("bd71815-bat-low-res", BD_ISR_NAME(bat_low_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  842  		BDIRQ("bd71815-bat-low-det", BD_ISR_NAME(bat_low)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  843  		BDIRQ("bd71815-bat-over-res", BD_ISR_NAME(bat_ov_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  844  		BDIRQ("bd71815-bat-over-det", BD_ISR_NAME(bat_ov)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  845  		BDIRQ("bd71815-bat-mon-res", BD_ISR_NAME(bat_mon_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  846  		BDIRQ("bd71815-bat-mon-det", BD_ISR_NAME(bat_mon)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  847  		/* cc-mon 1 & 3 ? */
5bff79dad20a51 Andreas Kemnade 2025-09-18  848  		BDIRQ("bd71815-bat-cc-mon2", BD_ISR_NAME(bat_cc_mon)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  849  		BDIRQ("bd71815-bat-oc1-res", BD_ISR_NAME(bat_oc1_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  850  		BDIRQ("bd71815-bat-oc1-det", BD_ISR_NAME(bat_oc1)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  851  		BDIRQ("bd71815-bat-oc2-res", BD_ISR_NAME(bat_oc2_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  852  		BDIRQ("bd71815-bat-oc2-det", BD_ISR_NAME(bat_oc2)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  853  		BDIRQ("bd71815-bat-oc3-res", BD_ISR_NAME(bat_oc3_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  854  		BDIRQ("bd71815-bat-oc3-det", BD_ISR_NAME(bat_oc3)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  855  		BDIRQ("bd71815-temp-bat-low-res", BD_ISR_NAME(temp_bat_low_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  856  		BDIRQ("bd71815-temp-bat-low-det", BD_ISR_NAME(temp_bat_low)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  857  		BDIRQ("bd71815-temp-bat-hi-res", BD_ISR_NAME(temp_bat_hi_res)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  858  		BDIRQ("bd71815-temp-bat-hi-det", BD_ISR_NAME(temp_bat_hi)),
5bff79dad20a51 Andreas Kemnade 2025-09-18  859  		/*
5bff79dad20a51 Andreas Kemnade 2025-09-18  860  		 * TODO: add rest of the IRQs and re-check the handling.
5bff79dad20a51 Andreas Kemnade 2025-09-18  861  		 * Check the bd71815-bat-cc-mon1, bd71815-bat-cc-mon3,
5bff79dad20a51 Andreas Kemnade 2025-09-18  862  		 * bd71815-bat-low-res, bd71815-bat-low-det,
5bff79dad20a51 Andreas Kemnade 2025-09-18  863  		 * bd71815-bat-hi-res, bd71815-bat-hi-det.
5bff79dad20a51 Andreas Kemnade 2025-09-18  864  		 */
5bff79dad20a51 Andreas Kemnade 2025-09-18  865  	};
5bff79dad20a51 Andreas Kemnade 2025-09-18  866  	static const struct bd7182x_irq_res bd71828_irqs[] = {
5bff79dad20a51 Andreas Kemnade 2025-09-18  867  		BDIRQ("bd71828-chg-done", bd718x7_chg_done),
5bff79dad20a51 Andreas Kemnade 2025-09-18  868  		BDIRQ("bd71828-pwr-dcin-in", bd7182x_dcin_detected),
5bff79dad20a51 Andreas Kemnade 2025-09-18  869  		BDIRQ("bd71828-pwr-dcin-out", bd7182x_dcin_removed),
5bff79dad20a51 Andreas Kemnade 2025-09-18  870  		BDIRQ("bd71828-vbat-normal", bd71828_vbat_low_res),
5bff79dad20a51 Andreas Kemnade 2025-09-18  871  		BDIRQ("bd71828-vbat-low", bd71828_vbat_low_det),
5bff79dad20a51 Andreas Kemnade 2025-09-18  872  		BDIRQ("bd71828-btemp-hi", bd71828_temp_bat_hi_det),
5bff79dad20a51 Andreas Kemnade 2025-09-18  873  		BDIRQ("bd71828-btemp-cool", bd71828_temp_bat_hi_res),
5bff79dad20a51 Andreas Kemnade 2025-09-18  874  		BDIRQ("bd71828-btemp-lo", bd71828_temp_bat_low_det),
5bff79dad20a51 Andreas Kemnade 2025-09-18  875  		BDIRQ("bd71828-btemp-warm", bd71828_temp_bat_low_res),
5bff79dad20a51 Andreas Kemnade 2025-09-18  876  		BDIRQ("bd71828-temp-hi", bd71828_temp_vf_det),
5bff79dad20a51 Andreas Kemnade 2025-09-18  877  		BDIRQ("bd71828-temp-norm", bd71828_temp_vf_res),
5bff79dad20a51 Andreas Kemnade 2025-09-18  878  		BDIRQ("bd71828-temp-125-over", bd71828_temp_vf125_det),
5bff79dad20a51 Andreas Kemnade 2025-09-18  879  		BDIRQ("bd71828-temp-125-under", bd71828_temp_vf125_res),
5bff79dad20a51 Andreas Kemnade 2025-09-18  880  	};
5bff79dad20a51 Andreas Kemnade 2025-09-18  881  	int num_irqs;
5bff79dad20a51 Andreas Kemnade 2025-09-18  882  	const struct bd7182x_irq_res *irqs;
5bff79dad20a51 Andreas Kemnade 2025-09-18  883  
5bff79dad20a51 Andreas Kemnade 2025-09-18  884  	switch (pwr->chip_type) {
5bff79dad20a51 Andreas Kemnade 2025-09-18  885  	case ROHM_CHIP_TYPE_BD71828:
5bff79dad20a51 Andreas Kemnade 2025-09-18  886  		irqs = &bd71828_irqs[0];
5bff79dad20a51 Andreas Kemnade 2025-09-18  887  		num_irqs = ARRAY_SIZE(bd71828_irqs);
5bff79dad20a51 Andreas Kemnade 2025-09-18  888  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  889  	case ROHM_CHIP_TYPE_BD71815:
5bff79dad20a51 Andreas Kemnade 2025-09-18  890  		irqs = &bd71815_irqs[0];
5bff79dad20a51 Andreas Kemnade 2025-09-18  891  		num_irqs = ARRAY_SIZE(bd71815_irqs);
5bff79dad20a51 Andreas Kemnade 2025-09-18  892  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  893  	default:
5bff79dad20a51 Andreas Kemnade 2025-09-18  894  		return -EINVAL;
5bff79dad20a51 Andreas Kemnade 2025-09-18  895  	}
5bff79dad20a51 Andreas Kemnade 2025-09-18  896  
5bff79dad20a51 Andreas Kemnade 2025-09-18  897  	for (i = 0; i < num_irqs; i++) {
5bff79dad20a51 Andreas Kemnade 2025-09-18  898  		irq = platform_get_irq_byname(pdev, irqs[i].name);
5bff79dad20a51 Andreas Kemnade 2025-09-18  899  
5bff79dad20a51 Andreas Kemnade 2025-09-18 @900  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
5bff79dad20a51 Andreas Kemnade 2025-09-18  901  						irqs[i].handler, 0,
5bff79dad20a51 Andreas Kemnade 2025-09-18  902  						irqs[i].name, pwr);
5bff79dad20a51 Andreas Kemnade 2025-09-18  903  		if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  904  			break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  905  	}
5bff79dad20a51 Andreas Kemnade 2025-09-18  906  
5bff79dad20a51 Andreas Kemnade 2025-09-18  907  	return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  908  }
5bff79dad20a51 Andreas Kemnade 2025-09-18  909  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
