Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9EC2C1586
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 04:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761710650; cv=none; b=bGNYP9V5Q7JGzSWixOqVFY1pFjbmUlURhcQa3ZJU47Q4TxWkqnfyEWnp3peFae5qgMAUt1ocZaJy45VnmWCprIQjT0yX8727z9U5OaBP8WHlQ3NNsaGOQ24oGG49lwC7QzG2tKrZGUWIp9UL/soMAtJ/FOcGb9qExFEvdkN6wfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761710650; c=relaxed/simple;
	bh=N97q5rPzEONiFHJQ/H4FJ14pIEp6hyMx8tv/eTdagC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQa2PJ4/WnzsXNhSuLOwm+QyBtnqIB9zObCLIv/6CFtnt0EAPERvExVBozZqY1LsKGHs6mSUqzYC4Y1m+eQZyxn1dJkWGWKl41iwlFHAL95264tAua/krxhp2QVHlD9liVv5Plda57uRReL+LfuhAZ5ei0yueHpNny5oMGsFJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeLARSAJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeLARSAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761710649; x=1793246649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N97q5rPzEONiFHJQ/H4FJ14pIEp6hyMx8tv/eTdagC0=;
  b=HeLARSAJbVp9A294689vgrCrGy0+Kmnm9WtVwqkRlJXz54s+YYWYsSqX
   JFfmLSxRscbuJnVMbfbrEyTsxM0MnS+YW6s9ZmgnrP4azjpmCIuc4nXTb
   AzistUmzrAwVe/OvPF89xnou6PDwNQGF6Jqz8hKFsXI3dn8gFTVvPMjZ6
   metxZQzi/ArxBaI/8gFeoig6/Is7WVbKQAIsXO45TlMNDzGShsGTwf9V6
   uwNHM+9NHltDzWEeE2nT3dWWgQHKALzffGAtUWNHdx5rshYAsZAhMFMfx
   EEyoKe1CmckhBD7zmfquivThRyHXM82dpdBeaHhR8UtknsiNkxmvTJmwm
   g==;
X-CSE-ConnectionGUID: /hxjL6uuS528u3V/zLB/ww==
X-CSE-MsgGUID: jJGT+qrbQZiYk5DbuKdAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75270263"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="75270263"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:03:31 -0700
X-CSE-ConnectionGUID: xx8TscgvTwqRG70NtoHT6g==
X-CSE-MsgGUID: RUnUlC8RRZm1jfp/gjcnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185458570"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2025 21:03:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDxOm-000K7n-2G;
	Wed, 29 Oct 2025 04:03:08 +0000
Date: Wed, 29 Oct 2025 12:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [martin-lau-bpf-next:ls.rqspin.v2.2 3/3]
 kernel/bpf/bpf_local_storage.c:823 bpf_local_storage_destroy() error: we
 previously assumed 'smap' could be null (see line 797)
Message-ID: <202510291106.zV0JWnRE-lkp@intel.com>
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
CC: Martin KaFai Lau <martin.lau@linux.dev>
TO: Martin KaFai Lau <martin.lau@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git ls.rqspin.v2.2
head:   b735af227349c9ef167cae8acf8bc8864e13f636
commit: b735af227349c9ef167cae8acf8bc8864e13f636 [3/3] [DONT PUSH]
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-r072-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291106.zV0JWnRE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510291106.zV0JWnRE-lkp@intel.com/

smatch warnings:
kernel/bpf/bpf_local_storage.c:823 bpf_local_storage_destroy() error: we previously assumed 'smap' could be null (see line 797)

vim +/smap +823 kernel/bpf/bpf_local_storage.c

