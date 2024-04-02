Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE1617BBE
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712033743; cv=none; b=MUPcSOq088emv+2s5nSjqkCbggoT/DdiN/a5QgP1+Bwq99IhCrwxbmbu6QYMJT9el7EKTW77K871JKpl5xxr96Ga98ZkqxwnNliqLUpypKNPQ0wcW/qKjVD0epce9YvrndKN/lZ6ze4k9/AeEsQ2ojHN7sMGOnsFzIXne4ecIhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712033743; c=relaxed/simple;
	bh=h2qXPvrGW9yNzkryvEGlUIt5D/NX+PgjxxXeC2eXkdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcfQiYtj/lSURERKoMcsLpH6g+rnLgRxCgSy5zgt9ctWBdIztA85QiTd5B5hlg6sYdoatMJUH1VcqmWlQdx6e4T2BZCHYeQBuLrefEj7e6vt2rC7zrQm4Jp7TxcTFZGS6f1dedR6dRzaxlIUnR08yGP0nA0IxM4/hRXUwYXuxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb7cEVEZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb7cEVEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712033741; x=1743569741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2qXPvrGW9yNzkryvEGlUIt5D/NX+PgjxxXeC2eXkdE=;
  b=hb7cEVEZRknOCS6jAm1ES0UhAcLlMImLc+r0exQPXnPULz6liT/jH779
   E4kgjkMGoUovf3cbRoFf8vijH+JpsojKHqXlK434XxqmzS6bLPgAPVuTm
   3cqFqA5Bw0Hxssi0CLKDbu+5xCnuLKVG7y0I8X7XC+afK/aeCxQJfV4Cx
   +t5ZXuxrs7m7546dN8L+H48VOS/oouzV9hnhcLdwEs4m+spTmT+4BoFn+
   De/pfEbHBLNIF04V6fi4I0lABS37AmPI69kIeoaxNU0SQuRBB+4BehzsO
   0MVY1CDDH6rBewB2SdBJTzA2cquQwgg6pzInhQDBB14Hq9irz6QNJX9oE
   w==;
X-CSE-ConnectionGUID: XcQEIO2MTuyeYv2qnHcW6Q==
X-CSE-MsgGUID: Dr5mcOCQQIGFjxKTp4fKRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7339618"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7339618"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 21:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="48942935"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Apr 2024 21:55:38 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrWBM-0000sP-0y;
	Tue, 02 Apr 2024 04:55:36 +0000
Date: Tue, 2 Apr 2024 12:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 3/4] ASoc: PCM6240: Add compile item for PCM6240
 Family driver
Message-ID: <202404021225.mx5KlUlV-lkp@intel.com>
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
In-Reply-To: <20240331021835.1470-4-shenghao-ding@ti.com>
References: <20240331021835.1470-4-shenghao-ding@ti.com>
TO: Shenghao Ding <shenghao-ding@ti.com>
TO: linux-kernel@vger.kernel.org
CC: lgirdwood@gmail.com
CC: broonie@kernel.org
CC: robh+dt@kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: conor+dt@kernel.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: perex@perex.cz
CC: tiwai@suse.com
CC: 13916275206@139.com
CC: mohit.chawla@ti.com
CC: soyer@irl.hu
CC: jkhuang3@ti.com
CC: tiwai@suse.de
CC: pdjuandi@ti.com
CC: manisha.agrawal@ti.com
CC: s-hari@ti.com
CC: aviel@ti.com
CC: hnagalla@ti.com
CC: praneeth@ti.com
CC: Baojun.Xu@fpt.com
CC: Shenghao Ding <shenghao-ding@ti.com>

