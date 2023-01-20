Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190917E6;
	Fri, 20 Jan 2023 09:57:54 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q10so4369108wrs.2;
        Fri, 20 Jan 2023 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DBEBeRvdSKbe+o+qYl+b8CSc6/SIHPSVX9tdSemlLY=;
        b=Q7bKtcsnSZTD1fDv5/N4gbyNDP7pQOgjX7TKGq7oj28sB0Ukni5IXNwGj69pYoz1mO
         fX2ymC1sR5HkWwlik1Om40Jjrgh5AiU/aXBAt/Hj7XV/hpNNFyAUcF0GtcZivOS/oQ3i
         vhXRwSp46neqgiolQmSASTb7wiQ1CQ3c/1e/zLmZT5t+bMf0A5gUk49tbSoa9Y5MnhTl
         j6/mzREsQmvnmlyS7drCy4qHu4TOw5BUMSKhBc8So/gQBTCzh/EYWl2PoeB71nnVmFeu
         0DGjCEv2INSJz1RIT/EZqDFG8QaQr/TaC/QB+WOjEW8Z0P1oPRwbeUuOLPO57Vj6vGob
         BPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DBEBeRvdSKbe+o+qYl+b8CSc6/SIHPSVX9tdSemlLY=;
        b=AbBKBQaelRLwcSj/T5Hy5NunjV6o60NW5PGolGpEOcD4wP4EynYJ9CRXDlL4GgCfT9
         +FD2ZtZ15BnbYODPVuJu6JQh8++gM+YLU8X1lbWQw4s8C8eM9Rk4VHY/BB34waGT9rMN
         6Yy9QP1Tx/1x7cXwk9Dr3ahyE/8gX87C+5kaNQfRWLMO3DGC5PohxIqZLAWdFhdTN06g
         tOiYhAElIPehcs6uji/rtjYtEfFuLg5IBYCq7olVjLnUsUxmhMlzelNwEiVqR4O5iEzo
         B3f5g/3dE7B+uGLwvHD3G6TIo6IUlBhuRY0U9vvQv8BohZXDD7utjjVf9BkKDVoc9i9q
         lqFA==
X-Gm-Message-State: AFqh2kpOcicnkOpbAk4o7jR0k/tYstG4d6E5BejRdOILeZ+tPtKwKjWV
	ZHS5Fgs1WWJqh4COCNFfHh0hGOEvUMppJQ==
X-Google-Smtp-Source: AMrXdXvoJYiDwaQcIESfi+0EhMHMrpWpwgzHvibXtLrikSgPgxdrXOye1AIzJs9e7UrUhlpqgq3xOA==
X-Received: by 2002:a5d:4cc6:0:b0:269:65c0:79fd with SMTP id c6-20020a5d4cc6000000b0026965c079fdmr11380546wrt.53.1674208672786;
        Fri, 20 Jan 2023 01:57:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w5-20020adfcd05000000b002bdc914a139sm26986440wrm.108.2023.01.20.01.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:57:52 -0800 (PST)
Date: Fri, 20 Jan 2023 12:57:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 5407/6912] sound/soc/sof/sof-audio.c:329
 sof_prepare_widgets_in_path() error: we previously assumed 'swidget' could
 be null (see line 306)
Message-ID: <202301201736.O3WvrMfz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20230120095744.annzh5x7v2arKmUg8XvGFzIBD8vMqHZm1iMwmQ4FAA8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 0ad84b11f2f8dd19d62d0b2ffd95ece897e6c3dc [5407/6912] ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
config: csky-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201736.O3WvrMfz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
sound/soc/sof/sof-audio.c:329 sof_prepare_widgets_in_path() error: we previously assumed 'swidget' could be null (see line 306)

vim +/swidget +329 sound/soc/sof/sof-audio.c

