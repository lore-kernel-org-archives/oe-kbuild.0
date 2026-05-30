Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558E31E82F
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 08:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780128496; cv=none; b=J5tni2Y2Bge+jV/xA6IArLhKbL59AU5kmbFuWLK4Nx7xjQxa4NZDBIBEJWM9ekBxUu89EE/cP1KrowQESNLxxJZFYwcyyA0YrCmPQsyQE64hWt2buZEOpyeRjlMSuqnVK7Fdhn30FkBiA/fXmUSdubtBMMhySu3w7OIA2qor2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780128496; c=relaxed/simple;
	bh=rD9awX0RkN/CCtppCeTpHNOnh8YqYGtTq7A7y+jcBJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=V/GKMtWIHQI1EK12RuBgRKpUwXOB3H7Cw7KbPHs9TQWqAWKM4DAkxL096xMMxj0jK4ZbO1YF4RRPWtu2OdsaFwWEzMaSTb4ugftZb0PiG/BI27mrUkM+qIuEBHyNZ55FHG4gvjU7P/yrgtLhm+PMDCMD4LKLZQ/9XemxcoWPiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPJ+Ic3F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPJ+Ic3F"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso89493715e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780128494; x=1780733294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kH8Pl7SP8LWSHPvqI1Gh+YwqGQGUx2sMcX2ZQOOsAWo=;
        b=CPJ+Ic3Fe0Ic689P8cj6VWIikognof9M0BSrZbY0KMvUP1MmnjFFD7sP19QzeAQKHy
         3mifkRRAO/SlobCxl0QZ8x1U2UQpMcOzM6pt6N7V1Jz3azplxBlzUnkfRBGd25ORJ/rT
         ctm8y4DUT1yxxclPhqMxXHu7g2otAmEVwNw8yWRmjG/usIXR8kFV4nwiEhRiHTdff5lF
         JSsJuILdUDUxiPQYCXuHI9ITNC0MdTFgDEZ5C0yqdTyhPS7aqYNdMUkOTa+RStz2Mnur
         ewJHvdplfCrTM6cwwmHbjq4YY4znBk7772+LSHaMbkXF3SeZxzS7qEqnkIPS2/TNlSgT
         ADRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780128494; x=1780733294;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH8Pl7SP8LWSHPvqI1Gh+YwqGQGUx2sMcX2ZQOOsAWo=;
        b=dUpluQR/ZyfgyJHIvcybPkLvhNTrxdu2F0/Kp9mxpsaMU7dOj9g+L5lUf7+OtiIJL8
         jzsr86f8plz5h/c5tlwAPL2fcqVN68lk+g9m1i5mYgPO982XE1vYBygQtCgLpXjE3gLX
         8Jo7/QaYnDnSr1lHO/SpRGVPkvhAB+fZXzRw2iMkXQqBUHykRSBHCBftaCV89k5j+GG5
         ek3Rhg/QxkQrDLzNoMqm3dNigWFQip7iNJk//bj9r/aFgS3uIATTXUW5s/oS26cMGJRM
         NFkf4hc+eDP8pfvkCBlaLUm6u3Ibo3AWiwN/xVsxqcwZ2Xq7s9XNhf8x1AWb0Z9ZLrH6
         mJVA==
X-Gm-Message-State: AOJu0YzkwsBfQvOnP/QXBIYbDkMVx+rPH42lqKQaAW4wVaztKEGmAqp0
	ZVJmMF75F5bdOc2dw9dRdaH0eXapBwI+27P2mf9twNPWq1kJfKI6/vSAwJKPMg==
X-Gm-Gg: Acq92OE6RSgLP7fCjFFTwUcsPmCiO+9ccFlFB6rUanunMasBhZvbDZPwr4EXYf40rH7
	LQEwQR70KZce2onB0Mw8BscOU//2LtTJu4zjE96ntmhAtVlvo28W8m5mNbVhKYUcxJPLXg1WeGq
	J+bGNBMFgzNDbJfKJYeWMTTJnPbR1pIHtNmXGapfuWkEyeVTBx0hHb5dzApg/fx9vUnMUHNDg55
	nEtnrsyu+clQCOfuc8tcW9KzFIMaQzaNWYRfZ0F0jn2FTHmnZqxE2s1Ol70zZNGleiUfUWLop3c
	BjCdUQ53OfnL75pBz6n3C/+tFSL/hJYZnAKSmuXooDh6xGljZy5Q2cqeIKMk21OcGeCyrBf1MOk
	reYpsMxv+b0JSW49z0o0k6X1WHfM5Cdq5Bec9/H/rJEbWsyqkr18x7Cj1bXeWLwxjFPhOn3Vgze
	Qx1yq9yio91oZViD2Avz9DUZf2ZHLixGIXcg==
