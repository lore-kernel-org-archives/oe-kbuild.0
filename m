Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A52D838A
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Aug 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755675815; cv=none; b=jG5dFmcl2Q9Fv5BZ4RJsZhehl/vOfJ8nLXk0p9i78bw67ED20X2KbKDfOrjLEpJvJqkNZKF1Wl5uc45bkwoi0cUrame2i25DbZX1Z+c5yNoaWCbH6019xaID2WJDFwiDg61BGNiR7ZZab9wH+BBZU/F0IyQT6qCTYtu9Cjuc3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755675815; c=relaxed/simple;
	bh=xDTrhSC0/rV/T33b+uRgODWv9bac/q5S+sSlzAZwJ2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pF4Fv216nTpttWL1hyXSxtXamYf16VOzE5SrMZrO/n6day46v4M++rlDZf1SOz6mVWKLh3jtVYwp3ZfJJkCR7ZFSAibLBRPXwyuPx4ddCsypP9AZXowOhorivEp2MWS52gdKLwiri+vGQu8FncpwTZOrTZxIDHQlq/TDY9GynzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1NJyI9k; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1NJyI9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755675813; x=1787211813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDTrhSC0/rV/T33b+uRgODWv9bac/q5S+sSlzAZwJ2Y=;
  b=I1NJyI9kicJVJceyF/6HzPAV5fSm+1kGv5hyYjl1l8H0pqINAP2fAvdO
   AFiA2AOaRzoKjcZeOMR7RfL+4QvR25GOdcD4F1doYyL1fZ5mWg9ycbIs5
   Vt92VsIHEYBYZX/1xuC8zPYCQa/8j7eQx75R2Ofug7D+IFDGxqnJCb7qe
   dQFXwObms5Nc9APKv4IDg9V+zDnGxauMPaXNk5C0S6cF8LKL6q8zayQT2
   LHxPt943QUUbrlgf+Z5q6v92fqB2fRu0QCNY2ajZuvhuYqzWV+KiXpB2N
   n8x/D3Y+rG3WtYJ5pV3+d5pDK32dzp6mKoGEVT4qAw/ErezP4TZUId5bh
   w==;
X-CSE-ConnectionGUID: WWlM3wfuTourM/UBb0vuUQ==
X-CSE-MsgGUID: mESB1OM2T1inqmVwJwRkOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80528963"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="80528963"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 00:43:31 -0700
X-CSE-ConnectionGUID: GZXiOuqbREaS8gqav9M8UQ==
X-CSE-MsgGUID: ijExEomeT/iXqhYI+SV2Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="198921179"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2025 00:43:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uodTj-000IRN-1V;
	Wed, 20 Aug 2025 07:43:27 +0000
Date: Wed, 20 Aug 2025 15:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev 2/13]
 sound/soc/sof/ipc4-topology.c:2179:6-18: WARNING: Unsigned expression
 compared with zero: out_ref_type < 0
Message-ID: <202508201544.S9UnIFSd-lkp@intel.com>
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
TO: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   dbed0a33a87b7b6170f9fcb9de6d6af35109b31e
commit: a7006879612645731c75fc3afccdac0918c9526c [2/13] ASoC: SOF: ipc4-topology: Add support for 8-bit formats
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
config: alpha-randconfig-r053-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201544.S9UnIFSd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508201544.S9UnIFSd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-topology.c:2179:6-18: WARNING: Unsigned expression compared with zero: out_ref_type < 0

vim +2179 sound/soc/sof/ipc4-topology.c

