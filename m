Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE92262A6
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766643409; cv=none; b=g881VH/pgnoNrBLzVLi7q83p+p7R7A99qdI8u7hNI6ZhJUAXnii5WLw2Shj/RM7likg0u7EFRaBxfBFNcnjMBC+qPUTcy2+XKpPOy7EThC3F7Hg6BZfsMr97oNe7KVJKUj+LDq9DVW0VtpSkqUe5AiKt0R+F1GFLY8RykX3+RvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766643409; c=relaxed/simple;
	bh=MbaCALuTnFt5m/g6L88+buG8jezXDgqMlxlEXOsQdc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IKsImcb22AfCnM5WWtEyqepVVJDAFKUTWYaHq1W1r0yYGJrvzXAi1CcBfjRYtkbu/4WRtEJm176xb2o3705/H1x4jrHtg8eEmBXs5yu7vQcmPsQ1Cq5/DzvR8P60tsHORLR7hkh2debFZNlLdKJ3LBy5yMj9NRr7PbL5uKAQfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JesZbeEn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JesZbeEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766643408; x=1798179408;
  h=date:from:to:cc:subject:message-id;
  bh=MbaCALuTnFt5m/g6L88+buG8jezXDgqMlxlEXOsQdc4=;
  b=JesZbeEn0iJa37q4VIrreAyG1CCnZxHzVahfbc4wcZXUAaXs1N2IiIuM
   kloza5c2399faC8nghjNf5ZZ5Z96iVBBAfjNapyil6siQCd/XxUXok5a/
   ycCGFWAkrr850NH0sLrQzFbvayI7ZXhXweLu6vLcib1IRpLGN45750ECo
   fw5a6WQ7c9dHrfR9pj1fDVdqjZujym5Ytky/MnZQMdBE7rpY3F34jbJ6F
   mlhaH2hydoYDFbnsv6XQTWRp8K8wMDonZrxICO6io11TBW4KOTfi+bhim
   QylEGI7Fq9FO9OEPH2eO1wiAH9Xa45oe9ZijVeLJ2dkEhX+8pX9ORkPTm
   A==;
X-CSE-ConnectionGUID: QqrHHfFNS5Oy3kkzjV0FGQ==
X-CSE-MsgGUID: MKUxYOXoRNK3HxjazjnA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79089160"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79089160"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:16:47 -0800
X-CSE-ConnectionGUID: On83719CQ2+GCKoX2mpxSg==
X-CSE-MsgGUID: AZ+XYBNzQCeZWe3RRfEWiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199409396"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2025 22:16:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYeeR-000000003oY-1Gf3;
	Thu, 25 Dec 2025 06:16:43 +0000
Date: Thu, 25 Dec 2025 14:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/myrb.c:3148 DAC960_PD_hw_init() warn:
 'cb->io_addr' from __request_region() not released on lines: 3128,3135,3141.
Message-ID: <202512251451.uFTviWs0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r071-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251451.uFTviWs0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512251451.uFTviWs0-lkp@intel.com/

smatch warnings:
drivers/scsi/myrb.c:3148 DAC960_PD_hw_init() warn: 'cb->io_addr' from __request_region() not released on lines: 3128,3135,3141.
drivers/scsi/myrb.c:3314 DAC960_P_hw_init() warn: 'cb->io_addr' from __request_region() not released on lines: 3294,3301,3307.
drivers/net/ethernet/dec/tulip/winbond-840.c:653 netdev_open() warn: 'np->pci_dev->irq' from request_irq() not released on lines: 653.
drivers/net/wireless/mediatek/mt76/mt7603/mac.c:534 mt7603_mac_fill_rx() warn: potential spectre issue 'sband->channels' [r] (local cap)
drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:1301 bdisp_probe() warn: assigning (-38) to unsigned variable 'bdisp->id'

vim +3148 drivers/scsi/myrb.c

