Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AEA1C69D
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 00:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736124918; cv=none; b=TT67I9qBqmSVaNkdir8R1Drdhzhc627gLfUvfjy3hhInxtRd/WT+TTrtKYjl8Kn2KXE/9/s0/ex92hRvHW9PcDxYmoQpUMUk1Zn7ja9yH5Y3VSZKJZBayI9bp5VZJuTbyztTWBug75pSkDBInO0ZoL01k4j2znnJsVzknxpDyxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736124918; c=relaxed/simple;
	bh=HDWYPg773iKea0bNvCNvXiAR88vtMscQatA9SbU2lXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFXpG7uq8S48jGHsoKOc6hXQuosuuXUaXPBahcEZ4X14bq5LRuSmIlWly+jxIaCTrkkomrdECFZeA9hMqCe2QfYYrW6QSdoJyRoJEYYAHKEMca2SpTheelKwTJuLktOElOOs637qUPfZ9iXlbEyu9qihSyIyvxPpxVxnVxT9xBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTIrNNVB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTIrNNVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736124916; x=1767660916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HDWYPg773iKea0bNvCNvXiAR88vtMscQatA9SbU2lXc=;
  b=cTIrNNVBrGqm2zScII6/Nd70wf+egERhy4EqxqSUT1wpr7T/QiLjUuXD
   RBeWMw4HXJKSUGfYdj8t1ueeBMDRF33HLOk1TCQhOk90JzU6fM/DM7BHa
   C3+g0XVNOmQUNVstLKbuuplsmw/ZLAgQm60h118+pF5BAJXQ8n9vHaqEN
   DPMcRZi1isTXyQzwoWBo028w7W7c7ns6ARBnEJSFVKq4WTIuLUhLyrzvC
   qB+vx0vvHX+j3Oigt1IzhZkpYsfdJfctxjVdwIVR9Fh1rL/nIxotO7JHi
   WO5Q5CUvempVviB75q8tKQh+nA9MDZJcNq8MQooQC0NgqLwfTM9d7CRJl
   A==;
X-CSE-ConnectionGUID: JClvnKaGSeKdQdxIKs2UTw==
X-CSE-MsgGUID: ieK2gn5GRHW/V6uExvsd6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="47621133"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="47621133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 16:55:15 -0800
X-CSE-ConnectionGUID: Fp8B200ATMOyq3VrTs5M/w==
X-CSE-MsgGUID: pGn+3ioRQfCNGwVdphULYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="102780232"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2025 16:55:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUbOi-000C6j-0R;
	Mon, 06 Jan 2025 00:55:12 +0000
Date: Mon, 6 Jan 2025 08:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/qcom/qdsp6/topology.c:336 audioreach_parse_sg_tokens()
 error: uninitialized symbol 'sg'.
