Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF03074B4
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451513; cv=none; b=Gvb9P351A74q+qKM8TzqhjKBJGmkxZSA9WZNghURsjUkJKqW9BfkCmFO3lwemnAItOJ6AGw539AmV8lOEfwtyu98dZr7z+wsmG1uwLAhlLw2aQs6Szn5kYgMGYoA6JVF8UXnywX6nxx0wz0JyNdM7PI3jrmIm+ayP/BCRmENkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451513; c=relaxed/simple;
	bh=vhx1ohIKCP6r6AADI9y2QaQlz9ks6bQd/Nyr/fHa7lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=E7zuUpNMmUd95ZgYqLqvsqancs/9/BCJLsMpUZqYt/nr7vXD5T8uVwKHmA0uy97t+hJa/etU3Nv2RflaZVaP0AFwGDpGsKQhX1bN1f0wqP9mAiI4Qp+qR7K0QthmxBUE9YCqKmo4nJRvC6TcAAuss5QqJLSgHGTFTI8PddAcV3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjRyRmNp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjRyRmNp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3c965df5so3012753f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Nov 2025 23:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763451509; x=1764056309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HFNHNm7IeCb6cY7zTmVQXU33zq3Wgzba7sFu0fg8i5U=;
        b=ZjRyRmNpsswoGuze5uFZFWgcQUkKmU/vsuqcLegO0JyLisjJw7I81PLOG4t0wK35Qs
         QyudqpbiNUJCXdbQniL/3Ov1wpz0rfv8mOV8IFi7B0P500S/L2fW4WeQkCBvwfqwQFUA
         eN82eJau0zBh2fJkl/mLBZExHWXXMkgMdUbHjLhIy/FPWF3vVf+/0dgb84D6Hfe8+Y2O
         NWz2SL0uYBTn+rPdEb2dVhoqd06jJwVNpa4DzA29XZdd8bByxw9doKiWC8OSp8dr/6XY
         VzVNx8pOqUFtzXA63BnBFV9V3qH/bno24k0HCCLHjSLuYz/MjbdUTM9hmuixKjlBGefj
         oUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451509; x=1764056309;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFNHNm7IeCb6cY7zTmVQXU33zq3Wgzba7sFu0fg8i5U=;
        b=iTObUbmaNq3pqVCYmKOZ+Khw3/BnIBxLUBSJ679Y3kHSyf5IiGVGZLxinLoCLuBvPQ
         H/2Qkl+exmfkLkSh1VAunFfLXiFzIXrdscOwwarJ+nzyZR9QC11ePeyIB2ssexSdvqUs
         Oa2k0sLq/+Vg9Ae4jmJkf9TxDg53zUZNbx5kpZXe8AhOqYEi2F3AauZdor3eRBTIrvZd
         EzQMVMryYPcGoQOWXljMDdSVubKHQCBzITM8YVsfd1PhEr+lzM2Noz+JgO6H9mwXmn6+
         AxVw0yzHQZNVI2LJ8oo+Oz0+EQL3CESlJFrncFQPpazG2CdA1Ta0Uxtiz8M6TR5jdRjF
         Ohgg==
X-Gm-Message-State: AOJu0YyKvbu3VhHfiEaPzN2ZQhOY6TRc7JCZCYB+WYf9K8f66t88Pp0X
	hYVsJ9KbVG6oiWRpaxx+Vu97VwCnfLtc1R3/DokOgQ3wCnpfW3AP8BevjM136CY5vGl+ndxlNsP
	nPRCA
