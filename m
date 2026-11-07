Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033071;
	b=CA93mkvicNBthOnq5gZbyE5OwPTgeq6tCX1jUZsLq95mFTlAjIVt+yDjDbySsA0JmkNj
	 2Grwph1tHZ79GgjskD7hxrLDUGRPz27LhhZNPi02a4tgV/kEeXLQ8JNb1DXuBIt4PAvBI
	 wtse9sdj3r0bfHa2126rfj4yJjpJN+IVYV1D0k73uELzjvgBtdefpfqirA6tD0iaCVRBT
	 vKdiL31KmLhwF319TPXIo6U+HGdgjzUPUCURs6mU03xG3bfhWwvUFMb8tJ75sIiOKa0Sj
	 yXxo2N6fsFpAWX0BNxCm0i8fCXQxsuFnG3Q1MV5xEfqwiGTEHIn2Rt24+NiA0WPvw4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033071;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gZtKlzqstaZxC05C24dz9nLehEcTr6lf1MGVxB26Cwc=;
	b=bpVCgQIUFrOjg4pfEkhEA+BTvmq8CbesRvmSVU7HuSSqMryyhXJSLHkcuxgfrmC4KR5G
	 bFi7vNIN1PfsV2N+mqISNAzJtNhqR5N0zfVXIxai/2eizikAvB4WyZtJnH5RAKH3iwYAD
	 U7BNFF8ndPyS5daJ9L5bfewvm6lFdPJKZn9FnsVzOogZXJdk2SKat/tpGHIXM6pLyCWKa
	 tRO79HgX0dqzeMI47rSrBAl539bK2JB84XtYO9dH7X9JMElawpxITebA8Tq9UFYTsymkZ
	 l7Y2iJwE8nVRIr1c947UNUh49xDq5JKQ+dGhYX7gAzhtmNhL5Wz57OoU7GxFkE/2iaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxIUW7fQ;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2756606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 06:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2756606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxIUW7fQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794033069; x=1825569069;
  h=date:from:to:cc:subject:message-id;
  bh=ApNskx4DLm+gO0o6TuHBT1hMB4bi30d4TCHUGSLOwZY=;
  b=NxIUW7fQSezbznkR63HRyUbsG1iowz1hD0roy22X6iITPwYEVFwJJ2Fa
   1VFo4BP2uiNpTiDMr0QIZmKnMoQ4TlJoWLHtGrQGjT4Wv1PzsyNvthhaW
   SwWZjhnt9bMo57XSEXGrPNuSPDSJsQkw1Akzkx4T7eRy9ENuUT6J04e2z
   IampqXp5u+q7X0uNPbwiGw0oXxNMeai1Ivio3PmvGU0OJ7ERI5BIyc8JE
   3qfYlWu/WNf2IPN7yBd6eDl1ZrZqfB1sI+NAVMKnmJ/dfQ2IJw32Cidxp
   7DvrjNQze5k11K5KYDmSvUk8e/5PaTz7T8X6Shlv5jaoTcriWhYEa/nkb
   g==;
X-CSE-ConnectionGUID: Eaaa3r8RRvCnYUXUTGFKcg==
X-CSE-MsgGUID: 6EiBt6paTaCPeOZ26fKGFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2867305"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2867305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 22:31:08 -0800
X-CSE-ConnectionGUID: Ll6Pjud+Q/KYHxoFzmkTVA==
X-CSE-MsgGUID: RGMaMJIVS92IZd5BcSRINQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7498628"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2026 22:31:07 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPZxA-00000000AaR-3yG6;
	Sat, 07 Nov 2026 06:31:04 +0000
Date: Sat, 07 Nov 2026 07:30:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 53/53]
 drivers/android/wrapfd.c:788:32-49: opportunity for str_yes_no(ctx ->
 allow_guests)
Message-ID: <202611070754.AdFqlCZk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Suren,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   bc10f2ae3a89cd46c1069ed99b65df424ba3d3db
commit: 0513c5d5a13918d0326f9586ef6edad1872a6c98 [53/53] ANDROID: drivers/wrapfd: fix dmabuf_content_load and use kvec for loading
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-r2111-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070754.AdFqlCZk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611070754.AdFqlCZk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/android/wrapfd.c:788:32-49: opportunity for str_yes_no(ctx -> allow_guests)

vim +788 drivers/android/wrapfd.c

dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  773  
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  774  #ifdef CONFIG_PROC_FS
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  775  static void wrap_show_fdinfo(struct seq_file *m, struct file *file)
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  776  {
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  777  	struct wrap_ctx *ctx = file->private_data;
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  778  
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  779  	spin_lock(&ctx->lock);
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  780  	if (ctx->owner.task) {
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  781  		seq_printf(m, "owner:\t%d\n", ctx->owner.task->pid);
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  782  	} else {
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  783  		if (ctx->owner.dev)
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  784  			seq_printf(m, "owner:\t<device>\n");
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  785  		else
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  786  			seq_printf(m, "owner:\t<none>\n");
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  787  	}
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21 @788  	seq_printf(m, "guests:\t%s\n", ctx->allow_guests ? "yes" : "no");
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  789  	seq_printf(m, "maps:\t%d\n", ctx->map_count);
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  790  	seq_printf(m, "empty:\t%s\n", ctx->content ? "no" : "yes");
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  791  	if (ctx->content) {
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  792  		struct wrap_content *content = ctx->content;
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  793  
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  794  		seq_printf(m, "rdonly:\t%s\n",
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  795  			   content->ops->is_writable(content) ? "no" : "yes");
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  796  		content->ops->show_fdinfo(content, m);
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  797  	}
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  798  	spin_unlock(&ctx->lock);
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  799  }
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  800  #endif
dcd6a28f187e49 Suren Baghdasaryan 2025-11-21  801  

:::::: The code at line 788 was first introduced by commit
:::::: dcd6a28f187e4931aff3c8f3889d9776961ced02 ANDROID: drivers/wrapfd: add wrapfd driver base code

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: android-test-infra-autosubmit@system.gserviceaccount.com <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
