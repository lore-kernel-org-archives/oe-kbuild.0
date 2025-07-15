Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84C157493
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752568841; cv=none; b=QKkbCt42hvZv07iarkKQuDshptkdMLlgeNYUWdPanIT3P/biOIglpTEhoqdb6wjABPFzUOk1eliOuXn5DfoQ4/nbLoXRWy9w93mtGe7ZA6D8yKEi79dbuUEcHuv9xwlGT3GHqGW8GiYHbJ9qQQyRrbw98X/06WFb822R4ionozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752568841; c=relaxed/simple;
	bh=RfP5MZdX3YHXJP+itU1g+iM178JF3CC81q5qHXJyMHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZ0W7aEuIECMPYvqx5BPgX+f23k0zHTEIMchpGTEGdp/44vaylUiA9E47sHXXJHUjj91VJSGKgLNwmE4x9NX29xSMip9ePtSS/1aseS7+x3Vc8QyDvwCOA6uLY2mI2gWMIs0XkXXxI/4Bh7JYGdOK+NdySHli9RE68pBu/7JLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYydYno/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYydYno/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752568840; x=1784104840;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RfP5MZdX3YHXJP+itU1g+iM178JF3CC81q5qHXJyMHk=;
  b=AYydYno/u8/QUQnM3O6mHKbA0//rF/8qORt12M3F3SwpT2N+y+1gLTHE
   nXeKSnKEoPKTELFvABwWnz6kEzLtmS0fzUqARnO/drNKVnQluxwt5lWZM
   snFP3D3W8WpXDMatSOC9GbMxkZnOJ91L/CFBn9n6pv/VDHToP2M6kcx7p
   2DBkqzVmIzEfxZe8jbKfWlKP/tvnc8qzC6OgzZxRREdPA/8yL2u9T2AAM
   z91eSn5HTxu5eBAcUFJ7lFqLDRENBgDr+WVMqUA/hCCL8KQv5Csw6PN4d
   3G1pDFBR+ZKp36qN/RR/UHh66FGF2/jorNz1wAAUltSclaBFrXdlpGrIK
   g==;
X-CSE-ConnectionGUID: n21Fw186QT23Gi6N4R3i5Q==
X-CSE-MsgGUID: czmvGFgHR0uliHlZMb1dDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54715667"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54715667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:40:40 -0700
X-CSE-ConnectionGUID: l7jVj7PMSUmAoJXQAaoA3g==
X-CSE-MsgGUID: piasA/1WQv+pQzXpX+IQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="188170625"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2025 01:40:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubbDH-0009sB-1W;
	Tue, 15 Jul 2025 08:40:35 +0000
Date: Tue, 15 Jul 2025 16:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v1 64/79]
 drivers/firmware/riscv/riscv_sse.c:487 sse_event_register() error:
 uninitialized symbol 'preferred_hart'.
Message-ID: <202507151634.frrPBlvN-lkp@intel.com>
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
head:   bbedafbba85a78dae84bbf5a5844aaab3934e316
commit: 44353af7140cc6e552ffca749a4e46564f540b51 [64/79] drivers: firmware: add riscv SSE support
:::::: branch date: 24 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-r072-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151634.frrPBlvN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507151634.frrPBlvN-lkp@intel.com/

smatch warnings:
drivers/firmware/riscv/riscv_sse.c:487 sse_event_register() error: uninitialized symbol 'preferred_hart'.

vim +/preferred_hart +487 drivers/firmware/riscv/riscv_sse.c