X-Gm-Gg: ASbGnctEBdM6vDQdaadRxEDnCyHSpyXeY+PO968edm7ds7B9w3uWi/VuvU5aAH540GS
	WgF5EU4tJM2AkUbXWZoZbL4CO4xWbQMnYMrtQ9jmIsQ3rzQLdfFlWRcbRhA4se6GlCiofBrMOSq
	gvjg4dDiHk5lLOAUMNPbosXQ6QE0KCd1EaBiYAdPG+lKGfl0LVL6S+W0fwFjzToAHybdKuy90Cc
	tkwKEwhbR3yJYJcDBf4VsKt0SaagQR/Fs+fD3zSeHsfuNyNqVFGebqMsns5Xmk2ZkOV4xTMLaru
	QY9q/2mYtgd7iwCeUwsLTlFgbrKfTp9QzpoXNYwKzWl7NYNaBgKPPfpUOQBwd6J/9eXkmC6/K0i
	VjvZeRop4O8M1QjRrU7qASsEVLeCeOu7lcrnXwcsAjBxSBdz3bz8tMZUz8OOAolKDZCwAZ8PsCY
	RJMuQrGh5XzyT9HK/VjrA+PXKEyxQ=
X-Google-Smtp-Source: AGHT+IFj9gXhg+qiuF9yfOS2M1bldyX0bAh2TnErtT9EPdUljqt0IrxN7ae8IT4H95dn6d0qiXVKuw==
X-Received: by 2002:a05:6000:2509:b0:429:bca4:6b3c with SMTP id ffacd0b85a97d-42b59345769mr12612005f8f.9.1763451508964;
        Mon, 17 Nov 2025 23:38:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f1fd50sm30297675f8f.38.2025.11.17.23.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:38:28 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhiping Zhang <zhipingz@meta.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/2] Set steering-tag directly for PCIe P2P memory access
Message-ID: <202511171603.TwX3hgKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113213712.776234-3-zhipingz@meta.com>
Message-ID: <20251118073825.YHK8QDRRaJM7JUbDJHen4kbxN1cNGY2daigGe_vyf1Q@z>

Hi Zhiping,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/Set-steering-tag-directly-for-PCIe-P2P-memory-access/20251114-054930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251113213712.776234-3-zhipingz%40meta.com
patch subject: [RFC 2/2] Set steering-tag directly for PCIe P2P memory access
config: x86_64-randconfig-161-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171603.TwX3hgKc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511171603.TwX3hgKc-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:139 mlx5_st_alloc_index() error: uninitialized symbol 'ret'.

vim +/ret +139 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c

