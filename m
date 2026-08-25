Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910BB3E0080
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647858; cv=none; b=usSKIDnfCXXfy3S/lDTHES5Pjd5RGMz2JRS1eSt6liDxGqCA+IvalbsJPLlL29y8kbFOnR2jJo2TSAvJ9tSChBDR7BtMqeNlurBn6qa2rm72d3OtmN1l2tmpcpnv0V06S9Qd+/Ebbm5Mnteo7VdfS23Z8RGdWIrTphrmJ3aIA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647858; c=relaxed/simple;
	bh=QQqyQ5JsxUuN5AzWIYmLzP/NkmWe4Aad9SyU0wmubks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PGqf0d8FLzec6T0rXmkg9G7l+pbfs8+utGuVNHBOQiMcEfg59jil+REf6hFvYFXN2qJysqtu9P3c1aFndJvq4xsOq7ZB8Ql+oTNR0MQSObfJlAYclS5ARW0y08Jj4cugrJXMC7DaMuk5TOiNOzj4kQhRQOQNtPX417DOtZhF6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYJd23RP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYJd23RP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787647856; x=1819183856;
  h=date:from:to:cc:subject:message-id;
  bh=QQqyQ5JsxUuN5AzWIYmLzP/NkmWe4Aad9SyU0wmubks=;
  b=JYJd23RPUGiGPT6IhpIf1fmZ9TZHhuONKUadMy84Flu12DjD7ovjl3tj
   ek4oNkb++ZuPlBwHbz3q4ajAZREtuEJv22nqkzczQh8Xi0tQIUCDJpezV
   FC6S6cRk79PnkFrbeN1740YsY5rW3tMmti8Tn12efy/ek5z6VZVTDzR34
   lrflMpycgSIf8SzUTA1FzD1ivGz8sxEhYWpblEDvudZsftO9EvQd93MqK
   tKlbOYtq71+FDJQ4VqEg0k08NPSZFlhE4Zm9UFmss1x9Z8oChBRTc8VMl
   J5ADREWcJ1en1BtKOKrFgv/mn/YTPznmx1oEPi6pO3RE7nj9V3DcYva+Y
   A==;
X-CSE-ConnectionGUID: g9l+POFLRyupSzoHeeqmPQ==
X-CSE-MsgGUID: kT6pFkYXQFmFlEl3l3gLeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88126367"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88126367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 01:50:55 -0700
X-CSE-ConnectionGUID: a6570GQBSwq1yHJhCXMnXg==
X-CSE-MsgGUID: Zs9U2sS0Qdy5Yo2rdtx1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263492927"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2026 01:50:54 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wymrr-000000005JT-1X9B;
	Tue, 25 Aug 2026 08:50:51 +0000
Date: Tue, 25 Aug 2026 16:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_cm_common.c:177
 cm3_helper_translate_curve_to_hw_format() error: buffer overflow 'seg_distr'
 34 <= 4294967058
