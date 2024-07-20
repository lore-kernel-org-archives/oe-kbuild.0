Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E639C14884B
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jul 2024 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721509197; cv=none; b=qyOjP66C5ljoqVRERlv7vdH7ryhbkxFJ7kHt/G6VxU7IShocuhSPY+jHbdNipoD/lHPCpLaSuNcLzXOCkPl6uLYZuhHVdmqdXL6gZFCkOF4scAH5oV0yYfxa8w3AXeDHSnITF8JF8EXfaK6ysZnQdrFeRi1YxG7XNtvFal4AjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721509197; c=relaxed/simple;
	bh=981zF25ukdKaFzN66JnEwclod/BgiFrWn1Dnm1bgpno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yr4Poaxop3P4MfAPlGlqP5cWGeROEnelnPyHVYwVwy6a/1i9e6NG4v3ZQbtOprJ8TWShnMQM/sODprl+ecswJdCTE2DxvGGARPW2jG1EtxwLDBOWYo/tAHVrZhFa0cjDI1PNg9EGNJ0W8ZGAZHYlJ9ahCixA+mVymZ5ECyx2NCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h60URVun; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h60URVun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721509194; x=1753045194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=981zF25ukdKaFzN66JnEwclod/BgiFrWn1Dnm1bgpno=;
  b=h60URVunU9TYpfxo+s86t+J9dsuBVnWqPRaGAvVTFuypmDsX+WOHe0Ce
   DshHqm/N9PNyXm4AVH/I+jmBbV4CymxZQ0Mq5MPAC0s2ZCABJWVOrDhrc
   N/PrxJoWNq1/xxLJMd5mag8Lnve6I3Z4ctzY1qaAEBgx08MQP/r129b39
   55cFQaEQShNfRWoiVU11+/JEVAg+Sg6DjE2PAGCWrPOaJueknAHqJlSdO
   wedDJ675d+FAim1a2UtGmSlYs4g8O7kq5AHY4YwwwRa11hXhtpqR/Qd2l
   qDEM3+iBod/ezYKP+jna7eEzQjA6LhjGfCmvP4bL4dfkTDHALYtgXMGNE
   w==;
X-CSE-ConnectionGUID: Vzf69VihQ/mYMsfeEiOdTQ==
X-CSE-MsgGUID: qz+jwp1hS2avWy/KHUL/7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="36547893"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="36547893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 13:59:51 -0700
X-CSE-ConnectionGUID: Z9gZBuQHTrCoFr6/H8rGSQ==
X-CSE-MsgGUID: b9BQaEzbTgCbU+yueJRYbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51513183"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2024 13:59:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVHBD-000jdg-2R;
	Sat, 20 Jul 2024 20:59:47 +0000
Date: Sun, 21 Jul 2024 04:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.10/zen-sauce 8/32] sound/soc/sof/ipc4-topology.c:2123:1:
 warning: the frame size of 1220 bytes is larger than 1024 bytes
Message-ID: <202407210453.Ar2yxDRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.10/zen-sauce
head:   8544d2d50967e073bbb7f31d422ace7384ac239e
commit: 30ee88fd481b3aff9cfa8523da4e1c11b997f61c [8/32] ZEN: Disable stack conservation for GCC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407210453.Ar2yxDRQ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210453.Ar2yxDRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407210453.Ar2yxDRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sof/ipc4-topology.c: In function 'sof_ipc4_prepare_copier_module':
>> sound/soc/sof/ipc4-topology.c:2123:1: warning: the frame size of 1220 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2123 | }
         | ^


vim +2123 sound/soc/sof/ipc4-topology.c

