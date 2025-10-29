Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA1311C06
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725058; cv=none; b=AHEw/X6407nwKdEUeAa0YOkiaj/1/hkUITOc5Re3r2vguXfr+hLEvhzMxdxsnevyirpiME1PvSJw4qprZCMoVlckf84mhImo6+L9+vQzpg6MxdkZSbOrcJ71G5LDQW0vC+0HDb5G6JIaaq8aWdbpxN1qRkwFvhoUOSyM2BIOqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725058; c=relaxed/simple;
	bh=uzp1EYWHHmoW4L3kvoI4dvKuDc5BuLLdmJ8t7j9RfJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VG6Axh8GlUsbs3nml8YRzIokSSk89a7k8Dqjc6ezyh8Na+TseqU2GwOpu9T/zojk0ftAwv1wXdu2x7ktzkXST/ysZDYpWnvqp0Iesn3N9zHdOfTHKX+/JhgO9gcnJE6Dr/EDpKBMXgRxGluycoyjHg9HUaJm/42wqninUhve0iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5yb3ANJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5yb3ANJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso16052455e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761725054; x=1762329854; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeET84ZbR5071Nlo4HqVWkKz0PRLXYvBE0ZTUa7ML/M=;
        b=F5yb3ANJAfdHJXiVziJF1YSHloJJqwEXzzVsX+fw4URZ+gxMXYyx42tgn3hccybH20
         CJgGwkLC1w36Tho+f9Dlhrh0ob0Nv1gornul35XQqaLVVKl2nHzBH9Q7U+Di7j/34ure
         1A/mSAhCxc+jR28XtPnYehXW3axQcs4JFjo1jtYEMMeCNVMJ5vz3ZR6BUMx8xnS77K68
         vByqZqZnZG/n7r32g3cgqTrT6irLKift42FM7hjhooi/Q7df3MAIRC2uYiduDb+c355D
         cBXTZI667ykpTGUdGre4J7MD7xw4JzLUX9x7LcCZkM5rhgoPdiGzn2kUYrXhaRys0ZnD
         5GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725054; x=1762329854;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeET84ZbR5071Nlo4HqVWkKz0PRLXYvBE0ZTUa7ML/M=;
        b=BqmPCxQ7Lpj6MHkTNYiD1m/sRD95/TIbY4jtCpciy7XYMX4mWIuw6iEb3W8rWhas9e
         rVduhQdts2XAc9dWkHyipbRbL1tNf4XXLiwzSSfo5/CfvZj07s8YhFwoOYCTstVfarjA
         kzeitoN4sxohoXuwPgsTx+JVw8gffNZ5W+1zSrf24/xoq9+I1nSBmjtIWqbjMFCiy53D
         a/jRo6836uAW2FhMaQtlEh0kceMzrRxUhq7+GyuDDWC3W7FNQyc8N9Yk2Ubx2uaum/8f
         Nc6PjqFYKj/vS87GNGkx5+B6t25QgPv6IQXxtn+kgQ59sBCbIW9kEzQaHM5htJBYk2mK
         57lQ==
X-Gm-Message-State: AOJu0Yx7nhd7tepMPcgLQcrppnJWHUoCpOHXFGvyuLfhYpnXM6Ze6efu
	QSa3csJzbGS+09XlUeLzOHY0aVoq7ilNJmjJyidEFxDcJYXOXWU65BbuqFlIh7iCCcQ7HOUbL6N
	HoZpe
X-Gm-Gg: ASbGncuMqJv4ygWajs2OgCbyg8g83bZ3YghIhUEjUHS/6Ss6IEc3eVFFevevIVXaWI5
	EatLunTX0ZUSbME1qrqGNHjaOH0NeVFdpeU+i9tVBS5UeFYwhkOrzNrTYl+8OnL4Y8wEvsp2BCe
	D+xy6xu1m9jtvQ/MCcEYi9cEFS9IclhJDYP1aBOyi9m6em9kNoh02aYxjMr620VnycyhS55WJVX
	mIyfTYyLdGleKXmk8/7F6z9qzqWeyVqiOq8De9e/3Jrwvhs7FG1u1pIruJ/2wL6H6f2Ylz/cLJg
	sOYeJKdJyuZe7HjtlIWqN5iBQGASFZxm55mZmfFzjAoQ8yxDbS+IDcWfFglo862+vpJo92eXSck
	k/OQoULUva1lCF+zoQUDHkSExUVUci+iEAh69uoH4zs6Vkba6a1W2t9vUQo3DAKiwJmGCs09N7q
	zxuY2SXg==
X-Google-Smtp-Source: AGHT+IH5AxEw0BxzkRq5AIJDF6jo13WbqcDfkxTxeBCSYqlOAQ7PFbsYNFTX+ktgIYzi15idoTu1VA==
X-Received: by 2002:a05:600c:548f:b0:471:747:2116 with SMTP id 5b1f17b1804b1-4771e20e4fcmr16054485e9.41.1761725053516;
        Wed, 29 Oct 2025 01:04:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e372a2asm35023665e9.1.2025.10.29.01.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:04:13 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:04:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
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
Message-ID: <20251029080409.F0uT_b25gwOlMDweX3vJ5ozNNNteCMdVlb3oho_Sj5c@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git ls.rqspin.v2.2
head:   b735af227349c9ef167cae8acf8bc8864e13f636
commit: b735af227349c9ef167cae8acf8bc8864e13f636 [3/3] [DONT PUSH]
config: i386-randconfig-r072-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291106.zV0JWnRE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510291106.zV0JWnRE-lkp@intel.com/

smatch warnings:
kernel/bpf/bpf_local_storage.c:823 bpf_local_storage_destroy() error: we previously assumed 'smap' could be null (see line 797)

vim +/smap +823 kernel/bpf/bpf_local_storage.c

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
                                                                    ^^^^
Check for NULL

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
                                                                                            ^^^^^^^^^^^^^^^^
Unchecked dereference.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

