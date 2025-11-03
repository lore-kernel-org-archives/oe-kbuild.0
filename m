Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB7E19A288
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762208612; cv=none; b=XtOqOceB0EWHCwjw+cnuTqs6pMKJKOpWI/v+geg9p34hWob/S/lKF9jKLEEC2xyG2BjzlL79uTGMc7d4xg4cqpezjqkpxeUCCcf+9rlBbzJP39QMQ8yCAI1qoDDivt4i/WixaOx6guGIPMCrZahO+if++LWPc3B9i3r9d+TGHWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762208612; c=relaxed/simple;
	bh=pyNKtZsqoXIjj30d+wj9B95YSwM90ztgQ1i3DliKOPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=op3suQigrTsyHaaEbt8ANxJINIyIWAcAeV/N6gzWNuWMGHLgJf9SS5jIX51Cex3uvVXho5x61JT2ROher0yn6InLQKGUiDAREixXLvSoNEM7buOGLP+mtTmMpG/T5641oYXQXCy4Rxf7uUAIdzpPB+Q3KIu0jRIcmF/vZB7Ltvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7uIU++A; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7uIU++A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762208610; x=1793744610;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pyNKtZsqoXIjj30d+wj9B95YSwM90ztgQ1i3DliKOPs=;
  b=R7uIU++ANFBaVnsU2Oxv0STOKvdoC7UQi5Y6+oK0GBRv+8G60AkK5Sdv
   NEaGjdTZeLhbOd1rvJYfb/8sAPAtPIj13aLwNf1qkigNgNyhYxkDcBpNV
   a2xYRaPDEt5Sr2RskbGtzV6PJHueGD7P2zFYQQ6I/NqcwJi/7xRNM81aW
   3xj+QeBvqjmjnJDkR1FShPJrpwSMMjdeISejNuvxoBLLlrNbMhe3Fdc47
   keLO2XR9bl9ETMDEXa6jt1K0wuZLNqvpYoQLv4TsLNt8uxrS18xRxoxFH
   WorswHXIenfMgLzvuvlUHgVRae75GRgVnfRR5FQyQLoS2Ygqj+C5aI41w
   Q==;
X-CSE-ConnectionGUID: pZU5b/a3TVOSeK02WObNMw==
X-CSE-MsgGUID: 3A+kF7uUTXaHtxkO51GHeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63307942"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="63307942"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 14:23:28 -0800
X-CSE-ConnectionGUID: EdU2rS5ISBSAZurJXK70fQ==
X-CSE-MsgGUID: asLRl6dLQAiwZchuOEGguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="187299964"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2025 14:23:27 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG2xQ-000QaC-2w;
	Mon, 03 Nov 2025 22:23:24 +0000
Date: Tue, 4 Nov 2025 06:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v1 30/57]
 drivers/firmware/riscv/riscv_sbi_sse.c:505 sse_event_register() error:
 uninitialized symbol 'preferred_hart'.
Message-ID: <202511040647.EOR2ShWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Clément Léger" <cleger@rivosinc.com>
CC: Anup Patel <anup@brainfault.org>
CC: Himanshu Chauhan <hchauhan@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   3f71314c58520f6fada72d7f0364429fc3e8bf50
commit: 3e89594245fa2cf4bd298955d807fcd625294f22 [30/57] drivers: firmware: add riscv SSE support
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040647.EOR2ShWh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040647.EOR2ShWh-lkp@intel.com/

smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:505 sse_event_register() error: uninitialized symbol 'preferred_hart'.

vim +/preferred_hart +505 drivers/firmware/riscv/riscv_sbi_sse.c

