Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF072628
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616306; cv=none; b=lq3EZzhsYy0kImt59Y2I/EmTaytClb5JXKbeUo1f55fg3gEenRbPL7wFRAmBSj6xHi0TGV9c+Qx5YXCuN24G0zRyB118QJBv2sgaa51iadcn0Zw8EPbnWn2Em4MOOZeX+eoOjXVGhtUrgRRtNI6xM8ZM0uQ2IPAekES5Zo3Z7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616306; c=relaxed/simple;
	bh=O7T7lURmPzlyhlz2lQ5rfia6zH9kBYDQv5+Igz+urG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPAOLFxoc73+ixEAYwiI8GbAArIa6whhxYDLKbNKrJo20FlV5pZzVK7EjSwX57GXh64m4rFo9TNZTELnxerZB64lo3y4BS8ZfNa4jIhSrxb27/omXWez8HKf11nkyQi2hTDF0Mv4CvjTvBb+7ruGCKrEzRqAjsUWQQJE8VAB+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyDMhj1a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyDMhj1a"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso6082746f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 07 May 2025 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746616301; x=1747221101; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixwft/rRHcnE7vrEwrCxcGZPZGqd0iNXvgYvekcku+k=;
        b=zyDMhj1aJdUz41enXg9uHTn/DUaqeohBFZRsQQZ4dM2TlBM1Jfoln2+Pzb2LVKRFOf
         j5gJu///Q92VRpEIuldUnxzFj+5XyH7iOng7aC4+7HTpQpunjbHVriUxCY+n3Jd5p6ew
         m3TNHCPfgATbDMAj0NF1CBVMe3zt4CFGaKDGhLGI9lis9zBJM/1hn/UXL7irXL5dALf9
         HVDawqu6ARHYSZX39x6pBdKsVvJAgT77B9N0J1kiJXjSo91diwUn/mJM9wSaD2TAlm+h
         fz2XsFbjhlc6bnyBQS/fE+1y9MQrXOEFQPQ4E9fleZptz2kZVV8fXC/JRviKw5ElY5df
         8uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616301; x=1747221101;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixwft/rRHcnE7vrEwrCxcGZPZGqd0iNXvgYvekcku+k=;
        b=kyqRP7HXdH+FycJD74nqPvd/IkFwRrXwrau3yLHJxoL4DKRjDnT7GCqebvq+QAyMGn
         njcKtqLtPB/+90HUI1IDC8W/O8oOg1X+CNeYw+Qa0OZP/3tHnkOjsPekiN/V4p5LuRt8
         OR5f1q0dFe0yTaZuQzjppx3fCu0AGUlCwEtwB7ug/4MfP9wPTIMz0E5WWCl0WNLFfaQ2
         2ZOsKNXuCtXehtXO//6D8YBIcqLo5wKQQQngrqrdCJC7dezB7lM3cNaEviVjiJrUFa9r
         ollDYORBHu5scwsL9o3taJg5y8Lq9bNIJdlX8fx1ZnZWWIDZhaXpo8CWuOMGCF6xiPya
         6yfA==
X-Gm-Message-State: AOJu0YwaDzekdHiKxcKX7ONJZID2epe+X+nxfDq3aImUhqDdL3SqlTau
	WtJJF9Bar1jBg73DEyXg4Uw2w/K/Nh672ZaPdWsRYUeCZkO2OwOMl8mSat0kHUnBfTM/wgnyc/J
	W
X-Gm-Gg: ASbGncuL3OUplBrfCMd0fxN/uoboGEadAngU3VZ/vwPvndEZt2tgbpKch+jz8snnDyj
	edhW0ZIjgSBNir2KCffuiExCYnbAaw4LGg+dGfRXDGwvHxDpld2JWSBAI0CQQrDeKOKTvpTgVR9
	xz/6tUgy8AjBHnEkFlAhg2GyvwiGx+YZcCatz/ouxu1Zo6d5aHRT4WmFhzHTRW9cDWHgRwojgd0
	0NJCkb6v3aMo0DRWbfknjZcoQSRqtqu/FAnbkzmJ6mBaWKYWf1HLwQay0KcdEcRjB9NtpuZkFWq
	nsxlSIqFy7tEbX7uVwxfLPDvZ9kcIyqYjkMixNp0oc5oMA==