Message-ID: <202501060849.zdKFIDLf-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9244696b34f2a626d7468864420ab6a47289bf10
commit: 36ad9bf1d93d66b901342eab9f8ed6c1537655a6 ASoC: qdsp6: audioreach: add topology support
date:   3 years, 2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 years, 2 months ago
config: alpha-randconfig-r072-20241228 (https://download.01.org/0day-ci/archive/20250106/202501060849.zdKFIDLf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501060849.zdKFIDLf-lkp@intel.com/

New smatch warnings:
sound/soc/qcom/qdsp6/topology.c:336 audioreach_parse_sg_tokens() error: uninitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:382 audioreach_parse_cont_tokens() error: uninitialized symbol 'cont'.

Old smatch warnings:
sound/soc/qcom/qdsp6/topology.c:339 audioreach_parse_sg_tokens() error: uninitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:342 audioreach_parse_sg_tokens() error: uninitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:355 audioreach_parse_sg_tokens() error: uninitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:357 audioreach_parse_sg_tokens() error: uninitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:385 audioreach_parse_cont_tokens() error: uninitialized symbol 'cont'.
sound/soc/qcom/qdsp6/topology.c:388 audioreach_parse_cont_tokens() error: uninitialized symbol 'cont'.
sound/soc/qcom/qdsp6/topology.c:391 audioreach_parse_cont_tokens() error: uninitialized symbol 'cont'.
sound/soc/qcom/qdsp6/topology.c:402 audioreach_parse_cont_tokens() error: uninitialized symbol 'cont'.

vim +/sg +336 sound/soc/qcom/qdsp6/topology.c

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  302  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  303  static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  304  						       struct snd_soc_tplg_private *private)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  305  {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  306  	struct snd_soc_tplg_vendor_value_elem *sg_elem;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  307  	struct snd_soc_tplg_vendor_array *sg_array;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  308  	struct audioreach_graph_info *info = NULL;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  309  	int graph_id, sub_graph_id, tkn_count = 0;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  310  	struct audioreach_sub_graph *sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  311  	bool found;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  312  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  313  	sg_array = audioreach_get_sg_array(private);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  314  	sg_elem = sg_array->value;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  315  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  316  	while (tkn_count <= (le32_to_cpu(sg_array->num_elems) - 1)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  317  		switch (le32_to_cpu(sg_elem->token)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  318  		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  319  			sub_graph_id = le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  320  			sg = audioreach_tplg_alloc_sub_graph(apm, sub_graph_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  321  			if (IS_ERR(sg)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  322  				return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  323  			} else if (found) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  324  				/* Already parsed data for this sub-graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  325  				return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  326  			}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  327  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  328  		case AR_TKN_DAI_INDEX:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  329  			/* Sub graph is associated with predefined graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  330  			graph_id = le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  331  			info = audioreach_tplg_alloc_graph_info(apm, graph_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  332  			if (IS_ERR(info))
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  333  				return ERR_CAST(info);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  334  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  335  		case AR_TKN_U32_SUB_GRAPH_PERF_MODE:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @336  			sg->perf_mode = le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  337  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  338  		case AR_TKN_U32_SUB_GRAPH_DIRECTION:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  339  			sg->direction = le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  340  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  341  		case AR_TKN_U32_SUB_GRAPH_SCENARIO_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  342  			sg->scenario_id = le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  343  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  344  		default:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  345  			dev_err(apm->dev, "Not a valid token %d for graph\n", sg_elem->token);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  346  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  347  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  348  		}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  349  		tkn_count++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  350  		sg_elem++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  351  	}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  352  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  353  	/* Sub graph is associated with predefined graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  354  	if (info)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  355  		audioreach_tplg_add_sub_graph(sg, info);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  356  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  357  	return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  358  }
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  359  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  360  static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *apm,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  361  							 struct audioreach_sub_graph *sg,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  362  							 struct snd_soc_tplg_private *private)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  363  {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  364  	struct snd_soc_tplg_vendor_value_elem *cont_elem;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  365  	struct snd_soc_tplg_vendor_array *cont_array;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  366  	struct audioreach_container *cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  367  	int container_id, tkn_count = 0;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  368  	bool found = false;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  369  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  370  	cont_array = audioreach_get_cont_array(private);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  371  	cont_elem = cont_array->value;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  372  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  373  	while (tkn_count <= (le32_to_cpu(cont_array->num_elems) - 1)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  374  		switch (le32_to_cpu(cont_elem->token)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  375  		case AR_TKN_U32_CONTAINER_INSTANCE_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  376  			container_id = le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  377  			cont = audioreach_tplg_alloc_container(apm, sg, container_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  378  			if (IS_ERR(cont) || found)/* Error or Already parsed container data */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  379  				return cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  380  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  381  		case AR_TKN_U32_CONTAINER_CAPABILITY_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @382  			cont->capability_id = le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  383  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  384  		case AR_TKN_U32_CONTAINER_STACK_SIZE:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  385  			cont->stack_size = le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  386  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  387  		case AR_TKN_U32_CONTAINER_GRAPH_POS:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  388  			cont->graph_pos = le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  389  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  390  		case AR_TKN_U32_CONTAINER_PROC_DOMAIN:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  391  			cont->proc_domain = le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  392  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  393  		default:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  394  			dev_err(apm->dev, "Not a valid token %d for graph\n", cont_elem->token);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  395  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  396  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  397  		}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  398  		tkn_count++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  399  		cont_elem++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  400  	}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  401  
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  402  	return cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  403  }
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  404  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
