Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ABA1E5B9D
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147106; cv=none; b=JHHJnyBxuloWhite+FrJuhI7yNUlb8cZUCAszZgj017mIOhxjtQ11LftFnLRThHpEHBbogUv7Ozl9upSaii+WjZeEJrGp3XDNsqd2UT/EomUa0V3yJMcFvQ7LsyNrwSHyzkaZFHp2rGvzNgCgEFl91dImlGOWSQGCyvTBT89diM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147106; c=relaxed/simple;
	bh=W4iM/prlPhxEGSomxxf3DcBMCZYpDfHGzwjarEdqCIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umwUs+csVeib1DCB0okVWpUGvz9ImmEJ2v1BY21L3e0NIqZSx9pAVExs04EjgKLiJ+hNIjBliC8qzkKuGCz3GNlvxo7BZWuHY6D4MZSBojfVU6KszcZ/hNmi9eV29B5mYGUYttavk6JInDpW64lmlNxHMQHkTVHIVEMiX/ll890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0qv6vqO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0qv6vqO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b291093fso4249017f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747147103; x=1747751903; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqRKb7ngH3ntLnw87YWN+YBlBs4u08NQKjb6q0IBoZg=;
        b=s0qv6vqOKIs7cdJeAqzo4ECrET9Q/mTQtTXbWL2tqXcQlkyUPMqIXdaw3eh07vJa/j
         qzBwA5jABA+XStPU6CeBpQpbp8ihYUmzwAJWhKJtcsUPjUAtImkNjt5WMnKWjUS7Jtqi
         vOt8OfIuDQEXui7tjPYifDKY9+3x6UD4OfHceqSWo71pv+gcDYwqsjLv0I5L77UTsZL6
         hzqX/4PER/Mv8xayWiyWLjuUQIgNvyvWiddaS84t8mNNSbvK+jSVNifqz+QuzG2jwGNx
         xiyCjCUQQ4eH4p49t1WOGNQk54bEBWB+YxlTf2xomjA/jpNNaDkuMG2cit8ucFIo/Nkq
         ZmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147103; x=1747751903;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqRKb7ngH3ntLnw87YWN+YBlBs4u08NQKjb6q0IBoZg=;
        b=ux4gZXTwL9Zat8tu+hIJRwelE/s+pRPWqwCVZuUMInW1wzOr6xo74BIfftUO+/BlFX
         oo48MQYypJCiQ17pq5IHQTnqqx48CD0uTcO5pI5C21za0KeL3ANX4wczLqWr/F8AmIcA
         uxxSWmoAFDHuaaYw2NEuvC2hxmPQMUyxrTJ2MC7NVavX2AVg7FhXkByBrIQu+dFELuQa
         15x484iU9uhbVWRbFWQEhEF9PxQYJZYmO/h8NyKiGfY2FTTUl/7nX249YPpz7YJOFURq
         pvXXtR31VMQSu6fNEE6LW1O1r5QpojG4dULPe8BNzXYY+ydKCeyZ/Pf8XWptx3G5DFBZ
         CEhQ==
X-Gm-Message-State: AOJu0YxYucr3y1ZwtECljgeiKj7m9DmyZ7I3fmJ+4xi3Ycew/NeKkrq/
	A0mbZPDHYgjyIFb11AkHCn0fg1SbY+JL+46tHkbFE24R2jWf5b7AD6vwtV/n8qjDfk7mQSMFrQl
	wb978Eg==
X-Gm-Gg: ASbGncsSnfmWFRcaS/LtmtkHey5xmcAJ1Wb5tpx8PKrEs9b77/Eforw5+TTOkJKu1UO
	aarEg+Kk1bjCwr8rJcm5k2x1zEO+iDASyLDxxW5mE0XxFmd+AxAKMo1hilqonGijaApouazilYr
	2OU5AUfqOlZYCTxlrS1SJ52mZxxwhsxaqY68aSGlCiyoIZbjB9RCQJiD0BY5T97G8kngjFgRg5A
	7SLF2grRu8zyveRiE3ivEdW6p/LDO0uok9n47eM/n5dwljTmQ/JShQFsWojmEMxrXmQusMxEJcD
	Hr/z7jG3OBhufRAqyU83IyHMgIKU+oYq9G0AHZv2iWHYXOkXOkSyWxoBpnGUV6GqjNfciOgpHnt
	1YqYB0Q==
