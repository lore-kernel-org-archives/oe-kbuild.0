Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2E17D9
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674985081; x=1706521081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gQhKnw64DUiGZ0nXqHtTxdr2jeUysKzQ5z6q/GNWKGU=;
  b=esOHv/vsngKRiwNxsUc5e9jVgGqOHvKmPQAfCDs/hvns5mijEuzxAbxn
   NXRl3jihd/iE+o9448Yhhwx2TGlkK2LfSL9YH1sMoy8fQgqs+7YqBEWT3
   l3N/juZB1o8umyIviAvTc8gy5AOtnOrc2dMMLKEQ74tqYEvoQM4lkeOu+
   jV0PfQ2cgo/Ax2Niu3UTiUMDiSmcBqf6It765mj+v+uxeBJ3d8mJmB3UL
   YIzY0czrF83C70XHCcnN2pbIZAPfJd6RVOQKqU5rtUSrvahi7SvSFu0qQ
   jHXMH7cCXqPudIN/hzqkmTnF3bpayOk7X5s6Zvgd6f9PXgvctyyRhr2QW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391938000"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="391938000"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 01:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663775897"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="663775897"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jan 2023 01:37:59 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM48M-0002fa-13;
	Sun, 29 Jan 2023 09:37:58 +0000
Date: Sun, 29 Jan 2023 17:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656:26:
 sparse: sparse: dubious: !x & y
Message-ID: <202301291750.D3YOFVqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656:26: sparse: sparse: dubious: !x & y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ao Zhong <hacc1225@gmail.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 79b72db63392d35a4dbcd4743b95cb668691f790 drm/amd/display: add DCN support for ARM64
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-s053-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291750.D3YOFVqF-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656:26: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:656:26: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:662:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:629:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:622:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:710:34: sparse: sparse: dubious: !x & y
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:152:63: sparse: sparse: cast truncates bits from constant value (ffff becomes ff)

vim +656 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c