081ff398c56cc1 Hannes Reinecke 2018-10-17  3108  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3109  static int DAC960_PD_hw_init(struct pci_dev *pdev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3110  		struct myrb_hba *cb, void __iomem *base)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3111  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3112  	int timeout = 0;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3113  	unsigned char error, parm0, parm1;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3114  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3115  	if (!request_region(cb->io_addr, 0x80, "myrb")) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3116  		dev_err(&pdev->dev, "IO port 0x%lx busy\n",
081ff398c56cc1 Hannes Reinecke 2018-10-17  3117  			(unsigned long)cb->io_addr);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3118  		return -EBUSY;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3119  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3120  	DAC960_PD_disable_intr(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3121  	DAC960_PD_ack_hw_mbox_status(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3122  	udelay(1000);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3123  	while (DAC960_PD_init_in_progress(base) &&
081ff398c56cc1 Hannes Reinecke 2018-10-17  3124  	       timeout < MYRB_MAILBOX_TIMEOUT) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3125  		if (DAC960_PD_read_error_status(base, &error,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3126  					      &parm0, &parm1) &&
081ff398c56cc1 Hannes Reinecke 2018-10-17  3127  		    myrb_err_status(cb, error, parm0, parm1))
081ff398c56cc1 Hannes Reinecke 2018-10-17  3128  			return -EIO;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3129  		udelay(10);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3130  		timeout++;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3131  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3132  	if (timeout == MYRB_MAILBOX_TIMEOUT) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3133  		dev_err(&pdev->dev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3134  			"Timeout waiting for Controller Initialisation\n");
081ff398c56cc1 Hannes Reinecke 2018-10-17  3135  		return -ETIMEDOUT;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3136  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3137  	if (!myrb_enable_mmio(cb, NULL)) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3138  		dev_err(&pdev->dev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3139  			"Unable to Enable Memory Mailbox Interface\n");
081ff398c56cc1 Hannes Reinecke 2018-10-17  3140  		DAC960_PD_reset_ctrl(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3141  		return -ENODEV;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3142  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3143  	DAC960_PD_enable_intr(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3144  	cb->qcmd = DAC960_PD_qcmd;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3145  	cb->disable_intr = DAC960_PD_disable_intr;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3146  	cb->reset = DAC960_PD_reset_ctrl;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3147  
081ff398c56cc1 Hannes Reinecke 2018-10-17 @3148  	return 0;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3149  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3150  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3151  static irqreturn_t DAC960_PD_intr_handler(int irq, void *arg)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3152  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3153  	struct myrb_hba *cb = arg;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3154  	void __iomem *base = cb->io_base;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3155  	unsigned long flags;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3156  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3157  	spin_lock_irqsave(&cb->queue_lock, flags);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3158  	while (DAC960_PD_hw_mbox_status_available(base)) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3159  		unsigned char id = DAC960_PD_read_status_cmd_ident(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3160  		struct scsi_cmnd *scmd = NULL;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3161  		struct myrb_cmdblk *cmd_blk = NULL;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3162  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3163  		if (id == MYRB_DCMD_TAG)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3164  			cmd_blk = &cb->dcmd_blk;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3165  		else if (id == MYRB_MCMD_TAG)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3166  			cmd_blk = &cb->mcmd_blk;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3167  		else {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3168  			scmd = scsi_host_find_tag(cb->host, id - 3);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3169  			if (scmd)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3170  				cmd_blk = scsi_cmd_priv(scmd);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3171  		}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3172  		if (cmd_blk)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3173  			cmd_blk->status = DAC960_PD_read_status(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3174  		else
081ff398c56cc1 Hannes Reinecke 2018-10-17  3175  			dev_err(&cb->pdev->dev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3176  				"Unhandled command completion %d\n", id);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3177  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3178  		DAC960_PD_ack_intr(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3179  		DAC960_PD_ack_hw_mbox_status(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3180  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3181  		if (id < 3)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3182  			myrb_handle_cmdblk(cb, cmd_blk);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3183  		else
081ff398c56cc1 Hannes Reinecke 2018-10-17  3184  			myrb_handle_scsi(cb, cmd_blk, scmd);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3185  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3186  	spin_unlock_irqrestore(&cb->queue_lock, flags);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3187  	return IRQ_HANDLED;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3188  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3189  
182ad87c95e7fd Shixin Liu      2021-03-27  3190  static struct myrb_privdata DAC960_PD_privdata = {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3191  	.hw_init =	DAC960_PD_hw_init,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3192  	.irq_handler =	DAC960_PD_intr_handler,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3193  	.mmio_size =	DAC960_PD_mmio_size,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3194  };
081ff398c56cc1 Hannes Reinecke 2018-10-17  3195  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3196  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3197  /*
081ff398c56cc1 Hannes Reinecke 2018-10-17  3198   * DAC960 P Series Controllers
081ff398c56cc1 Hannes Reinecke 2018-10-17  3199   *
081ff398c56cc1 Hannes Reinecke 2018-10-17  3200   * Similar to the DAC960 PD Series Controllers, but some commands have
081ff398c56cc1 Hannes Reinecke 2018-10-17  3201   * to be translated.
081ff398c56cc1 Hannes Reinecke 2018-10-17  3202   */
081ff398c56cc1 Hannes Reinecke 2018-10-17  3203  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3204  static inline void myrb_translate_enquiry(void *enq)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3205  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3206  	memcpy(enq + 132, enq + 36, 64);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3207  	memset(enq + 36, 0, 96);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3208  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3209  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3210  static inline void myrb_translate_devstate(void *state)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3211  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3212  	memcpy(state + 2, state + 3, 1);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3213  	memmove(state + 4, state + 5, 2);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3214  	memmove(state + 6, state + 8, 4);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3215  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3216  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3217  static inline void myrb_translate_to_rw_command(struct myrb_cmdblk *cmd_blk)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3218  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3219  	union myrb_cmd_mbox *mbox = &cmd_blk->mbox;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3220  	int ldev_num = mbox->type5.ld.ldev_num;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3221  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3222  	mbox->bytes[3] &= 0x7;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3223  	mbox->bytes[3] |= mbox->bytes[7] << 6;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3224  	mbox->bytes[7] = ldev_num;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3225  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3226  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3227  static inline void myrb_translate_from_rw_command(struct myrb_cmdblk *cmd_blk)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3228  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3229  	union myrb_cmd_mbox *mbox = &cmd_blk->mbox;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3230  	int ldev_num = mbox->bytes[7];
081ff398c56cc1 Hannes Reinecke 2018-10-17  3231  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3232  	mbox->bytes[7] = mbox->bytes[3] >> 6;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3233  	mbox->bytes[3] &= 0x7;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3234  	mbox->bytes[3] |= ldev_num << 3;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3235  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3236  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3237  static void DAC960_P_qcmd(struct myrb_hba *cb, struct myrb_cmdblk *cmd_blk)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3238  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3239  	void __iomem *base = cb->io_base;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3240  	union myrb_cmd_mbox *mbox = &cmd_blk->mbox;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3241  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3242  	switch (mbox->common.opcode) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3243  	case MYRB_CMD_ENQUIRY:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3244  		mbox->common.opcode = MYRB_CMD_ENQUIRY_OLD;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3245  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3246  	case MYRB_CMD_GET_DEVICE_STATE:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3247  		mbox->common.opcode = MYRB_CMD_GET_DEVICE_STATE_OLD;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3248  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3249  	case MYRB_CMD_READ:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3250  		mbox->common.opcode = MYRB_CMD_READ_OLD;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3251  		myrb_translate_to_rw_command(cmd_blk);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3252  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3253  	case MYRB_CMD_WRITE:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3254  		mbox->common.opcode = MYRB_CMD_WRITE_OLD;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3255  		myrb_translate_to_rw_command(cmd_blk);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3256  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3257  	case MYRB_CMD_READ_SG:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3258  		mbox->common.opcode = MYRB_CMD_READ_SG_OLD;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3259  		myrb_translate_to_rw_command(cmd_blk);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3260  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3261  	case MYRB_CMD_WRITE_SG:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3262  		mbox->common.opcode = MYRB_CMD_WRITE_SG_OLD;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3263  		myrb_translate_to_rw_command(cmd_blk);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3264  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3265  	default:
081ff398c56cc1 Hannes Reinecke 2018-10-17  3266  		break;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3267  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3268  	while (DAC960_PD_hw_mbox_is_full(base))
081ff398c56cc1 Hannes Reinecke 2018-10-17  3269  		udelay(1);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3270  	DAC960_PD_write_cmd_mbox(base, mbox);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3271  	DAC960_PD_hw_mbox_new_cmd(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3272  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3273  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3274  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3275  static int DAC960_P_hw_init(struct pci_dev *pdev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3276  		struct myrb_hba *cb, void __iomem *base)
081ff398c56cc1 Hannes Reinecke 2018-10-17  3277  {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3278  	int timeout = 0;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3279  	unsigned char error, parm0, parm1;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3280  
081ff398c56cc1 Hannes Reinecke 2018-10-17  3281  	if (!request_region(cb->io_addr, 0x80, "myrb")) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3282  		dev_err(&pdev->dev, "IO port 0x%lx busy\n",
081ff398c56cc1 Hannes Reinecke 2018-10-17  3283  			(unsigned long)cb->io_addr);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3284  		return -EBUSY;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3285  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3286  	DAC960_PD_disable_intr(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3287  	DAC960_PD_ack_hw_mbox_status(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3288  	udelay(1000);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3289  	while (DAC960_PD_init_in_progress(base) &&
081ff398c56cc1 Hannes Reinecke 2018-10-17  3290  	       timeout < MYRB_MAILBOX_TIMEOUT) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3291  		if (DAC960_PD_read_error_status(base, &error,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3292  						&parm0, &parm1) &&
081ff398c56cc1 Hannes Reinecke 2018-10-17  3293  		    myrb_err_status(cb, error, parm0, parm1))
081ff398c56cc1 Hannes Reinecke 2018-10-17  3294  			return -EAGAIN;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3295  		udelay(10);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3296  		timeout++;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3297  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3298  	if (timeout == MYRB_MAILBOX_TIMEOUT) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3299  		dev_err(&pdev->dev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3300  			"Timeout waiting for Controller Initialisation\n");
081ff398c56cc1 Hannes Reinecke 2018-10-17  3301  		return -ETIMEDOUT;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3302  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3303  	if (!myrb_enable_mmio(cb, NULL)) {
081ff398c56cc1 Hannes Reinecke 2018-10-17  3304  		dev_err(&pdev->dev,
081ff398c56cc1 Hannes Reinecke 2018-10-17  3305  			"Unable to allocate DMA mapped memory\n");
081ff398c56cc1 Hannes Reinecke 2018-10-17  3306  		DAC960_PD_reset_ctrl(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3307  		return -ETIMEDOUT;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3308  	}
081ff398c56cc1 Hannes Reinecke 2018-10-17  3309  	DAC960_PD_enable_intr(base);
081ff398c56cc1 Hannes Reinecke 2018-10-17  3310  	cb->qcmd = DAC960_P_qcmd;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3311  	cb->disable_intr = DAC960_PD_disable_intr;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3312  	cb->reset = DAC960_PD_reset_ctrl;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3313  
081ff398c56cc1 Hannes Reinecke 2018-10-17 @3314  	return 0;
081ff398c56cc1 Hannes Reinecke 2018-10-17  3315  }
081ff398c56cc1 Hannes Reinecke 2018-10-17  3316  

:::::: The code at line 3148 was first introduced by commit
:::::: 081ff398c56cc1052091e299aae6f7f7de680853 scsi: myrb: Add Mylex RAID controller (block interface)

:::::: TO: Hannes Reinecke <hare@suse.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
