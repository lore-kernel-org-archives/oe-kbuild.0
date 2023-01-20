Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2871D17D7
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674206276; x=1705742276;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zgucdIB+ruv8fJCjrtsqKitKrkpE1me+3XYQ5/rIJJI=;
  b=VN46Yx3/W8fdTAvIjBYIrzr7VRu0JVDcR+0zlokaMUSW3fBvIVQ+n2lp
   eK2xe4g1dEJtKAJ5vbXuLs7PKusesHCcb4r2Yx0INpauPeuh8gkyt73TJ
   QdBNVTpVhcuQTC1S9YJOZ3k6R9eJQw+LcVaVXpwL9KlAOmolvUDj4qZkZ
   DJC/aZ8XbJ+YhnDdyOYqu6fZORQUGMqd0eYFom0pLNn9LClcVmiFNhPmD
   C1rGZX8d1wBIG1cWjXOlSvR+8WbdyPZnDvccqKvY/4C4y8s8l/o6lqFeu
   IzTM8W5SiOGBkutMHg1ig6fGzjROVzizRS2oRTwUuccg0WDzjDJhBkdRl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324223993"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="324223993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 01:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690987627"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="690987627"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 01:17:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pInWy-0002QU-06;
	Fri, 20 Jan 2023 09:17:52 +0000
Date: Fri, 20 Jan 2023 17:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Rander Wang <rander.wang@intel.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 0ad84b11f2f8dd19d62d0b2ffd95ece897e6c3dc [5407/6912] ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: csky-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201736.O3WvrMfz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
sound/soc/sof/sof-audio.c:329 sof_prepare_widgets_in_path() error: we previously assumed 'swidget' could be null (see line 306)

vim +/swidget +329 sound/soc/sof/sof-audio.c

66344c6d92113e Ranjani Sridharan  2022-04-26  293  
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
66344c6d92113e Ranjani Sridharan  2022-04-26  340  

:::::: The code at line 329 was first introduced by commit
:::::: 2fe08216fda33bbc1f80133b8fd560ffd094b987 ASoC: SOF: Fix potential NULL pointer dereference

:::::: TO: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