X-Received: by 2002:a05:600c:34c8:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-490a2b6e3d2mr43745985e9.5.1780128493612;
        Sat, 30 May 2026 01:08:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c09abadsm29881905e9.1.2026.05.30.01.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 01:08:12 -0700 (PDT)
Date: Sat, 30 May 2026 11:08:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Zhang Cen <rollkingzzc@gmail.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Gao Xiang <xiang@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, zerocling0077@gmail.com,
	2045gemini@gmail.com, Zhang Cen <rollkingzzc@gmail.com>
Subject: Re: [PATCH v3] f2fs: protect published gc_thread during teardown
Message-ID: <202605300627.kUlwXIge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528065601.3257303-1-rollkingzzc@gmail.com>
Message-ID: <20260530080809.vfpGVRiDFwSDvVpOi8CM4_E2RGqTnPc-k0Op0ZmIyuI@z>

Hi Zhang,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Cen/f2fs-protect-published-gc_thread-during-teardown/20260528-145912
base:   linus/master
patch link:    https://lore.kernel.org/r/20260528065601.3257303-1-rollkingzzc%40gmail.com
patch subject: [PATCH v3] f2fs: protect published gc_thread during teardown
config: i386-randconfig-r071-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300627.kUlwXIge-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605300627.kUlwXIge-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:5006 f2fs_fill_super() warn: missing error code 'err'
fs/f2fs/sysfs.c:1027 __f2fs_sbi_store() warn: inconsistent indenting

vim +/err +5006 fs/f2fs/super.c

aff063e266cbf4 Jaegeuk Kim      2012-11-02  4961  
ed2e621a95d704 Jaegeuk Kim      2014-08-08  4962  try_onemore:
d1267b5f0b476d Zhang Cen        2026-05-28  4963  	gc_thread_srcu_inited = false;
da554e48caab95 hujianyang       2015-05-21  4964  	err = -EINVAL;
da554e48caab95 hujianyang       2015-05-21  4965  	raw_super = NULL;
e8240f656d4d5d Chao Yu          2015-12-15  4966  	valid_super_block = -1;
da554e48caab95 hujianyang       2015-05-21  4967  	recovery = 0;
da554e48caab95 hujianyang       2015-05-21  4968  
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4969  	/* allocate memory for f2fs-specific super block info */
bf4afc53b77aea Linus Torvalds   2026-02-21  4970  	sbi = kzalloc_obj(struct f2fs_sb_info);
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4971  	if (!sbi)
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4972  		return -ENOMEM;
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4973  
df728b0f6954c3 Jaegeuk Kim      2016-03-23  4974  	sbi->sb = sb;
df728b0f6954c3 Jaegeuk Kim      2016-03-23  4975  
92b4cf5b48955a Tetsuo Handa     2022-11-09  4976  	/* initialize locks within allocated memory */
e605302c14ffda Chao Yu          2026-01-04  4977  	init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4978  	mutex_init(&sbi->writepages);
ce9fe67c9cdb21 Chao Yu          2026-01-04  4979  	init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
6a5e3de9c2bb0b Chao Yu          2026-03-06  4980  #ifdef CONFIG_DEBUG_LOCK_ALLOC
6a5e3de9c2bb0b Chao Yu          2026-03-06  4981  	lockdep_register_key(&sbi->cp_global_sem_key);
6a5e3de9c2bb0b Chao Yu          2026-03-06  4982  	lockdep_set_class(&sbi->cp_global_sem.internal_rwsem,
6a5e3de9c2bb0b Chao Yu          2026-03-06  4983  					&sbi->cp_global_sem_key);
6a5e3de9c2bb0b Chao Yu          2026-03-06  4984  #endif
bb28b66875cca7 Chao Yu          2026-01-04  4985  	init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
f9f93602512bce Chao Yu          2026-01-04  4986  	init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4987  	spin_lock_init(&sbi->stat_lock);
66e9e0d55d117a Chao Yu          2026-01-04  4988  	init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4989  	init_f2fs_rwsem(&sbi->quota_sem);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4990  	init_waitqueue_head(&sbi->cp_wait);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4991  	spin_lock_init(&sbi->error_lock);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4992  
92b4cf5b48955a Tetsuo Handa     2022-11-09  4993  	for (i = 0; i < NR_INODE_TYPE; i++) {
92b4cf5b48955a Tetsuo Handa     2022-11-09  4994  		INIT_LIST_HEAD(&sbi->inode_list[i]);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4995  		spin_lock_init(&sbi->inode_lock[i]);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4996  	}
92b4cf5b48955a Tetsuo Handa     2022-11-09  4997  	mutex_init(&sbi->flush_lock);
d1267b5f0b476d Zhang Cen        2026-05-28  4998  	err = init_srcu_struct(&sbi->gc_thread_srcu);
d1267b5f0b476d Zhang Cen        2026-05-28  4999  	if (err)
d1267b5f0b476d Zhang Cen        2026-05-28  5000  		goto free_sbi;
d1267b5f0b476d Zhang Cen        2026-05-28  5001  	gc_thread_srcu_inited = true;
92b4cf5b48955a Tetsuo Handa     2022-11-09  5002  
ff9234ad4e9747 Namjae Jeon      2013-01-12  5003  	/* set a block size */
6bacf52fb58aeb Jaegeuk Kim      2013-12-06  5004  	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
dcbb4c10e6d969 Joe Perches      2019-06-18  5005  		f2fs_err(sbi, "unable to set blocksize");
aff063e266cbf4 Jaegeuk Kim      2012-11-02 @5006  		goto free_sbi;

