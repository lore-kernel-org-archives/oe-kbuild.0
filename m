Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB86340DBD;
	Tue,  2 Sep 2025 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832505; cv=none; b=h86b2+NB0DIEueoiUM0DT61yY3BN2Xvh0Ly0LCsU41lQF7+RIMJo0e/AnQYQO8FDjeWoXZF4IX5mca6IwSfe/aMohu4YTCPj0HA37/iUHhmP+xvRWoZ6buDFXDCm5DL8zfesCbWyG3BPSBTJkGkxncNELtfzGx8Imw8e3OjSTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832505; c=relaxed/simple;
	bh=Qd/IZVebmwhXQoEyKX5NuPIYcgf/0VYl0GSWz1Gl0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbO3Du9/L02wH6nGtQ/zfK469R4GsD1Kd47DcFWx19pwn5qrXp02OTbJElCz5BfT2d74JRU3H156hiC6PiYMhJYuTuU2hheItg8oFy+MGtW+4aTVKWoqoha/0A6AIpJiRysqDigQVLonKrfrG2tk4tGXMdGXPl1jbP+e3NKNaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2fp2sI2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2fp2sI2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77256e75eacso2341436b3a.0;
        Tue, 02 Sep 2025 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756832503; x=1757437303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr4dtH+6wLw/9TmFABy0WOLeS+YAxNvGpmwDvxx0NyI=;
        b=E2fp2sI2DsUY6XLIYdSOvdFcknXX2OhmmfW5PyHQb2WanNtiqd6Kvct1/RvIKknNjw
         OA3nAXKWUBuVsI/INrRvBhvfSdnAlLaAjcwjVSUXmr1nyUnMsufnoHwbpH0J4luu9lcZ
         REgFQEOX4E9XQckoUYEtkkCUR3qHRJmv/U4zVTPuUjb1PAEih23zWJSKUTTd+NBM2VF3
         hKfyC/nlXCE6XVlkZvuuv0b0T1KGgIIrQ/l7J8W9MOhwRz8pZbA39p/sYCFAe3viL3wH
         Dc7UwZ5trHyAtOavmXTf/3jVflIl3XX5xkfcqbZ06n1zHoHYfVOF6rZEg6Zp06wymRKl
         s+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832503; x=1757437303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr4dtH+6wLw/9TmFABy0WOLeS+YAxNvGpmwDvxx0NyI=;
        b=MCAhB5gZkfP1M6DVbqA56f+q1TBKVmImwZyzUASpQ0iBo6mgIZfc2qwXMA4QP6s6y4
         uc7vQjcQ8o2u4L4JYwvuqyw2bA2fz7+ot3OAvSBuILhpKW9ZWUBy0r86QjLlaYheZmRJ
         yh7dnHqzJvYr5bT40lI55B6uNJlzWWinAQaLXLv/9E3hI8xNcpmonexxhxMI17k2S0wq
         82f2C9Bu5QiK/GtbQjQgcNiZBX5CTrOC1nJGdHNhlZz1tRseV8vNJ5zzb539416w0B/c
         It4OV+R5t/EVz+eN2GkBEgz/4gfocB/j8+ss4dsUTMXs3DAKfJD/0oAS3zVPaBZhSZV2
         JeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV49/MzwSP/+bsT39Y1wqN/IbY0IqHYK23nJJLNwEWSzGuePWZDG4euDKRtwcmICrdPVRG0GXIwTCZS/QR3@lists.linux.dev
X-Gm-Message-State: AOJu0YwrYnbKJs/4GqAC4diq371QzIDfbLDGabqi44P//0G7OrnGPDeq
	GVfRXQPUkpVueqO5V2O3/a8wzp7BcfhxwpMt2yVEVurUR+sAxme3bMuq
X-Gm-Gg: ASbGnctGvnrjIHMyunhOL/A2Zuy3ru7DLDY7rRNpe+lAhRDxyK01FFJN5ZCyD5Vl7TN
	MLjwmr7NNSIwEPRdFAW7DnwF8xNT4YiOVTKtkC/T61KTF9V84+OUIkGbgv9L1B9JIZavHlxXEhq
	csC7nbF7miqglnwhb+41HhfHW0NXo9CKioQrQLLCfryj5kzgbcHXLwZGhJTlX5QG9uhsBkg/iNq
	AT9vzNl+5dEB5cLKQQrivslV9SoQQxIGnBFASgPKqVx1U/is1OuoSQ5sJq0vLl8TKA66rLnaudU
	uoMzt7DvG8OdbfcugNiUlzEDLlNekRRkERIU/2XbodNzVt41ExR3l3f/N7mg2Qu9cAnuBUSOyz+
	vldHq8QTyuGDUvTshXFfowItiYDbMM1dS+wM3gLBrAcGNxtJMy3sV8w==
