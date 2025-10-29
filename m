Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65369253F39
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 04:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761712812; cv=none; b=NVZ1Sn/P2NQrXy/jOXUkAVTfjpvwcwFTAu/5qVygITL+eYO04RtjEUezHyts0NuN0kbd0KD+QqDAl6oEnOP2gOLHLDvkMin2A5oDp0dw4p5sUtT/zP4s/hRcfNpJaBExtYsHofyoH8H0iKQitx4jbboJndeZ2AP8XSY2qv/wZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761712812; c=relaxed/simple;
	bh=cKqcGjrYhMT+I8QcNJCv6Dods1FDD2AHVdz33ezGbZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEiiVh2vcl6JicVkyS5uP6ME6PkA608GkNjmAGLVM8fctWOaXznePen18laXETQA4eksuS+UJvCQ4k8YcvjcNOhflObljDQjbOMUCA1qBEIZgdsGp/bDjQSIHzvdcz/PIZB+/9t13+JYkIvbRb3tSGHrKT8JkiuEnmu6eNU2djQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGvkXulv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGvkXulv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761712810; x=1793248810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKqcGjrYhMT+I8QcNJCv6Dods1FDD2AHVdz33ezGbZQ=;
  b=mGvkXulvR88Gocn3bjNoWmyv9mjU81cjAIW04CRRXBCsiSU/Y71luac6
   zH8bgRdLKyuAXH0sVPsRBLOas/XjA1p9J9Kn66LvJSoTUh+LfEhzklCmj
   1kSWUFMZp8YIu/LpFn7CSSz8/HRYtdqn8OB+QZ7OKm3VEOCq6z9yshxef
   E4VOVmn0QYHd8e81yy0xjRAUBT2DzlePCD4skO70Tg1saCWXsjYWJCb1a
   x1VzMpFPmdfXP8DvpaXGhzOpcLhrDoQtf7jUh0sAg/AzFl2K+wIl1ep7H
   Ql/KzgIkf6vXfLZJ9PHIlwohFEYTk3IE6JyEzevbg8cE2lX7kDaxOU16u
   w==;
X-CSE-ConnectionGUID: h7vFIpcfQKeGclHCA8pBUA==
X-CSE-MsgGUID: SIvYz/VMT/2or5oZq1S2qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51397672"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="51397672"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:40:09 -0700
X-CSE-ConnectionGUID: 5HfhR5mGSimfBIuQxNzMRw==
X-CSE-MsgGUID: YVE5/5iFQoqZR43sLREvCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190730481"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Oct 2025 21:40:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDxxi-000K8u-0N;
	Wed, 29 Oct 2025 04:39:26 +0000
Date: Wed, 29 Oct 2025 12:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/tas2783-sdw.c:814 tas2783_fw_ready() error:
 uninitialized symbol 'ret'.
Message-ID: <202510291226.2R3fbYNh-lkp@intel.com>
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
TO: Niranjan H Y <niranjan.hy@ti.com>
CC: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8eefed8f65cc17c31fdf4ab32292b794b34893ad
commit: 4cc9bd8d7b32d59b86cb489a96aa8a7b9dd6a21b ASoc: tas2783A: Add soundwire based codec driver
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291226.2R3fbYNh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510291226.2R3fbYNh-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/tas2783-sdw.c:814 tas2783_fw_ready() error: uninitialized symbol 'ret'.
sound/soc/codecs/tas2783-sdw.c:848 tas_fu21_event() error: uninitialized symbol 'mute'.
sound/soc/codecs/tas2783-sdw.c:870 tas_fu23_event() error: uninitialized symbol 'mute'.

Old smatch warnings:
sound/soc/codecs/tas2783-sdw.c:1288 tas_sdw_probe() warn: passing zero to 'PTR_ERR'

vim +/ret +814 sound/soc/codecs/tas2783-sdw.c