b735af227349c9 Martin KaFai Lau 2025-10-22  766  
b735af227349c9 Martin KaFai Lau 2025-10-22  767  u32 bpf_local_storage_destroy(struct bpf_local_storage *local_storage)
c83597fa5dc6b3 Yonghong Song    2022-10-25  768  {
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  769  	struct bpf_local_storage_map *storage_smap;
c83597fa5dc6b3 Yonghong Song    2022-10-25  770  	struct bpf_local_storage_elem *selem;
b735af227349c9 Martin KaFai Lau 2025-10-22  771  	unsigned long b_flags, l_flags;
5bd5bab76669b1 Martin KaFai Lau 2024-10-23  772  	HLIST_HEAD(free_selem_list);
b735af227349c9 Martin KaFai Lau 2025-10-22  773  	HLIST_HEAD(free_only_list);
c83597fa5dc6b3 Yonghong Song    2022-10-25  774  	struct hlist_node *n;
b735af227349c9 Martin KaFai Lau 2025-10-22  775  	u32 uncharge = 0;
c83597fa5dc6b3 Yonghong Song    2022-10-25  776  
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  777  	storage_smap = rcu_dereference_check(local_storage->smap, bpf_rcu_lock_held());
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  778  
c83597fa5dc6b3 Yonghong Song    2022-10-25  779  	/* Neither the bpf_prog nor the bpf_map's syscall
c83597fa5dc6b3 Yonghong Song    2022-10-25  780  	 * could be modifying the local_storage->list now.
c83597fa5dc6b3 Yonghong Song    2022-10-25  781  	 * Thus, no elem can be added to or deleted from the
c83597fa5dc6b3 Yonghong Song    2022-10-25  782  	 * local_storage->list by the bpf_prog or by the bpf_map's syscall.
c83597fa5dc6b3 Yonghong Song    2022-10-25  783  	 *
c83597fa5dc6b3 Yonghong Song    2022-10-25  784  	 * It is racing with bpf_local_storage_map_free() alone
c83597fa5dc6b3 Yonghong Song    2022-10-25  785  	 * when unlinking elem from the local_storage->list and
c83597fa5dc6b3 Yonghong Song    2022-10-25  786  	 * the map's bucket->list.
c83597fa5dc6b3 Yonghong Song    2022-10-25  787  	 */
b735af227349c9 Martin KaFai Lau 2025-10-22  788  
b735af227349c9 Martin KaFai Lau 2025-10-22  789  	/* local_storage->lock must succeed. No bpf prog uses this lock now.k */
b735af227349c9 Martin KaFai Lau 2025-10-22  790  	raw_res_spin_lock_irqsave(&local_storage->lock, l_flags);
c83597fa5dc6b3 Yonghong Song    2022-10-25  791  	hlist_for_each_entry_safe(selem, n, &local_storage->list, snode) {
b735af227349c9 Martin KaFai Lau 2025-10-22  792  		struct bpf_local_storage_map_bucket *b;
b735af227349c9 Martin KaFai Lau 2025-10-22  793  		struct bpf_local_storage_map *smap;
b735af227349c9 Martin KaFai Lau 2025-10-22  794  		long unlink_state;
b735af227349c9 Martin KaFai Lau 2025-10-22  795  
b735af227349c9 Martin KaFai Lau 2025-10-22  796  		smap = rcu_dereference(SDATA(selem)->smap);
b735af227349c9 Martin KaFai Lau 2025-10-22 @797  		b = smap ? select_bucket(smap, local_storage) : NULL;
b735af227349c9 Martin KaFai Lau 2025-10-22  798  		if (b && !raw_res_spin_lock_irqsave(&b->lock, b_flags)) {
b735af227349c9 Martin KaFai Lau 2025-10-22  799  			if (selem_linked_to_map(selem)) {
b735af227349c9 Martin KaFai Lau 2025-10-22  800  				bpf_selem_unlink_map_nolock(selem);
b735af227349c9 Martin KaFai Lau 2025-10-22  801  				bpf_selem_unlink_storage_nolock(local_storage, selem, true, &free_selem_list);
b735af227349c9 Martin KaFai Lau 2025-10-22  802  				raw_res_spin_unlock_irqrestore(&b->lock, b_flags);
b735af227349c9 Martin KaFai Lau 2025-10-22  803  				continue;
c83597fa5dc6b3 Yonghong Song    2022-10-25  804  			}
b735af227349c9 Martin KaFai Lau 2025-10-22  805  			raw_res_spin_unlock_irqrestore(&b->lock, b_flags);
b735af227349c9 Martin KaFai Lau 2025-10-22  806  		}
b735af227349c9 Martin KaFai Lau 2025-10-22  807  
b735af227349c9 Martin KaFai Lau 2025-10-22  808  		/* Failed to unlink selem->map_node. */
b735af227349c9 Martin KaFai Lau 2025-10-22  809  		hlist_del_init_rcu(&selem->snode);
b735af227349c9 Martin KaFai Lau 2025-10-22  810  		RCU_INIT_POINTER(selem->local_storage, NULL);
b735af227349c9 Martin KaFai Lau 2025-10-22  811  		uncharge += selem->uncharge;
b735af227349c9 Martin KaFai Lau 2025-10-22  812  		if (hlist_empty(&local_storage->list)) {
b735af227349c9 Martin KaFai Lau 2025-10-22  813  			local_storage->owner = NULL; /* TODO: not needed? */
b735af227349c9 Martin KaFai Lau 2025-10-22  814  			RCU_INIT_POINTER(*local_storage->owner_storage_ptr, NULL);
b735af227349c9 Martin KaFai Lau 2025-10-22  815  			uncharge += sizeof(*local_storage);
b735af227349c9 Martin KaFai Lau 2025-10-22  816  		}
b735af227349c9 Martin KaFai Lau 2025-10-22  817  
b735af227349c9 Martin KaFai Lau 2025-10-22  818  		unlink_state = cmpxchg(&selem->unlink_state, BPF_LS_UNLINK_NONE,
b735af227349c9 Martin KaFai Lau 2025-10-22  819  				       BPF_LS_UNLINK_STORAGE);
b735af227349c9 Martin KaFai Lau 2025-10-22  820  		switch (unlink_state) {
b735af227349c9 Martin KaFai Lau 2025-10-22  821  		case BPF_LS_UNLINK_NONE:
b735af227349c9 Martin KaFai Lau 2025-10-22  822  			/* selem is protected by rcu now */
b735af227349c9 Martin KaFai Lau 2025-10-22 @823  			bpf_obj_free_fields(smap->map.record, SDATA(selem)->data);
b735af227349c9 Martin KaFai Lau 2025-10-22  824  			break;
b735af227349c9 Martin KaFai Lau 2025-10-22  825  		case BPF_LS_UNLINK_MAP:
b735af227349c9 Martin KaFai Lau 2025-10-22  826  			/* we own the selem, free it. */
b735af227349c9 Martin KaFai Lau 2025-10-22  827  			hlist_add_head(&selem->free_node, &free_only_list);
b735af227349c9 Martin KaFai Lau 2025-10-22  828  			break;
b735af227349c9 Martin KaFai Lau 2025-10-22  829  		default:
b735af227349c9 Martin KaFai Lau 2025-10-22  830  			WARN_ON_ONCE(1);
b735af227349c9 Martin KaFai Lau 2025-10-22  831  		}
b735af227349c9 Martin KaFai Lau 2025-10-22  832  	}
b735af227349c9 Martin KaFai Lau 2025-10-22  833  	raw_res_spin_unlock_irqrestore(&local_storage->lock, l_flags);
c83597fa5dc6b3 Yonghong Song    2022-10-25  834  
5bd5bab76669b1 Martin KaFai Lau 2024-10-23  835  	bpf_selem_free_list(&free_selem_list, true);
5bd5bab76669b1 Martin KaFai Lau 2024-10-23  836  
b735af227349c9 Martin KaFai Lau 2025-10-22  837  	hlist_for_each_entry_safe(selem, n, &free_only_list, free_node) {
b735af227349c9 Martin KaFai Lau 2025-10-22  838  		/*
b735af227349c9 Martin KaFai Lau 2025-10-22  839  		 * Need to go through a rcu gp:
b735af227349c9 Martin KaFai Lau 2025-10-22  840  		 *
b735af227349c9 Martin KaFai Lau 2025-10-22  841  		 * 1) The tcp_sock is in SLAB_TYPESAFE_BY_RCU, so need
b735af227349c9 Martin KaFai Lau 2025-10-22  842  		 *    to free after a rcu gp.
b735af227349c9 Martin KaFai Lau 2025-10-22  843  		 *
b735af227349c9 Martin KaFai Lau 2025-10-22  844  		 * 2) There is still rcu reader in map_free.
b735af227349c9 Martin KaFai Lau 2025-10-22  845  		 */
b735af227349c9 Martin KaFai Lau 2025-10-22  846  		if (local_storage->bpf_ma)
b735af227349c9 Martin KaFai Lau 2025-10-22  847  			call_rcu(&selem->rcu, bpf_selem_free_ma_rcu);
b735af227349c9 Martin KaFai Lau 2025-10-22  848  		else
b735af227349c9 Martin KaFai Lau 2025-10-22  849  			kfree_rcu(selem, rcu);
b735af227349c9 Martin KaFai Lau 2025-10-22  850  	}
b735af227349c9 Martin KaFai Lau 2025-10-22  851  
b735af227349c9 Martin KaFai Lau 2025-10-22  852  	/* TODO: think about local_storage get reused immediately in bpf_mem_alloc */
b735af227349c9 Martin KaFai Lau 2025-10-22  853  	bpf_local_storage_free(local_storage, storage_smap, true);
b735af227349c9 Martin KaFai Lau 2025-10-22  854  
b735af227349c9 Martin KaFai Lau 2025-10-22  855  	return uncharge;
c83597fa5dc6b3 Yonghong Song    2022-10-25  856  }
c83597fa5dc6b3 Yonghong Song    2022-10-25  857  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
