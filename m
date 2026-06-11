Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4482EA731
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 06:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158653; cv=none; b=C9di5Yvyyfko9z6Y5lelOuFeszJ0Yidmwpn8xV6bPcYU8rRY4tiB/IR9FRuUh+xTeHAahyprPBHBpFQcky6UzOhtVs1v9lIv6HNEamB6o+njEDhqRFW/Uawo5njfwBC3NMTTzrX/nF5+uHVVwwWcJYZTsk3dEKlLpt4SzlbLev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158653; c=relaxed/simple;
	bh=TP1oexSeV09DgmLlG2//Re1KAk+IEx/6GB3N9fNDjrU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYrxu7G9LDXRKwc9F7oU7BTYDqaHtzFHnRK+RTZ8PaMj398a57Gh3I09CcyjQA+QlJ3+WSJx737xzc7K6B2NZ4C133vsnsRPyCPqfbpPIbeJzYEKYlFrl+hUFZKaIFIIdsGJT/4aDaMOrTZb7+BVYltg70hJJFQKPCP5t00ksjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOwsYKOW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOwsYKOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781158651; x=1812694651;
  h=date:from:to:cc:subject:message-id;
  bh=TP1oexSeV09DgmLlG2//Re1KAk+IEx/6GB3N9fNDjrU=;
  b=jOwsYKOW7rLklns2POqQjMz07KBdoRYtO9+kZ8JztD3sCbZ18EhMCbcC
   Hops8vYO0wyYUXJXoAVI8jrcIOwQS9rDHmH9i2QpQwwyvC5Z8E5g+KVib
   QT3uPCHq2WtCM6P2OTJHkONDGWe7NQXPso2uDT8ad13B030lHoeR6W+2d
   0TP3+2CSzC6OyDsE/yuXXG+cYj8cvi2YNEr/xpm+mgxEM597MtSDQ0MM2
   hI02rDmDZ+bAXM/DiQ7iP2PHvVBhQt5vB7kz0JTkrPR4SCyqgSJXQ5WOv
   oIxgj0A7BRw7UKY/DWOLhnvT2Dsjje4o56AU9s3MF82YgHcMOG/c/ZUij
   Q==;
X-CSE-ConnectionGUID: 7Lq7NjX8Rv+0iXoOBXvvnQ==
X-CSE-MsgGUID: 35+R/ilVRg6XJ+Djkl4xCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81944645"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81944645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:17:30 -0700
X-CSE-ConnectionGUID: YbLlow6YR06iW5FlIed3pw==
X-CSE-MsgGUID: GZShN6hJTHKoZlXI9X+ctg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="250667286"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jun 2026 23:17:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXYjG-00000000MTa-1n9g;
	Thu, 11 Jun 2026 06:17:26 +0000
Date: Thu, 11 Jun 2026 14:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7077/13002]
 sound/soc/sof/ipc4-topology.c:1101 sof_ipc4_widget_setup_comp_src() warn:
 missing error code 'ret'
Message-ID: <202606111431.Uky3T0tF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 21a5adffad463344e9aca6ee697f45a079cb3ef5 [7077/13002] ASoC: SOF: ipc4-topology: Validate the number of in/out formats for src/asrc
:::::: branch date: 14 hours ago
:::::: commit date: 2 weeks ago
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

4d4ba014ac4b377 Ranjani Sridharan 2022-06-08  1074  
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
f9c7c093797fc00 Seppo Ingalsuo    2025-06-19  1179  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