3e89594245fa2c Clément Léger 2025-09-08  476  
3e89594245fa2c Clément Léger 2025-09-08  477  struct sse_event *sse_event_register(u32 evt, u32 priority,
3e89594245fa2c Clément Léger 2025-09-08  478  				     sse_event_handler_fn *handler, void *arg)
3e89594245fa2c Clément Léger 2025-09-08  479  {
3e89594245fa2c Clément Léger 2025-09-08  480  	struct sse_event *event;
3e89594245fa2c Clément Léger 2025-09-08  481  	int cpu;
3e89594245fa2c Clément Léger 2025-09-08  482  	int ret = 0;
3e89594245fa2c Clément Léger 2025-09-08  483  
3e89594245fa2c Clément Léger 2025-09-08  484  	if (!sse_available)
3e89594245fa2c Clément Léger 2025-09-08  485  		return ERR_PTR(-EOPNOTSUPP);
3e89594245fa2c Clément Léger 2025-09-08  486  
3e89594245fa2c Clément Léger 2025-09-08  487  	guard(mutex)(&sse_mutex);
3e89594245fa2c Clément Léger 2025-09-08  488  	if (sse_event_get(evt))
3e89594245fa2c Clément Léger 2025-09-08  489  		return ERR_PTR(-EEXIST);
3e89594245fa2c Clément Léger 2025-09-08  490  
3e89594245fa2c Clément Léger 2025-09-08  491  	event = sse_event_alloc(evt, priority, handler, arg);
3e89594245fa2c Clément Léger 2025-09-08  492  	if (IS_ERR(event))
3e89594245fa2c Clément Léger 2025-09-08  493  		return event;
3e89594245fa2c Clément Léger 2025-09-08  494  
3e89594245fa2c Clément Léger 2025-09-08  495  	scoped_guard(cpus_read_lock) {
3e89594245fa2c Clément Léger 2025-09-08  496  		if (sse_event_is_global(evt)) {
3e89594245fa2c Clément Léger 2025-09-08  497  			unsigned long preferred_hart;
3e89594245fa2c Clément Léger 2025-09-08  498  
3e89594245fa2c Clément Léger 2025-09-08  499  			ret = sse_event_attr_get_no_lock(event->global,
3e89594245fa2c Clément Léger 2025-09-08  500  							SBI_SSE_ATTR_PREFERRED_HART,
3e89594245fa2c Clément Léger 2025-09-08  501  							&preferred_hart);
3e89594245fa2c Clément Léger 2025-09-08  502  			if (ret)
3e89594245fa2c Clément Léger 2025-09-08  503  				goto err_event_free;
3e89594245fa2c Clément Léger 2025-09-08  504  
3e89594245fa2c Clément Léger 2025-09-08 @505  			cpu = riscv_hartid_to_cpuid(preferred_hart);
3e89594245fa2c Clément Léger 2025-09-08  506  			sse_global_event_update_cpu(event, cpu);
3e89594245fa2c Clément Léger 2025-09-08  507  
3e89594245fa2c Clément Léger 2025-09-08  508  			ret = sse_sbi_register_event(event, event->global);
3e89594245fa2c Clément Léger 2025-09-08  509  			if (ret)
3e89594245fa2c Clément Léger 2025-09-08  510  				goto err_event_free;
3e89594245fa2c Clément Léger 2025-09-08  511  
3e89594245fa2c Clément Léger 2025-09-08  512  		} else {
3e89594245fa2c Clément Léger 2025-09-08  513  			ret = sse_on_each_cpu(event, SBI_SSE_EVENT_REGISTER,
3e89594245fa2c Clément Léger 2025-09-08  514  					      SBI_SSE_EVENT_DISABLE);
3e89594245fa2c Clément Léger 2025-09-08  515  			if (ret)
3e89594245fa2c Clément Léger 2025-09-08  516  				goto err_event_free;
3e89594245fa2c Clément Léger 2025-09-08  517  		}
3e89594245fa2c Clément Léger 2025-09-08  518  	}
3e89594245fa2c Clément Léger 2025-09-08  519  
3e89594245fa2c Clément Léger 2025-09-08  520  	scoped_guard(spinlock, &events_list_lock)
3e89594245fa2c Clément Léger 2025-09-08  521  		list_add(&event->list, &events);
3e89594245fa2c Clément Léger 2025-09-08  522  
3e89594245fa2c Clément Léger 2025-09-08  523  	return event;
3e89594245fa2c Clément Léger 2025-09-08  524  
3e89594245fa2c Clément Léger 2025-09-08  525  err_event_free:
3e89594245fa2c Clément Léger 2025-09-08  526  	sse_event_free(event);
3e89594245fa2c Clément Léger 2025-09-08  527  
3e89594245fa2c Clément Léger 2025-09-08  528  	return ERR_PTR(ret);
3e89594245fa2c Clément Léger 2025-09-08  529  }
3e89594245fa2c Clément Léger 2025-09-08  530  EXPORT_SYMBOL_GPL(sse_event_register);
3e89594245fa2c Clément Léger 2025-09-08  531  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
