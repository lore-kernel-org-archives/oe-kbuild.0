Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A84A0A
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732349547; cv=none; b=ocGA8kXdbZu5CpqdtKKvlXQ/2hyFKV+CKRliBZNkdDZ216c+UWFSniQGfiHwC/K2MAyhd8wByzpzZTHNKT15Lh+85aurwdPtl31wuGQIHh2iM1cfTMDJj3ImE0cwLEO4m3iekP0MiRpUpGei0lbKdCnQhk4HC0nE1628GobzjoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732349547; c=relaxed/simple;
	bh=g0kpMQWKguCTLfWT/l8wJAR2J9sZ7Zmkm/ptTPruYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n7/lJMPGC0g22pRelHRQWGACsIvJioyZ7cSMkjCFAQEiLICdCtJsVkF1zFLaeFOG5DLwivHoXc+VMrM5q2MnEhyo1wHYjjfjX/VwVq3Qz9p6w/3YH2Qg43JzSUbaubjL44tPthLJtjRXqWOdTcr+y03VfxyYx1IkQ7CF2HcZrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWGZxZ9h; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWGZxZ9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732349545; x=1763885545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0kpMQWKguCTLfWT/l8wJAR2J9sZ7Zmkm/ptTPruYHo=;
  b=NWGZxZ9hT9sFAbXe5Z+s4nybgEajgHdFZ6f4uN3FxsvF4Q3n3ZOfEfW1
   blyiNZAqZjtfEzVuKjjCBMP6WkW4qFMt7nJdLgQoM0x4iq/TxTWCAstgI
   3xedqeyDGeG6dZpwmWfgeQx7mS6eY5uREOY6Upahy2/AeRDqDqTatpxaP
   yae9s+o0TqhWbPmMkZsspkQtBcAQAjOdM6feLBt3pMCzB82bUoyQtyk0R
   Z1nbJ/ydSZjvla6IehHU09cDzvf92PQpfAhkD0wWCDx/F6rwkICJ5ilkk
   ck5nN/F+PBCLws66GqYs/brGcc044KiBng/zb86tFpgThKsGt/SXOrPPc
   g==;
X-CSE-ConnectionGUID: mOjSokdKTvuTOHRINWj1eQ==
X-CSE-MsgGUID: +xXGZ2RBQ+KxHtDXQlUb3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43567901"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="43567901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 00:12:25 -0800
X-CSE-ConnectionGUID: QoTGSdUuRUqhlvw7NRT/kA==
X-CSE-MsgGUID: TwBb5g7GRO6g+suuncLWlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90929734"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Nov 2024 00:12:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tElFc-0004Vz-2C;
	Sat, 23 Nov 2024 08:12:20 +0000
Date: Sat, 23 Nov 2024 16:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2466/2466] drivers/ata/libata-eh.c:3257
 ata_eh_set_lpm() warn: variable dereferenced before check 'ap' (see line
 3240)
Message-ID: <202411231634.pxACj2JQ-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   87bba796cf0405f8832bd4971fc5ffc6aed586c8
commit: f83af24f656adf6bcda72ba1c42882035beec4eb [2466/2466] ata: Add support for disabling PhyRdy Change Interrupt based on actual LPM capability
:::::: branch date: 4 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231634.pxACj2JQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411231634.pxACj2JQ-lkp@intel.com/

smatch warnings:
drivers/ata/libata-eh.c:3257 ata_eh_set_lpm() warn: variable dereferenced before check 'ap' (see line 3240)

vim +/ap +3257 drivers/ata/libata-eh.c

