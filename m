Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6B8BEC
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 03:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806807; cv=none; b=mApLcgGuNygPVV+qSi0yLq3kzkL/0qdnFufsvA/QKcVntRaKO4EwIl5b3LKZaoI5Zq1OZ96BNvRN6sTiHMoNGOvRCmu7Uw413AIHsLlNVhFZ7yJcmC+05sOKfMQ9nReWLgTT2RUioMkmHsm7sokgDpP+J348rgWZe9lKJxnGIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806807; c=relaxed/simple;
	bh=DB/g9kkQwk8hhlXdkzUSJQa1UjRLDfpkZwlUSpbZswM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCv/pJYPeZcd5R4OOvQviwz9TpbrjbmkbZ5ZuUNcIaaqg5WUigqxFXPGN+SngiELy+UT6ntlaHSDZbU7NDAyZn8O0I6Cna3MiMzPaUbzmNZUlA2yYY8uxWc4vAc4fFCHYFhfyQY4BPDBHwr4S13FLbaW/OundTa7JcSZY8AJNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9b7A2hp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9b7A2hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712806805; x=1744342805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DB/g9kkQwk8hhlXdkzUSJQa1UjRLDfpkZwlUSpbZswM=;
  b=m9b7A2hpiS26aV6k2zad5XJuEepCtZbj2UnsN+JL242MHuBvYoA8gGgR
   1ee86t5BG71Dipc+UCy7VWk4xFJZdAYLu7QQzyv2JSQIHdQqXEtMAWeNg
   Yd6IO62QN7v52t9KyDgqn5FquxsiWOzhA/T7LVCn5rLzobj1NuTsL1wUo
   uYQNftUN5Nfww0ZVLWGie6dHfyDCju57f0097+NUgvp8o7JfoLjUmwD3O
   wxslKmXWN/u6hWhFWybnMtuhS9UOHzM1+TB9FtDNNlvMTTiP7lqwLVxoC
   TVKMF17Uf6BIs9ZSaKwq8ZezzBsJCgMTSIA83hx11YQuVWpbyzX6eLK25
   g==;
X-CSE-ConnectionGUID: kNJvbN1HTeWZ0L3IVVZDig==
X-CSE-MsgGUID: lrj3A2xIQkCg4tBxgjFbBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8375822"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8375822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 20:40:04 -0700
X-CSE-ConnectionGUID: ZTYPyMrIT92lEIjmU+l6Cg==
X-CSE-MsgGUID: tTP67xrjSqOrsRde6sVIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20805026"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2024 20:40:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulI9-0008Au-0F;
	Thu, 11 Apr 2024 03:40:01 +0000
Date: Thu, 11 Apr 2024 11:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 05/11] bpf: initialize/free array of
 btf_field(s).
Message-ID: <202404111119.PsGsCBYC-lkp@intel.com>
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
In-Reply-To: <20240410004150.2917641-6-thinker.li@gmail.com>
References: <20240410004150.2917641-6-thinker.li@gmail.com>
TO: "Kui-Feng Lee" <thinker.li@gmail.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: martin.lau@linux.dev
TO: song@kernel.org
TO: kernel-team@meta.com
TO: andrii@kernel.org
CC: sinquersw@gmail.com
CC: kuifeng@meta.com
CC: "Kui-Feng Lee" <thinker.li@gmail.com>

Hi Kui-Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kui-Feng-Lee/bpf-Remove-unnecessary-checks-on-the-offset-of-btf_field/20240410-084331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240410004150.2917641-6-thinker.li%40gmail.com
patch subject: [PATCH bpf-next 05/11] bpf: initialize/free array of btf_field(s).
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111119.PsGsCBYC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404111119.PsGsCBYC-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:701 bpf_obj_free_fields() error: uninitialized symbol 'pointee_struct_meta'.

vim +/pointee_struct_meta +701 kernel/bpf/syscall.c

