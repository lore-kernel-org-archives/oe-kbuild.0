Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F171B982F
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Sep 2024 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154483; cv=none; b=KBzHMi+ORjZjfHXLl4mYUmyt4Uv67tLCDFLHTyaSIGd2rPVyEorqBjr5WHVtFWivShS8Qi/Ch0bdg4lmWjK30aJRT9l5sv/+0AOZQW7EkZLNCAWaHz8EHWUTOZPaoUYviCtXE20idAYt0qQjPqrO8WeD36MQZLAkqmwAWi0p8bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154483; c=relaxed/simple;
	bh=9TkatWWy4qUigj/Agc0VJXFWEg2FwVM7y8pymR1r4Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kDHg0aemrlHYm+dqJGNEy+sO9s7hb7LmdNS5A8TMK9P8UpP/JbQsmwXW0RYuirnmzsv534Zp5zaw+0Izsvf2WXh3vvjrtNczmFG8u2cv/yjH3P+SH0n09nBU9g13FcbOJLqOrz7xDE36GiDak2OsdwQqv97+67xTzSBUzlsHsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEg9DhOV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEg9DhOV"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d43657255so157810766b.0
        for <oe-kbuild@lists.linux.dev>; Thu, 12 Sep 2024 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726154480; x=1726759280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKZhGXRQcwFBUGD2TvzDYoHMOsYseNMEOOZwanUbJEc=;
        b=dEg9DhOVqgprAjH1tb3eqJ0wqUsLelLlX59mJNCQmYuVNfcKQXLXmQem2BhXmGsLux
         s0JgH1bjeNEwZaKiF3X+7MxdimIpwuKL9aieGigrw2gWWsdIlbsZoYB3/JbhRC+2rHIl
         91rGcjvBnfDuedLC5BfJVarerLimV/Ign3Vcmh3DEjc7ShYFi2X33aCSY0cvDyuTk6of
         O3dup9PDiBNI53g5/Iyww4TFdABmU1U9RLF9EC2c/lkMQyFjCR6u4LK4m9ddSGjHGOmk
         Ujm+Jy/YTnp3C4JifK51XVCdKwjkwukyQsQ7H2sG9Df4PXmg2xQJdLOUe89Pj4dhcDaz
         rapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154480; x=1726759280;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKZhGXRQcwFBUGD2TvzDYoHMOsYseNMEOOZwanUbJEc=;
        b=VVtew4vmq378ZLMHwze5/hrNiJHdOedLs2ffspmgHvgZeM96mZC5LF9LDBn/RvLjfb
         WWc0cbIywREzGIISK1+Ge7y+mkhDzG11wU9FuFplF0lb9Xcd82/sYLQaxut2S9p+iHME
         m4/E5DmU5golvw6pVgWj3xh/U9WWZBTHNv6VL+KOlOQyR8hNRoVfHnUtBVlgf2TZXE28
         G6qRU/6jEBkh4KFjozal1SWU0zPYiF3mAARObhi6o4TKxxzAKin5j09xYWkns6reQYPL
         jCe6pqiw34RUj3q0Xgtz6XvSRyjkEFsXVo3TIdN3B3AUMGXmbyKvakSn5HlOHt1jz7Gu
         3E7A==
X-Gm-Message-State: AOJu0YzvBO4yEE3OKqRZ7Z8oHKtWCUn2b4rufAwTRRr5VazssN1xNAVf
	df6zy6dpNXiPBlW2KAw60TwV2TO44vySHKRV6qeZeeKXn32rJU3PRs3BYEewH6G9BVxGMejSsw+
	Y
X-Google-Smtp-Source: AGHT+IGR0nOHASEqi+8LkA+gXAMl7gOxeG0h01vdv3UFFIDmn5QNe4LfNAaLW1YKKzKPpNhxSZIgjg==
X-Received: by 2002:a17:907:f154:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a902959cdaemr311009866b.29.1726154479528;
        Thu, 12 Sep 2024 08:21:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced1bfsm758176566b.154.2024.09.12.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:21:19 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:21:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Feng Tang <feng.tang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/5] mm/slub: Improve redzone check and zeroing for
 krealloc()
Message-ID: <956a59be-4153-4ec0-8b26-ea3dc1700e75@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911064535.557650-5-feng.tang@intel.com>

