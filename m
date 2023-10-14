Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0261847
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Oct 2023 03:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1vYpRi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697254967; x=1728790967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fG0G3pipFljZAZQlDrnWxskrrjz+tNv5+CAmu9DoQHU=;
  b=a1vYpRi9bgjvjqgEjOAmKIlQHUZ8OnPOX9KlFVwOa1V6kEyGjHH2BKF2
   yKTsmiK9ivgieQtH7jKp0cOwWWcYK1M2lV0XWLVu73rccnDdFe8xVc+G2
   s/QlFv1Jv4M9vt4TiCnZ2yIjYSNg8gIFxKvbuF57mJnjaVN2lZ3ph6HML
   aw2Kh9RBEOhFhbEZY7uPozHFOncRFWv+0KN98mfBD/UIWcLRjKr8p1x4u
   wHu409PSn8DdXMmdKfINvGmPw9kda+oF7t9jstqbNe7GJPHawFgCyy7rk
   Ra1HVCF9cg+zrLuPkkJnt2ZLjzb7cLMFJ4bEgXwjYdl5vKOa8NELoH1Kl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375651845"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375651845"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 20:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898787324"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898787324"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 20:40:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrVY3-0005fn-0I;
	Sat, 14 Oct 2023 03:42:43 +0000
Date: Sat, 14 Oct 2023 11:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/drivers/mpu401/mpu401_uart.c:608 snd_mpu401_uart_new() warn:
 'port' from __request_region() not released on lines: 608.