db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  661  
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  662  void bpf_obj_free_fields(const struct btf_record *rec, void *obj)
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  663  {
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  664  	const struct btf_field *fields;
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  665  	int i;
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  666  
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  667  	if (IS_ERR_OR_NULL(rec))
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  668  		return;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  669  	fields = rec->fields;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  670  	for (i = 0; i < rec->cnt; i++) {
c8e18754091479 Dave Marchevsky         2023-03-10  671  		struct btf_struct_meta *pointee_struct_meta;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  672  		const struct btf_field *field = &fields[i];
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  673  		void *field_ptr = obj + field->offset;
c8e18754091479 Dave Marchevsky         2023-03-10  674  		void *xchgd_field;
67ca0738d58c2f Kui-Feng Lee            2024-04-09  675  		u32 elem_size = field->size / field->nelems;
67ca0738d58c2f Kui-Feng Lee            2024-04-09  676  		int j;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  677  
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  678  		switch (fields[i].type) {
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  679  		case BPF_SPIN_LOCK:
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  680  			break;
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  681  		case BPF_TIMER:
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  682  			bpf_timer_cancel_and_free(field_ptr);
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  683  			break;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  684  		case BPF_KPTR_UNREF:
67ca0738d58c2f Kui-Feng Lee            2024-04-09  685  			for (j = 0; j < field->nelems; j++, field_ptr += elem_size)
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  686  				WRITE_ONCE(*(u64 *)field_ptr, 0);
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  687  			break;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  688  		case BPF_KPTR_REF:
55db92f42fe4a4 Yonghong Song           2023-08-27  689  		case BPF_KPTR_PERCPU:
67ca0738d58c2f Kui-Feng Lee            2024-04-09  690  			if (!btf_is_kernel(field->kptr.btf))
67ca0738d58c2f Kui-Feng Lee            2024-04-09  691  				pointee_struct_meta = btf_find_struct_meta(field->kptr.btf,
67ca0738d58c2f Kui-Feng Lee            2024-04-09  692  									   field->kptr.btf_id);
67ca0738d58c2f Kui-Feng Lee            2024-04-09  693  
67ca0738d58c2f Kui-Feng Lee            2024-04-09  694  			for (j = 0; j < field->nelems; j++, field_ptr += elem_size) {
c8e18754091479 Dave Marchevsky         2023-03-10  695  				xchgd_field = (void *)xchg((unsigned long *)field_ptr, 0);
1431d0b584a673 David Vernet            2023-03-25  696  				if (!xchgd_field)
67ca0738d58c2f Kui-Feng Lee            2024-04-09  697  					continue;
1431d0b584a673 David Vernet            2023-03-25  698  
c8e18754091479 Dave Marchevsky         2023-03-10  699  				if (!btf_is_kernel(field->kptr.btf)) {
9e36a204bd4355 Dave Marchevsky         2023-03-13  700  					migrate_disable();
9e36a204bd4355 Dave Marchevsky         2023-03-13 @701  					__bpf_obj_drop_impl(xchgd_field, pointee_struct_meta ?
e383a459023373 Hou Tao                 2023-10-20  702  							    pointee_struct_meta->record : NULL,
e383a459023373 Hou Tao                 2023-10-20  703  							    fields[i].type == BPF_KPTR_PERCPU);
9e36a204bd4355 Dave Marchevsky         2023-03-13  704  					migrate_enable();
c8e18754091479 Dave Marchevsky         2023-03-10  705  				} else {
c8e18754091479 Dave Marchevsky         2023-03-10  706  					field->kptr.dtor(xchgd_field);
c8e18754091479 Dave Marchevsky         2023-03-10  707  				}
67ca0738d58c2f Kui-Feng Lee            2024-04-09  708  			}
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  709  			break;
f0c5941ff5b255 Kumar Kartikeya Dwivedi 2022-11-15  710  		case BPF_LIST_HEAD:
f0c5941ff5b255 Kumar Kartikeya Dwivedi 2022-11-15  711  			if (WARN_ON_ONCE(rec->spin_lock_off < 0))
f0c5941ff5b255 Kumar Kartikeya Dwivedi 2022-11-15  712  				continue;
67ca0738d58c2f Kui-Feng Lee            2024-04-09  713  			for (j = 0; j < field->nelems; j++, field_ptr += elem_size)
f0c5941ff5b255 Kumar Kartikeya Dwivedi 2022-11-15  714  				bpf_list_head_free(field, field_ptr, obj + rec->spin_lock_off);
f0c5941ff5b255 Kumar Kartikeya Dwivedi 2022-11-15  715  			break;
9c395c1b99bd23 Dave Marchevsky         2023-02-13  716  		case BPF_RB_ROOT:
9c395c1b99bd23 Dave Marchevsky         2023-02-13  717  			if (WARN_ON_ONCE(rec->spin_lock_off < 0))
9c395c1b99bd23 Dave Marchevsky         2023-02-13  718  				continue;
67ca0738d58c2f Kui-Feng Lee            2024-04-09  719  			for (j = 0; j < field->nelems; j++, field_ptr += elem_size)
9c395c1b99bd23 Dave Marchevsky         2023-02-13  720  				bpf_rb_root_free(field, field_ptr, obj + rec->spin_lock_off);
9c395c1b99bd23 Dave Marchevsky         2023-02-13  721  			break;
8ffa5cc142137a Kumar Kartikeya Dwivedi 2022-11-18  722  		case BPF_LIST_NODE:
9c395c1b99bd23 Dave Marchevsky         2023-02-13  723  		case BPF_RB_NODE:
d54730b50bae1f Dave Marchevsky         2023-04-15  724  		case BPF_REFCOUNT:
8ffa5cc142137a Kumar Kartikeya Dwivedi 2022-11-18  725  			break;
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  726  		default:
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  727  			WARN_ON_ONCE(1);
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  728  			continue;
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  729  		}
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  730  	}
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  731  }
14a324f6a67ef6 Kumar Kartikeya Dwivedi 2022-04-25  732  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
