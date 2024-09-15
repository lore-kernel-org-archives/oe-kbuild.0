Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C171C5787
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726402815; cv=none; b=OFM5zk+1Wdjhus3NkUF7osp0PdybBR89MZG3U+2L5VGvA2WuQgLY3KQf5mV+BBLGC5JjMLRUdF8IXhI8uKvWX3gdcxCBNdWqaRnWbNkhXn7xqBeVgwsnh/ytxMh1oTbExVE5QSXptdwjlTWeiLgD5LxeVOag4wb2YVv6VowemPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726402815; c=relaxed/simple;
	bh=daGlzU4WmKHdahwfXqU9Z06DvDTShbv9rNI3qDD2WQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nQnkFsaOXfcc9S4CodPiCcDCkZqrOVqu9PvpFhSCK9AZY82Dh5VwPK/o33hfVxCQeM2fNN2OQD0nSbsyHKHRdZYnydUgZ71+88KeWBplHmmJJbnHXwLSQ1Lv8pCnRKG+c9ZWOG1olpuqkugG0uyOUqP9xjBUwrCwyknhIHO7wo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/+B56uv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/+B56uv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb806623eso30683155e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726402810; x=1727007610; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ3kJ+J4exwdULZkUSQNxsv8w0pyTybMuS9SioSna3g=;
        b=Q/+B56uvDltyxwTyuiJJ/LYllAKd1Ivwz0cebxmJn+bgJVV2QgqOpUEg9vfaxOLntn
         cTXcGAZkZ2tu5QCd0tICjik7egEKixDokwNnFcUu+mggtcbI8iJGJ828uTf/BeDO5Z/d
         8wjcelqEiNq/cmTDIEAalbstldUK8uBBbKs+s3pnwu+HIJMOKJYn3XfMTqlyRQkaEFR6
         ZJ6ee8oC8LeOBlY4EP0DokYKk63jlimC0fl3lcW90TO5pWvDz4PZRknUP0VMt+i90M3o
         rVfVy8XPheS1K9YTJ2rwSjl7x6DNBRXjM+pUnTSv/gLIKDF/91+2NZnlLA2yz66KRXxa
         8lvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726402810; x=1727007610;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJ3kJ+J4exwdULZkUSQNxsv8w0pyTybMuS9SioSna3g=;
        b=Mw0p9zcHe5/qtqQRL9q/BRL1gbMHoHAv/Lgzqd2TeHSq2O617ohBCOOdob2PvPVC68
         CqaKwTkJM/TqMCSuH0kCVocQIWpRxamidteYFuoidgzvgT+TVEd/npqBT5DXH7pe0OKD
         8gCm0XxCnQLG167Yp824V0Nc3dsBeyb6CyclXSj9kVudYhnPnLTSFkFufTK4+mbVhgtP
         l7M40lCFIw/TMsDhZTwgT/TpwGq3iakfXaMZnVD48C9sbFlvzuahJzqiSTnpXsDpuT7C
         CidHtPO/4FBxhoON2n4mvtlGtJavEYELtKWkXM8j462l7KfNjosToCtq4XIcBZbeX4ZE
         Gulw==
X-Gm-Message-State: AOJu0Ywf8nBaSJSbGqgS1gzvhyQuHXdt6+YfhDLi/RK3hnOshdWj2lkY
	Zk4mZYjnjFbuwbN4m9Zgi05Pi+fC/soch4BrJthvAKIqZfhC6HVxJ/JYXDKhDmlsRkUgRIF3cwq
	1
X-Google-Smtp-Source: AGHT+IEgw+81Be8VlsNNYv5oVWe0NcL9ycV9srKZlDe8Ml6Gt1TmpHshQpjg8T+CrjFcirutq2GLsg==
X-Received: by 2002:a05:600c:3b92:b0:42c:bbd5:af70 with SMTP id 5b1f17b1804b1-42cdb56f1e0mr93875975e9.30.1726402810352;
        Sun, 15 Sep 2024 05:20:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc01a8ee7sm195063355e9.0.2024.09.15.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 05:20:09 -0700 (PDT)
Date: Sun, 15 Sep 2024 15:20:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 04/11] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
Message-ID: <9891d4ec-5900-410b-95c2-f825e00b6a61@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 04/11] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409151657.C9e2MDGb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409151657.C9e2MDGb-lkp@intel.com/

