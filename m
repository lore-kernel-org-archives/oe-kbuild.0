Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909433E9
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679843925; x=1711379925;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yf00nSznSTsAMqW+uKWO6byqWg2go0eE7BQBOxOhoWE=;
  b=dHH4KUNpXYzEDawZxPu7DNWPC5MaTe4TA13kFiNWuS+/OTS2l6YeEYne
   eqgWbVs9vDCMf+Fz4dT5z34sJM8Mktb6nTFIo+cC/Rfny7XS1JMyo/v/b
   Z/aWXBuoNS7OFdNwUDxjzBpA9QG+JJDSsbA594Nc3x1oK9HBnbYvRsqkR
   JvGA2GrB70IfTCWvqo1EJsHSOSRNi0LjW94nYemawjALEiYeQEX69NhfP
   xS8PqoGkW/u0pOAcHMiKlyj4lSn8MXiJQfUSpPFbJE09WlKQ2FimvtI9x
   GnE1D8m0MfaUU4w6vKg1klVV7H8M6VpRAzYtd8umDdm8lMT2iMpG2Z4HU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="342496245"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="342496245"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 08:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="772424292"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="772424292"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2023 08:18:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgS8o-000HCd-3D;
	Sun, 26 Mar 2023 15:18:43 +0000
Date: Sun, 26 Mar 2023 23:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:622:34:
 sparse: sparse: dubious: !x & y
