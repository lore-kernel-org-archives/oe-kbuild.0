Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB4125B09E
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021440; cv=none; b=bU9x+tWXSe9WUPerHebb9vB+5saHDy1inmzkkB1gGb61vIaa/2VnNYUWcH8OtAXjdoGMAI0Adl2Gubv6NFnd2XVEtGlaWO5hOU8vd0VUUWyB1q95KonnhOVlGnfOCIDaw9ryapEEbGJUEBP1U2UVYJvk1ysGR7lxQmHlqwz2S9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021440; c=relaxed/simple;
	bh=1XNdjBSXWED8Uw9fS9mMaviaf3AHNeMFliOh16a485Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UuIHhpiXLN5cjSM92wxBZt3BOJtM1DKyPxArjDZuPffIVrMMA4XBZYPq0fsYqwLiCEkZugP8/QXkSEgmAVWLn0ShVyT5UdnpbNeQ/x3VOIntRaT1jrw7QUpIY3lXA8TrSjIXpqh3j/bqyTG0Jze8hkBo5mplD/hA7sN/qF8yjbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLaX1zJn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLaX1zJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786021436; x=1817557436;
  h=date:from:to:cc:subject:message-id;
  bh=1XNdjBSXWED8Uw9fS9mMaviaf3AHNeMFliOh16a485Q=;
  b=jLaX1zJnIKw8NATIdHqIaNKEZFazFuYP2IhRgSXAkorsVZSLxY01IW6n
   kJdcL++AYVww1TGMwdoEAOBFjHhDO+HefX15uJeJQRsvEkPQZ4o6R0hLn
   m9ViMAYQjEDw62yMMCJCX36clnWYpxzoNIPZRKVm2VdYGD/NXP0ZlmAFb
   mlL3i96ll/pZ0JRKU0yAbCHaXZGKaUKAnSvQk5mDDzmKj+qgqfL0TT3OT
   zTGOvy2BJ/aRsrzhNcMNZKtkhKM8BduGuvTgSJt3mwporXrTuYoIGL0tX
   /URabGITr9kV9hahA527bQCkVUgpXtwqXPTxi7Qqf8G9yz83DqV+bp2/l
   Q==;
X-CSE-ConnectionGUID: hsfbCLoOTg6RJGYB4yJclA==
X-CSE-MsgGUID: nYH9go3USqyDOwx1x3MJQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90432085"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="90432085"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:03:53 -0700
X-CSE-ConnectionGUID: 1tMxs78JST+4jmbetHPYwg==
X-CSE-MsgGUID: DhzvquaoS8eAAWfYjs+BKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265940742"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2026 06:03:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrxlG-00000000FB3-1cyJ;
	Thu, 06 Aug 2026 13:03:50 +0000
Date: Thu, 06 Aug 2026 21:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_cmd.c:315
 ras_cmd_get_batch_trace_records() error: buffer overflow
 'output_data->records' 300 <= 2147483646
Message-ID: <202608062021.qBlC0p7f-lkp@intel.com>
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
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260806/202608062021.qBlC0p7f-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608062021.qBlC0p7f-lkp@intel.com/

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