5292b1adc2189ab Ranjani Sridharan    2024-12-07  1974  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1975  static int
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1976  sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1977  			       struct snd_pcm_hw_params *fe_params,
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1978  			       struct snd_sof_platform_stream_params *platform_params,
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1979  			       struct snd_pcm_hw_params *pipeline_params, int dir)
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1980  {
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1981  	struct sof_ipc4_available_audio_format *available_fmt;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1982  	struct snd_soc_component *scomp = swidget->scomp;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1983  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1984  	struct sof_ipc4_copier_data *copier_data;
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  1985  	int input_fmt_index, output_fmt_index;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1986  	struct sof_ipc4_copier *ipc4_copier;
a935b3f98180927 Andy Shevchenko      2025-03-12  1987  	struct snd_pcm_hw_params *ref_params __free(kfree) = NULL;
0e357b529053232 Bard Liao            2022-04-08  1988  	struct snd_sof_dai *dai;
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  1989  	u32 gtw_cfg_config_length;
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  1990  	u32 dma_config_tlv_size = 0;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1991  	void **ipc_config_data;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1992  	int *ipc_config_size;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1993  	u32 **data;
fcbc3aaccfd57c7 Yang Li              2023-05-16  1994  	int ipc_size, ret, out_ref_valid_bits;
a70068796126457 Seppo Ingalsuo       2025-04-29  1995  	u32 out_ref_rate, out_ref_channels, out_ref_type;
a2db53360203f6f Ranjani Sridharan    2023-01-30  1996  	u32 deep_buffer_dma_ms = 0;
9c3200176a1b4a2 Peter Ujfalusi       2024-05-15  1997  	bool single_output_bitdepth;
53c7ac974837bfa Bard Liao            2023-12-29  1998  	int i;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  1999  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2000  	switch (swidget->id) {
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2001  	case snd_soc_dapm_aif_in:
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2002  	case snd_soc_dapm_aif_out:
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2003  	{
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2004  		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2005  		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2006  		struct sof_ipc4_gtw_attributes *gtw_attr;
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2007  
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2008  		dev_dbg(sdev->dev,
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2009  			"Host copier %s, type %d, ChainDMA: %s, stream_tag: %d\n",
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2010  			swidget->widget->name, swidget->id,
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2011  			str_yes_no(pipeline->use_chain_dma),
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2012  			platform_params->stream_tag);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2013  
a2db53360203f6f Ranjani Sridharan    2023-01-30  2014  		/* parse the deep buffer dma size */
a2db53360203f6f Ranjani Sridharan    2023-01-30  2015  		ret = sof_update_ipc_object(scomp, &deep_buffer_dma_ms,
a2db53360203f6f Ranjani Sridharan    2023-01-30  2016  					    SOF_COPIER_DEEP_BUFFER_TOKENS, swidget->tuples,
a2db53360203f6f Ranjani Sridharan    2023-01-30  2017  					    swidget->num_tuples, sizeof(u32), 1);
a2db53360203f6f Ranjani Sridharan    2023-01-30  2018  		if (ret) {
a2db53360203f6f Ranjani Sridharan    2023-01-30  2019  			dev_err(scomp->dev, "Failed to parse deep buffer dma size for %s\n",
a2db53360203f6f Ranjani Sridharan    2023-01-30  2020  				swidget->widget->name);
a2db53360203f6f Ranjani Sridharan    2023-01-30  2021  			return ret;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2022  		}
a2db53360203f6f Ranjani Sridharan    2023-01-30  2023  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2024  		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2025  		gtw_attr = ipc4_copier->gtw_attr;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2026  		copier_data = &ipc4_copier->data;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2027  		available_fmt = &ipc4_copier->available_fmt;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2028  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2029  		if (pipeline->use_chain_dma) {
f87fd63c2066c02 Jyri Sarha           2022-10-25  2030  			u32 host_dma_id;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2031  			u32 fifo_size;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2032  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2033  			host_dma_id = platform_params->stream_tag - 1;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2034  			pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(host_dma_id);
f87fd63c2066c02 Jyri Sarha           2022-10-25  2035  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2036  			if (params_format(fe_params) == SNDRV_PCM_FORMAT_S16_LE)
f87fd63c2066c02 Jyri Sarha           2022-10-25  2037  				pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2038  
a70068796126457 Seppo Ingalsuo       2025-04-29  2039  			/* Set SCS bit for 8 and 16 bit formats */
a70068796126457 Seppo Ingalsuo       2025-04-29  2040  			if (params_physical_width(fe_params) <= 16)
a70068796126457 Seppo Ingalsuo       2025-04-29  2041  				pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK;
a70068796126457 Seppo Ingalsuo       2025-04-29  2042  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2043  			/*
f87fd63c2066c02 Jyri Sarha           2022-10-25  2044  			 * Despite its name the bitfield 'fifo_size' is used to define DMA buffer
f87fd63c2066c02 Jyri Sarha           2022-10-25  2045  			 * size. The expression calculates 2ms buffer size.
f87fd63c2066c02 Jyri Sarha           2022-10-25  2046  			 */
f87fd63c2066c02 Jyri Sarha           2022-10-25  2047  			fifo_size = DIV_ROUND_UP((SOF_IPC4_CHAIN_DMA_BUF_SIZE_MS *
f87fd63c2066c02 Jyri Sarha           2022-10-25  2048  						  params_rate(fe_params) *
f87fd63c2066c02 Jyri Sarha           2022-10-25  2049  						  params_channels(fe_params) *
f87fd63c2066c02 Jyri Sarha           2022-10-25  2050  						  params_physical_width(fe_params)), 8000);
f87fd63c2066c02 Jyri Sarha           2022-10-25  2051  			pipeline->msg.extension |= SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(fifo_size);
f87fd63c2066c02 Jyri Sarha           2022-10-25  2052  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2053  			/*
47469c223c7e52d Peter Ujfalusi       2025-05-16  2054  			 * Chain DMA does not support stream timestamping, but it
47469c223c7e52d Peter Ujfalusi       2025-05-16  2055  			 * can use the host side registers for delay calculation.
f87fd63c2066c02 Jyri Sarha           2022-10-25  2056  			 */
47469c223c7e52d Peter Ujfalusi       2025-05-16  2057  			copier_data->gtw_cfg.node_id = SOF_IPC4_CHAIN_DMA_NODE_ID;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2058  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2059  			return 0;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2060  		}
f87fd63c2066c02 Jyri Sarha           2022-10-25  2061  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2062  		/*
ac1bd23b07315e7 Ranjani Sridharan    2023-01-30  2063  		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
8f3fc5d0cfdee6e Ranjani Sridharan    2023-01-30  2064  		 * for capture.
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2065  		 */
dbfb4a73357a8fd Ranjani Sridharan    2023-04-19  2066  		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
a935b3f98180927 Andy Shevchenko      2025-03-12  2067  			ref_params = kmemdup(fe_params, sizeof(*ref_params), GFP_KERNEL);
dbfb4a73357a8fd Ranjani Sridharan    2023-04-19  2068  		else
a935b3f98180927 Andy Shevchenko      2025-03-12  2069  			ref_params = kmemdup(pipeline_params, sizeof(*ref_params), GFP_KERNEL);
a935b3f98180927 Andy Shevchenko      2025-03-12  2070  		if (!ref_params)
a935b3f98180927 Andy Shevchenko      2025-03-12  2071  			return -ENOMEM;
8f3fc5d0cfdee6e Ranjani Sridharan    2023-01-30  2072  
9fc5fed76dc4e96 Ranjani Sridharan    2022-03-24  2073  		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2074  		copier_data->gtw_cfg.node_id |=
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2075  			SOF_IPC4_NODE_INDEX(platform_params->stream_tag - 1);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2076  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2077  		/* set gateway attributes */
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2078  		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2079  		break;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2080  	}
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2081  	case snd_soc_dapm_dai_in:
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2082  	case snd_soc_dapm_dai_out:
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2083  	{
f87fd63c2066c02 Jyri Sarha           2022-10-25  2084  		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2085  		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2086  
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2087  		dev_dbg(sdev->dev, "Dai copier %s, type %d, ChainDMA: %s\n",
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2088  			swidget->widget->name, swidget->id,
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2089  			str_yes_no(pipeline->use_chain_dma));
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2090  
f87fd63c2066c02 Jyri Sarha           2022-10-25  2091  		if (pipeline->use_chain_dma)
f87fd63c2066c02 Jyri Sarha           2022-10-25  2092  			return 0;
f87fd63c2066c02 Jyri Sarha           2022-10-25  2093  
0e357b529053232 Bard Liao            2022-04-08  2094  		dai = swidget->private;
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2095  
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2096  		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2097  		copier_data = &ipc4_copier->data;
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2098  		available_fmt = &ipc4_copier->available_fmt;
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2099  
dbfb4a73357a8fd Ranjani Sridharan    2023-04-19  2100  		/*
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2101  		 * Use the fe_params as a base for the copier configuration.
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2102  		 * The ref_params might get updated to reflect what format is
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2103  		 * supported by the copier on the DAI side.
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2104  		 *
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2105  		 * In case of capture the ref_params returned will be used to
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2106  		 * find the input configuration of the copier.
dbfb4a73357a8fd Ranjani Sridharan    2023-04-19  2107  		 */
a935b3f98180927 Andy Shevchenko      2025-03-12  2108  		ref_params = kmemdup(fe_params, sizeof(*ref_params), GFP_KERNEL);
a935b3f98180927 Andy Shevchenko      2025-03-12  2109  		if (!ref_params)
a935b3f98180927 Andy Shevchenko      2025-03-12  2110  			return -ENOMEM;
a935b3f98180927 Andy Shevchenko      2025-03-12  2111  
a935b3f98180927 Andy Shevchenko      2025-03-12  2112  		ret = sof_ipc4_prepare_dai_copier(sdev, dai, ref_params, dir);
e63bfb55ca58c2c Ranjani Sridharan    2022-03-28  2113  		if (ret < 0)
e63bfb55ca58c2c Ranjani Sridharan    2022-03-28  2114  			return ret;
e63bfb55ca58c2c Ranjani Sridharan    2022-03-28  2115  
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2116  		/*
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2117  		 * For playback the pipeline_params needs to be used to find the
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2118  		 * input configuration of the copier.
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2119  		 */
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2120  		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
a935b3f98180927 Andy Shevchenko      2025-03-12  2121  			memcpy(ref_params, pipeline_params, sizeof(*ref_params));
9048e78a223ca3d Peter Ujfalusi       2024-04-03  2122  
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2123  		break;
66b72199c76d9c6 Ranjani Sridharan    2022-03-11  2124  	}
69222fa6d06d71f Bard Liao            2022-09-27  2125  	case snd_soc_dapm_buffer:
69222fa6d06d71f Bard Liao            2022-09-27  2126  	{
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2127  		dev_dbg(sdev->dev, "Module copier %s, type %d\n",
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2128  			swidget->widget->name, swidget->id);
50e829ca6bd448f Peter Ujfalusi       2025-01-08  2129  
69222fa6d06d71f Bard Liao            2022-09-27  2130  		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
69222fa6d06d71f Bard Liao            2022-09-27  2131  		copier_data = &ipc4_copier->data;
69222fa6d06d71f Bard Liao            2022-09-27  2132  		available_fmt = &ipc4_copier->available_fmt;
a935b3f98180927 Andy Shevchenko      2025-03-12  2133  
a935b3f98180927 Andy Shevchenko      2025-03-12  2134  		ref_params = kmemdup(pipeline_params, sizeof(*ref_params), GFP_KERNEL);
a935b3f98180927 Andy Shevchenko      2025-03-12  2135  		if (!ref_params)
a935b3f98180927 Andy Shevchenko      2025-03-12  2136  			return -ENOMEM;
69222fa6d06d71f Bard Liao            2022-09-27  2137  
69222fa6d06d71f Bard Liao            2022-09-27  2138  		break;
69222fa6d06d71f Bard Liao            2022-09-27  2139  	}
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2140  	default:
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2141  		dev_err(sdev->dev, "unsupported type %d for copier %s",
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2142  			swidget->id, swidget->widget->name);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2143  		return -EINVAL;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2144  	}
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2145  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2146  	/* set input and output audio formats */
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2147  	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2148  							&copier_data->base_config,
a935b3f98180927 Andy Shevchenko      2025-03-12  2149  							ref_params, available_fmt);
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2150  	if (input_fmt_index < 0)
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2151  		return input_fmt_index;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2152  
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2153  	/* set the reference params for output format selection */
9c3200176a1b4a2 Peter Ujfalusi       2024-05-15  2154  	single_output_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
0246a452d675b47 Ranjani Sridharan    2023-05-22  2155  					available_fmt->output_pin_fmts,
0246a452d675b47 Ranjani Sridharan    2023-05-22  2156  					available_fmt->num_output_formats);
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2157  	switch (swidget->id) {
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2158  	case snd_soc_dapm_aif_in:
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2159  	case snd_soc_dapm_dai_out:
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2160  	case snd_soc_dapm_buffer:
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2161  	{
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2162  		struct sof_ipc4_audio_format *in_fmt;
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2163  
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2164  		in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2165  		out_ref_rate = in_fmt->sampling_frequency;
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2166  		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
a70068796126457 Seppo Ingalsuo       2025-04-29  2167  		out_ref_type = SOF_IPC4_AUDIO_FORMAT_CFG_SAMPLE_TYPE(in_fmt->fmt_cfg);
0246a452d675b47 Ranjani Sridharan    2023-05-22  2168  
9c3200176a1b4a2 Peter Ujfalusi       2024-05-15  2169  		if (!single_output_bitdepth)
0246a452d675b47 Ranjani Sridharan    2023-05-22  2170  			out_ref_valid_bits =
0246a452d675b47 Ranjani Sridharan    2023-05-22  2171  				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2172  		break;
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2173  	}
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2174  	case snd_soc_dapm_aif_out:
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2175  	case snd_soc_dapm_dai_in:
0246a452d675b47 Ranjani Sridharan    2023-05-22  2176  		out_ref_rate = params_rate(fe_params);
0246a452d675b47 Ranjani Sridharan    2023-05-22  2177  		out_ref_channels = params_channels(fe_params);
a70068796126457 Seppo Ingalsuo       2025-04-29  2178  		out_ref_type = sof_ipc4_get_sample_type(sdev, fe_params);
a70068796126457 Seppo Ingalsuo       2025-04-29 @2179  		if (out_ref_type < 0)
a70068796126457 Seppo Ingalsuo       2025-04-29  2180  			return out_ref_type;
a70068796126457 Seppo Ingalsuo       2025-04-29  2181  
9c3200176a1b4a2 Peter Ujfalusi       2024-05-15  2182  		if (!single_output_bitdepth) {
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2183  			out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2184  			if (out_ref_valid_bits < 0)
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2185  				return out_ref_valid_bits;
0246a452d675b47 Ranjani Sridharan    2023-05-22  2186  		}
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2187  		break;
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2188  	default:
a04b5fad2d61faf Yong Zhi             2023-05-03  2189  		/*
a04b5fad2d61faf Yong Zhi             2023-05-03  2190  		 * Unsupported type should be caught by the former switch default
a04b5fad2d61faf Yong Zhi             2023-05-03  2191  		 * case, this should never happen in reality.
a04b5fad2d61faf Yong Zhi             2023-05-03  2192  		 */
a04b5fad2d61faf Yong Zhi             2023-05-03  2193  		return -EINVAL;
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2194  	}
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2195  
0246a452d675b47 Ranjani Sridharan    2023-05-22  2196  	/*
0246a452d675b47 Ranjani Sridharan    2023-05-22  2197  	 * if the output format is the same across all available output formats, choose
0246a452d675b47 Ranjani Sridharan    2023-05-22  2198  	 * that as the reference.
0246a452d675b47 Ranjani Sridharan    2023-05-22  2199  	 */
9c3200176a1b4a2 Peter Ujfalusi       2024-05-15  2200  	if (single_output_bitdepth) {
0246a452d675b47 Ranjani Sridharan    2023-05-22  2201  		struct sof_ipc4_audio_format *out_fmt;
0246a452d675b47 Ranjani Sridharan    2023-05-22  2202  
0246a452d675b47 Ranjani Sridharan    2023-05-22  2203  		out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
0246a452d675b47 Ranjani Sridharan    2023-05-22  2204  		out_ref_valid_bits =
0246a452d675b47 Ranjani Sridharan    2023-05-22  2205  			SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
a70068796126457 Seppo Ingalsuo       2025-04-29  2206  		out_ref_type = SOF_IPC4_AUDIO_FORMAT_CFG_SAMPLE_TYPE(out_fmt->fmt_cfg);
0246a452d675b47 Ranjani Sridharan    2023-05-22  2207  	}
0246a452d675b47 Ranjani Sridharan    2023-05-22  2208  
fa045ad167d6ef6 Peter Ujfalusi       2024-05-20  2209  	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
fa045ad167d6ef6 Peter Ujfalusi       2024-05-20  2210  							  &copier_data->base_config,
4d63163dfc7d38a Ranjani Sridharan    2023-04-19  2211  							  available_fmt, out_ref_rate,
a70068796126457 Seppo Ingalsuo       2025-04-29  2212  							  out_ref_channels, out_ref_valid_bits,
a70068796126457 Seppo Ingalsuo       2025-04-29  2213  							  out_ref_type);
fa045ad167d6ef6 Peter Ujfalusi       2024-05-20  2214  	if (output_fmt_index < 0)
13e5b53cae9a869 Ranjani Sridharan    2023-04-19  2215  		return output_fmt_index;
0ab59723f906930 Ranjani Sridharan    2023-04-19  2216  
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2217  	/*
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2218  	 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2219  	 * This assumes that the pin 0 formats are defined before all other pins.
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2220  	 * So pick the output audio format with the same index as the chosen
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2221  	 * input format. This logic will need to be updated when the format definitions
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2222  	 * in topology change.
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2223  	 */
0ab59723f906930 Ranjani Sridharan    2023-04-19  2224  	memcpy(&copier_data->out_format,
0ab59723f906930 Ranjani Sridharan    2023-04-19  2225  	       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2226  	       sizeof(struct sof_ipc4_audio_format));
9877ad8314d7e10 Ranjani Sridharan    2023-02-06  2227  
5874b9d4abfaba1 Bard Liao            2022-03-01  2228  	switch (swidget->id) {
5874b9d4abfaba1 Bard Liao            2022-03-01  2229  	case snd_soc_dapm_dai_in:
5874b9d4abfaba1 Bard Liao            2022-03-01  2230  	case snd_soc_dapm_dai_out:
5874b9d4abfaba1 Bard Liao            2022-03-01  2231  	{
5874b9d4abfaba1 Bard Liao            2022-03-01  2232  		/*
5874b9d4abfaba1 Bard Liao            2022-03-01  2233  		 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
72d33ff56eb8b1c Ranjani Sridharan    2023-04-19  2234  		 * That's why only ALH dai's blob is set after sof_ipc4_init_input_audio_fmt
5874b9d4abfaba1 Bard Liao            2022-03-01  2235  		 */
5874b9d4abfaba1 Bard Liao            2022-03-01  2236  		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
5874b9d4abfaba1 Bard Liao            2022-03-01  2237  			struct sof_ipc4_alh_configuration_blob *blob;
5d981b2e13194d3 Bard Liao            2023-12-29  2238  			struct sof_ipc4_dma_config *dma_config;
0e357b529053232 Bard Liao            2022-04-08  2239  			struct sof_ipc4_copier_data *alh_data;
0e357b529053232 Bard Liao            2022-04-08  2240  			struct sof_ipc4_copier *alh_copier;
0e357b529053232 Bard Liao            2022-04-08  2241  			struct snd_sof_widget *w;
c4ab4765e548e92 Bard Liao            2022-12-20  2242  			u32 ch_count = 0;
0e357b529053232 Bard Liao            2022-04-08  2243  			u32 ch_mask = 0;
5874b9d4abfaba1 Bard Liao            2022-03-01  2244  			u32 ch_map;
c4ab4765e548e92 Bard Liao            2022-12-20  2245  			u32 step;
c4ab4765e548e92 Bard Liao            2022-12-20  2246  			u32 mask;
5874b9d4abfaba1 Bard Liao            2022-03-01  2247  
5874b9d4abfaba1 Bard Liao            2022-03-01  2248  			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
0e357b529053232 Bard Liao            2022-04-08  2249  
5874b9d4abfaba1 Bard Liao            2022-03-01  2250  			blob->gw_attr.lp_buffer_alloc = 0;
5874b9d4abfaba1 Bard Liao            2022-03-01  2251  
5874b9d4abfaba1 Bard Liao            2022-03-01  2252  			/* Get channel_mask from ch_map */
5874b9d4abfaba1 Bard Liao            2022-03-01  2253  			ch_map = copier_data->base_config.audio_fmt.ch_map;
2e09d08f3f07fb2 Bard Liao            2022-04-18  2254  			for (i = 0; ch_map; i++) {
c4ab4765e548e92 Bard Liao            2022-12-20  2255  				if ((ch_map & 0xf) != 0xf) {
0e357b529053232 Bard Liao            2022-04-08  2256  					ch_mask |= BIT(i);
c4ab4765e548e92 Bard Liao            2022-12-20  2257  					ch_count++;
c4ab4765e548e92 Bard Liao            2022-12-20  2258  				}
5874b9d4abfaba1 Bard Liao            2022-03-01  2259  				ch_map >>= 4;
5874b9d4abfaba1 Bard Liao            2022-03-01  2260  			}
0e357b529053232 Bard Liao            2022-04-08  2261  
c7095700bbfea9f Pierre-Louis Bossart 2023-02-07  2262  			step = ch_count / blob->alh_cfg.device_count;
c4ab4765e548e92 Bard Liao            2022-12-20  2263  			mask =  GENMASK(step - 1, 0);
0e357b529053232 Bard Liao            2022-04-08  2264  			/*
0e357b529053232 Bard Liao            2022-04-08  2265  			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
0e357b529053232 Bard Liao            2022-04-08  2266  			 * for all widgets with the same stream name
0e357b529053232 Bard Liao            2022-04-08  2267  			 */
0e357b529053232 Bard Liao            2022-04-08  2268  			i = 0;
0e357b529053232 Bard Liao            2022-04-08  2269  			list_for_each_entry(w, &sdev->widget_list, list) {
da70425e0e4bbe3 Ranjani Sridharan    2024-02-15  2270  				u32 node_type;
da70425e0e4bbe3 Ranjani Sridharan    2024-02-15  2271  
5a72ff807ddfb40 Peter Ujfalusi       2024-11-20  2272  				if (!WIDGET_IS_DAI(w->id) || !w->widget->sname ||
0e357b529053232 Bard Liao            2022-04-08  2273  				    strcmp(w->widget->sname, swidget->widget->sname))
0e357b529053232 Bard Liao            2022-04-08  2274  					continue;
0e357b529053232 Bard Liao            2022-04-08  2275  
0e357b529053232 Bard Liao            2022-04-08  2276  				dai = w->private;
5a72ff807ddfb40 Peter Ujfalusi       2024-11-20  2277  				if (dai->type != SOF_DAI_INTEL_ALH)
5a72ff807ddfb40 Peter Ujfalusi       2024-11-20  2278  					continue;
0e357b529053232 Bard Liao            2022-04-08  2279  				alh_copier = (struct sof_ipc4_copier *)dai->private;
0e357b529053232 Bard Liao            2022-04-08  2280  				alh_data = &alh_copier->data;
da70425e0e4bbe3 Ranjani Sridharan    2024-02-15  2281  				node_type = SOF_IPC4_GET_NODE_TYPE(alh_data->gtw_cfg.node_id);
da70425e0e4bbe3 Ranjani Sridharan    2024-02-15  2282  				blob->alh_cfg.mapping[i].device = SOF_IPC4_NODE_TYPE(node_type);
da70425e0e4bbe3 Ranjani Sridharan    2024-02-15  2283  				blob->alh_cfg.mapping[i].device |=
da70425e0e4bbe3 Ranjani Sridharan    2024-02-15  2284  					SOF_IPC4_NODE_INDEX(alh_copier->dai_index);
5d981b2e13194d3 Bard Liao            2023-12-29  2285  
5d981b2e13194d3 Bard Liao            2023-12-29  2286  				/*
5d981b2e13194d3 Bard Liao            2023-12-29  2287  				 * The mapping[i] device in ALH blob should be the same as the
5d981b2e13194d3 Bard Liao            2023-12-29  2288  				 * dma_config_tlv[i] mapping device if a dma_config_tlv is present.
5d981b2e13194d3 Bard Liao            2023-12-29  2289  				 * The device id will be used for DMA tlv mapping purposes.
5d981b2e13194d3 Bard Liao            2023-12-29  2290  				 */
5d981b2e13194d3 Bard Liao            2023-12-29  2291  				if (ipc4_copier->dma_config_tlv[i].length) {
5d981b2e13194d3 Bard Liao            2023-12-29  2292  					dma_config = &ipc4_copier->dma_config_tlv[i].dma_config;
5d981b2e13194d3 Bard Liao            2023-12-29  2293  					blob->alh_cfg.mapping[i].device =
5d981b2e13194d3 Bard Liao            2023-12-29  2294  						dma_config->dma_stream_channel_map.mapping[0].device;
5d981b2e13194d3 Bard Liao            2023-12-29  2295  				}
5d981b2e13194d3 Bard Liao            2023-12-29  2296  
c4ab4765e548e92 Bard Liao            2022-12-20  2297  				/*
c4ab4765e548e92 Bard Liao            2022-12-20  2298  				 * Set the same channel mask for playback as the audio data is
c4ab4765e548e92 Bard Liao            2022-12-20  2299  				 * duplicated for all speakers. For capture, split the channels
c4ab4765e548e92 Bard Liao            2022-12-20  2300  				 * among the aggregated DAIs. For example, with 4 channels on 2
c4ab4765e548e92 Bard Liao            2022-12-20  2301  				 * aggregated DAIs, the channel_mask should be 0x3 and 0xc for the
c4ab4765e548e92 Bard Liao            2022-12-20  2302  				 * two DAI's.
c4ab4765e548e92 Bard Liao            2022-12-20  2303  				 * The channel masks used depend on the cpu_dais used in the
c4ab4765e548e92 Bard Liao            2022-12-20  2304  				 * dailink at the machine driver level, which actually comes from
c4ab4765e548e92 Bard Liao            2022-12-20  2305  				 * the tables in soc_acpi files depending on the _ADR and devID
c4ab4765e548e92 Bard Liao            2022-12-20  2306  				 * registers for each codec.
c4ab4765e548e92 Bard Liao            2022-12-20  2307  				 */
c4ab4765e548e92 Bard Liao            2022-12-20  2308  				if (w->id == snd_soc_dapm_dai_in)
0e357b529053232 Bard Liao            2022-04-08  2309  					blob->alh_cfg.mapping[i].channel_mask = ch_mask;
c4ab4765e548e92 Bard Liao            2022-12-20  2310  				else
c4ab4765e548e92 Bard Liao            2022-12-20  2311  					blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
c4ab4765e548e92 Bard Liao            2022-12-20  2312  
0e357b529053232 Bard Liao            2022-04-08  2313  				i++;
0e357b529053232 Bard Liao            2022-04-08  2314  			}
c7095700bbfea9f Pierre-Louis Bossart 2023-02-07  2315  			if (blob->alh_cfg.device_count > 1) {
0e357b529053232 Bard Liao            2022-04-08  2316  				int group_id;
0e357b529053232 Bard Liao            2022-04-08  2317  
a5e71829b52c34d Bard Liao            2022-08-12  2318  				group_id = ida_alloc_max(&alh_group_ida, ALH_MULTI_GTW_COUNT - 1,
0e357b529053232 Bard Liao            2022-04-08  2319  							 GFP_KERNEL);
0e357b529053232 Bard Liao            2022-04-08  2320  
0e357b529053232 Bard Liao            2022-04-08  2321  				if (group_id < 0)
0e357b529053232 Bard Liao            2022-04-08  2322  					return group_id;
0e357b529053232 Bard Liao            2022-04-08  2323  
0e357b529053232 Bard Liao            2022-04-08  2324  				/* add multi-gateway base */
0e357b529053232 Bard Liao            2022-04-08  2325  				group_id += ALH_MULTI_GTW_BASE;
0e357b529053232 Bard Liao            2022-04-08  2326  				copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
0e357b529053232 Bard Liao            2022-04-08  2327  				copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(group_id);
0e357b529053232 Bard Liao            2022-04-08  2328  			}
5874b9d4abfaba1 Bard Liao            2022-03-01  2329  		}
5874b9d4abfaba1 Bard Liao            2022-03-01  2330  	}
5874b9d4abfaba1 Bard Liao            2022-03-01  2331  	}
5874b9d4abfaba1 Bard Liao            2022-03-01  2332  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2333  	/* modify the input params for the next widget */
564d85b5766cff7 Peter Ujfalusi       2024-04-03  2334  	ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
564d85b5766cff7 Peter Ujfalusi       2024-04-03  2335  					&copier_data->out_format,
564d85b5766cff7 Peter Ujfalusi       2024-04-03  2336  					BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
564d85b5766cff7 Peter Ujfalusi       2024-04-03  2337  					BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
564d85b5766cff7 Peter Ujfalusi       2024-04-03  2338  					BIT(SNDRV_PCM_HW_PARAM_RATE));
80d7c2e0fe7cb84 Kai Vehmanen         2023-01-25  2339  	if (ret)
80d7c2e0fe7cb84 Kai Vehmanen         2023-01-25  2340  		return ret;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2341  
a2db53360203f6f Ranjani Sridharan    2023-01-30  2342  	/*
a2db53360203f6f Ranjani Sridharan    2023-01-30  2343  	 * Set the gateway dma_buffer_size to 2ms buffer size to meet the FW expectation. In the
a2db53360203f6f Ranjani Sridharan    2023-01-30  2344  	 * deep buffer case, set the dma_buffer_size depending on the deep_buffer_dma_ms set
a2db53360203f6f Ranjani Sridharan    2023-01-30  2345  	 * in topology.
a2db53360203f6f Ranjani Sridharan    2023-01-30  2346  	 */
a2db53360203f6f Ranjani Sridharan    2023-01-30  2347  	switch (swidget->id) {
a2db53360203f6f Ranjani Sridharan    2023-01-30  2348  	case snd_soc_dapm_dai_in:
a2db53360203f6f Ranjani Sridharan    2023-01-30  2349  		copier_data->gtw_cfg.dma_buffer_size =
a2db53360203f6f Ranjani Sridharan    2023-01-30  2350  			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.ibs;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2351  		break;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2352  	case snd_soc_dapm_aif_in:
a2db53360203f6f Ranjani Sridharan    2023-01-30  2353  		copier_data->gtw_cfg.dma_buffer_size =
a2db53360203f6f Ranjani Sridharan    2023-01-30  2354  			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
a2db53360203f6f Ranjani Sridharan    2023-01-30  2355  				copier_data->base_config.ibs;
e327169bf75247e Yong Zhi             2023-08-24  2356  		dev_dbg(sdev->dev, "copier %s, dma buffer%s: %u ms (%u bytes)",
e327169bf75247e Yong Zhi             2023-08-24  2357  			swidget->widget->name,
e327169bf75247e Yong Zhi             2023-08-24  2358  			deep_buffer_dma_ms ? " (using Deep Buffer)" : "",
e327169bf75247e Yong Zhi             2023-08-24  2359  			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms),
e327169bf75247e Yong Zhi             2023-08-24  2360  			copier_data->gtw_cfg.dma_buffer_size);
a2db53360203f6f Ranjani Sridharan    2023-01-30  2361  		break;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2362  	case snd_soc_dapm_dai_out:
a2db53360203f6f Ranjani Sridharan    2023-01-30  2363  	case snd_soc_dapm_aif_out:
a2db53360203f6f Ranjani Sridharan    2023-01-30  2364  		copier_data->gtw_cfg.dma_buffer_size =
a2db53360203f6f Ranjani Sridharan    2023-01-30  2365  			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.obs;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2366  		break;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2367  	default:
a2db53360203f6f Ranjani Sridharan    2023-01-30  2368  		break;
a2db53360203f6f Ranjani Sridharan    2023-01-30  2369  	}
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2370  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2371  	data = &ipc4_copier->copier_config;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2372  	ipc_config_size = &ipc4_copier->ipc_config_size;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2373  	ipc_config_data = &ipc4_copier->ipc_config_data;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2374  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2375  	/* config_length is DWORD based */
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2376  	gtw_cfg_config_length = copier_data->gtw_cfg.config_length * 4;
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2377  	ipc_size = sizeof(*copier_data) + gtw_cfg_config_length;
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2378  
53c7ac974837bfa Bard Liao            2023-12-29  2379  	dma_config_tlv_size = 0;
53c7ac974837bfa Bard Liao            2023-12-29  2380  	for (i = 0; i < SOF_IPC4_DMA_DEVICE_MAX_COUNT; i++) {
53c7ac974837bfa Bard Liao            2023-12-29  2381  		if (ipc4_copier->dma_config_tlv[i].type != SOF_IPC4_GTW_DMA_CONFIG_ID)
53c7ac974837bfa Bard Liao            2023-12-29  2382  			continue;
53c7ac974837bfa Bard Liao            2023-12-29  2383  		dma_config_tlv_size += ipc4_copier->dma_config_tlv[i].length;
53c7ac974837bfa Bard Liao            2023-12-29  2384  		dma_config_tlv_size +=
53c7ac974837bfa Bard Liao            2023-12-29  2385  			ipc4_copier->dma_config_tlv[i].dma_config.dma_priv_config_size;
53c7ac974837bfa Bard Liao            2023-12-29  2386  		dma_config_tlv_size += (sizeof(ipc4_copier->dma_config_tlv[i]) -
53c7ac974837bfa Bard Liao            2023-12-29  2387  			sizeof(ipc4_copier->dma_config_tlv[i].dma_config));
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2388  	}
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2389  
53c7ac974837bfa Bard Liao            2023-12-29  2390  	if (dma_config_tlv_size) {
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2391  		ipc_size += dma_config_tlv_size;
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2392  
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2393  		/* we also need to increase the size at the gtw level */
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2394  		copier_data->gtw_cfg.config_length += dma_config_tlv_size / 4;
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2395  	}
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2396  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2397  	dev_dbg(sdev->dev, "copier %s, IPC size is %d", swidget->widget->name, ipc_size);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2398  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2399  	*ipc_config_data = kzalloc(ipc_size, GFP_KERNEL);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2400  	if (!*ipc_config_data)
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2401  		return -ENOMEM;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2402  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2403  	*ipc_config_size = ipc_size;
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2404  
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2405  	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2406  					 input_fmt_index, output_fmt_index);
e87ee5e551e0a9e Peter Ujfalusi       2024-05-22  2407  
78ed121c2989e2a Peter Ujfalusi       2023-08-07  2408  	/* update pipeline memory usage */
78ed121c2989e2a Peter Ujfalusi       2023-08-07  2409  	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
78ed121c2989e2a Peter Ujfalusi       2023-08-07  2410  
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2411  	/* copy IPC data */
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2412  	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2413  	if (gtw_cfg_config_length)
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2414  		memcpy(*ipc_config_data + sizeof(*copier_data),
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2415  		       *data, gtw_cfg_config_length);
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2416  
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2417  	/* add DMA Config TLV, if configured */
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2418  	if (dma_config_tlv_size)
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2419  		memcpy(*ipc_config_data + sizeof(*copier_data) +
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2420  		       gtw_cfg_config_length,
0437cd0868ff42b Pierre-Louis Bossart 2023-02-07  2421  		       &ipc4_copier->dma_config_tlv, dma_config_tlv_size);
3369b10d8f25803 Ranjani Sridharan    2022-03-11  2422  
d933a389dd1681f Pierre-Louis Bossart 2023-07-05  2423  	/*
d933a389dd1681f Pierre-Louis Bossart 2023-07-05  2424  	 * Restore gateway config length now that IPC payload is prepared. This avoids
d933a389dd1681f Pierre-Louis Bossart 2023-07-05  2425  	 * counting the DMA CONFIG TLV multiple times
d933a389dd1681f Pierre-Louis Bossart 2023-07-05  2426  	 */
d933a389dd1681f Pierre-Louis Bossart 2023-07-05  2427  	copier_data->gtw_cfg.config_length = gtw_cfg_config_length / 4;
d933a389dd1681f Pierre-Louis Bossart 2023-07-05  2428  
3ecf8f41dc299ce Bard Liao            2022-07-06  2429  	return 0;
6b26395013c7126 Ranjani Sridharan    2022-03-10  2430  }
6b26395013c7126 Ranjani Sridharan    2022-03-10  2431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
