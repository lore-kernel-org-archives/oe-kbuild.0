Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19618E29
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 21:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eghIBInX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697060783; x=1728596783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+nev/QjOLqHwPN6XrAI7X+xDdmA5IvfzxM01CT5KN4=;
  b=eghIBInXEIRWCKmrA70yy2QeZGF+RXPy4e/NQnUdt6sM3S72+6N8UKV6
   bwjVbgyTijfjnffvhq1H4mYolP5KCpZgg3xoHzXsHVMsGogRG+pTZ4C+A
   dQPKcW6IyZm91OMpCQ6pRD3fTMOKLrebEftSYQm0wq5eBLYVwe3hEb4kz
   S5SNsH4ynlBko6Jr3H/S9ljwtXr4HFdYqz2+c9+wWbakGCkOByIafb8rM
   Nw7hNWc6jW6HYeo2fknM8/iEPPTjL+qGSZiOFIDqid3qAb2i0z0BdD3ht
   ulsLidVr24SSur5MILZUm9QZWg3eNcSx5w7PyC4jyoedP41mHgapOjpm5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384626053"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="384626053"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 14:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="819879977"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="819879977"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2023 14:46:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqh22-0002kj-1P;
	Wed, 11 Oct 2023 21:46:18 +0000
Date: Thu, 12 Oct 2023 05:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 420/11428]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1756
 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state'
 could be null (see line 1719)
Message-ID: <202310120506.aBio3Ik1-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wenjing Liu <wenjing.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Dillon Varone <dillon.varone@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2933a1156742d8c47550493a77af8e2d81cf3c84
commit: 15e6b396f5ac259126f2447fcd2279ed5d3dd14f [420/11428] drm/amd/display: update blank state on ODM changes
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20231012/202310120506.aBio3Ik1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120506.aBio3Ik1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310120506.aBio3Ik1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1756 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state' could be null (see line 1719)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:815 dcn20_enable_stream_timing() warn: variable dereferenced before check 'pipe_ctx->stream_res.tg' (see line 722)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:2016 dcn20_post_unlock_program_front_end() error: we previously assumed 'hwseq' could be null (see line 2010)

vim +1756 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c

