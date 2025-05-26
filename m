Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2751FFC55
	for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262770; cv=none; b=CsoO3O5kUduOTKqbTTYPCNwIdYT03G1x+8oaZzDwlxa+/jFOpT5wSsrHYFlljrF30X+yy63qfHLCg1bDjQbIICwhxQxQehbQ5ah/vYTZOYHV86gK5/p8JeNacNrEmEW1dVR48hW/jX9R0qaqNQbi4qsQaJ8e5nvsva1YgZwoof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262770; c=relaxed/simple;
	bh=LyJ+ndHdNNArdfM2pwhYm9icCIe3xNaf4LRyeL/e41U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmzLtqXw3NMtcBIZQvSjGFr03loUyxKhxXuOSKgs+H4cr/o6S7a/2oXmHJ976gefN7MJI61WponE3zq1y8z5W9mK+5awZYanl8htmkkpBD67MAmr4alu7QcIzrrEW9kuLZZR0VNZyWxZTrwHBfcLD3Jdh9Urzh3CU2Gb8S+x1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXesNs6K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXesNs6K"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso13322905e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748262766; x=1748867566; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX5NeMJ07Z7hPjhpKLdgFWf1Bt2nqdKYkwaeZMAZl5w=;
        b=TXesNs6K9VO/CAcEybCx7GxQxEw4NJ8m2pqi+sznuwA/3d/9ocR5z6GoHNG0pyhYIc
         ICAjwI6u96OyVMYuEpJJ0WOwxxTIq0JD+ElZzuEE4yzzq5u4OAFAzg9hUNInSq4VFK3Z
         V7UEgefvtb6Zcyljq+c7wn/k3N4XNzOekiuTkNsg5TWfo5J4m91Wo2NEX9HmsAMd8Z8A
         mOTpZy4D8wJJBTcVKSzSDqTMFz1q9oXe/2F/j4Pk8P0YUcNw5QTe4NHZa0mol69Wryv8
         Gj5OFUSjXloIuVsgw7/wMSZm45D88D4f1VqulQBLCYdrudZ1xGV/WgM7xiV+ECavZwG2
         G9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262766; x=1748867566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX5NeMJ07Z7hPjhpKLdgFWf1Bt2nqdKYkwaeZMAZl5w=;
        b=xRkgnJn23ZP9w13ghncOWArgaxDEg7voKo67Ok1oEKORLhUPMXUW40rt6UTrRebHfO
         ZVL5FLJ/Ibm1Yko3fsTBA2fBfTdSf6G3wo7ybqcmqTwe4ih3PsDShDzBcy1JvVNkKA8A
         pP7e505w/hIldci76JRkCoFG/X5bMmH3yFUkrZg8MCyIm38dNNqO+UdSBqmRrAa+N5i2
         zLXgZWba6zUYvsMOUptAVDAy0459fTI9J2oEKDwszBJz9C4jKzatJQSfSFJZtyNiH1NI
         ye9UYX1ElfhEmYExuA3KA7pLozUCvPPcag9putshfV5jw9+tqIF9xUltmbtqVJGSow/c
         XY+Q==
X-Gm-Message-State: AOJu0YwBDKN0qY5nDS6MJXrznp8eFyjZXw1BpB4aHb5zS/yetHmNB1/S
	f0M1wMv+6gDerenZ70PROECEnF+PaGM+eGTaCJUhKXCSEIByFBpA5lvhwAr+d+g71eE=
X-Gm-Gg: ASbGnctkWjk1RIPILIESc3lL4hlO1O0xqKJ1wpSYSalegGqsgJn3WgzcH+zaoPA3oYi
	H6tA5V/E/odD2JiRWxxsnRtQswKUehbjenflAsoRy7DKmRYFHUBl2DxTGGbrw15TEbYHQaTqnVK
	eus/v8gMfYZTb5zbOQLnEzfzj/A4FkvjJKuDgO+snUBhvbbklt6uG/ZoDu6vHC88TTfog1SZyaf
	9ISu1tMaLx3ljEKDJpvcMh3uoxnURMMinC+Lutk3Xtu/RZFC5WrH4ioXKDYsDKTOZlHWXxKce1d
	2oVjnZSUTQlpvxkeCjG1x4eMD+0I6r2A3YOoO+3AkKhg9d5hTh3kZeVQ
X-Google-Smtp-Source: AGHT+IF6jnHUeJLMem7dFDtWplrd9BhhtwxXTTdVE3bJLYOHTU+Nm8qMT01la8e5pMTT4rhXoGFI1w==
X-Received: by 2002:a05:600c:4e4d:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-44c94c2a5famr86772495e9.31.1748262766419;
        Mon, 26 May 2025 05:32:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4dc7e69c8sm1707374f8f.95.2025.05.26.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:32:46 -0700 (PDT)
Date: Mon, 26 May 2025 15:32:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Yu Zhao <yuzhao@google.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol
 'dirty'.
Message-ID: <aDRfak8sX1Pf53Pg@stanley.mountain>
References: <202505152339.fBOfDPsi-lkp@intel.com>
 <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>

On Fri, May 23, 2025 at 03:27:05PM -0700, Andrew Morton wrote:
> On Fri, 23 May 2025 13:47:54 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   088d13246a4672bc03aec664675138e3f5bff68c
> > commit: a52dcec56c5b96250f15efbd7de3d3ea6ce863d9 mm/mglru: fix PTE-mapped large folios
> > config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152339.fBOfDPsi-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 8.5.0
> > 
> > smatch warnings:
> > mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol 'dirty'.
> > mm/vmscan.c:3595 walk_pmd_range_locked() error: uninitialized symbol 'dirty'.
> > mm/vmscan.c:4215 lru_gen_look_around() error: uninitialized symbol 'dirty'.
> > 
> > ...
> >
> > bd74fdaea14602 Yu Zhao        2022-09-18  3484  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> > bd74fdaea14602 Yu Zhao        2022-09-18  3485  		unsigned long pfn;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3486  		struct folio *folio;
> > c33c794828f212 Ryan Roberts   2023-06-12  3487  		pte_t ptent = ptep_get(pte + i);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3488  
> > bd74fdaea14602 Yu Zhao        2022-09-18  3489  		total++;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3490  		walk->mm_stats[MM_LEAF_TOTAL]++;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3491  
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3492  		pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3493  		if (pfn == -1)
> > bd74fdaea14602 Yu Zhao        2022-09-18  3494  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3495  
> > 798c0330c2ca07 Yu Zhao        2024-12-30  3496  		folio = get_pfn_folio(pfn, memcg, pgdat);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3497  		if (!folio)
> > bd74fdaea14602 Yu Zhao        2022-09-18  3498  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3499  
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3500  		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3501  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3502  
> > a52dcec56c5b96 Yu Zhao        2024-12-30  3503  		if (last != folio) {
> > a52dcec56c5b96 Yu Zhao        2024-12-30 @3504  			walk_update_folio(walk, last, gen, dirty);
> 
> Seems to be notabug because last==NULL on the first loop and in this
> case walk_update_folio() will immediately return without touching
> `dirty'.   But gee, I can't blame smatch from getting fooled by this.

That's true, but if walk_update_folio() we not inlined then we would
still consider this a bug.  It's undefined behavior in the C standard
to pass uninitialized variables to a function call and also the UBSan
checker will detected it as a read at runtime.

In production systems the compiler is going to set
"bool dirty = false;" at the start of the function because everyone
runs with CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y.  Should I send a patch
which does that explicitly?

regards,
dan carpenter

