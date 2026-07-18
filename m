Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407DD2D3ECF
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784355861; cv=none; b=BT+l/bMHN3mUAE2Cdhv1g2DWr5T18sYKEJUibXKh/RaFv5d5gq9eahBCl8CtqqGyr6un0j1QbrIY6/10F/2olFfEWAHT3NHVyqwwnSv+jaXRP57eHb/3FrGjDg3IzczkE7BlgzDcCfCaaXuwj9Z23EDRt56j6s9PoYclWcGtpx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784355861; c=relaxed/simple;
	bh=yfAjUizZ4GHE+ncPM+yNH2V3XhCnZTOM0tnu1Z6p6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gd+QbGS+qB6e/oo4j3AvNte9VMBC3l3fHukyp4vlWvghJ/YkxxpCAau+wSmgbri7Y2PmuxOPOEzfIOjX/5rvgwqByRIAc1ebvFB/abvD4WVlcWg3wIM3+74EHhRFMzBIMw6rsLcIHGLOokxY5y7EQIBD1a2UMfG4saLFeSFn5Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9R5Kl0U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9R5Kl0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784355859; x=1815891859;
  h=date:from:to:cc:subject:message-id;
  bh=yfAjUizZ4GHE+ncPM+yNH2V3XhCnZTOM0tnu1Z6p6Gs=;
  b=J9R5Kl0UFt82gbuAubCFUxJVLKXd3ueOr51siTVWZruQHeZnhlxaslG6
   O5Vc/rp/cjlVnGlL4ZgqDo0BpSgn3Exu375QNoNGKSzVIhgB43XFmeXMh
   y9n0cvm0S331ZHOAFNPOw80UaieQa+P7X6LynPiKEaO2HMRfbbcUaZCq5
   zyEwzpcxsY/GhitY60SmDAGv31Mq7WpvjmYF6LoA0/+mxzEMGbkse3T7N
   sb1snGqfo9mZolhzHE7R3A+ZuvJ9SJgl6N8YGQLWKms9+tAOdWSwL4fjf
   Ediq/YcwME29ramhXMzKsaT+dgWGRTDqqcRvtRaWtuG8PR9cMPGsZpYdj
   A==;
X-CSE-ConnectionGUID: w2f/zVTIQeeret5bvQQJ6w==
X-CSE-MsgGUID: 2H/+HopFQbCz7rIdQ5eTlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102568350"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="102568350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:24:18 -0700
X-CSE-ConnectionGUID: qLDSi4dnT4iYCLnDKQTemw==
X-CSE-MsgGUID: hU1pl/FcTV2IqX61g2AnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="281424968"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2026 23:24:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyT9-00000000TVX-0DUy;
	Sat, 18 Jul 2026 06:24:15 +0000
Date: Sat, 18 Jul 2026 14:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12 1/1]
 drivers/android/wrapfd.c:542:32-49: opportunity for str_yes_no(ctx ->
 allow_guests)
Message-ID: <202607181409.kYTZnVB0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: 780777f21fb7cac4a28f1dffe5581a50c3c6cb32 [1/1] ANDROID: drivers/wrapfd: add wrapfd driver base code
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r062-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181409.kYTZnVB0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607181409.kYTZnVB0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/android/wrapfd.c:542:32-49: opportunity for str_yes_no(ctx -> allow_guests)

vim +542 drivers/android/wrapfd.c

780777f21fb7ca Suren Baghdasaryan 2025-11-21  527  
780777f21fb7ca Suren Baghdasaryan 2025-11-21  528  #ifdef CONFIG_PROC_FS
780777f21fb7ca Suren Baghdasaryan 2025-11-21  529  static void wrap_show_fdinfo(struct seq_file *m, struct file *file)
780777f21fb7ca Suren Baghdasaryan 2025-11-21  530  {
780777f21fb7ca Suren Baghdasaryan 2025-11-21  531  	struct wrap_ctx *ctx = file->private_data;
780777f21fb7ca Suren Baghdasaryan 2025-11-21  532  
780777f21fb7ca Suren Baghdasaryan 2025-11-21  533  	spin_lock(&ctx->lock);
780777f21fb7ca Suren Baghdasaryan 2025-11-21  534  	if (ctx->owner.task) {
780777f21fb7ca Suren Baghdasaryan 2025-11-21  535  		seq_printf(m, "owner:\t%d\n", ctx->owner.task->pid);
780777f21fb7ca Suren Baghdasaryan 2025-11-21  536  	} else {
780777f21fb7ca Suren Baghdasaryan 2025-11-21  537  		if (ctx->owner.dev)
780777f21fb7ca Suren Baghdasaryan 2025-11-21  538  			seq_printf(m, "owner:\t<device>\n");
780777f21fb7ca Suren Baghdasaryan 2025-11-21  539  		else
780777f21fb7ca Suren Baghdasaryan 2025-11-21  540  			seq_printf(m, "owner:\t<none>\n");
780777f21fb7ca Suren Baghdasaryan 2025-11-21  541  	}
780777f21fb7ca Suren Baghdasaryan 2025-11-21 @542  	seq_printf(m, "guests:\t%s\n", ctx->allow_guests ? "yes" : "no");
780777f21fb7ca Suren Baghdasaryan 2025-11-21  543  	seq_printf(m, "maps:\t%d\n", ctx->map_count);
780777f21fb7ca Suren Baghdasaryan 2025-11-21  544  	seq_printf(m, "empty:\t%s\n", ctx->content ? "no" : "yes");
780777f21fb7ca Suren Baghdasaryan 2025-11-21  545  	if (ctx->content) {
780777f21fb7ca Suren Baghdasaryan 2025-11-21  546  		struct wrap_content *content = ctx->content;
780777f21fb7ca Suren Baghdasaryan 2025-11-21  547  
780777f21fb7ca Suren Baghdasaryan 2025-11-21  548  		seq_printf(m, "rdonly:\t%s\n",
780777f21fb7ca Suren Baghdasaryan 2025-11-21  549  			   content->ops->is_writable(content) ? "no" : "yes");
780777f21fb7ca Suren Baghdasaryan 2025-11-21  550  		content->ops->show_fdinfo(content, m);
780777f21fb7ca Suren Baghdasaryan 2025-11-21  551  	}
780777f21fb7ca Suren Baghdasaryan 2025-11-21  552  	spin_unlock(&ctx->lock);
780777f21fb7ca Suren Baghdasaryan 2025-11-21  553  }
780777f21fb7ca Suren Baghdasaryan 2025-11-21  554  #endif
780777f21fb7ca Suren Baghdasaryan 2025-11-21  555  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
