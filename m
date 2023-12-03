Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DAF15BF
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWxey5oE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585171; x=1733121171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8SgAp/UuvXjyrc0EHVW2HGP7OHHjJOKNMnztQlDi3E=;
  b=lWxey5oEnOZV9zuCVQkClzoQQbf3QifzWoDmFqZ9ccNzUDm6CDsdaSNB
   /ZcD0ebuIhBRXo0858UYn4cPXn/OIsBdJ+9sVVkC2fQC4kgJb0fUdsNnR
   igfyS6F2guXRYli/YTiXt5JK7Vag/5YxoYU5RJTMwdqpXQgindkSkfDRT
   tUoqVT8+PMxOWbXp2SgS+LMgp4+kB27bbzDN8Z7LbOVep9L7V4K1NVwqO
   Rjqep78rFZ2h4Ev4FmnCW2GCE9Vc7yInZKU/HpxhoMiIVHsTEdB5wdiwS
   1cC9JjUhPc+f1IHRnQgFbAdLiQ58v/+f4K3p0+aE67GnoRtCjJbi5BDPP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906505"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906505"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191173"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191173"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Ls-2M;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/hda/patch_ca0132.c:7568 ca0132_download_dsp_images() warn:
 'fw_entry' from request_firmware() not released on lines: 7554.
