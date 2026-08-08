Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD762F8E86
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786154125; cv=none; b=gd8q9Pl3O+FE1D5Bh44MIbJxBs2pWoYQhL7KUZ67OLNK0qF9zMvC6u5Inr+4A9xBhCGdPj4DG26MaiCVFjDNqpABSfk9Jtogaz7eWwnnNXqe3JcDw1wyNIdsiqtS07rHiRRMjj8F+JFv+vBIO4ur8G/e6gNKeLBv3L5xKd5ESpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786154125; c=relaxed/simple;
	bh=R3QgNsvDlsLufMlreyqqF0HMoRQ6plAgNQ9QkK5qoPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hdf/7AticTmDszCTbVXbqG/53iMlAQu2KHSOpsVIRYgtMxd5mWWcbABN6XnAQxBD3F4KHRJ2T8d8YlJAI1k88MT0GZhs6zyoQwB5LY+uGoNHPwwnB1PvhWZViQUC/16VEeVrYPEeyiHs6ycZN+R83cloFtWGOQ07isCBAmVOghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vt+Y0Uoy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vt+Y0Uoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786154124; x=1817690124;
  h=date:from:to:cc:subject:message-id;
  bh=R3QgNsvDlsLufMlreyqqF0HMoRQ6plAgNQ9QkK5qoPE=;
  b=Vt+Y0UoyVXjSC7nJ9BqcMr/CxQYKKltq8Q9FvLK/MczEoWXauXQPBPYe
   Kq+ZKKiP6r9J405vzEtMa7A07vBXCJnuIUyimfiToMoq6lsTaHCtBGm/W
   TO7zc/VVvlsr0iWNyg673YdauYGgn6yytouNu2oUCQRCI7VGdOx3vYA/E
   Ivjbj7wvsal1q6BLrR2YuAvFK9hvEoQoeEzoV4J7XdUZiyiZvbW2HOZv3
   f5SXtGtTcDTLwiIH4xQHLUrAGWm4Jriv1lQpIHIrwgPQ7Syp9lvEMRr8F
   sItQpLO6R/Z1Gh2Dvljf90rFyATRNF7OrisiuLwz+xD6nCsak52/a3HLD
   g==;
X-CSE-ConnectionGUID: DCoPpnNyQ3WL7Iyd1gDNdw==
X-CSE-MsgGUID: +aaxkAsHQAm5aGO7DdTZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86843456"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86843456"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:55:23 -0700
X-CSE-ConnectionGUID: z6zHMs1WSfe4oZTYGVRwoA==
X-CSE-MsgGUID: tfvGKA2aTWGzWRF9O4OxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="258686654"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 18:55:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsWHP-00000000Jcr-1xG8;
	Sat, 08 Aug 2026 01:55:19 +0000
Date: Sat, 08 Aug 2026 09:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cmd.c:315
 ras_cmd_get_batch_trace_records() error: buffer overflow
 'output_data->records' 300 <= 2147483646
Message-ID: <202608080917.FG16E3uI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: YiPeng Chai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tao Zhou <tao.zhou1@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

Hi YiPeng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260808/202608080917.FG16E3uI-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608080917.FG16E3uI-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cmd.c:315 ras_cmd_get_batch_trace_records() error: buffer overflow 'output_data->records' 300 <= 2147483646

vim +315 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cmd.c