smatch warnings:
kernel/unwind/sframe.c:107 find_fde() error: uninitialized symbol 'found'.
kernel/unwind/sframe.c:161 find_fre() error: uninitialized symbol 'last_f'.
kernel/unwind/sframe.c:166 find_fre() error: uninitialized symbol 'offset_size'.
kernel/unwind/sframe.c:167 find_fre() error: uninitialized symbol 'offset_count'.
kernel/unwind/sframe.c:188 find_fre() error: uninitialized symbol 'fre_info'.

vim +/found +107 kernel/unwind/sframe.c

6ce9812d0cc74f Josh Poimboeuf 2024-09-14   86  static int find_fde(struct sframe_section *sec, unsigned long ip,
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   87  		    struct sframe_fde *fde)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   88  {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   89  	s32 func_off, ip_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   90  	struct sframe_fde __user *first, *last, *mid, *found;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   91  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   92  	ip_off = ip - sec->sframe_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   93  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   94  	first = (void *)sec->fdes_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   95  	last = first + sec->fdes_nr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   96  	while (first <= last) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   97  		mid = first + ((last - first) / 2);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   98  		if (get_user(func_off, (s32 *)mid))
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   99  			return -EFAULT;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  100  		if (ip_off >= func_off) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  101  			found = mid;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  102  			first = mid + 1;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  103  		} else
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  104  			last = mid - 1;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  105  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  106  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @107  	if (!found)

found needs to be initialized to NULL at the start.

6ce9812d0cc74f Josh Poimboeuf 2024-09-14  108  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  109  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  110  	if (copy_from_user(fde, found, sizeof(*fde)))
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  111  		return -EFAULT;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  112  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  113  	return 0;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  114  }
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  115  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  116  static int find_fre(struct sframe_section *sec, struct sframe_fde *fde,
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  117  		    unsigned long ip, struct user_unwind_frame *frame)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  118  {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  119  	unsigned char fde_type = SFRAME_FUNC_FDE_TYPE(fde->info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  120  	unsigned char fre_type = SFRAME_FUNC_FRE_TYPE(fde->info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  121  	s32 fre_ip_off, cfa_off, ra_off, fp_off, ip_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  122  	unsigned char offset_count, offset_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  123  	unsigned char addr_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  124  	void __user *f, *last_f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  125  	u8 fre_info;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  126  	int i;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  127  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  128  	addr_size = fre_type_to_size(fre_type);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  129  	if (!addr_size)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  130  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  131  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  132  	ip_off = ip - sec->sframe_addr - fde->start_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  133  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  134  	f = (void *)sec->fres_addr + fde->fres_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  135  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  136  	for (i = 0; i < fde->fres_num; i++) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  137  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  138  		SFRAME_GET_USER_UNSIGNED(fre_ip_off, f, addr_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  139  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  140  		if (fde_type == SFRAME_FDE_TYPE_PCINC) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  141  			if (fre_ip_off > ip_off)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  142  				break;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  143  		} else {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  144  			/* SFRAME_FDE_TYPE_PCMASK */
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  145  			if (ip_off % fde->rep_size < fre_ip_off)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  146  				break;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  147  		}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  148  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  149  		SFRAME_GET_USER_UNSIGNED(fre_info, f, 1);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  150  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  151  		offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  152  		offset_size  = offset_size_enum_to_size(SFRAME_FRE_OFFSET_SIZE(fre_info));
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  153  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  154  		if (!offset_count || !offset_size)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  155  			return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  156  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  157  		last_f = f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  158  		f += offset_count * offset_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  159  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  160  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @161  	if (!last_f)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  162  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  163  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  164  	f = last_f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  165  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @166  	SFRAME_GET_USER_UNSIGNED(cfa_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @167  	offset_count--;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  168  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  169  	ra_off = sec->ra_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  170  	if (!ra_off) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  171  		if (!offset_count--)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  172  			return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  173  		SFRAME_GET_USER_SIGNED(ra_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  174  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  175  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  176  	fp_off = sec->fp_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  177  	if (!fp_off && offset_count) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  178  		offset_count--;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  179  		SFRAME_GET_USER_SIGNED(fp_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  180  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  181  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  182  	if (offset_count)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  183  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  184  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  185  	frame->cfa_off = cfa_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  186  	frame->ra_off = ra_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  187  	frame->fp_off = fp_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @188  	frame->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  189  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  190  	return 0;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  191  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

