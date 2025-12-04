Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD134F259
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764870086; cv=none; b=eM44Gu0rKNiD/fjQxK1fM+VLcQGZaTmqKX72zIxTAXZuXIv8Js7u80msitnTuoPhLKIt1uLhiO8ZU12DgW49bb8qOWM9dfLcGuDnsfoEBZknAALdUGsnChqtg72s83T10hNshOLUnMoMvRq9LxM09OpZBnYTo3tGPHAGq3bTSmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764870086; c=relaxed/simple;
	bh=FIxAOdyKWRFv/rVECzutiUKQrC362VI5jktHbyi0Pyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CmZkthvWGvVtsI+Y/1ccfM8pFsUxtQOLbLO5pkOevF93cZfYZs9v06tNuGTYD/kzvbuVOm2Uf/wVxRWHrXSZfXR6hLp1+CGMYrrY9eTdXdXB+ZP0kFogNp70O4Zu5tuxR18HdlHfi4wKsg6+2nz4sGcrM2nlSQvbJedMrmriO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnroLGNO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnroLGNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764870084; x=1796406084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIxAOdyKWRFv/rVECzutiUKQrC362VI5jktHbyi0Pyg=;
  b=dnroLGNOb1Wtwk9hBKRvUdyT/Z0vhISukHdBZ6GBwS0YG/As/1u2aokC
   rUHfk2jfXy5ErfS86vnM4olIFDe5Jb1GV8I5VCQSkZNmK+IfFqAh3m2X2
   bW+9eWm81ug7PkMaMAHdFxEWopreJr5Ll31Z2wemiykq5L3l/wSr1Pf10
   HmakYt8Rn5vE6wEZqk9zMsJ5Ax/of+HP5HgPW584hjUb0yq5jG9gAE5fa
   I3Ap7xrb5NpCixIzNPabgRFGb/S91bFqdsifI39le0KHfYbIJ4dSuVp+N
   x28Ez2vF8PU1GW/UZkVf0tUmOlgwTECw1lYwaFKjJ8OtRXwP91fgnObQg
   A==;
X-CSE-ConnectionGUID: qyy4EUavRTOiUSEDWHl1TA==
X-CSE-MsgGUID: YxxmE9tQT7GAsUdiHbkKFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92378358"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="92378358"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 09:41:24 -0800
X-CSE-ConnectionGUID: wv5Lp7y2TCG25f0lAGxPfQ==
X-CSE-MsgGUID: YS2hO9CSQoqWuWUakuGAWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="226021054"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2025 09:41:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRDKS-00000000E2H-24sp;
	Thu, 04 Dec 2025 17:41:20 +0000
Date: Fri, 5 Dec 2025 01:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8767/13363]
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:217 mtk_ddcm_read_hdmi() error:
 uninitialized symbol 'uc_read_count'.
Message-ID: <202512050141.7iVyjg3r-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc04acf4aeca588496124a6cf54bfce3db327039
commit: 8d0f798862731c62b09e7138a9032964d70566c2 [8767/13363] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-r072-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050141.7iVyjg3r-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512050141.7iVyjg3r-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:217 mtk_ddcm_read_hdmi() error: uninitialized symbol 'uc_read_count'.

vim +/uc_read_count +217 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c

