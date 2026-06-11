Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350873BADA3
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168382; cv=none; b=VeDJDn53xDLNCsZD88LPlonJausu5BKpgg1BkrB9dJbCBUuBxlK/syjuApiEnYWxBmckt4oIUJcxv7fEBZubtZrLocxw6PEPLs2EWNp5FkP9AGTeq5oGF+EG9iiUIrjOOC76C0glBXJY5CDukRjV4HmSmBQn9Awg7i+LBqosN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168382; c=relaxed/simple;
	bh=cHrz6KlylyuFAl82M13vvis6CYxh3qzeubDsW+c/H5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCZ2hPr02VjK5SAK2lvAmPZs3tINN1LfQBZfE2wmuy2ZboIQDcfptvUzFt9tTH4b/A3ZD4b2gM9VCwRKr55mygArnR7h1/w9ceUe3dCMbaq27AA3VRlmasg1M085nttad5FkNayjoHlh+eQX9N1uUW3viGADbeJq1XNsMQhUvEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKAobT5C; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKAobT5C"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-91563382bcfso888912685a.0
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168380; x=1781773180; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dei+lBmlwzMTgM2g9gNjHfDH2og1qkxPP4WBdGUjVY8=;
        b=GKAobT5ClbN0EOEkeOEx2JBwhHSSQ+5tzSNqfiM9FACpXlMdEh1/SWPqxfJDZ4Zg3Y
         qmHe/ND2IaE8L/dCrqUztpksZivRJnmbb8vrVAE0R2V1i5YC1O7zNy+mNEnZS919xBHT
         8IBn3MF3ik4ms3K621zynXzt3nk3zRhT0Hv5PlOAr5dEZqliXFpXcNhD4pnD8WD3Y/8W
         rvzVg7PTC6PD4rO+FUY2KkRJ0dOW2Os+T0rQaBUcdWtLwH5cMHiQsPPhPaj8ojgPh6wj
         e/uOyVu/FXCuXCEix88vyNhNOmOWs0bN5SWUX4lAXvSJCvowbw1F4rEQBnksNTqJAwS/
         iagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168380; x=1781773180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dei+lBmlwzMTgM2g9gNjHfDH2og1qkxPP4WBdGUjVY8=;
        b=fvfVaJs7/bvUrQUmOu5dk19uXmVCu+mdy1ech24Py1wKiSxOdUkPK+JXiJeLCYkvwj
         AJr1nSPp7/S67iIQ3z9dGaZtTBS1xGm2QbiW3WVgsPKPaVSZ/rwRMH/xztk8oM7D+7s9
         EVE1spsQwW5zHE4QgH5lOWPKnyC3ou9y+ytDk+dPVsN+jY8xICjVMknV1fX5p45VoCpK
         UECJMtEGuKoUIFGVPNrITvbUx5aefCgy4fUy8KT2bRGJA2pKY9ErNk/LjPFtx13sei2a
         UURRH0gMUHn6xhxrvlXjhtFw4Cwb+q/1Ft55NcMAgXlBNYY8zsPEdzMwoVF1oPQgqBiS
         HJMQ==
X-Gm-Message-State: AOJu0Yztur1XDMiWR/vJ26BCNUFKmAWjVYWrH5aEn1zRc6IdiGfyB3wB
	7NGhdgXxBqEcN9MrlF6PtqHg1cQTLCs0NQLP0FlfiutqbrOG0iFSJtdsj203z1c8
X-Gm-Gg: Acq92OH1h1GipwtdJ8Z8jnD+/ATtfKHHl/BaqwqR3pjz1bmbAyoxhQ049WGRfH6OHRe
	DfsfylsO3hLA8koFcfKr0PNFN+oT5CcART6w8ZffJBjqDjQ8AIhCoLONjoLgJP0OQuV1necp6Gg
	KH8VODt1ZGDqF8Njs0CMZoxUayRWqB2Cr5uQT7yb+qorTVGcOwjWhOQzy1WdD2U3FfzHCYirjHu
	SB3Pasl7xqcUe6/zugQfyKOJJGWzCGAC/z1nFyOv+t4bNEWGXAjIHBSNvq1aiPwYxYy2CdROhzo
	NLnP4Qr9XRY8FlzZXbS97PT/nIu0m7tQNnm+zFZhIXDySdUDtnnViiltu9s7gvQnC5YdeppgBVR
	NiXdOe4WH/6Flg0OdiMtFfLHK7b+PN9uHoMST6EQ/k3UmbljTBBwI7zNQFuzJvRxXU4TTp3b5LP
	NO8Cc0flNBl9jxAbiNHcE33xAO7lY=
