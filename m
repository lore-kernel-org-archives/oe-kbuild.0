Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CCA314A86
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745410; cv=none; b=Aix1vhZZwY9//Ln50mXdHVzXve60qC8cjIfdFJ0AHKWtZ6oWHYZcf2moE8HxC9wJ7FAf9ADM9eAA9Jys7rMQ9PqjXcJHM6miujFG0WhHjHtVGLZKrfDW3G7uHvHo+VDLssGvoG53FBgZD/FYeQm3YjJ9VuqAp6xqnjLNj/LJaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745410; c=relaxed/simple;
	bh=973mJ4yu5awCXBMe0gSc8sELXqXnmoLZiGcUitJOg04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fCUVXFrRBM5PXAdCIvbMwlZVCQ19YfpPIkU9mwcPwl1nPglZwAfgTmWXWZLXpaFs9fNHNIVVn0naakczJdwV6T9LiBD6G+UeVJMKqM4roR//sZJElY3R8Ew3MHBpIuCgs6+sPMHqEQkOl3dxnFidAGqSVdzhGwqLvnCKWP86uGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy3nDRyX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy3nDRyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791745407; x=1823281407;
  h=date:from:to:cc:subject:message-id;
  bh=973mJ4yu5awCXBMe0gSc8sELXqXnmoLZiGcUitJOg04=;
  b=Jy3nDRyXTDVDRoVC46l/cTzk4ymuGeOMXPPZNeF3CPi1JN9098+sXw+D
   XuU7Ugsx8+XFt3+JIB2b1JRW+P7cJy9xiPRtF3+++R0dyCv0Kuec8MRbq
   INdNK5OdxQYkUvGIKhNITORMF3WH5ZsNVRzDwEYa6To/8zu3yoTz9zo00
   D6cKefIQDoMVP30CQj83HHbRY6Hz3wFm64P9M6v5YjKhIVuK08FIydZJv
   TWTxjhGJeBlWolKKTJThvUF+weeRKO8+f4CepEhXE1P49m4D6vfq3kdUC
   HNPvVzVIukNRvlV1qJJ9NQRrEs4pe1doMogV5t4Hsc/LjT7sl/hIh0Fjm
   w==;
X-CSE-ConnectionGUID: NbqIZ0fbR2+CzqejGqcGcg==
X-CSE-MsgGUID: Wmg4XuVZTfCb3Nhr5EU5Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="571729"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="571729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 12:03:26 -0700
X-CSE-ConnectionGUID: CFt6zgNoQsWqQQR8aYpUJQ==
X-CSE-MsgGUID: 80xjvVRxRlWO5kKW58qQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1054353"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2026 12:03:25 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFypO-000000009d1-3Y8l;
	Sun, 11 Oct 2026 19:03:22 +0000
Date: Sun, 11 Oct 2026 21:03:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bpf-next:master 17/22] kernel/bpf/btf.c:9210:13-14: WARNING
 vmalloc is used to allocate this memory at line 9203
Message-ID: <202610112000.HIisW2Wx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alan Maguire <alan.maguire@oracle.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   ac1dff2daebb04816766106740042e7ad92859dd
commit: 672981f4aec1d0131761aec60298312464bd7a50 [17/22] kbuild, btf: Expose vmlinux inline BTF through sysfs
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: m68k-randconfig-r2102-20261011 (https://download.01.org/0day-ci/archive/20261011/202610112000.HIisW2Wx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610112000.HIisW2Wx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/btf.c:9210:13-14: WARNING vmalloc is used to allocate this memory at line 9203

vim +9210 kernel/bpf/btf.c

672981f4aec1d0 Alan Maguire 2026-10-09  9194  
672981f4aec1d0 Alan Maguire 2026-10-09  9195  static int btf_module_handle_vmlinux_inline(const struct module *mod)
672981f4aec1d0 Alan Maguire 2026-10-09  9196  {
672981f4aec1d0 Alan Maguire 2026-10-09  9197  	void *data;
672981f4aec1d0 Alan Maguire 2026-10-09  9198  
672981f4aec1d0 Alan Maguire 2026-10-09  9199  	if (!mod->btf_inline_data ||
672981f4aec1d0 Alan Maguire 2026-10-09  9200  	    mod->btf_inline_data_size != vmlinux_inline_link->btf_size)
672981f4aec1d0 Alan Maguire 2026-10-09  9201  		return -EINVAL;
672981f4aec1d0 Alan Maguire 2026-10-09  9202  
672981f4aec1d0 Alan Maguire 2026-10-09 @9203  	data = vmalloc_user(mod->btf_inline_data_size);
672981f4aec1d0 Alan Maguire 2026-10-09  9204  	if (!data)
672981f4aec1d0 Alan Maguire 2026-10-09  9205  		return -ENOMEM;
672981f4aec1d0 Alan Maguire 2026-10-09  9206  	memcpy(data, mod->btf_inline_data, mod->btf_inline_data_size);
672981f4aec1d0 Alan Maguire 2026-10-09  9207  
672981f4aec1d0 Alan Maguire 2026-10-09  9208  	if (!btf_verify_link(vmlinux_inline_link, mod, data, mod->btf_inline_data_size) ||
672981f4aec1d0 Alan Maguire 2026-10-09  9209  	    !sysfs_btf_update(vmlinux_inline_attr, data)) {
672981f4aec1d0 Alan Maguire 2026-10-09 @9210  		kvfree(data);
672981f4aec1d0 Alan Maguire 2026-10-09  9211  		return -EINVAL;
672981f4aec1d0 Alan Maguire 2026-10-09  9212  	}
672981f4aec1d0 Alan Maguire 2026-10-09  9213  	return 0;
672981f4aec1d0 Alan Maguire 2026-10-09  9214  }
672981f4aec1d0 Alan Maguire 2026-10-09  9215  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
