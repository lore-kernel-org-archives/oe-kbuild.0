Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB558202C5D
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755972337; cv=none; b=twQGTfL0EtzNpHpIBipIzr1yA7zxg51HftBxhlyK8a+71o5RZZOz8FaLuJkjm/rRAp8ha6zWHv9vYoGlyANoV2g/Fn2Z/JJsX/z3GzY0UmJo3WdDt4EadfBV5kKH2FlmmIi0guHr65psJ1EFNG7UHPSXIKAYL9BeSxW+CzPZCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755972337; c=relaxed/simple;
	bh=TfO5w/t18Ci84VlSf1APpbh22C6BLHD+ALBRcnzgFCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7ia85/VTBc3i/cv3LpnRGBZpcDVaepS37VRPQi3a74yPPodGh1LcNjkMRXLfdkgAP8+YVYNwRGiQsxLZT4LnRDTHdRaJrPkNOzR2J3L0hnxXgpYyoLwX5EKK8X75cE5Y40d9GCZ6KEweXGJ1XKq/ZsmRX0Cl6D6hbbIA6YWx70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ6mB4TE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ6mB4TE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755972336; x=1787508336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfO5w/t18Ci84VlSf1APpbh22C6BLHD+ALBRcnzgFCM=;
  b=cZ6mB4TEvkcoVuQ9CMEEomARMuIpI8gO8AGIEAvy0Zld3tYOsTHVAKm6
   LziricOWg7q3NX4Z8izxWAZda7Jy4RWYTqPYNTzZdEyhJUZ55ZyZsVDSN
   0/7+aW0dVyY015fuQgur/HLxTLsJRBRnAfl2FsvJ98thn0qLQ3dknAY09
   t7MISTEHTFG42cr526yU7X578QO/E9x9izAMzg0iRQOwDetUB6N2CWr+o
   PtWyxUfRKU5+vWeFi+udXKd8u4Echa/F3Dx9yQJn+wFaeWzuuSuEnOGJu
   sx0YDfRP1dspcy0xvbajFV8x0roS6y5gN1v7sf/2+GylPNTiT6NkbnLsb
   w==;
X-CSE-ConnectionGUID: WE6BXB2ES0iK1MO1GC88SQ==
X-CSE-MsgGUID: s4LIa9ItQCWNBVcZ4JrkBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62076119"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62076119"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 11:05:35 -0700
X-CSE-ConnectionGUID: 6ZQKsh+ISxKFzIMc25IWlA==
X-CSE-MsgGUID: k1VsaCfcScuYkjl6NxAHaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174226928"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Aug 2025 11:05:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upscN-000MUj-2v;
	Sat, 23 Aug 2025 18:05:31 +0000
Date: Sun, 24 Aug 2025 02:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:test/auto-cleanup 61/178] sound/pci/ac97/ac97_pcm.c:630
 snd_ac97_pcm_open() warn: inconsistent returns '&pcm->bus->bus_lock'.
Message-ID: <202508240241.iMz7IXHK-lkp@intel.com>
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
CC: alsa-devel@alsa-project.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/auto-cleanup
head:   1e7737301c8d897813301af12b69031eef11c5ef
commit: 3a6d8fb3c6b1664d1e574b0cd09fd92064c5fa0c [61/178] ALSA: ac97: Use guard() for spin locks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240241.iMz7IXHK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508240241.iMz7IXHK-lkp@intel.com/

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
3a6d8fb3c6b166 Takashi Iwai   2025-08-07  573  	scoped_guard(spinlock_irq, &pcm->bus->bus_lock) {
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
3a6d8fb3c6b166 Takashi Iwai   2025-08-07  597  	}
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