X-Google-Smtp-Source: AGHT+IHdeEC4ULtNZiSQLIW/WZraK7DAmPtaYRcs3Y6BdK2zeWsY8QWGYwu/gFJBVlqAslMuVCnFBA==
X-Received: by 2002:a05:6000:1445:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-3a0b4a105abmr2600950f8f.57.1746616301552;
        Wed, 07 May 2025 04:11:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b350f604sm3137441f8f.21.2025.05.07.04.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:11:41 -0700 (PDT)
Date: Wed, 7 May 2025 14:11:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shivank Garg <shivankg@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
Message-ID: <202505071850.XaOkcCkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250507111137.4rXZ4Xcr3P278T0ToJqsK623AHfzfoufXFvhyD-OR0Y@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 39ed4d1a0e03ce3ac2145ee7ef0714c78bae9c61 [7893/8235] jfs: implement migrate_folio for jfs_metapage_aops
config: i386-randconfig-141-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071850.XaOkcCkX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505071850.XaOkcCkX-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_metapage.c:245 __metapage_migrate_folio() error: we previously assumed 'mp' could be null (see line 235)

vim +/mp +245 fs/jfs/jfs_metapage.c

39ed4d1a0e03ce Shivank Garg  2025-04-30  227  static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
39ed4d1a0e03ce Shivank Garg  2025-04-30  228  				    struct folio *src, enum migrate_mode mode)
39ed4d1a0e03ce Shivank Garg  2025-04-30  229  {
39ed4d1a0e03ce Shivank Garg  2025-04-30  230  	struct metapage *mp;
39ed4d1a0e03ce Shivank Garg  2025-04-30  231  	int page_offset;
39ed4d1a0e03ce Shivank Garg  2025-04-30  232  	int rc;
39ed4d1a0e03ce Shivank Garg  2025-04-30  233  
39ed4d1a0e03ce Shivank Garg  2025-04-30  234  	mp = folio_to_mp(src, 0);
39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
                                                    ^^
If mp is NULL

39ed4d1a0e03ce Shivank Garg  2025-04-30  236  		return -EAGAIN;
39ed4d1a0e03ce Shivank Garg  2025-04-30  237  
39ed4d1a0e03ce Shivank Garg  2025-04-30  238  	rc = filemap_migrate_folio(mapping, dst, src, mode);
39ed4d1a0e03ce Shivank Garg  2025-04-30  239  	if (rc != MIGRATEPAGE_SUCCESS)
39ed4d1a0e03ce Shivank Garg  2025-04-30  240  		return rc;
39ed4d1a0e03ce Shivank Garg  2025-04-30  241  
39ed4d1a0e03ce Shivank Garg  2025-04-30  242  	if (unlikely(insert_metapage(dst, mp)))
39ed4d1a0e03ce Shivank Garg  2025-04-30  243  		return -EAGAIN;
39ed4d1a0e03ce Shivank Garg  2025-04-30  244  
39ed4d1a0e03ce Shivank Garg  2025-04-30 @245  	page_offset = mp->data - folio_address(src);
                                                              ^^
Then this will crash.

39ed4d1a0e03ce Shivank Garg  2025-04-30  246  	mp->data = folio_address(dst) + page_offset;
39ed4d1a0e03ce Shivank Garg  2025-04-30  247  	mp->folio = dst;
39ed4d1a0e03ce Shivank Garg  2025-04-30  248  	remove_metapage(src, mp);
39ed4d1a0e03ce Shivank Garg  2025-04-30  249  
39ed4d1a0e03ce Shivank Garg  2025-04-30  250  	return MIGRATEPAGE_SUCCESS;
39ed4d1a0e03ce Shivank Garg  2025-04-30  251  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

