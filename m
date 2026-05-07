Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E07F3EAC73
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150120; cv=none; b=R1NxVzXiDWXd0p3xnNEKVUsR62Wa2oyWB/xK+39aBxNqoqIcdA1B7zTdJxRzEsjJdabmaHx/q06WmYVOh8aRw1h/Odm3f9uUYFjzDTvbLKxSy/Zgz0t/NOU85nKVOSsdUr+5+oNrxQR+HMv8PADdmfK/D4W4L3S2fGVeNr7FuEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150120; c=relaxed/simple;
	bh=NvWjKGEH5AexCh1wgfM/i3jDoFq2EoAZy1t+xwdmTeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBODXCSVnvQudIA994vUnCN66MO9WMCAyxZtNeQ6m2kRbBK24MWlTw9XEIbdSZAuKpYMM9EfT3SDLxNTrWati4yFric5Zj+xHQGjSO0mCiRvZINX6st7EqXkqMBO9IwYFfWxcVEF1mlx9usMOPIUgeNpIhmEyzoIdmfe3upA7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxhKIX+e; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxhKIX+e"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-463a0e14abfso353530b6e.2
        for <oe-kbuild@lists.linux.dev>; Thu, 07 May 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150117; x=1778754917; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8K3OIHFb9yqqZ050RJZMLwdoBWgFfUeLBVGnuqXPek=;
        b=WxhKIX+eN8pd159Pe9NdCLRz+Y06CFy7dHTlxyzrh+jGwke6PkJeEBjtr/73RrE/B1
         yAUcDZ+l+kfq+ZXlUj7/p23R9Arbk/eBSFf9fLIaKQHaO2n+O7VFtob9NnX736Ts2rd9
         LpnnX8sQiFQ4Hq9A1pkoodClLaBNA+3g10Ce8/msFjOJAhx1ho4+17ua16GWfzjofw8q
         /KD2RK4wTM9MSEzvKpO8ssQYM7qNtiF+bDU7+ezLO/cqXubLFof2PyclcstKQPzw5CEH
         Li4QUyC6NTTDVv7ZPKY39sBWINwmSK2u6lfN6WmzaFuDUumeUWfOYYem+Y617GVcreEE
         KSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150117; x=1778754917;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8K3OIHFb9yqqZ050RJZMLwdoBWgFfUeLBVGnuqXPek=;
        b=hpF22FrLLGGD+LuLg4xHwMYbyrfc+tJHU4xV959YGDfHWDG3D2FpPcc/XQkKYqDcyD
         oFWqHiRX9Oa0J41HaFlEjerKEe8uZkq/zSeuGnb5cSbl8ajwyf0dZT0MO/7siZuNvKW3
         qCDAcCI5C0DKTtJm19US3wHuzvvfzXGvZIAWddcfLDeMXwElSqanMDrIPKpJvj5yng6x
         Empial48j3GUXNl0eNfdXo8chHvW+oWsdWGC4clzYub8MIe7HC9rzoRBKDPr8AuiMeJk
         KM4uVvRZBgGiCPkDmeE3vSynemofpW76YduHpHfhxPDLJxvfx9P4M24cA2YehxYqSfnl
         28yA==
X-Gm-Message-State: AOJu0YwhBCnSEcJp32pbJnNevcU5jSoBbHqyr8pfaIn1m2i44gNb083A
	Ra0Y+pTYjHVmRg3/pP5czge/3k+Rmgz5xur5unSXUEQqkuicxW8hAoTV4lqNZAZ6
X-Gm-Gg: AeBDievvERrOdfpenh9zK7K/3r2fe/SDVXhogKqHDnEs373PRthE2wxY5UsOj0t/Mjg
	DNaVOfAR9QQBxWIS9YXHI4hvlmwS5v0kaz+3Cvl6veatLzrRstCgAXZqU9Gog2iLm9VcmvM6x50
	IvX+uOvPt0v19FARtNfnLCUjNypBaQe9gOP3fb9skDHVV0I4xDPyCmeLLATz/cR+Mfdymus3zDJ
	R4ytg+4cqaihYS1vqyxXOTuUaAeNfd/VeIoc+QdWrN61lTEhf9MP+K0ysxrAOR+Ei4Hb5oveLoS
	ajZHwzW2PbQqLL4yLt98kQ86uYqjOT29FNWdAIXgnsMBBkdYYlEWKm6YExeQPamX/vGglghff5j
	iafuktAO8sctEAJOj19tmBcX01qzI8FgDGxZRyuPJDzqbwHpo3YCCaSwwGZKh+ECYzngtFYmlps
	eYNQpNEmZMHzr/PKENF7mifvua1UOVSg==
X-Received: by 2002:a05:6808:1481:b0:479:646c:f701 with SMTP id 5614622812f47-4804253d27fmr4138047b6e.41.1778150116861;
        Thu, 07 May 2026 03:35:16 -0700 (PDT)
Received: from localhost ([206.212.255.140])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b33c1sm12358484b6e.1.2026.05.07.03.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:35:15 -0700 (PDT)
Date: Thu, 7 May 2026 13:35:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <ljs@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 4/18] mm/cow_context.c:102 __dynarray_dup()
 warn: variable dereferenced before check 'arr' (see line 91)
Message-ID: <202605071712.tNPizmiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260507103508.VdZpBzN_rdKvObcSRLDkgzRP0S10hifHJMj_Mz4EYtU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 86c4a37b876ec7ed8a5b42d5c3f7b3c4b0bd5c03 [4/18] mm: add simple dynamic array implementation
config: arc-randconfig-r072-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071712.tNPizmiC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605071712.tNPizmiC-lkp@intel.com/

smatch warnings:
mm/cow_context.c:102 __dynarray_dup() warn: variable dereferenced before check 'arr' (see line 91)

vim +/arr +102 mm/cow_context.c

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   89  static struct dynarray *__dynarray_dup(struct dynarray *arr, int cap, gfp_t gfp)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   90  {
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  @91  	const int nr = __dynarray_nr(arr);
                                                                                     ^^^
Dereference

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   92  	struct dynarray *ret;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   93  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   94  	ret = kmalloc_flex(*arr, contents, cap, gfp);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   95  	if (!ret)
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   96  		return NULL;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   97  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   98  	/* Just allocated, safe to assign. */
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01   99  	ret->nr = nr;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  100  	ret->cap = cap;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  101  
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01 @102  	if (arr)
                                                            ^^^
Checked too late.

86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  103  		memcpy(ret->contents, arr->contents, sizeof(void *) * nr);
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  104  	return ret;
86c4a37b876ec7e Lorenzo Stoakes 2026-05-01  105  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

