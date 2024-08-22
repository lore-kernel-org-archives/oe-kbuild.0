Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBD18D64F
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349754; cv=none; b=BE2XHrWGQTS8BLf3mGCMAvgy0cm2OFEgRo4LJid+XWU6mNpBjSIOA933DLs3fwoAo6x1LYpUtH1+1yMr8zHJ2wu2bpOqMWOz6USodWqW2+W4vA0Gm9lnJwjNwUvLWXb+nw14mITB/hoHsWZcQ+66nfOe7bINe28Wnp5cmP6eTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349754; c=relaxed/simple;
	bh=VFbMT9NzuJbFWeBxVkiyPagBOagtzxduVQh+jEfLeWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TW0QMHvh5eExKz9q46/QdLad9ZE7sewosPqrb66rC1z9rags+WDCbLJ42GojiiKkrLJqPBjpl+MpxX0qMSpILraloIozjBhOCgZh0lA/VEoFsFEv8b3YKG+u9Lnz6CxRS7rmCz0/mXAv3+HJALaOwUj/tZU2VKkoDzbtD2dGhNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNVosm14; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNVosm14"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-534366c1aa2so396809e87.1
        for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724349750; x=1724954550; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMkH2vVnDhFw+cxVn6jmcv0ytI6q2hqv9f9ccu3UJPU=;
        b=vNVosm14Kq1d5c6ibMJsuZpZk52qTtibq19pnB2m7nBGFb4LuMYW5HPfqCVXgydmb4
         ltN0dzuZPoPM2uaO7qMz75ex5LZvHtWap30XH6AcVCoiZFOXz3map7oDEja8D7dIAx9c
         bTrNDjlIZ3VMc7EVSu3f3ifVDfOjeNHID53DJ+bWW9gwsNDtAmu02CZdvFRF0o5qWQuM
         w9ob41fU+/U41yhrxPqHcBTdtjmB/sQXLjf7MM5FZhwVa/a2RYGHy4Mt7MQW6d6UqI76
         EGAnrZfCndThU7osOrUCtdgqGmsXKblLdIolKh4faHCrx9a/SvdPq7dw8K1D18tYV9mZ
         P9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349750; x=1724954550;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMkH2vVnDhFw+cxVn6jmcv0ytI6q2hqv9f9ccu3UJPU=;
        b=kmXs7veArdfM+qWSXg4CE8QFwfIxAVQNmTezwKCOnVEL4OHpFyjDyu+R6bJWqNQBEj
         S0iRdNZo+goFaVBvqUu4nwoTe5w0h34QAVkZ0EriHT3IGCxjUhGS3XsrK9td8Y6eoDOb
         NrOD+YwFejHu8C/1u1EXlQiGRgM/ofch3H9CIUevsEu9I+/QOEao5URyTcw7tgHPqkKy
         FXYPTJdTT66dvA8RWyRO/OB0IrjYkcNB466k2H4Ile/nhePDt3+gf1Bb2Wl0pwWebdQQ
         ZABS/CClFKy+CZmjK1D21W15PwmPKwWVxATo4A4/XTQ752OVMcoxeO/HMvMfL8FInuPM
         1mjg==
X-Gm-Message-State: AOJu0YwyWxky2Fl+mE86S+N6gPJye2IukoYPZ+DhGNN9OL0mmQCN7SKl
	tLIuUoQzV9FKk9yQ2BK1MWqgsA/QGN2G2Brnf/N8miXn467t0JVvwHvU7uhqRu5bVBruL28dje8
	c
X-Google-Smtp-Source: AGHT+IHlbVhsoCnCtmNAbSbtiVt4wqhlkrGCdTzE9ud4rwdfGO4d9LxDCFoQQSHmZqF7ub5rklI+bg==
X-Received: by 2002:a05:6512:b16:b0:52c:e28f:4da6 with SMTP id 2adb3069b0e04-5334fd6b81cmr1885750e87.51.1724349749437;
        Thu, 22 Aug 2024 11:02:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e89ebsm1151643a12.43.2024.08.22.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 11:02:28 -0700 (PDT)
Date: Thu, 22 Aug 2024 21:02:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Phillip Lougher <phillip@squashfs.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 5650/6069] fs/squashfs/page_actor.h:41
 squashfs_page_actor_free() error: dereferencing freed memory 'actor'
Message-ID: <f7a4b364-ecff-46dc-989b-43dba1145052@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a7917c89f219f09b1d88d09f376000914a52763
commit: 5d85f9c952d85a26e1a8c7c985b67963b483cabc [5650/6069] Squashfs: Ensure all readahead pages have been used
config: i386-randconfig-141-20240822 (https://download.01.org/0day-ci/archive/20240822/202408222328.AeiNlEPx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408222328.AeiNlEPx-lkp@intel.com/

smatch warnings:
fs/squashfs/page_actor.h:41 squashfs_page_actor_free() error: dereferencing freed memory 'actor'

vim +/actor +41 fs/squashfs/page_actor.h

f268eedddf3595 Phillip Lougher 2022-06-11  28  extern struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
f268eedddf3595 Phillip Lougher 2022-06-11  29  				int pages, int length);
f268eedddf3595 Phillip Lougher 2022-06-11  30  extern struct squashfs_page_actor *squashfs_page_actor_init_special(
f268eedddf3595 Phillip Lougher 2022-06-11  31  				struct squashfs_sb_info *msblk,
2258e22f05aff5 Phillip Lougher 2024-08-19  32  				struct page **page, int pages, int length,
2258e22f05aff5 Phillip Lougher 2024-08-19  33  				loff_t start_index);
9ef8eb6104527b Phillip Lougher 2022-10-20  34  static inline struct page *squashfs_page_actor_free(struct squashfs_page_actor *actor)
1f13dff09ffc8b Phillip Lougher 2022-08-22  35  {
9ef8eb6104527b Phillip Lougher 2022-10-20  36  	struct page *last_page = actor->last_page;
9ef8eb6104527b Phillip Lougher 2022-10-20  37  
1f13dff09ffc8b Phillip Lougher 2022-08-22  38  	kfree(actor->tmp_buffer);
1f13dff09ffc8b Phillip Lougher 2022-08-22  39  	kfree(actor);
                                                ^^^^^^^^^^^^

5d85f9c952d85a Phillip Lougher 2024-08-21  40  
5d85f9c952d85a Phillip Lougher 2024-08-21 @41  	if (actor->next_page == actor->pages)
                                                    ^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^
Use after free.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

