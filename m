Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C18112B93
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 02:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713061290; cv=none; b=i5xmjGWSnXIkCLeFD+0FTYdXn2gLWNcfneHJ8oYZh4Bx+4MLpIxmuKgd1p2pIxMF7O1pgpD6TjFfCpPgy3tQnwEhgj9uwlSHyCqNF1mR2DoggBQq7GV5ycYuBXiHr5iMpagmm0R6i1++2fg9w5nG47oBOXmdb+aB81poQupLRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713061290; c=relaxed/simple;
	bh=D3OH2uHneecWHj0MBPgQKTCXELUnNCkHS+GRiFoNUqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIFKuZiYBaCNoDpB1R5ECqqgxkzItAqRRf8ZuiOPtbAZ04pqaX5fTDTZ6/nHTwMCOy5LSD0h3gIS+y7/Q9BscPyXno89XSVA724aedFABKRkL/9Pol4jSvbsGIi0+UJ3n62PB365u9mxiLNujYYAL/xwn24WxnwExTpOSqruvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE1i/w1k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE1i/w1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713061288; x=1744597288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3OH2uHneecWHj0MBPgQKTCXELUnNCkHS+GRiFoNUqY=;
  b=WE1i/w1kqgHbTIPwObfI17cQoOlhyiVrCeAwEIL3tiXb7ZOqBbriBBym
   AZacQ+v4zOw+JhwcYNDP9Mh2hiw4Ru6YKH5WcUu6A+4GIbKBgN2mi95yb
   LS1MKwW8bO9keaBg7370W6iQWNYCcPjGStCHw+uDZt8ArPSc7H8ErJ980
   J6ZVjcKKI1oOLSzJGIJ2DpRz6zSbb9KUKiRy/fvffEjG+WdoRSLbShsA+
   YDByIY380X4St38KbbzfVfhIze+SFeq1vhmbKHERAZAu8H4RiqIy/JuAx
   N27GvGCBuvW+UboJW4FI9nkrVpsdvrUBWPbcZYgliLhV2PeCcy2pNNM9D
   w==;
X-CSE-ConnectionGUID: E0Sscr4rTKaQZFi+yucIJQ==
X-CSE-MsgGUID: GYZ/a/LlTVyCr5Igzd2oCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12257642"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="12257642"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 19:21:27 -0700
X-CSE-ConnectionGUID: YFkJqQIQT2KYM3wDH2qxpw==
X-CSE-MsgGUID: SIhGE/2aRt2vzr/V4PWwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21648255"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 13 Apr 2024 19:21:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvpUi-00039o-0x;
	Sun, 14 Apr 2024 02:21:24 +0000
Date: Sun, 14 Apr 2024 10:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:drm-next-6.10 64/316] drivers/gpu/drm/amd/display/dc/dc.h:
 dc_stream.h is included more than once.
Message-ID: <202404141041.DGVcd1M8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alvin Lee <alvin.lee2@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Wenjing Liu <wenjing.liu@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.10
head:   ab956ed95b8bc4a65c913d7057075866d5fc3724
commit: d62d5551dd615f9e488b13595d69b308cd019e16 [64/316] drm/amd/display: Backup and restore only on full updates
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404141041.DGVcd1M8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dc.h: dc_stream.h is included more than once.

vim +1296 drivers/gpu/drm/amd/display/dc/dc.h

  1295	