66344c6d92113e Ranjani Sridharan  2022-04-26  294  static int
66344c6d92113e Ranjani Sridharan  2022-04-26  295  sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
66344c6d92113e Ranjani Sridharan  2022-04-26  296  			    struct snd_pcm_hw_params *fe_params,
66344c6d92113e Ranjani Sridharan  2022-04-26  297  			    struct snd_sof_platform_stream_params *platform_params,
66344c6d92113e Ranjani Sridharan  2022-04-26  298  			    struct snd_pcm_hw_params *pipeline_params, int dir)
66344c6d92113e Ranjani Sridharan  2022-04-26  299  {
66344c6d92113e Ranjani Sridharan  2022-04-26  300  	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
66344c6d92113e Ranjani Sridharan  2022-04-26  301  	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
66344c6d92113e Ranjani Sridharan  2022-04-26  302  	struct snd_sof_widget *swidget = widget->dobj.private;
66344c6d92113e Ranjani Sridharan  2022-04-26  303  	struct snd_soc_dapm_path *p;
66344c6d92113e Ranjani Sridharan  2022-04-26  304  	int ret;
66344c6d92113e Ranjani Sridharan  2022-04-26  305  
0ad84b11f2f8dd Ranjani Sridharan  2023-01-18 @306  	if (!swidget || !widget_ops[widget->id].ipc_prepare || swidget->prepared)
                                                             ^^^^^^^
Check for NULL

66344c6d92113e Ranjani Sridharan  2022-04-26  307  		goto sink_prepare;
66344c6d92113e Ranjani Sridharan  2022-04-26  308  
66344c6d92113e Ranjani Sridharan  2022-04-26  309  	/* prepare the source widget */
66344c6d92113e Ranjani Sridharan  2022-04-26  310  	ret = widget_ops[widget->id].ipc_prepare(swidget, fe_params, platform_params,
66344c6d92113e Ranjani Sridharan  2022-04-26  311  					     pipeline_params, dir);
66344c6d92113e Ranjani Sridharan  2022-04-26  312  	if (ret < 0) {
66344c6d92113e Ranjani Sridharan  2022-04-26  313  		dev_err(sdev->dev, "failed to prepare widget %s\n", widget->name);
66344c6d92113e Ranjani Sridharan  2022-04-26  314  		return ret;
66344c6d92113e Ranjani Sridharan  2022-04-26  315  	}
66344c6d92113e Ranjani Sridharan  2022-04-26  316  
66344c6d92113e Ranjani Sridharan  2022-04-26  317  	swidget->prepared = true;
66344c6d92113e Ranjani Sridharan  2022-04-26  318  
66344c6d92113e Ranjani Sridharan  2022-04-26  319  sink_prepare:
66344c6d92113e Ranjani Sridharan  2022-04-26  320  	/* prepare all widgets in the sink paths */
66344c6d92113e Ranjani Sridharan  2022-04-26  321  	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
66344c6d92113e Ranjani Sridharan  2022-04-26  322  		if (!p->walking && p->sink->dobj.private) {
66344c6d92113e Ranjani Sridharan  2022-04-26  323  			p->walking = true;
66344c6d92113e Ranjani Sridharan  2022-04-26  324  			ret = sof_prepare_widgets_in_path(sdev, p->sink,  fe_params,
66344c6d92113e Ranjani Sridharan  2022-04-26  325  							  platform_params, pipeline_params, dir);
66344c6d92113e Ranjani Sridharan  2022-04-26  326  			p->walking = false;
66344c6d92113e Ranjani Sridharan  2022-04-26  327  			if (ret < 0) {
66344c6d92113e Ranjani Sridharan  2022-04-26  328  				/* unprepare the source widget */
2fe08216fda33b Amadeusz Sławiński 2022-06-02 @329  				if (widget_ops[widget->id].ipc_unprepare && swidget->prepared) {
                                                                                                                            ^^^^^^^^^^^^^^^^^
Unchecked dereference

66344c6d92113e Ranjani Sridharan  2022-04-26  330  					widget_ops[widget->id].ipc_unprepare(swidget);
66344c6d92113e Ranjani Sridharan  2022-04-26  331  					swidget->prepared = false;
66344c6d92113e Ranjani Sridharan  2022-04-26  332  				}
66344c6d92113e Ranjani Sridharan  2022-04-26  333  				return ret;
66344c6d92113e Ranjani Sridharan  2022-04-26  334  			}
66344c6d92113e Ranjani Sridharan  2022-04-26  335  		}
66344c6d92113e Ranjani Sridharan  2022-04-26  336  	}
66344c6d92113e Ranjani Sridharan  2022-04-26  337  
66344c6d92113e Ranjani Sridharan  2022-04-26  338  	return 0;
66344c6d92113e Ranjani Sridharan  2022-04-26  339  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

