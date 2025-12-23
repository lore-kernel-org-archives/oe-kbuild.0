Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE984039
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766502085; cv=none; b=TL/BoDEcIuflhmyyZyPofoIiFQOb8MU4ymxUBs59cxMrVVqbu4DMZI1w51yBMtr3cd3NXXUwwW7r8q7oMZ51AvBPT0v+EWp8OZbBlPr77/MDa7lrn2vtfy8zhxbnEeo08bSV66OzjL3+a1UYcI5VcWE5xZKm+zE04UAo1UzKsG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766502085; c=relaxed/simple;
	bh=VSSZsT2EMx3KrHoMlpwaMs6a6yJGhFPU0yD11ZGTTFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lgnB2ywK3ZwmWJSxN7dkTzz7eNYCdk0CqUvwmis0G58z0GmWkVpIMWR0cZHQ+PqcQ3pAWOltKgT3MxrKWUSlLCAxJIWBamK4fQjcjakkqiXAIL+C0aQat1qs7dnz3GNN6zL7MVCN2Hp3Kl1xnNAx8ZXSHhBt5D7Kl6B7TkwXJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ2svFKU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ2svFKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766502083; x=1798038083;
  h=date:from:to:cc:subject:message-id;
  bh=VSSZsT2EMx3KrHoMlpwaMs6a6yJGhFPU0yD11ZGTTFY=;
  b=QQ2svFKUDsP90EHZCC2o8vT2gpdT+xfqs6TqFMbw6BnaWa09gNMWFC/m
   2ROSO2QhCoSsoXMQYD9DHPatb2vPivwj6JLl11B1KvKhw2IROM8sjM1yK
   iZgYCu/2VnTmvqFZUGpL0Cer90q4R6XjdC6zpDRBnabmLYMnzjos7wphW
   E76v2Gg0Pdd+lEdIRG70QFw9Dq8mx3eewdsvlIuHBDeLnIrxupDUkM3JS
   LVdOH+f1m+Mn0PDivt0ue2Xbpl9Emkh0ERa37Lv2AvVfH3equcEPSgFHA
   kQaVqwcSEjLakwrOzjS7NZnGiXVKXCwaG+rsc43xF2WECMSya6fipIvaR
   g==;
X-CSE-ConnectionGUID: tGoxUdVXRr6YhQ5Tb0IvyQ==
X-CSE-MsgGUID: y5uenuRfT0qkZUD3WdWzWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79069885"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79069885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:01:22 -0800
X-CSE-ConnectionGUID: 3FVqFW3wRouvOeMEWA7ljA==
X-CSE-MsgGUID: Ipm389Z7RuS1S3IUWsE07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199559860"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2025 07:01:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY3t0-0000000022V-2s0j;
	Tue, 23 Dec 2025 15:01:18 +0000
Date: Tue, 23 Dec 2025 23:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thesofproject:topic/sof-dev 7/7]
 sound/soc/sof/sof-audio.c:532 sof_prepare_widgets_in_path() error:
 uninitialized symbol 'widget_ops'.
Message-ID: <202512232221.Ub3HwrFz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   e00fe1471431b89ac2b01eb02ba235375d8ff9e0
commit: f2701eed927d5d12f42a301a90b89d4fd4f53776 [7/7] ASoC: SOF: sof-audio: Add support for loopback capture
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251223/202512232221.Ub3HwrFz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512232221.Ub3HwrFz-lkp@intel.com/

smatch warnings:
sound/soc/sof/sof-audio.c:532 sof_prepare_widgets_in_path() error: uninitialized symbol 'widget_ops'.

vim +/widget_ops +532 sound/soc/sof/sof-audio.c

