Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B12F49FD
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268542; cv=none; b=KdHB2Ryaftv2ssDFyYd3aGYwN0gnsoUDA8cuJUcBekGALkdHM4jU27rN3pnBsxIvTfP3umtynDAQJ9mA8zuEZ3HEt6SrKGbdPAT1eN9m74paURD4K0RuD1Z8ZFXIqXj7jzESiCQblF6NlNJr2MD0740nmL4Ucym3x5S0mVHfuy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268542; c=relaxed/simple;
	bh=k+WSJqnoiVN0IJh+lIlYBCAtA1ykxdGAezbG8ofc+08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTMeutjO53krYPLR39wkhmMoC0IJDcL73kjADveBXx99xsyzF0ZvI3VhDbuArphTQ38k8kosXijqL4OjQ9Q861MXi5c4HYPWZUqAkrdRGRIB0WxB6+1se4tMeNU8lUAPJ8yR7TbqEwA/i8jONRE/Ogf9MyPP9/DLyi3JM7C7hRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hQ/Rz70D; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQ/Rz70D"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-735b2699d5dso4225454a34.0
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268539; x=1750873339; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALQlJ1RqfpncfV715L7OdUSgYhmYfcG/SeD8Mhl1jzk=;
        b=hQ/Rz70D3Xivntqbx4hspcH21RFgj/yLOuMimptp/en2XkzYwVz/19QSaA2mW0CBla
         9IFEFqzB+WHIwPlvCvgsr9lX/TpVMGOttxL8wB3+SHpIPvzXJL3vKxQPjtARnVAq8p2X
         4D1FUOWHI/AipWReTd5jtNQH5ZDJ1+L2iYX+Ur7Oox8/zWtc+uPIj8HWcsnGOZQ3WS+0
         W06hpd6HnV2EEygjd037fPChMyk2CJjvObpSFCL0XmqIcoHs8Gwh4sQkC524LN84QJS6
         6bSYZMzQrvgiMSYJ4xK9EYkhINNRPKJSPdSKs+YNfdkc5/4GfNTc6HsaI5mDpykYpJxW
         NMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268539; x=1750873339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALQlJ1RqfpncfV715L7OdUSgYhmYfcG/SeD8Mhl1jzk=;
        b=uie0y+GWCIHOES8KPF6Z78Kn2j3iav/dVqqnVrPWZw34TS2VdGT7T8dqoitaTcLZlR
         wzPBFTndXchY3U/eIqlWtEhHUe2n8e80sEe7lOyrTwSVHkI92t7cXK73CGArxBXFsGu/
         OFa+xw0RP3GL2VUD2BqcnzEQjmAM4zWSDP9gsuH9mvL4ilW1n1jVHVfLFFpxjc+cUWA9
         hFHt6ApuBjNcgREGKXRF2kObyUnH8TqoRXSqIEfWsdxtKa+7qYdpz4IGehic1fFCXxWi
         nqVTRXbXUsR+eGdelETzH4kVHlls+RPupjNLryZFdif7EVcztDDgk/FkFLVE323dLH4+
         yq2g==
X-Gm-Message-State: AOJu0Yyf69WgIG2iKZZZFrU0Y6R1xcv3WH+cltiiZTy9v56tC7WSmon0
	/rR8OT9NYw4RNbiXcUPvryudvv134oe66uj1EMDMisK17k/KkGuHRzIS4KWHhpLxqweCy1zA7kQ
	IzCqd
X-Gm-Gg: ASbGncv3d/yastkcD73gs5ImoGS6FtB09moSA/+S6ezzHjsdvnE41Dg4O1W33Y7bm3E
	mK7gDchmDpGl65eeTVVEuTesLueDy4ZXqB+zOpRXtlM4oUvNnuXqE3Zx6nXzAHaVP3iJW/3LGqa
	RJqwIjRLuPeM4SeUXPT+arjk5KaGbf7aRekiLLppbMB25iiVYeNSStUdBfY632Tn4x/IuZenEKX
	O8xf3/PB2DA7i3FmV2NtQk19ULn7JnImSGD8k8A2fNb0oft5BMBGREbYUWQGaKVFz7ZWtvVFkTB
	nuZFdG1sGw9i6nn9JuMjb6pM/UZe2Mhk0VmYmwCEfkorkIcsGXwwYk1cg6ErbRbkg7Z+cQ==
X-Google-Smtp-Source: AGHT+IFFFmB4u98R4eAo2rUrAWhzhlCaoI+JO8SWCcz50Wh9AA3SCYViXrulit3sJ5S4KHyxDHKWTw==
X-Received: by 2002:a05:6830:8218:b0:72c:10d5:783e with SMTP id 46e09a7af769-73a3627941cmr9790083a34.10.1750268539221;
        Wed, 18 Jun 2025 10:42:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284febb6sm2055391a34.37.2025.06.18.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:42:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:42:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zi Yan <ziy@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized
 symbol 'entry_order'.
Message-ID: <428fa0fe-8960-4566-9054-5bfd967c18c8@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4774cfe3543abb8ee98089f535e28ebfd45b975a
commit: d53c78fffe7ad364397c693522ceb4d152c2aacd mm/shmem: use xas_try_split() in shmem_split_large_entry()
config: x86_64-randconfig-161-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141535.tjdnCMqW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506141535.tjdnCMqW-lkp@intel.com/

smatch warnings:
mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized symbol 'entry_order'.

vim +/entry_order +2223 mm/shmem.c

