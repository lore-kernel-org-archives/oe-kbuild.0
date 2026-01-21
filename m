Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513047AF5F
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985909; cv=none; b=j13wJNqB14dI5wK4tpqfLp/oaBJpUTs5NXjXm0AE+a6ii81udiplXUr7FXLNpnz98Zcyj1dTO60cWWEbKn4U4BTd3rkQentPR9b2L9gMGoMykwCCQ5b0rnzVb/W4kJ1EFY7Tvfj1zd/lgP09iw8DVmXF6GuIZFGbiaXq0VUqG1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985909; c=relaxed/simple;
	bh=nRNveS2MaO6bMX9fxvOOdKwYjrNkmfpz0QY5vX0nE78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lE1z7hzh4PdBrklWE6iL1QMd4PBWmS2w2Q/PGhyocmroAzuf+L0ahLd5OpGL7hlaReFPARXfXFrcT+ECZGQ0WWyoSUyuyAVCUMF7bdn58dFlwf0PRf0D0kfVZTzNVw05AulfvFQrejmL0pQnBHo0a0vf2mtyQQ6g7L4oL635DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oAiR/lrB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oAiR/lrB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso52495995e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 00:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768985905; x=1769590705; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4X8dMKetrdNmqKhKcHZ5SlhB98c1MkwzIAdKHbK4l8=;
        b=oAiR/lrBQ64WLvkYzg1wOedWY37TYs8MiMXrPzKalfzrOJe/kGFTKKtQ2Yz9arg52T
         2LiJc31Es+TTJoKiswEVxcq1RgQXYyTM5+oDMaBAuSC1rPR6YKrWo0m5NxR8vMR38JH/
         N8M6m3NZWHho3h5Do2PGA/CcHHCKQi2XW7TfBlMh8Tn65p/W1XvOY9DxAb/WstBjIToe
         jfAP7/vlhHLEcMzCGn75Cs8njXHIwyX2/NjxxrXdoTTuwybN8tiiAXYgBvybgxwjX7U7
         kgQahTEE+7ppawRnJnN9CAprLmdcZ3j4UcUzHaHTIAegHM2yoT/4FHoDMD7TUfdATrlU
         i9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985905; x=1769590705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4X8dMKetrdNmqKhKcHZ5SlhB98c1MkwzIAdKHbK4l8=;
        b=iBTHIQs4SSM506ZxPV/F6BFaAqNsPAEOQe+Y/HsFso8gK9EGnOTyPk86tgoPq/L3zI
         MW1Wt4CjI3r+STnSVLskCtzOewwegXyyewfo0d3fqim2Rf0JnSLw11FmfAUNgqmj5dtq
         hQzK0KyJKHNDOQFQ/71k2OTh1lUqj8vCry8lu0uJ/8MffZiJJ+W+HBgE/VC2+BYNjRYZ
         oCn3NioA53xvnQLpTibLMU6OP0kD2vLcNHZi3203raDgoUUfIJEKLm9o3dT/fRaPZOCo
         XtvGcKw7j2BAbhEfLz5tu/uJr0ndb6J8qrfiUNh3w8DkhJAzqY7RvtSQWLqW2JPnzIfh
         1WZg==
X-Gm-Message-State: AOJu0YydK3U9/UQHqQfF0pydKHwCZWBP8HDNRsvfb5MpZQQTu8Gu80RX
	u7dcq4wdWzZ5jh8ov7bXCyh0peO/akq/kVRlPrr5uGkWmm12WPMaWTyew9v3BthdWOk1A9Mjs6f
	lCu5n3y1HPg==
X-Gm-Gg: AZuq6aIzG1HrANgkgF4sOcwaCcPoaYfSW7sJNCGYyzx0cpp2l3MA0MtCyEfndysVK/w
	pEEFY4/Lu9Lfg4qk7CCDqLvnmhSRrqPEgk+PX4FMl9C5570I8nI1qm4F44N3r/lufe+QZ6g0Uk1
	MS6jZ/ltIo7epx31lDf7WmdcU8YrO1sds3wG+lIS/BqAhtuOMbmZtEh3oNgzCAF1ey2aSpDwvTU
	kdfn1mrGV7JiaY0v/mmzg+Gketifu4K3vCj/N+Ry3LKt7Kyg42WMe/Co+h8vtaFa94HadWzPLI3
	P2pS5g6PjqQnZ8AHvz6c1VuKH/duNApi1byh5SWbf4iCt3I1uwa9Q9h/wTEeHWLgLnhIMsBu7LA
	dvEUIBCuLeHkz5SBloZzYi+t9BAbxsnB4bm7E88NAJof/MMUD+gSHdzQS1XkHYuvQPtRtbYTiVB
	N8Vv5RIyHwIycNF8vUinWQpZ5pVNo=
X-Received: by 2002:a05:600c:8011:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-4803e801e7dmr62810625e9.35.1768985905121;
        Wed, 21 Jan 2026 00:58:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804252b02dsm17027785e9.5.2026.01.21.00.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:58:24 -0800 (PST)
Date: Wed, 21 Jan 2026 11:58:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn:
 missing error code 'err'
Message-ID: <202601211636.IRaejjdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260121085820.MyW2voGZlIDGEkkYfuDgoaDzQDGIocuNbH6zUyLvO5M@z>

Hi Pasha,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c790212c588fddeb0d852f2790840753bb604b1
commit: 48a1b2321d763b5edeaf20bd4576d8c4b5df772b liveupdate: kho: move to kernel/liveupdate
config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.IRaejjdw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/

smatch warnings:
kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +994 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   960) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   961) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   962) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   963) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   964) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   965) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   966) 	int err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   967) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   968) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   969) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   970) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   971) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   972) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   973) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   974) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   975) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   976) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   977) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   978) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   979) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   980) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   981) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   982) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   983) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   984) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   985) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   986) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   987) 		if (err)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   988) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   989) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   990) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   991) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   992) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   993) 			if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  @994) 				goto err_free;

err = -ENOMEM;

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   995) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   996) 		}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   997) 	}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   998) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   999) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1000) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1001) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1002) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1003) 	return 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1004) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1005) err_free:
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1006) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1007) 	return err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1008) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

