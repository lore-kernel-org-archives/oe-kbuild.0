Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72B2F21;
	Wed, 22 Mar 2023 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679492881; x=1711028881;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rtHti+HJgBuziIJpJlCB2t+dixJkOzcqveDwgbD+lzI=;
  b=TVtv/kQ/CDLn/4DNmYLa3lxTwsUqSZl9nSON9jCvfjpMXF6z+4XA8Px9
   OOya3P2PvJbNjSLCRY4Hn36xPE94jE463H8wbCwS751ia3fUeUpn2L5FP
   Ufw9qmPhbm3Vxg3RVAVPdhRY4hjjuA152K+R8tPBYpAGIfumpSYbj5jiX
   L8/s1qCZ6wOKNrj5hC/0MsriEz2VQAcG6z7bG0YyzpOtLO1BT3lT9pQX/
   h8O+H/SbAF0f2BsPFq1vKBWtR+eCbhD3kEb5FCUSv+0gW0eYYKxLbk/n9
   bCEKBiKzqo0u98c9YzLE/ERe0iLNCIJEnRmQVGzX24PhG82yvpAeNm97M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404097243"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="404097243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 06:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684314064"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="684314064"
Received: from cmelen-mobl1.ger.corp.intel.com (HELO [10.251.222.142]) ([10.251.222.142])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 06:47:59 -0700
Message-ID: <43ec11a2-e493-6b85-12d8-e0c7c1037afc@linux.intel.com>
Date: Wed, 22 Mar 2023 15:48:30 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [broonie-sound:for-6.4 258/267]
 sound/soc/sof/ipc4-topology.c:2176 sof_ipc4_widget_free() warn: inconsistent
 returns '&ipc4_data->pipeline_state_mutex'.
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 Jyri Sarha <jyri.sarha@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, Rander Wang <rander.wang@intel.com>
References: <add84b7e-98c7-401e-8778-424338e9fe2c@kili.mountain>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <add84b7e-98c7-401e-8778-424338e9fe2c@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/03/2023 15:18, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.4
> head:   e3057eb574bae296665f7dfdb1692acc101b3727
> commit: ca5ce0caa67fa9eeecaa29d895c2e4c3151c159e [258/267] ASoC: SOF: ipc4/intel: Add support for chained DMA
> config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230322/202303222050.dCw0fPCW-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303222050.dCw0fPCW-lkp@intel.com/
> 
> New smatch warnings:
> sound/soc/sof/ipc4-topology.c:2176 sof_ipc4_widget_free() warn: inconsistent returns '&ipc4_data->pipeline_state_mutex'.
> 
> vim +2176 sound/soc/sof/ipc4-topology.c
> 
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2134  static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2135  {
> 711d0427c7134c Bard Liao         2022-07-15  2136  	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
> 6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2137  	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2138  	int ret = 0;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2139  
> 6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2140  	mutex_lock(&ipc4_data->pipeline_state_mutex);
> 6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2141  
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2142  	/* freeing a pipeline frees all the widgets associated with it */
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2143  	if (swidget->id == snd_soc_dapm_scheduler) {
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2144  		struct sof_ipc4_pipeline *pipeline = swidget->private;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2145  		struct sof_ipc4_msg msg = {{ 0 }};
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2146  		u32 header;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2147  
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2148  		if (pipeline->use_chain_dma)
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2149  			return 0;
> 
> mutex_unlock(&ipc4_data->pipeline_state_mutex);

wow, how did this worked? We have ChainDMA tested for months now...

> 
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2150  
> a2ba1f70b301b3 Bard Liao         2022-11-08  2151  		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2152  		header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_DELETE_PIPELINE);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2153  		header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2154  		header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2155  
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2156  		msg.primary = header;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2157  
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2158  		ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2159  		if (ret < 0)
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2160  			dev_err(sdev->dev, "failed to free pipeline widget %s\n",
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2161  				swidget->widget->name);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2162  
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2163  		pipeline->mem_usage = 0;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2164  		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
> a2ba1f70b301b3 Bard Liao         2022-11-08  2165  		ida_free(&pipeline_ida, swidget->instance_id);
> 711d0427c7134c Bard Liao         2022-07-15  2166  	} else {
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2167  		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2168  		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2169  
> ca5ce0caa67fa9 Jyri Sarha        2023-03-21  2170  		if (!pipeline->use_chain_dma)
> 711d0427c7134c Bard Liao         2022-07-15  2171  			ida_free(&fw_module->m_ida, swidget->instance_id);
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2172  	}
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2173  
> 6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2174  	mutex_unlock(&ipc4_data->pipeline_state_mutex);
> 6bc4d1b714aafc Ranjani Sridharan 2023-01-27  2175  
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08 @2176  	return ret;
> 6e9257a13c75b2 Ranjani Sridharan 2022-06-08  2177  }
> 

-- 
Péter
