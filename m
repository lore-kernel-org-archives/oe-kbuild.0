Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A41AA3DF
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367859; cv=none; b=rlahhOa1BXoWSlopXksavfMURhEwFb2Ux4/7VSZnVrDB5CJX2rSKTMzRQxWFpADSz+JnH6OcDrUCBxrukrE4w1VJpTEGvhou1YnzSzA+XCkPUCKWdYaYzJI1hNd352ZAeIyQJK0I1hUyjBmFb/qVFA8015aA7PZGfR5RWUH70E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367859; c=relaxed/simple;
	bh=LZue/KfhUgzB7+PM9X1ls/G0pc+Na4M3v2IRROZlv24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hj5M+XrSoPGn7lrOK7dh+djoXdwqcgbzO3DDskpB/yrkpe7I7apRPCYZvg6OBylwXm8KJt0koXNlYjoFOj5REuaW0catJ4CLnfY68wCxaqe0VoPgAbrln4KRLjtN3gepKuzBT8zMGvMnJyKqu3ciVURiVETVmibAzBwIFpgMQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSfviGDv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSfviGDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722367857; x=1753903857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZue/KfhUgzB7+PM9X1ls/G0pc+Na4M3v2IRROZlv24=;
  b=CSfviGDvNVAkLSt3WI5LymbpErsAaCvt6T+5/FiztkRKsI5fURtOjUX0
   FFT9IdjIRJxyfVbWjwfHcrrhGpRDgidCU0u8QZf7oVBgVNd971QskQO68
   dZw3CTOArulwVKsMjXiAq6L0Jb7N+a888sDnZe75A6AM85DNf8jFAO3DI
   sQKGtF6bpOLWA02sSbSGNTvEDi44PiP3yoL8UNOVc4OdAfdTnxRqrHWC+
   uKwQzJIgPD9nQ8T+M5xt2xo1+18Vnf+wxIoX2rx3JQAqy5zglfEowMDI2
   uDSvNtbAi9fTkD9LYMvcrpjhXZ31DvNz7R3PRvtdgveZI/t3u7dDb7olU
   g==;
X-CSE-ConnectionGUID: QBg8/FLVSAuoFnbxZWjAPQ==
X-CSE-MsgGUID: IXhiRRspS+SCbEit5JzEFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30836602"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="30836602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 12:30:57 -0700
X-CSE-ConnectionGUID: s5hZa4AaTvKh1qN621Uq7Q==
X-CSE-MsgGUID: qSxUhlXkSBq4W6gApEd2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54121842"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2024 12:30:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYsYf-000tGw-1k;
	Tue, 30 Jul 2024 19:30:53 +0000
Date: Wed, 31 Jul 2024 03:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kfence/core.o: warning: objtool: kfence_init_pool+0x230:
 unreachable instruction
Message-ID: <202407310358.q2lBcGvR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94ede2a3e9135764736221c080ac7c0ad993dc2d
commit: 46df8e73a4a3f1445f2a8429111e72ede1f4d291 mm: free up PG_slab
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310358.q2lBcGvR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310358.q2lBcGvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310358.q2lBcGvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kfence/core.o: warning: objtool: kfence_init_pool+0x230: unreachable instruction


objdump-func vmlinux.o kfence_init_pool:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