X-Google-Smtp-Source: AGHT+IHAqr9Rp7SVP8poB9eOiwc3M4jdskDGajj5qU9Zr/pStUC9iKTqRvLJFvomPILr/qg3w8tRVg==
X-Received: by 2002:a05:6a00:1495:b0:771:f951:16c6 with SMTP id d2e1a72fcca58-7723e308bbbmr15873113b3a.15.1756832502675;
        Tue, 02 Sep 2025 10:01:42 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bd1ccsm13897224b3a.47.2025.09.02.10.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 10:01:41 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:01:39 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 4756/5283] kernel/fork.c:457
 account_kernel_stack() warn: we never enter this loop
Message-ID: <aLci857GmuP2tMV9@fedora>
References: <202508300929.TrRovUMu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508300929.TrRovUMu-lkp@intel.com>

On Mon, Sep 01, 2025 at 01:56:05PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   3cace99d63192a7250461b058279a42d91075d0c
> commit: e0aa7237ef4323a66ed06953225d9b07cf039530 [4756/5283] mm: tag kernel stack pages
> config: hexagon-randconfig-r072-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300929.TrRovUMu-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508300929.TrRovUMu-lkp@intel.com/
> 
> smatch warnings:
> kernel/fork.c:457 account_kernel_stack() warn: we never enter this loop
> kernel/fork.c:457 account_kernel_stack() warn: unsigned 'i' is never less than zero.
> kernel/fork.c:479 exit_task_stack_account() warn: we never enter this loop
> kernel/fork.c:479 exit_task_stack_account() warn: unsigned 'i' is never less than zero.

Thanks for catching this!

> vim +457 kernel/fork.c
> 
> ba14a194a434cc Andy Lutomirski           2016-08-11  437  static void account_kernel_stack(struct task_struct *tsk, int account)
> c6a7f5728a1db4 KOSAKI Motohiro           2009-09-21  438  {
> 0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  439  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
> 449e0b4ed5a16c Pasha Tatashin            2025-05-09  440  		struct vm_struct *vm_area = task_stack_vm_area(tsk);
> 27faca83a7e955 Muchun Song               2021-04-29  441  		int i;
> efdc94907977d2 Andy Lutomirski           2016-07-28  442  
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  443) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
> 449e0b4ed5a16c Pasha Tatashin            2025-05-09  444  			mod_lruvec_page_state(vm_area->pages[i], NR_KERNEL_STACK_KB,
> 27faca83a7e955 Muchun Song               2021-04-29  445  					      account * (PAGE_SIZE / 1024));
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  446) 			__SetPageStack(vm_area->pages[i]);
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  447) 		}
> 27faca83a7e955 Muchun Song               2021-04-29  448  	} else {
> 0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  449  		void *stack = task_stack_page(tsk);
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  450) 		struct page *page = virt_to_head_page(stack);
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  451) 		int i;
> 0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  452  
> 991e7673859ed4 Shakeel Butt              2020-08-06  453  		/* All stack pages are in the same node. */
> da3ceeff923e3b Muchun Song               2020-12-14  454  		mod_lruvec_kmem_state(stack, NR_KERNEL_STACK_KB,
> efdc94907977d2 Andy Lutomirski           2016-07-28  455  				      account * (THREAD_SIZE / 1024));
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  456) 
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20 @457) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++, page++)
> e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  458) 			__SetPageStack(page);
> 
> Apparently in the linked config the THREAD_SIZE / PAGE_SIZE is zero.
> Is this the expected behavior?  I don't know mm enough to say the
> answer...

THREAD_SIZE and PAGE_SIZE are very architecture dependent. This behavior
is expected in some configs. This can't happen in the VMAP_STACK case,
only !VMAP_STACK, so looks like my patch is wrong in handling that case.
I'll send a fix shortly.
