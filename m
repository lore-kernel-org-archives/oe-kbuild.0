Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41767446C1B
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Sep 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772276; cv=none; b=K5M9dLvwuQ/9hTJfbPZ8Kh0D+T/uNrB75rUc/cxrhtBs4uh8qjZUQCI3/Ikn+iTKwBXm4I3Abct8ba7iMbiYY/6P3lDe0cuxu602IErurMjxOXH29tO+uB6qpMq/QmRDwgknD6ApfeIEwfMYVNbraYYvPAxGaS3UEAoJ1+NSXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772276; c=relaxed/simple;
	bh=aEbS23BcefxqrAog/gQa9zDiBYWa0y6Ys7LPAi7QSUY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P3uxZs2Xsgbj28e+l0M+SpFd9jFIFHaSXz+Xn2GUN4dEL9dFzoYO2K9OGg0i6q+FNGqPGOF+MqAsix7jrjYqBiuwIvT2VjIPMCGUm10EMs62ZYZGI5+SKAcdLi/FhVn/H0XB4e+mPzJUCfMAVRsKg74CJS7i7F3ONH9c6Ms79dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km8JevPg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km8JevPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788772274; x=1820308274;
  h=date:from:to:cc:subject:message-id;
  bh=aEbS23BcefxqrAog/gQa9zDiBYWa0y6Ys7LPAi7QSUY=;
  b=Km8JevPgf0KpSfUCvkEo1UCe9NSyaLr9dd4ebaRS/nkqg5I2WmlcvDBG
   CX8oxiLTG3r22JE/najeIN4dOmd2ZaTr3MitvRJUsmmtYYpw2KQB5zmAv
   Xd0OIzSkfYL+ue7lhh2acoB9fnFtfO9vyfPiiykIENF9o0did5GqtGO18
   TKz4PO5s3urKqTfXCBusT8XspwJKGBIUgTic/5jHYpQU7WYRIpDERSZe/
   CPP75DEsmScVM8K/nvaQGbGHfoqWJcDvUa6xtno7OBM8P/2jw0s1w73Px
   3HqVYEOU0U0sG58Rv0fvTt5oGuTIJJg8RSgcfTm9pJv+4/HKw0Id+rhnY
   A==;
X-CSE-ConnectionGUID: 0mhR6QiaQEWpsTpHCZU9OA==
X-CSE-MsgGUID: V4g9gbK7QOWX5TpPCOsVUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106541049"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="106541049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:11:13 -0700
X-CSE-ConnectionGUID: 1/Nw6YXATeSTCBUrt6HWxg==
X-CSE-MsgGUID: kv1yk8zNQVOvPBwo8mlM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="267411584"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Sep 2026 02:11:12 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3VNe-000000000BS-14rR;
	Mon, 07 Sep 2026 09:11:10 +0000
Date: Mon, 07 Sep 2026 11:11:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/btf.c:8758:(.text+0x184bc): dangerous relocation:
 unsupported relocation
Message-ID: <202609071137.v1e0SkZx-lkp@intel.com>
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
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071137.v1e0SkZx-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071137.v1e0SkZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071137.v1e0SkZx-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-gnu-ld: kernel/bpf/btf.o: in function `sysfs_btf_add':
   kernel/bpf/btf.c:8758:(.text+0x184bc): undefined reference to `btf_kobj'
   aarch64-linux-gnu-ld: kernel/bpf/btf.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `btf_kobj' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> kernel/bpf/btf.c:8758:(.text+0x184bc): dangerous relocation: unsupported relocation
>> aarch64-linux-gnu-ld: kernel/bpf/btf.c:8758:(.text+0x184c4): undefined reference to `btf_kobj'


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
