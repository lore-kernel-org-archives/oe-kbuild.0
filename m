Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547F03C04
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679566825; x=1711102825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e1jwT3Wimzzz79LkDCGbGjQocJz+gTG//q5SLYmWyiE=;
  b=mAsFqgmFK/5jkuHopAybTz98X3lQsQOXOoXzcViB0e/DxeI8K9SKq1V7
   ckKzxuX3+fAqpW4SsHN3kYS2R9qOiDr2Nlv7mw81AwuZX79UK0lglZV+G
   28WGAfbQRoD6F9Of8WPuHaejGVoXXLF7qx1KeV39ICGX3KZ90nKrCTbmp
   zbDoZc78cZXbA5CfplR1ijGP1CFvKTASmU5KifK12nbl007ldbRWKKJ5N
   dK8aT9NPl5ByeXwEN3v+sW6BNPKLRPS/aBULk7kehPsvLqgXmxdpInofS
   wajEkSGoo1ii2qVn2n7j028g+oGucYDnvM+ufw3qyCvw0qOpMo/Vk6ZOY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338169983"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="338169983"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="792955292"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="792955292"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2023 03:20:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfI3R-000EF2-0D;
	Thu, 23 Mar 2023 10:20:21 +0000
Date: Thu, 23 Mar 2023 18:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3942/6100] sound/soc/sof/ipc4-pcm.c:391
 sof_ipc4_pcm_dai_link_fixup_rate() error: uninitialized symbol 'be_rate'.
Message-ID: <202303231845.HJgz6uKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kai Vehmanen <kai.vehmanen@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c4a254d78f89546d0e74a40617ef24c6151c8d1
commit: 279e52d6b9f366f9930a0f90ee84e7d0a6a27b26 [3942/6100] ASoC: SOF: ipc4-pcm: support multiple configs for BE DAIs
:::::: branch date: 7 hours ago
:::::: commit date: 6 days ago
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230323/202303231845.HJgz6uKC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303231845.HJgz6uKC-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-pcm.c:391 sof_ipc4_pcm_dai_link_fixup_rate() error: uninitialized symbol 'be_rate'.
sound/soc/sof/ipc4-topology.c:1132 ipc4_copier_set_capture_fmt() error: uninitialized symbol 'sample_valid_bits'.

Old smatch warnings:
sound/soc/sof/ipc4-pcm.c:412 sof_ipc4_pcm_dai_link_fixup_rate() error: uninitialized symbol 'be_rate'.
sound/soc/sof/ipc4-topology.c:263 sof_ipc4_get_audio_fmt() error: uninitialized symbol 'in_format'.

vim +/be_rate +391 sound/soc/sof/ipc4-pcm.c

