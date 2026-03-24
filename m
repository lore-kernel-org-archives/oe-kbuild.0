Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071A392C42
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340628; cv=none; b=XPJq0a1os8HD+D0I0vF8P99H5bysGS5IaUjvs8Fob9B34HTc1AtQ1wbm6ek3Rc9An2jILnAfBP3v63Zsl28PSkDqf9GiJt6qCxlhO9nplBpq3hTC3io4OaT8ChbZN2KZXCaUAVG7rjhN4JnjA2bypOXjw+k7uUhaATbyC/nb5WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340628; c=relaxed/simple;
	bh=KUb+SKSobFGQyXiEJPxkjeu9WjISMFMuvBnZLHS4sLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5J/IvU5FB5zh/yMscsNnXEdHOyqdnWZ/pSutaDhkeLrrq6rXhH+BgYgcAxY1NjS97gS1nn/EZart4HLef24QKwjg+Y8nY1aNVen9Nixe3BtSXwLjymJhAIli8VtFPCS3JXyzYi8QHWwawpZVho7L6ml99C2hPpqt5Oa6Zgk5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4VLoiU+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4VLoiU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774340620; x=1805876620;
  h=date:from:to:cc:subject:message-id;
  bh=KUb+SKSobFGQyXiEJPxkjeu9WjISMFMuvBnZLHS4sLg=;
  b=m4VLoiU+AkaH6//OB4KmRgA5QueYWA03zUxx9VCwaJEITqoNcmVkgJEt
   WuJaCjCOsvN7QlCLmN2W+GZBHU0+s1MDwv7bH7FMOCI0xo1hgzFcSEXKJ
   jLV7eKELOFORzCi0Ou0RsEsJ7Otyfh26l73hZsm8roc4Qk17QzCJuoTUi
   12pga8Q2vVV4yzQvfphg8sO7RKLuplqkvg8LKiYGyejIBJcXywCiLpjIU
   niB8Wp2a7aHO3/r6GbQcF5K+R/JWac51SJKOPvcovlNSXUQBaYCFA0sPJ
   UBjjk3z5bAUfMx/pcYQLzjegVjze/O49nnINELLnaOk4tNpXfFtArzjoY
   Q==;
X-CSE-ConnectionGUID: JzMUr73bRiyYYZVqbXWPDQ==
X-CSE-MsgGUID: kqrhtj6PQjOOuradys9Cfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75321928"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75321928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:23:37 -0700
X-CSE-ConnectionGUID: 5VsJ1W/ZQeSTPwIj5Qa0OQ==
X-CSE-MsgGUID: lh2+gbE4Tn23xYMj+nxuRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223500810"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 01:23:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4x2y-000000004DZ-3LUt;
	Tue, 24 Mar 2026 08:23:32 +0000
Date: Tue, 24 Mar 2026 16:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/ac97/ac97_pcm.c:630 snd_ac97_pcm_open() warn:
 inconsistent returns '&pcm->bus->bus_lock'.
Message-ID: <202603241636.NHZgqDzh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: fcee249f98d0b84d5d0222b47d30c93bbca08e17 ALSA: ac97: Use guard() for spin locks
date:   7 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r073-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241636.NHZgqDzh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603241636.NHZgqDzh-lkp@intel.com/

smatch warnings:
sound/pci/ac97/ac97_pcm.c:630 snd_ac97_pcm_open() warn: inconsistent returns '&pcm->bus->bus_lock'.
sound/pci/ac97/ac97_pcm.c:630 snd_ac97_pcm_open() warn: inconsistent returns 'irq'.

vim +630 sound/pci/ac97/ac97_pcm.c

