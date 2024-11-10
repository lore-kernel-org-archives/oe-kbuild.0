Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE7422615
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 01:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731200950; cv=none; b=neoqH4Nv69fwUcix12PwmutpRgqAHZaIH3J0xiyniofj36DqcDqGfVij0b9bmAUTDXb1K+D5Fg0ZH48W+Ubr3zW5kT9CKWeChYDhDbj4lGk2Y8O4MZ3BTx896c5OvKl/YcQ+GtOUKyU6T3hftHk1oOl7Q8yocXWvtk7kY8I5h3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731200950; c=relaxed/simple;
	bh=LwqTXS67BX8nB1RZfzTmU4H6SLinY5fUv7JO/7RqTQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6irSFqIM3+iSH+BgouMYYw5K7L4Pc5P2mMUe6MoWoCFshGWhUVoOwhS/mEQNdxQVa7YDHnicRJE+Cn8/7qX1fzj+pUQ8K/BE45yZ5nQpMTf4qk2tU7XFlVvc1OR5outcv50mOL/vlmE0YOFvfvQY+rpE33Nu1KE/UpN3Si8dXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArbbPkls; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArbbPkls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731200949; x=1762736949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwqTXS67BX8nB1RZfzTmU4H6SLinY5fUv7JO/7RqTQA=;
  b=ArbbPklsRHC56drRgkCFWoABRb0+PPI9Nedr2vbTIfnK/l2WqobB6fBG
   umu4+iciMerdyolBAbqJ+Qho09sAu3PqSWbL9Ju4j1XihGQA5Tv4zBxfY
   hXsIEx0n0TwKHaKWAv3MXrnMnAeRFBR9Pqlkei2ITJLbIPlsSBdzg21u0
   p0xHEQ1i9HzDyFeZp9t8N4WQAyyCwKxLPNU1V+GvJDO8oQSflipSfu7Jb
   qm6bofhR1z7ap6RiDhcQ/3PLCjf/9IzxLC+lh8C79MsLHBIjhmbnTRr3s
   uANPNKgg1oEvJkQisOuZ9BBwttLOZse2mbVaoLFPMvFgKyM1jC8+4mgET
   w==;
X-CSE-ConnectionGUID: sXro1Fg2QP6VPf7tgEipuw==
X-CSE-MsgGUID: 6quiHBa/TkaTvlyQsstqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53610189"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53610189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 17:09:08 -0800
X-CSE-ConnectionGUID: DxSIayh/RVae/WHO7ZHbeQ==
X-CSE-MsgGUID: EaxvFqGdTieCwtnqXub2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86159617"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 17:09:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9wRs-000so2-0S;
	Sun, 10 Nov 2024 01:09:04 +0000
Date: Sun, 10 Nov 2024 09:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-cleanup-2024-11-08 64/70] sound/soc/soc-core.c:1485
 snd_soc_runtime_set_dai_fmt() error: uninitialized symbol 'ret'.
Message-ID: <202411100830.bgjHCvBu-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-cleanup-2024-11-08
head:   e9ab69de24b2818ae26f88e606ccea272bfa1705
commit: 01b4cc0d22025e9acb81886a3b136e67375f5df2 [64/70] ASoC: soc-core: use soc_core_ret()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241109 (https://download.01.org/0day-ci/archive/20241110/202411100830.bgjHCvBu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411100830.bgjHCvBu-lkp@intel.com/

New smatch warnings:
sound/soc/soc-core.c:1485 snd_soc_runtime_set_dai_fmt() error: uninitialized symbol 'ret'.

Old smatch warnings:
sound/soc/soc-core.c:1704 soc_probe_link_dais() error: uninitialized symbol 'ret'.
sound/soc/soc-core.c:1744 soc_probe_link_components() error: uninitialized symbol 'ret'.
sound/soc/soc-core.c:1795 soc_probe_aux_devices() error: uninitialized symbol 'ret'.

vim +/ret +1485 sound/soc/soc-core.c

ba9e82a1c89193 Kuninori Morimoto 2021-05-27  1445  
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1446  /**
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1447   * snd_soc_runtime_set_dai_fmt() - Change DAI link format for a ASoC runtime
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1448   * @rtd: The runtime for which the DAI link format should be changed
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1449   * @dai_fmt: The new DAI link format
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1450   *
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1451   * This function updates the DAI link format for all DAIs connected to the DAI
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1452   * link for the specified runtime.
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1453   *
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1454   * Note: For setups with a static format set the dai_fmt field in the
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1455   * corresponding snd_dai_link struct instead of using this function.
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1456   *
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1457   * Returns 0 on success, otherwise a negative error code.
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1458   */
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1459  int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1460  				unsigned int dai_fmt)
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1461  {
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1462  	struct snd_soc_dai *cpu_dai;
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1463  	struct snd_soc_dai *codec_dai;
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1464  	unsigned int i;
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1465  	int ret;
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1466  
7db07e37e13cfd Kuninori Morimoto 2021-10-18  1467  	if (!dai_fmt)
7db07e37e13cfd Kuninori Morimoto 2021-10-18  1468  		return 0;
7db07e37e13cfd Kuninori Morimoto 2021-10-18  1469  
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1470  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1471  		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1472  		if (ret != 0 && ret != -ENOTSUPP)
01b4cc0d22025e Kuninori Morimoto 2024-11-08  1473  			goto err;
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1474  	}
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1475  
6c076273a326cc Charles Keepax    2022-05-19  1476  	/* Flip the polarity for the "CPU" end of link */
6c076273a326cc Charles Keepax    2022-05-19  1477  	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
b44a67f8936659 Kuninori Morimoto 2021-06-14  1478  
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1479  	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
6c076273a326cc Charles Keepax    2022-05-19  1480  		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1481  		if (ret != 0 && ret != -ENOTSUPP)
01b4cc0d22025e Kuninori Morimoto 2024-11-08  1482  			goto err;
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1483  	}
01b4cc0d22025e Kuninori Morimoto 2024-11-08  1484  err:
01b4cc0d22025e Kuninori Morimoto 2024-11-08 @1485  	return soc_core_ret(rtd->dev, ret);
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1486  }
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1487  EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
4d1a98b5f1abaa Kuninori Morimoto 2021-05-27  1488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