728c06986a4f38 Harry Wentland 2019-02-22  333  
728c06986a4f38 Harry Wentland 2019-02-22  334  static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
728c06986a4f38 Harry Wentland 2019-02-22  335  		display_data_rq_dlg_params_st *rq_dlg_param,
728c06986a4f38 Harry Wentland 2019-02-22  336  		display_data_rq_misc_params_st *rq_misc_param,
728c06986a4f38 Harry Wentland 2019-02-22  337  		display_data_rq_sizing_params_st *rq_sizing_param,
728c06986a4f38 Harry Wentland 2019-02-22  338  		unsigned int vp_width,
728c06986a4f38 Harry Wentland 2019-02-22  339  		unsigned int vp_height,
728c06986a4f38 Harry Wentland 2019-02-22  340  		unsigned int data_pitch,
728c06986a4f38 Harry Wentland 2019-02-22  341  		unsigned int meta_pitch,
728c06986a4f38 Harry Wentland 2019-02-22  342  		unsigned int source_format,
728c06986a4f38 Harry Wentland 2019-02-22  343  		unsigned int tiling,
728c06986a4f38 Harry Wentland 2019-02-22  344  		unsigned int macro_tile_size,
728c06986a4f38 Harry Wentland 2019-02-22  345  		unsigned int source_scan,
728c06986a4f38 Harry Wentland 2019-02-22  346  		unsigned int is_chroma)
728c06986a4f38 Harry Wentland 2019-02-22  347  {
728c06986a4f38 Harry Wentland 2019-02-22  348  	bool surf_linear = (tiling == dm_sw_linear);
728c06986a4f38 Harry Wentland 2019-02-22  349  	bool surf_vert = (source_scan == dm_vert);
728c06986a4f38 Harry Wentland 2019-02-22  350  
728c06986a4f38 Harry Wentland 2019-02-22  351  	unsigned int bytes_per_element;
728c06986a4f38 Harry Wentland 2019-02-22  352  	unsigned int bytes_per_element_y = get_bytes_per_element((enum source_format_class)(source_format),
728c06986a4f38 Harry Wentland 2019-02-22  353  			false);
728c06986a4f38 Harry Wentland 2019-02-22  354  	unsigned int bytes_per_element_c = get_bytes_per_element((enum source_format_class)(source_format),
728c06986a4f38 Harry Wentland 2019-02-22  355  			true);
728c06986a4f38 Harry Wentland 2019-02-22  356  
728c06986a4f38 Harry Wentland 2019-02-22  357  	unsigned int blk256_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  358  	unsigned int blk256_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  359  
728c06986a4f38 Harry Wentland 2019-02-22  360  	unsigned int blk256_width_y = 0;
728c06986a4f38 Harry Wentland 2019-02-22  361  	unsigned int blk256_height_y = 0;
728c06986a4f38 Harry Wentland 2019-02-22  362  	unsigned int blk256_width_c = 0;
728c06986a4f38 Harry Wentland 2019-02-22  363  	unsigned int blk256_height_c = 0;
728c06986a4f38 Harry Wentland 2019-02-22  364  	unsigned int log2_bytes_per_element;
728c06986a4f38 Harry Wentland 2019-02-22  365  	unsigned int log2_blk256_width;
728c06986a4f38 Harry Wentland 2019-02-22  366  	unsigned int log2_blk256_height;
728c06986a4f38 Harry Wentland 2019-02-22  367  	unsigned int blk_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  368  	unsigned int log2_blk_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  369  	unsigned int log2_blk_height;
728c06986a4f38 Harry Wentland 2019-02-22  370  	unsigned int log2_blk_width;
728c06986a4f38 Harry Wentland 2019-02-22  371  	unsigned int log2_meta_req_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  372  	unsigned int log2_meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  373  	unsigned int log2_meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  374  	unsigned int meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  375  	unsigned int meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  376  	unsigned int log2_meta_row_height;
728c06986a4f38 Harry Wentland 2019-02-22  377  	unsigned int meta_row_width_ub;
728c06986a4f38 Harry Wentland 2019-02-22  378  	unsigned int log2_meta_chunk_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  379  	unsigned int log2_meta_chunk_height;
728c06986a4f38 Harry Wentland 2019-02-22  380  
728c06986a4f38 Harry Wentland 2019-02-22  381  	//full sized meta chunk width in unit of data elements
728c06986a4f38 Harry Wentland 2019-02-22  382  	unsigned int log2_meta_chunk_width;
728c06986a4f38 Harry Wentland 2019-02-22  383  	unsigned int log2_min_meta_chunk_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  384  	unsigned int min_meta_chunk_width;
728c06986a4f38 Harry Wentland 2019-02-22  385  	unsigned int meta_chunk_width;
728c06986a4f38 Harry Wentland 2019-02-22  386  	unsigned int meta_chunk_per_row_int;
728c06986a4f38 Harry Wentland 2019-02-22  387  	unsigned int meta_row_remainder;
728c06986a4f38 Harry Wentland 2019-02-22  388  	unsigned int meta_chunk_threshold;
728c06986a4f38 Harry Wentland 2019-02-22  389  	unsigned int meta_blk_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  390  	unsigned int meta_blk_height;
728c06986a4f38 Harry Wentland 2019-02-22  391  	unsigned int meta_blk_width;
728c06986a4f38 Harry Wentland 2019-02-22  392  	unsigned int meta_surface_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  393  	unsigned int vmpg_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  394  	unsigned int meta_pte_req_per_frame_ub;
728c06986a4f38 Harry Wentland 2019-02-22  395  	unsigned int meta_pte_bytes_per_frame_ub;
728c06986a4f38 Harry Wentland 2019-02-22  396  	const unsigned int log2_vmpg_bytes = dml_log2(mode_lib->soc.vmm_page_size_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  397  	const unsigned int dpte_buf_in_pte_reqs = mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma;
728c06986a4f38 Harry Wentland 2019-02-22  398  	const unsigned int pde_proc_buffer_size_64k_reqs =
728c06986a4f38 Harry Wentland 2019-02-22  399  			mode_lib->ip.pde_proc_buffer_size_64k_reqs;
728c06986a4f38 Harry Wentland 2019-02-22  400  
728c06986a4f38 Harry Wentland 2019-02-22  401  	unsigned int log2_vmpg_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  402  	unsigned int log2_vmpg_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  403  	unsigned int log2_dpte_req_height_ptes = 0;
728c06986a4f38 Harry Wentland 2019-02-22  404  	unsigned int log2_dpte_req_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  405  	unsigned int log2_dpte_req_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  406  	unsigned int log2_dpte_row_height_linear = 0;
728c06986a4f38 Harry Wentland 2019-02-22  407  	unsigned int log2_dpte_row_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  408  	unsigned int log2_dpte_group_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  409  	unsigned int dpte_row_width_ub = 0;
728c06986a4f38 Harry Wentland 2019-02-22  410  	unsigned int dpte_req_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  411  	unsigned int dpte_req_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  412  	unsigned int dpte_group_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  413  	unsigned int log2_dpte_group_bytes = 0;
728c06986a4f38 Harry Wentland 2019-02-22  414  	unsigned int log2_dpte_group_length = 0;
728c06986a4f38 Harry Wentland 2019-02-22  415  	unsigned int pde_buf_entries;
728c06986a4f38 Harry Wentland 2019-02-22  416  	bool yuv420 = (source_format == dm_420_8 || source_format == dm_420_10);
728c06986a4f38 Harry Wentland 2019-02-22  417  
728c06986a4f38 Harry Wentland 2019-02-22  418  	Calculate256BBlockSizes((enum source_format_class)(source_format),
728c06986a4f38 Harry Wentland 2019-02-22  419  			(enum dm_swizzle_mode)(tiling),
728c06986a4f38 Harry Wentland 2019-02-22  420  			bytes_per_element_y,
728c06986a4f38 Harry Wentland 2019-02-22  421  			bytes_per_element_c,
728c06986a4f38 Harry Wentland 2019-02-22  422  			&blk256_height_y,
728c06986a4f38 Harry Wentland 2019-02-22  423  			&blk256_height_c,
728c06986a4f38 Harry Wentland 2019-02-22  424  			&blk256_width_y,
728c06986a4f38 Harry Wentland 2019-02-22  425  			&blk256_width_c);
728c06986a4f38 Harry Wentland 2019-02-22  426  
728c06986a4f38 Harry Wentland 2019-02-22  427  	if (!is_chroma) {
728c06986a4f38 Harry Wentland 2019-02-22  428  		blk256_width = blk256_width_y;
728c06986a4f38 Harry Wentland 2019-02-22  429  		blk256_height = blk256_height_y;
728c06986a4f38 Harry Wentland 2019-02-22  430  		bytes_per_element = bytes_per_element_y;
728c06986a4f38 Harry Wentland 2019-02-22  431  	} else {
728c06986a4f38 Harry Wentland 2019-02-22  432  		blk256_width = blk256_width_c;
728c06986a4f38 Harry Wentland 2019-02-22  433  		blk256_height = blk256_height_c;
728c06986a4f38 Harry Wentland 2019-02-22  434  		bytes_per_element = bytes_per_element_c;
728c06986a4f38 Harry Wentland 2019-02-22  435  	}
728c06986a4f38 Harry Wentland 2019-02-22  436  
728c06986a4f38 Harry Wentland 2019-02-22  437  	log2_bytes_per_element = dml_log2(bytes_per_element);
728c06986a4f38 Harry Wentland 2019-02-22  438  
728c06986a4f38 Harry Wentland 2019-02-22  439  	dml_print("DML_DLG: %s: surf_linear        = %d\n", __func__, surf_linear);
728c06986a4f38 Harry Wentland 2019-02-22  440  	dml_print("DML_DLG: %s: surf_vert          = %d\n", __func__, surf_vert);
728c06986a4f38 Harry Wentland 2019-02-22  441  	dml_print("DML_DLG: %s: blk256_width       = %d\n", __func__, blk256_width);
728c06986a4f38 Harry Wentland 2019-02-22  442  	dml_print("DML_DLG: %s: blk256_height      = %d\n", __func__, blk256_height);
728c06986a4f38 Harry Wentland 2019-02-22  443  
728c06986a4f38 Harry Wentland 2019-02-22  444  	log2_blk256_width = dml_log2((double) blk256_width);
728c06986a4f38 Harry Wentland 2019-02-22  445  	log2_blk256_height = dml_log2((double) blk256_height);
728c06986a4f38 Harry Wentland 2019-02-22  446  	blk_bytes = surf_linear ?
728c06986a4f38 Harry Wentland 2019-02-22  447  			256 : get_blk_size_bytes((enum source_macro_tile_size) macro_tile_size);
728c06986a4f38 Harry Wentland 2019-02-22  448  	log2_blk_bytes = dml_log2((double) blk_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  449  	log2_blk_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  450  	log2_blk_width = 0;
728c06986a4f38 Harry Wentland 2019-02-22  451  
728c06986a4f38 Harry Wentland 2019-02-22  452  	// remember log rule
728c06986a4f38 Harry Wentland 2019-02-22  453  	// "+" in log is multiply
728c06986a4f38 Harry Wentland 2019-02-22  454  	// "-" in log is divide
728c06986a4f38 Harry Wentland 2019-02-22  455  	// "/2" is like square root
728c06986a4f38 Harry Wentland 2019-02-22  456  	// blk is vertical biased
728c06986a4f38 Harry Wentland 2019-02-22  457  	if (tiling != dm_sw_linear)
728c06986a4f38 Harry Wentland 2019-02-22  458  		log2_blk_height = log2_blk256_height
728c06986a4f38 Harry Wentland 2019-02-22  459  				+ dml_ceil((double) (log2_blk_bytes - 8) / 2.0, 1);
728c06986a4f38 Harry Wentland 2019-02-22  460  	else
728c06986a4f38 Harry Wentland 2019-02-22  461  		log2_blk_height = 0;  // blk height of 1
728c06986a4f38 Harry Wentland 2019-02-22  462  
728c06986a4f38 Harry Wentland 2019-02-22  463  	log2_blk_width = log2_blk_bytes - log2_bytes_per_element - log2_blk_height;
728c06986a4f38 Harry Wentland 2019-02-22  464  
728c06986a4f38 Harry Wentland 2019-02-22  465  	if (!surf_vert) {
728c06986a4f38 Harry Wentland 2019-02-22  466  		rq_dlg_param->swath_width_ub = dml_round_to_multiple(vp_width - 1, blk256_width, 1)
728c06986a4f38 Harry Wentland 2019-02-22  467  				+ blk256_width;
728c06986a4f38 Harry Wentland 2019-02-22  468  		rq_dlg_param->req_per_swath_ub = rq_dlg_param->swath_width_ub >> log2_blk256_width;
728c06986a4f38 Harry Wentland 2019-02-22  469  	} else {
728c06986a4f38 Harry Wentland 2019-02-22  470  		rq_dlg_param->swath_width_ub = dml_round_to_multiple(vp_height - 1, blk256_height, 1)
728c06986a4f38 Harry Wentland 2019-02-22  471  				+ blk256_height;
728c06986a4f38 Harry Wentland 2019-02-22  472  		rq_dlg_param->req_per_swath_ub = rq_dlg_param->swath_width_ub >> log2_blk256_height;
728c06986a4f38 Harry Wentland 2019-02-22  473  	}
728c06986a4f38 Harry Wentland 2019-02-22  474  
728c06986a4f38 Harry Wentland 2019-02-22  475  	if (!surf_vert)
728c06986a4f38 Harry Wentland 2019-02-22  476  		rq_misc_param->full_swath_bytes = rq_dlg_param->swath_width_ub * blk256_height
728c06986a4f38 Harry Wentland 2019-02-22  477  				* bytes_per_element;
728c06986a4f38 Harry Wentland 2019-02-22  478  	else
728c06986a4f38 Harry Wentland 2019-02-22  479  		rq_misc_param->full_swath_bytes = rq_dlg_param->swath_width_ub * blk256_width
728c06986a4f38 Harry Wentland 2019-02-22  480  				* bytes_per_element;
728c06986a4f38 Harry Wentland 2019-02-22  481  
728c06986a4f38 Harry Wentland 2019-02-22  482  	rq_misc_param->blk256_height = blk256_height;
728c06986a4f38 Harry Wentland 2019-02-22  483  	rq_misc_param->blk256_width = blk256_width;
728c06986a4f38 Harry Wentland 2019-02-22  484  
728c06986a4f38 Harry Wentland 2019-02-22  485  	// -------
728c06986a4f38 Harry Wentland 2019-02-22  486  	// meta
728c06986a4f38 Harry Wentland 2019-02-22  487  	// -------
728c06986a4f38 Harry Wentland 2019-02-22  488  	log2_meta_req_bytes = 6; // meta request is 64b and is 8x8byte meta element
728c06986a4f38 Harry Wentland 2019-02-22  489  
728c06986a4f38 Harry Wentland 2019-02-22  490  	// each 64b meta request for dcn is 8x8 meta elements and
4dc8e494bb73ed Cai Huoqing    2021-07-29  491  	// a meta element covers one 256b block of the data surface.
728c06986a4f38 Harry Wentland 2019-02-22  492  	log2_meta_req_height = log2_blk256_height + 3; // meta req is 8x8 byte, each byte represent 1 blk256
728c06986a4f38 Harry Wentland 2019-02-22  493  	log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
728c06986a4f38 Harry Wentland 2019-02-22  494  			- log2_meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  495  	meta_req_width = 1 << log2_meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  496  	meta_req_height = 1 << log2_meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  497  	log2_meta_row_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  498  	meta_row_width_ub = 0;
728c06986a4f38 Harry Wentland 2019-02-22  499  
728c06986a4f38 Harry Wentland 2019-02-22  500  	// the dimensions of a meta row are meta_row_width x meta_row_height in elements.
728c06986a4f38 Harry Wentland 2019-02-22  501  	// calculate upper bound of the meta_row_width
728c06986a4f38 Harry Wentland 2019-02-22  502  	if (!surf_vert) {
728c06986a4f38 Harry Wentland 2019-02-22  503  		log2_meta_row_height = log2_meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  504  		meta_row_width_ub = dml_round_to_multiple(vp_width - 1, meta_req_width, 1)
728c06986a4f38 Harry Wentland 2019-02-22  505  				+ meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  506  		rq_dlg_param->meta_req_per_row_ub = meta_row_width_ub / meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  507  	} else {
728c06986a4f38 Harry Wentland 2019-02-22  508  		log2_meta_row_height = log2_meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  509  		meta_row_width_ub = dml_round_to_multiple(vp_height - 1, meta_req_height, 1)
728c06986a4f38 Harry Wentland 2019-02-22  510  				+ meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  511  		rq_dlg_param->meta_req_per_row_ub = meta_row_width_ub / meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  512  	}
728c06986a4f38 Harry Wentland 2019-02-22  513  	rq_dlg_param->meta_bytes_per_row_ub = rq_dlg_param->meta_req_per_row_ub * 64;
728c06986a4f38 Harry Wentland 2019-02-22  514  
728c06986a4f38 Harry Wentland 2019-02-22  515  	rq_dlg_param->meta_row_height = 1 << log2_meta_row_height;
728c06986a4f38 Harry Wentland 2019-02-22  516  
728c06986a4f38 Harry Wentland 2019-02-22  517  	log2_meta_chunk_bytes = dml_log2(rq_sizing_param->meta_chunk_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  518  	log2_meta_chunk_height = log2_meta_row_height;
728c06986a4f38 Harry Wentland 2019-02-22  519  
728c06986a4f38 Harry Wentland 2019-02-22  520  	//full sized meta chunk width in unit of data elements
728c06986a4f38 Harry Wentland 2019-02-22  521  	log2_meta_chunk_width = log2_meta_chunk_bytes + 8 - log2_bytes_per_element
728c06986a4f38 Harry Wentland 2019-02-22  522  			- log2_meta_chunk_height;
728c06986a4f38 Harry Wentland 2019-02-22  523  	log2_min_meta_chunk_bytes = dml_log2(rq_sizing_param->min_meta_chunk_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  524  	min_meta_chunk_width = 1
728c06986a4f38 Harry Wentland 2019-02-22  525  			<< (log2_min_meta_chunk_bytes + 8 - log2_bytes_per_element
728c06986a4f38 Harry Wentland 2019-02-22  526  					- log2_meta_chunk_height);
728c06986a4f38 Harry Wentland 2019-02-22  527  	meta_chunk_width = 1 << log2_meta_chunk_width;
728c06986a4f38 Harry Wentland 2019-02-22  528  	meta_chunk_per_row_int = (unsigned int) (meta_row_width_ub / meta_chunk_width);
728c06986a4f38 Harry Wentland 2019-02-22  529  	meta_row_remainder = meta_row_width_ub % meta_chunk_width;
728c06986a4f38 Harry Wentland 2019-02-22  530  	meta_chunk_threshold = 0;
728c06986a4f38 Harry Wentland 2019-02-22  531  	meta_blk_bytes = 4096;
728c06986a4f38 Harry Wentland 2019-02-22  532  	meta_blk_height = blk256_height * 64;
728c06986a4f38 Harry Wentland 2019-02-22  533  	meta_blk_width = meta_blk_bytes * 256 / bytes_per_element / meta_blk_height;
728c06986a4f38 Harry Wentland 2019-02-22  534  	meta_surface_bytes = meta_pitch
728c06986a4f38 Harry Wentland 2019-02-22  535  			* (dml_round_to_multiple(vp_height - 1, meta_blk_height, 1) + meta_blk_height)
728c06986a4f38 Harry Wentland 2019-02-22  536  			* bytes_per_element / 256;
728c06986a4f38 Harry Wentland 2019-02-22  537  	vmpg_bytes = mode_lib->soc.vmm_page_size_bytes;
728c06986a4f38 Harry Wentland 2019-02-22  538  	meta_pte_req_per_frame_ub = (dml_round_to_multiple(meta_surface_bytes - vmpg_bytes,
728c06986a4f38 Harry Wentland 2019-02-22  539  			8 * vmpg_bytes,
728c06986a4f38 Harry Wentland 2019-02-22  540  			1) + 8 * vmpg_bytes) / (8 * vmpg_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  541  	meta_pte_bytes_per_frame_ub = meta_pte_req_per_frame_ub * 64; //64B mpte request
728c06986a4f38 Harry Wentland 2019-02-22  542  	rq_dlg_param->meta_pte_bytes_per_frame_ub = meta_pte_bytes_per_frame_ub;
728c06986a4f38 Harry Wentland 2019-02-22  543  
728c06986a4f38 Harry Wentland 2019-02-22  544  	dml_print("DML_DLG: %s: meta_blk_height             = %d\n", __func__, meta_blk_height);
728c06986a4f38 Harry Wentland 2019-02-22  545  	dml_print("DML_DLG: %s: meta_blk_width              = %d\n", __func__, meta_blk_width);
728c06986a4f38 Harry Wentland 2019-02-22  546  	dml_print("DML_DLG: %s: meta_surface_bytes          = %d\n", __func__, meta_surface_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  547  	dml_print("DML_DLG: %s: meta_pte_req_per_frame_ub   = %d\n",
728c06986a4f38 Harry Wentland 2019-02-22  548  			__func__,
728c06986a4f38 Harry Wentland 2019-02-22  549  			meta_pte_req_per_frame_ub);
728c06986a4f38 Harry Wentland 2019-02-22  550  	dml_print("DML_DLG: %s: meta_pte_bytes_per_frame_ub = %d\n",
728c06986a4f38 Harry Wentland 2019-02-22  551  			__func__,
728c06986a4f38 Harry Wentland 2019-02-22  552  			meta_pte_bytes_per_frame_ub);
728c06986a4f38 Harry Wentland 2019-02-22  553  
728c06986a4f38 Harry Wentland 2019-02-22  554  	if (!surf_vert)
728c06986a4f38 Harry Wentland 2019-02-22  555  		meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  556  	else
728c06986a4f38 Harry Wentland 2019-02-22  557  		meta_chunk_threshold = 2 * min_meta_chunk_width - meta_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  558  
728c06986a4f38 Harry Wentland 2019-02-22  559  	if (meta_row_remainder <= meta_chunk_threshold)
728c06986a4f38 Harry Wentland 2019-02-22  560  		rq_dlg_param->meta_chunks_per_row_ub = meta_chunk_per_row_int + 1;
728c06986a4f38 Harry Wentland 2019-02-22  561  	else
728c06986a4f38 Harry Wentland 2019-02-22  562  		rq_dlg_param->meta_chunks_per_row_ub = meta_chunk_per_row_int + 2;
728c06986a4f38 Harry Wentland 2019-02-22  563  
728c06986a4f38 Harry Wentland 2019-02-22  564  	// ------
728c06986a4f38 Harry Wentland 2019-02-22  565  	// dpte
728c06986a4f38 Harry Wentland 2019-02-22  566  	// ------
728c06986a4f38 Harry Wentland 2019-02-22  567  	if (surf_linear) {
728c06986a4f38 Harry Wentland 2019-02-22  568  		log2_vmpg_height = 0;   // one line high
728c06986a4f38 Harry Wentland 2019-02-22  569  	} else {
728c06986a4f38 Harry Wentland 2019-02-22  570  		log2_vmpg_height = (log2_vmpg_bytes - 8) / 2 + log2_blk256_height;
728c06986a4f38 Harry Wentland 2019-02-22  571  	}
728c06986a4f38 Harry Wentland 2019-02-22  572  	log2_vmpg_width = log2_vmpg_bytes - log2_bytes_per_element - log2_vmpg_height;
728c06986a4f38 Harry Wentland 2019-02-22  573  
728c06986a4f38 Harry Wentland 2019-02-22  574  	// only 3 possible shapes for dpte request in dimensions of ptes: 8x1, 4x2, 2x4.
728c06986a4f38 Harry Wentland 2019-02-22  575  	if (surf_linear) { //one 64B PTE request returns 8 PTEs
728c06986a4f38 Harry Wentland 2019-02-22  576  		log2_dpte_req_height_ptes = 0;
728c06986a4f38 Harry Wentland 2019-02-22  577  		log2_dpte_req_width = log2_vmpg_width + 3;
728c06986a4f38 Harry Wentland 2019-02-22  578  		log2_dpte_req_height = 0;
728c06986a4f38 Harry Wentland 2019-02-22  579  	} else if (log2_blk_bytes == 12) { //4KB tile means 4kB page size
728c06986a4f38 Harry Wentland 2019-02-22  580  		//one 64B req gives 8x1 PTEs for 4KB tile
728c06986a4f38 Harry Wentland 2019-02-22  581  		log2_dpte_req_height_ptes = 0;
728c06986a4f38 Harry Wentland 2019-02-22  582  		log2_dpte_req_width = log2_blk_width + 3;
728c06986a4f38 Harry Wentland 2019-02-22  583  		log2_dpte_req_height = log2_blk_height + 0;
728c06986a4f38 Harry Wentland 2019-02-22  584  	} else if ((log2_blk_bytes >= 16) && (log2_vmpg_bytes == 12)) { // tile block >= 64KB
728c06986a4f38 Harry Wentland 2019-02-22  585  		//two 64B reqs of 2x4 PTEs give 16 PTEs to cover 64KB
728c06986a4f38 Harry Wentland 2019-02-22  586  		log2_dpte_req_height_ptes = 4;
728c06986a4f38 Harry Wentland 2019-02-22  587  		log2_dpte_req_width = log2_blk256_width + 4; // log2_64KB_width
728c06986a4f38 Harry Wentland 2019-02-22  588  		log2_dpte_req_height = log2_blk256_height + 4; // log2_64KB_height
728c06986a4f38 Harry Wentland 2019-02-22  589  	} else { //64KB page size and must 64KB tile block
728c06986a4f38 Harry Wentland 2019-02-22  590  		 //one 64B req gives 8x1 PTEs for 64KB tile
728c06986a4f38 Harry Wentland 2019-02-22  591  		log2_dpte_req_height_ptes = 0;
728c06986a4f38 Harry Wentland 2019-02-22  592  		log2_dpte_req_width = log2_blk_width + 3;
728c06986a4f38 Harry Wentland 2019-02-22  593  		log2_dpte_req_height = log2_blk_height + 0;
728c06986a4f38 Harry Wentland 2019-02-22  594  	}
728c06986a4f38 Harry Wentland 2019-02-22  595  
728c06986a4f38 Harry Wentland 2019-02-22  596  	// The dpte request dimensions in data elements is dpte_req_width x dpte_req_height
728c06986a4f38 Harry Wentland 2019-02-22  597  	// log2_vmpg_width is how much 1 pte represent, now calculating how much a 64b pte req represent
728c06986a4f38 Harry Wentland 2019-02-22  598  	// That depends on the pte shape (i.e. 8x1, 4x2, 2x4)
728c06986a4f38 Harry Wentland 2019-02-22  599  	//log2_dpte_req_height    = log2_vmpg_height + log2_dpte_req_height_ptes;
728c06986a4f38 Harry Wentland 2019-02-22  600  	//log2_dpte_req_width     = log2_vmpg_width + log2_dpte_req_width_ptes;
728c06986a4f38 Harry Wentland 2019-02-22  601  	dpte_req_height = 1 << log2_dpte_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  602  	dpte_req_width = 1 << log2_dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  603  
728c06986a4f38 Harry Wentland 2019-02-22  604  	// calculate pitch dpte row buffer can hold
728c06986a4f38 Harry Wentland 2019-02-22  605  	// round the result down to a power of two.
728c06986a4f38 Harry Wentland 2019-02-22  606  	pde_buf_entries = yuv420 ? (pde_proc_buffer_size_64k_reqs >> 1) : pde_proc_buffer_size_64k_reqs;
728c06986a4f38 Harry Wentland 2019-02-22  607  	if (surf_linear) {
728c06986a4f38 Harry Wentland 2019-02-22  608  		unsigned int dpte_row_height;
728c06986a4f38 Harry Wentland 2019-02-22  609  
728c06986a4f38 Harry Wentland 2019-02-22  610  		log2_dpte_row_height_linear = dml_floor(dml_log2(dml_min(64 * 1024 * pde_buf_entries
728c06986a4f38 Harry Wentland 2019-02-22  611  										/ bytes_per_element,
728c06986a4f38 Harry Wentland 2019-02-22  612  								dpte_buf_in_pte_reqs
728c06986a4f38 Harry Wentland 2019-02-22  613  										* dpte_req_width)
728c06986a4f38 Harry Wentland 2019-02-22  614  								/ data_pitch),
728c06986a4f38 Harry Wentland 2019-02-22  615  				1);
728c06986a4f38 Harry Wentland 2019-02-22  616  
728c06986a4f38 Harry Wentland 2019-02-22  617  		ASSERT(log2_dpte_row_height_linear >= 3);
728c06986a4f38 Harry Wentland 2019-02-22  618  
728c06986a4f38 Harry Wentland 2019-02-22  619  		if (log2_dpte_row_height_linear > 7)
728c06986a4f38 Harry Wentland 2019-02-22  620  			log2_dpte_row_height_linear = 7;
728c06986a4f38 Harry Wentland 2019-02-22  621  
728c06986a4f38 Harry Wentland 2019-02-22  622  		log2_dpte_row_height = log2_dpte_row_height_linear;
728c06986a4f38 Harry Wentland 2019-02-22  623  		// For linear, the dpte row is pitch dependent and the pte requests wrap at the pitch boundary.
728c06986a4f38 Harry Wentland 2019-02-22  624  		// the dpte_row_width_ub is the upper bound of data_pitch*dpte_row_height in elements with this unique buffering.
728c06986a4f38 Harry Wentland 2019-02-22  625  		dpte_row_height = 1 << log2_dpte_row_height;
728c06986a4f38 Harry Wentland 2019-02-22  626  		dpte_row_width_ub = dml_round_to_multiple(data_pitch * dpte_row_height - 1,
728c06986a4f38 Harry Wentland 2019-02-22  627  				dpte_req_width,
728c06986a4f38 Harry Wentland 2019-02-22  628  				1) + dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  629  		rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  630  	} else {
728c06986a4f38 Harry Wentland 2019-02-22  631  		// the upper bound of the dpte_row_width without dependency on viewport position follows.
728c06986a4f38 Harry Wentland 2019-02-22  632  		// for tiled mode, row height is the same as req height and row store up to vp size upper bound
728c06986a4f38 Harry Wentland 2019-02-22  633  		if (!surf_vert) {
728c06986a4f38 Harry Wentland 2019-02-22  634  			log2_dpte_row_height = log2_dpte_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  635  			dpte_row_width_ub = dml_round_to_multiple(vp_width - 1, dpte_req_width, 1)
728c06986a4f38 Harry Wentland 2019-02-22  636  					+ dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  637  			rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  638  		} else {
728c06986a4f38 Harry Wentland 2019-02-22  639  			log2_dpte_row_height =
728c06986a4f38 Harry Wentland 2019-02-22  640  					(log2_blk_width < log2_dpte_req_width) ?
728c06986a4f38 Harry Wentland 2019-02-22  641  							log2_blk_width : log2_dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  642  			dpte_row_width_ub = dml_round_to_multiple(vp_height - 1, dpte_req_height, 1)
728c06986a4f38 Harry Wentland 2019-02-22  643  					+ dpte_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  644  			rq_dlg_param->dpte_req_per_row_ub = dpte_row_width_ub / dpte_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  645  		}
728c06986a4f38 Harry Wentland 2019-02-22  646  	}
728c06986a4f38 Harry Wentland 2019-02-22  647  	if (log2_blk_bytes >= 16 && log2_vmpg_bytes == 12) // tile block >= 64KB
728c06986a4f38 Harry Wentland 2019-02-22  648  		rq_dlg_param->dpte_bytes_per_row_ub = rq_dlg_param->dpte_req_per_row_ub * 128; //2*64B dpte request
728c06986a4f38 Harry Wentland 2019-02-22  649  	else
728c06986a4f38 Harry Wentland 2019-02-22  650  		rq_dlg_param->dpte_bytes_per_row_ub = rq_dlg_param->dpte_req_per_row_ub * 64; //64B dpte request
728c06986a4f38 Harry Wentland 2019-02-22  651  
728c06986a4f38 Harry Wentland 2019-02-22  652  	rq_dlg_param->dpte_row_height = 1 << log2_dpte_row_height;
728c06986a4f38 Harry Wentland 2019-02-22  653  
728c06986a4f38 Harry Wentland 2019-02-22  654  	// the dpte_group_bytes is reduced for the specific case of vertical
728c06986a4f38 Harry Wentland 2019-02-22  655  	// access of a tile surface that has dpte request of 8x1 ptes.
728c06986a4f38 Harry Wentland 2019-02-22 @656  	if (!surf_linear & (log2_dpte_req_height_ptes == 0) & surf_vert) //reduced, in this case, will have page fault within a group
728c06986a4f38 Harry Wentland 2019-02-22  657  		rq_sizing_param->dpte_group_bytes = 512;
728c06986a4f38 Harry Wentland 2019-02-22  658  	else
728c06986a4f38 Harry Wentland 2019-02-22  659  		//full size
728c06986a4f38 Harry Wentland 2019-02-22  660  		rq_sizing_param->dpte_group_bytes = 2048;
728c06986a4f38 Harry Wentland 2019-02-22  661  
728c06986a4f38 Harry Wentland 2019-02-22  662  	//since pte request size is 64byte, the number of data pte requests per full sized group is as follows.
728c06986a4f38 Harry Wentland 2019-02-22  663  	log2_dpte_group_bytes = dml_log2(rq_sizing_param->dpte_group_bytes);
728c06986a4f38 Harry Wentland 2019-02-22  664  	log2_dpte_group_length = log2_dpte_group_bytes - 6; //length in 64b requests
728c06986a4f38 Harry Wentland 2019-02-22  665  
728c06986a4f38 Harry Wentland 2019-02-22  666  	// full sized data pte group width in elements
728c06986a4f38 Harry Wentland 2019-02-22  667  	if (!surf_vert)
728c06986a4f38 Harry Wentland 2019-02-22  668  		log2_dpte_group_width = log2_dpte_group_length + log2_dpte_req_width;
728c06986a4f38 Harry Wentland 2019-02-22  669  	else
728c06986a4f38 Harry Wentland 2019-02-22  670  		log2_dpte_group_width = log2_dpte_group_length + log2_dpte_req_height;
728c06986a4f38 Harry Wentland 2019-02-22  671  
728c06986a4f38 Harry Wentland 2019-02-22  672  	//But if the tile block >=64KB and the page size is 4KB, then each dPTE request is 2*64B
728c06986a4f38 Harry Wentland 2019-02-22  673  	if ((log2_blk_bytes >= 16) && (log2_vmpg_bytes == 12)) // tile block >= 64KB
728c06986a4f38 Harry Wentland 2019-02-22  674  		log2_dpte_group_width = log2_dpte_group_width - 1;
728c06986a4f38 Harry Wentland 2019-02-22  675  
728c06986a4f38 Harry Wentland 2019-02-22  676  	dpte_group_width = 1 << log2_dpte_group_width;
728c06986a4f38 Harry Wentland 2019-02-22  677  
728c06986a4f38 Harry Wentland 2019-02-22  678  	// since dpte groups are only aligned to dpte_req_width and not dpte_group_width,
728c06986a4f38 Harry Wentland 2019-02-22  679  	// the upper bound for the dpte groups per row is as follows.
728c06986a4f38 Harry Wentland 2019-02-22  680  	rq_dlg_param->dpte_groups_per_row_ub = dml_ceil((double) dpte_row_width_ub / dpte_group_width,
728c06986a4f38 Harry Wentland 2019-02-22  681  			1);
728c06986a4f38 Harry Wentland 2019-02-22  682  }
728c06986a4f38 Harry Wentland 2019-02-22  683  

:::::: The code at line 656 was first introduced by commit
:::::: 728c06986a4f386c7ec5e5170716e30b610c6d32 drm/amd/display: Add DCN2 changes to DML

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