e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  364  
279e52d6b9f366 Kai Vehmanen      2023-03-16  365  /*
279e52d6b9f366 Kai Vehmanen      2023-03-16  366   * Fixup DAI link parameters for sampling rate based on
279e52d6b9f366 Kai Vehmanen      2023-03-16  367   * DAI copier configuration.
279e52d6b9f366 Kai Vehmanen      2023-03-16  368   */
279e52d6b9f366 Kai Vehmanen      2023-03-16  369  static int sof_ipc4_pcm_dai_link_fixup_rate(struct snd_sof_dev *sdev,
279e52d6b9f366 Kai Vehmanen      2023-03-16  370  					    struct snd_pcm_hw_params *params,
279e52d6b9f366 Kai Vehmanen      2023-03-16  371  					    struct sof_ipc4_copier *ipc4_copier)
279e52d6b9f366 Kai Vehmanen      2023-03-16  372  {
279e52d6b9f366 Kai Vehmanen      2023-03-16  373  	struct sof_ipc4_pin_format *pin_fmts = ipc4_copier->available_fmt.input_pin_fmts;
279e52d6b9f366 Kai Vehmanen      2023-03-16  374  	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
279e52d6b9f366 Kai Vehmanen      2023-03-16  375  	int num_input_formats = ipc4_copier->available_fmt.num_input_formats;
279e52d6b9f366 Kai Vehmanen      2023-03-16  376  	unsigned int fe_rate = params_rate(params);
279e52d6b9f366 Kai Vehmanen      2023-03-16  377  	bool fe_be_rate_match = false;
279e52d6b9f366 Kai Vehmanen      2023-03-16  378  	bool single_be_rate = true;
279e52d6b9f366 Kai Vehmanen      2023-03-16  379  	unsigned int be_rate;
279e52d6b9f366 Kai Vehmanen      2023-03-16  380  	int i;
279e52d6b9f366 Kai Vehmanen      2023-03-16  381  
279e52d6b9f366 Kai Vehmanen      2023-03-16  382  	/*
279e52d6b9f366 Kai Vehmanen      2023-03-16  383  	 * Copier does not change sampling rate, so we
279e52d6b9f366 Kai Vehmanen      2023-03-16  384  	 * need to only consider the input pin information.
279e52d6b9f366 Kai Vehmanen      2023-03-16  385  	 */
279e52d6b9f366 Kai Vehmanen      2023-03-16  386  	for (i = 0; i < num_input_formats; i++) {
279e52d6b9f366 Kai Vehmanen      2023-03-16  387  		unsigned int val = pin_fmts[i].audio_fmt.sampling_frequency;
279e52d6b9f366 Kai Vehmanen      2023-03-16  388  
279e52d6b9f366 Kai Vehmanen      2023-03-16  389  		if (i == 0)
279e52d6b9f366 Kai Vehmanen      2023-03-16  390  			be_rate = val;
279e52d6b9f366 Kai Vehmanen      2023-03-16 @391  		else if (val != be_rate)
279e52d6b9f366 Kai Vehmanen      2023-03-16  392  			single_be_rate = false;
279e52d6b9f366 Kai Vehmanen      2023-03-16  393  
279e52d6b9f366 Kai Vehmanen      2023-03-16  394  		if (val == fe_rate) {
279e52d6b9f366 Kai Vehmanen      2023-03-16  395  			fe_be_rate_match = true;
279e52d6b9f366 Kai Vehmanen      2023-03-16  396  			break;
279e52d6b9f366 Kai Vehmanen      2023-03-16  397  		}
279e52d6b9f366 Kai Vehmanen      2023-03-16  398  	}
279e52d6b9f366 Kai Vehmanen      2023-03-16  399  
279e52d6b9f366 Kai Vehmanen      2023-03-16  400  	/*
279e52d6b9f366 Kai Vehmanen      2023-03-16  401  	 * If rate is different than FE rate, topology must
279e52d6b9f366 Kai Vehmanen      2023-03-16  402  	 * contain an SRC. But we do require topology to
279e52d6b9f366 Kai Vehmanen      2023-03-16  403  	 * define a single rate in the DAI copier config in
279e52d6b9f366 Kai Vehmanen      2023-03-16  404  	 * this case (FE rate may be variable).
279e52d6b9f366 Kai Vehmanen      2023-03-16  405  	 */
279e52d6b9f366 Kai Vehmanen      2023-03-16  406  	if (!fe_be_rate_match) {
279e52d6b9f366 Kai Vehmanen      2023-03-16  407  		if (!single_be_rate) {
279e52d6b9f366 Kai Vehmanen      2023-03-16  408  			dev_err(sdev->dev, "Unable to select sampling rate for DAI link\n");
279e52d6b9f366 Kai Vehmanen      2023-03-16  409  			return -EINVAL;
279e52d6b9f366 Kai Vehmanen      2023-03-16  410  		}
279e52d6b9f366 Kai Vehmanen      2023-03-16  411  
279e52d6b9f366 Kai Vehmanen      2023-03-16  412  		rate->min = be_rate;
279e52d6b9f366 Kai Vehmanen      2023-03-16  413  		rate->max = rate->min;
279e52d6b9f366 Kai Vehmanen      2023-03-16  414  	}
279e52d6b9f366 Kai Vehmanen      2023-03-16  415  
279e52d6b9f366 Kai Vehmanen      2023-03-16  416  	return 0;
279e52d6b9f366 Kai Vehmanen      2023-03-16  417  }
279e52d6b9f366 Kai Vehmanen      2023-03-16  418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
