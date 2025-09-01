Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C37E792
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Sep 2025 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724173; cv=none; b=sBD5x3ro81mcr1GuZpOQz0irouA6XVVax6jfllqf9GAi+vb2JANKu0xjj4HXECB/mWa6AdCCJqeuN4f6KmNutMgWp9jHYOJOwFeOjf7gznua40f6YTg7Dgxa1gILDu7IQOVfqYg+CVKB5UMjzt8Hsq8JnWRzqlKd6IirpH1L50I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724173; c=relaxed/simple;
	bh=cBxzMBrBdfX1S9upUiMnP7ZToiXDgNKMJ0RKfQaxhTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7RaRpC6sQ7DIhmig6xkg7kna/q2hHkjS+ws5ZUcCH3VyKIWvjkZV8EALkwfbQO+YL4RN8xSHXnMTZ4gqmy6RSVZDQ8H6iNDoqgxtqJe03Z/9RLTKkW1wB4zUAIhD6CCiUiiCWPvUa9QyLVvpv9DpCWp2ohGjoZcZTJEV+VtR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSUstjtj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSUstjtj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3d17731ac0fso1991282f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Sep 2025 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756724170; x=1757328970; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s51XmWZJp5DHxpHOLeJmnLNp4ozg3yH12eVI2vl1w5Y=;
        b=bSUstjtjxRBUue89thxEw1zTphTAv0C93kZMEsy5HBV7ECR8sFkTihuj6FV6loYO+5
         0kNIbxGpNmcdFOoP9phm1UYUCYu916dDz9XWfLfhAHzgJCzgRQuTTNuEDCqmA6WQ+tZ9
         z7+V2UJ17c5jfBueK6AKvnRfrMlYbPbOPoD7CCTxG/GcCrvV1oMmeCeAQOgQsRj8hu+4
         pETuN2WTExlMipmh0E8y3lrXnv68Rxw/jIEMyrmfFmvdD/jK1F6OLzq6/z6+vIKBxRnQ
         oP+aAzmkBp9WQpjDqhyFzu8FmgzGmdQoWPSNJy0V3OFMfK4dBsffNKdO1Uhj8znBxDR1
         PkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724170; x=1757328970;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s51XmWZJp5DHxpHOLeJmnLNp4ozg3yH12eVI2vl1w5Y=;
        b=DwPv2/9pEhoXGNkAXT7ZgT8+ZCatbKwkohFNVxlLEnRpLbzIE+e0MsXAZmPaMlKxBR
         yzm/wk+6YGhU3YAUdxi5Kr2FFaQMt5J5rNNJylebdOshqP0EYSp8QztvXeGyvkFRc+gr
         lIhMtzUJemuBFyeOZ1bm8DS9uJlhxmQfeaQfYMadbQHCFwYBC6FuT0QO/nmOXpvHCP7J
         nn+fQsBwtY9ugk5XjwVPaDCFcj8+BzDvqsgrDKiN2JNddvvJvtu5dpSVn2TLwnCqBsxa
         FbzicEzaEQoqCp6lulGusK0omJgEdEU2ag5DW2772BP6EKDJMqScVyNlBIdn8YwEyN83
         Mqdw==
X-Gm-Message-State: AOJu0YzQDCg0+MfeiAy5VMhGsopV591acXomNwNsoA1J+pCzb1Pgpixc
	Jy1fzXK0B2M9wDAOVlTtcASVnWSmV0b4uSKEjYBnpm0ljYIQMI27Cr5sGl3uvdJAFQJr+F5TdsV
	rxkbg
X-Gm-Gg: ASbGnctYA54P9kjCWp0CNjHVLooaFAZrk3ffOOkaOa9rBGAOkv9kIiP8iI5hp+sAvsW
	jyzme4Q56zRotMg/MARk5+QxBW/iZi8kZwXe6JVxBmMZd1gB5Z/4qg3mMD4FS35bXJZcP+7Dj+n
	ksuRbFTY9tthnqcypJLrEWDAhBHaTAq3jBrwZ70TQvaAA1LB0FtFRuL9Ht8/FacM2td7l6M29wi
	JxOOQceTmrNIJxuf/IDEEjnBV8xzUQvgnA1dwM+QP+w5TiuHxk6SCRGYcYFQmQmqtDnY7x0dE60
	XWmDcomkVcvQ8X9pKcGaEyKMdrFcP0uqFQHu7bEaWRxCESDRkm+6xKhO6/OTs/pBmyCkg6Nceec
	S1lR9nBQ35IxtZa0q7o/2w4H7NW0WbKYZsStiEw==
