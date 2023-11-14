Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882C8813
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 03:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezM8+iXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932213; x=1731468213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwOFWqpr7bJWYH1GAkuiVqb8+7BTJuvIgC+SnbB4gTg=;
  b=ezM8+iXjvWyyXOG+eEQOaiC1gpjIxgSKNjl06ZUQQ/oEQT9DkImmc5Rm
   T0YzLfc4ak5ZZzWwTLGp2I093LfYvTU2QNQZHLZLUFa9etqN09B0JwN8Y
   aypLcYMsyrhcpP047ip++X05ebETdQD3N0XfgcJ8dS4DyFJxsOr9mK+RA
   ejffogkJeap/FCfWwxul1jxA4ewj0avS62xlhUat7QQ/mzXZTj8M2dszX
   GfTVYoGHTVTcdEOHSy6ZwBFYz6ccRqIDCnpL/yQEVZkTklW/IRBknVwDX
   nxFYtmH4K8hX5uwnpUb7EJJDBIUwqyclN5Uuyhg8pwgKNKNicAFRIXDN0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370764365"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="370764365"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="888103133"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="888103133"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Nov 2023 19:23:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2k1P-000Cni-1h;
	Tue, 14 Nov 2023 03:23:27 +0000
Date: Tue, 14 Nov 2023 11:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:132
 dc_dmub_srv_cmd_list_queue_execute() warn: variable dereferenced before
 check 'dc_dmub_srv' (see line 127)
Message-ID: <202311141141.GoLAPxD5-lkp@intel.com>
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
TO: "JinZe.Xu" <jinze.xu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Josip Pavic <josip.pavic@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: 028bac5834495f4f4036bf8b3206fcdafe99a393 drm/amd/display: decouple dmcub execution to reduce lock granularity
date:   6 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20231113 (https://download.01.org/0day-ci/archive/20231114/202311141141.GoLAPxD5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231114/202311141141.GoLAPxD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311141141.GoLAPxD5-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:132 dc_dmub_srv_cmd_list_queue_execute() warn: variable dereferenced before check 'dc_dmub_srv' (see line 127)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:874 dc_dmub_srv_log_diagnostic_data() error: we previously assumed 'dc_dmub_srv' could be null (see line 873)
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:1115 dc_dmub_srv_enable_dpia_trace() error: we previously assumed 'dc_dmub_srv' could be null (see line 1114)

vim +/dc_dmub_srv +132 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c

f2973d2a418db9 Alvin Lee 2021-05-10  122  
028bac5834495f JinZe.Xu  2023-10-13  123  bool dc_dmub_srv_cmd_list_queue_execute(struct dc_dmub_srv *dc_dmub_srv,
028bac5834495f JinZe.Xu  2023-10-13  124  		unsigned int count,
028bac5834495f JinZe.Xu  2023-10-13  125  		union dmub_rb_cmd *cmd_list)
028bac5834495f JinZe.Xu  2023-10-13  126  {
028bac5834495f JinZe.Xu  2023-10-13 @127  	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
028bac5834495f JinZe.Xu  2023-10-13  128  	struct dmub_srv *dmub;
028bac5834495f JinZe.Xu  2023-10-13  129  	enum dmub_status status;
028bac5834495f JinZe.Xu  2023-10-13  130  	int i;
028bac5834495f JinZe.Xu  2023-10-13  131  
028bac5834495f JinZe.Xu  2023-10-13 @132  	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
028bac5834495f JinZe.Xu  2023-10-13  133  		return false;
028bac5834495f JinZe.Xu  2023-10-13  134  
028bac5834495f JinZe.Xu  2023-10-13  135  	dmub = dc_dmub_srv->dmub;
028bac5834495f JinZe.Xu  2023-10-13  136  
028bac5834495f JinZe.Xu  2023-10-13  137  	for (i = 0 ; i < count; i++) {
028bac5834495f JinZe.Xu  2023-10-13  138  		// Queue command
028bac5834495f JinZe.Xu  2023-10-13  139  		status = dmub_srv_cmd_queue(dmub, &cmd_list[i]);
028bac5834495f JinZe.Xu  2023-10-13  140  
028bac5834495f JinZe.Xu  2023-10-13  141  		if (status == DMUB_STATUS_QUEUE_FULL) {
028bac5834495f JinZe.Xu  2023-10-13  142  			/* Execute and wait for queue to become empty again. */
028bac5834495f JinZe.Xu  2023-10-13  143  			dmub_srv_cmd_execute(dmub);
028bac5834495f JinZe.Xu  2023-10-13  144  			dmub_srv_wait_for_idle(dmub, 100000);
028bac5834495f JinZe.Xu  2023-10-13  145  
028bac5834495f JinZe.Xu  2023-10-13  146  			/* Requeue the command. */
028bac5834495f JinZe.Xu  2023-10-13  147  			status = dmub_srv_cmd_queue(dmub, &cmd_list[i]);
028bac5834495f JinZe.Xu  2023-10-13  148  		}
028bac5834495f JinZe.Xu  2023-10-13  149  
028bac5834495f JinZe.Xu  2023-10-13  150  		if (status != DMUB_STATUS_OK) {
028bac5834495f JinZe.Xu  2023-10-13  151  			DC_ERROR("Error queueing DMUB command: status=%d\n", status);
028bac5834495f JinZe.Xu  2023-10-13  152  			dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
028bac5834495f JinZe.Xu  2023-10-13  153  			return false;
028bac5834495f JinZe.Xu  2023-10-13  154  		}
028bac5834495f JinZe.Xu  2023-10-13  155  	}
028bac5834495f JinZe.Xu  2023-10-13  156  
028bac5834495f JinZe.Xu  2023-10-13  157  	status = dmub_srv_cmd_execute(dmub);
028bac5834495f JinZe.Xu  2023-10-13  158  	if (status != DMUB_STATUS_OK) {
028bac5834495f JinZe.Xu  2023-10-13  159  		DC_ERROR("Error starting DMUB execution: status=%d\n", status);
028bac5834495f JinZe.Xu  2023-10-13  160  		dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
028bac5834495f JinZe.Xu  2023-10-13  161  		return false;
028bac5834495f JinZe.Xu  2023-10-13  162  	}
028bac5834495f JinZe.Xu  2023-10-13  163  
028bac5834495f JinZe.Xu  2023-10-13  164  	return true;
028bac5834495f JinZe.Xu  2023-10-13  165  }
028bac5834495f JinZe.Xu  2023-10-13  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
