Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4185672
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Apr 2023 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682795055; x=1714331055;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ystbE17GUu+sN3GEecz1cx3KVjVV+F4NtRQjL/+3D7U=;
  b=KrZiKp4Hc1fks7etRvmqNcUzWeE3MrDFLKBoF+K1Z/AJl+Z1q3DXKzgh
   TBYP6eZUVZjezsWmJ7KJ/SGFcMwq+04YIF8UJRtK4c2XTVM9QDbtzmpQi
   D36mhvGqfQoW8EBsQ0tVZClViguw+5CGLXFCDltN0Acvsi4zWwTEW8XDr
   GLKqg2bvue4odONHFqgy44PmIRzOxc339oKpt2ZACcdm+rGFfLIjVnePz
   cfyLVaQvL6er0IWL74ZvCkyUFw1DLEgciXtw17K9KkgECDw2Mpmed2sLd
   vfaksHpaG0vhEmeGyXeDAmOyewrHXIxQPbNUw+HLlPBi7JMP27YdOLoIp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="345422897"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="345422897"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 12:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="806888733"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="806888733"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2023 12:04:10 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pspre-0001JF-1H;
	Sat, 29 Apr 2023 19:04:10 +0000
Date: Sun, 30 Apr 2023 03:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/sof/ipc4-topology.c:1132 ipc4_copier_set_capture_fmt()
 error: uninitialized symbol 'sample_valid_bits'.
Message-ID: <202304300213.sZol6pzP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kai Vehmanen <kai.vehmanen@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89d77f71f493a3663b10fa812d17f472935d24be
commit: 279e52d6b9f366f9930a0f90ee84e7d0a6a27b26 ASoC: SOF: ipc4-pcm: support multiple configs for BE DAIs
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230430/202304300213.sZol6pzP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304300213.sZol6pzP-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-topology.c:1132 ipc4_copier_set_capture_fmt() error: uninitialized symbol 'sample_valid_bits'.
sound/soc/sof/ipc4-pcm.c:391 sof_ipc4_pcm_dai_link_fixup_rate() error: uninitialized symbol 'be_rate'.

Old smatch warnings:
sound/soc/sof/ipc4-topology.c:263 sof_ipc4_get_audio_fmt() error: uninitialized symbol 'in_format'.
sound/soc/sof/ipc4-pcm.c:412 sof_ipc4_pcm_dai_link_fixup_rate() error: uninitialized symbol 'be_rate'.

vim +/sample_valid_bits +1132 sound/soc/sof/ipc4-topology.c

279e52d6b9f366 Kai Vehmanen 2023-03-16  1090  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1091  static int ipc4_copier_set_capture_fmt(struct snd_sof_dev *sdev,
279e52d6b9f366 Kai Vehmanen 2023-03-16  1092  				       struct snd_pcm_hw_params *pipeline_params,
279e52d6b9f366 Kai Vehmanen 2023-03-16  1093  				       struct snd_pcm_hw_params *fe_params,
279e52d6b9f366 Kai Vehmanen 2023-03-16  1094  				       struct sof_ipc4_available_audio_format *available_fmt)
279e52d6b9f366 Kai Vehmanen 2023-03-16  1095  {
279e52d6b9f366 Kai Vehmanen 2023-03-16  1096  	struct sof_ipc4_audio_format *audio_fmt;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1097  	unsigned int sample_valid_bits;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1098  	bool multiple_formats = false;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1099  	bool fe_format_match = false;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1100  	struct snd_mask *fmt;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1101  	int i;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1102  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1103  	for (i = 0; i < available_fmt->num_output_formats; i++) {
279e52d6b9f366 Kai Vehmanen 2023-03-16  1104  		unsigned int val;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1105  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1106  		audio_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1107  		val = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(audio_fmt->fmt_cfg);
279e52d6b9f366 Kai Vehmanen 2023-03-16  1108  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1109  		if (i == 0)
279e52d6b9f366 Kai Vehmanen 2023-03-16  1110  			sample_valid_bits = val;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1111  		else if (sample_valid_bits != val)
279e52d6b9f366 Kai Vehmanen 2023-03-16  1112  			multiple_formats = true;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1113  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1114  		if (snd_pcm_format_width(params_format(fe_params)) == val)
279e52d6b9f366 Kai Vehmanen 2023-03-16  1115  			fe_format_match = true;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1116  	}
279e52d6b9f366 Kai Vehmanen 2023-03-16  1117  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1118  	fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
279e52d6b9f366 Kai Vehmanen 2023-03-16  1119  	snd_mask_none(fmt);
279e52d6b9f366 Kai Vehmanen 2023-03-16  1120  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1121  	if (multiple_formats) {
279e52d6b9f366 Kai Vehmanen 2023-03-16  1122  		if (fe_format_match) {
279e52d6b9f366 Kai Vehmanen 2023-03-16  1123  			/* multiple formats defined and one matches FE */
279e52d6b9f366 Kai Vehmanen 2023-03-16  1124  			snd_mask_set_format(fmt, params_format(fe_params));
279e52d6b9f366 Kai Vehmanen 2023-03-16  1125  			return 0;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1126  		}
279e52d6b9f366 Kai Vehmanen 2023-03-16  1127  
279e52d6b9f366 Kai Vehmanen 2023-03-16  1128  		dev_err(sdev->dev, "Multiple audio formats for single dai_out not supported\n");
279e52d6b9f366 Kai Vehmanen 2023-03-16  1129  		return -EINVAL;
279e52d6b9f366 Kai Vehmanen 2023-03-16  1130  	}
279e52d6b9f366 Kai Vehmanen 2023-03-16  1131  
279e52d6b9f366 Kai Vehmanen 2023-03-16 @1132  	return ipc4_set_fmt_mask(fmt, sample_valid_bits);
279e52d6b9f366 Kai Vehmanen 2023-03-16  1133  }
279e52d6b9f366 Kai Vehmanen 2023-03-16  1134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