b6e881c947417e Dmytro Laktyushkin  2019-09-13  1705  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1706  static void dcn20_program_pipe(
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1707  		struct dc *dc,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1708  		struct pipe_ctx *pipe_ctx,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1709  		struct dc_state *context)
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1710  {
f42ea55be11147 Anthony Koo         2019-11-05  1711  	struct dce_hwseq *hws = dc->hwseq;
d3dfceb58de5f8 Aurabindo Pillai    2022-02-23  1712  
15e6b396f5ac25 Wenjing Liu         2023-08-14  1713  	/* Only need to unblank on top pipe */
15e6b396f5ac25 Wenjing Liu         2023-08-14  1714  	if (resource_is_pipe_type(pipe_ctx, OTG_MASTER)) {
15e6b396f5ac25 Wenjing Liu         2023-08-14  1715  		if (pipe_ctx->update_flags.bits.enable ||
15e6b396f5ac25 Wenjing Liu         2023-08-14  1716  				pipe_ctx->update_flags.bits.odm ||
15e6b396f5ac25 Wenjing Liu         2023-08-14  1717  				pipe_ctx->stream->update_flags.bits.abm_level)
15e6b396f5ac25 Wenjing Liu         2023-08-14  1718  			hws->funcs.blank_pixel_data(dc, pipe_ctx,
15e6b396f5ac25 Wenjing Liu         2023-08-14 @1719  					!pipe_ctx->plane_state ||
15e6b396f5ac25 Wenjing Liu         2023-08-14  1720  					!pipe_ctx->plane_state->visible);
15e6b396f5ac25 Wenjing Liu         2023-08-14  1721  	}
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1722  
a71e5529d26745 Aric Cyr            2020-12-10  1723  	/* Only update TG on top pipe */
a71e5529d26745 Aric Cyr            2020-12-10  1724  	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
a71e5529d26745 Aric Cyr            2020-12-10  1725  			&& !pipe_ctx->prev_odm_pipe) {
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1726  		pipe_ctx->stream_res.tg->funcs->program_global_sync(
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1727  				pipe_ctx->stream_res.tg,
5842abd985b792 Wesley Chalmers     2022-11-09  1728  				calculate_vready_offset_for_group(pipe_ctx),
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1729  				pipe_ctx->pipe_dlg_param.vstartup_start,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1730  				pipe_ctx->pipe_dlg_param.vupdate_offset,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1731  				pipe_ctx->pipe_dlg_param.vupdate_width);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1732  
ac84304d68c4b3 Zhikai Zhai         2023-03-02  1733  		if (pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM)
203ccaf586446b Haiyi Zhou          2022-10-20  1734  			pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
a71e5529d26745 Aric Cyr            2020-12-10  1735  
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1736  		pipe_ctx->stream_res.tg->funcs->set_vtg_params(
a71e5529d26745 Aric Cyr            2020-12-10  1737  				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
1caba4e83b9d8a Aric Cyr            2019-09-06  1738  
f42ea55be11147 Anthony Koo         2019-11-05  1739  		if (hws->funcs.setup_vupdate_interrupt)
f42ea55be11147 Anthony Koo         2019-11-05  1740  			hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1741  	}
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1742  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1743  	if (pipe_ctx->update_flags.bits.odm)
f42ea55be11147 Anthony Koo         2019-11-05  1744  		hws->funcs.update_odm(dc, context, pipe_ctx);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1745  
868149c9a072cb Joshua Aberback     2020-03-30  1746  	if (pipe_ctx->update_flags.bits.enable) {
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1747  		dcn20_enable_plane(dc, pipe_ctx, context);
868149c9a072cb Joshua Aberback     2020-03-30  1748  		if (dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes)
868149c9a072cb Joshua Aberback     2020-03-30  1749  			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
868149c9a072cb Joshua Aberback     2020-03-30  1750  	}
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1751  
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1752  	if (dc->res_pool->hubbub->funcs->program_det_size && pipe_ctx->update_flags.bits.det_size)
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1753  		dc->res_pool->hubbub->funcs->program_det_size(
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1754  			dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1755  
747012382937e4 Dmytro Laktyushkin  2019-08-22 @1756  	if (pipe_ctx->update_flags.raw || pipe_ctx->plane_state->update_flags.raw || pipe_ctx->stream->update_flags.raw)
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1757  		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1758  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1759  	if (pipe_ctx->update_flags.bits.enable
46250a0cba4ce9 Michael Strauss     2019-11-03  1760  			|| pipe_ctx->plane_state->update_flags.bits.hdr_mult)
f42ea55be11147 Anthony Koo         2019-11-05  1761  		hws->funcs.set_hdr_multiplier(pipe_ctx);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1762  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1763  	if (pipe_ctx->update_flags.bits.enable ||
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1764  	    pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
2dc84508f8c692 Melissa Wen         2023-05-23  1765  	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
2dc84508f8c692 Melissa Wen         2023-05-23  1766  	    pipe_ctx->plane_state->update_flags.bits.lut_3d)
f42ea55be11147 Anthony Koo         2019-11-05  1767  		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1768  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1769  	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1770  	 * only do gamma programming for powering on, internal memcmp to avoid
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1771  	 * updating on slave planes
7ed4e6352c16fe Harry Wentland      2019-02-22  1772  	 */
bb622e0c004404 Dillon Varone       2022-11-17  1773  	if (pipe_ctx->update_flags.bits.enable ||
bb622e0c004404 Dillon Varone       2022-11-17  1774  			pipe_ctx->update_flags.bits.plane_changed ||
bb622e0c004404 Dillon Varone       2022-11-17  1775  			pipe_ctx->stream->update_flags.bits.out_tf ||
bb622e0c004404 Dillon Varone       2022-11-17  1776  			pipe_ctx->plane_state->update_flags.bits.output_tf_change)
f42ea55be11147 Anthony Koo         2019-11-05  1777  		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
377c9d04737914 Julian Parkin       2019-08-22  1778  
377c9d04737914 Julian Parkin       2019-08-22  1779  	/* If the pipe has been enabled or has a different opp, we
377c9d04737914 Julian Parkin       2019-08-22  1780  	 * should reprogram the fmt. This deals with cases where
377c9d04737914 Julian Parkin       2019-08-22  1781  	 * interation between mpc and odm combine on different streams
377c9d04737914 Julian Parkin       2019-08-22  1782  	 * causes a different pipe to be chosen to odm combine with.
377c9d04737914 Julian Parkin       2019-08-22  1783  	 */
377c9d04737914 Julian Parkin       2019-08-22  1784  	if (pipe_ctx->update_flags.bits.enable
377c9d04737914 Julian Parkin       2019-08-22  1785  	    || pipe_ctx->update_flags.bits.opp_changed) {
377c9d04737914 Julian Parkin       2019-08-22  1786  
377c9d04737914 Julian Parkin       2019-08-22  1787  		pipe_ctx->stream_res.opp->funcs->opp_set_dyn_expansion(
377c9d04737914 Julian Parkin       2019-08-22  1788  			pipe_ctx->stream_res.opp,
377c9d04737914 Julian Parkin       2019-08-22  1789  			COLOR_SPACE_YCBCR601,
377c9d04737914 Julian Parkin       2019-08-22  1790  			pipe_ctx->stream->timing.display_color_depth,
377c9d04737914 Julian Parkin       2019-08-22  1791  			pipe_ctx->stream->signal);
377c9d04737914 Julian Parkin       2019-08-22  1792  
377c9d04737914 Julian Parkin       2019-08-22  1793  		pipe_ctx->stream_res.opp->funcs->opp_program_fmt(
377c9d04737914 Julian Parkin       2019-08-22  1794  			pipe_ctx->stream_res.opp,
377c9d04737914 Julian Parkin       2019-08-22  1795  			&pipe_ctx->stream->bit_depth_params,
377c9d04737914 Julian Parkin       2019-08-22  1796  			&pipe_ctx->stream->clamping);
377c9d04737914 Julian Parkin       2019-08-22  1797  	}
32e3da4310bb1c Leon Huang          2023-01-17  1798  
32e3da4310bb1c Leon Huang          2023-01-17  1799  	/* Set ABM pipe after other pipe configurations done */
32e3da4310bb1c Leon Huang          2023-01-17  1800  	if (pipe_ctx->plane_state->visible) {
32e3da4310bb1c Leon Huang          2023-01-17  1801  		if (pipe_ctx->stream_res.abm) {
32e3da4310bb1c Leon Huang          2023-01-17  1802  			dc->hwss.set_pipe(pipe_ctx);
32e3da4310bb1c Leon Huang          2023-01-17  1803  			pipe_ctx->stream_res.abm->funcs->set_abm_level(pipe_ctx->stream_res.abm,
32e3da4310bb1c Leon Huang          2023-01-17  1804  				pipe_ctx->stream->abm_level);
32e3da4310bb1c Leon Huang          2023-01-17  1805  		}
32e3da4310bb1c Leon Huang          2023-01-17  1806  	}
7ed4e6352c16fe Harry Wentland      2019-02-22  1807  }
7ed4e6352c16fe Harry Wentland      2019-02-22  1808  

:::::: The code at line 1756 was first introduced by commit
:::::: 747012382937e4b6eb34ba730e815f9da836e454 drm/amd/display: add additional flag consideration for surface update

:::::: TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