X-Received: by 2002:a05:620a:2786:b0:915:cda5:27ff with SMTP id af79cd13be357-9160b05d827mr247845585a.45.1781168380090;
        Thu, 11 Jun 2026 01:59:40 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160ac83b0fsm137295085a.7.2026.06.11.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:59:39 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:20:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 7077/13002] sound/soc/sof/ipc4-topology.c:1101
 sof_ipc4_widget_setup_comp_src() warn: missing error code 'ret'
Message-ID: <202606111431.Uky3T0tF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260611072030.kVZSX0t1LqaUDQhRv4O9DO7AOO1sqf96CRXeyqDUkOk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 21a5adffad463344e9aca6ee697f45a079cb3ef5 [7077/13002] ASoC: SOF: ipc4-topology: Validate the number of in/out formats for src/asrc
config: i386-randconfig-r073-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111431.Uky3T0tF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606111431.Uky3T0tF-lkp@intel.com/

smatch warnings:
sound/soc/sof/ipc4-topology.c:1101 sof_ipc4_widget_setup_comp_src() warn: missing error code 'ret'
sound/soc/sof/ipc4-topology.c:1153 sof_ipc4_widget_setup_comp_asrc() warn: missing error code 'ret'

vim +/ret +1101 sound/soc/sof/ipc4-topology.c

