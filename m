Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6319CC37
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741242934; cv=none; b=akqT6gW2oDt1nwx+roJHRGOF5Yg47oAF0JjiGIeZ3rWIqnDjv/han6qTbqu+VBEWB+ageDmq9FS8LRO8y2Uyoin/tP7ho/nX3ZH5iZpAZyeCmJAkwsd8YcsxkYvUNkW0/6GarBmaxCPG7VXX2OOXV+AoedWkwj5nRNOHk5q5pkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741242934; c=relaxed/simple;
	bh=OgVi8LZ/avO7r/TihguE885iMoKtcusZUL+VQwbS8dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hGHY/YE46NebRmjC4F084cob+VwGVvO0FkUakupD1Qi/GYvh38xGSwmba2uXvp72QXQ3tw5aA90rUtAbMIj2zddv/JnF5NuqC0mTxLuNHAjYGRDUVMr9N2Z9Yt/DQuQYhzuCNSyj4awduiONqbctFT9tGP0MGwyZxd7tMTmXIsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YY4uFkef; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YY4uFkef"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so1243665e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Mar 2025 22:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741242931; x=1741847731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mx4eXhc4yqpVhI7TdTQuRC9iguxZspH9NuwtaHcC+Lc=;
        b=YY4uFkefg+0M5M5ErCrvsABWResIc9nRvi3pdf8ys5T++pepvtIj48QFmm5Jyn0B3t
         QvxGWUDeRQb+YTzyFMlUHKrFwbUTOJMGOEJ5x5UXLqooWuevfSRvMZEJYKmJY+NilI6c
         lIC1H7t8hLGJEGc7w9ewADhAORXSY9RrjZpfp+IEWLQFJIDmb7hh+Vd3xDZ04SmmIKqQ
         KWyHTM5X0PdLisBjrchGY11yi3/n2e+Q8JT/oJCJOQPt5HIYYAd2252S9lKCO65umv9N
         8/rkW6Jq3XYW11cuz8PEvrswydm9E/kgjErMh9+8ZHHrUQMJbwGekvibjld2MKB+k1NS
         4ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741242931; x=1741847731;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mx4eXhc4yqpVhI7TdTQuRC9iguxZspH9NuwtaHcC+Lc=;
        b=TurycEzjDEx4pda4PzcguEd2FSoZUt1lfgs1CJOGXzWeqXn7ZaIWoCGbX8DwHySmTD
         MXCGNCCCCS13oW/vsRmiFSy8HphaZYTVfpFlzz2l3VJVAw7+OhjX/+X+N2YMfHtoNUSk
         4UXVy7JNglkK73Qj2Td0T+u3NMica1UAxpPMJSyU/r/zpYZfgcnIRFopp6NDrdS5doMS
         73/5ArWR3oksC9GIGwUBlRWMN/g41qSh1MJsUrxJBbeT/NEYlP8YNfybdt9Ggn/pOrcL
         VBuc/KWfrQ1UMxw0E5bl/VPtiPm3DSIZjjYjXsrv1JdCBduOrVS09eGWbGGM+Yht5zFh
         nJ0Q==
X-Gm-Message-State: AOJu0Yw91fh5sMRpCj0FUw0aCC16vvn38AouEKPtHPrpGBjCBSo4Jvg7
	Mh57eS5DVYc7iMnwlU4UKi+896xapPw0i2uw3JGvn/F1AwiB8mSKrn58zTxTjabBkWgBcyN164R
	S
X-Gm-Gg: ASbGncuBPF+0mHDni6TVPJY98QYYojBDcXMAiD7Xu1Yp2op6pLaXUy1pGHNj3Y69dD7
	IV2zURavAEJqpQYCqAflxnZ9kDsARdKa6ESSBhcz3V1zlHq7zqnh/vc6ooUUwIRTm1JLAm29Ce0
	1gOukEtAdcLb6Cdb7VV2vBQVs5lcdlQyRwpNqgAicKKT4vD+GgySZQ1aCOaXOWpRn00NgS4LqB7
	SZwfN46udo//TEi9SF133Nwxo6D88K5gIRsd/D7TQzj5LIi1L1GYW8uhzNLV19d6dmaYggF3edh
	LBeHpJymn9ROcJ+i5hGONRv0MIjtIiv8CkYGL+moLIiR87SxYg==
X-Google-Smtp-Source: AGHT+IEldEFBJ6GcJ/9AsmwidDi0MW22pFoTiX1DY3pYgmQW8PLpDd7QMPBO5UsdG2P8Z7W4b9nJlQ==
X-Received: by 2002:a05:600c:1551:b0:43b:cb0c:3556 with SMTP id 5b1f17b1804b1-43bd2af49cemr38379685e9.28.1741242930569;
        Wed, 05 Mar 2025 22:35:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8c314asm9415525e9.10.2025.03.05.22.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:35:30 -0800 (PST)
Date: Thu, 6 Mar 2025 09:35:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, steven chen <chenste@linux.microsoft.com>,
	zohar@linux.ibm.com, stefanb@linux.ibm.com,
	roberto.sassu@huaweicloud.com, roberto.sassu@huawei.com,
	eric.snowberg@oracle.com, ebiederm@xmission.com,
	paul@paul-moore.com, code@tyhicks.com, bauermann@kolabnow.com,
	linux-integrity@vger.kernel.org, kexec@lists.infradead.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	madvenka@linux.microsoft.com, nramas@linux.microsoft.com,
	James.Bottomley@hansenpartnership.com, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com
