Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E38F5B
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731041633; cv=none; b=UpPhyrqcWMsXQGQrnWZKmg+zauiwexvLUYUwDEEGqa2EYnTYt+MOU7N2NCw+7MEc4a5+EyQcAusWP5mAbuhIfyR+d31bEdWQ6ncjTGn4+a20XoKF0eWOIOWQBqH/tnmII1iOW7IfQ6+fp5hdb+CUpAPnhdMZLAeSM6kdTBXu460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731041633; c=relaxed/simple;
	bh=ljfg4x3TaWxAmCy7yQwAH2uvCdHTly8zRxAd+6m3vZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEgrZkXqS7QQapxXFqlcI7zQJcycQZnwOl5Aw2O748KloGHNHF7bKPXsxmC6wBt9m2/jshBWQM9FNX8FL3Lk3vTLAo+OosL3BrcIgnma9etRyziLu9ye9kTbFyrzfROkCPbc7xXxj1DptZkisulxkeKL1/MnXwY7P17hoLW7Wys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7z5w3bA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7z5w3bA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731041631; x=1762577631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljfg4x3TaWxAmCy7yQwAH2uvCdHTly8zRxAd+6m3vZg=;
  b=D7z5w3bAFucikSbjk3HgLQsAnw+ylOnCp9XTMn/hD784cgWzz00zCMJS
   5jjrE1fySshvhMoqPTfI5+UPitg2n5tiilHr6AtNvq2Nzk5PaVL2gTCBW
   nwbSIyq+4EFpML3WI0lZ6ZT9mPnQfxqbOA2hE8/i060oKRIvOkpCbvwck
   W6WCweztiQzOe+lbSQHz/XYTRTKDCKVLSbDmJb8zJ1aJX/5TVkFlyMsdt
   QycUIbn2zuFWni1oA9PPWwy1HdD3vuCb1KZCrHDQZPXP+RfFymF8MYUpA
   UgFfY1DWPr+fO+U3aFI8qun8btgjvI+tBa8WmfxKvERtkWFggIFz4VGO6
   w==;
X-CSE-ConnectionGUID: inI1yf3pQlS57YhfyH2S6A==
X-CSE-MsgGUID: lrTtw6zFR92amsWMqjCUqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42313932"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="42313932"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 20:53:50 -0800
X-CSE-ConnectionGUID: usIxX+7ES1+UCbuRK/wM7Q==
X-CSE-MsgGUID: B1OheaQXTPOQQzP+1p41gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="90256454"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Nov 2024 20:53:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9H0F-000r2o-1l;
	Fri, 08 Nov 2024 04:53:47 +0000
Date: Fri, 8 Nov 2024 12:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [uml:next 44/66] arch/x86/um/signal.c:189 copy_sc_to_user() warn:
 sizeof(NUMBER)?
Message-ID: <202411081221.gBpSeINf-lkp@intel.com>
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
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   0f659ff362eac69777c4c191b7e5ccb19d76c67d
commit: 3f17fed2149192c7d3b76a45a6a87b4ff22cd586 [44/66] um: switch to regset API and depend on XSTATE
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: um-randconfig-r071-20241107 (https://download.01.org/0day-ci/archive/20241108/202411081221.gBpSeINf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411081221.gBpSeINf-lkp@intel.com/

New smatch warnings:
arch/x86/um/signal.c:189 copy_sc_to_user() warn: sizeof(NUMBER)?

Old smatch warnings:
arch/x86/um/signal.c:45 copy_sc_from_user() warn: maybe return -EFAULT instead of the bytes remaining?
arch/x86/um/signal.c:191 copy_sc_to_user() warn: sizeof(NUMBER)?
arch/x86/um/signal.c:261 setup_signal_stack_sc() warn: '(47192)' 47192 can't fit into 32767 '__x'
arch/x86/um/signal.c:263 setup_signal_stack_sc() warn: '(32973)' 32973 can't fit into 32767 '__x'
arch/x86/um/signal.c:318 setup_signal_stack_si() warn: '(32973)' 32973 can't fit into 32767 '__x'

vim +189 arch/x86/um/signal.c

a5f6096c805e6d arch/um/sys-i386/signal.c Jeff Dike      2007-10-16  180  
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  181  	if (copy_to_user(to_fp64, regs->regs.fp, host_fp_size))
a5f6096c805e6d arch/um/sys-i386/signal.c Jeff Dike      2007-10-16  182  		return 1;
5a6951273e0e9d arch/x86/um/signal.c      Benjamin Berg  2024-09-13  183  
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  184  	/*
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  185  	 * Put magic/size values for userspace. We do not bother to verify them
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  186  	 * later on, however, userspace needs them should it try to read the
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  187  	 * XSTATE data. And ptrace does not fill in these parts.
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  188  	 */
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23 @189  	BUILD_BUG_ON(sizeof(int) != FP_XSTATE_MAGIC2_SIZE);
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  190  #ifdef CONFIG_X86_32
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  191  	__put_user(offsetof(struct _fpstate_32, _fxsr_env) +
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  192  		   host_fp_size + FP_XSTATE_MAGIC2_SIZE,
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  193  		   &to_fp64->fpstate.sw_reserved.extended_size);
5a6951273e0e9d arch/x86/um/signal.c      Benjamin Berg  2024-09-13  194  #else
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  195  	__put_user(host_fp_size + FP_XSTATE_MAGIC2_SIZE,
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  196  		   &to_fp64->fpstate.sw_reserved.extended_size);
5a6951273e0e9d arch/x86/um/signal.c      Benjamin Berg  2024-09-13  197  #endif
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  198  	__put_user(host_fp_size, &to_fp64->fpstate.sw_reserved.xstate_size);
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  199  
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  200  	__put_user(FP_XSTATE_MAGIC1, &to_fp64->fpstate.sw_reserved.magic1);
3f17fed2149192 arch/x86/um/signal.c      Benjamin Berg  2024-10-23  201  	__put_user(FP_XSTATE_MAGIC2, (int *)((void *)to_fp64 + host_fp_size));
^1da177e4c3f41 arch/um/sys-i386/signal.c Linus Torvalds 2005-04-16  202  
f67aa2ffb7ce2f arch/x86/um/signal.c      Al Viro        2011-08-18  203  	return 0;
^1da177e4c3f41 arch/um/sys-i386/signal.c Linus Torvalds 2005-04-16  204  }
^1da177e4c3f41 arch/um/sys-i386/signal.c Linus Torvalds 2005-04-16  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