b85f4fc40d56f69 Rander Wang       2022-07-15  1075  static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
b85f4fc40d56f69 Rander Wang       2022-07-15  1076  {
b85f4fc40d56f69 Rander Wang       2022-07-15  1077  	struct snd_soc_component *scomp = swidget->scomp;
0376b995bb7a65f Ranjani Sridharan 2023-11-24  1078  	struct snd_sof_pipeline *spipe = swidget->spipe;
b85f4fc40d56f69 Rander Wang       2022-07-15  1079  	struct sof_ipc4_src *src;
b85f4fc40d56f69 Rander Wang       2022-07-15  1080  	int ret;
b85f4fc40d56f69 Rander Wang       2022-07-15  1081  
b85f4fc40d56f69 Rander Wang       2022-07-15  1082  	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
b85f4fc40d56f69 Rander Wang       2022-07-15  1083  
bf4afc53b77aeaa Linus Torvalds    2026-02-21  1084  	src = kzalloc_obj(*src);
b85f4fc40d56f69 Rander Wang       2022-07-15  1085  	if (!src)
b85f4fc40d56f69 Rander Wang       2022-07-15  1086  		return -ENOMEM;
b85f4fc40d56f69 Rander Wang       2022-07-15  1087  
b85f4fc40d56f69 Rander Wang       2022-07-15  1088  	swidget->private = src;
b85f4fc40d56f69 Rander Wang       2022-07-15  1089  
c447636970e3409 Peter Ujfalusi    2023-11-29  1090  	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt,
c447636970e3409 Peter Ujfalusi    2023-11-29  1091  				     &src->data.base_config);
b85f4fc40d56f69 Rander Wang       2022-07-15  1092  	if (ret)
b85f4fc40d56f69 Rander Wang       2022-07-15  1093  		goto err;
b85f4fc40d56f69 Rander Wang       2022-07-15  1094  
21a5adffad46334 Peter Ujfalusi    2026-05-26  1095  	if (!src->available_fmt.num_input_formats ||
21a5adffad46334 Peter Ujfalusi    2026-05-26  1096  	    !src->available_fmt.num_output_formats) {
21a5adffad46334 Peter Ujfalusi    2026-05-26  1097  		dev_err(scomp->dev,
21a5adffad46334 Peter Ujfalusi    2026-05-26  1098  			"Invalid number of formats: input: %d, output: %d\n",
21a5adffad46334 Peter Ujfalusi    2026-05-26  1099  			src->available_fmt.num_input_formats,
21a5adffad46334 Peter Ujfalusi    2026-05-26  1100  			src->available_fmt.num_output_formats);
21a5adffad46334 Peter Ujfalusi    2026-05-26 @1101  		goto err;

ret = -EINVAL?

21a5adffad46334 Peter Ujfalusi    2026-05-26  1102  	}
21a5adffad46334 Peter Ujfalusi    2026-05-26  1103  
c447636970e3409 Peter Ujfalusi    2023-11-29  1104  	ret = sof_update_ipc_object(scomp, &src->data, SOF_SRC_TOKENS, swidget->tuples,
ecdb10df7e0d83b Yang Yingliang    2022-08-18  1105  				    swidget->num_tuples, sizeof(*src), 1);
b85f4fc40d56f69 Rander Wang       2022-07-15  1106  	if (ret) {
b85f4fc40d56f69 Rander Wang       2022-07-15  1107  		dev_err(scomp->dev, "Parsing SRC tokens failed\n");
b85f4fc40d56f69 Rander Wang       2022-07-15  1108  		goto err;
b85f4fc40d56f69 Rander Wang       2022-07-15  1109  	}
b85f4fc40d56f69 Rander Wang       2022-07-15  1110  
0376b995bb7a65f Ranjani Sridharan 2023-11-24  1111  	spipe->core_mask |= BIT(swidget->core);
0376b995bb7a65f Ranjani Sridharan 2023-11-24  1112  
c447636970e3409 Peter Ujfalusi    2023-11-29  1113  	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->data.sink_rate);
b85f4fc40d56f69 Rander Wang       2022-07-15  1114  
b85f4fc40d56f69 Rander Wang       2022-07-15  1115  	ret = sof_ipc4_widget_setup_msg(swidget, &src->msg);
b85f4fc40d56f69 Rander Wang       2022-07-15  1116  	if (ret)
b85f4fc40d56f69 Rander Wang       2022-07-15  1117  		goto err;
b85f4fc40d56f69 Rander Wang       2022-07-15  1118  
b85f4fc40d56f69 Rander Wang       2022-07-15  1119  	return 0;
b85f4fc40d56f69 Rander Wang       2022-07-15  1120  err:
b85f4fc40d56f69 Rander Wang       2022-07-15  1121  	sof_ipc4_free_audio_fmt(&src->available_fmt);
b85f4fc40d56f69 Rander Wang       2022-07-15  1122  	kfree(src);
b85f4fc40d56f69 Rander Wang       2022-07-15  1123  	swidget->private = NULL;
b85f4fc40d56f69 Rander Wang       2022-07-15  1124  	return ret;
b85f4fc40d56f69 Rander Wang       2022-07-15  1125  }
b85f4fc40d56f69 Rander Wang       2022-07-15  1126  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1127  static int sof_ipc4_widget_setup_comp_asrc(struct snd_sof_widget *swidget)
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1128  {
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1129  	struct snd_soc_component *scomp = swidget->scomp;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1130  	struct snd_sof_pipeline *spipe = swidget->spipe;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1131  	struct sof_ipc4_asrc *asrc;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1132  	int ret;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1133  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1134  	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1135  
bf4afc53b77aeaa Linus Torvalds    2026-02-21  1136  	asrc = kzalloc_obj(*asrc);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1137  	if (!asrc)
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1138  		return -ENOMEM;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1139  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1140  	swidget->private = asrc;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1141  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1142  	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &asrc->available_fmt,
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1143  				     &asrc->data.base_config);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1144  	if (ret)
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1145  		goto err;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1146  
21a5adffad46334 Peter Ujfalusi    2026-05-26  1147  	if (!asrc->available_fmt.num_input_formats ||
21a5adffad46334 Peter Ujfalusi    2026-05-26  1148  	    !asrc->available_fmt.num_output_formats) {
21a5adffad46334 Peter Ujfalusi    2026-05-26  1149  		dev_err(scomp->dev,
21a5adffad46334 Peter Ujfalusi    2026-05-26  1150  			"Invalid number of formats: input: %d, output: %d\n",
21a5adffad46334 Peter Ujfalusi    2026-05-26  1151  			asrc->available_fmt.num_input_formats,
21a5adffad46334 Peter Ujfalusi    2026-05-26  1152  			asrc->available_fmt.num_output_formats);
21a5adffad46334 Peter Ujfalusi    2026-05-26 @1153  		goto err;

ret = -EINVAL?

21a5adffad46334 Peter Ujfalusi    2026-05-26  1154  	}
21a5adffad46334 Peter Ujfalusi    2026-05-26  1155  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1156  	ret = sof_update_ipc_object(scomp, &asrc->data, SOF_ASRC_TOKENS, swidget->tuples,
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1157  				    swidget->num_tuples, sizeof(*asrc), 1);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1158  	if (ret) {
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1159  		dev_err(scomp->dev, "Parsing ASRC tokens failed\n");
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1160  		goto err;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1161  	}
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1162  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1163  	spipe->core_mask |= BIT(swidget->core);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1164  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1165  	dev_dbg(scomp->dev, "ASRC sink rate %d, mode 0x%08x\n",
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1166  		asrc->data.out_freq, asrc->data.asrc_mode);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1167  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1168  	ret = sof_ipc4_widget_setup_msg(swidget, &asrc->msg);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1169  	if (ret)
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1170  		goto err;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1171  
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1172  	return 0;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1173  err:
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1174  	sof_ipc4_free_audio_fmt(&asrc->available_fmt);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1175  	kfree(asrc);
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1176  	swidget->private = NULL;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1177  	return ret;
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1178  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