error code?

a07ef784356cf9 Namjae Jeon      2012-12-30  5007  	}
aff063e266cbf4 Jaegeuk Kim      2012-11-02  5008  
df728b0f6954c3 Jaegeuk Kim      2016-03-23  5009  	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
e8240f656d4d5d Chao Yu          2015-12-15  5010  								&recovery);
c0d39e65ba3243 Namjae Jeon      2013-03-17  5011  	if (err)
9076a75f8e0f23 Gu Zheng         2013-10-14  5012  		goto free_sbi;
9076a75f8e0f23 Gu Zheng         2013-10-14  5013  
5fb08372a68936 Gu Zheng         2013-06-07  5014  	sb->s_fs_info = sbi;
52763a4b7a2112 Jaegeuk Kim      2016-06-13  5015  	sbi->raw_super = raw_super;
52763a4b7a2112 Jaegeuk Kim      2016-06-13  5016  
b62e71be2110d8 Chao Yu          2023-04-23  5017  	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
92b4cf5b48955a Tetsuo Handa     2022-11-09  5018  	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
b62e71be2110d8 Chao Yu          2023-04-23  5019  	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
92b4cf5b48955a Tetsuo Handa     2022-11-09  5020  
704956ecf5bcdc Chao Yu          2017-07-31  5021  	/* precompute checksum seed for metadata */
7beb01f74415c5 Chao Yu          2018-10-24  5022  	if (f2fs_sb_has_inode_chksum(sbi))
d005af3b6756e5 Eric Biggers     2025-05-12  5023  		sbi->s_chksum_seed = f2fs_chksum(~0, raw_super->uuid,
704956ecf5bcdc Chao Yu          2017-07-31  5024  						 sizeof(raw_super->uuid));
704956ecf5bcdc Chao Yu          2017-07-31  5025  
458c15dfbce62c Chao Yu          2023-05-23  5026  	default_options(sbi, false);
dabc4a5c60f796 Jaegeuk Kim      2015-01-23  5027  
94b3ce7f1509d9 Hongbo Li        2025-07-10  5028  	err = f2fs_check_opt_consistency(fc, sb);
dabc4a5c60f796 Jaegeuk Kim      2015-01-23  5029  	if (err)
94b3ce7f1509d9 Hongbo Li        2025-07-10  5030  		goto free_sb_buf;
d185351325237d Hongbo Li        2025-07-10  5031  
94b3ce7f1509d9 Hongbo Li        2025-07-10  5032  	f2fs_apply_options(fc, sb);
d185351325237d Hongbo Li        2025-07-10  5033  
d185351325237d Hongbo Li        2025-07-10  5034  	err = f2fs_sanity_check_options(sbi, false);
abd0e040e9a516 Eric Sandeen     2025-03-03  5035  	if (err)
abd0e040e9a516 Eric Sandeen     2025-03-03  5036  		goto free_options;
abd0e040e9a516 Eric Sandeen     2025-03-03  5037  
6d1451bf7f84ea Chengguang Xu    2021-01-13  5038  	sb->s_maxbytes = max_file_blocks(NULL) <<
e0afc4d6d0d3e7 Chao Yu          2015-12-31  5039  				le32_to_cpu(raw_super->log_blocksize);
aff063e266cbf4 Jaegeuk Kim      2012-11-02  5040  	sb->s_max_links = F2FS_LINK_MAX;
aff063e266cbf4 Jaegeuk Kim      2012-11-02  5041  
5aba54302a46fd Daniel Rosenberg 2019-07-23  5042  	err = f2fs_setup_casefold(sbi);
5aba54302a46fd Daniel Rosenberg 2019-07-23  5043  	if (err)
5aba54302a46fd Daniel Rosenberg 2019-07-23  5044  		goto free_options;
5aba54302a46fd Daniel Rosenberg 2019-07-23  5045  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