X-Google-Smtp-Source: AGHT+IEUqSemEdzKu4pnmG//NeUfgyzzj+7NjQMrdsDA+9dSpSvRry26837zLtZcLCYlPTMamRR8jA==
X-Received: by 2002:adf:f2c4:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3a340d22fc1mr3010847f8f.23.1747147102819;
        Tue, 13 May 2025 07:38:22 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d21esm16703967f8f.99.2025.05.13.07.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:38:22 -0700 (PDT)
Date: Tue, 13 May 2025 17:38:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Graf <graf@amazon.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kexec-cma 1/2] kernel/kexec_core.c:801
 kimage_load_normal_segment() error: uninitialized symbol 'result'.
Message-ID: <8f74c790-0241-408e-be1f-d55a083e4447@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kexec-cma
head:   752619bbe38c535612b1a9e5b47ea7d962c63449
commit: 1e91ce490239e53ac0b4ad9aea3ebed48d1edf51 [1/2] kexec: Use CMA
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505111109.zkW7PHWQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505111109.zkW7PHWQ-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:801 kimage_load_normal_segment() error: uninitialized symbol 'result'.

vim +/result +801 kernel/kexec_core.c

2965faa5e03d1e Dave Young            2015-09-09  734  static int kimage_load_normal_segment(struct kimage *image,
2965faa5e03d1e Dave Young            2015-09-09  735  					 struct kexec_segment *segment)
2965faa5e03d1e Dave Young            2015-09-09  736  {
2965faa5e03d1e Dave Young            2015-09-09  737  	unsigned long maddr;
2965faa5e03d1e Dave Young            2015-09-09  738  	size_t ubytes, mbytes;
2965faa5e03d1e Dave Young            2015-09-09  739  	int result;
2965faa5e03d1e Dave Young            2015-09-09  740  	unsigned char __user *buf = NULL;
2965faa5e03d1e Dave Young            2015-09-09  741  	unsigned char *kbuf = NULL;
1e91ce490239e5 Alexander Graf        2025-05-09  742  	bool dest_intact = false;
2965faa5e03d1e Dave Young            2015-09-09  743  
2965faa5e03d1e Dave Young            2015-09-09  744  	if (image->file_mode)
2965faa5e03d1e Dave Young            2015-09-09  745  		kbuf = segment->kbuf;
2965faa5e03d1e Dave Young            2015-09-09  746  	else
2965faa5e03d1e Dave Young            2015-09-09  747  		buf = segment->buf;
2965faa5e03d1e Dave Young            2015-09-09  748  	ubytes = segment->bufsz;
2965faa5e03d1e Dave Young            2015-09-09  749  	mbytes = segment->memsz;
2965faa5e03d1e Dave Young            2015-09-09  750  	maddr = segment->mem;
2965faa5e03d1e Dave Young            2015-09-09  751  
2965faa5e03d1e Dave Young            2015-09-09  752  	while (mbytes) {
2965faa5e03d1e Dave Young            2015-09-09  753  		struct page *page;
2965faa5e03d1e Dave Young            2015-09-09  754  		char *ptr;
2965faa5e03d1e Dave Young            2015-09-09  755  		size_t uchunk, mchunk;
2965faa5e03d1e Dave Young            2015-09-09  756  
2965faa5e03d1e Dave Young            2015-09-09  757  		page = kimage_alloc_page(image, GFP_HIGHUSER, maddr);
2965faa5e03d1e Dave Young            2015-09-09  758  		if (!page) {
2965faa5e03d1e Dave Young            2015-09-09  759  			result  = -ENOMEM;
2965faa5e03d1e Dave Young            2015-09-09  760  			goto out;
2965faa5e03d1e Dave Young            2015-09-09  761  		}
1e91ce490239e5 Alexander Graf        2025-05-09  762  
1e91ce490239e5 Alexander Graf        2025-05-09  763  		/* Add page to copy list if it's not already in place */
1e91ce490239e5 Alexander Graf        2025-05-09  764  		if (page_to_boot_pfn(page) << PAGE_SHIFT != maddr) {
1e91ce490239e5 Alexander Graf        2025-05-09  765  			if (!dest_intact) {
1e91ce490239e5 Alexander Graf        2025-05-09  766  				result = kimage_set_destination(image, maddr);
1e91ce490239e5 Alexander Graf        2025-05-09  767  				if (result < 0)
1e91ce490239e5 Alexander Graf        2025-05-09  768  					goto out;
1e91ce490239e5 Alexander Graf        2025-05-09  769  				dest_intact = true;
1e91ce490239e5 Alexander Graf        2025-05-09  770  			}
1e91ce490239e5 Alexander Graf        2025-05-09  771  
43546d8669d62d Russell King          2016-08-02  772  			result = kimage_add_page(image, page_to_boot_pfn(page)
2965faa5e03d1e Dave Young            2015-09-09  773  									<< PAGE_SHIFT);
2965faa5e03d1e Dave Young            2015-09-09  774  			if (result < 0)
2965faa5e03d1e Dave Young            2015-09-09  775  				goto out;
1e91ce490239e5 Alexander Graf        2025-05-09  776  		} else {
1e91ce490239e5 Alexander Graf        2025-05-09  777  			dest_intact = false;

result not set on this path.

1e91ce490239e5 Alexander Graf        2025-05-09  778  		}
2965faa5e03d1e Dave Young            2015-09-09  779  
948084f0f6959f Fabio M. De Francesco 2022-08-21  780  		ptr = kmap_local_page(page);
2965faa5e03d1e Dave Young            2015-09-09  781  		/* Start with a clear page */
2965faa5e03d1e Dave Young            2015-09-09  782  		clear_page(ptr);
2965faa5e03d1e Dave Young            2015-09-09  783  		ptr += maddr & ~PAGE_MASK;
2965faa5e03d1e Dave Young            2015-09-09  784  		mchunk = min_t(size_t, mbytes,
2965faa5e03d1e Dave Young            2015-09-09  785  				PAGE_SIZE - (maddr & ~PAGE_MASK));
2965faa5e03d1e Dave Young            2015-09-09  786  		uchunk = min(ubytes, mchunk);
2965faa5e03d1e Dave Young            2015-09-09  787  
4bb7be96fc8871 yang.zhang            2024-02-22  788  		if (uchunk) {
2965faa5e03d1e Dave Young            2015-09-09  789  			/* For file based kexec, source pages are in kernel memory */
2965faa5e03d1e Dave Young            2015-09-09  790  			if (image->file_mode)
2965faa5e03d1e Dave Young            2015-09-09  791  				memcpy(ptr, kbuf, uchunk);
2965faa5e03d1e Dave Young            2015-09-09  792  			else
2965faa5e03d1e Dave Young            2015-09-09  793  				result = copy_from_user(ptr, buf, uchunk);
4bb7be96fc8871 yang.zhang            2024-02-22  794  			ubytes -= uchunk;
4bb7be96fc8871 yang.zhang            2024-02-22  795  			if (image->file_mode)
4bb7be96fc8871 yang.zhang            2024-02-22  796  				kbuf += uchunk;
4bb7be96fc8871 yang.zhang            2024-02-22  797  			else
4bb7be96fc8871 yang.zhang            2024-02-22  798  				buf += uchunk;
4bb7be96fc8871 yang.zhang            2024-02-22  799  		}
948084f0f6959f Fabio M. De Francesco 2022-08-21  800  		kunmap_local(ptr);
2965faa5e03d1e Dave Young            2015-09-09 @801  		if (result) {
2965faa5e03d1e Dave Young            2015-09-09  802  			result = -EFAULT;
2965faa5e03d1e Dave Young            2015-09-09  803  			goto out;
2965faa5e03d1e Dave Young            2015-09-09  804  		}
2965faa5e03d1e Dave Young            2015-09-09  805  		maddr  += mchunk;
2965faa5e03d1e Dave Young            2015-09-09  806  		mbytes -= mchunk;
a8311f647e4196 Jarrett Farnitano     2018-06-14  807  
a8311f647e4196 Jarrett Farnitano     2018-06-14  808  		cond_resched();
2965faa5e03d1e Dave Young            2015-09-09  809  	}
2965faa5e03d1e Dave Young            2015-09-09  810  out:
2965faa5e03d1e Dave Young            2015-09-09  811  	return result;
2965faa5e03d1e Dave Young            2015-09-09  812  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

