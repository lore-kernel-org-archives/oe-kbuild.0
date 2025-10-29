Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A337A3AA
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745927; cv=none; b=OcNgNFmsQSAKbOGllhF2rAjh7wKn39W3sxBqON0wihNNUM67y9I6Gz8sBi4aXKN2NzuW0zC3tSUXyKeqGGcTSnWA4zGdVrCb4p2/OQAzDyN/IQm91MizqNWG9ctuEjcHPDADNUuTjLXo+5zHcpR3HRYYBx2JKZ6AzjbFwL2FVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745927; c=relaxed/simple;
	bh=kyQWWKF4sEEE675IIA+QTjqR6we7d+Xk+zO8NX/ik4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3miFjD4ahhM3BAh+AIKge6JpluRLvy1o/VqWrv04eSDn4ilnhgeySnyqZcDQ0e4e14lBx4mpnY5ISK0cx/wZdJ1phlywhI0G7/hlABUbLG1G9eyCvVC7cZ0r7ZJXZW9M1XHgqpJaGpwhFCG8W0N6ds4eFcGh7xbm3cyvpvXpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7Vj1Mt/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7Vj1Mt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761745926; x=1793281926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyQWWKF4sEEE675IIA+QTjqR6we7d+Xk+zO8NX/ik4I=;
  b=S7Vj1Mt/CjSqeDyHoH/NEz2/KWAXZm9xV1mlI9ZkE4Y8LG/NcgzKRQOq
   Gqu8Artwv6GKJDUpWcTy3xQr5DUD83koFtJ9CYagwhD3KTnLTfizF/x2R
   KFjJhlfEtyJ8X7u25RIWHhHiemauZq7oKuquxgJwbZ9MSOHC4oYnoCNPa
   ySdfxV1ZnRfO93Ao1iZQfBSjSwND1sHHmQ4H0m3bIkWLwwirv3JNvHep/
   wXCmimcq0NruTAilYs3zzfBBIHS9vhuBg15ocYaXstupBt4yK/024J0j9
   61Z7LTlIc8njIAxPl5l/EMSVLiICJ7dHPq0PPylhrZwny72oEW9crTiMl
   Q==;
X-CSE-ConnectionGUID: 92DiIGy4QvSaJSL42T4Q6g==
X-CSE-MsgGUID: Ux72LdAhS2C/qg8jgKalow==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="62892907"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="62892907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 06:52:04 -0700
X-CSE-ConnectionGUID: jlD7+itNQKWOzhde1rpAqA==
X-CSE-MsgGUID: GI8uS843TIqpLb9Du8bqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185371211"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2025 06:52:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE6am-000Ker-17;
	Wed, 29 Oct 2025 13:52:00 +0000
Date: Wed, 29 Oct 2025 21:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v2 39/57]
 drivers/firmware/riscv/riscv_sbi_sse.c:718:6-8: ERROR: iterator variable
 bound on line 717 cannot be NULL
Message-ID: <202510292159.1IWXFpeO-lkp@intel.com>
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
head:   c49698608be7db287a0defb8c1940f56c1067bd4
commit: 3d06cc8825d087e91a55bdf217e20dff5e565d3b [39/57] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 76 minutes ago
:::::: commit date: 28 hours ago
config: riscv-randconfig-r053-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292159.1IWXFpeO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510292159.1IWXFpeO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/riscv/riscv_sbi_sse.c:718:6-8: ERROR: iterator variable bound on line 717 cannot be NULL

vim +718 drivers/firmware/riscv/riscv_sbi_sse.c

3d06cc8825d087 Himanshu Chauhan 2025-02-27  711  
3d06cc8825d087 Himanshu Chauhan 2025-02-27  712  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
3d06cc8825d087 Himanshu Chauhan 2025-02-27  713  {
3d06cc8825d087 Himanshu Chauhan 2025-02-27  714  	struct sse_ghes_event_data *ev_data = arg;
3d06cc8825d087 Himanshu Chauhan 2025-02-27  715  	struct sse_ghes_callback *cb = NULL;
3d06cc8825d087 Himanshu Chauhan 2025-02-27  716  
3d06cc8825d087 Himanshu Chauhan 2025-02-27 @717  	list_for_each_entry(cb, &ev_data->callback_list, head) {
3d06cc8825d087 Himanshu Chauhan 2025-02-27 @718  		if (cb && cb->ghes && cb->callback) {
3d06cc8825d087 Himanshu Chauhan 2025-02-27  719  			cb->callback(ev_data->event_num, cb->ghes, regs);
3d06cc8825d087 Himanshu Chauhan 2025-02-27  720  		}
3d06cc8825d087 Himanshu Chauhan 2025-02-27  721  	}
3d06cc8825d087 Himanshu Chauhan 2025-02-27  722  
3d06cc8825d087 Himanshu Chauhan 2025-02-27  723  	return 0;
3d06cc8825d087 Himanshu Chauhan 2025-02-27  724  }
3d06cc8825d087 Himanshu Chauhan 2025-02-27  725  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
