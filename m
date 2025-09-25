Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188AB28468C
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792968; cv=none; b=Rb9cvJS20ION4RZlafWOD/D/vuhaZA/Prf6XYnXRM/MYbkqTBlkZyn4L2N9aSopIJDSUkxyGbuxXaA3mvy7jYPFFTPFFgKEFp6JOLaGbcW10M/vKqRevEO5+eDa2SPNd2Z/Lo+to2fCMJ14/V+QeMM3xxGjjqEL3c1aVGMb23ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792968; c=relaxed/simple;
	bh=JoEco1ORCJ3vsujBfD97FlP/QCfpmBzbQnAHO29lOUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/lgn6GC7AIa8SAY6TUrX00sjAnY/G9VU/oylWyaYMyWSCednVXA9NGqHuiEPOJKACEUwqrrn09XYhGH1MuJJqoj83zA56CF1hrsclGzjATdhW+Kp65Ce2WLqajo40VmtkjMv2QtN2o6a76gMsd9nhkZXJ2sGu7x0IfUEHtvyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EFGrT1/2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EFGrT1/2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f44000626bso538416f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758792964; x=1759397764; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jYEu1Tq9xAippcq+IfTMzB7lzIXzWuNmB21Rn5eEr7o=;
        b=EFGrT1/2Apr9DBM7RFlLmoQ+YdA62ipwfVia0JDWt9no+Dw4bGQ3ozHs+oCsuKYB2X
         N3w0tICIq2RTDUGilwdM2t7FNvE1yvJF/jQyEEW13nO/caNB3bAEPwqwT3avVuMktGQs
         AYgWkHSCjq5B7dDiJ5zvXBEISFSZ58tLUccNuwBP0jPNjoX5fJjqX4ahbiqJXMIwF/bN
         ABVZBnEtAs5PEfLlQipAUxpXrKlHycFt0e95FvKjk5vVWVYD2Na7WleTCLPo7tVtKIz1
         u1NBNhWR6qIrC3USwVd+F4G4Xo5LPSi97wNyMkDq7kBkKL16uLZmST+ElsbksqhuMryR
         f5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792964; x=1759397764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYEu1Tq9xAippcq+IfTMzB7lzIXzWuNmB21Rn5eEr7o=;
        b=D2907Rj8GVwJgg5nDAt3t+ZaGSF7kjCgaECI263FIWI1Zu+Do3Q50tkNNTePAj3/ob
         lzC4EOyiwt5K3IfPdsEGxjAEPsnrvuozZKTmgFs6s3o5z0Ke1YmZGl1g5M6XZuxnr/82
         ItmJU1rmLhlyieANgJgNYjFM5y1luz4zh2T2SWyuU8TWD3/kRq/LMezqdQSF705hkEI3
         zKCSa15ghr3pS8i2bsHZhqAAHTMFOL35SwmvALJO/cp/ZDS/GMHv2az4eUK3HEnl+GAl
         MvwMUuhOhPFnn7iaPF0gxmZ9ovTAsekHcJdHTBThAuucmEHGx4IfvfTbWJBY0sIUnzji
         F9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXjYxj1/BGd9RbsMbphdOSlLD4slWsAzgJKMqBNkqzksK8R8IrGfHu4SPvwUWajrXnJYKpgccgpM9M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3K53aQHzdE183kzul7kIOi3IFWBMvjpuwvG58XElLUcH7Kgpq
	lX8ZO4k6brEIO5cOboC0vP0GthwC9ub4n0iugQADzNVErx/rQsvWSan+zL6Gv5Hwu5I=
X-Gm-Gg: ASbGncsAVN77W8HlHId0lQg6K5YT4a2EaNGQG1Bz2/nW3kx5lA+Y2YjyOVVGPg6hxhy
	wtcuo8zbQM13xRPTMXgbl9+ol+WUud1m/1FUR+wMcrjXy19TkzW04H8qFNPOcCwUPotMy99GFJQ
	qd8cmh50J5oEoLZnEqUVVkpueq6ViiptpDt38eIYQYTOv/mTO24Nuhl3Rcd/AtS8eC0bMvxhl43
	UgCpX7ewn/JiRFcFQ/3Z/n0YrgH4LXmmhDDxAD3jMVskeBSF5NVTaKKdy/CfNdl/i/uG3Xm1174
	eOs0apGOZcL6z6wd1vpIJCpCtSwBvas+NWKX0cyiBCVyctgTzYolxEndlOP4/3RR8bL7LJFaDAr
	mzmqRuphDefILqjXjM+ubWmf8w1qW2ZuN4AxoY8L2QfIWeAfxdkY=