8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  111  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  112  static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc, u16 uc_dev,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  113  			      u8 addr, u8 *puc_value, u16 data_cnt)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  114  {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  115  	u16 dly_cnt, i, uc_idx;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  116  	u32 rem, temp_length, uc_read_count, val;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  117  	u64 loop_counter;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  118  	int ret;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  119  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  120  	mtk_ddc_check_and_rise_low_bus(ddc);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  121  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  122  	regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  123  			   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLEAR_FIFO));
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  124  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  125  	if (data_cnt >= 16) {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  126  		temp_length = 16;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  127  		loop_counter = data_cnt;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  128  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  129  		rem = do_div(loop_counter, temp_length);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  130  		if (rem)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  131  			loop_counter++;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  132  	} else {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  133  		temp_length = data_cnt;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  134  		loop_counter = 1;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  135  	}
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  136  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  137  	if (uc_dev >= DDC_ADDR)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  138  		dly_cnt = DDC2_DLY_CNT_EDID;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  139  	else
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  140  		dly_cnt = DDC2_DLY_CNT;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  141  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  142  	regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  143  			   FIELD_PREP(HPD_DDC_DELAY_CNT, dly_cnt));
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  144  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  145  	for (i = 0; i < loop_counter; i++) {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  146  		rem = data_cnt % 16;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  147  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  148  		if (i > 0 && i == (loop_counter - 1) && rem)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  149  			temp_length = rem;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  150  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  151  		/* 0x51 - 0x53: Flow control */
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  152  		if (uc_dev > DDC_ADDR && uc_dev <= 0x53) {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  153  			regmap_update_bits(ddc->regs, SCDC_CTRL, SCDC_DDC_SEGMENT,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  154  					   FIELD_PREP(SCDC_DDC_SEGMENT, uc_dev - DDC_ADDR));
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  155  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  156  			regmap_write(ddc->regs, DDC_CTRL,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  157  				     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ENH_READ_NOACK) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  158  				     FIELD_PREP(DDC_CTRL_DIN_CNT, temp_length) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  159  				     FIELD_PREP(DDC_CTRL_OFFSET, addr + i * temp_length) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  160  				     FIELD_PREP(DDC_CTRL_ADDR, DDC_ADDR));
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  161  		} else {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  162  			u16 offset;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  163  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  164  			if (addr != 0x43)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  165  				offset = i * 16;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  166  			else
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  167  				offset = 0;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  168  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  169  			regmap_write(ddc->regs, DDC_CTRL,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  170  				     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_READ_NOACK) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  171  				     FIELD_PREP(DDC_CTRL_DIN_CNT, temp_length) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  172  				     FIELD_PREP(DDC_CTRL_OFFSET, addr + offset) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  173  				     FIELD_PREP(DDC_CTRL_ADDR, uc_dev));
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  174  		}
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  175  		usleep_range(5000, 5500);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  176  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  177  		ret = regmap_read_poll_timeout(ddc->regs, HPD_DDC_STATUS, val,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  178  					       !(val & DDC_I2C_IN_PROG), 1000,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  179  					       500 * (temp_length + 5));
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  180  		if (ret) {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  181  			dev_err(ddc->dev, "Timeout waiting for DDC I2C\n");
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  182  			return ret;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  183  		}
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  184  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  185  		ret = mtk_ddc_check_and_rise_low_bus(ddc);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  186  		if (ret) {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  187  			dev_err(ddc->dev, "Error during read operation: No ACK\n");
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  188  			return ret;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  189  		}
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  190  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  191  		for (uc_idx = 0; uc_idx < temp_length; uc_idx++) {
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  192  			unsigned int read_idx = i * 16 + uc_idx;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  193  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  194  			regmap_write(ddc->regs, SI2C_CTRL,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  195  				     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  196  				     SI2C_RD);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  197  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  198  			regmap_read(ddc->regs, HPD_DDC_STATUS, &val);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  199  			puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  200  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  201  			regmap_write(ddc->regs, SI2C_CTRL,
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  202  				     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  203  				     SI2C_CONFIRM_READ);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  204  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  205  			/*
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  206  			 * If HDMI IP gets reset during EDID read, DDC read
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  207  			 * operation will fail and its delay counter will be
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  208  			 * reset to 400.
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  209  			 */
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  210  			regmap_read(ddc->regs, HPD_DDC_CTRL, &val);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  211  			if (FIELD_GET(HPD_DDC_DELAY_CNT, val) < DDC2_DLY_CNT)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  212  				return 0;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  213  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  214  			uc_read_count = read_idx + 1;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  215  		}
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  216  	}
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23 @217  	if (uc_read_count > U8_MAX)
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  218  		dev_warn(ddc->dev, "Invalid read data count %u\n", uc_read_count);
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  219  
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  220  	return uc_read_count;
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  221  }
8d0f798862731c AngeloGioacchino Del Regno 2025-10-23  222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
