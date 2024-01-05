Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575591FB4
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jan 2024 02:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzxBsozn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704421462; x=1735957462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cjn/5Wwpshs3f+JoCjlltIxV4tg50SmrnHdwMoi/Ffk=;
  b=DzxBsozn/uTlcRwJukzZSiVCqbF2yR6rWyhjqTSnK4cSyxobFxmxevlx
   x4jlZlooUdEFMZtABr8FHmWVo8B4+Qa5op8t9Uq5TWPzbB7JQ2rH2psfT
   cKyWtFqmjjbdRI67RXqxe0Q5RtMXNwbiwc49tUX4JaNpMEiwwJE3JceD7
   1viZG2IJ9V1GmlJHQpvJv1lQwq7PBDI7+2YDO7ZRORW4CUZpKMqaZpp74
   vxo+aL1X7Q6LDASaaqVxW6bb58/hSJYy88RN6P9e4nTaQBAMXGVWYkvmv
   Mcccqg0bJHLgIMVvnbyIluhF7hPMsGAF4GC1W0zcTSf86HJMmx5crGhKP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4228960"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4228960"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 18:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="904028806"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="904028806"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2024 18:24:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLZsS-0000fg-01;
	Fri, 05 Jan 2024 02:24:04 +0000
Date: Fri, 5 Jan 2024 10:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] [v2] ALSA: hdsp: fix some memleaks in
 snd_hdsp_hwdep_ioctl