Message-ID: <202303262308.9EsensUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:622:34: sparse: sparse: dubious: !x & y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ao Zhong <hacc1225@gmail.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   da8e7da11e4ba758caf4c149cc8d8cd555aefe5f
commit: 79b72db63392d35a4dbcd4743b95cb668691f790 drm/amd/display: add DCN support for ARM64
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-s053-20230326 (https://download.01.org/0day-ci/archive/20230326/202303262308.9EsensUl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=79b72db63392d35a4dbcd4743b95cb668691f790
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 79b72db63392d35a4dbcd4743b95cb668691f790
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303262308.9EsensUl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:622:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:710:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656:26: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:656:26: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:662:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:629:34: sparse: sparse: dubious: !x & y

vim +622 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c

74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  298  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  299  static void get_meta_and_pte_attr(
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  300  		struct display_mode_lib *mode_lib,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  301  		display_data_rq_dlg_params_st *rq_dlg_param,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  302  		display_data_rq_misc_params_st *rq_misc_param,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  303  		display_data_rq_sizing_params_st *rq_sizing_param,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  304  		unsigned int vp_width,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  305  		unsigned int vp_height,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  306  		unsigned int data_pitch,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  307  		unsigned int meta_pitch,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  308  		unsigned int source_format,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  309  		unsigned int tiling,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  310  		unsigned int macro_tile_size,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  311  		unsigned int source_scan,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  312  		unsigned int hostvm_enable,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  313  		unsigned int is_chroma,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  314  		unsigned int surface_height)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  315  {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  316  	bool surf_linear = (tiling == dm_sw_linear);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  317  	bool surf_vert = (source_scan == dm_vert);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  318  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  319  	unsigned int bytes_per_element;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  320  	unsigned int bytes_per_element_y;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  321  	unsigned int bytes_per_element_c;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  322  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  323  	unsigned int blk256_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  324  	unsigned int blk256_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  325  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  326  	unsigned int blk256_width_y = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  327  	unsigned int blk256_height_y = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  328  	unsigned int blk256_width_c = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  329  	unsigned int blk256_height_c = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  330  	unsigned int log2_bytes_per_element;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  331  	unsigned int log2_blk256_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  332  	unsigned int log2_blk256_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  333  	unsigned int blk_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  334  	unsigned int log2_blk_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  335  	unsigned int log2_blk_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  336  	unsigned int log2_blk_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  337  	unsigned int log2_meta_req_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  338  	unsigned int log2_meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  339  	unsigned int log2_meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  340  	unsigned int meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  341  	unsigned int meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  342  	unsigned int log2_meta_row_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  343  	unsigned int meta_row_width_ub;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  344  	unsigned int log2_meta_chunk_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  345  	unsigned int log2_meta_chunk_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  346  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  347  	//full sized meta chunk width in unit of data elements
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  348  	unsigned int log2_meta_chunk_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  349  	unsigned int log2_min_meta_chunk_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  350  	unsigned int min_meta_chunk_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  351  	unsigned int meta_chunk_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  352  	unsigned int meta_chunk_per_row_int;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  353  	unsigned int meta_row_remainder;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  354  	unsigned int meta_chunk_threshold;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  355  	unsigned int meta_blk_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  356  	unsigned int meta_surface_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  357  	unsigned int vmpg_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  358  	unsigned int meta_pte_req_per_frame_ub;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  359  	unsigned int meta_pte_bytes_per_frame_ub;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  360  	const unsigned int log2_vmpg_bytes = dml_log2(mode_lib->soc.gpuvm_min_page_size_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  361  	const bool dual_plane_en = is_dual_plane((enum source_format_class) (source_format));
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  362  	const unsigned int dpte_buf_in_pte_reqs =
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  363  			dual_plane_en ? (is_chroma ? mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma : mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma) : (mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  364  							+ mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  365  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  366  	unsigned int log2_vmpg_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  367  	unsigned int log2_vmpg_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  368  	unsigned int log2_dpte_req_height_ptes = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  369  	unsigned int log2_dpte_req_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  370  	unsigned int log2_dpte_req_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  371  	unsigned int log2_dpte_row_height_linear = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  372  	unsigned int log2_dpte_row_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  373  	unsigned int log2_dpte_group_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  374  	unsigned int dpte_row_width_ub = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  375  	unsigned int dpte_req_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  376  	unsigned int dpte_req_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  377  	unsigned int dpte_group_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  378  	unsigned int log2_dpte_group_bytes = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  379  	unsigned int log2_dpte_group_length = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  380  	double byte_per_pixel_det_y;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  381  	double byte_per_pixel_det_c;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  382  
fd3bc691fc7b4e Maíra Canal         2022-06-30  383  	dml30_CalculateBytePerPixelAnd256BBlockSizes(
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  384  			(enum source_format_class) (source_format),
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  385  			(enum dm_swizzle_mode) (tiling),
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  386  			&bytes_per_element_y,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  387  			&bytes_per_element_c,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  388  			&byte_per_pixel_det_y,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  389  			&byte_per_pixel_det_c,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  390  			&blk256_height_y,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  391  			&blk256_height_c,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  392  			&blk256_width_y,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  393  			&blk256_width_c);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  394  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  395  	if (!is_chroma) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  396  		blk256_width = blk256_width_y;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  397  		blk256_height = blk256_height_y;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  398  		bytes_per_element = bytes_per_element_y;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  399  	} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  400  		blk256_width = blk256_width_c;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  401  		blk256_height = blk256_height_c;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  402  		bytes_per_element = bytes_per_element_c;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  403  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  404  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  405  	log2_bytes_per_element = dml_log2(bytes_per_element);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  406  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  407  	dml_print("DML_DLG: %s: surf_linear        = %d\n", __func__, surf_linear);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  408  	dml_print("DML_DLG: %s: surf_vert          = %d\n", __func__, surf_vert);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  409  	dml_print("DML_DLG: %s: blk256_width       = %d\n", __func__, blk256_width);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  410  	dml_print("DML_DLG: %s: blk256_height      = %d\n", __func__, blk256_height);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  411  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  412  	log2_blk256_width = dml_log2((double) blk256_width);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  413  	log2_blk256_height = dml_log2((double) blk256_height);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  414  	blk_bytes = surf_linear ? 256 : get_blk_size_bytes((enum source_macro_tile_size) macro_tile_size);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  415  	log2_blk_bytes = dml_log2((double) blk_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  416  	log2_blk_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  417  	log2_blk_width = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  418  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  419  	// remember log rule
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  420  	// "+" in log is multiply
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  421  	// "-" in log is divide
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  422  	// "/2" is like square root
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  423  	// blk is vertical biased
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  424  	if (tiling != dm_sw_linear)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  425  		log2_blk_height = log2_blk256_height + dml_ceil((double) (log2_blk_bytes - 8) / 2.0, 1);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  426  	else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  427  		log2_blk_height = 0;	// blk height of 1
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  428  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  429  	log2_blk_width = log2_blk_bytes - log2_bytes_per_element - log2_blk_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  430  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  431  	if (!surf_vert) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  432  		int unsigned temp;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  433  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  434  		temp = dml_round_to_multiple(vp_width - 1, blk256_width, 1) + blk256_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  435  		if (data_pitch < blk256_width) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  436  			dml_print("WARNING: DML_DLG: %s: swath_size calculation ignoring data_pitch=%u < blk256_width=%u\n", __func__, data_pitch, blk256_width);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  437  		} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  438  			if (temp > data_pitch) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  439  				if (data_pitch >= vp_width)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  440  					temp = data_pitch;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  441  				else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  442  					dml_print("WARNING: DML_DLG: %s: swath_size calculation ignoring data_pitch=%u < vp_width=%u\n", __func__, data_pitch, vp_width);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  443  			}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  444  		}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  445  		rq_dlg_param->swath_width_ub = temp;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  446  		rq_dlg_param->req_per_swath_ub = temp >> log2_blk256_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  447  	} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  448  		int unsigned temp;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  449  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  450  		temp = dml_round_to_multiple(vp_height - 1, blk256_height, 1) + blk256_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  451  		if (surface_height < blk256_height) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  452  			dml_print("WARNING: DML_DLG: %s swath_size calculation ignored surface_height=%u < blk256_height=%u\n", __func__, surface_height, blk256_height);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  453  		} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  454  			if (temp > surface_height) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  455  				if (surface_height >= vp_height)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  456  					temp = surface_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  457  				else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  458  					dml_print("WARNING: DML_DLG: %s swath_size calculation ignored surface_height=%u < vp_height=%u\n", __func__, surface_height, vp_height);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  459  			}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  460  		}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  461  		rq_dlg_param->swath_width_ub = temp;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  462  		rq_dlg_param->req_per_swath_ub = temp >> log2_blk256_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  463  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  464  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  465  	if (!surf_vert)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  466  		rq_misc_param->full_swath_bytes = rq_dlg_param->swath_width_ub * blk256_height * bytes_per_element;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  467  	else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  468  		rq_misc_param->full_swath_bytes = rq_dlg_param->swath_width_ub * blk256_width * bytes_per_element;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  469  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  470  	rq_misc_param->blk256_height = blk256_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  471  	rq_misc_param->blk256_width = blk256_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  472  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  473  	// -------
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  474  	// meta
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  475  	// -------
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  476  	log2_meta_req_bytes = 6;	// meta request is 64b and is 8x8byte meta element
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  477  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  478  	// each 64b meta request for dcn is 8x8 meta elements and
4dc8e494bb73ed Cai Huoqing         2021-07-29  479  	// a meta element covers one 256b block of the data surface.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  480  	log2_meta_req_height = log2_blk256_height + 3;	// meta req is 8x8 byte, each byte represent 1 blk256
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  481  	log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element - log2_meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  482  	meta_req_width = 1 << log2_meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  483  	meta_req_height = 1 << log2_meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  484  	log2_meta_row_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  485  	meta_row_width_ub = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  486  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  487  	// the dimensions of a meta row are meta_row_width x meta_row_height in elements.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  488  	// calculate upper bound of the meta_row_width
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  489  	if (!surf_vert) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  490  		log2_meta_row_height = log2_meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  491  		meta_row_width_ub = dml_round_to_multiple(vp_width - 1, meta_req_width, 1) + meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  492  		rq_dlg_param->meta_req_per_row_ub = meta_row_width_ub / meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  493  	} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  494  		log2_meta_row_height = log2_meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  495  		meta_row_width_ub = dml_round_to_multiple(vp_height - 1, meta_req_height, 1) + meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  496  		rq_dlg_param->meta_req_per_row_ub = meta_row_width_ub / meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  497  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  498  	rq_dlg_param->meta_bytes_per_row_ub = rq_dlg_param->meta_req_per_row_ub * 64;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  499  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  500  	rq_dlg_param->meta_row_height = 1 << log2_meta_row_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  501  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  502  	log2_meta_chunk_bytes = dml_log2(rq_sizing_param->meta_chunk_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  503  	log2_meta_chunk_height = log2_meta_row_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  504  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  505  	//full sized meta chunk width in unit of data elements
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  506  	log2_meta_chunk_width = log2_meta_chunk_bytes + 8 - log2_bytes_per_element - log2_meta_chunk_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  507  	log2_min_meta_chunk_bytes = dml_log2(rq_sizing_param->min_meta_chunk_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  508  	min_meta_chunk_width = 1 << (log2_min_meta_chunk_bytes + 8 - log2_bytes_per_element - log2_meta_chunk_height);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  509  	meta_chunk_width = 1 << log2_meta_chunk_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  510  	meta_chunk_per_row_int = (unsigned int) (meta_row_width_ub / meta_chunk_width);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  511  	meta_row_remainder = meta_row_width_ub % meta_chunk_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  512  	meta_chunk_threshold = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  513  	meta_blk_height = blk256_height * 64;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  514  	meta_surface_bytes = meta_pitch * (dml_round_to_multiple(vp_height - 1, meta_blk_height, 1) + meta_blk_height) * bytes_per_element / 256;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  515  	vmpg_bytes = mode_lib->soc.gpuvm_min_page_size_bytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  516  	meta_pte_req_per_frame_ub = (dml_round_to_multiple(meta_surface_bytes - vmpg_bytes, 8 * vmpg_bytes, 1) + 8 * vmpg_bytes) / (8 * vmpg_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  517  	meta_pte_bytes_per_frame_ub = meta_pte_req_per_frame_ub * 64;	//64B mpte request
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  518  	rq_dlg_param->meta_pte_bytes_per_frame_ub = meta_pte_bytes_per_frame_ub;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  519  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  520  	dml_print("DML_DLG: %s: meta_blk_height             = %d\n", __func__, meta_blk_height);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  521  	dml_print("DML_DLG: %s: meta_surface_bytes          = %d\n", __func__, meta_surface_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  522  	dml_print("DML_DLG: %s: meta_pte_req_per_frame_ub   = %d\n", __func__, meta_pte_req_per_frame_ub);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  523  	dml_print("DML_DLG: %s: meta_pte_bytes_per_frame_ub = %d\n", __func__, meta_pte_bytes_per_frame_ub);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  524  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  525  	if (!surf_vert)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  526  		meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  527  	else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  528  		meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  529  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  530  	if (meta_row_remainder <= meta_chunk_threshold)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  531  		rq_dlg_param->meta_chunks_per_row_ub = meta_chunk_per_row_int + 1;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  532  	else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  533  		rq_dlg_param->meta_chunks_per_row_ub = meta_chunk_per_row_int + 2;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  534  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  535  	// ------
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  536  	// dpte
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  537  	// ------
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  538  	if (surf_linear) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  539  		log2_vmpg_height = 0;   // one line high
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  540  	} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  541  		log2_vmpg_height = (log2_vmpg_bytes - 8) / 2 + log2_blk256_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  542  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  543  	log2_vmpg_width = log2_vmpg_bytes - log2_bytes_per_element - log2_vmpg_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  544  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  545  	// only 3 possible shapes for dpte request in dimensions of ptes: 8x1, 4x2, 2x4.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  546  	if (surf_linear) { //one 64B PTE request returns 8 PTEs
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  547  		log2_dpte_req_height_ptes = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  548  		log2_dpte_req_width = log2_vmpg_width + 3;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  549  		log2_dpte_req_height = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  550  	} else if (log2_blk_bytes == 12) { //4KB tile means 4kB page size
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  551  		//one 64B req gives 8x1 PTEs for 4KB tile
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  552  		log2_dpte_req_height_ptes = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  553  		log2_dpte_req_width = log2_blk_width + 3;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  554  		log2_dpte_req_height = log2_blk_height + 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  555  	} else if ((log2_blk_bytes >= 16) && (log2_vmpg_bytes == 12)) { // tile block >= 64KB
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  556  		//two 64B reqs of 2x4 PTEs give 16 PTEs to cover 64KB
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  557  		log2_dpte_req_height_ptes = 4;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  558  		log2_dpte_req_width = log2_blk256_width + 4;		// log2_64KB_width
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  559  		log2_dpte_req_height = log2_blk256_height + 4;		// log2_64KB_height
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  560  	} else { //64KB page size and must 64KB tile block
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  561  		 //one 64B req gives 8x1 PTEs for 64KB tile
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  562  		log2_dpte_req_height_ptes = 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  563  		log2_dpte_req_width = log2_blk_width + 3;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  564  		log2_dpte_req_height = log2_blk_height + 0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  565  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  566  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  567  	// The dpte request dimensions in data elements is dpte_req_width x dpte_req_height
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  568  	// log2_vmpg_width is how much 1 pte represent, now calculating how much a 64b pte req represent
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  569  	// That depends on the pte shape (i.e. 8x1, 4x2, 2x4)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  570  	//log2_dpte_req_height    = log2_vmpg_height + log2_dpte_req_height_ptes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  571  	//log2_dpte_req_width     = log2_vmpg_width + log2_dpte_req_width_ptes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  572  	dpte_req_height = 1 << log2_dpte_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  573  	dpte_req_width = 1 << log2_dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  574  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  575  	// calculate pitch dpte row buffer can hold
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  576  	// round the result down to a power of two.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  577  	if (surf_linear) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  578  		unsigned int dpte_row_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  579  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  580  		log2_dpte_row_height_linear = dml_floor(dml_log2(dpte_buf_in_pte_reqs * dpte_req_width / data_pitch), 1);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  581  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  582  		dml_print("DML_DLG: %s: is_chroma                   = %d\n", __func__, is_chroma);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  583  		dml_print("DML_DLG: %s: dpte_buf_in_pte_reqs        = %d\n", __func__, dpte_buf_in_pte_reqs);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  584  		dml_print("DML_DLG: %s: log2_dpte_row_height_linear = %d\n", __func__, log2_dpte_row_height_linear);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  585  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  586  		ASSERT(log2_dpte_row_height_linear >= 3);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  587  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  588  		if (log2_dpte_row_height_linear > 7)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  589  			log2_dpte_row_height_linear = 7;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  590  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  591  		log2_dpte_row_height = log2_dpte_row_height_linear;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  592  		// For linear, the dpte row is pitch dependent and the pte requests wrap at the pitch boundary.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  593  		// the dpte_row_width_ub is the upper bound of data_pitch*dpte_row_height in elements with this unique buffering.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  594  		dpte_row_height = 1 << log2_dpte_row_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  595  		dpte_row_width_ub = dml_round_to_multiple(data_pitch * dpte_row_height - 1, dpte_req_width, 1) + dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  596  		rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  597  	} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  598  		// the upper bound of the dpte_row_width without dependency on viewport position follows.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  599  		// for tiled mode, row height is the same as req height and row store up to vp size upper bound
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  600  		if (!surf_vert) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  601  			log2_dpte_row_height = log2_dpte_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  602  			dpte_row_width_ub = dml_round_to_multiple(vp_width - 1, dpte_req_width, 1) + dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  603  			rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  604  		} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  605  			log2_dpte_row_height = (log2_blk_width < log2_dpte_req_width) ? log2_blk_width : log2_dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  606  			dpte_row_width_ub = dml_round_to_multiple(vp_height - 1, dpte_req_height, 1) + dpte_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  607  			rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  608  		}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  609  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  610  	if (log2_blk_bytes >= 16 && log2_vmpg_bytes == 12) // tile block >= 64KB
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  611  		rq_dlg_param->dpte_bytes_per_row_ub = rq_dlg_param->dpte_req_per_row_ub * 128; //2*64B dpte request
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  612  	else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  613  		rq_dlg_param->dpte_bytes_per_row_ub = rq_dlg_param->dpte_req_per_row_ub * 64; //64B dpte request
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  614  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  615  	rq_dlg_param->dpte_row_height = 1 << log2_dpte_row_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  616  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  617  	// the dpte_group_bytes is reduced for the specific case of vertical
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  618  	// access of a tile surface that has dpte request of 8x1 ptes.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  619  	if (hostvm_enable)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  620  		rq_sizing_param->dpte_group_bytes = 512;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  621  	else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19 @622  		if (!surf_linear & (log2_dpte_req_height_ptes == 0) & surf_vert) //reduced, in this case, will have page fault within a group
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  623  			rq_sizing_param->dpte_group_bytes = 512;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  624  		else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  625  			rq_sizing_param->dpte_group_bytes = 2048;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  626  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  627  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  628  	//since pte request size is 64byte, the number of data pte requests per full sized group is as follows.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  629  	log2_dpte_group_bytes = dml_log2(rq_sizing_param->dpte_group_bytes);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  630  	log2_dpte_group_length = log2_dpte_group_bytes - 6; //length in 64b requests
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  631  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  632  	// full sized data pte group width in elements
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  633  	if (!surf_vert)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  634  		log2_dpte_group_width = log2_dpte_group_length + log2_dpte_req_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  635  	else
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  636  		log2_dpte_group_width = log2_dpte_group_length + log2_dpte_req_height;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  637  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  638  	//But if the tile block >=64KB and the page size is 4KB, then each dPTE request is 2*64B
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  639  	if ((log2_blk_bytes >= 16) && (log2_vmpg_bytes == 12)) // tile block >= 64KB
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  640  		log2_dpte_group_width = log2_dpte_group_width - 1;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  641  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  642  	dpte_group_width = 1 << log2_dpte_group_width;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  643  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  644  	// since dpte groups are only aligned to dpte_req_width and not dpte_group_width,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  645  	// the upper bound for the dpte groups per row is as follows.
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  646  	rq_dlg_param->dpte_groups_per_row_ub = dml_ceil((double) dpte_row_width_ub / dpte_group_width, 1);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  647  }
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  648  

:::::: The code at line 622 was first introduced by commit
:::::: 74458c081fcfb0423877e630de2746daefdb16e4 drm/amd/display: Add DCN3.1 DML calculation support

:::::: TO: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
