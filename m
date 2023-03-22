Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B2E2584
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679488185; x=1711024185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8hPhoihBqd+zJqDUsd1dMvBaRfBTst6PqfztGz+Rxk=;
  b=m+htHpjqvD605oDTDqok8L1JccicPtztWTo0l+b4uEYAn7q2f/swPc7e
   AM1mGXF6PiJ207O07nD0Dixm9tK//xLnH64f2JYKPgt9TTIpYhZx9jyh2
   xviwIIEvDDK/5JinmsOCUpNl6ySCDO5SWSbypAp1MJpuLmPkugnuzFsJG
   CQkFM1Dhozi4WRGRho9qNChWpIvhf3YbZgITlHDdZmxz4xyUtqlAm/tZl
   Guh15OoTFpn7Ad798FCBbz4Rx45hhAkEKpg/NLIzY7TunPHFaUbl+JfpM
   zQaKEBXhlBbeGG4+9AAS6/XOz9mzuoNX0sHHRXBz2WJydcE/v7/a4srC0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366935064"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="366935064"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 05:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="771021587"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="771021587"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2023 05:29:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pexaz-000DJB-05;
	Wed, 22 Mar 2023 12:29:37 +0000
Date: Wed, 22 Mar 2023 20:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-sound:for-6.4 258/267] sound/soc/sof/ipc4-topology.c:2176
 sof_ipc4_widget_free() warn: inconsistent returns
 '&ipc4_data->pipeline_state_mutex'.
Message-ID: <202303222050.dCw0fPCW-lkp@intel.com>
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
TO: Jyri Sarha <jyri.sarha@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rander Wang <rander.wang@intel.com>
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.4
head:   e3057eb574bae296665f7dfdb1692acc101b3727
commit: ca5ce0caa67fa9eeecaa29d895c2e4c3151c159e [258/267] ASoC: SOF: ipc4/intel: Add support for chained DMA
:::::: branch date: 17 hours ago
:::::: commit date: 24 hours ago
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230322/202303222050.dCw0fPCW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303222050.dCw0fPCW-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-topology.c:2176 sof_ipc4_widget_free() warn: inconsistent returns '&ipc4_data->pipeline_state_mutex'.

Old smatch warnings:
sound/soc/sof/ipc4-topology.c:1332 ipc4_copier_set_capture_fmt() error: uninitialized symbol 'sample_valid_bits'.

vim +2176 sound/soc/sof/ipc4-topology.c

6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2133  
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2134  static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2135  {
711d0427c7134c Bard Liao         2022-07-15  2136  	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2137  	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2138  	int ret = 0;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2139  
6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2140  	mutex_lock(&ipc4_data->pipeline_state_mutex);
6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2141  
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2142  	/* freeing a pipeline frees all the widgets associated with it */
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2143  	if (swidget->id == snd_soc_dapm_scheduler) {
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2144  		struct sof_ipc4_pipeline *pipeline = swidget->private;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2145  		struct sof_ipc4_msg msg = {{ 0 }};
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2146  		u32 header;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2147  
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2148  		if (pipeline->use_chain_dma)
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2149  			return 0;
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2150  
a2ba1f70b301b3 Bard Liao         2022-11-08  2151  		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2152  		header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_DELETE_PIPELINE);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2153  		header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2154  		header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2155  
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2156  		msg.primary = header;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2157  
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2158  		ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2159  		if (ret < 0)
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2160  			dev_err(sdev->dev, "failed to free pipeline widget %s\n",
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2161  				swidget->widget->name);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2162  
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2163  		pipeline->mem_usage = 0;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2164  		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
a2ba1f70b301b3 Bard Liao         2022-11-08  2165  		ida_free(&pipeline_ida, swidget->instance_id);
711d0427c7134c Bard Liao         2022-07-15  2166  	} else {
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2167  		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2168  		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2169  
ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2170  		if (!pipeline->use_chain_dma)
711d0427c7134c Bard Liao         2022-07-15  2171  			ida_free(&fw_module->m_ida, swidget->instance_id);
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2172  	}
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2173  
6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2174  	mutex_unlock(&ipc4_data->pipeline_state_mutex);
6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2175  
6e9257a13c75b2 Ranjani Sridharan 2022-06-08 @2176  	return ret;
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2177  }
6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2178  

:::::: The code at line 2176 was first introduced by commit
:::::: 6e9257a13c75b2e4fc33477f9de4912fdfae81e1 ASoC: SOF: ipc4-topology: Add widget_setup/widget_free ops

:::::: TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
