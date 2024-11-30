Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5953F1A0BC5
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732982347; cv=none; b=pc8dylBKOOyM1/5NSkSsQ1HKwYVq6+Z0+tPEHQWld5vHyYjKF6C21glSUCb47fK/852YeF3aSROP1EBmF5V5AXrTkN7qsaOr2mP739L9fmv0PAndg//90qC+UiVZR51IKuVjB+hCV8YqZcuLxgV0EtJbwh2rLeUjAMez30yMhoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732982347; c=relaxed/simple;
	bh=gpVIL5eF+8BbmhFwI/AuB/X0BVm8f34cpWHZQ5CXwzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGr0zZ48T/SeLyv121ZxoAt3Lig5Xx3DO26gXVu6pnW+m5UAmzGYgeAX/BveVp4iwdYo84OYK9B8ySkhdomIxbVEy0JbphwCJrmV9+RrwcRdijKZmpedmLG5+Egb/XKulALn5/p8sR0aX85bvGxGVP4QiwD0Uu+QvJV3EWI8jow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsQp4uUB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsQp4uUB"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so3202357a12.1
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 07:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732982343; x=1733587143; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il4qUVvhXjYUHRDegOiih77I/cCBsmIIzn/rvSkGkRk=;
        b=BsQp4uUB2lUU5hZlP1+sEWMDMihLOq/c7NLVesxy1d9MauZMBArIVxVYT63iewWkOQ
         jsCrj86KeZ2Wm51MUaBFYNP+MzgQvk4FyHNYHob/y57WHmBN8ueBgVPuAuVGc7HX0ujW
         7mf/R7v8J7QIrtpiGcgG71Y6cowgcjgJ3cfwzHj+0Fi9q+i0RM+ooPyopEe5sKRhrM80
         w/xdrvbk5FJUM2fnQAyDSSbib2pdhMn9JOfUc2vhTCouQayakZAeEpeEOOU4s0zCB+1/
         f6lr7j8R0pdlUskDmK2aSCUkUbSVdamBFR6UcZ2vNiPhmS60NhsSdzsOZGhBuhjizQOU
         VNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732982343; x=1733587143;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Il4qUVvhXjYUHRDegOiih77I/cCBsmIIzn/rvSkGkRk=;
        b=a58HKCzgX3NunBUHvHRER3J9DZr/HJrn56sgaBC9tAXwBSVtGe/hQUrYIfKpT4FDK9
         L4oB0DaQiZD+mJfs+kIOVwXwswfw33srw6hiYzT6tp+K+tPxb1xRxaxLvHZa5VfBkvF3
         /r3Kgp5evJM81KQi2XbrgSoDyOmu5BhCEWAVp/VsE+bO32Rg6ESeCi/JxMI16fF48WhK
         Re8WMcHTW3rgeCi18lu/Iz6ZqinN5t8/gi5Y4WM0QqzipUwITJWJ4OTNRkvHgScWVIpR
         hwBdJgAL5V7Ex936QyXVP5nUdoO4geEEVmU4tUblvTgIk1I1gL61/MQdUIimSRfQIq+r
         I/hA==
X-Gm-Message-State: AOJu0YzfSeakXw5QsW909ePn6RTj2YNffTV+HonKeOeZShFGoV+XCBpr
	lKe/yKlrNvtTkGxKg6LmvbjfEqeK2EDgh1hgpr4ZeO00tP15aToL0VxdKa+/OGVRKLQ621spdpM
	d
X-Gm-Gg: ASbGnctTUpGhdu2Jv++8BaIzcR+2ttH5m7P/6pJdk1oBIv4lhuGDeN/0/SlND8prTjS
	7GhOtQxQS2N5YJJptYeGRznwMbjLMmMtcoEwJE7jYHgaukyPzkUj32ivXNnsNQK85si+aywjNBO
	hcBKbI2aUNB0TbkG50xXPU0+ACMSmfU/vfnhmVVWgEV3NUAXFYZ5M5iZlpYaNDeEOgPtr4xcxFt
	2JcV43RKuHTrUpYp0v8jBlZXZpB8YHgL8sBe3w61XIb8O/ywHAKj1sycXcJgunSfO2s4tqx
X-Google-Smtp-Source: AGHT+IG1gvdpsL8OxmYnk3ETvCr76c84USWNIiDyA6pN2Rc5LrHtFTB6N/ztqvqoP5tLAGc7ebY2zg==
X-Received: by 2002:a05:6402:440b:b0:5cf:e218:984f with SMTP id 4fb4d7f45d1cf-5d080c5810dmr13529204a12.27.1732982343477;
        Sat, 30 Nov 2024 07:59:03 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b8aeeaf7sm1643735a12.30.2024.11.30.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:59:03 -0800 (PST)
Date: Sat, 30 Nov 2024 18:58:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Zheng Zengkai <zhengzengkai@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2466/2466] drivers/ata/libata-eh.c:3257
 ata_eh_set_lpm() warn: variable dereferenced before check 'ap' (see line
 3240)
Message-ID: <d9da7a75-40d7-425a-a039-03b362cf0411@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a0d38e859312d55415b596dc57d4ac3f260f49e4
commit: f83af24f656adf6bcda72ba1c42882035beec4eb [2466/2466] ata: Add support for disabling PhyRdy Change Interrupt based on actual LPM capability
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241128/202411281144.DkOnMkIw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411281144.DkOnMkIw-lkp@intel.com/

smatch warnings:
drivers/ata/libata-eh.c:3257 ata_eh_set_lpm() warn: variable dereferenced before check 'ap' (see line 3240)

vim +/ap +3257 drivers/ata/libata-eh.c

6b7ae9545ad987 Tejun Heo                 2010-09-01  3236  static int ata_eh_set_lpm(struct ata_link *link, enum ata_lpm_policy policy,
6b7ae9545ad987 Tejun Heo                 2010-09-01  3237  			  struct ata_device **r_failed_dev)
6b7ae9545ad987 Tejun Heo                 2010-09-01  3238  {
6c8ea89cecd780 Tejun Heo                 2010-09-01  3239  	struct ata_port *ap = ata_is_host_link(link) ? link->ap : NULL;
                                                                                                                          ^^^^
"ap" can be NULL

f83af24f656adf LeoLiu-oc                 2022-02-23 @3240  	struct device *device = ap->host->dev;
                                                                                        ^^^^
Unchecked dereference

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
                                                                          ^^^^
Another unchecked dereference

f83af24f656adf LeoLiu-oc                 2022-02-23  3253  		link->flags |= ATA_LFLAG_NO_LPM;
f83af24f656adf LeoLiu-oc                 2022-02-23  3254  
6b7ae9545ad987 Tejun Heo                 2010-09-01  3255  	/* if the link or host doesn't do LPM, noop */
4c9029e7d00f31 Bartlomiej Zolnierkiewicz 2020-03-26  3256  	if (!IS_ENABLED(CONFIG_SATA_HOST) ||
4c9029e7d00f31 Bartlomiej Zolnierkiewicz 2020-03-26 @3257  	    (link->flags & ATA_LFLAG_NO_LPM) || (ap && !ap->ops->set_lpm))
                                                                                                         ^^
The rest of the function checks for NULL but it's too late.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

