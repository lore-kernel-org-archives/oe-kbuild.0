Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E719D8B7
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Oct 2024 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728683267; cv=none; b=IiST1bAlfxbTzk+JZptAhURx/tReoo9Pir3v5gHRsmqPHsa1HmDchG/uPQlsbQ5L/DeGqmr5AdbqyP/3CmZFaoRl0GCM96ggtwCllCZEgnZlLuHuSZ1u+82Ao6AZRdjkMgiybveX2ncBQhQfMz3cb/eWn97Iq+zqQQnjm5nCUpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728683267; c=relaxed/simple;
	bh=BoLNwcylLi3v5NF/tAk6OW+Xx4Rsu+gDO5q+DBKGYZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6ceiLAmq9vDUS2FsOaOYeLCPSxz/kkp+wknIdSjP1IThvQwdJjKMwDiUnxOz1RMc0iIfWgKTd7gwu89MwF/Pm8iuB21VTvRsqIZtg3IKRdL9TwlzkiVPA4BozF7eUDecKnnJ6GvD1NmiXBbSISd6xM+EZCydcg1nnqeCHMy31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeQ8KT5f; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeQ8KT5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728683266; x=1760219266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoLNwcylLi3v5NF/tAk6OW+Xx4Rsu+gDO5q+DBKGYZg=;
  b=MeQ8KT5f/R6Tz5NTxIJmc2lGDmBy4O2owo38lNaGITE9ybmxhLETkT/C
   qpJT4yfd00Hoq7FnMCF6Escq2IOyj0Rb9b5TZm8qie7V0sfBTLV5HNWZ8
   110qDId34RSajTdposUdnS8o0tW4JFNCHHqX/MB1ejFun1bFz9yhuajD1
   Vulo99NfuKGIw8wpIiGCahDW+uszUpJmENB7VY80eL+FMZUC0LC72Ae/J
   BODR7h8F8G2PMGd90Bs+UrMQoHwekBstXcMsxYRBbZDfFOxd4ZO/EhJy2
   NVk0fxEO5SBUQ73ECV6PLsGcyzC4yBCcdLRkPlSbZb6WjkAW4+Bm0ghnF
   w==;
X-CSE-ConnectionGUID: aFS+6C4DQImwX7d0r0e0YQ==
X-CSE-MsgGUID: yVnHwFnsT++0NjoEdbGRug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32002706"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="32002706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 14:47:45 -0700
X-CSE-ConnectionGUID: aFkMQ+vLQO+L6K2IxAY7RQ==
X-CSE-MsgGUID: +HzuUGNvSm2IrlmGtdZ4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76905680"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Oct 2024 14:47:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szNU1-000Cm3-2h;
	Fri, 11 Oct 2024 21:47:37 +0000
Date: Sat, 12 Oct 2024 05:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 08/16] bpf: Handle bpf_dynptr_user in bpf
 syscall when it is used as input
Message-ID: <202410120530.zUoa1scp-lkp@intel.com>
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
In-Reply-To: <20241008091501.8302-9-houtao@huaweicloud.com>
References: <20241008091501.8302-9-houtao@huaweicloud.com>
TO: Hou Tao <houtao@huaweicloud.com>
TO: bpf@vger.kernel.org
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Song Liu <song@kernel.org>
CC: Hao Luo <haoluo@google.com>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: KP Singh <kpsingh@kernel.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Jiri Olsa <jolsa@kernel.org>
CC: John Fastabend <john.fastabend@gmail.com>
CC: houtao1@huawei.com
CC: xukuohai@huawei.com

Hi Hou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-map-flag-BPF_F_DYNPTR_IN_KEY/20241008-171136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241008091501.8302-9-houtao%40huaweicloud.com
patch subject: [PATCH bpf-next 08/16] bpf: Handle bpf_dynptr_user in bpf syscall when it is used as input
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120530.zUoa1scp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410120530.zUoa1scp-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:1557 bpf_copy_from_dynptr_ukey() warn: 'key' is an error pointer or valid