> 1296	#include "dc_stream.h"
  1297	
  1298	struct dc_scratch_space {
  1299		/* used to temporarily backup plane states of a stream during
  1300		 * dc update. The reason is that plane states are overwritten
  1301		 * with surface updates in dc update. Once they are overwritten
  1302		 * current state is no longer valid. We want to temporarily
  1303		 * store current value in plane states so we can still recover
  1304		 * a valid current state during dc update.
  1305		 */
  1306		struct dc_plane_state plane_states[MAX_SURFACE_NUM];
  1307		struct dc_gamma gamma_correction[MAX_SURFACE_NUM];
  1308		struct dc_transfer_func in_transfer_func[MAX_SURFACE_NUM];
  1309		struct dc_3dlut lut3d_func[MAX_SURFACE_NUM];
  1310		struct dc_transfer_func in_shaper_func[MAX_SURFACE_NUM];
  1311		struct dc_transfer_func blend_tf[MAX_SURFACE_NUM];
  1312	
  1313		struct dc_stream_state stream_state;
  1314		struct dc_transfer_func out_transfer_func;
  1315	};
  1316	
  1317	struct dc {
  1318		struct dc_debug_options debug;
  1319		struct dc_versions versions;
  1320		struct dc_caps caps;
  1321		struct dc_cap_funcs cap_funcs;
  1322		struct dc_config config;
  1323		struct dc_bounding_box_overrides bb_overrides;
  1324		struct dc_bug_wa work_arounds;
  1325		struct dc_context *ctx;
  1326		struct dc_phy_addr_space_config vm_pa_config;
  1327	
  1328		uint8_t link_count;
  1329		struct dc_link *links[MAX_PIPES * 2];
  1330		struct link_service *link_srv;
  1331	
  1332		struct dc_state *current_state;
  1333		struct resource_pool *res_pool;
  1334	
  1335		struct clk_mgr *clk_mgr;
  1336	
  1337		/* Display Engine Clock levels */
  1338		struct dm_pp_clock_levels sclk_lvls;
  1339	
  1340		/* Inputs into BW and WM calculations. */
  1341		struct bw_calcs_dceip *bw_dceip;
  1342		struct bw_calcs_vbios *bw_vbios;
  1343		struct dcn_soc_bounding_box *dcn_soc;
  1344		struct dcn_ip_params *dcn_ip;
  1345		struct display_mode_lib dml;
  1346	
  1347		/* HW functions */
  1348		struct hw_sequencer_funcs hwss;
  1349		struct dce_hwseq *hwseq;
  1350	
  1351		/* Require to optimize clocks and bandwidth for added/removed planes */
  1352		bool optimized_required;
  1353		bool wm_optimized_required;
  1354		bool idle_optimizations_allowed;
  1355		bool enable_c20_dtm_b0;
  1356	
  1357		/* Require to maintain clocks and bandwidth for UEFI enabled HW */
  1358	
  1359		/* FBC compressor */
  1360		struct compressor *fbc_compressor;
  1361	
  1362		struct dc_debug_data debug_data;
  1363		struct dpcd_vendor_signature vendor_signature;
  1364	
  1365		const char *build_id;
  1366		struct vm_helper *vm_helper;
  1367	
  1368		uint32_t *dcn_reg_offsets;
  1369		uint32_t *nbio_reg_offsets;
  1370		uint32_t *clk_reg_offsets;
  1371	
  1372		/* Scratch memory */
  1373		struct {
  1374			struct {
  1375				/*
  1376				 * For matching clock_limits table in driver with table
  1377				 * from PMFW.
  1378				 */
  1379				struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
  1380			} update_bw_bounding_box;
  1381			struct dc_scratch_space current_state;
  1382			struct dc_scratch_space new_state;
  1383		} scratch;
  1384	
  1385		struct dml2_configuration_options dml2_options;
  1386		enum dc_acpi_cm_power_state power_state;
  1387	
  1388	};
  1389	
  1390	struct dc_scaling_info {
  1391		struct rect src_rect;
  1392		struct rect dst_rect;
  1393		struct rect clip_rect;
  1394		struct scaling_taps scaling_quality;
  1395	};
  1396	
  1397	struct dc_fast_update {
  1398		const struct dc_flip_addrs *flip_addr;
  1399		const struct dc_gamma *gamma;
  1400		const struct colorspace_transform *gamut_remap_matrix;
  1401		const struct dc_csc_transform *input_csc_color_matrix;
  1402		const struct fixed31_32 *coeff_reduction_factor;
  1403		struct dc_transfer_func *out_transfer_func;
  1404		struct dc_csc_transform *output_csc_transform;
  1405	};
  1406	
  1407	struct dc_surface_update {
  1408		struct dc_plane_state *surface;
  1409	
  1410		/* isr safe update parameters.  null means no updates */
  1411		const struct dc_flip_addrs *flip_addr;
  1412		const struct dc_plane_info *plane_info;
  1413		const struct dc_scaling_info *scaling_info;
  1414		struct fixed31_32 hdr_mult;
  1415		/* following updates require alloc/sleep/spin that is not isr safe,
  1416		 * null means no updates
  1417		 */
  1418		const struct dc_gamma *gamma;
  1419		const struct dc_transfer_func *in_transfer_func;
  1420	
  1421		const struct dc_csc_transform *input_csc_color_matrix;
  1422		const struct fixed31_32 *coeff_reduction_factor;
  1423		const struct dc_transfer_func *func_shaper;
  1424		const struct dc_3dlut *lut3d_func;
  1425		const struct dc_transfer_func *blend_tf;
  1426		const struct colorspace_transform *gamut_remap_matrix;
  1427	};
  1428	
  1429	/*
  1430	 * Create a new surface with default parameters;
  1431	 */
  1432	void dc_gamma_retain(struct dc_gamma *dc_gamma);
  1433	void dc_gamma_release(struct dc_gamma **dc_gamma);
  1434	struct dc_gamma *dc_create_gamma(void);
  1435	
  1436	void dc_transfer_func_retain(struct dc_transfer_func *dc_tf);
  1437	void dc_transfer_func_release(struct dc_transfer_func *dc_tf);
  1438	struct dc_transfer_func *dc_create_transfer_func(void);
  1439	
  1440	struct dc_3dlut *dc_create_3dlut_func(void);
  1441	void dc_3dlut_func_release(struct dc_3dlut *lut);
  1442	void dc_3dlut_func_retain(struct dc_3dlut *lut);
  1443	
  1444	void dc_post_update_surfaces_to_stream(
  1445			struct dc *dc);
  1446	
> 1447	#include "dc_stream.h"
  1448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