Hi Feng,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/mm-kasan-Don-t-store-metadata-inside-kmalloc-object-when-slub_debug_orig_size-is-on/20240911-144724
base:   next-20240910
patch link:    https://lore.kernel.org/r/20240911064535.557650-5-feng.tang%40intel.com
patch subject: [PATCH v2 4/5] mm/slub: Improve redzone check and zeroing for krealloc()
config: i386-randconfig-141-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122122.U5RpHfCY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409122122.U5RpHfCY-lkp@intel.com/

smatch warnings:
mm/slub.c:4748 __do_krealloc() error: uninitialized symbol 's'.

vim +/s +4748 mm/slub.c

474fff8e68012d Feng Tang       2024-09-11  4715  static __always_inline __realloc_size(2) void *
474fff8e68012d Feng Tang       2024-09-11  4716  __do_krealloc(const void *p, size_t new_size, gfp_t flags)
474fff8e68012d Feng Tang       2024-09-11  4717  {
474fff8e68012d Feng Tang       2024-09-11  4718  	void *ret;
474fff8e68012d Feng Tang       2024-09-11  4719  	size_t ks;
89a7731cc91033 Feng Tang       2024-09-11  4720  	int orig_size = 0;
89a7731cc91033 Feng Tang       2024-09-11  4721  	struct kmem_cache *s;
474fff8e68012d Feng Tang       2024-09-11  4722  
89a7731cc91033 Feng Tang       2024-09-11  4723  	/* Check for double-free. */
474fff8e68012d Feng Tang       2024-09-11  4724  	if (likely(!ZERO_OR_NULL_PTR(p))) {
474fff8e68012d Feng Tang       2024-09-11  4725  		if (!kasan_check_byte(p))
474fff8e68012d Feng Tang       2024-09-11  4726  			return NULL;
89a7731cc91033 Feng Tang       2024-09-11  4727  
89a7731cc91033 Feng Tang       2024-09-11  4728  		s = virt_to_cache(p);
89a7731cc91033 Feng Tang       2024-09-11  4729  		orig_size = get_orig_size(s, (void *)p);
89a7731cc91033 Feng Tang       2024-09-11  4730  		ks = s->object_size;
474fff8e68012d Feng Tang       2024-09-11  4731  	} else
474fff8e68012d Feng Tang       2024-09-11  4732  		ks = 0;

ks is zero

474fff8e68012d Feng Tang       2024-09-11  4733  
89a7731cc91033 Feng Tang       2024-09-11  4734  	/* If the object doesn't fit, allocate a bigger one */
89a7731cc91033 Feng Tang       2024-09-11  4735  	if (new_size > ks)

Assume new_size is also zero so this is false

89a7731cc91033 Feng Tang       2024-09-11  4736  		goto alloc_new;
89a7731cc91033 Feng Tang       2024-09-11  4737  
474fff8e68012d Feng Tang       2024-09-11  4738  	/* Zero out spare memory. */
474fff8e68012d Feng Tang       2024-09-11  4739  	if (want_init_on_alloc(flags)) {
474fff8e68012d Feng Tang       2024-09-11  4740  		kasan_disable_current();
89a7731cc91033 Feng Tang       2024-09-11  4741  		if (orig_size < new_size)
89a7731cc91033 Feng Tang       2024-09-11  4742  			memset((void *)p + orig_size, 0, new_size - orig_size);
89a7731cc91033 Feng Tang       2024-09-11  4743  		else
474fff8e68012d Feng Tang       2024-09-11  4744  			memset((void *)p + new_size, 0, ks - new_size);
474fff8e68012d Feng Tang       2024-09-11  4745  		kasan_enable_current();
474fff8e68012d Feng Tang       2024-09-11  4746  	}
474fff8e68012d Feng Tang       2024-09-11  4747  
89a7731cc91033 Feng Tang       2024-09-11 @4748  	if (slub_debug_orig_size(s) && !is_kfence_address(p)) {
                                                                                 ^
Uninitialized in that case

89a7731cc91033 Feng Tang       2024-09-11  4749  		set_orig_size(s, (void *)p, new_size);
89a7731cc91033 Feng Tang       2024-09-11  4750  		if (s->flags & SLAB_RED_ZONE && new_size < ks)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

