Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CFA3803EB
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Sep 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772936; cv=none; b=Rkjk9azUgEiiOqcvI1gFxnMhWMhD0rHBH4THd810uKu+y7cvlYtPHECUtoZ0rLfp0KCuuqTGojxfaQA0PHG21p2pEOm/s06eR9CAWbtoPIYNvSQMVpUUQC1lFhFWAqDGmH6NbVdkWuJnPLPGXhTxfUfAWKIqM8S16NxVog8yvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772936; c=relaxed/simple;
	bh=o7XLs/9pFQ/D3Mc/Xy7qURmIlVuQvfdcTv+yqd6f/sI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3RnBcRCK/vlRIHwEeBL/f4XKW1SjaAXSllQRkcJxl4p/stAcIIG3GhqMk6CMfOdycEhefEJiJOKE60FmEcW1rZR8Tyl1g9esQZd+axsPGKHG0/U81dLXdMt/phL8qFH1HoOeV1YcRMr2FIvtlXwnVsMSFO6CRQbQ0Z8VzHCCgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhgwMomw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhgwMomw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788772934; x=1820308934;
  h=date:from:to:cc:subject:message-id;
  bh=o7XLs/9pFQ/D3Mc/Xy7qURmIlVuQvfdcTv+yqd6f/sI=;
  b=mhgwMomwPHVM9sIgT19396nqYltz3/vDxB9/ZLEKTDLeHCc/OqNQ3O6M
   UbHa5dvtkT/mDeH5du0WC+f8Rc3tfP//wc0Zw7qhn4Uqfq2DrijBWeO86
   XVbcfPWFryMGNeP3iwo0JPmZljzvSzxJBGB+2vNKIulsUNcTTrgBv7sqr
   NsrduZsg7Cf4lL8f/Q+tOjQ+BBHT3J7KtzdDJI/+JT3WbxqdxVZ81QZ8G
   7CEmpx9Sli1Q1mQJeWQF1ExOoBdRVyRbQ/Cz9VpGq9Zj4KxCE7Cw0sAAB
   RWxhz6CyzQHAyzngksUaJPkXNKetzuaLFelgYDkBTzJ3knKEvuohq8n5R
   A==;
X-CSE-ConnectionGUID: /yyGn12PSsSS/QTk4w5GCA==
X-CSE-MsgGUID: +6UccrHjSxW7ATTl863hpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92875162"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="92875162"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:22:13 -0700
X-CSE-ConnectionGUID: ui1el6UnS/SfrhlLxriEog==
X-CSE-MsgGUID: a+nZmySQQU2BlKyZkXShFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="272591919"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2026 02:22:12 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3VYI-000000000Be-1v4R;
	Mon, 07 Sep 2026 09:22:10 +0000
Date: Mon, 07 Sep 2026 11:21:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/btf.c:8758:undefined reference to `btf_kobj'
Message-ID: <202609071155.KwITLv3v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alan Maguire <alan.maguire@oracle.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/btf-Extend-UAPI-to-support-BTF-location-inline-site-info/20260901-175740
head:   9e05e3a3098276adea1e7277934c60598cde310e
commit: ef28548058e47e9c824316fe339f88dfd00c35aa btf: Make vmlinux, module inline info available in /sys/kernel/btf
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071155.KwITLv3v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071155.KwITLv3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071155.KwITLv3v-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/btf.o: in function `sysfs_btf_add':
>> kernel/bpf/btf.c:8758:(.text+0x10363): undefined reference to `btf_kobj'


vim +8758 kernel/bpf/btf.c

18688de203b47e5 Kumar Kartikeya Dwivedi 2022-01-14  8737  
ef28548058e47e9 Alan Maguire            2026-09-01  8738  #if IS_ENABLED(CONFIG_SYSFS)
ef28548058e47e9 Alan Maguire            2026-09-01  8739  struct bin_attribute *sysfs_btf_add(const char *name, void *data, size_t data_size)
ef28548058e47e9 Alan Maguire            2026-09-01  8740  {
ef28548058e47e9 Alan Maguire            2026-09-01  8741  	struct bin_attribute *attr;
ef28548058e47e9 Alan Maguire            2026-09-01  8742  	int err;
ef28548058e47e9 Alan Maguire            2026-09-01  8743  
ef28548058e47e9 Alan Maguire            2026-09-01  8744  	attr = kzalloc_obj(*attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8745  	if (!attr)
ef28548058e47e9 Alan Maguire            2026-09-01  8746  		return ERR_PTR(-ENOMEM);
ef28548058e47e9 Alan Maguire            2026-09-01  8747  
ef28548058e47e9 Alan Maguire            2026-09-01  8748  	sysfs_bin_attr_init(attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8749  	attr->attr.mode = 0444;
ef28548058e47e9 Alan Maguire            2026-09-01  8750  	attr->size = data_size;
ef28548058e47e9 Alan Maguire            2026-09-01  8751  	attr->private = data;
ef28548058e47e9 Alan Maguire            2026-09-01  8752  	attr->read = sysfs_bin_attr_simple_read;
ef28548058e47e9 Alan Maguire            2026-09-01  8753  	attr->attr.name = kstrdup(name, GFP_KERNEL);
ef28548058e47e9 Alan Maguire            2026-09-01  8754  	if (!attr->attr.name) {
ef28548058e47e9 Alan Maguire            2026-09-01  8755  		err = -ENOMEM;
ef28548058e47e9 Alan Maguire            2026-09-01  8756  		goto err_free;
ef28548058e47e9 Alan Maguire            2026-09-01  8757  	}
ef28548058e47e9 Alan Maguire            2026-09-01 @8758  	err = sysfs_create_bin_file(btf_kobj, attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8759  	if (err) {
ef28548058e47e9 Alan Maguire            2026-09-01  8760  		pr_warn("failed to register [%s] BTF in sysfs: %d\n", name, err);
ef28548058e47e9 Alan Maguire            2026-09-01  8761  		goto err_free;
ef28548058e47e9 Alan Maguire            2026-09-01  8762  	}
ef28548058e47e9 Alan Maguire            2026-09-01  8763  	return attr;
ef28548058e47e9 Alan Maguire            2026-09-01  8764  
ef28548058e47e9 Alan Maguire            2026-09-01  8765  err_free:
ef28548058e47e9 Alan Maguire            2026-09-01  8766  	kfree(attr->attr.name);
ef28548058e47e9 Alan Maguire            2026-09-01  8767  	kfree(attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8768  	return ERR_PTR(err);
ef28548058e47e9 Alan Maguire            2026-09-01  8769  }
ef28548058e47e9 Alan Maguire            2026-09-01  8770  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