X-Google-Smtp-Source: AGHT+IFiaIyiVHKBvWcuJ7j9OGQvV5jS+bUEoZBiN7Wnh2kb+IM8kDKm5zixCaYx5Z385dGIbHqAEA==
X-Received: by 2002:a05:6000:26c6:b0:3c9:fc3c:3aa3 with SMTP id ffacd0b85a97d-3d1dfc07101mr7147467f8f.40.1756724169658;
        Mon, 01 Sep 2025 03:56:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d3a7492001sm8737165f8f.42.2025.09.01.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:56:09 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:56:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4756/5283] kernel/fork.c:457
 account_kernel_stack() warn: we never enter this loop
Message-ID: <202508300929.TrRovUMu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250901105605.Sg6JbnHhz1wMo7DxOWTLDbTFiIcKfqQx6HIvKM55BWg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cace99d63192a7250461b058279a42d91075d0c
commit: e0aa7237ef4323a66ed06953225d9b07cf039530 [4756/5283] mm: tag kernel stack pages
config: hexagon-randconfig-r072-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300929.TrRovUMu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508300929.TrRovUMu-lkp@intel.com/

smatch warnings:
kernel/fork.c:457 account_kernel_stack() warn: we never enter this loop
kernel/fork.c:457 account_kernel_stack() warn: unsigned 'i' is never less than zero.
kernel/fork.c:479 exit_task_stack_account() warn: we never enter this loop
kernel/fork.c:479 exit_task_stack_account() warn: unsigned 'i' is never less than zero.

vim +457 kernel/fork.c

ba14a194a434cc Andy Lutomirski           2016-08-11  437  static void account_kernel_stack(struct task_struct *tsk, int account)
c6a7f5728a1db4 KOSAKI Motohiro           2009-09-21  438  {
0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  439  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  440  		struct vm_struct *vm_area = task_stack_vm_area(tsk);
27faca83a7e955 Muchun Song               2021-04-29  441  		int i;
efdc94907977d2 Andy Lutomirski           2016-07-28  442  
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  443) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  444  			mod_lruvec_page_state(vm_area->pages[i], NR_KERNEL_STACK_KB,
27faca83a7e955 Muchun Song               2021-04-29  445  					      account * (PAGE_SIZE / 1024));
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  446) 			__SetPageStack(vm_area->pages[i]);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  447) 		}
27faca83a7e955 Muchun Song               2021-04-29  448  	} else {
0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  449  		void *stack = task_stack_page(tsk);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  450) 		struct page *page = virt_to_head_page(stack);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  451) 		int i;
0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  452  
991e7673859ed4 Shakeel Butt              2020-08-06  453  		/* All stack pages are in the same node. */
da3ceeff923e3b Muchun Song               2020-12-14  454  		mod_lruvec_kmem_state(stack, NR_KERNEL_STACK_KB,
efdc94907977d2 Andy Lutomirski           2016-07-28  455  				      account * (THREAD_SIZE / 1024));
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  456) 
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20 @457) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++, page++)
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  458) 			__SetPageStack(page);

Apparently in the linked config the THREAD_SIZE / PAGE_SIZE is zero.
Is this the expected behavior?  I don't know mm enough to say the
answer...

ba14a194a434cc Andy Lutomirski           2016-08-11  459  	}
27faca83a7e955 Muchun Song               2021-04-29  460  }
c6a7f5728a1db4 KOSAKI Motohiro           2009-09-21  461  
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  462  void exit_task_stack_account(struct task_struct *tsk)
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  463  {
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  464  	account_kernel_stack(tsk, -1);
991e7673859ed4 Shakeel Butt              2020-08-06  465  
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  466  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  467  		struct vm_struct *vm_area;
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  468  		int i;
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  469  
449e0b4ed5a16c Pasha Tatashin            2025-05-09  470  		vm_area = task_stack_vm_area(tsk);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  471) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  472  			memcg_kmem_uncharge_page(vm_area->pages[i], 0);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  473) 			__ClearPageStack(vm_area->pages[i]);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  474) 		}
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  475) 	} else {
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  476) 		struct page *page = virt_to_head_page(task_stack_page(tsk));
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  477) 		int i;
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  478) 
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20 @479) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++, page++)
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  480) 			__ClearPageStack(page);
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  481  	}
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  482  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