Message-ID: <202401051031.8odmcqKi-lkp@intel.com>
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
In-Reply-To: <20231227060322.3556052-1-alexious@zju.edu.cn>
References: <20231227060322.3556052-1-alexious@zju.edu.cn>
TO: Zhipeng Lu <alexious@zju.edu.cn>
TO: alexious@zju.edu.cn
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: linux-sound@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Zhipeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.7-rc8 next-20240104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhipeng-Lu/ALSA-hdsp-fix-some-memleaks-in-snd_hdsp_hwdep_ioctl/20231227-140703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231227060322.3556052-1-alexious%40zju.edu.cn
patch subject: [PATCH] [v2] ALSA: hdsp: fix some memleaks in snd_hdsp_hwdep_ioctl
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-141-20240104 (https://download.01.org/0day-ci/archive/20240105/202401051031.8odmcqKi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401051031.8odmcqKi-lkp@intel.com/

New smatch warnings:
sound/pci/rme9652/hdsp.c:4918 snd_hdsp_hwdep_ioctl() error: uninitialized symbol 'err'.

Old smatch warnings:
sound/pci/rme9652/hdsp.c:3405 snd_hdsp_proc_read() warn: argument 5 to %lx specifier is cast from pointer
sound/pci/rme9652/hdsp.c:5219 hdsp_request_fw_loader() warn: 'fw' from request_firmware() not released on lines: 5197,5202,5208,5216.

vim +/err +4918 sound/pci/rme9652/hdsp.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  4727  
55e957d8328ef1 Takashi Iwai   2005-11-17  4728  static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  4729  {
9fe856e47e1751 Joe Perches    2010-09-04  4730  	struct hdsp *hdsp = hw->private_data;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4731  	void __user *argp = (void __user *)arg;
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4732  	int err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4733  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4734  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  4735  	case SNDRV_HDSP_IOCTL_GET_PEAK_RMS: {
55e957d8328ef1 Takashi Iwai   2005-11-17  4736  		struct hdsp_peak_rms __user *peak_rms = (struct hdsp_peak_rms __user *)arg;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4737  
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4738  		err = hdsp_check_for_iobox(hdsp);
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4739  		if (err < 0)
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4740  			return err;
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4741  
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4742  		err = hdsp_check_for_firmware(hdsp, 1);
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4743  		if (err < 0)
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4744  			return err;
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4745  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4746  		if (!(hdsp->state & HDSP_FirmwareLoaded)) {
a54ba0fe9fae3c Takashi Iwai   2014-02-26  4747  			dev_err(hdsp->card->dev,
a54ba0fe9fae3c Takashi Iwai   2014-02-26  4748  				"firmware needs to be uploaded to the card.\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  4749  			return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4750  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4751  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4752  		switch (hdsp->io_type) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  4753  		case H9652:
^1da177e4c3f41 Linus Torvalds 2005-04-16  4754  			return hdsp_9652_get_peak(hdsp, peak_rms);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4755  		case H9632:
^1da177e4c3f41 Linus Torvalds 2005-04-16  4756  			return hdsp_9632_get_peak(hdsp, peak_rms);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4757  		default:
^1da177e4c3f41 Linus Torvalds 2005-04-16  4758  			return hdsp_get_peak(hdsp, peak_rms);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4759  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4760  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4761  	case SNDRV_HDSP_IOCTL_GET_CONFIG_INFO: {
55e957d8328ef1 Takashi Iwai   2005-11-17  4762  		struct hdsp_config_info info;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4763  		unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4764  		int i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4765  
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4766  		err = hdsp_check_for_iobox(hdsp);
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4767  		if (err < 0)
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4768  			return err;
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4769  
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4770  		err = hdsp_check_for_firmware(hdsp, 1);
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4771  		if (err < 0)
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4772  			return err;
3ae7e2e22900b9 Tim Blechmann  2008-11-08  4773  
e68d3b316ab7b0 Dan Rosenberg  2010-09-25  4774  		memset(&info, 0, sizeof(info));
^1da177e4c3f41 Linus Torvalds 2005-04-16  4775  		spin_lock_irqsave(&hdsp->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4776  		info.pref_sync_ref = (unsigned char)hdsp_pref_sync_ref(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4777  		info.wordclock_sync_check = (unsigned char)hdsp_wc_sync_check(hdsp);
b0b9811956db48 Takashi Iwai   2005-10-20  4778  		if (hdsp->io_type != H9632)
^1da177e4c3f41 Linus Torvalds 2005-04-16  4779  		    info.adatsync_sync_check = (unsigned char)hdsp_adatsync_sync_check(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4780  		info.spdif_sync_check = (unsigned char)hdsp_spdif_sync_check(hdsp);
28b26e15533e60 Florian Faber  2010-12-01  4781  		for (i = 0; i < ((hdsp->io_type != Multiface && hdsp->io_type != RPM && hdsp->io_type != H9632) ? 3 : 1); ++i)
^1da177e4c3f41 Linus Torvalds 2005-04-16  4782  			info.adat_sync_check[i] = (unsigned char)hdsp_adat_sync_check(hdsp, i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4783  		info.spdif_in = (unsigned char)hdsp_spdif_in(hdsp);
4833c673dee69a Adrian Knoth   2013-01-15  4784  		info.spdif_out = (unsigned char)hdsp_toggle_setting(hdsp,
4833c673dee69a Adrian Knoth   2013-01-15  4785  				HDSP_SPDIFOpticalOut);
4833c673dee69a Adrian Knoth   2013-01-15  4786  		info.spdif_professional = (unsigned char)
4833c673dee69a Adrian Knoth   2013-01-15  4787  			hdsp_toggle_setting(hdsp, HDSP_SPDIFProfessional);
4833c673dee69a Adrian Knoth   2013-01-15  4788  		info.spdif_emphasis = (unsigned char)
4833c673dee69a Adrian Knoth   2013-01-15  4789  			hdsp_toggle_setting(hdsp, HDSP_SPDIFEmphasis);
4833c673dee69a Adrian Knoth   2013-01-15  4790  		info.spdif_nonaudio = (unsigned char)
4833c673dee69a Adrian Knoth   2013-01-15  4791  			hdsp_toggle_setting(hdsp, HDSP_SPDIFNonAudio);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4792  		info.spdif_sample_rate = hdsp_spdif_sample_rate(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4793  		info.system_sample_rate = hdsp->system_sample_rate;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4794  		info.autosync_sample_rate = hdsp_external_sample_rate(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4795  		info.system_clock_mode = (unsigned char)hdsp_system_clock_mode(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4796  		info.clock_source = (unsigned char)hdsp_clock_source(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4797  		info.autosync_ref = (unsigned char)hdsp_autosync_ref(hdsp);
4833c673dee69a Adrian Knoth   2013-01-15  4798  		info.line_out = (unsigned char)
4833c673dee69a Adrian Knoth   2013-01-15  4799  			hdsp_toggle_setting(hdsp, HDSP_LineOut);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4800  		if (hdsp->io_type == H9632) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  4801  			info.da_gain = (unsigned char)hdsp_da_gain(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4802  			info.ad_gain = (unsigned char)hdsp_ad_gain(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4803  			info.phone_gain = (unsigned char)hdsp_phone_gain(hdsp);
4833c673dee69a Adrian Knoth   2013-01-15  4804  			info.xlr_breakout_cable =
4833c673dee69a Adrian Knoth   2013-01-15  4805  				(unsigned char)hdsp_toggle_setting(hdsp,
4833c673dee69a Adrian Knoth   2013-01-15  4806  					HDSP_XLRBreakoutCable);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4807  
28b26e15533e60 Florian Faber  2010-12-01  4808  		} else if (hdsp->io_type == RPM) {
28b26e15533e60 Florian Faber  2010-12-01  4809  			info.da_gain = (unsigned char) hdsp_rpm_input12(hdsp);
28b26e15533e60 Florian Faber  2010-12-01  4810  			info.ad_gain = (unsigned char) hdsp_rpm_input34(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4811  		}
b0b9811956db48 Takashi Iwai   2005-10-20  4812  		if (hdsp->io_type == H9632 || hdsp->io_type == H9652)
4833c673dee69a Adrian Knoth   2013-01-15  4813  			info.analog_extension_board =
4833c673dee69a Adrian Knoth   2013-01-15  4814  				(unsigned char)hdsp_toggle_setting(hdsp,
4833c673dee69a Adrian Knoth   2013-01-15  4815  					    HDSP_AnalogExtensionBoard);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4816  		spin_unlock_irqrestore(&hdsp->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4817  		if (copy_to_user(argp, &info, sizeof(info)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4818  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4819  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4820  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4821  	case SNDRV_HDSP_IOCTL_GET_9632_AEB: {
55e957d8328ef1 Takashi Iwai   2005-11-17  4822  		struct hdsp_9632_aeb h9632_aeb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4823  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4824  		if (hdsp->io_type != H9632) return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4825  		h9632_aeb.aebi = hdsp->ss_in_channels - H9632_SS_CHANNELS;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4826  		h9632_aeb.aebo = hdsp->ss_out_channels - H9632_SS_CHANNELS;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4827  		if (copy_to_user(argp, &h9632_aeb, sizeof(h9632_aeb)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4828  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4829  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4830  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4831  	case SNDRV_HDSP_IOCTL_GET_VERSION: {
55e957d8328ef1 Takashi Iwai   2005-11-17  4832  		struct hdsp_version hdsp_version;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4833  		int err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4834  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4835  		if (hdsp->io_type == H9652 || hdsp->io_type == H9632) return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4836  		if (hdsp->io_type == Undefined) {
66c8f75919dd85 Takashi Iwai   2021-06-08  4837  			err = hdsp_get_iobox_version(hdsp);
66c8f75919dd85 Takashi Iwai   2021-06-08  4838  			if (err < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  4839  				return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4840  		}
d14df339c72b6e Dan Carpenter  2013-10-16  4841  		memset(&hdsp_version, 0, sizeof(hdsp_version));
^1da177e4c3f41 Linus Torvalds 2005-04-16  4842  		hdsp_version.io_type = hdsp->io_type;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4843  		hdsp_version.firmware_rev = hdsp->firmware_rev;
0f7c956533680d Dan Carpenter  2021-06-22  4844  		if (copy_to_user(argp, &hdsp_version, sizeof(hdsp_version)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4845  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4846  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4847  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4848  	case SNDRV_HDSP_IOCTL_UPLOAD_FIRMWARE: {
112e3f5ac505ea Takashi Iwai   2020-02-02  4849  		struct hdsp_firmware firmware;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4850  		u32 __user *firmware_data;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4851  		int err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4852  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4853  		if (hdsp->io_type == H9652 || hdsp->io_type == H9632) return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4854  		/* SNDRV_HDSP_IOCTL_GET_VERSION must have been called */
^1da177e4c3f41 Linus Torvalds 2005-04-16  4855  		if (hdsp->io_type == Undefined) return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4856  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4857  		if (hdsp->state & (HDSP_FirmwareCached | HDSP_FirmwareLoaded))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4858  			return -EBUSY;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4859  
a54ba0fe9fae3c Takashi Iwai   2014-02-26  4860  		dev_info(hdsp->card->dev,
a54ba0fe9fae3c Takashi Iwai   2014-02-26  4861  			 "initializing firmware upload\n");
112e3f5ac505ea Takashi Iwai   2020-02-02  4862  		if (copy_from_user(&firmware, argp, sizeof(firmware)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4863  			return -EFAULT;
112e3f5ac505ea Takashi Iwai   2020-02-02  4864  		firmware_data = (u32 __user *)firmware.firmware_data;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4865  
b0b9811956db48 Takashi Iwai   2005-10-20  4866  		if (hdsp_check_for_iobox (hdsp))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4867  			return -EIO;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4868  
90caaef6a1ce2e Takashi Iwai   2012-11-22  4869  		if (!hdsp->fw_uploaded) {
90caaef6a1ce2e Takashi Iwai   2012-11-22  4870  			hdsp->fw_uploaded = vmalloc(HDSP_FIRMWARE_SIZE);
90caaef6a1ce2e Takashi Iwai   2012-11-22  4871  			if (!hdsp->fw_uploaded)
90caaef6a1ce2e Takashi Iwai   2012-11-22  4872  				return -ENOMEM;
90caaef6a1ce2e Takashi Iwai   2012-11-22  4873  		}
90caaef6a1ce2e Takashi Iwai   2012-11-22  4874  
90caaef6a1ce2e Takashi Iwai   2012-11-22  4875  		if (copy_from_user(hdsp->fw_uploaded, firmware_data,
90caaef6a1ce2e Takashi Iwai   2012-11-22  4876  				   HDSP_FIRMWARE_SIZE)) {
b0d4acf304f079 Zhipeng Lu     2023-12-27  4877  			err = -EFAULT;
b0d4acf304f079 Zhipeng Lu     2023-12-27  4878  			goto free_fw_uploaded;
90caaef6a1ce2e Takashi Iwai   2012-11-22  4879  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4880  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4881  		hdsp->state |= HDSP_FirmwareCached;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4882  
66c8f75919dd85 Takashi Iwai   2021-06-08  4883  		err = snd_hdsp_load_firmware_from_cache(hdsp);
66c8f75919dd85 Takashi Iwai   2021-06-08  4884  		if (err < 0)
b0d4acf304f079 Zhipeng Lu     2023-12-27  4885  			goto free_fw_uploaded;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4886  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4887  		if (!(hdsp->state & HDSP_InitializationComplete)) {
66c8f75919dd85 Takashi Iwai   2021-06-08  4888  			err = snd_hdsp_enable_io(hdsp);
66c8f75919dd85 Takashi Iwai   2021-06-08  4889  			if (err < 0)
b0d4acf304f079 Zhipeng Lu     2023-12-27  4890  				goto free_fw_uploaded;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4891  
^1da177e4c3f41 Linus Torvalds 2005-04-16  4892  			snd_hdsp_initialize_channels(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4893  			snd_hdsp_initialize_midi_flush(hdsp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  4894  
66c8f75919dd85 Takashi Iwai   2021-06-08  4895  			err = snd_hdsp_create_alsa_devices(hdsp->card, hdsp);
66c8f75919dd85 Takashi Iwai   2021-06-08  4896  			if (err < 0) {
a54ba0fe9fae3c Takashi Iwai   2014-02-26  4897  				dev_err(hdsp->card->dev,
a54ba0fe9fae3c Takashi Iwai   2014-02-26  4898  					"error creating alsa devices\n");
b0d4acf304f079 Zhipeng Lu     2023-12-27  4899  				goto free_fw_uploaded;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4900  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4901  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4902  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4903  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4904  	case SNDRV_HDSP_IOCTL_GET_MIXER: {
55e957d8328ef1 Takashi Iwai   2005-11-17  4905  		struct hdsp_mixer __user *mixer = (struct hdsp_mixer __user *)argp;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4906  		if (copy_to_user(mixer->matrix, hdsp->mixer_matrix, sizeof(unsigned short)*HDSP_MATRIX_MIXER_SIZE))
^1da177e4c3f41 Linus Torvalds 2005-04-16  4907  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4908  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4909  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4910  	default:
^1da177e4c3f41 Linus Torvalds 2005-04-16  4911  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4912  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  4913  	return 0;
b0d4acf304f079 Zhipeng Lu     2023-12-27  4914  
b0d4acf304f079 Zhipeng Lu     2023-12-27  4915  free_fw_uploaded:
b0d4acf304f079 Zhipeng Lu     2023-12-27  4916  	vfree(hdsp->fw_uploaded);
b0d4acf304f079 Zhipeng Lu     2023-12-27  4917  	hdsp->fw_uploaded = NULL;
b0d4acf304f079 Zhipeng Lu     2023-12-27 @4918  	return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  4919  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  4920  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
