Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC56617D0
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 04:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694493141; x=1726029141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oi5mcguSKosoCzxcJUZK5wZWLBliGNB8w7VUTuyINdA=;
  b=OaqsIRpElzG7F2X6+cwD4i0GrvcbDrhYR2E+FwEUIxhtoRAP0OognKw5
   BGAVSPRX3nbjFQHHrU0UiSdDdjDICGYPXdwV7ev4hDSWCiIbdaZxTSXBM
   4I7tmU4BmcYSKsKNgOf6gTvmY8KzjoJlAjENeOdWuCEBak2YBvxX65gLN
   Fw/hLr/yMp9t5jVMCnWKXwBMJadtEvmhByzjAaWdz49wjrYoQIk69sbH+
   e0qT9joOQYpFdwWKjc2M2pETyd2wxuaHB6G1MiNhbZSeOwu1+umRhbd0S
   7CJ39b78vixDj0kpzM2bYf0NlrQn7QwFuzByYrPSCCunytidFNX0Tx0gU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377187832"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="377187832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 21:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917283509"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="917283509"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Sep 2023 21:32:18 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfv4S-0007JO-2W;
	Tue, 12 Sep 2023 04:32:16 +0000
Date: Tue, 12 Sep 2023 12:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1746
 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state'
 could be null (see line 1709)