888a7776f4fb04 Yishai Hadas  2025-07-17   82  int mlx5_st_alloc_index(struct mlx5_core_dev *dev, enum tph_mem_type mem_type,
1f035dcb026b8a Zhiping Zhang 2025-11-13   83  			unsigned int cpu_uid, u16 *st_index, u16 direct_st_val)
888a7776f4fb04 Yishai Hadas  2025-07-17   84  {
888a7776f4fb04 Yishai Hadas  2025-07-17   85  	struct mlx5_st_idx_data *idx_data;
888a7776f4fb04 Yishai Hadas  2025-07-17   86  	struct mlx5_st *st = dev->st;
888a7776f4fb04 Yishai Hadas  2025-07-17   87  	unsigned long index;
888a7776f4fb04 Yishai Hadas  2025-07-17   88  	u32 xa_id;
888a7776f4fb04 Yishai Hadas  2025-07-17   89  	u16 tag;
888a7776f4fb04 Yishai Hadas  2025-07-17   90  	int ret;
888a7776f4fb04 Yishai Hadas  2025-07-17   91  
888a7776f4fb04 Yishai Hadas  2025-07-17   92  	if (!st)
888a7776f4fb04 Yishai Hadas  2025-07-17   93  		return -EOPNOTSUPP;
888a7776f4fb04 Yishai Hadas  2025-07-17   94  
1f035dcb026b8a Zhiping Zhang 2025-11-13   95  	if (mem_type == TPH_MEM_TYPE_P2P)
1f035dcb026b8a Zhiping Zhang 2025-11-13   96  		tag = direct_st_val;

ret not set.

1f035dcb026b8a Zhiping Zhang 2025-11-13   97  	else {
888a7776f4fb04 Yishai Hadas  2025-07-17   98  		ret = pcie_tph_get_cpu_st(dev->pdev, mem_type, cpu_uid, &tag);
888a7776f4fb04 Yishai Hadas  2025-07-17   99  		if (ret)
888a7776f4fb04 Yishai Hadas  2025-07-17  100  			return ret;
1f035dcb026b8a Zhiping Zhang 2025-11-13  101  	}
888a7776f4fb04 Yishai Hadas  2025-07-17  102  
888a7776f4fb04 Yishai Hadas  2025-07-17  103  	mutex_lock(&st->lock);
888a7776f4fb04 Yishai Hadas  2025-07-17  104  
888a7776f4fb04 Yishai Hadas  2025-07-17  105  	xa_for_each(&st->idx_xa, index, idx_data) {
888a7776f4fb04 Yishai Hadas  2025-07-17  106  		if (tag == idx_data->tag) {
888a7776f4fb04 Yishai Hadas  2025-07-17  107  			refcount_inc(&idx_data->usecount);
888a7776f4fb04 Yishai Hadas  2025-07-17  108  			*st_index = index;
888a7776f4fb04 Yishai Hadas  2025-07-17  109  			goto end;

This needs a ret = 0;

888a7776f4fb04 Yishai Hadas  2025-07-17  110  		}
888a7776f4fb04 Yishai Hadas  2025-07-17  111  	}
888a7776f4fb04 Yishai Hadas  2025-07-17  112  
888a7776f4fb04 Yishai Hadas  2025-07-17  113  	idx_data = kzalloc(sizeof(*idx_data), GFP_KERNEL);
888a7776f4fb04 Yishai Hadas  2025-07-17  114  	if (!idx_data) {
888a7776f4fb04 Yishai Hadas  2025-07-17  115  		ret = -ENOMEM;
888a7776f4fb04 Yishai Hadas  2025-07-17  116  		goto end;
888a7776f4fb04 Yishai Hadas  2025-07-17  117  	}
888a7776f4fb04 Yishai Hadas  2025-07-17  118  
888a7776f4fb04 Yishai Hadas  2025-07-17  119  	refcount_set(&idx_data->usecount, 1);
888a7776f4fb04 Yishai Hadas  2025-07-17  120  	idx_data->tag = tag;
888a7776f4fb04 Yishai Hadas  2025-07-17  121  
888a7776f4fb04 Yishai Hadas  2025-07-17  122  	ret = xa_alloc(&st->idx_xa, &xa_id, idx_data, st->index_limit, GFP_KERNEL);
888a7776f4fb04 Yishai Hadas  2025-07-17  123  	if (ret)
888a7776f4fb04 Yishai Hadas  2025-07-17  124  		goto clean_idx_data;
888a7776f4fb04 Yishai Hadas  2025-07-17  125  
888a7776f4fb04 Yishai Hadas  2025-07-17  126  	ret = pcie_tph_set_st_entry(dev->pdev, xa_id, tag);
888a7776f4fb04 Yishai Hadas  2025-07-17  127  	if (ret)
888a7776f4fb04 Yishai Hadas  2025-07-17  128  		goto clean_idx_xa;
888a7776f4fb04 Yishai Hadas  2025-07-17  129  
888a7776f4fb04 Yishai Hadas  2025-07-17  130  	*st_index = xa_id;
888a7776f4fb04 Yishai Hadas  2025-07-17  131  	goto end;
888a7776f4fb04 Yishai Hadas  2025-07-17  132  
888a7776f4fb04 Yishai Hadas  2025-07-17  133  clean_idx_xa:
888a7776f4fb04 Yishai Hadas  2025-07-17  134  	xa_erase(&st->idx_xa, xa_id);
888a7776f4fb04 Yishai Hadas  2025-07-17  135  clean_idx_data:
888a7776f4fb04 Yishai Hadas  2025-07-17  136  	kfree(idx_data);
888a7776f4fb04 Yishai Hadas  2025-07-17  137  end:
888a7776f4fb04 Yishai Hadas  2025-07-17  138  	mutex_unlock(&st->lock);
888a7776f4fb04 Yishai Hadas  2025-07-17 @139  	return ret;
888a7776f4fb04 Yishai Hadas  2025-07-17  140  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