12885cbe88ddf6 Baolin Wang 2024-08-12  2151  static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
12885cbe88ddf6 Baolin Wang 2024-08-12  2152  				   swp_entry_t swap, gfp_t gfp)
12885cbe88ddf6 Baolin Wang 2024-08-12  2153  {
12885cbe88ddf6 Baolin Wang 2024-08-12  2154  	struct address_space *mapping = inode->i_mapping;
12885cbe88ddf6 Baolin Wang 2024-08-12  2155  	XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
d53c78fffe7ad3 Zi Yan      2025-03-14  2156  	int split_order = 0, entry_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2157  	int i;
12885cbe88ddf6 Baolin Wang 2024-08-12  2158  
12885cbe88ddf6 Baolin Wang 2024-08-12  2159  	/* Convert user data gfp flags to xarray node gfp flags */
12885cbe88ddf6 Baolin Wang 2024-08-12  2160  	gfp &= GFP_RECLAIM_MASK;
12885cbe88ddf6 Baolin Wang 2024-08-12  2161  
12885cbe88ddf6 Baolin Wang 2024-08-12  2162  	for (;;) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2163  		void *old = NULL;
d53c78fffe7ad3 Zi Yan      2025-03-14  2164  		int cur_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2165  		pgoff_t swap_index;
12885cbe88ddf6 Baolin Wang 2024-08-12  2166  
12885cbe88ddf6 Baolin Wang 2024-08-12  2167  		xas_lock_irq(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2168  		old = xas_load(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2169  		if (!xa_is_value(old) || swp_to_radix_entry(swap) != old) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2170  			xas_set_err(&xas, -EEXIST);
12885cbe88ddf6 Baolin Wang 2024-08-12  2171  			goto unlock;

Imagine we hit this goto on the first iteration

12885cbe88ddf6 Baolin Wang 2024-08-12  2172  		}
12885cbe88ddf6 Baolin Wang 2024-08-12  2173  
d53c78fffe7ad3 Zi Yan      2025-03-14  2174  		entry_order = xas_get_order(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2175  
d53c78fffe7ad3 Zi Yan      2025-03-14  2176  		if (!entry_order)
d53c78fffe7ad3 Zi Yan      2025-03-14  2177  			goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2178  
12885cbe88ddf6 Baolin Wang 2024-08-12  2179  		/* Try to split large swap entry in pagecache */
d53c78fffe7ad3 Zi Yan      2025-03-14  2180  		cur_order = entry_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2181  		swap_index = round_down(index, 1 << entry_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2182  
d53c78fffe7ad3 Zi Yan      2025-03-14  2183  		split_order = xas_try_split_min_order(cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2184  
d53c78fffe7ad3 Zi Yan      2025-03-14  2185  		while (cur_order > 0) {
d53c78fffe7ad3 Zi Yan      2025-03-14  2186  			pgoff_t aligned_index =
d53c78fffe7ad3 Zi Yan      2025-03-14  2187  				round_down(index, 1 << cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2188  			pgoff_t swap_offset = aligned_index - swap_index;
d53c78fffe7ad3 Zi Yan      2025-03-14  2189  
d53c78fffe7ad3 Zi Yan      2025-03-14  2190  			xas_set_order(&xas, index, split_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2191  			xas_try_split(&xas, old, cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2192  			if (xas_error(&xas))
12885cbe88ddf6 Baolin Wang 2024-08-12  2193  				goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2194  
12885cbe88ddf6 Baolin Wang 2024-08-12  2195  			/*
12885cbe88ddf6 Baolin Wang 2024-08-12  2196  			 * Re-set the swap entry after splitting, and the swap
12885cbe88ddf6 Baolin Wang 2024-08-12  2197  			 * offset of the original large entry must be continuous.
12885cbe88ddf6 Baolin Wang 2024-08-12  2198  			 */
d53c78fffe7ad3 Zi Yan      2025-03-14  2199  			for (i = 0; i < 1 << cur_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2200  			     i += (1 << split_order)) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2201  				swp_entry_t tmp;
12885cbe88ddf6 Baolin Wang 2024-08-12  2202  
d53c78fffe7ad3 Zi Yan      2025-03-14  2203  				tmp = swp_entry(swp_type(swap),
d53c78fffe7ad3 Zi Yan      2025-03-14  2204  						swp_offset(swap) + swap_offset +
d53c78fffe7ad3 Zi Yan      2025-03-14  2205  							i);
12885cbe88ddf6 Baolin Wang 2024-08-12  2206  				__xa_store(&mapping->i_pages, aligned_index + i,
12885cbe88ddf6 Baolin Wang 2024-08-12  2207  					   swp_to_radix_entry(tmp), 0);
12885cbe88ddf6 Baolin Wang 2024-08-12  2208  			}
d53c78fffe7ad3 Zi Yan      2025-03-14  2209  			cur_order = split_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2210  			split_order = xas_try_split_min_order(split_order);
12885cbe88ddf6 Baolin Wang 2024-08-12  2211  		}
12885cbe88ddf6 Baolin Wang 2024-08-12  2212  
12885cbe88ddf6 Baolin Wang 2024-08-12  2213  unlock:
12885cbe88ddf6 Baolin Wang 2024-08-12  2214  		xas_unlock_irq(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2215  
12885cbe88ddf6 Baolin Wang 2024-08-12  2216  		if (!xas_nomem(&xas, gfp))
12885cbe88ddf6 Baolin Wang 2024-08-12  2217  			break;

And we hit this break.

12885cbe88ddf6 Baolin Wang 2024-08-12  2218  	}
12885cbe88ddf6 Baolin Wang 2024-08-12  2219  
12885cbe88ddf6 Baolin Wang 2024-08-12  2220  	if (xas_error(&xas))
12885cbe88ddf6 Baolin Wang 2024-08-12  2221  		return xas_error(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2222  
d53c78fffe7ad3 Zi Yan      2025-03-14 @2223  	return entry_order;
6cec2b95dadf77 Miaohe Lin  2022-05-19  2224  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

