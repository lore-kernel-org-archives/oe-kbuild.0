Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E2B32ABFF
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611587; cv=none; b=ERaX9EVan5uBl6pTTc53B1qpkFpetcfS85eHPMUbuemQUghhOPKGsj2HcNjZG9Xtl+Qi+cBn2+mZ3lL2vOyM5+dp85ifHpWe9POpCgchLtSOF4ceUMiqaFclNaDgYBUsqS8H9EGt8B2EqhMIQiMBNu4SUhuF5jU/izcQRNdoe2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611587; c=relaxed/simple;
	bh=UkTj3zYyIb1IkGpag5b906Ex+NGTUbpcD7WDSDT7PIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONIfeax4jhGG8CTXEMSrRdQabFzCuiMRHhIR+uajBK7Vfm0drctknSczV6haayMnOqJG6OUOxbdYGMaPlQoNRYVenpBa+tjeDnYBOYZAAsc9VgrYYbmJmrM5iTDnY759UUlTJnasC4FymD5W1c/2jRJ5hvcPm3IRRqaSy1zbFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpOiCmR9; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpOiCmR9"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso89150535e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767611581; x=1768216381; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bc2VWgvA1bgMQCfeGEQws3KLvN7nwij3EUUsT4VbIPg=;
        b=vpOiCmR9vkhEh87lDqaftrORxfh2TythQ5NV0OFw3o5RWNpqlsC5rx+tImhxxOY5pF
         BLH8ve+n//AUP+3b5JH/SgPirg81ppWvM3jGtswMk1XORTmTs7q+PwjB8WEa9oo2jN3M
         ef3Nxw4jN1u2gkzFvzUoIXBeWus8fb1d6UsHZCGfV2Kbvmr/p8TyiCOJYRAwOPmOGsg5
         AcQDYFffkAJsumtOB7XvjSdmGGruEfhRpyVDhBZ1WwLqpI11kCMVHMqMtKT4nTMtqk4O
         5R7W/JUgEit6wHYCcUlpKspq7CTT9cdq6aGoyO5u1VJ9OXKU4dDChvh6OWGvxaB+E8yr
         H4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767611581; x=1768216381;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc2VWgvA1bgMQCfeGEQws3KLvN7nwij3EUUsT4VbIPg=;
        b=MdlA6w5Sw+DbXaIl5u4YrzvaMhckQVDNfBuFha6BNuqnRPKcPXW6auMPO+ZHwRZSVI
         RcG7CitwS7uzQ/7HL+M5jo6ZTvHgKsFCgznQVIlszgm+Vu6enlC6xfrpS+xYFplplnt+
         0aori/VLkIzCDCYb2oCn+t49QQnFrRnSbslhlotLKUQRmvoI4/YuJS/h0HF4Bz7QoTBE
         2A8Me2bnzleYtjnbDL+1JKVVUutR3BFvipcJWNiSTa9U7eKrpKAiT/ysmC3Za2UGZiRh
         e90ZY/mC0pnaQu3zovnUgLqdyNadZDsrcFVAv9YDhSGOYl8QOWon0XYg7Xm0jjVK+zh2
         pgsQ==
X-Gm-Message-State: AOJu0YzJ5/Ht6OOtNBwY5Nz52+gqvyp6oMNu8olamyezu03NHxcE5R9H
	VspOAFU9+NIonV8jfsv81JWmtet0ArwIVhKVTAoerDjEAOdOk/yiZrzxCO9MWwN33cJd0hm4Mu9
	v50O4
X-Gm-Gg: AY/fxX5jM4a5q09svny5//8C+gfC88o2I3KbFt2exI+lJWtArQ0nLw8PryGCXRh+ki9
	0RsUeUdDP+nUrT6+TbnfPbYqmCpEc+ikwRBNE7Vn+zkSKYox8TA/gEGeaWWUJYf+A97JLzMOkrU
	wZ8QCJ8NKhmS8EGx7vQ4WJd0PvJL3zzRE2F8Jm7t0h5tfFcMAOjBS+PuXiHQgOUCImcNHBOKewm
	2/eiRp7HVk2xn1b2SR0R0pRVh1VbwXF7SZTB1QuWYPUsKMidcuv4I4ErOEZbmfP7zKAaO8Spztx
	70LwyQsLBvafjR6JOc40cTbOPoSQ9891GhBuyWAZZ8duF19d1Jw5OxEUKOpKFEVivBHVlTZzJU3
	COWo5C+zfKJl14jwxiMUPv0Ct3zz8+YNbWkbBRuD5YptvXFAczKlNedNmKQg61rLGkvW/4X08zl
	gHdlN6eUjelXmO3D2k
X-Google-Smtp-Source: AGHT+IGedowhtALlbzvLbFSDz1qoZGBQdqAyRvQc3b+3FTkY8OWiI4AI6srjJhcvehHKs244vCBv4Q==
X-Received: by 2002:a05:600c:4506:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47d1957711fmr570514325e9.18.1767611580634;
        Mon, 05 Jan 2026 03:13:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm141461685e9.5.2026.01.05.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:13:00 -0800 (PST)
Date: Mon, 5 Jan 2026 14:12:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 7/7] sound/soc/sof/sof-audio.c:532
 sof_prepare_widgets_in_path() error: uninitialized symbol 'widget_ops'.
Message-ID: <202512232221.Ub3HwrFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260105111257.YmBGOQb5fv5_7K2Jkfw64bWktRyV_i8iYV23Few0W3Q@z>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   e00fe1471431b89ac2b01eb02ba235375d8ff9e0
commit: f2701eed927d5d12f42a301a90b89d4fd4f53776 [7/7] ASoC: SOF: sof-audio: Add support for loopback capture
config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251223/202512232221.Ub3HwrFz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512232221.Ub3HwrFz-lkp@intel.com/

smatch warnings:
sound/soc/sof/sof-audio.c:532 sof_prepare_widgets_in_path() error: uninitialized symbol 'widget_ops'.

vim +/widget_ops +532 sound/soc/sof/sof-audio.c

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

widget_ops isn't initialized.

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
                                                                                    ^^^^^^^^^^
Dereferenced before checking if swidget is non-NULL.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

