Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107871DF247
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765543557; cv=none; b=f+VGu8IMwk2wBUm1zbNrQ4dX/5aHSzdCbcSuXlwlvAzvPKU1B9MdNCL9z0rp4far/DbOBqMhchKzXbteeXHFLuHfYzJxxkmhJLFDrxBYBpVL78KYlqrv0mJWvyEASdHlgJWngsaKuUlkoI2iDu3KWe/flD6+GaS1M7Fn8/oSyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765543557; c=relaxed/simple;
	bh=PR+5jSZ+oSoN8CZyI2q6V06MUugeN4pnpFNj7kAciFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHHUDp0neqOTmRhELO0Vv/BVjZ6KtAYID9+Y+Hm35lsthUWmyOSlPvooxREphxlkSK3Ro5VMjZ+1n2g54D3hHivPNplZmvp8466w3aIuY0LBpmEIiQHEnA0yFqCak+CVw87tUVkr2VoWQdY9UlhwbicwAQHNZE8IFbHiCFqUX5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFCWm8ZM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFCWm8ZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765543556; x=1797079556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PR+5jSZ+oSoN8CZyI2q6V06MUugeN4pnpFNj7kAciFE=;
  b=iFCWm8ZMYX1oYRJ+qGEDYsfAtK/kwvdgsWumSgBnFoHYSyieBjRYIdAG
   TO4USwhQFsG+7mvFK+Wrmn+Y96mo2dVseFhI88PeITxZmZi4llwzoXQ2S
   cVbFC3QWhxL8nN2wh9KZ0MfZVWYk1zSnqLfCV4ZEaqPOcgivx2s/oGhRR
   +x/BiyIA6D4WpmIRWY53+kE/F1UuwUoIsgCqg+AzgmjZTk4Hd2mW3T64F
   jK1An0N3v6B0Tv4RtrpUZyvG5x71MagEocuv8F5Y1w2XNtrfsi93sYkoz
   M75MT37daAyK3tzhZiQ/awIr34gCaE1neNqxN4mdJ2foH49YHdD5J411K
   g==;
X-CSE-ConnectionGUID: 4ET7xS0VTm+r1JMaF2qYjw==
X-CSE-MsgGUID: SzpsbwzPTXO6rrYF3vBDog==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67704721"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67704721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:45:55 -0800
X-CSE-ConnectionGUID: NnIwpEGqQbiGBpyvRIrZaQ==
X-CSE-MsgGUID: r3hXJaO+RQS/o8hwnBvKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201567335"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 04:45:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU2Wt-0000000063N-0rJn;
	Fri, 12 Dec 2025 12:45:51 +0000
Date: Fri, 12 Dec 2025 20:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/ac97/ac97_pcm.c:630 snd_ac97_pcm_open() warn: inconsistent
 returns '&pcm->bus->bus_lock'.
Message-ID: <202512122048.tgeB9HR0-lkp@intel.com>
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
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: fcee249f98d0b84d5d0222b47d30c93bbca08e17 ALSA: ac97: Use guard() for spin locks
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122048.tgeB9HR0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122048.tgeB9HR0-lkp@intel.com/

smatch warnings:
sound/pci/ac97/ac97_pcm.c:630 snd_ac97_pcm_open() warn: inconsistent returns '&pcm->bus->bus_lock'.
sound/pci/ac97/ac97_pcm.c:630 snd_ac97_pcm_open() warn: inconsistent returns 'irq'.

vim +630 sound/pci/ac97/ac97_pcm.c

