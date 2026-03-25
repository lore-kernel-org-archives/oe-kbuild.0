Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DC3126B9
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441115; cv=none; b=I6iS/xbulpAZ6LS7mOIftrszIvmLKQW/Up8kzpfR0TdXL8m/kp5BAIxhjkXZIcYJnXoXAVy0ZAFKPuNamQr7L+g1RjWdeHegizMByK6fTQtKqKAc1HwkDxAtNAH94MXRSlQG3hIgxmwR+7XqK7KaadvMtQysjftga/gxuOFnbBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441115; c=relaxed/simple;
	bh=n23KoyTt6YkJk89UVzkOwO26tM/PJK+6QhKbjd6XBUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5SESao1aaDnzUzUr77Sc21+PTcTWAFTa+KEXpR4+CKhmZm6b1nUV6+7RnX14/eHnPt6RjV/WQqj1Oeap83bOpy7EyyNdm5/qHtnEKIMNnekSr1ACk9wcrgAJVoxrK7iU1O4TKqyUTg51W/ljMvIBMLKwHCnj+BlNn1yQkkU788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAERuvRI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAERuvRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441113; x=1805977113;
  h=date:from:to:cc:subject:message-id;
  bh=n23KoyTt6YkJk89UVzkOwO26tM/PJK+6QhKbjd6XBUc=;
  b=jAERuvRIBfx7pbxLMPtK0zod2f/FtZDwEUEmLARJ7YG9fausqIciFqLr
   H4GXo8f3Xsz70NQfbrwICpW8ios9OHwukKihc36Hmc2K4HFCCbOAGO0xO
   CZZvwbDSLSvwLZreOZs7T3Kx4AlHR78FcHdpdHfYjC0hbXQlYhze86ANJ
   cnmkqKAJEhxOKAyUL4F0IlEmztqzVTWkkD4yn4pI3wPBOEw+k3aShu1Bk
   KixAG7xhdU9lDYPlRFa3rN0Lag8ud00dtNwf/Yj+W/VV+WEDlE5r3KEto
   VXHIoia2JIZQRl8DpDySR5zKn3u0MH/QczcumYVzrPGt/LyZ+h2iXXRyI
   g==;
X-CSE-ConnectionGUID: shj+LMXvRBGjafzUYeF0gg==
X-CSE-MsgGUID: kn7B4ztOQpWzr6SUs5UwJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86553456"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86553456"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:18:33 -0700
X-CSE-ConnectionGUID: RzNYn/2gQL+2l4cgt9X9mQ==
X-CSE-MsgGUID: gNdlvxx+SSi0kYu0h1HI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248183381"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 05:18:32 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5NBt-000000006nB-3Yba;
	Wed, 25 Mar 2026 12:18:29 +0000
Date: Wed, 25 Mar 2026 20:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 1/1]
 drivers/android/wrapfd.c:542:32-49: opportunity for str_yes_no(ctx ->
 allow_guests)
Message-ID: <202603252059.zfiJ6xhw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 695a61be876e980b18550881f0e37d44ca5b56e1 [1/1] ANDROID: drivers/wrapfd: add wrapfd driver base code
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-r054-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252059.zfiJ6xhw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603252059.zfiJ6xhw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/android/wrapfd.c:542:32-49: opportunity for str_yes_no(ctx -> allow_guests)

vim +542 drivers/android/wrapfd.c

695a61be876e98 Suren Baghdasaryan 2025-11-21  527  
695a61be876e98 Suren Baghdasaryan 2025-11-21  528  #ifdef CONFIG_PROC_FS
695a61be876e98 Suren Baghdasaryan 2025-11-21  529  static void wrap_show_fdinfo(struct seq_file *m, struct file *file)
695a61be876e98 Suren Baghdasaryan 2025-11-21  530  {
695a61be876e98 Suren Baghdasaryan 2025-11-21  531  	struct wrap_ctx *ctx = file->private_data;
695a61be876e98 Suren Baghdasaryan 2025-11-21  532  
695a61be876e98 Suren Baghdasaryan 2025-11-21  533  	spin_lock(&ctx->lock);
695a61be876e98 Suren Baghdasaryan 2025-11-21  534  	if (ctx->owner.task) {
695a61be876e98 Suren Baghdasaryan 2025-11-21  535  		seq_printf(m, "owner:\t%d\n", ctx->owner.task->pid);
695a61be876e98 Suren Baghdasaryan 2025-11-21  536  	} else {
695a61be876e98 Suren Baghdasaryan 2025-11-21  537  		if (ctx->owner.dev)
695a61be876e98 Suren Baghdasaryan 2025-11-21  538  			seq_printf(m, "owner:\t<device>\n");
695a61be876e98 Suren Baghdasaryan 2025-11-21  539  		else
695a61be876e98 Suren Baghdasaryan 2025-11-21  540  			seq_printf(m, "owner:\t<none>\n");
695a61be876e98 Suren Baghdasaryan 2025-11-21  541  	}
695a61be876e98 Suren Baghdasaryan 2025-11-21 @542  	seq_printf(m, "guests:\t%s\n", ctx->allow_guests ? "yes" : "no");
695a61be876e98 Suren Baghdasaryan 2025-11-21  543  	seq_printf(m, "maps:\t%d\n", ctx->map_count);
695a61be876e98 Suren Baghdasaryan 2025-11-21  544  	seq_printf(m, "empty:\t%s\n", ctx->content ? "no" : "yes");
695a61be876e98 Suren Baghdasaryan 2025-11-21  545  	if (ctx->content) {
695a61be876e98 Suren Baghdasaryan 2025-11-21  546  		struct wrap_content *content = ctx->content;
695a61be876e98 Suren Baghdasaryan 2025-11-21  547  
695a61be876e98 Suren Baghdasaryan 2025-11-21  548  		seq_printf(m, "rdonly:\t%s\n",
695a61be876e98 Suren Baghdasaryan 2025-11-21  549  			   content->ops->is_writable(content) ? "no" : "yes");
695a61be876e98 Suren Baghdasaryan 2025-11-21  550  		content->ops->show_fdinfo(content, m);
695a61be876e98 Suren Baghdasaryan 2025-11-21  551  	}
695a61be876e98 Suren Baghdasaryan 2025-11-21  552  	spin_unlock(&ctx->lock);
695a61be876e98 Suren Baghdasaryan 2025-11-21  553  }
695a61be876e98 Suren Baghdasaryan 2025-11-21  554  #endif
695a61be876e98 Suren Baghdasaryan 2025-11-21  555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
