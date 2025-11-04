Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F814EC73
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226137; cv=none; b=Xy6jNwn7E84gysE7Tk2l+fDFjtHxR0hHgpiQOTsfAWaILZCsgfayw00as8n3QA6FmiJ5vq35sAJ5zXT6f9glaq1a+vVu91tYttFv5d/nS2mqoml3RQUmjzJWu7iDJJH550AxwVrXP6SCerhvRdSGCjxZ4RCUzZJkz2Tc5keikMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226137; c=relaxed/simple;
	bh=q55iD40274/B/LRQ0BCWV++MVJtfFeBc4dp58HMnet4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aK8S1LhxiHhc9jBR+6+BvoAM5+ADqmsAKVxtbE2/RKMyykgC3L4W4J4SQxdpmikVlddjL0w2zcj5H3K6ptuwGowogPSJSg0we0+Z85UZzK6SDDEqUATS4aRNChQISWB4e8GCPQ58CcF9DhELN12GFlD3YLrTuexcXmBHxF2e8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3gJaPrg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3gJaPrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762226135; x=1793762135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q55iD40274/B/LRQ0BCWV++MVJtfFeBc4dp58HMnet4=;
  b=I3gJaPrg6KrWjH3nNvhnGSOgeBYP9u98P/VMIw9enQozZuQ/9Tb4EdK8
   BlSbjSJbDDEBOq+U5w4oN9Z7IvN24taQFWgxAHoVSVCL/r0cGfSBHaaSF
   VZLh/G1oAGpwForckPx3h0+ShKSEqZ6K4uewBXLG5hIZuiPxxStz3m4bC
   Rgunl29GgJdPRr61TJ3WEspCNqYV0ctHqT7DiO5yMwsbqGek0RdbUyyO3
   Klug67+LKDQ/12/DNaJ64yGGr1ihm6QR71jc1aaJD/QrhMs1L6xtQDJRA
   4R7SXgh+3rBCJqi8RuyRJH7ntgXni0H3WG8X4w1MnOdvLo2v1ne5o2p2L
   w==;
X-CSE-ConnectionGUID: ii+aBglJS4SxJqmPRJ4A4w==
X-CSE-MsgGUID: SgfO9dQbQdazpksK0DEuvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63516153"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="63516153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 19:15:35 -0800
X-CSE-ConnectionGUID: oOdiISlvRdCl9YNq41OpQQ==
X-CSE-MsgGUID: O6C/doJIRj6m61nVJ1ciMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186280344"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Nov 2025 19:15:34 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG7Uz-000Qo0-1v;
	Tue, 04 Nov 2025 03:14:53 +0000
Date: Tue, 4 Nov 2025 11:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v2 39/58]
 drivers/firmware/riscv/riscv_sbi_sse.c:717 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 718)
Message-ID: <202511041114.4M7JPo19-lkp@intel.com>
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
TO: Himanshu Chauhan <hchauhan@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v2
head:   41e2962102e2318916f87f0ed7eb297a6b3224d3
commit: 7a78f3d24d5d385aad5e5540aab849569f2335cd [39/58] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 20 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251104/202511041114.4M7JPo19-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041114.4M7JPo19-lkp@intel.com/

New smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:717 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 718)

Old smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:507 sse_event_register() error: uninitialized symbol 'preferred_hart'.

vim +/cb +717 drivers/firmware/riscv/riscv_sbi_sse.c

7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  711  
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  712  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  713  {
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  714  	struct sse_ghes_event_data *ev_data = arg;
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  715  	struct sse_ghes_callback *cb = NULL;
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  716  
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29 @717  	list_for_each_entry(cb, &ev_data->callback_list, head) {
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29 @718  		if (cb && cb->ghes && cb->callback) {
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  719  			cb->callback(ev_data->event_num, cb->ghes, regs);
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  720  		}
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  721  	}
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  722  
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  723  	return 0;
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  724  }
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  725  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
