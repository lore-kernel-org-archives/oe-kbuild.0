Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CFF3A7F7E
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793114; cv=none; b=rT8j9IjNxjssL3i8ELidx6ngsC8z8hkcMJbsh5tbbexyxhXlBfYpzwUvT1C8BMswMRQ/F3C4JvZeVs6opSs6kIIxHgofCr3AMQ5A41UDLVcjr5qySJOBZ0XaZOG7wQMLxUUt9FPoazFLauszF6egBkWKYq3qwJ9lO2Kfcv+A6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793114; c=relaxed/simple;
	bh=7gyQYlxdx65GrWKqHqxgNgUUF8wmq+1bVcjPVVZRHXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Scgk3uB+sr4c2pcm29dHOPLoDUdS0O/K/xbNSR+lkFeRahf8S7RDQdbV5lJfTy0J4bEdXEFcglZwUH7a0vOLaq81Tjki69xso1qqjenh234pjZ+aI4pvtsbMc9rlxlGsl3KEZm5UZUxZLbMnrEJR8WwcuR6wtowcDlUDWMqF0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2KOJ5iW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2KOJ5iW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786793112; x=1818329112;
  h=date:from:to:cc:subject:message-id;
  bh=7gyQYlxdx65GrWKqHqxgNgUUF8wmq+1bVcjPVVZRHXo=;
  b=n2KOJ5iWPC3dTIIzEJBcp1uK74YS1Eow2gNz12XYf+QDH98o7LL8v0hN
   z0GBaeOnDjkmUVemWxKtm26GJTRnT3W9+P183PwZK4KpinRMp9ZiEiX0N
   G+5Xfr2cXIoODEOwudEh1wpx93zFj95/P0AjpcI5JxRDkEcDC0CklTtuz
   GqWw6NW+EVS7OfpyOLmpL6SWVzlfSXgXrWlPP/ygqMSgqZffEgJ/fNjQm
   rYhOTI5Nyf+DpxEGTV0uFNFvdyphDJm4fD4KARHuY1m9PYj5fvHwSFsqU
   0zEFnmWx6ijtVUUtlfRigBzCbW9XLYT9xhqQN/AD975pybpIcTElGkflq
   Q==;
X-CSE-ConnectionGUID: x+RIBi+hQv6nbzPcHKyQ8g==
X-CSE-MsgGUID: GmOL5o6iRJWZPuRaFTTG6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87206732"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87206732"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 04:25:11 -0700
X-CSE-ConnectionGUID: gaHvk3xPTFC9D1B6pVXRyA==
X-CSE-MsgGUID: rzpW1ESPSw6KQsoDmM4IAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="289262201"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2026 04:25:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvCVf-00000000bqi-1BVP;
	Sat, 15 Aug 2026 11:25:07 +0000
Date: Sat, 15 Aug 2026 19:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11967/15183]
 drivers/gpu/drm/amd/amdgpu/../ras/core/cmd.c:336
 ras_cmd_get_batch_trace_records() error: buffer overflow
 'output_data->records' 300 <= 2147483646
Message-ID: <202608151946.qh0Qq1AX-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2697ef8943c9985c14708a6429e21812693857b2
commit: d95700604fbc6fd7534303796d005e6efbd1d591 [11967/15183] drm/amd/ras: rename core ras_* files and update include guards
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260815/202608151946.qh0Qq1AX-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608151946.qh0Qq1AX-lkp@intel.com/

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