f9209644ae7688 Peter Ujfalusi       2024-05-03  1692  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1693  static int
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1694  sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1695  			       struct snd_pcm_hw_params *fe_params,
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1696  			       struct snd_sof_platform_stream_params *platform_params,
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1697  			       struct snd_pcm_hw_params *pipeline_params, int dir)
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1698  {
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1699  	struct sof_ipc4_available_audio_format *available_fmt;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1700  	struct snd_soc_component *scomp = swidget->scomp;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1701  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1702  	struct sof_ipc4_copier_data *copier_data;
f9209644ae7688 Peter Ujfalusi       2024-05-03  1703  	struct snd_pcm_hw_params ref_params;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1704  	struct sof_ipc4_copier *ipc4_copier;
a150345aa75849 Bard Liao            2022-06-14  1705  	struct snd_sof_dai *dai;
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  1706  	u32 gtw_cfg_config_length;
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  1707  	u32 dma_config_tlv_size = 0;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1708  	void **ipc_config_data;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1709  	int *ipc_config_size;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1710  	u32 **data;
fcbc3aaccfd57c Yang Li              2023-05-16  1711  	int ipc_size, ret, out_ref_valid_bits;
fcbc3aaccfd57c Yang Li              2023-05-16  1712  	u32 out_ref_rate, out_ref_channels;
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1713  	u32 deep_buffer_dma_ms = 0;
a2e07c3319f79f Ranjani Sridharan    2023-05-15  1714  	int output_fmt_index;
3b64fd2f83f203 Peter Ujfalusi       2024-05-30  1715  	bool single_output_bitdepth;
e9c6b118de1afc Bard Liao            2024-04-02  1716  	int i;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1717  
3809264b53906b Pierre-Louis Bossart 2022-06-16  1718  	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1719  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1720  	switch (swidget->id) {
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1721  	case snd_soc_dapm_aif_in:
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1722  	case snd_soc_dapm_aif_out:
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1723  	{
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1724  		struct sof_ipc4_gtw_attributes *gtw_attr;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1725  		struct snd_sof_widget *pipe_widget;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1726  		struct sof_ipc4_pipeline *pipeline;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1727  
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1728  		/* parse the deep buffer dma size */
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1729  		ret = sof_update_ipc_object(scomp, &deep_buffer_dma_ms,
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1730  					    SOF_COPIER_DEEP_BUFFER_TOKENS, swidget->tuples,
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1731  					    swidget->num_tuples, sizeof(u32), 1);
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1732  		if (ret) {
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1733  			dev_err(scomp->dev, "Failed to parse deep buffer dma size for %s\n",
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1734  				swidget->widget->name);
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1735  			return ret;
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1736  		}
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  1737  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1738  		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1739  		gtw_attr = ipc4_copier->gtw_attr;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1740  		copier_data = &ipc4_copier->data;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1741  		available_fmt = &ipc4_copier->available_fmt;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1742  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1743  		pipe_widget = swidget->spipe->pipe_widget;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1744  		pipeline = pipe_widget->private;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1745  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1746  		if (pipeline->use_chain_dma) {
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1747  			u32 host_dma_id;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1748  			u32 fifo_size;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1749  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1750  			host_dma_id = platform_params->stream_tag - 1;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1751  			pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(host_dma_id);
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1752  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1753  			/* Set SCS bit for S16_LE format only */
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1754  			if (params_format(fe_params) == SNDRV_PCM_FORMAT_S16_LE)
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1755  				pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1756  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1757  			/*
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1758  			 * Despite its name the bitfield 'fifo_size' is used to define DMA buffer
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1759  			 * size. The expression calculates 2ms buffer size.
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1760  			 */
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1761  			fifo_size = DIV_ROUND_UP((SOF_IPC4_CHAIN_DMA_BUF_SIZE_MS *
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1762  						  params_rate(fe_params) *
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1763  						  params_channels(fe_params) *
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1764  						  params_physical_width(fe_params)), 8000);
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1765  			pipeline->msg.extension |= SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(fifo_size);
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1766  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1767  			/*
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1768  			 * Chain DMA does not support stream timestamping, set node_id to invalid
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1769  			 * to skip the code in sof_ipc4_get_stream_start_offset().
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1770  			 */
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1771  			copier_data->gtw_cfg.node_id = SOF_IPC4_INVALID_NODE_ID;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1772  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1773  			return 0;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1774  		}
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1775  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1776  		/*
7ab6b1e8302cf7 Ranjani Sridharan    2023-03-13  1777  		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
e63a73f94fef0c Ranjani Sridharan    2023-03-13  1778  		 * for capture.
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1779  		 */
5a56c5335d36de Ranjani Sridharan    2023-05-15  1780  		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
f9209644ae7688 Peter Ujfalusi       2024-05-03  1781  			ref_params = *fe_params;
5a56c5335d36de Ranjani Sridharan    2023-05-15  1782  		else
f9209644ae7688 Peter Ujfalusi       2024-05-03  1783  			ref_params = *pipeline_params;
e63a73f94fef0c Ranjani Sridharan    2023-03-13  1784  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1785  		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1786  		copier_data->gtw_cfg.node_id |=
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1787  			SOF_IPC4_NODE_INDEX(platform_params->stream_tag - 1);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1788  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1789  		/* set gateway attributes */
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1790  		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1791  		break;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1792  	}
acf52594207721 Ranjani Sridharan    2022-06-08  1793  	case snd_soc_dapm_dai_in:
acf52594207721 Ranjani Sridharan    2022-06-08  1794  	case snd_soc_dapm_dai_out:
acf52594207721 Ranjani Sridharan    2022-06-08  1795  	{
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1796  		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1797  		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1798  
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1799  		if (pipeline->use_chain_dma)
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1800  			return 0;
ca5ce0caa67fa9 Jyri Sarha           2023-03-21  1801  
a150345aa75849 Bard Liao            2022-06-14  1802  		dai = swidget->private;
acf52594207721 Ranjani Sridharan    2022-06-08  1803  
acf52594207721 Ranjani Sridharan    2022-06-08  1804  		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
acf52594207721 Ranjani Sridharan    2022-06-08  1805  		copier_data = &ipc4_copier->data;
acf52594207721 Ranjani Sridharan    2022-06-08  1806  		available_fmt = &ipc4_copier->available_fmt;
acf52594207721 Ranjani Sridharan    2022-06-08  1807  
5a56c5335d36de Ranjani Sridharan    2023-05-15  1808  		/*
f9209644ae7688 Peter Ujfalusi       2024-05-03  1809  		 * Use the fe_params as a base for the copier configuration.
f9209644ae7688 Peter Ujfalusi       2024-05-03  1810  		 * The ref_params might get updated to reflect what format is
f9209644ae7688 Peter Ujfalusi       2024-05-03  1811  		 * supported by the copier on the DAI side.
f9209644ae7688 Peter Ujfalusi       2024-05-03  1812  		 *
f9209644ae7688 Peter Ujfalusi       2024-05-03  1813  		 * In case of capture the ref_params returned will be used to
f9209644ae7688 Peter Ujfalusi       2024-05-03  1814  		 * find the input configuration of the copier.
5a56c5335d36de Ranjani Sridharan    2023-05-15  1815  		 */
f9209644ae7688 Peter Ujfalusi       2024-05-03  1816  		ref_params = *fe_params;
f9209644ae7688 Peter Ujfalusi       2024-05-03  1817  		ret = sof_ipc4_prepare_dai_copier(sdev, dai, &ref_params, dir);
aa84ffb721587d Ranjani Sridharan    2022-06-08  1818  		if (ret < 0)
aa84ffb721587d Ranjani Sridharan    2022-06-08  1819  			return ret;
aa84ffb721587d Ranjani Sridharan    2022-06-08  1820  
f9209644ae7688 Peter Ujfalusi       2024-05-03  1821  		/*
f9209644ae7688 Peter Ujfalusi       2024-05-03  1822  		 * For playback the pipeline_params needs to be used to find the
f9209644ae7688 Peter Ujfalusi       2024-05-03  1823  		 * input configuration of the copier.
f9209644ae7688 Peter Ujfalusi       2024-05-03  1824  		 */
f9209644ae7688 Peter Ujfalusi       2024-05-03  1825  		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
f9209644ae7688 Peter Ujfalusi       2024-05-03  1826  			ref_params = *pipeline_params;
f9209644ae7688 Peter Ujfalusi       2024-05-03  1827  
acf52594207721 Ranjani Sridharan    2022-06-08  1828  		break;
acf52594207721 Ranjani Sridharan    2022-06-08  1829  	}
7d573425d87642 Bard Liao            2023-01-26  1830  	case snd_soc_dapm_buffer:
7d573425d87642 Bard Liao            2023-01-26  1831  	{
7d573425d87642 Bard Liao            2023-01-26  1832  		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
7d573425d87642 Bard Liao            2023-01-26  1833  		copier_data = &ipc4_copier->data;
7d573425d87642 Bard Liao            2023-01-26  1834  		available_fmt = &ipc4_copier->available_fmt;
f9209644ae7688 Peter Ujfalusi       2024-05-03  1835  		ref_params = *pipeline_params;
7d573425d87642 Bard Liao            2023-01-26  1836  
7d573425d87642 Bard Liao            2023-01-26  1837  		break;
7d573425d87642 Bard Liao            2023-01-26  1838  	}
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1839  	default:
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1840  		dev_err(sdev->dev, "unsupported type %d for copier %s",
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1841  			swidget->id, swidget->widget->name);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1842  		return -EINVAL;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1843  	}
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1844  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1845  	/* set input and output audio formats */
f9209644ae7688 Peter Ujfalusi       2024-05-03  1846  	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &copier_data->base_config,
f9209644ae7688 Peter Ujfalusi       2024-05-03  1847  					    &ref_params, available_fmt);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1848  	if (ret < 0)
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1849  		return ret;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  1850  
1af13f221ac331 Ranjani Sridharan    2023-05-15  1851  	/* set the reference params for output format selection */
3b64fd2f83f203 Peter Ujfalusi       2024-05-30  1852  	single_output_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1853  					available_fmt->output_pin_fmts,
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1854  					available_fmt->num_output_formats);
1af13f221ac331 Ranjani Sridharan    2023-05-15  1855  	switch (swidget->id) {
1af13f221ac331 Ranjani Sridharan    2023-05-15  1856  	case snd_soc_dapm_aif_in:
1af13f221ac331 Ranjani Sridharan    2023-05-15  1857  	case snd_soc_dapm_dai_out:
1af13f221ac331 Ranjani Sridharan    2023-05-15  1858  	case snd_soc_dapm_buffer:
1af13f221ac331 Ranjani Sridharan    2023-05-15  1859  	{
1af13f221ac331 Ranjani Sridharan    2023-05-15  1860  		struct sof_ipc4_audio_format *in_fmt;
1af13f221ac331 Ranjani Sridharan    2023-05-15  1861  
1af13f221ac331 Ranjani Sridharan    2023-05-15  1862  		in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
1af13f221ac331 Ranjani Sridharan    2023-05-15  1863  		out_ref_rate = in_fmt->sampling_frequency;
1af13f221ac331 Ranjani Sridharan    2023-05-15  1864  		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1865  
3b64fd2f83f203 Peter Ujfalusi       2024-05-30  1866  		if (!single_output_bitdepth)
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1867  			out_ref_valid_bits =
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1868  				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
1af13f221ac331 Ranjani Sridharan    2023-05-15  1869  		break;
1af13f221ac331 Ranjani Sridharan    2023-05-15  1870  	}
1af13f221ac331 Ranjani Sridharan    2023-05-15  1871  	case snd_soc_dapm_aif_out:
1af13f221ac331 Ranjani Sridharan    2023-05-15  1872  	case snd_soc_dapm_dai_in:
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1873  		out_ref_rate = params_rate(fe_params);
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1874  		out_ref_channels = params_channels(fe_params);
3b64fd2f83f203 Peter Ujfalusi       2024-05-30  1875  		if (!single_output_bitdepth) {
1af13f221ac331 Ranjani Sridharan    2023-05-15  1876  			out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
1af13f221ac331 Ranjani Sridharan    2023-05-15  1877  			if (out_ref_valid_bits < 0)
1af13f221ac331 Ranjani Sridharan    2023-05-15  1878  				return out_ref_valid_bits;
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1879  		}
1af13f221ac331 Ranjani Sridharan    2023-05-15  1880  		break;
1af13f221ac331 Ranjani Sridharan    2023-05-15  1881  	default:
1af13f221ac331 Ranjani Sridharan    2023-05-15  1882  		/*
1af13f221ac331 Ranjani Sridharan    2023-05-15  1883  		 * Unsupported type should be caught by the former switch default
1af13f221ac331 Ranjani Sridharan    2023-05-15  1884  		 * case, this should never happen in reality.
1af13f221ac331 Ranjani Sridharan    2023-05-15  1885  		 */
1af13f221ac331 Ranjani Sridharan    2023-05-15  1886  		return -EINVAL;
1af13f221ac331 Ranjani Sridharan    2023-05-15  1887  	}
1af13f221ac331 Ranjani Sridharan    2023-05-15  1888  
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1889  	/*
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1890  	 * if the output format is the same across all available output formats, choose
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1891  	 * that as the reference.
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1892  	 */
3b64fd2f83f203 Peter Ujfalusi       2024-05-30  1893  	if (single_output_bitdepth) {
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1894  		struct sof_ipc4_audio_format *out_fmt;
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1895  
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1896  		out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1897  		out_ref_valid_bits =
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1898  			SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1899  	}
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1900  
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1901  	dev_dbg(sdev->dev, "copier %s: reference output rate %d, channels %d valid_bits %d\n",
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1902  		swidget->widget->name, out_ref_rate, out_ref_channels, out_ref_valid_bits);
70b0924b22efe2 Ranjani Sridharan    2023-08-21  1903  
a2e07c3319f79f Ranjani Sridharan    2023-05-15  1904  	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &copier_data->base_config,
1af13f221ac331 Ranjani Sridharan    2023-05-15  1905  							  available_fmt, out_ref_rate,
1af13f221ac331 Ranjani Sridharan    2023-05-15  1906  							  out_ref_channels, out_ref_valid_bits);
f1ceebdbe8d891 Ranjani Sridharan    2023-05-15  1907  	if (output_fmt_index < 0) {
1af13f221ac331 Ranjani Sridharan    2023-05-15  1908  		dev_err(sdev->dev, "Failed to initialize output format for %s",
f1ceebdbe8d891 Ranjani Sridharan    2023-05-15  1909  			swidget->widget->name);
f1ceebdbe8d891 Ranjani Sridharan    2023-05-15  1910  		return output_fmt_index;
f1ceebdbe8d891 Ranjani Sridharan    2023-05-15  1911  	}
a2e07c3319f79f Ranjani Sridharan    2023-05-15  1912  
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1913  	/*
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1914  	 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1915  	 * This assumes that the pin 0 formats are defined before all other pins.
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1916  	 * So pick the output audio format with the same index as the chosen
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1917  	 * input format. This logic will need to be updated when the format definitions
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1918  	 * in topology change.
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1919  	 */
a2e07c3319f79f Ranjani Sridharan    2023-05-15  1920  	memcpy(&copier_data->out_format,
a2e07c3319f79f Ranjani Sridharan    2023-05-15  1921  	       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1922  	       sizeof(struct sof_ipc4_audio_format));
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1923  	dev_dbg(sdev->dev, "Output audio format for %s\n", swidget->widget->name);
a2e07c3319f79f Ranjani Sridharan    2023-05-15  1924  	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[output_fmt_index], 1);
9c560549e32bc2 Ranjani Sridharan    2023-03-13  1925  
a45a4d4390b7a5 Bard Liao            2022-06-08  1926  	switch (swidget->id) {
a45a4d4390b7a5 Bard Liao            2022-06-08  1927  	case snd_soc_dapm_dai_in:
a45a4d4390b7a5 Bard Liao            2022-06-08  1928  	case snd_soc_dapm_dai_out:
a45a4d4390b7a5 Bard Liao            2022-06-08  1929  	{
a45a4d4390b7a5 Bard Liao            2022-06-08  1930  		/*
a45a4d4390b7a5 Bard Liao            2022-06-08  1931  		 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
ae45aebe45600a Ranjani Sridharan    2023-05-15  1932  		 * That's why only ALH dai's blob is set after sof_ipc4_init_input_audio_fmt
a45a4d4390b7a5 Bard Liao            2022-06-08  1933  		 */
a45a4d4390b7a5 Bard Liao            2022-06-08  1934  		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
a45a4d4390b7a5 Bard Liao            2022-06-08  1935  			struct sof_ipc4_alh_configuration_blob *blob;
17386cb1b48b0d Bard Liao            2024-04-02  1936  			struct sof_ipc4_dma_config *dma_config;
a150345aa75849 Bard Liao            2022-06-14  1937  			struct sof_ipc4_copier_data *alh_data;
a150345aa75849 Bard Liao            2022-06-14  1938  			struct sof_ipc4_copier *alh_copier;
a150345aa75849 Bard Liao            2022-06-14  1939  			struct snd_sof_widget *w;
0390a102cc18cb Bard Liao            2023-01-25  1940  			u32 ch_count = 0;
a150345aa75849 Bard Liao            2022-06-14  1941  			u32 ch_mask = 0;
a45a4d4390b7a5 Bard Liao            2022-06-08  1942  			u32 ch_map;
0390a102cc18cb Bard Liao            2023-01-25  1943  			u32 step;
0390a102cc18cb Bard Liao            2023-01-25  1944  			u32 mask;
a45a4d4390b7a5 Bard Liao            2022-06-08  1945  
a45a4d4390b7a5 Bard Liao            2022-06-08  1946  			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
a150345aa75849 Bard Liao            2022-06-14  1947  
a45a4d4390b7a5 Bard Liao            2022-06-08  1948  			blob->gw_attr.lp_buffer_alloc = 0;
a45a4d4390b7a5 Bard Liao            2022-06-08  1949  
a45a4d4390b7a5 Bard Liao            2022-06-08  1950  			/* Get channel_mask from ch_map */
a45a4d4390b7a5 Bard Liao            2022-06-08  1951  			ch_map = copier_data->base_config.audio_fmt.ch_map;
a45a4d4390b7a5 Bard Liao            2022-06-08  1952  			for (i = 0; ch_map; i++) {
0390a102cc18cb Bard Liao            2023-01-25  1953  				if ((ch_map & 0xf) != 0xf) {
a150345aa75849 Bard Liao            2022-06-14  1954  					ch_mask |= BIT(i);
0390a102cc18cb Bard Liao            2023-01-25  1955  					ch_count++;
0390a102cc18cb Bard Liao            2023-01-25  1956  				}
a45a4d4390b7a5 Bard Liao            2022-06-08  1957  				ch_map >>= 4;
a45a4d4390b7a5 Bard Liao            2022-06-08  1958  			}
a150345aa75849 Bard Liao            2022-06-14  1959  
e186e1f237c1e2 Pierre-Louis Bossart 2023-06-02  1960  			step = ch_count / blob->alh_cfg.device_count;
0390a102cc18cb Bard Liao            2023-01-25  1961  			mask =  GENMASK(step - 1, 0);
a150345aa75849 Bard Liao            2022-06-14  1962  			/*
a150345aa75849 Bard Liao            2022-06-14  1963  			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
a150345aa75849 Bard Liao            2022-06-14  1964  			 * for all widgets with the same stream name
a150345aa75849 Bard Liao            2022-06-14  1965  			 */
a150345aa75849 Bard Liao            2022-06-14  1966  			i = 0;
a150345aa75849 Bard Liao            2022-06-14  1967  			list_for_each_entry(w, &sdev->widget_list, list) {
f0caa4fc244ca7 Ranjani Sridharan    2024-04-02  1968  				u32 node_type;
f0caa4fc244ca7 Ranjani Sridharan    2024-04-02  1969  
a150345aa75849 Bard Liao            2022-06-14  1970  				if (w->widget->sname &&
a150345aa75849 Bard Liao            2022-06-14  1971  				    strcmp(w->widget->sname, swidget->widget->sname))
a150345aa75849 Bard Liao            2022-06-14  1972  					continue;
a150345aa75849 Bard Liao            2022-06-14  1973  
a150345aa75849 Bard Liao            2022-06-14  1974  				dai = w->private;
a150345aa75849 Bard Liao            2022-06-14  1975  				alh_copier = (struct sof_ipc4_copier *)dai->private;
a150345aa75849 Bard Liao            2022-06-14  1976  				alh_data = &alh_copier->data;
f0caa4fc244ca7 Ranjani Sridharan    2024-04-02  1977  				node_type = SOF_IPC4_GET_NODE_TYPE(alh_data->gtw_cfg.node_id);
f0caa4fc244ca7 Ranjani Sridharan    2024-04-02  1978  				blob->alh_cfg.mapping[i].device = SOF_IPC4_NODE_TYPE(node_type);
f0caa4fc244ca7 Ranjani Sridharan    2024-04-02  1979  				blob->alh_cfg.mapping[i].device |=
f0caa4fc244ca7 Ranjani Sridharan    2024-04-02  1980  					SOF_IPC4_NODE_INDEX(alh_copier->dai_index);
17386cb1b48b0d Bard Liao            2024-04-02  1981  
17386cb1b48b0d Bard Liao            2024-04-02  1982  				/*
17386cb1b48b0d Bard Liao            2024-04-02  1983  				 * The mapping[i] device in ALH blob should be the same as the
17386cb1b48b0d Bard Liao            2024-04-02  1984  				 * dma_config_tlv[i] mapping device if a dma_config_tlv is present.
17386cb1b48b0d Bard Liao            2024-04-02  1985  				 * The device id will be used for DMA tlv mapping purposes.
17386cb1b48b0d Bard Liao            2024-04-02  1986  				 */
17386cb1b48b0d Bard Liao            2024-04-02  1987  				if (ipc4_copier->dma_config_tlv[i].length) {
17386cb1b48b0d Bard Liao            2024-04-02  1988  					dma_config = &ipc4_copier->dma_config_tlv[i].dma_config;
17386cb1b48b0d Bard Liao            2024-04-02  1989  					blob->alh_cfg.mapping[i].device =
17386cb1b48b0d Bard Liao            2024-04-02  1990  						dma_config->dma_stream_channel_map.mapping[0].device;
17386cb1b48b0d Bard Liao            2024-04-02  1991  				}
17386cb1b48b0d Bard Liao            2024-04-02  1992  
0390a102cc18cb Bard Liao            2023-01-25  1993  				/*
0390a102cc18cb Bard Liao            2023-01-25  1994  				 * Set the same channel mask for playback as the audio data is
0390a102cc18cb Bard Liao            2023-01-25  1995  				 * duplicated for all speakers. For capture, split the channels
0390a102cc18cb Bard Liao            2023-01-25  1996  				 * among the aggregated DAIs. For example, with 4 channels on 2
0390a102cc18cb Bard Liao            2023-01-25  1997  				 * aggregated DAIs, the channel_mask should be 0x3 and 0xc for the
0390a102cc18cb Bard Liao            2023-01-25  1998  				 * two DAI's.
0390a102cc18cb Bard Liao            2023-01-25  1999  				 * The channel masks used depend on the cpu_dais used in the
0390a102cc18cb Bard Liao            2023-01-25  2000  				 * dailink at the machine driver level, which actually comes from
0390a102cc18cb Bard Liao            2023-01-25  2001  				 * the tables in soc_acpi files depending on the _ADR and devID
0390a102cc18cb Bard Liao            2023-01-25  2002  				 * registers for each codec.
0390a102cc18cb Bard Liao            2023-01-25  2003  				 */
0390a102cc18cb Bard Liao            2023-01-25  2004  				if (w->id == snd_soc_dapm_dai_in)
a150345aa75849 Bard Liao            2022-06-14  2005  					blob->alh_cfg.mapping[i].channel_mask = ch_mask;
0390a102cc18cb Bard Liao            2023-01-25  2006  				else
0390a102cc18cb Bard Liao            2023-01-25  2007  					blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
0390a102cc18cb Bard Liao            2023-01-25  2008  
a150345aa75849 Bard Liao            2022-06-14  2009  				i++;
a150345aa75849 Bard Liao            2022-06-14  2010  			}
e186e1f237c1e2 Pierre-Louis Bossart 2023-06-02  2011  			if (blob->alh_cfg.device_count > 1) {
a150345aa75849 Bard Liao            2022-06-14  2012  				int group_id;
a150345aa75849 Bard Liao            2022-06-14  2013  
4ee6fc271b59e8 Bard Liao            2022-08-22  2014  				group_id = ida_alloc_max(&alh_group_ida, ALH_MULTI_GTW_COUNT - 1,
a150345aa75849 Bard Liao            2022-06-14  2015  							 GFP_KERNEL);
a150345aa75849 Bard Liao            2022-06-14  2016  
a150345aa75849 Bard Liao            2022-06-14  2017  				if (group_id < 0)
a150345aa75849 Bard Liao            2022-06-14  2018  					return group_id;
a150345aa75849 Bard Liao            2022-06-14  2019  
a150345aa75849 Bard Liao            2022-06-14  2020  				/* add multi-gateway base */
a150345aa75849 Bard Liao            2022-06-14  2021  				group_id += ALH_MULTI_GTW_BASE;
a150345aa75849 Bard Liao            2022-06-14  2022  				copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
a150345aa75849 Bard Liao            2022-06-14  2023  				copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(group_id);
a150345aa75849 Bard Liao            2022-06-14  2024  			}
a45a4d4390b7a5 Bard Liao            2022-06-08  2025  		}
a45a4d4390b7a5 Bard Liao            2022-06-08  2026  	}
a45a4d4390b7a5 Bard Liao            2022-06-08  2027  	}
a45a4d4390b7a5 Bard Liao            2022-06-08  2028  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2029  	/* modify the input params for the next widget */
b679302526d637 Peter Ujfalusi       2024-05-03  2030  	ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
b679302526d637 Peter Ujfalusi       2024-05-03  2031  					&copier_data->out_format,
b679302526d637 Peter Ujfalusi       2024-05-03  2032  					BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
b679302526d637 Peter Ujfalusi       2024-05-03  2033  					BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
b679302526d637 Peter Ujfalusi       2024-05-03  2034  					BIT(SNDRV_PCM_HW_PARAM_RATE));
37ec7ab49f951e Kai Vehmanen         2023-03-16  2035  	if (ret)
37ec7ab49f951e Kai Vehmanen         2023-03-16  2036  		return ret;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2037  
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2038  	/*
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2039  	 * Set the gateway dma_buffer_size to 2ms buffer size to meet the FW expectation. In the
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2040  	 * deep buffer case, set the dma_buffer_size depending on the deep_buffer_dma_ms set
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2041  	 * in topology.
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2042  	 */
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2043  	switch (swidget->id) {
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2044  	case snd_soc_dapm_dai_in:
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2045  		copier_data->gtw_cfg.dma_buffer_size =
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2046  			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.ibs;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2047  		break;
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2048  	case snd_soc_dapm_aif_in:
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2049  		copier_data->gtw_cfg.dma_buffer_size =
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2050  			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2051  				copier_data->base_config.ibs;
642d1de63cea16 Yong Zhi             2023-09-14  2052  		dev_dbg(sdev->dev, "copier %s, dma buffer%s: %u ms (%u bytes)",
642d1de63cea16 Yong Zhi             2023-09-14  2053  			swidget->widget->name,
642d1de63cea16 Yong Zhi             2023-09-14  2054  			deep_buffer_dma_ms ? " (using Deep Buffer)" : "",
642d1de63cea16 Yong Zhi             2023-09-14  2055  			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms),
642d1de63cea16 Yong Zhi             2023-09-14  2056  			copier_data->gtw_cfg.dma_buffer_size);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2057  		break;
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2058  	case snd_soc_dapm_dai_out:
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2059  	case snd_soc_dapm_aif_out:
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2060  		copier_data->gtw_cfg.dma_buffer_size =
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2061  			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.obs;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2062  		break;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2063  	default:
594c1bb9ff7365 Ranjani Sridharan    2023-03-13  2064  		break;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2065  	}
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2066  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2067  	data = &ipc4_copier->copier_config;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2068  	ipc_config_size = &ipc4_copier->ipc_config_size;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2069  	ipc_config_data = &ipc4_copier->ipc_config_data;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2070  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2071  	/* config_length is DWORD based */
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2072  	gtw_cfg_config_length = copier_data->gtw_cfg.config_length * 4;
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2073  	ipc_size = sizeof(*copier_data) + gtw_cfg_config_length;
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2074  
e9c6b118de1afc Bard Liao            2024-04-02  2075  	dma_config_tlv_size = 0;
e9c6b118de1afc Bard Liao            2024-04-02  2076  	for (i = 0; i < SOF_IPC4_DMA_DEVICE_MAX_COUNT; i++) {
e9c6b118de1afc Bard Liao            2024-04-02  2077  		if (ipc4_copier->dma_config_tlv[i].type != SOF_IPC4_GTW_DMA_CONFIG_ID)
e9c6b118de1afc Bard Liao            2024-04-02  2078  			continue;
e9c6b118de1afc Bard Liao            2024-04-02  2079  		dma_config_tlv_size += ipc4_copier->dma_config_tlv[i].length;
e9c6b118de1afc Bard Liao            2024-04-02  2080  		dma_config_tlv_size +=
e9c6b118de1afc Bard Liao            2024-04-02  2081  			ipc4_copier->dma_config_tlv[i].dma_config.dma_priv_config_size;
e9c6b118de1afc Bard Liao            2024-04-02  2082  		dma_config_tlv_size += (sizeof(ipc4_copier->dma_config_tlv[i]) -
e9c6b118de1afc Bard Liao            2024-04-02  2083  			sizeof(ipc4_copier->dma_config_tlv[i].dma_config));
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2084  	}
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2085  
e9c6b118de1afc Bard Liao            2024-04-02  2086  	if (dma_config_tlv_size) {
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2087  		ipc_size += dma_config_tlv_size;
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2088  
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2089  		/* we also need to increase the size at the gtw level */
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2090  		copier_data->gtw_cfg.config_length += dma_config_tlv_size / 4;
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2091  	}
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2092  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2093  	dev_dbg(sdev->dev, "copier %s, IPC size is %d", swidget->widget->name, ipc_size);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2094  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2095  	*ipc_config_data = kzalloc(ipc_size, GFP_KERNEL);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2096  	if (!*ipc_config_data)
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2097  		return -ENOMEM;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2098  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2099  	*ipc_config_size = ipc_size;
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2100  
e6475ce253187d Peter Ujfalusi       2023-08-09  2101  	/* update pipeline memory usage */
e6475ce253187d Peter Ujfalusi       2023-08-09  2102  	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
e6475ce253187d Peter Ujfalusi       2023-08-09  2103  
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2104  	/* copy IPC data */
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2105  	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2106  	if (gtw_cfg_config_length)
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2107  		memcpy(*ipc_config_data + sizeof(*copier_data),
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2108  		       *data, gtw_cfg_config_length);
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2109  
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2110  	/* add DMA Config TLV, if configured */
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2111  	if (dma_config_tlv_size)
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2112  		memcpy(*ipc_config_data + sizeof(*copier_data) +
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2113  		       gtw_cfg_config_length,
a0659f81c34894 Pierre-Louis Bossart 2023-06-02  2114  		       &ipc4_copier->dma_config_tlv, dma_config_tlv_size);
904c48c40c66c5 Ranjani Sridharan    2022-06-08  2115  
ef8a29bae82fc6 Pierre-Louis Bossart 2023-08-07  2116  	/*
ef8a29bae82fc6 Pierre-Louis Bossart 2023-08-07  2117  	 * Restore gateway config length now that IPC payload is prepared. This avoids
ef8a29bae82fc6 Pierre-Louis Bossart 2023-08-07  2118  	 * counting the DMA CONFIG TLV multiple times
ef8a29bae82fc6 Pierre-Louis Bossart 2023-08-07  2119  	 */
ef8a29bae82fc6 Pierre-Louis Bossart 2023-08-07  2120  	copier_data->gtw_cfg.config_length = gtw_cfg_config_length / 4;
ef8a29bae82fc6 Pierre-Louis Bossart 2023-08-07  2121  
711d0427c7134c Bard Liao            2022-07-15  2122  	return 0;
4f838ab2081260 Ranjani Sridharan    2022-06-08 @2123  }
4f838ab2081260 Ranjani Sridharan    2022-06-08  2124  

:::::: The code at line 2123 was first introduced by commit
:::::: 4f838ab2081260119677df3ba94dbbd4f8cb7183 ASoC: SOF: ipc4-topology: Add support for parsing and preparing pga widgets

:::::: TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