7b09679c431ba91 Takashi Iwai   2006-04-28  542  
^1da177e4c3f415 Linus Torvalds 2005-04-16  543  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  544   * snd_ac97_pcm_open - opens the given AC97 pcm
^1da177e4c3f415 Linus Torvalds 2005-04-16  545   * @pcm: the ac97 pcm instance
^1da177e4c3f415 Linus Torvalds 2005-04-16  546   * @rate: rate in Hz, if codec does not support VRA, this value must be 48000Hz
^1da177e4c3f415 Linus Torvalds 2005-04-16  547   * @cfg: output stream characteristics
^1da177e4c3f415 Linus Torvalds 2005-04-16  548   * @slots: a subset of allocated slots (snd_ac97_pcm_assign) for this pcm
^1da177e4c3f415 Linus Torvalds 2005-04-16  549   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  550   * It locks the specified slots and sets the given rate to AC97 registers.
eb7c06e8e9c93b4 Yacine Belkadi 2013-03-11  551   *
eb7c06e8e9c93b4 Yacine Belkadi 2013-03-11  552   * Return: Zero if successful, or a negative error code on failure.
^1da177e4c3f415 Linus Torvalds 2005-04-16  553   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  554  int snd_ac97_pcm_open(struct ac97_pcm *pcm, unsigned int rate,
^1da177e4c3f415 Linus Torvalds 2005-04-16  555  		      enum ac97_pcm_cfg cfg, unsigned short slots)
^1da177e4c3f415 Linus Torvalds 2005-04-16  556  {
ee42381e71c5632 Takashi Iwai   2005-11-17  557  	struct snd_ac97_bus *bus;
^1da177e4c3f415 Linus Torvalds 2005-04-16  558  	int i, cidx, r, ok_flag;
^1da177e4c3f415 Linus Torvalds 2005-04-16  559  	unsigned int reg_ok[4] = {0,0,0,0};
^1da177e4c3f415 Linus Torvalds 2005-04-16  560  	unsigned char reg;
^1da177e4c3f415 Linus Torvalds 2005-04-16  561  	int err = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  562  
^1da177e4c3f415 Linus Torvalds 2005-04-16  563  	r = rate > 48000;
^1da177e4c3f415 Linus Torvalds 2005-04-16  564  	bus = pcm->bus;
^1da177e4c3f415 Linus Torvalds 2005-04-16  565  	if (cfg == AC97_PCM_CFG_SPDIF) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  566  		for (cidx = 0; cidx < 4; cidx++)
^1da177e4c3f415 Linus Torvalds 2005-04-16  567  			if (bus->codec[cidx] && (bus->codec[cidx]->ext_id & AC97_EI_SPDIF)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  568  				err = set_spdif_rate(bus->codec[cidx], rate);
^1da177e4c3f415 Linus Torvalds 2005-04-16  569  				if (err < 0)
^1da177e4c3f415 Linus Torvalds 2005-04-16  570  					return err;
^1da177e4c3f415 Linus Torvalds 2005-04-16  571  			}
^1da177e4c3f415 Linus Torvalds 2005-04-16  572  	}
fcee249f98d0b84 Takashi Iwai   2025-08-29  573  	scoped_guard(spinlock_irq, &pcm->bus->bus_lock) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  574  		for (i = 3; i < 12; i++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  575  			if (!(slots & (1 << i)))
^1da177e4c3f415 Linus Torvalds 2005-04-16  576  				continue;
^1da177e4c3f415 Linus Torvalds 2005-04-16  577  			ok_flag = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  578  			for (cidx = 0; cidx < 4; cidx++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  579  				if (bus->used_slots[pcm->stream][cidx] & (1 << i)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  580  					err = -EBUSY;
^1da177e4c3f415 Linus Torvalds 2005-04-16  581  					goto error;
^1da177e4c3f415 Linus Torvalds 2005-04-16  582  				}
^1da177e4c3f415 Linus Torvalds 2005-04-16  583  				if (pcm->r[r].rslots[cidx] & (1 << i)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  584  					bus->used_slots[pcm->stream][cidx] |= (1 << i);
^1da177e4c3f415 Linus Torvalds 2005-04-16  585  					ok_flag++;
^1da177e4c3f415 Linus Torvalds 2005-04-16  586  				}
^1da177e4c3f415 Linus Torvalds 2005-04-16  587  			}
^1da177e4c3f415 Linus Torvalds 2005-04-16  588  			if (!ok_flag) {
38c16e34fe2f72c Takashi Iwai   2014-02-25  589  				dev_err(bus->card->dev,
38c16e34fe2f72c Takashi Iwai   2014-02-25  590  					"cannot find configuration for AC97 slot %i\n",
38c16e34fe2f72c Takashi Iwai   2014-02-25  591  					i);
^1da177e4c3f415 Linus Torvalds 2005-04-16  592  				err = -EAGAIN;
^1da177e4c3f415 Linus Torvalds 2005-04-16  593  				goto error;
^1da177e4c3f415 Linus Torvalds 2005-04-16  594  			}
^1da177e4c3f415 Linus Torvalds 2005-04-16  595  		}
6dbe662874ba085 Takashi Iwai   2006-06-27  596  		pcm->cur_dbl = r;
fcee249f98d0b84 Takashi Iwai   2025-08-29  597  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  598  	for (i = 3; i < 12; i++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  599  		if (!(slots & (1 << i)))
^1da177e4c3f415 Linus Torvalds 2005-04-16  600  			continue;
^1da177e4c3f415 Linus Torvalds 2005-04-16  601  		for (cidx = 0; cidx < 4; cidx++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  602  			if (pcm->r[r].rslots[cidx] & (1 << i)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  603  				reg = get_slot_reg(pcm, cidx, i, r);
^1da177e4c3f415 Linus Torvalds 2005-04-16  604  				if (reg == 0xff) {
38c16e34fe2f72c Takashi Iwai   2014-02-25  605  					dev_err(bus->card->dev,
38c16e34fe2f72c Takashi Iwai   2014-02-25  606  						"invalid AC97 slot %i?\n", i);
^1da177e4c3f415 Linus Torvalds 2005-04-16  607  					continue;
^1da177e4c3f415 Linus Torvalds 2005-04-16  608  				}
^1da177e4c3f415 Linus Torvalds 2005-04-16  609  				if (reg_ok[cidx] & (1 << (reg - AC97_PCM_FRONT_DAC_RATE)))
^1da177e4c3f415 Linus Torvalds 2005-04-16  610  					continue;
38c16e34fe2f72c Takashi Iwai   2014-02-25  611  				dev_dbg(bus->card->dev,
38c16e34fe2f72c Takashi Iwai   2014-02-25  612  					"setting ac97 reg 0x%x to rate %d\n",
38c16e34fe2f72c Takashi Iwai   2014-02-25  613  					reg, rate);
^1da177e4c3f415 Linus Torvalds 2005-04-16  614  				err = snd_ac97_set_rate(pcm->r[r].codec[cidx], reg, rate);
^1da177e4c3f415 Linus Torvalds 2005-04-16  615  				if (err < 0)
38c16e34fe2f72c Takashi Iwai   2014-02-25  616  					dev_err(bus->card->dev,
38c16e34fe2f72c Takashi Iwai   2014-02-25  617  						"error in snd_ac97_set_rate: cidx=%d, reg=0x%x, rate=%d, err=%d\n",
38c16e34fe2f72c Takashi Iwai   2014-02-25  618  						cidx, reg, rate, err);
^1da177e4c3f415 Linus Torvalds 2005-04-16  619  				else
^1da177e4c3f415 Linus Torvalds 2005-04-16  620  					reg_ok[cidx] |= (1 << (reg - AC97_PCM_FRONT_DAC_RATE));
^1da177e4c3f415 Linus Torvalds 2005-04-16  621  			}
^1da177e4c3f415 Linus Torvalds 2005-04-16  622  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  623  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  624  	pcm->aslots = slots;
^1da177e4c3f415 Linus Torvalds 2005-04-16  625  	return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  626  
^1da177e4c3f415 Linus Torvalds 2005-04-16  627   error:
^1da177e4c3f415 Linus Torvalds 2005-04-16  628  	pcm->aslots = slots;
^1da177e4c3f415 Linus Torvalds 2005-04-16  629  	snd_ac97_pcm_close(pcm);
^1da177e4c3f415 Linus Torvalds 2005-04-16 @630  	return err;
^1da177e4c3f415 Linus Torvalds 2005-04-16  631  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  632  

:::::: The code at line 630 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