Subject: Re: [PATCH v9 2/7] kexec: define functions to map and unmap segments
Message-ID: <7bde870f-07eb-48a6-8b8d-edac57640775@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304190351.96975-3-chenste@linux.microsoft.com>

Hi steven,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/steven-chen/ima-copy-only-complete-measurement-records-across-kexec/20250305-031719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
patch link:    https://lore.kernel.org/r/20250304190351.96975-3-chenste%40linux.microsoft.com
patch subject: [PATCH v9 2/7] kexec: define functions to map and unmap segments
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061449.gbVGafZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503061449.gbVGafZc-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:896 kimage_map_segment() error: uninitialized symbol 'dest_page_addr'.

vim +/dest_page_addr +896 kernel/kexec_core.c

bf06eab7ae0f04 steven chen 2025-03-04  870  void *kimage_map_segment(struct kimage *image,
bf06eab7ae0f04 steven chen 2025-03-04  871  			 unsigned long addr, unsigned long size)
bf06eab7ae0f04 steven chen 2025-03-04  872  {
bf06eab7ae0f04 steven chen 2025-03-04  873  	unsigned long eaddr = addr + size;
bf06eab7ae0f04 steven chen 2025-03-04  874  	unsigned long src_page_addr, dest_page_addr;
bf06eab7ae0f04 steven chen 2025-03-04  875  	unsigned int npages;
bf06eab7ae0f04 steven chen 2025-03-04  876  	struct page **src_pages;
bf06eab7ae0f04 steven chen 2025-03-04  877  	int i;
bf06eab7ae0f04 steven chen 2025-03-04  878  	kimage_entry_t *ptr, entry;
bf06eab7ae0f04 steven chen 2025-03-04  879  	void *vaddr = NULL;
bf06eab7ae0f04 steven chen 2025-03-04  880  
bf06eab7ae0f04 steven chen 2025-03-04  881  	/*
bf06eab7ae0f04 steven chen 2025-03-04  882  	 * Collect the source pages and map them in a contiguous VA range.
bf06eab7ae0f04 steven chen 2025-03-04  883  	 */
bf06eab7ae0f04 steven chen 2025-03-04  884  	npages = PFN_UP(eaddr) - PFN_DOWN(addr);
bf06eab7ae0f04 steven chen 2025-03-04  885  	src_pages = kmalloc_array(npages, sizeof(*src_pages), GFP_KERNEL);
bf06eab7ae0f04 steven chen 2025-03-04  886  	if (!src_pages) {
bf06eab7ae0f04 steven chen 2025-03-04  887  		pr_err("Could not allocate ima pages array.\n");
bf06eab7ae0f04 steven chen 2025-03-04  888  		return NULL;
bf06eab7ae0f04 steven chen 2025-03-04  889  	}
bf06eab7ae0f04 steven chen 2025-03-04  890  
bf06eab7ae0f04 steven chen 2025-03-04  891  	i = 0;
bf06eab7ae0f04 steven chen 2025-03-04  892  	for_each_kimage_entry(image, ptr, entry) {
bf06eab7ae0f04 steven chen 2025-03-04  893  		if (entry & IND_DESTINATION) {
bf06eab7ae0f04 steven chen 2025-03-04  894  			dest_page_addr = entry & PAGE_MASK;

Is the first entry always IND_DESTINATION?

bf06eab7ae0f04 steven chen 2025-03-04  895  		} else if (entry & IND_SOURCE) {
bf06eab7ae0f04 steven chen 2025-03-04 @896  			if (dest_page_addr >= addr && dest_page_addr < eaddr) {
                                                                    ^^^^^^^^^^^^^^
otherwise this is uninitialized

bf06eab7ae0f04 steven chen 2025-03-04  897  				src_page_addr = entry & PAGE_MASK;
bf06eab7ae0f04 steven chen 2025-03-04  898  				src_pages[i++] =
bf06eab7ae0f04 steven chen 2025-03-04  899  					virt_to_page(__va(src_page_addr));
bf06eab7ae0f04 steven chen 2025-03-04  900  				if (i == npages)
bf06eab7ae0f04 steven chen 2025-03-04  901  					break;
bf06eab7ae0f04 steven chen 2025-03-04  902  				dest_page_addr += PAGE_SIZE;
bf06eab7ae0f04 steven chen 2025-03-04  903  			}
bf06eab7ae0f04 steven chen 2025-03-04  904  		}
bf06eab7ae0f04 steven chen 2025-03-04  905  	}
bf06eab7ae0f04 steven chen 2025-03-04  906  
bf06eab7ae0f04 steven chen 2025-03-04  907  	/* Sanity check. */
bf06eab7ae0f04 steven chen 2025-03-04  908  	WARN_ON(i < npages);
bf06eab7ae0f04 steven chen 2025-03-04  909  
bf06eab7ae0f04 steven chen 2025-03-04  910  	vaddr = vmap(src_pages, npages, VM_MAP, PAGE_KERNEL);
bf06eab7ae0f04 steven chen 2025-03-04  911  	kfree(src_pages);
bf06eab7ae0f04 steven chen 2025-03-04  912  
bf06eab7ae0f04 steven chen 2025-03-04  913  	if (!vaddr)
bf06eab7ae0f04 steven chen 2025-03-04  914  		pr_err("Could not map ima buffer.\n");
bf06eab7ae0f04 steven chen 2025-03-04  915  
bf06eab7ae0f04 steven chen 2025-03-04  916  	return vaddr;
bf06eab7ae0f04 steven chen 2025-03-04  917  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

