Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6CC28FC;
	Wed, 22 Mar 2023 13:19:00 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y4so72924688edo.2;
        Wed, 22 Mar 2023 06:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679491138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+Np4qzZPcx0JUW8amAi/85jHJvKXzgm/IqLzLmLjb4=;
        b=jaRXHQhV22ZsGTTL3vpLR/4bMMVbiqu1qGq/Juvld1ehfbOoYgMxr2djpzASHrENGV
         YHamYoY+83D7oOcA1ev+hvvErrQec2VCeUFAvxwfuL9z8KdYsXWZ1sHIcIdetvhId+2N
         XvFSi8W3IEze5ZxPucQfFNY9ApCcASRCBBapA4KhbLu8vjfb1qdBVso2/v19WaMWHvve
         gphsy0vFATkZdc03zh7TLNoowTFGhDA96JHOd5YjcFs5AuKvAePwLEfGZsea+gQx0SMc
         /2yxXiHwye8eyyQnALJhmkhFaXYxM94Xs7bMXUVRSVv1gGfQVsAj6fLeycnnlgbP87YK
         9xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679491138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+Np4qzZPcx0JUW8amAi/85jHJvKXzgm/IqLzLmLjb4=;
        b=UpcbILHvBChLwbFP13IQDRdlyqG01S4mTbE/XjmFeNvTkwMlkHiN+XVCmIiNx177vg
         ZV3T2y2ha4osJXBabUR+p3i8Ylqwv4nOGo+ko7910Iq5V7ztn4Zls/GhDKB7mLYveS2x
         DiFEi/rOutUvkbmCaIfgDMGXGjSD6MeHMqfixbxNvzngdV6N05ijJWhnPinw+KzKPocu
         3/fOLiceYhsStbd2kZNCa0RoxnTF/i1BHF0ocUOEc84TzlpzorWsvGcCR9BZfTq2nckI
         n+9ne/n7M/WOIWkZhicyAfqGC++oddYtiU97wqJ6/lVvh6Wjs4DoiicGRP7PTXQmnz8Q
         FGow==
X-Gm-Message-State: AO0yUKVdg6g0J25HvLdhsWVU6Z5fA/UUQIObPHRG5ncjuvll7fkCtVKA
	/ZQaqOlJu8l+r5I+aN6ZYznnmI668Uqinw==
X-Google-Smtp-Source: AK7set/k+KHvMlZBfbN+Hw5ZX2P9AxHUUv7pTlVWkkrShYQccljb/2pOzzOk/kM4DJwXeFaIjmiLMQ==
X-Received: by 2002:a17:907:7e8e:b0:8b1:2d7f:ed57 with SMTP id qb14-20020a1709077e8e00b008b12d7fed57mr8240988ejc.42.1679491138528;
        Wed, 22 Mar 2023 06:18:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709060e8900b0093313f4fc3csm6011220ejf.70.2023.03.22.06.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 06:18:58 -0700 (PDT)
Date: Wed, 22 Mar 2023 16:18:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jyri Sarha <jyri.sarha@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Rander Wang <rander.wang@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [broonie-sound:for-6.4 258/267] sound/soc/sof/ipc4-topology.c:2176
 sof_ipc4_widget_free() warn: inconsistent returns
 '&ipc4_data->pipeline_state_mutex'.
Message-ID: <add84b7e-98c7-401e-8778-424338e9fe2c@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.4
head:   e3057eb574bae296665f7dfdb1692acc101b3727
commit: ca5ce0caa67fa9eeecaa29d895c2e4c3151c159e [258/267] ASoC: SOF: ipc4/intel: Add support for chained DMA
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230322/202303222050.dCw0fPCW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303222050.dCw0fPCW-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-topology.c:2176 sof_ipc4_widget_free() warn: inconsistent returns '&ipc4_data->pipeline_state_mutex'.

vim +2176 sound/soc/sof/ipc4-topology.c

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

mutex_unlock(&ipc4_data->pipeline_state_mutex);

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