Message-ID: <202309121248.2GEYg0D3-lkp@intel.com>
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
TO: Wenjing Liu <wenjing.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Dillon Varone <dillon.varone@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 1482650bc7ef01ebb24ec2c3a2e4d50e45da4d8c drm/amd/display: update blank state on ODM changes
date:   11 days ago
:::::: branch date: 29 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20230911 (https://download.01.org/0day-ci/archive/20230912/202309121248.2GEYg0D3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309121248.2GEYg0D3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309121248.2GEYg0D3-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1746 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state' could be null (see line 1709)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:815 dcn20_enable_stream_timing() warn: variable dereferenced before check 'pipe_ctx->stream_res.tg' (see line 722)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:2006 dcn20_post_unlock_program_front_end() error: we previously assumed 'hwseq' could be null (see line 2000)

vim +1746 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c

b6e881c947417e Dmytro Laktyushkin  2019-09-13  1695  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1696  static void dcn20_program_pipe(
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1697  		struct dc *dc,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1698  		struct pipe_ctx *pipe_ctx,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1699  		struct dc_state *context)
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1700  {
f42ea55be11147 Anthony Koo         2019-11-05  1701  	struct dce_hwseq *hws = dc->hwseq;
d3dfceb58de5f8 Aurabindo Pillai    2022-02-23  1702  
1482650bc7ef01 Wenjing Liu         2023-08-14  1703  	/* Only need to unblank on top pipe */
1482650bc7ef01 Wenjing Liu         2023-08-14  1704  	if (resource_is_pipe_type(pipe_ctx, OTG_MASTER)) {
1482650bc7ef01 Wenjing Liu         2023-08-14  1705  		if (pipe_ctx->update_flags.bits.enable ||
1482650bc7ef01 Wenjing Liu         2023-08-14  1706  				pipe_ctx->update_flags.bits.odm ||
1482650bc7ef01 Wenjing Liu         2023-08-14  1707  				pipe_ctx->stream->update_flags.bits.abm_level)
1482650bc7ef01 Wenjing Liu         2023-08-14  1708  			hws->funcs.blank_pixel_data(dc, pipe_ctx,
1482650bc7ef01 Wenjing Liu         2023-08-14 @1709  					!pipe_ctx->plane_state ||
1482650bc7ef01 Wenjing Liu         2023-08-14  1710  					!pipe_ctx->plane_state->visible);
1482650bc7ef01 Wenjing Liu         2023-08-14  1711  	}
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1712  
a71e5529d26745 Aric Cyr            2020-12-10  1713  	/* Only update TG on top pipe */
a71e5529d26745 Aric Cyr            2020-12-10  1714  	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
a71e5529d26745 Aric Cyr            2020-12-10  1715  			&& !pipe_ctx->prev_odm_pipe) {
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1716  		pipe_ctx->stream_res.tg->funcs->program_global_sync(
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1717  				pipe_ctx->stream_res.tg,
5842abd985b792 Wesley Chalmers     2022-11-09  1718  				calculate_vready_offset_for_group(pipe_ctx),
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1719  				pipe_ctx->pipe_dlg_param.vstartup_start,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1720  				pipe_ctx->pipe_dlg_param.vupdate_offset,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1721  				pipe_ctx->pipe_dlg_param.vupdate_width);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1722  
ac84304d68c4b3 Zhikai Zhai         2023-03-02  1723  		if (pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM)
203ccaf586446b Haiyi Zhou          2022-10-20  1724  			pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
a71e5529d26745 Aric Cyr            2020-12-10  1725  
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1726  		pipe_ctx->stream_res.tg->funcs->set_vtg_params(
a71e5529d26745 Aric Cyr            2020-12-10  1727  				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
1caba4e83b9d8a Aric Cyr            2019-09-06  1728  
f42ea55be11147 Anthony Koo         2019-11-05  1729  		if (hws->funcs.setup_vupdate_interrupt)
f42ea55be11147 Anthony Koo         2019-11-05  1730  			hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1731  	}
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1732  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1733  	if (pipe_ctx->update_flags.bits.odm)
f42ea55be11147 Anthony Koo         2019-11-05  1734  		hws->funcs.update_odm(dc, context, pipe_ctx);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1735  
868149c9a072cb Joshua Aberback     2020-03-30  1736  	if (pipe_ctx->update_flags.bits.enable) {
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1737  		dcn20_enable_plane(dc, pipe_ctx, context);
868149c9a072cb Joshua Aberback     2020-03-30  1738  		if (dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes)
868149c9a072cb Joshua Aberback     2020-03-30  1739  			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
868149c9a072cb Joshua Aberback     2020-03-30  1740  	}
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1741  
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1742  	if (dc->res_pool->hubbub->funcs->program_det_size && pipe_ctx->update_flags.bits.det_size)
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1743  		dc->res_pool->hubbub->funcs->program_det_size(
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1744  			dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1745  
747012382937e4 Dmytro Laktyushkin  2019-08-22 @1746  	if (pipe_ctx->update_flags.raw || pipe_ctx->plane_state->update_flags.raw || pipe_ctx->stream->update_flags.raw)
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1747  		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1748  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1749  	if (pipe_ctx->update_flags.bits.enable
46250a0cba4ce9 Michael Strauss     2019-11-03  1750  			|| pipe_ctx->plane_state->update_flags.bits.hdr_mult)
f42ea55be11147 Anthony Koo         2019-11-05  1751  		hws->funcs.set_hdr_multiplier(pipe_ctx);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1752  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1753  	if (pipe_ctx->update_flags.bits.enable ||
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1754  	    pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
2dc84508f8c692 Melissa Wen         2023-05-23  1755  	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
2dc84508f8c692 Melissa Wen         2023-05-23  1756  	    pipe_ctx->plane_state->update_flags.bits.lut_3d)
f42ea55be11147 Anthony Koo         2019-11-05  1757  		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1758  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1759  	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1760  	 * only do gamma programming for powering on, internal memcmp to avoid
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1761  	 * updating on slave planes
7ed4e6352c16fe Harry Wentland      2019-02-22  1762  	 */
bb622e0c004404 Dillon Varone       2022-11-17  1763  	if (pipe_ctx->update_flags.bits.enable ||
bb622e0c004404 Dillon Varone       2022-11-17  1764  			pipe_ctx->update_flags.bits.plane_changed ||
bb622e0c004404 Dillon Varone       2022-11-17  1765  			pipe_ctx->stream->update_flags.bits.out_tf ||
bb622e0c004404 Dillon Varone       2022-11-17  1766  			pipe_ctx->plane_state->update_flags.bits.output_tf_change)
f42ea55be11147 Anthony Koo         2019-11-05  1767  		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
377c9d04737914 Julian Parkin       2019-08-22  1768  
377c9d04737914 Julian Parkin       2019-08-22  1769  	/* If the pipe has been enabled or has a different opp, we
377c9d04737914 Julian Parkin       2019-08-22  1770  	 * should reprogram the fmt. This deals with cases where
377c9d04737914 Julian Parkin       2019-08-22  1771  	 * interation between mpc and odm combine on different streams
377c9d04737914 Julian Parkin       2019-08-22  1772  	 * causes a different pipe to be chosen to odm combine with.
377c9d04737914 Julian Parkin       2019-08-22  1773  	 */
377c9d04737914 Julian Parkin       2019-08-22  1774  	if (pipe_ctx->update_flags.bits.enable
377c9d04737914 Julian Parkin       2019-08-22  1775  	    || pipe_ctx->update_flags.bits.opp_changed) {
377c9d04737914 Julian Parkin       2019-08-22  1776  
377c9d04737914 Julian Parkin       2019-08-22  1777  		pipe_ctx->stream_res.opp->funcs->opp_set_dyn_expansion(
377c9d04737914 Julian Parkin       2019-08-22  1778  			pipe_ctx->stream_res.opp,
377c9d04737914 Julian Parkin       2019-08-22  1779  			COLOR_SPACE_YCBCR601,
377c9d04737914 Julian Parkin       2019-08-22  1780  			pipe_ctx->stream->timing.display_color_depth,
377c9d04737914 Julian Parkin       2019-08-22  1781  			pipe_ctx->stream->signal);
377c9d04737914 Julian Parkin       2019-08-22  1782  
377c9d04737914 Julian Parkin       2019-08-22  1783  		pipe_ctx->stream_res.opp->funcs->opp_program_fmt(
377c9d04737914 Julian Parkin       2019-08-22  1784  			pipe_ctx->stream_res.opp,
377c9d04737914 Julian Parkin       2019-08-22  1785  			&pipe_ctx->stream->bit_depth_params,
377c9d04737914 Julian Parkin       2019-08-22  1786  			&pipe_ctx->stream->clamping);
377c9d04737914 Julian Parkin       2019-08-22  1787  	}
32e3da4310bb1c Leon Huang          2023-01-17  1788  
32e3da4310bb1c Leon Huang          2023-01-17  1789  	/* Set ABM pipe after other pipe configurations done */
32e3da4310bb1c Leon Huang          2023-01-17  1790  	if (pipe_ctx->plane_state->visible) {
32e3da4310bb1c Leon Huang          2023-01-17  1791  		if (pipe_ctx->stream_res.abm) {
32e3da4310bb1c Leon Huang          2023-01-17  1792  			dc->hwss.set_pipe(pipe_ctx);
32e3da4310bb1c Leon Huang          2023-01-17  1793  			pipe_ctx->stream_res.abm->funcs->set_abm_level(pipe_ctx->stream_res.abm,
32e3da4310bb1c Leon Huang          2023-01-17  1794  				pipe_ctx->stream->abm_level);
32e3da4310bb1c Leon Huang          2023-01-17  1795  		}
32e3da4310bb1c Leon Huang          2023-01-17  1796  	}
7ed4e6352c16fe Harry Wentland      2019-02-22  1797  }
7ed4e6352c16fe Harry Wentland      2019-02-22  1798  

:::::: The code at line 1746 was first introduced by commit
:::::: 747012382937e4b6eb34ba730e815f9da836e454 drm/amd/display: add additional flag consideration for surface update

:::::: TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