Message-ID: <202312031306.iKFKKE5O-lkp@intel.com>
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
CC: Nathan Chancellor <natechancellor@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 4fc90fb883fcb72d6bfbf84d554a3e820a05ef62 ALSA: hda/ca0132 - Simplify alt firmware loading code
date:   4 years, 8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 years, 8 months ago
config: x86_64-randconfig-161-20231108 (https://download.01.org/0day-ci/archive/20231203/202312031306.iKFKKE5O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031306.iKFKKE5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312031306.iKFKKE5O-lkp@intel.com/

New smatch warnings:
sound/pci/hda/patch_ca0132.c:7568 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 7554.
sound/pci/hda/patch_ca0132.c:7568 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 7554.

Old smatch warnings:
sound/pci/hda/patch_ca0132.c:2004 dspio_scp() error: we previously assumed 'reply_len' could be null (see line 1967)
sound/pci/hda/patch_ca0132.c:7557 ca0132_download_dsp_images() error: we previously assumed 'fw_entry' could be null (see line 7550)

vim +/fw_entry +7568 sound/pci/hda/patch_ca0132.c

e90f29e4427386 Ian Minett     2012-12-20  7514  
e90f29e4427386 Ian Minett     2012-12-20  7515  static bool ca0132_download_dsp_images(struct hda_codec *codec)
e90f29e4427386 Ian Minett     2012-12-20  7516  {
e90f29e4427386 Ian Minett     2012-12-20  7517  	bool dsp_loaded = false;
8a19bceef68d8e Connor McAdams 2018-05-08  7518  	struct ca0132_spec *spec = codec->spec;
e90f29e4427386 Ian Minett     2012-12-20  7519  	const struct dsp_image_seg *dsp_os_image;
4fc90fb883fcb7 Takashi Iwai   2019-03-22  7520  	const struct firmware *fw_entry = NULL;
8a19bceef68d8e Connor McAdams 2018-05-08  7521  	/*
8a19bceef68d8e Connor McAdams 2018-05-08  7522  	 * Alternate firmwares for different variants. The Recon3Di apparently
8a19bceef68d8e Connor McAdams 2018-05-08  7523  	 * can use the default firmware, but I'll leave the option in case
8a19bceef68d8e Connor McAdams 2018-05-08  7524  	 * it needs it again.
8a19bceef68d8e Connor McAdams 2018-05-08  7525  	 */
6da8f44624ad99 Takashi Iwai   2018-11-09  7526  	switch (ca0132_quirk(spec)) {
8a19bceef68d8e Connor McAdams 2018-05-08  7527  	case QUIRK_SBZ:
7a928186b377a7 Connor McAdams 2018-09-18  7528  	case QUIRK_R3D:
7a928186b377a7 Connor McAdams 2018-09-18  7529  	case QUIRK_AE5:
7a928186b377a7 Connor McAdams 2018-09-18  7530  		if (request_firmware(&fw_entry, DESKTOP_EFX_FILE,
4fc90fb883fcb7 Takashi Iwai   2019-03-22  7531  					codec->card->dev) != 0)
7a928186b377a7 Connor McAdams 2018-09-18  7532  			codec_dbg(codec, "Desktop firmware not found.");
4fc90fb883fcb7 Takashi Iwai   2019-03-22  7533  		else
7a928186b377a7 Connor McAdams 2018-09-18  7534  			codec_dbg(codec, "Desktop firmware selected.");
8a19bceef68d8e Connor McAdams 2018-05-08  7535  		break;
8a19bceef68d8e Connor McAdams 2018-05-08  7536  	case QUIRK_R3DI:
8a19bceef68d8e Connor McAdams 2018-05-08  7537  		if (request_firmware(&fw_entry, R3DI_EFX_FILE,
4fc90fb883fcb7 Takashi Iwai   2019-03-22  7538  					codec->card->dev) != 0)
8a19bceef68d8e Connor McAdams 2018-05-08  7539  			codec_dbg(codec, "Recon3Di alt firmware not detected.");
4fc90fb883fcb7 Takashi Iwai   2019-03-22  7540  		else
8a19bceef68d8e Connor McAdams 2018-05-08  7541  			codec_dbg(codec, "Recon3Di firmware selected.");
8a19bceef68d8e Connor McAdams 2018-05-08  7542  		break;
8a19bceef68d8e Connor McAdams 2018-05-08  7543  	default:
8a19bceef68d8e Connor McAdams 2018-05-08  7544  		break;
8a19bceef68d8e Connor McAdams 2018-05-08  7545  	}
8a19bceef68d8e Connor McAdams 2018-05-08  7546  	/*
8a19bceef68d8e Connor McAdams 2018-05-08  7547  	 * Use default ctefx.bin if no alt firmware is detected, or if none
8a19bceef68d8e Connor McAdams 2018-05-08  7548  	 * exists for your particular codec.
8a19bceef68d8e Connor McAdams 2018-05-08  7549  	 */
4fc90fb883fcb7 Takashi Iwai   2019-03-22  7550  	if (!fw_entry) {
8a19bceef68d8e Connor McAdams 2018-05-08  7551  		codec_dbg(codec, "Default firmware selected.");
8a19bceef68d8e Connor McAdams 2018-05-08  7552  		if (request_firmware(&fw_entry, EFX_FILE,
8a19bceef68d8e Connor McAdams 2018-05-08  7553  					codec->card->dev) != 0)
e90f29e4427386 Ian Minett     2012-12-20  7554  			return false;
8a19bceef68d8e Connor McAdams 2018-05-08  7555  	}
e90f29e4427386 Ian Minett     2012-12-20  7556  
15e4ba666ca6c2 Takashi Iwai   2013-01-15  7557  	dsp_os_image = (struct dsp_image_seg *)(fw_entry->data);
d1d28500cccc26 Dylan Reid     2013-03-14  7558  	if (dspload_image(codec, dsp_os_image, 0, 0, true, 0)) {
d9684bb5b3ef83 Takashi Iwai   2015-10-26  7559  		codec_err(codec, "ca0132 DSP load image failed\n");
d1d28500cccc26 Dylan Reid     2013-03-14  7560  		goto exit_download;
d1d28500cccc26 Dylan Reid     2013-03-14  7561  	}
d1d28500cccc26 Dylan Reid     2013-03-14  7562  
e90f29e4427386 Ian Minett     2012-12-20  7563  	dsp_loaded = dspload_wait_loaded(codec);
e90f29e4427386 Ian Minett     2012-12-20  7564  
d1d28500cccc26 Dylan Reid     2013-03-14  7565  exit_download:
15e4ba666ca6c2 Takashi Iwai   2013-01-15  7566  	release_firmware(fw_entry);
15e4ba666ca6c2 Takashi Iwai   2013-01-15  7567  
e90f29e4427386 Ian Minett     2012-12-20 @7568  	return dsp_loaded;
e90f29e4427386 Ian Minett     2012-12-20  7569  }
e90f29e4427386 Ian Minett     2012-12-20  7570  

:::::: The code at line 7568 was first introduced by commit
:::::: e90f29e44273867392d9d1e0fd94bbe7bffe0335 ALSA: hda/ca0132: Code shuffle to group similar functions.

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