19030244e1f99f YiPeng Chai 2025-03-17  276  
19030244e1f99f YiPeng Chai 2025-03-17  277  static int ras_cmd_get_batch_trace_records(struct ras_core_context *ras_core,
19030244e1f99f YiPeng Chai 2025-03-17  278  	struct ras_cmd_ioctl *cmd, void *data)
19030244e1f99f YiPeng Chai 2025-03-17  279  {
19030244e1f99f YiPeng Chai 2025-03-17  280  	struct ras_cmd_batch_trace_record_req *input_data =
19030244e1f99f YiPeng Chai 2025-03-17  281  			(struct ras_cmd_batch_trace_record_req *)cmd->input_buff_raw;
19030244e1f99f YiPeng Chai 2025-03-17  282  	struct ras_cmd_batch_trace_record_rsp *output_data =
19030244e1f99f YiPeng Chai 2025-03-17  283  			(struct ras_cmd_batch_trace_record_rsp *)cmd->output_buff_raw;
19030244e1f99f YiPeng Chai 2025-03-17  284  	struct ras_log_batch_overview overview;
19030244e1f99f YiPeng Chai 2025-03-17  285  	struct ras_log_info *trace_arry[MAX_RECORD_PER_BATCH] = {0};
19030244e1f99f YiPeng Chai 2025-03-17  286  	struct ras_log_info *record;
19030244e1f99f YiPeng Chai 2025-03-17  287  	int i, j, count = 0, offset = 0;
19030244e1f99f YiPeng Chai 2025-03-17  288  	uint64_t id;
19030244e1f99f YiPeng Chai 2025-03-17  289  	bool completed = false;
19030244e1f99f YiPeng Chai 2025-03-17  290  
19030244e1f99f YiPeng Chai 2025-03-17  291  	if (cmd->input_size != sizeof(struct ras_cmd_batch_trace_record_req))
19030244e1f99f YiPeng Chai 2025-03-17  292  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
19030244e1f99f YiPeng Chai 2025-03-17  293  
19030244e1f99f YiPeng Chai 2025-03-17  294  	if ((!input_data->batch_num) || (input_data->batch_num > RAS_CMD_MAX_BATCH_NUM))
19030244e1f99f YiPeng Chai 2025-03-17  295  		return RAS_CMD__ERROR_INVALID_INPUT_DATA;
19030244e1f99f YiPeng Chai 2025-03-17  296  
19030244e1f99f YiPeng Chai 2025-03-17  297  	ras_log_ring_get_batch_overview(ras_core, &overview);
19030244e1f99f YiPeng Chai 2025-03-17  298  	if ((input_data->start_batch_id < overview.first_batch_id) ||
19030244e1f99f YiPeng Chai 2025-03-17  299  	    (input_data->start_batch_id >= overview.last_batch_id))
19030244e1f99f YiPeng Chai 2025-03-17  300  		return RAS_CMD__ERROR_INVALID_INPUT_SIZE;
19030244e1f99f YiPeng Chai 2025-03-17  301  
19030244e1f99f YiPeng Chai 2025-03-17  302  	for (i = 0; i < input_data->batch_num; i++) {
19030244e1f99f YiPeng Chai 2025-03-17  303  		id = input_data->start_batch_id + i;
19030244e1f99f YiPeng Chai 2025-03-17  304  		if (id >= overview.last_batch_id) {
19030244e1f99f YiPeng Chai 2025-03-17  305  			completed = true;
19030244e1f99f YiPeng Chai 2025-03-17  306  			break;
19030244e1f99f YiPeng Chai 2025-03-17  307  		}
19030244e1f99f YiPeng Chai 2025-03-17  308  
19030244e1f99f YiPeng Chai 2025-03-17  309  		count = ras_log_ring_get_batch_records(ras_core,
19030244e1f99f YiPeng Chai 2025-03-17  310  					id, trace_arry, ARRAY_SIZE(trace_arry));
19030244e1f99f YiPeng Chai 2025-03-17  311  		if (count > 0) {
19030244e1f99f YiPeng Chai 2025-03-17  312  			if ((offset + count) > RAS_CMD_MAX_TRACE_NUM)
19030244e1f99f YiPeng Chai 2025-03-17  313  				break;
19030244e1f99f YiPeng Chai 2025-03-17  314  			for (j = 0; j < count; j++) {
19030244e1f99f YiPeng Chai 2025-03-17 @315  				record = &output_data->records[offset + j];
19030244e1f99f YiPeng Chai 2025-03-17  316  				record->seqno = trace_arry[j]->seqno;
19030244e1f99f YiPeng Chai 2025-03-17  317  				record->timestamp = trace_arry[j]->timestamp;
19030244e1f99f YiPeng Chai 2025-03-17  318  				record->event = trace_arry[j]->event;
19030244e1f99f YiPeng Chai 2025-03-17  319  				memcpy(&record->aca_reg,
19030244e1f99f YiPeng Chai 2025-03-17  320  					&trace_arry[j]->aca_reg, sizeof(trace_arry[j]->aca_reg));
19030244e1f99f YiPeng Chai 2025-03-17  321  			}
19030244e1f99f YiPeng Chai 2025-03-17  322  		} else {
19030244e1f99f YiPeng Chai 2025-03-17  323  			count = 0;
19030244e1f99f YiPeng Chai 2025-03-17  324  		}
19030244e1f99f YiPeng Chai 2025-03-17  325  
19030244e1f99f YiPeng Chai 2025-03-17  326  		output_data->batchs[i].batch_id = id;
19030244e1f99f YiPeng Chai 2025-03-17  327  		output_data->batchs[i].offset = offset;
19030244e1f99f YiPeng Chai 2025-03-17  328  		output_data->batchs[i].trace_num = count;
19030244e1f99f YiPeng Chai 2025-03-17  329  		offset += count;
19030244e1f99f YiPeng Chai 2025-03-17  330  	}
19030244e1f99f YiPeng Chai 2025-03-17  331  
19030244e1f99f YiPeng Chai 2025-03-17  332  	output_data->start_batch_id = input_data->start_batch_id;
19030244e1f99f YiPeng Chai 2025-03-17  333  	output_data->real_batch_num = i;
19030244e1f99f YiPeng Chai 2025-03-17  334  	output_data->remain_num = completed ? 0 : (input_data->batch_num - i);
19030244e1f99f YiPeng Chai 2025-03-17  335  	output_data->version = 0;
19030244e1f99f YiPeng Chai 2025-03-17  336  
19030244e1f99f YiPeng Chai 2025-03-17  337  	cmd->output_size = sizeof(struct ras_cmd_batch_trace_record_rsp);
19030244e1f99f YiPeng Chai 2025-03-17  338  
19030244e1f99f YiPeng Chai 2025-03-17  339  	return RAS_CMD__SUCCESS;
19030244e1f99f YiPeng Chai 2025-03-17  340  }
19030244e1f99f YiPeng Chai 2025-03-17  341  

:::::: The code at line 315 was first introduced by commit
:::::: 19030244e1f99f3e9f8617ba4cb90ce49276eab0 drm/amd/ras: Add ras ioctl command handler

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