7b09679c431ba9 Takashi Iwai   2006-04-28  542  
^1da177e4c3f41 Linus Torvalds 2005-04-16  543  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  544   * snd_ac97_pcm_open - opens the given AC97 pcm
^1da177e4c3f41 Linus Torvalds 2005-04-16  545   * @pcm: the ac97 pcm instance
^1da177e4c3f41 Linus Torvalds 2005-04-16  546   * @rate: rate in Hz, if codec does not support VRA, this value must be 48000Hz
^1da177e4c3f41 Linus Torvalds 2005-04-16  547   * @cfg: output stream characteristics
^1da177e4c3f41 Linus Torvalds 2005-04-16  548   * @slots: a subset of allocated slots (snd_ac97_pcm_assign) for this pcm
^1da177e4c3f41 Linus Torvalds 2005-04-16  549   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  550   * It locks the specified slots and sets the given rate to AC97 registers.
eb7c06e8e9c93b Yacine Belkadi 2013-03-11  551   *
eb7c06e8e9c93b Yacine Belkadi 2013-03-11  552   * Return: Zero if successful, or a negative error code on failure.
^1da177e4c3f41 Linus Torvalds 2005-04-16  553   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  554  int snd_ac97_pcm_open(struct ac97_pcm *pcm, unsigned int rate,
^1da177e4c3f41 Linus Torvalds 2005-04-16  555  		      enum ac97_pcm_cfg cfg, unsigned short slots)
^1da177e4c3f41 Linus Torvalds 2005-04-16  556  {
ee42381e71c563 Takashi Iwai   2005-11-17  557  	struct snd_ac97_bus *bus;
^1da177e4c3f41 Linus Torvalds 2005-04-16  558  	int i, cidx, r, ok_flag;
^1da177e4c3f41 Linus Torvalds 2005-04-16  559  	unsigned int reg_ok[4] = {0,0,0,0};
^1da177e4c3f41 Linus Torvalds 2005-04-16  560  	unsigned char reg;
^1da177e4c3f41 Linus Torvalds 2005-04-16  561  	int err = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  562  
^1da177e4c3f41 Linus Torvalds 2005-04-16  563  	r = rate > 48000;
^1da177e4c3f41 Linus Torvalds 2005-04-16  564  	bus = pcm->bus;
^1da177e4c3f41 Linus Torvalds 2005-04-16  565  	if (cfg == AC97_PCM_CFG_SPDIF) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  566  		for (cidx = 0; cidx < 4; cidx++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  567  			if (bus->codec[cidx] && (bus->codec[cidx]->ext_id & AC97_EI_SPDIF)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  568  				err = set_spdif_rate(bus->codec[cidx], rate);
^1da177e4c3f41 Linus Torvalds 2005-04-16  569  				if (err < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  570  					return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  571  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  572  	}
fcee249f98d0b8 Takashi Iwai   2025-08-29  573  	scoped_guard(spinlock_irq, &pcm->bus->bus_lock) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  574  		for (i = 3; i < 12; i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  575  			if (!(slots & (1 << i)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  576  				continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  577  			ok_flag = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  578  			for (cidx = 0; cidx < 4; cidx++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  579  				if (bus->used_slots[pcm->stream][cidx] & (1 << i)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  580  					err = -EBUSY;
^1da177e4c3f41 Linus Torvalds 2005-04-16  581  					goto error;
^1da177e4c3f41 Linus Torvalds 2005-04-16  582  				}
^1da177e4c3f41 Linus Torvalds 2005-04-16  583  				if (pcm->r[r].rslots[cidx] & (1 << i)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  584  					bus->used_slots[pcm->stream][cidx] |= (1 << i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  585  					ok_flag++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  586  				}
^1da177e4c3f41 Linus Torvalds 2005-04-16  587  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  588  			if (!ok_flag) {
38c16e34fe2f72 Takashi Iwai   2014-02-25  589  				dev_err(bus->card->dev,
38c16e34fe2f72 Takashi Iwai   2014-02-25  590  					"cannot find configuration for AC97 slot %i\n",
38c16e34fe2f72 Takashi Iwai   2014-02-25  591  					i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  592  				err = -EAGAIN;
^1da177e4c3f41 Linus Torvalds 2005-04-16  593  				goto error;
^1da177e4c3f41 Linus Torvalds 2005-04-16  594  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  595  		}
6dbe662874ba08 Takashi Iwai   2006-06-27  596  		pcm->cur_dbl = r;
fcee249f98d0b8 Takashi Iwai   2025-08-29  597  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  598  	for (i = 3; i < 12; i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  599  		if (!(slots & (1 << i)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  600  			continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  601  		for (cidx = 0; cidx < 4; cidx++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  602  			if (pcm->r[r].rslots[cidx] & (1 << i)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  603  				reg = get_slot_reg(pcm, cidx, i, r);
^1da177e4c3f41 Linus Torvalds 2005-04-16  604  				if (reg == 0xff) {
38c16e34fe2f72 Takashi Iwai   2014-02-25  605  					dev_err(bus->card->dev,
38c16e34fe2f72 Takashi Iwai   2014-02-25  606  						"invalid AC97 slot %i?\n", i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  607  					continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  608  				}
^1da177e4c3f41 Linus Torvalds 2005-04-16  609  				if (reg_ok[cidx] & (1 << (reg - AC97_PCM_FRONT_DAC_RATE)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  610  					continue;
38c16e34fe2f72 Takashi Iwai   2014-02-25  611  				dev_dbg(bus->card->dev,
38c16e34fe2f72 Takashi Iwai   2014-02-25  612  					"setting ac97 reg 0x%x to rate %d\n",
38c16e34fe2f72 Takashi Iwai   2014-02-25  613  					reg, rate);
^1da177e4c3f41 Linus Torvalds 2005-04-16  614  				err = snd_ac97_set_rate(pcm->r[r].codec[cidx], reg, rate);
^1da177e4c3f41 Linus Torvalds 2005-04-16  615  				if (err < 0)
38c16e34fe2f72 Takashi Iwai   2014-02-25  616  					dev_err(bus->card->dev,
38c16e34fe2f72 Takashi Iwai   2014-02-25  617  						"error in snd_ac97_set_rate: cidx=%d, reg=0x%x, rate=%d, err=%d\n",
38c16e34fe2f72 Takashi Iwai   2014-02-25  618  						cidx, reg, rate, err);
^1da177e4c3f41 Linus Torvalds 2005-04-16  619  				else
^1da177e4c3f41 Linus Torvalds 2005-04-16  620  					reg_ok[cidx] |= (1 << (reg - AC97_PCM_FRONT_DAC_RATE));
^1da177e4c3f41 Linus Torvalds 2005-04-16  621  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  622  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  623  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  624  	pcm->aslots = slots;
^1da177e4c3f41 Linus Torvalds 2005-04-16  625  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  626  
^1da177e4c3f41 Linus Torvalds 2005-04-16  627   error:
^1da177e4c3f41 Linus Torvalds 2005-04-16  628  	pcm->aslots = slots;
^1da177e4c3f41 Linus Torvalds 2005-04-16  629  	snd_ac97_pcm_close(pcm);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @630  	return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  631  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  632  

:::::: The code at line 630 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
