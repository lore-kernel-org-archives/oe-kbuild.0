Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4841CC880
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 20:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630365; cv=none; b=H3xZOLMTIKcCgztnOlTiW8b0EqCba1lTudsvpDojlbcX+kZTIvUb8ciq8kzqg1g0K3iy77DhTACU00z8SBvM2wy7q1TqgJ/PnN4///lhoGtz+9m+Awo67aOcHm8D4Ml4O8er2YgqJ1nm0Dm74NoCczd3VOzJDGBFg62+9fVQmOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630365; c=relaxed/simple;
	bh=U3rKvqLYrU17CnpvwCOY9tC1Wc0auZrdJPAFKphHmds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dox+lN7gQK6Gcrs0e5Od/9gg4kH6cpO9kG7ZDMXWKts/KZBY5Zty0ILfLz9z2NOlTcLUxSFYhvNs/QF3MNYaiIXh60m/egTrZ1Oiyu6cqGesli+Jiy9lGUXSz69lDgrbG8w8YsaAagGka3wQbFuUA19mjjMjtCKc4bTAAwvIujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9u9FNvF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9u9FNvF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso60305915e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 13:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729630361; x=1730235161; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUAcUW24njjn+XrN6mOIm7m9zPxXv5JZOuaBqXkJE/o=;
        b=i9u9FNvFOU00Kezb5VgBZUX/xRcBfNph+XRIlfkmPfea5LrAnh7C0jvy0LfNbOQ+1Z
         AuI4lOgXY4uIR3pn7fdVGoQfu7OFBTUbxhc/twm964YJ1ARU37ctJbK9advMC9dooQCK
         q4BYiPVFqdxptKqaVZe5DVYm/5mOb1/Gnwyv4glXcQAU2UWNc1eIW8dh5LdwFjx6iIiH
         5C8Sy4Ntq4kPX01c2KnN/nBzYM1S1kvZTdXwHiuz9hrWfMNYCu1YA/p+YXmBeddkLikD
         skNcc+uyHKI2VqH5E5ZU2bRhhYEhGiZRQ6W0le2xTQF9oAmnJG332QlvaCnpNEsFVWuQ
         YZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630361; x=1730235161;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUAcUW24njjn+XrN6mOIm7m9zPxXv5JZOuaBqXkJE/o=;
        b=CP4PO7TytxUBg6CGPTlMk5G09cWREW9CgQLPDJtKcQ/z0oi5OJv6j1Gzy/tHDH1caq
         v3iqcNkSEVn6ejxOUuZimD4PuLC2jBb5vCrhjoU9cR9jOo0FzDizVvizV0P+UySoQt2w
         ArVdjhtGz2GoBNPKoXH3ORYlsemPw42V+x81WrokYTp3ENEso2HaAHxrqhH9fJoNHzk5
         1IwFYqeNiY65Bo8gzH4/qlqIaz0nYlj2xNjEaqQsHGGIUNq5ZnXb6RjLhq68Td+VwGZ+
         6AZhqD6aFDaRBkFv5gCTgVs+tJ8VjJutjdQLPx835q3jbRJ7/x0zupjiLqeVL3xnqJte
         4nYg==
X-Gm-Message-State: AOJu0Yy5HrHaSYMrqC42Ga6ns/ILEdE5QOqy24L3L3wYlud0YYSGJHlF
	J0JYVudxWS+mYDqEc78Bdv2EpfqLVMWSvqPPEmHvg9NTubR1phJPrFRaRb1AlvjirlLKOJ9nBvU
	uwdc=
X-Google-Smtp-Source: AGHT+IECBvkH3BCoyj6ByZPNuhscJZaEF7nR00mX/vf+rCWpImRlEcUIlw//M8n181HmRnNRuQdEPQ==
X-Received: by 2002:a05:600c:1c03:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-4318424eb98mr3692595e9.24.1729630361350;
        Tue, 22 Oct 2024 13:52:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fe00sm98868615e9.20.2024.10.22.13.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:52:40 -0700 (PDT)
Date: Tue, 22 Oct 2024 23:52:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:test-for-next 78/86] fs/btrfs/subpage.c:332
 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 326)
Message-ID: <fee3fa59-82b9-44b4-aec9-f4680aa8c365@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git test-for-next
head:   bf6531230d457f76c7eaef675bf4364634701ce4
commit: 8a1e6576deee2baede43827c092b3b183687a9e7 [78/86] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
config: i386-randconfig-141-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230432.QbEXhcm1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410230432.QbEXhcm1-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 326)

vim +/fs_info +332 fs/btrfs/subpage.c
1e1de38792e0ae Qu Wenruo 2021-05-31  321  
8a1e6576deee2b Qu Wenruo 2024-10-09  322  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
bd610c0937aaf0 Qu Wenruo 2024-09-02  323  				 struct folio *folio, unsigned long bitmap)
bd610c0937aaf0 Qu Wenruo 2024-09-02  324  {
bd610c0937aaf0 Qu Wenruo 2024-09-02  325  	struct btrfs_subpage *subpage = folio_get_private(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02 @326  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

bd610c0937aaf0 Qu Wenruo 2024-09-02  327  	unsigned long flags;
bd610c0937aaf0 Qu Wenruo 2024-09-02  328  	bool last = false;
bd610c0937aaf0 Qu Wenruo 2024-09-02  329  	int cleared = 0;
bd610c0937aaf0 Qu Wenruo 2024-09-02  330  	int bit;
bd610c0937aaf0 Qu Wenruo 2024-09-02  331  
bd610c0937aaf0 Qu Wenruo 2024-09-02 @332  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
                                                             ^^^^^^^^
Checked too late.

bd610c0937aaf0 Qu Wenruo 2024-09-02  333  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  334  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  335  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  336  
8a1e6576deee2b Qu Wenruo 2024-10-09  337  	if (atomic_read(&subpage->nr_locked) == 0) {
8a1e6576deee2b Qu Wenruo 2024-10-09  338  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf0 Qu Wenruo 2024-09-02  339  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  340  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  341  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  342  
bd610c0937aaf0 Qu Wenruo 2024-09-02  343  	spin_lock_irqsave(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  344  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
bd610c0937aaf0 Qu Wenruo 2024-09-02  345  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
bd610c0937aaf0 Qu Wenruo 2024-09-02  346  			cleared++;
bd610c0937aaf0 Qu Wenruo 2024-09-02  347  	}
8a1e6576deee2b Qu Wenruo 2024-10-09  348  	ASSERT(atomic_read(&subpage->nr_locked) >= cleared);
8a1e6576deee2b Qu Wenruo 2024-10-09  349  	last = atomic_sub_and_test(cleared, &subpage->nr_locked);
bd610c0937aaf0 Qu Wenruo 2024-09-02  350  	spin_unlock_irqrestore(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  351  	if (last)
bd610c0937aaf0 Qu Wenruo 2024-09-02  352  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  353  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