44353af7140cc6 Clément Léger 2025-05-16  454  
44353af7140cc6 Clément Léger 2025-05-16  455  struct sse_event *sse_event_register(u32 evt, u32 priority,
44353af7140cc6 Clément Léger 2025-05-16  456  				     sse_event_handler *handler, void *arg)
44353af7140cc6 Clément Léger 2025-05-16  457  {
44353af7140cc6 Clément Léger 2025-05-16  458  	struct sse_per_cpu_evt cpu_evt;
44353af7140cc6 Clément Léger 2025-05-16  459  	struct sse_event *event;
44353af7140cc6 Clément Léger 2025-05-16  460  	int ret = 0;
44353af7140cc6 Clément Léger 2025-05-16  461  
44353af7140cc6 Clément Léger 2025-05-16  462  	if (!sse_available)
44353af7140cc6 Clément Léger 2025-05-16  463  		return ERR_PTR(-EOPNOTSUPP);
44353af7140cc6 Clément Léger 2025-05-16  464  
44353af7140cc6 Clément Léger 2025-05-16  465  	mutex_lock(&sse_mutex);
44353af7140cc6 Clément Léger 2025-05-16  466  	if (sse_event_get(evt)) {
44353af7140cc6 Clément Léger 2025-05-16  467  		pr_debug("Event %x already registered\n", evt);
44353af7140cc6 Clément Léger 2025-05-16  468  		ret = -EEXIST;
44353af7140cc6 Clément Léger 2025-05-16  469  		goto out_unlock;
44353af7140cc6 Clément Léger 2025-05-16  470  	}
44353af7140cc6 Clément Léger 2025-05-16  471  
44353af7140cc6 Clément Léger 2025-05-16  472  	event = sse_event_alloc(evt, priority, handler, arg);
44353af7140cc6 Clément Léger 2025-05-16  473  	if (IS_ERR(event)) {
44353af7140cc6 Clément Léger 2025-05-16  474  		ret = PTR_ERR(event);
44353af7140cc6 Clément Léger 2025-05-16  475  		goto out_unlock;
44353af7140cc6 Clément Léger 2025-05-16  476  	}
44353af7140cc6 Clément Léger 2025-05-16  477  
44353af7140cc6 Clément Léger 2025-05-16  478  	cpus_read_lock();
44353af7140cc6 Clément Léger 2025-05-16  479  	if (sse_event_is_global(evt)) {
44353af7140cc6 Clément Léger 2025-05-16  480  		unsigned long preferred_hart;
44353af7140cc6 Clément Léger 2025-05-16  481  
44353af7140cc6 Clément Léger 2025-05-16  482  		ret = sse_event_attr_get_no_lock(event->global,
44353af7140cc6 Clément Léger 2025-05-16  483  						 SBI_SSE_ATTR_PREFERRED_HART,
44353af7140cc6 Clément Léger 2025-05-16  484  						 &preferred_hart);
44353af7140cc6 Clément Léger 2025-05-16  485  		if (ret)
44353af7140cc6 Clément Léger 2025-05-16  486  			goto err_event_free;
44353af7140cc6 Clément Léger 2025-05-16 @487  		event->cpu = riscv_hartid_to_cpuid(preferred_hart);
44353af7140cc6 Clément Léger 2025-05-16  488  
44353af7140cc6 Clément Léger 2025-05-16  489  		ret = sse_sbi_register_event(event, event->global);
44353af7140cc6 Clément Léger 2025-05-16  490  		if (ret)
44353af7140cc6 Clément Léger 2025-05-16  491  			goto err_event_free;
44353af7140cc6 Clément Léger 2025-05-16  492  
44353af7140cc6 Clément Léger 2025-05-16  493  	} else {
44353af7140cc6 Clément Léger 2025-05-16  494  		cpu_evt.event = event;
44353af7140cc6 Clément Léger 2025-05-16  495  		atomic_set(&cpu_evt.error, 0);
44353af7140cc6 Clément Léger 2025-05-16  496  		cpu_evt.func = SBI_SSE_EVENT_REGISTER;
44353af7140cc6 Clément Léger 2025-05-16  497  		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
44353af7140cc6 Clément Léger 2025-05-16  498  		ret = atomic_read(&cpu_evt.error);
44353af7140cc6 Clément Léger 2025-05-16  499  		if (ret) {
44353af7140cc6 Clément Léger 2025-05-16  500  			cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
44353af7140cc6 Clément Léger 2025-05-16  501  			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
44353af7140cc6 Clément Léger 2025-05-16  502  			goto err_event_free;
44353af7140cc6 Clément Léger 2025-05-16  503  		}
44353af7140cc6 Clément Léger 2025-05-16  504  	}
44353af7140cc6 Clément Léger 2025-05-16  505  	cpus_read_unlock();
44353af7140cc6 Clément Léger 2025-05-16  506  
44353af7140cc6 Clément Léger 2025-05-16  507  	scoped_guard(spinlock, &events_list_lock)
44353af7140cc6 Clément Léger 2025-05-16  508  		list_add(&event->list, &events);
44353af7140cc6 Clément Léger 2025-05-16  509  
44353af7140cc6 Clément Léger 2025-05-16  510  	mutex_unlock(&sse_mutex);
44353af7140cc6 Clément Léger 2025-05-16  511  
44353af7140cc6 Clément Léger 2025-05-16  512  	return event;
44353af7140cc6 Clément Léger 2025-05-16  513  
44353af7140cc6 Clément Léger 2025-05-16  514  err_event_free:
44353af7140cc6 Clément Léger 2025-05-16  515  	cpus_read_unlock();
44353af7140cc6 Clément Léger 2025-05-16  516  	sse_event_free(event);
44353af7140cc6 Clément Léger 2025-05-16  517  out_unlock:
44353af7140cc6 Clément Léger 2025-05-16  518  	mutex_unlock(&sse_mutex);
44353af7140cc6 Clément Léger 2025-05-16  519  
44353af7140cc6 Clément Léger 2025-05-16  520  	return ERR_PTR(ret);
44353af7140cc6 Clément Léger 2025-05-16  521  }
44353af7140cc6 Clément Léger 2025-05-16  522  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