6013efd8860bf1 Tejun Heo                 2009-11-19  3218  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3219  /**
6b7ae9545ad987 Tejun Heo                 2010-09-01  3220   *	ata_eh_set_lpm - configure SATA interface power management
6b7ae9545ad987 Tejun Heo                 2010-09-01  3221   *	@link: link to configure power management
6b7ae9545ad987 Tejun Heo                 2010-09-01  3222   *	@policy: the link power management policy
6b7ae9545ad987 Tejun Heo                 2010-09-01  3223   *	@r_failed_dev: out parameter for failed device
6b7ae9545ad987 Tejun Heo                 2010-09-01  3224   *
6b7ae9545ad987 Tejun Heo                 2010-09-01  3225   *	Enable SATA Interface power management.  This will enable
f4ac6476945ff6 Hans de Goede             2017-09-14  3226   *	Device Interface Power Management (DIPM) for min_power and
f4ac6476945ff6 Hans de Goede             2017-09-14  3227   *	medium_power_with_dipm policies, and then call driver specific
f4ac6476945ff6 Hans de Goede             2017-09-14  3228   *	callbacks for enabling Host Initiated Power management.
6b7ae9545ad987 Tejun Heo                 2010-09-01  3229   *
6b7ae9545ad987 Tejun Heo                 2010-09-01  3230   *	LOCKING:
6b7ae9545ad987 Tejun Heo                 2010-09-01  3231   *	EH context.
6b7ae9545ad987 Tejun Heo                 2010-09-01  3232   *
6b7ae9545ad987 Tejun Heo                 2010-09-01  3233   *	RETURNS:
6b7ae9545ad987 Tejun Heo                 2010-09-01  3234   *	0 on success, -errno on failure.
6b7ae9545ad987 Tejun Heo                 2010-09-01  3235   */
6b7ae9545ad987 Tejun Heo                 2010-09-01  3236  static int ata_eh_set_lpm(struct ata_link *link, enum ata_lpm_policy policy,
6b7ae9545ad987 Tejun Heo                 2010-09-01  3237  			  struct ata_device **r_failed_dev)
6b7ae9545ad987 Tejun Heo                 2010-09-01  3238  {
6c8ea89cecd780 Tejun Heo                 2010-09-01  3239  	struct ata_port *ap = ata_is_host_link(link) ? link->ap : NULL;
f83af24f656adf LeoLiu-oc                 2022-02-23 @3240  	struct device *device = ap->host->dev;
f83af24f656adf LeoLiu-oc                 2022-02-23  3241  	struct pci_dev *pdev = (!device || !dev_is_pci(device)) ? NULL : to_pci_dev(device);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3242  	struct ata_eh_context *ehc = &link->eh_context;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3243  	struct ata_device *dev, *link_dev = NULL, *lpm_dev = NULL;
e5005b15c91f33 Tejun Heo                 2010-12-09  3244  	enum ata_lpm_policy old_policy = link->lpm_policy;
5f6f12ccf3aa42 Tejun Heo                 2011-05-09  3245  	bool no_dipm = link->ap->flags & ATA_FLAG_NO_DIPM;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3246  	unsigned int hints = ATA_LPM_EMPTY | ATA_LPM_HIPM;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3247  	unsigned int err_mask;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3248  	int rc;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3249  
f83af24f656adf LeoLiu-oc                 2022-02-23  3250  	/* if controller does not support lpm, then sets no LPM flags*/
f83af24f656adf LeoLiu-oc                 2022-02-23  3251  	if ((pdev && pdev->vendor == PCI_VENDOR_ID_ZHAOXIN) &&
f83af24f656adf LeoLiu-oc                 2022-02-23  3252  		!(ap->host->flags & (ATA_HOST_PART | ATA_HOST_SSC | ATA_HOST_DEVSLP)))
f83af24f656adf LeoLiu-oc                 2022-02-23  3253  		link->flags |= ATA_LFLAG_NO_LPM;
f83af24f656adf LeoLiu-oc                 2022-02-23  3254  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3255  	/* if the link or host doesn't do LPM, noop */
4c9029e7d00f31 Bartlomiej Zolnierkiewicz 2020-03-26  3256  	if (!IS_ENABLED(CONFIG_SATA_HOST) ||
4c9029e7d00f31 Bartlomiej Zolnierkiewicz 2020-03-26 @3257  	    (link->flags & ATA_LFLAG_NO_LPM) || (ap && !ap->ops->set_lpm))
6b7ae9545ad987 Tejun Heo                 2010-09-01  3258  		return 0;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3259  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3260  	/*
6b7ae9545ad987 Tejun Heo                 2010-09-01  3261  	 * DIPM is enabled only for MIN_POWER as some devices
6b7ae9545ad987 Tejun Heo                 2010-09-01  3262  	 * misbehave when the host NACKs transition to SLUMBER.  Order
6b7ae9545ad987 Tejun Heo                 2010-09-01  3263  	 * device and link configurations such that the host always
6b7ae9545ad987 Tejun Heo                 2010-09-01  3264  	 * allows DIPM requests.
6b7ae9545ad987 Tejun Heo                 2010-09-01  3265  	 */
6b7ae9545ad987 Tejun Heo                 2010-09-01  3266  	ata_for_each_dev(dev, link, ENABLED) {
6b7ae9545ad987 Tejun Heo                 2010-09-01  3267  		bool hipm = ata_id_has_hipm(dev->id);
ae01b2493c3bf0 Tejun Heo                 2011-03-16  3268  		bool dipm = ata_id_has_dipm(dev->id) && !no_dipm;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3269  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3270  		/* find the first enabled and LPM enabled devices */
6b7ae9545ad987 Tejun Heo                 2010-09-01  3271  		if (!link_dev)
6b7ae9545ad987 Tejun Heo                 2010-09-01  3272  			link_dev = dev;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3273  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3274  		if (!lpm_dev && (hipm || dipm))
6b7ae9545ad987 Tejun Heo                 2010-09-01  3275  			lpm_dev = dev;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3276  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3277  		hints &= ~ATA_LPM_EMPTY;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3278  		if (!hipm)
6b7ae9545ad987 Tejun Heo                 2010-09-01  3279  			hints &= ~ATA_LPM_HIPM;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3280  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3281  		/* disable DIPM before changing link config */
f4ac6476945ff6 Hans de Goede             2017-09-14  3282  		if (policy < ATA_LPM_MED_POWER_WITH_DIPM && dipm) {
6b7ae9545ad987 Tejun Heo                 2010-09-01  3283  			err_mask = ata_dev_set_feature(dev,
6b7ae9545ad987 Tejun Heo                 2010-09-01  3284  					SETFEATURES_SATA_DISABLE, SATA_DIPM);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3285  			if (err_mask && err_mask != AC_ERR_DEV) {
a9a79dfec23956 Joe Perches               2011-04-15  3286  				ata_dev_warn(dev,
6b7ae9545ad987 Tejun Heo                 2010-09-01  3287  					     "failed to disable DIPM, Emask 0x%x\n",
6b7ae9545ad987 Tejun Heo                 2010-09-01  3288  					     err_mask);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3289  				rc = -EIO;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3290  				goto fail;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3291  			}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3292  		}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3293  	}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3294  
6c8ea89cecd780 Tejun Heo                 2010-09-01  3295  	if (ap) {
6b7ae9545ad987 Tejun Heo                 2010-09-01  3296  		rc = ap->ops->set_lpm(link, policy, hints);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3297  		if (!rc && ap->slave_link)
6b7ae9545ad987 Tejun Heo                 2010-09-01  3298  			rc = ap->ops->set_lpm(ap->slave_link, policy, hints);
6c8ea89cecd780 Tejun Heo                 2010-09-01  3299  	} else
6c8ea89cecd780 Tejun Heo                 2010-09-01  3300  		rc = sata_pmp_set_lpm(link, policy, hints);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3301  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3302  	/*
6b7ae9545ad987 Tejun Heo                 2010-09-01  3303  	 * Attribute link config failure to the first (LPM) enabled
6b7ae9545ad987 Tejun Heo                 2010-09-01  3304  	 * device on the link.
6b7ae9545ad987 Tejun Heo                 2010-09-01  3305  	 */
6b7ae9545ad987 Tejun Heo                 2010-09-01  3306  	if (rc) {
6b7ae9545ad987 Tejun Heo                 2010-09-01  3307  		if (rc == -EOPNOTSUPP) {
6b7ae9545ad987 Tejun Heo                 2010-09-01  3308  			link->flags |= ATA_LFLAG_NO_LPM;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3309  			return 0;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3310  		}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3311  		dev = lpm_dev ? lpm_dev : link_dev;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3312  		goto fail;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3313  	}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3314  
e5005b15c91f33 Tejun Heo                 2010-12-09  3315  	/*
e5005b15c91f33 Tejun Heo                 2010-12-09  3316  	 * Low level driver acked the transition.  Issue DIPM command
e5005b15c91f33 Tejun Heo                 2010-12-09  3317  	 * with the new policy set.
e5005b15c91f33 Tejun Heo                 2010-12-09  3318  	 */
e5005b15c91f33 Tejun Heo                 2010-12-09  3319  	link->lpm_policy = policy;
e5005b15c91f33 Tejun Heo                 2010-12-09  3320  	if (ap && ap->slave_link)
e5005b15c91f33 Tejun Heo                 2010-12-09  3321  		ap->slave_link->lpm_policy = policy;
e5005b15c91f33 Tejun Heo                 2010-12-09  3322  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3323  	/* host config updated, enable DIPM if transitioning to MIN_POWER */
6b7ae9545ad987 Tejun Heo                 2010-09-01  3324  	ata_for_each_dev(dev, link, ENABLED) {
f4ac6476945ff6 Hans de Goede             2017-09-14  3325  		if (policy >= ATA_LPM_MED_POWER_WITH_DIPM && !no_dipm &&
ae01b2493c3bf0 Tejun Heo                 2011-03-16  3326  		    ata_id_has_dipm(dev->id)) {
6b7ae9545ad987 Tejun Heo                 2010-09-01  3327  			err_mask = ata_dev_set_feature(dev,
6b7ae9545ad987 Tejun Heo                 2010-09-01  3328  					SETFEATURES_SATA_ENABLE, SATA_DIPM);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3329  			if (err_mask && err_mask != AC_ERR_DEV) {
a9a79dfec23956 Joe Perches               2011-04-15  3330  				ata_dev_warn(dev,
6b7ae9545ad987 Tejun Heo                 2010-09-01  3331  					"failed to enable DIPM, Emask 0x%x\n",
6b7ae9545ad987 Tejun Heo                 2010-09-01  3332  					err_mask);
6b7ae9545ad987 Tejun Heo                 2010-09-01  3333  				rc = -EIO;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3334  				goto fail;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3335  			}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3336  		}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3337  	}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3338  
09c5b4803a80a5 Gabriele Mazzotta         2015-04-25  3339  	link->last_lpm_change = jiffies;
09c5b4803a80a5 Gabriele Mazzotta         2015-04-25  3340  	link->flags |= ATA_LFLAG_CHANGED;
09c5b4803a80a5 Gabriele Mazzotta         2015-04-25  3341  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3342  	return 0;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3343  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3344  fail:
e5005b15c91f33 Tejun Heo                 2010-12-09  3345  	/* restore the old policy */
e5005b15c91f33 Tejun Heo                 2010-12-09  3346  	link->lpm_policy = old_policy;
e5005b15c91f33 Tejun Heo                 2010-12-09  3347  	if (ap && ap->slave_link)
e5005b15c91f33 Tejun Heo                 2010-12-09  3348  		ap->slave_link->lpm_policy = old_policy;
e5005b15c91f33 Tejun Heo                 2010-12-09  3349  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3350  	/* if no device or only one more chance is left, disable LPM */
6b7ae9545ad987 Tejun Heo                 2010-09-01  3351  	if (!dev || ehc->tries[dev->devno] <= 2) {
a9a79dfec23956 Joe Perches               2011-04-15  3352  		ata_link_warn(link, "disabling LPM on the link\n");
6b7ae9545ad987 Tejun Heo                 2010-09-01  3353  		link->flags |= ATA_LFLAG_NO_LPM;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3354  	}
6b7ae9545ad987 Tejun Heo                 2010-09-01  3355  	if (r_failed_dev)
6b7ae9545ad987 Tejun Heo                 2010-09-01  3356  		*r_failed_dev = dev;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3357  	return rc;
6b7ae9545ad987 Tejun Heo                 2010-09-01  3358  }
6b7ae9545ad987 Tejun Heo                 2010-09-01  3359  

:::::: The code at line 3257 was first introduced by commit
:::::: 4c9029e7d00f31923bcecbaab6a12ba52017924e ata: let compiler optimize out ata_eh_set_lpm() on non-SATA hosts

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