4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  747  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  748  static void tas2783_fw_ready(const struct firmware *fmw, void *context)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  749  {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  750  	struct tas2783_prv *tas_dev =
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  751  		(struct tas2783_prv *)context;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  752  	const u8 *buf = NULL;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  753  	s32 offset = 0, img_sz, file_blk_size, ret;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  754  	struct bin_header_t hdr;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  755  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  756  	if (!fmw || !fmw->data) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  757  		/* No firmware binary, devices will work in ROM mode. */
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  758  		dev_err(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  759  			"Failed to read %s, no side-effect on driver running\n",
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  760  			tas_dev->rca_binaryname);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  761  		ret = -EINVAL;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  762  		goto out;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  763  	}
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  764  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  765  	mutex_lock(&tas_dev->pde_lock);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  766  	img_sz = fmw->size;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  767  	buf = fmw->data;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  768  	offset += FW_DL_OFFSET;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  769  	while (offset < (img_sz - FW_FL_HDR)) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  770  		memset(&hdr, 0, sizeof(hdr));
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  771  		offset += read_header(&buf[offset], &hdr);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  772  		dev_dbg(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  773  			"vndr=%d, file=%d, version=%d, len=%d, off=%d\n",
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  774  			hdr.vendor_id, hdr.file_id, hdr.version,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  775  			hdr.length, offset);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  776  		/* size also includes the header */
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  777  		file_blk_size = hdr.length - FW_FL_HDR;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  778  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  779  		switch (hdr.file_id) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  780  		case 0:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  781  			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  782  					       PRAM_ADDR_START, file_blk_size,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  783  					       &buf[offset]);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  784  			if (ret < 0)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  785  				dev_err(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  786  					"PRAM update failed: %d", ret);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  787  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  788  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  789  		case 1:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  790  			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  791  					       YRAM_ADDR_START, file_blk_size,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  792  					       &buf[offset]);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  793  			if (ret < 0)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  794  				dev_err(tas_dev->dev,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  795  					"YRAM update failed: %d", ret);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  796  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  797  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  798  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  799  		default:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  800  			ret = -EINVAL;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  801  			dev_err(tas_dev->dev, "Unsupported file");
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  802  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  803  		}
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  804  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  805  		if (ret == 0)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  806  			offset += file_blk_size;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  807  		else
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  808  			break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  809  	};
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  810  	mutex_unlock(&tas_dev->pde_lock);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  811  	tas2783_update_calibdata(tas_dev);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  812  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  813  out:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12 @814  	if (!ret)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  815  		tas_dev->fw_dl_success = true;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  816  	tas_dev->fw_dl_task_done = true;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  817  	wake_up(&tas_dev->fw_wait);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  818  	if (fmw)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  819  		release_firmware(fmw);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  820  }
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  821  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  822  static inline s32 tas_clear_latch(struct tas2783_prv *priv)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  823  {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  824  	return regmap_update_bits(priv->regmap,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  825  				  TASDEV_REG_SDW(0, 0, 0x5c),
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  826  				  0x04, 0x04);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  827  }
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  828  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  829  static s32 tas_fu21_event(struct snd_soc_dapm_widget *w,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  830  			  struct snd_kcontrol *k, s32 event)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  831  {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  832  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  833  	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  834  	s32 mute;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  835  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  836  	switch (event) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  837  	case SND_SOC_DAPM_POST_PMU:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  838  		mute = 0;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  839  		break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  840  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  841  	case SND_SOC_DAPM_PRE_PMD:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  842  		mute = 1;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  843  		break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  844  	}
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  845  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  846  	return sdw_write_no_pm(tas_dev->sdw_peripheral,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  847  			       SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU21,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12 @848  					    TAS2783_SDCA_CTL_FU_MUTE, 1), mute);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  849  }
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  850  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  851  static s32 tas_fu23_event(struct snd_soc_dapm_widget *w,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  852  			  struct snd_kcontrol *k, s32 event)
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  853  {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  854  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  855  	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  856  	s32 mute;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  857  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  858  	switch (event) {
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  859  	case SND_SOC_DAPM_POST_PMU:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  860  		mute = 0;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  861  		break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  862  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  863  	case SND_SOC_DAPM_PRE_PMD:
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  864  		mute = 1;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  865  		break;
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  866  	}
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  867  
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  868  	return sdw_write_no_pm(tas_dev->sdw_peripheral,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  869  			       SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23,
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12 @870  					    TAS2783_SDCA_CTL_FU_MUTE, 1), mute);
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  871  }
4cc9bd8d7b32d5 Niranjan H Y 2025-09-12  872  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