Message-ID: <202310141155.X8iyU3es-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cb1f10d8c4b716c88b87ae4402a3305d96e5db2
commit: 3753af778dd9d0d5199d6a7d01b0ead33135d095 kbuild: fix single directory build
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230928 (https://download.01.org/0day-ci/archive/20231014/202310141155.X8iyU3es-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141155.X8iyU3es-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310141155.X8iyU3es-lkp@intel.com/

smatch warnings:
sound/drivers/mpu401/mpu401_uart.c:608 snd_mpu401_uart_new() warn: 'port' from __request_region() not released on lines: 608.

vim +/port +608 sound/drivers/mpu401/mpu401_uart.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  496  
^1da177e4c3f41 Linus Torvalds  2005-04-16  497  /**
^1da177e4c3f41 Linus Torvalds  2005-04-16  498   * snd_mpu401_uart_new - create an MPU401-UART instance
^1da177e4c3f41 Linus Torvalds  2005-04-16  499   * @card: the card instance
^1da177e4c3f41 Linus Torvalds  2005-04-16  500   * @device: the device index, zero-based
^1da177e4c3f41 Linus Torvalds  2005-04-16  501   * @hardware: the hardware type, MPU401_HW_XXXX
^1da177e4c3f41 Linus Torvalds  2005-04-16  502   * @port: the base address of MPU401 port
302e4c2f9e2b9f Takashi Iwai    2006-05-23  503   * @info_flags: bitflags MPU401_INFO_XXX
dba8b46992c559 Clemens Ladisch 2011-09-13  504   * @irq: the ISA irq number, -1 if not to be allocated
^1da177e4c3f41 Linus Torvalds  2005-04-16  505   * @rrawmidi: the pointer to store the new rawmidi instance
^1da177e4c3f41 Linus Torvalds  2005-04-16  506   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  507   * Creates a new MPU-401 instance.
^1da177e4c3f41 Linus Torvalds  2005-04-16  508   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  509   * Note that the rawmidi instance is returned on the rrawmidi argument,
^1da177e4c3f41 Linus Torvalds  2005-04-16  510   * not the mpu401 instance itself.  To access to the mpu401 instance,
e1fad17bb4084d Takashi Iwai    2005-11-17  511   * cast from rawmidi->private_data (with struct snd_mpu401 magic-cast).
^1da177e4c3f41 Linus Torvalds  2005-04-16  512   *
eb7c06e8e9c93b Yacine Belkadi  2013-03-11  513   * Return: Zero if successful, or a negative error code.
^1da177e4c3f41 Linus Torvalds  2005-04-16  514   */
e1fad17bb4084d Takashi Iwai    2005-11-17  515  int snd_mpu401_uart_new(struct snd_card *card, int device,
^1da177e4c3f41 Linus Torvalds  2005-04-16  516  			unsigned short hardware,
302e4c2f9e2b9f Takashi Iwai    2006-05-23  517  			unsigned long port,
302e4c2f9e2b9f Takashi Iwai    2006-05-23  518  			unsigned int info_flags,
dba8b46992c559 Clemens Ladisch 2011-09-13  519  			int irq,
e1fad17bb4084d Takashi Iwai    2005-11-17  520  			struct snd_rawmidi ** rrawmidi)
^1da177e4c3f41 Linus Torvalds  2005-04-16  521  {
e1fad17bb4084d Takashi Iwai    2005-11-17  522  	struct snd_mpu401 *mpu;
e1fad17bb4084d Takashi Iwai    2005-11-17  523  	struct snd_rawmidi *rmidi;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  524  	int in_enable, out_enable;
^1da177e4c3f41 Linus Torvalds  2005-04-16  525  	int err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  526  
^1da177e4c3f41 Linus Torvalds  2005-04-16  527  	if (rrawmidi)
^1da177e4c3f41 Linus Torvalds  2005-04-16  528  		*rrawmidi = NULL;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  529  	if (! (info_flags & (MPU401_INFO_INPUT | MPU401_INFO_OUTPUT)))
302e4c2f9e2b9f Takashi Iwai    2006-05-23  530  		info_flags |= MPU401_INFO_INPUT | MPU401_INFO_OUTPUT;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  531  	in_enable = (info_flags & MPU401_INFO_INPUT) ? 1 : 0;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  532  	out_enable = (info_flags & MPU401_INFO_OUTPUT) ? 1 : 0;
d2bc4d9ab154f9 Takashi Iwai    2021-06-08  533  	err = snd_rawmidi_new(card, "MPU-401U", device,
d2bc4d9ab154f9 Takashi Iwai    2021-06-08  534  			      out_enable, in_enable, &rmidi);
d2bc4d9ab154f9 Takashi Iwai    2021-06-08  535  	if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  536  		return err;
561b220a4dece1 Takashi Iwai    2005-09-09  537  	mpu = kzalloc(sizeof(*mpu), GFP_KERNEL);
f1a77dc17103e5 Markus Elfring  2017-08-12  538  	if (!mpu) {
ec1f43c83b9df3 Markus Elfring  2017-08-12  539  		err = -ENOMEM;
ec1f43c83b9df3 Markus Elfring  2017-08-12  540  		goto free_device;
^1da177e4c3f41 Linus Torvalds  2005-04-16  541  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  542  	rmidi->private_data = mpu;
^1da177e4c3f41 Linus Torvalds  2005-04-16  543  	rmidi->private_free = snd_mpu401_uart_free;
^1da177e4c3f41 Linus Torvalds  2005-04-16  544  	spin_lock_init(&mpu->input_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  545  	spin_lock_init(&mpu->output_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  546  	spin_lock_init(&mpu->timer_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  547  	mpu->hardware = hardware;
bc733d495267a2 Takashi Iwai    2012-07-23  548  	mpu->irq = -1;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  549  	if (! (info_flags & MPU401_INFO_INTEGRATED)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  550  		int res_size = hardware == MPU401_HW_PC98II ? 4 : 2;
2851d963e0038c Takashi Iwai    2006-05-18  551  		mpu->res = request_region(port, res_size, "MPU401 UART");
f1a77dc17103e5 Markus Elfring  2017-08-12  552  		if (!mpu->res) {
2851d963e0038c Takashi Iwai    2006-05-18  553  			snd_printk(KERN_ERR "mpu401_uart: "
2851d963e0038c Takashi Iwai    2006-05-18  554  				   "unable to grab port 0x%lx size %d\n",
2851d963e0038c Takashi Iwai    2006-05-18  555  				   port, res_size);
ec1f43c83b9df3 Markus Elfring  2017-08-12  556  			err = -EBUSY;
ec1f43c83b9df3 Markus Elfring  2017-08-12  557  			goto free_device;
^1da177e4c3f41 Linus Torvalds  2005-04-16  558  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  559  	}
302e4c2f9e2b9f Takashi Iwai    2006-05-23  560  	if (info_flags & MPU401_INFO_MMIO) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  561  		mpu->write = mpu401_write_mmio;
^1da177e4c3f41 Linus Torvalds  2005-04-16  562  		mpu->read = mpu401_read_mmio;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  563  	} else {
^1da177e4c3f41 Linus Torvalds  2005-04-16  564  		mpu->write = mpu401_write_port;
^1da177e4c3f41 Linus Torvalds  2005-04-16  565  		mpu->read = mpu401_read_port;
^1da177e4c3f41 Linus Torvalds  2005-04-16  566  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  567  	mpu->port = port;
^1da177e4c3f41 Linus Torvalds  2005-04-16  568  	if (hardware == MPU401_HW_PC98II)
^1da177e4c3f41 Linus Torvalds  2005-04-16  569  		mpu->cport = port + 2;
^1da177e4c3f41 Linus Torvalds  2005-04-16  570  	else
^1da177e4c3f41 Linus Torvalds  2005-04-16  571  		mpu->cport = port + 1;
dba8b46992c559 Clemens Ladisch 2011-09-13  572  	if (irq >= 0) {
88e24c3a4b30a6 Yong Zhang      2011-09-22  573  		if (request_irq(irq, snd_mpu401_uart_interrupt, 0,
2851d963e0038c Takashi Iwai    2006-05-18  574  				"MPU401 UART", (void *) mpu)) {
2851d963e0038c Takashi Iwai    2006-05-18  575  			snd_printk(KERN_ERR "mpu401_uart: "
2851d963e0038c Takashi Iwai    2006-05-18  576  				   "unable to grab IRQ %d\n", irq);
ec1f43c83b9df3 Markus Elfring  2017-08-12  577  			err = -EBUSY;
ec1f43c83b9df3 Markus Elfring  2017-08-12  578  			goto free_device;
^1da177e4c3f41 Linus Torvalds  2005-04-16  579  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  580  	}
dba8b46992c559 Clemens Ladisch 2011-09-13  581  	if (irq < 0 && !(info_flags & MPU401_INFO_IRQ_HOOK))
dba8b46992c559 Clemens Ladisch 2011-09-13  582  		info_flags |= MPU401_INFO_USE_TIMER;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  583  	mpu->info_flags = info_flags;
^1da177e4c3f41 Linus Torvalds  2005-04-16  584  	mpu->irq = irq;
^1da177e4c3f41 Linus Torvalds  2005-04-16  585  	if (card->shortname[0])
2851d963e0038c Takashi Iwai    2006-05-18  586  		snprintf(rmidi->name, sizeof(rmidi->name), "%s MIDI",
2851d963e0038c Takashi Iwai    2006-05-18  587  			 card->shortname);
^1da177e4c3f41 Linus Torvalds  2005-04-16  588  	else
^1da177e4c3f41 Linus Torvalds  2005-04-16  589  		sprintf(rmidi->name, "MPU-401 MIDI %d-%d",card->number, device);
302e4c2f9e2b9f Takashi Iwai    2006-05-23  590  	if (out_enable) {
2851d963e0038c Takashi Iwai    2006-05-18  591  		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
2851d963e0038c Takashi Iwai    2006-05-18  592  				    &snd_mpu401_uart_output);
302e4c2f9e2b9f Takashi Iwai    2006-05-23  593  		rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  594  	}
302e4c2f9e2b9f Takashi Iwai    2006-05-23  595  	if (in_enable) {
2851d963e0038c Takashi Iwai    2006-05-18  596  		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT,
2851d963e0038c Takashi Iwai    2006-05-18  597  				    &snd_mpu401_uart_input);
302e4c2f9e2b9f Takashi Iwai    2006-05-23  598  		rmidi->info_flags |= SNDRV_RAWMIDI_INFO_INPUT;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  599  		if (out_enable)
302e4c2f9e2b9f Takashi Iwai    2006-05-23  600  			rmidi->info_flags |= SNDRV_RAWMIDI_INFO_DUPLEX;
302e4c2f9e2b9f Takashi Iwai    2006-05-23  601  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  602  	mpu->rmidi = rmidi;
^1da177e4c3f41 Linus Torvalds  2005-04-16  603  	if (rrawmidi)
^1da177e4c3f41 Linus Torvalds  2005-04-16  604  		*rrawmidi = rmidi;
^1da177e4c3f41 Linus Torvalds  2005-04-16  605  	return 0;
ec1f43c83b9df3 Markus Elfring  2017-08-12  606  free_device:
ec1f43c83b9df3 Markus Elfring  2017-08-12  607  	snd_device_free(card, rmidi);
ec1f43c83b9df3 Markus Elfring  2017-08-12 @608  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  609  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  610  

:::::: The code at line 608 was first introduced by commit
:::::: ec1f43c83b9df3052209e0c7e7d936e15251c867 ALSA: mpu401: Use common error handling code in snd_mpu401_uart_new()

:::::: TO: Markus Elfring <elfring@users.sourceforge.net>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
