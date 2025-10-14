Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68820272816
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429766; cv=none; b=M/uRMckGNeTw6apTVw/Gqcc60mRsVbSYlz+AfMtBV7znamU3yz2+l5WhrYoJohHwzeJRUHBfN0MgRrOk4qygr1/BcwwlLQZS+ddbp3g6yk56LREuvJZb/AUw6UEcT9hCxOGSfqLLYa9SC7+uK9XjA1YXfc11eBmzgbGoe86aWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429766; c=relaxed/simple;
	bh=IS9JNZKpTFhkcU7bsV2BgbeEVETE/nyzALetZrxp9pI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omLuILv98lv3aGTAt5aRXwDwpOY7dmJmPNEYXrkM6Mk+4s8LHTh8UMVgQYgK+OdS2z3t6UEOMwY0iPJ1T3u69P28FgPexkGM9mhJM1NSUL4JfzALBd9TVv/yC70JRoCxYgIquJZDScvMF/5cVK6hiwUZEI7XFBWQ7OAQcts6Vt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IuUs+ud5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuUs+ud5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e29d65728so29836685e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 01:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760429761; x=1761034561; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyVJ9F0sPkvb6d9V8yvLooHwZ3md82CKflBoPN1xb5Y=;
        b=IuUs+ud51T0qqjr4h3iq6Gvl+qIWky5wZ/WUItzWgKldm14AL74MN+vlMNTsYLee8o
         yYCDHf3hPn0odJPdDsvIrD4WHY1xnYstXGvV7HzTShjrY9NyCquRgkPgKueOPDV+XlEy
         25vQswYwU6cMa3eGleYOFpKsTQSxo1gl+VOlZi2q7YpA2CwdqM+sfAGCnPX8j8Sixgah
         akKaPPCAcb6CJSbYTaHXTm+5TxBEbctlXS4u2uXA1q0WlpR5cauvHU2ddZi0RwDua2YA
         cn4dPgKLX5DezPSvATMcBV/1WeKqAX+p7bWcD0Ddnfom5dmvLv4pomjAyizRYbPsF7qD
         O3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429761; x=1761034561;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyVJ9F0sPkvb6d9V8yvLooHwZ3md82CKflBoPN1xb5Y=;
        b=cEE4NUuXzNWR71N3jgdxr9h3JZu5+Gos+SE15Tzdxvwmy6KCgtL7PSlFL8AAVu4Z02
         17X5+m0RT0ytctpzQZU2nF7ITysPZ3sBw83076SBunVHmpXgc4Dul1gJANAGL9umacJB
         95OGqWTJo71k53/ZF3KeaZJAC0g0KNNKa/fiOVt/9G3ZADcKcxDdAIyIy1ZaMSx3w/RH
         e58wKCfjKp9QAm/TBrvOo/QbgxpPXOoXJ7SGititYzjazpZqHJ0BaENveuBBLy3TDRHO
         3rAFAyY4az/0ytXsWqs/fwdV84wQPXanm7kvwOgM8kxf0N8r86zVUdHYqy7pBFML9N1P
         r4og==
X-Gm-Message-State: AOJu0YwGXtMsq2DiuNuR0KtIxAeFAgZdR0rtdBsiogV8yPfj7lOv4oS4
	50YzU/Tv7OAWScVrTpu7UcIlGDDv1rk7TB6Q1tv8Jbz7W+4QxbMCkuyKfTP8BXywrMD5F2megHd
	QCtgx
X-Gm-Gg: ASbGncucSjuZBvkghIOahB863UMV0idSkTSn3/HrooiCzJYZssNiCjhzf8Ukq7Gdl+z
	F6OJkrnR999jbb+TERRXYWj8/HmALa2Ew0HGqCzQ7ewaYzwNobSXM3xmDGJSPCDwtMasVeT5R3A
	PXb9PIgnCEp4qJ/M/Lg3mzUZLkJ3ZgWA1eF2Nflcwek1kgutugZa8vad65+RnzuQKQNXT31nGmU
	KtZYQLUyc1OLnrF7ajAOeSZzJn6tVdY2fg/m6/HM4SilNsYC4wWBY5FUCrtw5PkiUwHFyn68mVe
	HZapRxEQWDVg7l1uuj6ovei0TKphPrfxYyMEFkMqfRDk/onIBm68K5yW/vH+EQ4sFevy0d9GnWU
	QMxwQkZ9HdkM0SF+CRSo02LJbff+f1CMZjQ8Qrd9jGWJ65uCNEe4=
X-Google-Smtp-Source: AGHT+IEmRqbCSKEmZNfKWDxZ8G3ZB8/M2f4+Xn4uL3VJmZBukjyvTnhQ7J09DzuK9UCi1D9bEFsC1g==
X-Received: by 2002:a05:600c:1d11:b0:46e:5aca:3d26 with SMTP id 5b1f17b1804b1-46fa9aef840mr173171105e9.22.1760429761023;
        Tue, 14 Oct 2025 01:16:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb4982b30sm224831925e9.6.2025.10.14.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:16:00 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:15:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 13427/13588]
 kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing
 error code 'err'
Message-ID: <202510100941.GZGMq64U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251014081556.LS2-E_XeYpryTCJadMDdKbgONNGMC1ZCz26xcIMKrhk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
commit: f13bb574707674d1113a40e0b6dc4d9a143d2ec1 [13427/13588] liveupdate: kho: move to kernel/liveupdate
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100941.GZGMq64U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510100941.GZGMq64U-lkp@intel.com/

smatch warnings:
kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +978 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  944) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  945) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  946) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  947) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  948) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  949) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  950) 	int err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  951) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  952) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  953) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  954) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  955) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  956) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  957) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  958) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  959) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  960) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  961) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  962) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  963) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  964) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  965) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  966) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  967) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  968) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  969) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  970) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  971) 		if (err)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  972) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  973) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  974) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  975) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  976) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  977) 			if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21 @978) 				goto err_free;

err = -ENOMEM;

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  979) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  980) 		}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  981) 	}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  982) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  983) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  984) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  985) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  986) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  987) 	return 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  988) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  989) err_free:
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  990) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  991) 	return err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  992) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

