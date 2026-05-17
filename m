Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389A2AD24
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 00:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778976068; cv=none; b=a2rIYCfHQHhiD7FOomoHea22dOQXTBZ2H6aDOhqICiIGjoZrAcMZTXv6vn2YQy211GEIJCf/zZzDZtOeyp2hqiYpHgNaP+pSRXFga/fD1ruvcTV3pxy0rMJ37xI76UPXr+99kHPT9eUmGJEV9zS4xe7LKVvBWxrGMWjigzS7dWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778976068; c=relaxed/simple;
	bh=92jiutAXGbrnNF2BLAYqNF1EWs6IusLTl8jqA3Etz6E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=psMUxaIs4Eor/xfmT9KezyLbzVwimXq4FsvZU5KhOUy2X12Dy/QgrU1+gJyEtfdv0Ynu6faQEp5Kz5xgj4VGKFi8MX/wM6Mb0HOsYeBikDeoR1cbAHxla2qpeqx6EPBwU8j1iHr3SpTYIUjI15u8LaUuPHsVUTvs93F7EbYEbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0KuOHr/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0KuOHr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778976067; x=1810512067;
  h=date:from:to:cc:subject:message-id;
  bh=92jiutAXGbrnNF2BLAYqNF1EWs6IusLTl8jqA3Etz6E=;
  b=k0KuOHr/4lGM/a/1SSBoZCEeu1/jfDsmwFt5MnVupB0bo55BIg4131lT
   bNPADjJBQCJm0hQXLJd/ngPg2ldZCugeFBoOd+CczA5BMJWIuVYu2joLk
   eLp6V//m8xXFRbhDI0A/CgyixX6qIiWhMHPM94rS9SZWwG0+gxCz0b66z
   bOSb0SieC+B1dvQUytXc6RZTR6+yTVwtalqGCA1dF2UQyYMatCxBDfujx
   OVnkEaHICoPgYikcBHqvjMcEs8WHqy2bSpoUneWdt/JInIzz3NM9//YNZ
   cfkeQc7lCK3V/KOjujQg2N1EeBG5QJt6gUCf3FjKMAehs3YWVbGCaKrFD
   A==;
X-CSE-ConnectionGUID: yLQDjNAITQaUCQG34eB04w==
X-CSE-MsgGUID: 4MtUeOOOQ7OhoBjS1g8cTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79859938"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79859938"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 17:01:06 -0700
X-CSE-ConnectionGUID: uuOpgjeYTOaJE5ss3CFGTQ==
X-CSE-MsgGUID: L5vcq4BgT/SIeoD72bVN4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="238934081"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 May 2026 17:01:05 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOOwI-000000001DG-2S85;
	Sun, 17 May 2026 00:01:02 +0000
Date: Sun, 17 May 2026 08:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [martin-lau-bpf-next:cgrp.struct_ops.v8 9/12]
 kernel/bpf/cgroup.c:513 prog_list_replace_item() error: we previously assumed
 'pl->link' could be null (see line 510)
Message-ID: <202605170734.0Q0GXEJ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Martin KaFai Lau <martin.lau@linux.dev>
TO: Martin KaFai Lau <martin.lau@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git cgrp.struct_ops.v8
head:   1ae5eccb04d5d8c62c310b206b5e5dc4ff1d9c71
commit: 32e27daf9a1563276f88eb17d076f61f8cc8b502 [9/12] bpf: Add infrastructure to support attaching struct_ops to cgroups
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: nios2-randconfig-r073-20260517 (https://download.01.org/0day-ci/archive/20260517/202605170734.0Q0GXEJ9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605170734.0Q0GXEJ9-lkp@intel.com/

smatch warnings:
kernel/bpf/cgroup.c:513 prog_list_replace_item() error: we previously assumed 'pl->link' could be null (see line 510)

vim +513 kernel/bpf/cgroup.c

95b27b9bf36972 Martin KaFai Lau 2026-05-13  507  
95b27b9bf36972 Martin KaFai Lau 2026-05-13  508  static void prog_list_replace_item(struct bpf_prog_list *pl, struct bpf_prog_array_item *item)
95b27b9bf36972 Martin KaFai Lau 2026-05-13  509  {
32e27daf9a1563 Martin KaFai Lau 2026-05-12 @510  	if (pl->link && pl->link->map)
32e27daf9a1563 Martin KaFai Lau 2026-05-12  511  		WRITE_ONCE(item->kdata, bpf_struct_ops_map_kdata(pl->link->map));
32e27daf9a1563 Martin KaFai Lau 2026-05-12  512  	else
95b27b9bf36972 Martin KaFai Lau 2026-05-13 @513  		WRITE_ONCE(item->prog, pl->link->link.prog);
95b27b9bf36972 Martin KaFai Lau 2026-05-13  514  }
95b27b9bf36972 Martin KaFai Lau 2026-05-13  515  

:::::: The code at line 513 was first introduced by commit
:::::: 95b27b9bf369725868da48816a0dda25fb69805f bpf: Add prog_list_init_item(), prog_list_replace_item(), and prog_list_id()

:::::: TO: Martin KaFai Lau <martin.lau@kernel.org>
:::::: CC: Martin KaFai Lau <martin.lau@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