Hi Shenghao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.9-rc1]
[also build test WARNING on linus/master next-20240328]
[cannot apply to broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoc-PCM6240-Create-PCM6240-Family-driver-code/20240331-102303
base:   v6.9-rc1
patch link:    https://lore.kernel.org/r/20240331021835.1470-4-shenghao-ding%40ti.com
patch subject: [PATCH v7 3/4] ASoc: PCM6240: Add compile item for PCM6240 Family driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r081-20240402 (https://download.01.org/0day-ci/archive/20240402/202404021225.mx5KlUlV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404021225.mx5KlUlV-lkp@intel.com/

smatch warnings:
sound/soc/codecs/pcm6240.c:1577 pcmdevice_comp_probe() warn: 'fw_entry' from request_firmware() not released on lines: 1577.
sound/soc/codecs/pcm6240.c:1715 pcmdevice_process_block() warn: inconsistent indenting

vim +/fw_entry +1577 sound/soc/codecs/pcm6240.c

051d749b6eaeb0 Shenghao Ding 2024-03-31  1514  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1515  static int pcmdevice_comp_probe(struct snd_soc_component *comp)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1516  {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1517  	struct pcmdevice_priv *pcm_dev = snd_soc_component_get_drvdata(comp);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1518  	struct i2c_adapter *adap = pcm_dev->client->adapter;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1519  	const struct firmware *fw_entry = NULL;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1520  	int ret, i, j;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1521  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1522  	mutex_lock(&pcm_dev->codec_lock);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1523  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1524  	pcm_dev->component = comp;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1525  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1526  	for (i = 0; i < pcm_dev->ndev; i++) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1527  		for (j = 0; j < 2; j++) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1528  			ret = pcmdev_gain_ctrl_add(pcm_dev, i, j);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1529  			if (ret < 0)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1530  				goto out;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1531  		}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1532  	}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1533  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1534  	if (comp->name_prefix) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1535  	/* There's name_prefix defined in DTS. Bin file name will be
051d749b6eaeb0 Shenghao Ding 2024-03-31  1536  	 * name_prefix.bin stores the firmware including register setting and
051d749b6eaeb0 Shenghao Ding 2024-03-31  1537  	 * params for different filters inside chips, it must be copied into
051d749b6eaeb0 Shenghao Ding 2024-03-31  1538  	 * firmware folder. The same types of pcmdevices sitting on the same
051d749b6eaeb0 Shenghao Ding 2024-03-31  1539  	 * i2c bus will be aggregated as one single codec, all of them share
051d749b6eaeb0 Shenghao Ding 2024-03-31  1540  	 * the same bin file.
051d749b6eaeb0 Shenghao Ding 2024-03-31  1541  	 */
051d749b6eaeb0 Shenghao Ding 2024-03-31  1542  		scnprintf(pcm_dev->bin_name, PCMDEVICE_BIN_FILENAME_LEN,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1543  			"%s.bin", comp->name_prefix);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1544  	} else {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1545  	/* There's NO name_prefix defined in DTS. Bin file name will be
051d749b6eaeb0 Shenghao Ding 2024-03-31  1546  	 * device-name[defined in pcmdevice_i2c_id]-i2c-bus_id[0,1,...,N]-
051d749b6eaeb0 Shenghao Ding 2024-03-31  1547  	 * sum[1,...,4]dev.bin stores the firmware including register setting
051d749b6eaeb0 Shenghao Ding 2024-03-31  1548  	 * and params for different filters inside chips, it must be copied
051d749b6eaeb0 Shenghao Ding 2024-03-31  1549  	 * into firmware folder. The same types of pcmdevices sitting on the
051d749b6eaeb0 Shenghao Ding 2024-03-31  1550  	 * same i2c bus will be aggregated as one single codec, all of them
051d749b6eaeb0 Shenghao Ding 2024-03-31  1551  	 * share the same bin file.
051d749b6eaeb0 Shenghao Ding 2024-03-31  1552  	 */
051d749b6eaeb0 Shenghao Ding 2024-03-31  1553  		scnprintf(pcm_dev->bin_name, PCMDEVICE_BIN_FILENAME_LEN,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1554  			"%s-i2c-%d-%udev.bin", pcm_dev->dev_name, adap->nr,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1555  			pcm_dev->ndev);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1556  	}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1557  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1558  	ret = request_firmware(&fw_entry, pcm_dev->bin_name, pcm_dev->dev);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1559  	if (ret) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1560  		dev_err(pcm_dev->dev, "%s: request %s err = %d\n", __func__,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1561  			pcm_dev->bin_name, ret);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1562  		goto out;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1563  	}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1564  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1565  	ret = pcmdev_regbin_ready(fw_entry, pcm_dev);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1566  	if (ret) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1567  		dev_err(pcm_dev->dev, "%s: %s parse err = %d\n", __func__,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1568  			pcm_dev->bin_name, ret);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1569  		goto out;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1570  	}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1571  	ret = pcmdev_profile_ctrl_add(pcm_dev);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1572  out:
051d749b6eaeb0 Shenghao Ding 2024-03-31  1573  	if (fw_entry)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1574  		release_firmware(fw_entry);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1575  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1576  	mutex_unlock(&pcm_dev->codec_lock);
051d749b6eaeb0 Shenghao Ding 2024-03-31 @1577  	return ret;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1578  }
051d749b6eaeb0 Shenghao Ding 2024-03-31  1579  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1580  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1581  static void pcmdevice_comp_remove(struct snd_soc_component *codec)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1582  {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1583  	struct pcmdevice_priv *pcm_dev = snd_soc_component_get_drvdata(codec);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1584  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1585  	if (!pcm_dev)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1586  		return;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1587  	mutex_lock(&pcm_dev->codec_lock);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1588  	pcmdevice_config_info_remove(pcm_dev);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1589  	mutex_unlock(&pcm_dev->codec_lock);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1590  }
051d749b6eaeb0 Shenghao Ding 2024-03-31  1591  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1592  static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1593  	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1594  	SND_SOC_DAPM_AIF_OUT("ASI1 OUT", "ASI1 Capture",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1595  		0, SND_SOC_NOPM, 0, 0),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1596  	SND_SOC_DAPM_OUTPUT("OUT"),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1597  	SND_SOC_DAPM_INPUT("MIC"),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1598  };
051d749b6eaeb0 Shenghao Ding 2024-03-31  1599  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1600  static const struct snd_soc_dapm_route pcmdevice_audio_map[] = {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1601  	{"OUT", NULL, "ASI"},
051d749b6eaeb0 Shenghao Ding 2024-03-31  1602  	{"ASI1 OUT", NULL, "MIC"},
051d749b6eaeb0 Shenghao Ding 2024-03-31  1603  };
051d749b6eaeb0 Shenghao Ding 2024-03-31  1604  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1605  static const struct snd_soc_component_driver
051d749b6eaeb0 Shenghao Ding 2024-03-31  1606  	soc_codec_driver_pcmdevice = {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1607  	.probe			= pcmdevice_comp_probe,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1608  	.remove			= pcmdevice_comp_remove,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1609  	.dapm_widgets		= pcmdevice_dapm_widgets,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1610  	.num_dapm_widgets	= ARRAY_SIZE(pcmdevice_dapm_widgets),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1611  	.dapm_routes		= pcmdevice_audio_map,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1612  	.num_dapm_routes	= ARRAY_SIZE(pcmdevice_audio_map),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1613  	.suspend_bias_off	= 1,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1614  	.idle_bias_on		= 0,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1615  	.use_pmdown_time	= 1,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1616  	.endianness		= 1,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1617  };
051d749b6eaeb0 Shenghao Ding 2024-03-31  1618  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1619  static int pcmdevice_process_block(void *ctxt, unsigned char *data,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1620  	unsigned char dev_idx, int sublocksize)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1621  {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1622  	struct pcmdevice_priv *pcm_dev = (struct pcmdevice_priv *)ctxt;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1623  	int subblk_offset = 2, chn, chnend, ret;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1624  	unsigned char subblk_typ = data[1];
051d749b6eaeb0 Shenghao Ding 2024-03-31  1625  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1626  	if (dev_idx) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1627  		chn = dev_idx - 1;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1628  		chnend = dev_idx;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1629  	} else {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1630  		chn = 0;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1631  		chnend = pcm_dev->ndev;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1632  	}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1633  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1634  	for (; chn < chnend; chn++) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1635  		switch (subblk_typ) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1636  		case PCMDEVICE_CMD_SING_W: {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1637  			unsigned short len = get_unaligned_be16(&data[2]);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1638  			int i = 0;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1639  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1640  			subblk_offset += 2;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1641  			if (subblk_offset + 4 * len > sublocksize) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1642  				dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1643  					"%s: byt wr out of boundary\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1644  					__func__);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1645  				break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1646  			}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1647  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1648  			for (i = 0; i < len; i++) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1649  				ret = pcmdev_dev_write(pcm_dev, chn,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1650  					PCMDEVICE_REG(data[subblk_offset + 1],
051d749b6eaeb0 Shenghao Ding 2024-03-31  1651  						data[subblk_offset + 2]),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1652  					data[subblk_offset + 3]);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1653  				if (ret < 0)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1654  					dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1655  						"%s: single write error\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1656  						__func__);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1657  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1658  				subblk_offset += 4;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1659  			}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1660  		}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1661  		break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1662  		case PCMDEVICE_CMD_BURST: {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1663  			unsigned short len = get_unaligned_be16(&data[2]);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1664  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1665  			subblk_offset += 2;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1666  			if (subblk_offset + 4 + len > sublocksize) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1667  				dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1668  					"%s: burst Out of boundary\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1669  					__func__);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1670  				break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1671  			}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1672  			if (len % 4) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1673  				dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1674  					"%s: burst-len(%u) not div by 4\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1675  					__func__, len);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1676  				break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1677  			}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1678  			ret = pcmdev_dev_bulk_write(pcm_dev, chn,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1679  				PCMDEVICE_REG(data[subblk_offset + 1],
051d749b6eaeb0 Shenghao Ding 2024-03-31  1680  				data[subblk_offset + 2]),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1681  				&(data[subblk_offset + 4]), len);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1682  			if (ret < 0)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1683  				dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1684  					"%s: bulk_write err = %d\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1685  					__func__, ret);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1686  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1687  			subblk_offset += (len + 4);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1688  		}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1689  			break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1690  		case PCMDEVICE_CMD_DELAY: {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1691  			unsigned int delay_time = 0;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1692  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1693  			if (subblk_offset + 2 > sublocksize) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1694  				dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1695  					"%s: deley out of boundary\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1696  					__func__);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1697  				break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1698  			}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1699  			delay_time = get_unaligned_be16(&data[2]) * 1000;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1700  			usleep_range(delay_time, delay_time + 50);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1701  			subblk_offset += 2;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1702  		}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1703  			break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1704  		case PCMDEVICE_CMD_FIELD_W:
051d749b6eaeb0 Shenghao Ding 2024-03-31  1705  		if (subblk_offset + 6 > sublocksize) {
051d749b6eaeb0 Shenghao Ding 2024-03-31  1706  			dev_err(pcm_dev->dev,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1707  				"%s: bit write out of memory\n", __func__);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1708  			break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1709  		}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1710  			ret = pcmdev_dev_update_bits(pcm_dev, chn,
051d749b6eaeb0 Shenghao Ding 2024-03-31  1711  				PCMDEVICE_REG(data[subblk_offset + 3],
051d749b6eaeb0 Shenghao Ding 2024-03-31  1712  				data[subblk_offset + 4]),
051d749b6eaeb0 Shenghao Ding 2024-03-31  1713  				data[subblk_offset + 1],
051d749b6eaeb0 Shenghao Ding 2024-03-31  1714  				data[subblk_offset + 5]);
051d749b6eaeb0 Shenghao Ding 2024-03-31 @1715  		if (ret < 0)
051d749b6eaeb0 Shenghao Ding 2024-03-31  1716  			dev_err(pcm_dev->dev, "%s: update_bits err = %d\n",
051d749b6eaeb0 Shenghao Ding 2024-03-31  1717  				__func__, ret);
051d749b6eaeb0 Shenghao Ding 2024-03-31  1718  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1719  		subblk_offset += 6;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1720  			break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1721  		default:
051d749b6eaeb0 Shenghao Ding 2024-03-31  1722  			break;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1723  		}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1724  	}
051d749b6eaeb0 Shenghao Ding 2024-03-31  1725  
051d749b6eaeb0 Shenghao Ding 2024-03-31  1726  	return subblk_offset;
051d749b6eaeb0 Shenghao Ding 2024-03-31  1727  }
051d749b6eaeb0 Shenghao Ding 2024-03-31  1728  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