Message-ID: <202608251601.cONOxwET-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Dillon Varone <dillon.varone@amd.com>
CC: James Lin <pinglei.lin@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: 64b4c4cdfddd31d3a0ec468afccb7ff7cd926682 drm/amd/display: Fix type mismatches using guards and explicit casts
date:   4 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260825/202608251601.cONOxwET-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 64b4c4cdfddd ("drm/amd/display: Fix type mismatches using guards and explicit casts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608251601.cONOxwET-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_cm_common.c:177 cm3_helper_translate_curve_to_hw_format() error: buffer overflow 'seg_distr' 34 <= 4294967058
drivers/gpu/drm/amd/amdgpu/../display/dc/soc_and_ip_translator/dcn42/dcn42_soc_and_ip_translator.c:61 dcn42_convert_dc_clock_table_to_soc_bb_clock_table() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/soc_and_ip_translator/dcn42/dcn42_soc_and_ip_translator.c:61 dcn42_convert_dc_clock_table_to_soc_bb_clock_table() warn: if statement not indented

vim +/seg_distr +177 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_cm_common.c

03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  107  
d25b32aa829a3e Melissa Wen          2025-12-08  108  #define DC_LOGGER \
d25b32aa829a3e Melissa Wen          2025-12-08  109  		ctx->logger
d25b32aa829a3e Melissa Wen          2025-12-08  110  
d25b32aa829a3e Melissa Wen          2025-12-08  111  bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  112  					     const struct dc_transfer_func *output_tf,
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  113  					     struct pwl_params *lut_params, bool fixpoint)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  114  {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  115  	struct curve_points3 *corner_points;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  116  	struct pwl_result_data *rgb_resulted;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  117  	struct pwl_result_data *rgb;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  118  	struct pwl_result_data *rgb_plus_1;
34fa493a565cc6 Calvin Hou           2021-03-02  119  	struct pwl_result_data *rgb_minus_1;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  120  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  121  	int32_t region_start, region_end;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  122  	int32_t i;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  123  	uint32_t j, k, seg_distr[MAX_REGIONS_NUMBER], increment, start_index, hw_points;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  124  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  125  	if (output_tf == NULL || lut_params == NULL || output_tf->type == TF_TYPE_BYPASS)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  126  		return false;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  127  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  128  	corner_points = lut_params->corner_points;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  129  	rgb_resulted = lut_params->rgb_resulted;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  130  	hw_points = 0;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  131  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  132  	memset(lut_params, 0, sizeof(struct pwl_params));
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  133  	memset(seg_distr, 0, sizeof(seg_distr));
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  134  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  135  	if (output_tf->tf == TRANSFER_FUNCTION_PQ || output_tf->tf == TRANSFER_FUNCTION_GAMMA22 ||
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  136  		output_tf->tf == TRANSFER_FUNCTION_HLG) {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  137  		/* 32 segments
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  138  		 * segments are from 2^-25 to 2^7
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  139  		 */
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  140  		for (i = 0; i < NUMBER_REGIONS ; i++)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  141  			seg_distr[i] = 3;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  142  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  143  		region_start = -MAX_LOW_POINT;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  144  		region_end   = NUMBER_REGIONS - MAX_LOW_POINT;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  145  	} else {
eda7f2e9bb3b6b Peterson             2024-09-23  146  		/* 13 segments
eda7f2e9bb3b6b Peterson             2024-09-23  147  		 * segment is from 2^-12 to 2^0
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  148  		 * There are less than 256 points, for optimization
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  149  		 */
eda7f2e9bb3b6b Peterson             2024-09-23  150  		const uint8_t SEG_COUNT = 12;
eda7f2e9bb3b6b Peterson             2024-09-23  151  
eda7f2e9bb3b6b Peterson             2024-09-23  152  		for (i = 0; i < SEG_COUNT; i++)
eda7f2e9bb3b6b Peterson             2024-09-23  153  			seg_distr[i] = 4;
eda7f2e9bb3b6b Peterson             2024-09-23  154  
eda7f2e9bb3b6b Peterson             2024-09-23  155  		seg_distr[SEG_COUNT] = 1;
eda7f2e9bb3b6b Peterson             2024-09-23  156  
eda7f2e9bb3b6b Peterson             2024-09-23  157  		region_start = -SEG_COUNT;
34fa493a565cc6 Calvin Hou           2021-03-02  158  		region_end = 1;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  159  	}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  160  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  161  	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
26ebcac0566b78 Gaghik Khachatrian   2026-03-12  162  		seg_distr[i] = (uint32_t)-1;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  163  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  164  	for (k = 0; k < MAX_REGIONS_NUMBER; k++) {
26ebcac0566b78 Gaghik Khachatrian   2026-03-12  165  		if (seg_distr[k] != (uint32_t)-1)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  166  			hw_points += (1 << seg_distr[k]);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  167  	}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  168  
8f959d37c1f2ef Melissa Wen          2026-01-22  169  	// DCN3+ have 257 pts in lieu of no separate slope registers
8f959d37c1f2ef Melissa Wen          2026-01-22  170  	// Prior HW had 256 base+slope pairs
8f959d37c1f2ef Melissa Wen          2026-01-22  171  	// Shaper LUT (i.e. fixpoint == true) is still 256 bases and 256 deltas
8f959d37c1f2ef Melissa Wen          2026-01-22  172  	hw_points = fixpoint ? (hw_points - 1) : hw_points;
8f959d37c1f2ef Melissa Wen          2026-01-22  173  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  174  	j = 0;
64b4c4cdfddd31 Gaghik Khachatrian   2026-04-21  175  	uint32_t region_span = (uint32_t)(region_end - region_start);
64b4c4cdfddd31 Gaghik Khachatrian   2026-04-21  176  	for (k = 0; k < region_span; k++) {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21 @177  		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  178  		start_index = (region_start + k + MAX_LOW_POINT) *
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  179  				NUMBER_SW_SEGMENTS;
64b4c4cdfddd31 Gaghik Khachatrian   2026-04-21  180  		int32_t index_end = (int32_t)(start_index + NUMBER_SW_SEGMENTS);
64b4c4cdfddd31 Gaghik Khachatrian   2026-04-21  181  		for (i = start_index; i < index_end;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  182  				i += increment) {
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  183  			if (j == hw_points)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  184  				break;
d81873f9e715b7 Srinivasan Shanmugam 2024-07-20  185  			if (i >= TRANSFER_FUNC_POINTS)
d81873f9e715b7 Srinivasan Shanmugam 2024-07-20  186  				return false;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  187  			rgb_resulted[j].red = output_tf->tf_pts.red[i];
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  188  			rgb_resulted[j].green = output_tf->tf_pts.green[i];
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  189  			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  190  			j++;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  191  		}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  192  	}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  193  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  194  	/* last point */
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  195  	start_index = (region_end + MAX_LOW_POINT) * NUMBER_SW_SEGMENTS;
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  196  	rgb_resulted[hw_points].red = output_tf->tf_pts.red[start_index];
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  197  	rgb_resulted[hw_points].green = output_tf->tf_pts.green[start_index];
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  198  	rgb_resulted[hw_points].blue = output_tf->tf_pts.blue[start_index];
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  199  
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  200  	rgb_resulted[hw_points+1].red = rgb_resulted[hw_points].red;
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  201  	rgb_resulted[hw_points+1].green = rgb_resulted[hw_points].green;
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  202  	rgb_resulted[hw_points+1].blue = rgb_resulted[hw_points].blue;
34fa493a565cc6 Calvin Hou           2021-03-02  203  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  204  	// All 3 color channels have same x
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  205  	corner_points[0].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  206  					     dc_fixpt_from_int(region_start));
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  207  	corner_points[0].green.x = corner_points[0].red.x;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  208  	corner_points[0].blue.x = corner_points[0].red.x;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  209  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  210  	corner_points[1].red.x = dc_fixpt_pow(dc_fixpt_from_int(2),
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  211  					     dc_fixpt_from_int(region_end));
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  212  	corner_points[1].green.x = corner_points[1].red.x;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  213  	corner_points[1].blue.x = corner_points[1].red.x;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  214  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  215  	corner_points[0].red.y = rgb_resulted[0].red;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  216  	corner_points[0].green.y = rgb_resulted[0].green;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  217  	corner_points[0].blue.y = rgb_resulted[0].blue;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  218  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  219  	corner_points[0].red.slope = dc_fixpt_div(corner_points[0].red.y,
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  220  			corner_points[0].red.x);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  221  	corner_points[0].green.slope = dc_fixpt_div(corner_points[0].green.y,
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  222  			corner_points[0].green.x);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  223  	corner_points[0].blue.slope = dc_fixpt_div(corner_points[0].blue.y,
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  224  			corner_points[0].blue.x);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  225  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  226  	/* see comment above, m_arrPoints[1].y should be the Y value for the
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  227  	 * region end (m_numOfHwPoints), not last HW point(m_numOfHwPoints - 1)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  228  	 */
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  229  	corner_points[1].red.y = rgb_resulted[hw_points].red;
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  230  	corner_points[1].green.y = rgb_resulted[hw_points].green;
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  231  	corner_points[1].blue.y = rgb_resulted[hw_points].blue;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  232  	corner_points[1].red.slope = dc_fixpt_zero;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  233  	corner_points[1].green.slope = dc_fixpt_zero;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  234  	corner_points[1].blue.slope = dc_fixpt_zero;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  235  
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  236  	lut_params->hw_points_num = hw_points + 1;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  237  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  238  	k = 0;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  239  	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  240  		if (seg_distr[k] != -1) {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  241  			lut_params->arr_curve_points[k].segments_num =
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  242  					seg_distr[k];
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  243  			lut_params->arr_curve_points[i].offset =
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  244  					lut_params->arr_curve_points[k].offset + (1 << seg_distr[k]);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  245  		}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  246  		k++;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  247  	}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  248  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  249  	if (seg_distr[k] != -1)
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  250  		lut_params->arr_curve_points[k].segments_num = seg_distr[k];
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  251  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  252  	rgb = rgb_resulted;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  253  	rgb_plus_1 = rgb_resulted + 1;
34fa493a565cc6 Calvin Hou           2021-03-02  254  	rgb_minus_1 = rgb;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  255  
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  256  	if (fixpoint == true) {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  257  		i = 1;
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  258  		while (i != hw_points + 2) {
d25b32aa829a3e Melissa Wen          2025-12-08  259  			uint32_t red_clamp;
d25b32aa829a3e Melissa Wen          2025-12-08  260  			uint32_t green_clamp;
d25b32aa829a3e Melissa Wen          2025-12-08  261  			uint32_t blue_clamp;
d25b32aa829a3e Melissa Wen          2025-12-08  262  
64b4c4cdfddd31 Gaghik Khachatrian   2026-04-21  263  			if ((uint32_t)i >= hw_points) {
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  264  				if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  265  					rgb_plus_1->red = dc_fixpt_add(rgb->red,
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  266  							rgb_minus_1->delta_red);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  267  				if (dc_fixpt_lt(rgb_plus_1->green, rgb->green))
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  268  					rgb_plus_1->green = dc_fixpt_add(rgb->green,
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  269  							rgb_minus_1->delta_green);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  270  				if (dc_fixpt_lt(rgb_plus_1->blue, rgb->blue))
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  271  					rgb_plus_1->blue = dc_fixpt_add(rgb->blue,
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  272  							rgb_minus_1->delta_blue);
34fa493a565cc6 Calvin Hou           2021-03-02  273  			}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  274  
d25b32aa829a3e Melissa Wen          2025-12-08  275  			rgb->delta_red   = dc_fixpt_sub(rgb_plus_1->red,   rgb->red);
d25b32aa829a3e Melissa Wen          2025-12-08  276  			rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
d25b32aa829a3e Melissa Wen          2025-12-08  277  			rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
d25b32aa829a3e Melissa Wen          2025-12-08  278  
d25b32aa829a3e Melissa Wen          2025-12-08  279  			red_clamp = dc_fixpt_clamp_u0d14(rgb->delta_red);
d25b32aa829a3e Melissa Wen          2025-12-08  280  			green_clamp = dc_fixpt_clamp_u0d14(rgb->delta_green);
d25b32aa829a3e Melissa Wen          2025-12-08  281  			blue_clamp = dc_fixpt_clamp_u0d14(rgb->delta_blue);
d25b32aa829a3e Melissa Wen          2025-12-08  282  
d25b32aa829a3e Melissa Wen          2025-12-08  283  			if (red_clamp >> 10 || green_clamp >> 10 || blue_clamp >> 10)
d25b32aa829a3e Melissa Wen          2025-12-08  284  				DC_LOG_ERROR("Losing delta precision while programming shaper LUT.");
d25b32aa829a3e Melissa Wen          2025-12-08  285  
d25b32aa829a3e Melissa Wen          2025-12-08  286  			rgb->delta_red_reg   = red_clamp & 0x3ff;
d25b32aa829a3e Melissa Wen          2025-12-08  287  			rgb->delta_green_reg = green_clamp & 0x3ff;
d25b32aa829a3e Melissa Wen          2025-12-08  288  			rgb->delta_blue_reg  = blue_clamp & 0x3ff;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  289  			rgb->red_reg         = dc_fixpt_clamp_u0d14(rgb->red);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  290  			rgb->green_reg       = dc_fixpt_clamp_u0d14(rgb->green);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  291  			rgb->blue_reg        = dc_fixpt_clamp_u0d14(rgb->blue);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  292  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  293  			++rgb_plus_1;
34fa493a565cc6 Calvin Hou           2021-03-02  294  			rgb_minus_1 = rgb;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  295  			++rgb;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  296  			++i;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  297  		}
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  298  	}
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  299  	cm3_helper_convert_to_custom_float(rgb_resulted,
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  300  						lut_params->corner_points,
4d5fd3d08ea992 Krunoslav Kovac      2023-08-08  301  						hw_points+1, fixpoint);
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  302  
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  303  	return true;
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  304  }
03f54d7d3448dc Bhawanpreet Lakha    2020-05-21  305  

:::::: The code at line 177 was first introduced by commit
:::::: 03f54d7d3448dc1668568d1adb69b43c1d1dc79f drm/amd/display: Add DCN3 DPP

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