X-Google-Smtp-Source: AGHT+IESDLQxVAaClx4hDQ1zShJdqPgjF0sYhTJKCdatbY7PyftOErKA70gNMLZ6WhwLXV5qZroClQ==
X-Received: by 2002:a05:6000:400b:b0:3f0:4365:1d36 with SMTP id ffacd0b85a97d-40e4354dfddmr3090098f8f.16.1758792964018;
        Thu, 25 Sep 2025 02:36:04 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69ba58csm18624025ad.121.2025.09.25.02.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:36:03 -0700 (PDT)
Message-ID: <a3f50592-0816-42fb-a7f0-185ceb975016@suse.com>
Date: Thu, 25 Sep 2025 19:05:59 +0930
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 11380/12207] fs/btrfs/extent_io.c:401
 find_lock_delalloc_range() error: we previously assumed 'fs_info' could be
 null (see line 378)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 David Sterba <dsterba@suse.com>
References: <202509250925.4L4JQTtn-lkp@intel.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <202509250925.4L4JQTtn-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/9/25 15:40, Dan Carpenter 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b5a4da2c459f79a2c87c867398f1c0c315779781
> commit: 7b26da407420e5054e3f06c5d13271697add9423 [11380/12207] btrfs: fix the incorrect max_bytes value for find_lock_delalloc_range()
> config: i386-randconfig-141-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250925.4L4JQTtn-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509250925.4L4JQTtn-lkp@intel.com/
> 
> smatch warnings:
> fs/btrfs/extent_io.c:401 find_lock_delalloc_range() error: we previously assumed 'fs_info' could be null (see line 378)
> 
> vim +/fs_info +401 fs/btrfs/extent_io.c
> 
> ce9f967f31ea91 Johannes Thumshirn 2018-11-19  368  EXPORT_FOR_TESTS
> 3522e90301d7a6 Lu Fengqi          2018-11-29  369  noinline_for_stack bool find_lock_delalloc_range(struct inode *inode,
> c987f1e6d4435a Josef Bacik        2024-07-24  370  						 struct folio *locked_folio,
> c987f1e6d4435a Josef Bacik        2024-07-24  371  						 u64 *start, u64 *end)
> c8b978188c9a0f Chris Mason        2008-10-29  372  {
> 41044b41ad2c8c David Sterba       2023-09-14  373  	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
> 9978059be8a1af Goldwyn Rodrigues  2019-06-21  374  	struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
> 2749f7ef3643fe Qu Wenruo          2021-09-27  375  	const u64 orig_start = *start;
> 2749f7ef3643fe Qu Wenruo          2021-09-27  376  	const u64 orig_end = *end;
> f7b12a62f008a3 Naohiro Aota       2022-07-09  377  	/* The sanity tests may not set a valid fs_info. */
> f7b12a62f008a3 Naohiro Aota       2022-07-09 @378  	u64 max_bytes = fs_info ? fs_info->max_extent_size : BTRFS_MAX_EXTENT_SIZE;
>                                                                          ^^^^^^^
> NULL check

This is a false alert.

The existing check is for selftests, but upstream commit 7c0260ee098d 
("btrfs: tests, require fs_info for root"), it is required to have 
btrfs_root::fs_info populated for all roots, no matter if it's selftest 
or not.

So the NULL check itself is no longer needed.

Thanks,
Qu
> 
> c8b978188c9a0f Chris Mason        2008-10-29  379  	u64 delalloc_start;
> c8b978188c9a0f Chris Mason        2008-10-29  380  	u64 delalloc_end;
> 3522e90301d7a6 Lu Fengqi          2018-11-29  381  	bool found;
> 9655d2982b53fd Chris Mason        2009-09-02  382  	struct extent_state *cached_state = NULL;
> c8b978188c9a0f Chris Mason        2008-10-29  383  	int ret;
> c8b978188c9a0f Chris Mason        2008-10-29  384  	int loops = 0;
> c8b978188c9a0f Chris Mason        2008-10-29  385
> 2749f7ef3643fe Qu Wenruo          2021-09-27  386  	/* Caller should pass a valid @end to indicate the search range end */
> 2749f7ef3643fe Qu Wenruo          2021-09-27  387  	ASSERT(orig_end > orig_start);
> 2749f7ef3643fe Qu Wenruo          2021-09-27  388
> c987f1e6d4435a Josef Bacik        2024-07-24  389  	/* The range should at least cover part of the folio */
> 55cd57faa50346 David Sterba       2025-06-10  390  	ASSERT(!(orig_start >= folio_end(locked_folio) ||
> c987f1e6d4435a Josef Bacik        2024-07-24  391  		 orig_end <= folio_pos(locked_folio)));
> c8b978188c9a0f Chris Mason        2008-10-29  392  again:
> c8b978188c9a0f Chris Mason        2008-10-29  393  	/* step one, find a bunch of delalloc bytes starting at start */
> c8b978188c9a0f Chris Mason        2008-10-29  394  	delalloc_start = *start;
> c8b978188c9a0f Chris Mason        2008-10-29  395  	delalloc_end = 0;
> 7b26da407420e5 Qu Wenruo          2025-09-19  396
> 7b26da407420e5 Qu Wenruo          2025-09-19  397  	/*
> 7b26da407420e5 Qu Wenruo          2025-09-19  398  	 * If @max_bytes is smaller than a block, btrfs_find_delalloc_range() can
> 7b26da407420e5 Qu Wenruo          2025-09-19  399  	 * return early without handling any dirty ranges.
> 7b26da407420e5 Qu Wenruo          2025-09-19  400  	 */
> 7b26da407420e5 Qu Wenruo          2025-09-19 @401  	ASSERT(max_bytes >= fs_info->sectorsize);
>                                                                              ^^^^^^^^^^^^^^^^^^^
> Unchecked dereference
> 
> 7b26da407420e5 Qu Wenruo          2025-09-19  402
> 083e75e7e6a9e2 Josef Bacik        2019-09-23  403  	found = btrfs_find_delalloc_range(tree, &delalloc_start, &delalloc_end,
> c2a128d28a2e78 Josef Bacik        2010-02-02  404  					  max_bytes, &cached_state);
> 2749f7ef3643fe Qu Wenruo          2021-09-27  405  	if (!found || delalloc_end <= *start || delalloc_start > orig_end) {
> c8b978188c9a0f Chris Mason        2008-10-29  406  		*start = delalloc_start;
> 2749f7ef3643fe Qu Wenruo          2021-09-27  407
> 2749f7ef3643fe Qu Wenruo          2021-09-27  408  		/* @delalloc_end can be -1, never go beyond @orig_end */
> 2749f7ef3643fe Qu Wenruo          2021-09-27  409  		*end = min(delalloc_end, orig_end);
> b351161f4f6643 Filipe Manana      2025-04-04  410  		btrfs_free_extent_state(cached_state);
> 3522e90301d7a6 Lu Fengqi          2018-11-29  411  		return false;
> c8b978188c9a0f Chris Mason        2008-10-29  412  	}
> c8b978188c9a0f Chris Mason        2008-10-29  413
> 70b99e6959a4c2 Chris Mason        2008-10-31  414  	/*
> c987f1e6d4435a Josef Bacik        2024-07-24  415  	 * start comes from the offset of locked_folio.  We have to lock
> c987f1e6d4435a Josef Bacik        2024-07-24  416  	 * folios in order, so we can't process delalloc bytes before
> c987f1e6d4435a Josef Bacik        2024-07-24  417  	 * locked_folio
> 70b99e6959a4c2 Chris Mason        2008-10-31  418  	 */
> d397712bcc6a75 Chris Mason        2009-01-05  419  	if (delalloc_start < *start)
> 70b99e6959a4c2 Chris Mason        2008-10-31  420  		delalloc_start = *start;
> 70b99e6959a4c2 Chris Mason        2008-10-31  421
> c8b978188c9a0f Chris Mason        2008-10-29  422  	/*
> c987f1e6d4435a Josef Bacik        2024-07-24  423  	 * make sure to limit the number of folios we try to lock down
> c8b978188c9a0f Chris Mason        2008-10-29  424  	 */
> 7bf811a595a895 Josef Bacik        2013-10-07  425  	if (delalloc_end + 1 - delalloc_start > max_bytes)
> 7bf811a595a895 Josef Bacik        2013-10-07  426  		delalloc_end = delalloc_start + max_bytes - 1;
> d397712bcc6a75 Chris Mason        2009-01-05  427
> 17dc82dc1e77a6 David Sterba       2025-08-22  428  	/* step two, lock all the folios after the folios that has start */
> e4d80ebe50de25 Josef Bacik        2024-07-24  429  	ret = lock_delalloc_folios(inode, locked_folio, delalloc_start,
> e4d80ebe50de25 Josef Bacik        2024-07-24  430  				   delalloc_end);
> 9bfd61d9755a51 Nikolay Borisov    2018-10-26  431  	ASSERT(!ret || ret == -EAGAIN);
> c8b978188c9a0f Chris Mason        2008-10-29  432  	if (ret == -EAGAIN) {
> 7b26da407420e5 Qu Wenruo          2025-09-19  433  		/*
> 7b26da407420e5 Qu Wenruo          2025-09-19  434  		 * Some of the folios are gone, lets avoid looping by
> 7b26da407420e5 Qu Wenruo          2025-09-19  435  		 * shortening the size of the delalloc range we're searching.
> c8b978188c9a0f Chris Mason        2008-10-29  436  		 */
> b351161f4f6643 Filipe Manana      2025-04-04  437  		btrfs_free_extent_state(cached_state);
> 7d78874273463a Chris Mason        2014-05-21  438  		cached_state = NULL;
> c8b978188c9a0f Chris Mason        2008-10-29  439  		if (!loops) {
> 7b26da407420e5 Qu Wenruo          2025-09-19  440  			max_bytes = fs_info->sectorsize;
>                                                                                      ^^^^^^^^^^^^^^^^^^^
> Here too, I suppose.
> 
> c8b978188c9a0f Chris Mason        2008-10-29  441  			loops = 1;
> c8b978188c9a0f Chris Mason        2008-10-29  442  			goto again;
> c8b978188c9a0f Chris Mason        2008-10-29  443  		} else {
> 3522e90301d7a6 Lu Fengqi          2018-11-29  444  			found = false;
> c8b978188c9a0f Chris Mason        2008-10-29  445  			goto out_failed;
> c8b978188c9a0f Chris Mason        2008-10-29  446  		}
> c8b978188c9a0f Chris Mason        2008-10-29  447  	}
> c8b978188c9a0f Chris Mason        2008-10-29  448
> c8b978188c9a0f Chris Mason        2008-10-29  449  	/* step three, lock the state bits for the whole range */
> 242570e80bfdf3 Filipe Manana      2025-03-31  450  	btrfs_lock_extent(tree, delalloc_start, delalloc_end, &cached_state);
> c8b978188c9a0f Chris Mason        2008-10-29  451
> c8b978188c9a0f Chris Mason        2008-10-29  452  	/* then test to make sure it is all still delalloc */
> f81c2aea711205 Filipe Manana      2025-04-04  453  	ret = btrfs_test_range_bit(tree, delalloc_start, delalloc_end,
> 893fe243999466 David Sterba       2020-08-14  454  				   EXTENT_DELALLOC, cached_state);
> c0707c9e1e36d5 Josef Bacik        2024-02-12  455
> 242570e80bfdf3 Filipe Manana      2025-03-31  456  	btrfs_unlock_extent(tree, delalloc_start, delalloc_end, &cached_state);
> c8b978188c9a0f Chris Mason        2008-10-29  457  	if (!ret) {
> 2b41599bff1714 David Sterba       2025-01-09  458  		unlock_delalloc_folio(inode, locked_folio, delalloc_start,
> 79be4a28d834ea Josef Bacik        2024-07-24  459  				      delalloc_end);
> c8b978188c9a0f Chris Mason        2008-10-29  460  		cond_resched();
> c8b978188c9a0f Chris Mason        2008-10-29  461  		goto again;
> c8b978188c9a0f Chris Mason        2008-10-29  462  	}
> c8b978188c9a0f Chris Mason        2008-10-29  463  	*start = delalloc_start;
> c8b978188c9a0f Chris Mason        2008-10-29  464  	*end = delalloc_end;
> c8b978188c9a0f Chris Mason        2008-10-29  465  out_failed:
> c8b978188c9a0f Chris Mason        2008-10-29  466  	return found;
> c8b978188c9a0f Chris Mason        2008-10-29  467  }
> 

