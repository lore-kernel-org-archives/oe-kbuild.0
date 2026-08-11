Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC63BB67B
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Aug 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464025; cv=none; b=LdZzycNYf1ViJZRlS31Z90gtQJUMVoZPk9XNpQa7zzyMc2HB1lAC54AxlfKw6YcIfcnJYXM+JCt0GFDgJRalDUXizPy4duvWFAAvlsJ+gUMozIPP9IsQrvXF/RGZkBdYozYv4VuQmHpCwrs+d+6SvThY24Um1AwYsviwU1HxrCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464025; c=relaxed/simple;
	bh=uFu7V8kEcEs1PVUadJIqNNfIJ9KkQ46ktD7XuNd8hp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I0VHBvtPAS3UiK3gYJ5G7XkkyjXLAD2L1c1ZLVU656FjgDN0XaOGEHkGZR5NZ8I7kZxORrpmh3u6nNQyQBpVdr50+83OxzNcz+Um1ATzkEGDDciJixTK7L7EM+07ixr5J0KrCWygTCZ+WeJImpbAtVPeqHlbgbY7Zf3BndzzifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPnQet7a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPnQet7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786464020; x=1818000020;
  h=date:from:to:cc:subject:message-id;
  bh=uFu7V8kEcEs1PVUadJIqNNfIJ9KkQ46ktD7XuNd8hp0=;
  b=UPnQet7a6+qlwuc/zZ+uB15cuF1aKdiFNWncNrOrrIJx1I/5emXDguUb
   TEEqrm3bI4Rl85HQZOox4kwDupe3ElpqiiM4q+0OQpSddV3XDCNEYinc/
   Oze5bqPyTlkW7qiTcbeblA8UKqoDfQqBf4UJ3/OVU3jKM2+C6IKC42ECg
   I/RxE+NbaBpr4aAOLIzLxbCsIyE9dL8AWl2hQ32oHo2gNN8Y4UN3TaEyo
   /MKZwhYvu3abkkQXtb+BrJCaaspEqZ2KTvgeFD1433qV7ErquTvsm+sBy
   6J8Zd0/ys7J9JBzhsw6r2JBF4DmxLYpd6KF/a0hnGUVcokUlsI4AuRxgm
   w==;
X-CSE-ConnectionGUID: bBEFve/iTlSP2f/rQav7lA==
X-CSE-MsgGUID: cmGeRinuQBqXDnNgwEa0Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98514400"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="98514400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 09:00:18 -0700
X-CSE-ConnectionGUID: dFRlS1AUTeeE29d9j84o9w==
X-CSE-MsgGUID: HVmL7eI+Q/G9Eyq3soIGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="267645509"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Aug 2026 09:00:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtotj-00000000Oye-1GER;
	Tue, 11 Aug 2026 16:00:15 +0000
Date: Tue, 11 Aug 2026 23:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next-7.3 220/308]
 drivers/gpu/drm/amd/amdgpu/../ras/core/cmd.c:336
 ras_cmd_get_batch_trace_records() error: buffer overflow
 'output_data->records' 300 <= 2147483646
Message-ID: <202608112345.u2gc0db7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: YiPeng Chai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

Hi YiPeng,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: d95700604fbc6fd7534303796d005e6efbd1d591 [220/308] drm/amd/ras: rename core ras_* files and update include guards
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260811/202608112345.u2gc0db7-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608112345.u2gc0db7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../ras/core/cmd.c:336 ras_cmd_get_batch_trace_records() error: buffer overflow 'output_data->records' 300 <= 2147483646

vim +336 drivers/gpu/drm/amd/amdgpu/../ras/core/cmd.c

19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  291  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  292  static int ras_cmd_get_batch_trace_records(struct ras_core_context *ras_core,
4c74635afdceff drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-09-25  293  	struct ras_cmd_ctx *cmd, void *data)
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  294  {
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  295  	struct ras_cmd_batch_trace_record_req *input_data =
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  296  			(struct ras_cmd_batch_trace_record_req *)cmd->input_buff_raw;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  297  	struct ras_cmd_batch_trace_record_rsp *output_data =
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  298  			(struct ras_cmd_batch_trace_record_rsp *)cmd->output_buff_raw;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  299  	struct ras_log_batch_overview overview;
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  300  	struct ras_log_info *trace_arry = NULL;
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  301  	uint32_t trace_count = MAX_RECORD_PER_BATCH;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  302  	struct ras_log_info *record;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  303  	int i, j, count = 0, offset = 0;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  304  	uint64_t id;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  305  	bool completed = false;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  306  
2206e6c76d05e3 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  307  	if ((cmd->input_size != sizeof(struct ras_cmd_batch_trace_record_req)) ||
2206e6c76d05e3 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  308  		(cmd->output_buf_size < sizeof(*output_data)))
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  309  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  310  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  311  	if ((!input_data->batch_num) || (input_data->batch_num > RAS_CMD_MAX_BATCH_NUM))
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  312  		return RAS_CMD__ERROR_INVALID_INPUT_DATA;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  313  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  314  	ras_log_ring_get_batch_overview(ras_core, &overview);
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  315  	if ((input_data->start_batch_id < overview.first_batch_id) ||
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  316  	    (input_data->start_batch_id >= overview.last_batch_id))
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  317  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  318  
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  319  	trace_arry = kcalloc(trace_count, sizeof(*trace_arry), GFP_KERNEL);
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  320  	if (!trace_arry)
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  321  		return RAS_CMD__ERROR_GENERIC;
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  322  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  323  	for (i = 0; i < input_data->batch_num; i++) {
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  324  		id = input_data->start_batch_id + i;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  325  		if (id >= overview.last_batch_id) {
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  326  			completed = true;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  327  			break;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  328  		}
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  329  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  330  		count = ras_log_ring_get_batch_records(ras_core,
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  331  					id, trace_arry, trace_count);
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  332  		if (count > 0) {
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  333  			if ((offset + count) > RAS_CMD_MAX_TRACE_NUM)
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  334  				break;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  335  			for (j = 0; j < count; j++) {
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17 @336  				record = &output_data->records[offset + j];
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  337  				record->seqno = trace_arry[j].seqno;
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  338  				record->timestamp = trace_arry[j].timestamp;
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  339  				record->event = trace_arry[j].event;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  340  				memcpy(&record->aca_reg,
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  341  					&trace_arry[j].aca_reg, sizeof(trace_arry[j].aca_reg));
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  342  			}
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  343  		} else {
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  344  			count = 0;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  345  		}
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  346  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  347  		output_data->batchs[i].batch_id = id;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  348  		output_data->batchs[i].offset = offset;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  349  		output_data->batchs[i].trace_num = count;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  350  		offset += count;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  351  	}
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  352  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  353  	output_data->start_batch_id = input_data->start_batch_id;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  354  	output_data->real_batch_num = i;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  355  	output_data->remain_num = completed ? 0 : (input_data->batch_num - i);
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  356  	output_data->version = 0;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  357  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  358  	cmd->output_size = sizeof(struct ras_cmd_batch_trace_record_rsp);
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  359  
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  360  	kfree(trace_arry);
90b0cbcba1bd68 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2026-05-19  361  
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  362  	return RAS_CMD__SUCCESS;
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  363  }
19030244e1f99f drivers/gpu/drm/amd/ras/rascore/ras_cmd.c YiPeng Chai 2025-03-17  364  

:::::: The code at line 336 was first introduced by commit
:::::: 19030244e1f99f3e9f8617ba4cb90ce49276eab0 drm/amd/ras: Add ras ioctl command handler

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