vim +/key +1557 kernel/bpf/syscall.c

b8cdc05173f05d2 Alexei Starovoitov 2016-03-09  1542  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1543  static void *bpf_copy_from_dynptr_ukey(const struct bpf_map *map, bpfptr_t ukey)
e1883aa78ac1fe9 Hou Tao            2024-10-08  1544  {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1545  	const struct btf_record *record;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1546  	const struct btf_field *field;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1547  	struct bpf_dynptr_user *uptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1548  	struct bpf_dynptr_kern *kptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1549  	void *key, *new_key, *kdata;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1550  	unsigned int key_size, size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1551  	bpfptr_t udata;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1552  	unsigned int i;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1553  	int err;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1554  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1555  	key_size = map->key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1556  	key = kvmemdup_bpfptr(ukey, key_size);
e1883aa78ac1fe9 Hou Tao            2024-10-08 @1557  	if (!key)
e1883aa78ac1fe9 Hou Tao            2024-10-08  1558  		return ERR_PTR(-ENOMEM);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1559  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1560  	size = key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1561  	record = map->key_record;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1562  	for (i = 0; i < record->cnt; i++) {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1563  		field = &record->fields[i];
e1883aa78ac1fe9 Hou Tao            2024-10-08  1564  		if (field->type != BPF_DYNPTR)
e1883aa78ac1fe9 Hou Tao            2024-10-08  1565  			continue;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1566  		uptr = key + field->offset;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1567  		if (!uptr->size || uptr->size > map->map_extra || uptr->rsvd) {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1568  			err = -EINVAL;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1569  			goto free_key;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1570  		}
e1883aa78ac1fe9 Hou Tao            2024-10-08  1571  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1572  		size += uptr->size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1573  		/* Overflow ? */
e1883aa78ac1fe9 Hou Tao            2024-10-08  1574  		if (size < uptr->size) {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1575  			err = -E2BIG;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1576  			goto free_key;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1577  		}
e1883aa78ac1fe9 Hou Tao            2024-10-08  1578  	}
e1883aa78ac1fe9 Hou Tao            2024-10-08  1579  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1580  	/* Place all dynptrs' data in the end of the key */
e1883aa78ac1fe9 Hou Tao            2024-10-08  1581  	new_key = kvrealloc(key, size, GFP_USER | __GFP_NOWARN);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1582  	if (!new_key) {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1583  		err = -ENOMEM;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1584  		goto free_key;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1585  	}
e1883aa78ac1fe9 Hou Tao            2024-10-08  1586  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1587  	key = new_key;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1588  	kdata = key + key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1589  	for (i = 0; i < record->cnt; i++) {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1590  		field = &record->fields[i];
e1883aa78ac1fe9 Hou Tao            2024-10-08  1591  		if (field->type != BPF_DYNPTR)
e1883aa78ac1fe9 Hou Tao            2024-10-08  1592  			continue;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1593  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1594  		uptr = key + field->offset;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1595  		size = uptr->size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1596  		udata = make_bpfptr(uptr->data, bpfptr_is_kernel(ukey));
e1883aa78ac1fe9 Hou Tao            2024-10-08  1597  		if (copy_from_bpfptr(kdata, udata, size)) {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1598  			err = -EFAULT;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1599  			goto free_key;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1600  		}
e1883aa78ac1fe9 Hou Tao            2024-10-08  1601  		kptr = (struct bpf_dynptr_kern *)uptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1602  		bpf_dynptr_init(kptr, kdata, BPF_DYNPTR_TYPE_LOCAL, 0, size);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1603  		kdata += size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1604  	}
e1883aa78ac1fe9 Hou Tao            2024-10-08  1605  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1606  	return key;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1607  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1608  free_key:
e1883aa78ac1fe9 Hou Tao            2024-10-08  1609  	kvfree(key);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1610  	return ERR_PTR(err);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1611  }
e1883aa78ac1fe9 Hou Tao            2024-10-08  1612  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