66344c6d92113e Ranjani Sridharan 2022-04-26  476  
66344c6d92113e Ranjani Sridharan 2022-04-26  477  static int
66344c6d92113e Ranjani Sridharan 2022-04-26  478  sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
66344c6d92113e Ranjani Sridharan 2022-04-26  479  			    struct snd_pcm_hw_params *fe_params,
66344c6d92113e Ranjani Sridharan 2022-04-26  480  			    struct snd_sof_platform_stream_params *platform_params,
4639029b046bca Ranjani Sridharan 2023-01-27  481  			    struct snd_pcm_hw_params *pipeline_params, int dir,
4639029b046bca Ranjani Sridharan 2023-01-27  482  			    struct snd_soc_dapm_widget_list *list)
66344c6d92113e Ranjani Sridharan 2022-04-26  483  {
cd6afb060c5a3c Peter Ujfalusi    2022-12-21  484  	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
66344c6d92113e Ranjani Sridharan 2022-04-26  485  	struct snd_sof_widget *swidget = widget->dobj.private;
cd6afb060c5a3c Peter Ujfalusi    2022-12-21  486  	const struct sof_ipc_tplg_widget_ops *widget_ops;
66344c6d92113e Ranjani Sridharan 2022-04-26  487  	struct snd_soc_dapm_path *p;
66344c6d92113e Ranjani Sridharan 2022-04-26  488  	int ret;
66344c6d92113e Ranjani Sridharan 2022-04-26  489  
0557864e9dbe8f Bard Liao         2023-06-16  490  	if (is_virtual_widget(sdev, widget, __func__))
0557864e9dbe8f Bard Liao         2023-06-16  491  		return 0;
0557864e9dbe8f Bard Liao         2023-06-16  492  
f2701eed927d5d Ranjani Sridharan 2025-12-01  493  	if (!swidget)
f2701eed927d5d Ranjani Sridharan 2025-12-01  494  		goto sink_prepare;
f2701eed927d5d Ranjani Sridharan 2025-12-01  495  
cd6afb060c5a3c Peter Ujfalusi    2022-12-21  496  	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
cd6afb060c5a3c Peter Ujfalusi    2022-12-21  497  	if (!widget_ops)
cd6afb060c5a3c Peter Ujfalusi    2022-12-21  498  		return 0;
cd6afb060c5a3c Peter Ujfalusi    2022-12-21  499  
f2701eed927d5d Ranjani Sridharan 2025-12-01  500  	if (swidget->spipe->direction_valid && !sof_widget_in_same_direction(swidget, dir))
f2701eed927d5d Ranjani Sridharan 2025-12-01  501  		return 0;
66344c6d92113e Ranjani Sridharan 2022-04-26  502  
f2701eed927d5d Ranjani Sridharan 2025-12-01  503  	/* skip widgets already prepared or aggregated DAI widgets*/
f2701eed927d5d Ranjani Sridharan 2025-12-01  504  	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared ||
f2701eed927d5d Ranjani Sridharan 2025-12-01  505  	    is_aggregated_dai(swidget))
26671eafb390aa Ranjani Sridharan 2025-12-01  506  		goto sink_prepare;
26671eafb390aa Ranjani Sridharan 2025-12-01  507  
66344c6d92113e Ranjani Sridharan 2022-04-26  508  	/* prepare the source widget */
66344c6d92113e Ranjani Sridharan 2022-04-26  509  	ret = widget_ops[widget->id].ipc_prepare(swidget, fe_params, platform_params,
66344c6d92113e Ranjani Sridharan 2022-04-26  510  					     pipeline_params, dir);
66344c6d92113e Ranjani Sridharan 2022-04-26  511  	if (ret < 0) {
66344c6d92113e Ranjani Sridharan 2022-04-26  512  		dev_err(sdev->dev, "failed to prepare widget %s\n", widget->name);
66344c6d92113e Ranjani Sridharan 2022-04-26  513  		return ret;
66344c6d92113e Ranjani Sridharan 2022-04-26  514  	}
66344c6d92113e Ranjani Sridharan 2022-04-26  515  
66344c6d92113e Ranjani Sridharan 2022-04-26  516  	swidget->prepared = true;
66344c6d92113e Ranjani Sridharan 2022-04-26  517  
66344c6d92113e Ranjani Sridharan 2022-04-26  518  sink_prepare:
66344c6d92113e Ranjani Sridharan 2022-04-26  519  	/* prepare all widgets in the sink paths */
66344c6d92113e Ranjani Sridharan 2022-04-26  520  	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
4639029b046bca Ranjani Sridharan 2023-01-27  521  		if (!widget_in_list(list, p->sink))
4639029b046bca Ranjani Sridharan 2023-01-27  522  			continue;
f2701eed927d5d Ranjani Sridharan 2025-12-01  523  
66344c6d92113e Ranjani Sridharan 2022-04-26  524  		if (!p->walking && p->sink->dobj.private) {
66344c6d92113e Ranjani Sridharan 2022-04-26  525  			p->walking = true;
66344c6d92113e Ranjani Sridharan 2022-04-26  526  			ret = sof_prepare_widgets_in_path(sdev, p->sink,  fe_params,
4639029b046bca Ranjani Sridharan 2023-01-27  527  							  platform_params, pipeline_params, dir,
4639029b046bca Ranjani Sridharan 2023-01-27  528  							  list);
66344c6d92113e Ranjani Sridharan 2022-04-26  529  			p->walking = false;
66344c6d92113e Ranjani Sridharan 2022-04-26  530  			if (ret < 0) {
66344c6d92113e Ranjani Sridharan 2022-04-26  531  				/* unprepare the source widget */
fb4293600cc651 Peter Ujfalusi    2023-01-20 @532  				if (widget_ops[widget->id].ipc_unprepare &&
eabc34a6a6f178 Peter Ujfalusi    2024-05-27  533  				    swidget && swidget->prepared && swidget->use_count == 0) {
66344c6d92113e Ranjani Sridharan 2022-04-26  534  					widget_ops[widget->id].ipc_unprepare(swidget);
66344c6d92113e Ranjani Sridharan 2022-04-26  535  					swidget->prepared = false;
66344c6d92113e Ranjani Sridharan 2022-04-26  536  				}
66344c6d92113e Ranjani Sridharan 2022-04-26  537  				return ret;
66344c6d92113e Ranjani Sridharan 2022-04-26  538  			}
66344c6d92113e Ranjani Sridharan 2022-04-26  539  		}
66344c6d92113e Ranjani Sridharan 2022-04-26  540  	}
66344c6d92113e Ranjani Sridharan 2022-04-26  541  
66344c6d92113e Ranjani Sridharan 2022-04-26  542  	return 0;
66344c6d92113e Ranjani Sridharan 2022-04-26  543  }
66344c6d92113e Ranjani Sridharan 2022-04-26  544  

:::::: The code at line 532 was first introduced by commit
:::::: fb4293600cc651cfe4d48ec489f1d175adf6e2f8 ASoC: SOF: sof-audio: prepare_widgets: Check swidget for NULL on sink failure

:::::: TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
