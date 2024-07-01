Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B8E53AC
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719847786; cv=none; b=UwP2CdgqasJOKL+JjX2wrhHfggrcH01uvoHzGR3YBSBYuop2u8upF9qkQFXWEn9N1mac8ntg6OOXZU6WsPtS2pQFNvBtpvNlez0SsCIoMXdbZDFnzuBFyWI+KMffjicv8RT5e5Id3TP/V1TEkfzLYaZzImk3wHND9AzPe9g/GrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719847786; c=relaxed/simple;
	bh=dgcxhfxO7XNNZIIzsXhXS9h51GmpNb4bbMCjqOprPVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F//QsZzoQ7yUt4/w5pJctE6z+xHfCIUkGLZgUpDpZppfrhHFK5EWlLJfHsG/IWMOLDHf1rXFWsbvvexbt3dUo/UBMQpt3H81RfnnDzZGWpTDPm8zOXct9ipcocpoSS9uV8ar67VhxH7zqiZrdn7SxZojiJ2KUnxlJgbGplQ5YS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skb5JW6Q; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skb5JW6Q"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5b53bb4bebaso1747780eaf.0
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719847783; x=1720452583; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EchXEgvYyyprQwbhpSObEGQxgcJUwnnkANo7fhZuSTo=;
        b=skb5JW6QEjh+FsbHit+AsY5FEBd9/FXpR4IObBPUJYAthqEgY49l+bYmu9HdVPoBgk
         UG0dsLMUkwjA6mrvGqIG2JzIx+GoDnYhy4W8ZbMhwh15tRlo4I9EnzO8u6sii5pzsXy0
         +YI0lI8L+EeYXiW2EWoz5Yyt1TEeNZtU49jzBfdVc9/yI2KwRMlEKWCGJOB77cbG36C9
         rtj6dxByLFsYTCDyu8abLbT99GNzdfQ2dASz4sh59WO/3erZsH56tKud54zxweAa9WHr
         PJx5qxsCw+T82sMZF8a+/4F5F0IoIJOzNKKgRHvEm9UKHK+9xGPvHIGb/Yo8hdZibFiS
         um/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847783; x=1720452583;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EchXEgvYyyprQwbhpSObEGQxgcJUwnnkANo7fhZuSTo=;
        b=NKgDf4ACwiudwKNQ6MTIUjpurruv/u1Bgs8tTaXNPRMSzQMf02dAXr/4R8hGqYf7Ph
         P9bvSsvot9v2WKQSrqpesoiH08tjDxxDeNSahDQSb+bnH8zJgwQzn9zHkytWa9ZNQTwI
         vs9ASG4VdgaSYd59n4ib7F6Kgi0GQXQeFg7CusoOPVtipB8qc1C3HxIGbo55GZ6fAEkR
         UdFygHjPaBhK+39Q2JJTUk3cX5vIJ0Gpfq8a9YK2QlgdPAj/rE2VStW+unM9OioYe9Cm
         R0W3fg8tSIWTqxTUcGysRYzUxPgWXh9IRsg9SC56+UYBvNGFtcbQDyc3KYKpJOmXyeew
         5G3A==
X-Gm-Message-State: AOJu0YwDAIPUmQAIOfYmaGiclNR4ZmsabT520KlY3TafCTPrEKjV9cfR
	ZpMrbpfNZXtBW8mOy0ZEdb1kCw5CHfZMyZkr5OdxpkUqKCbs32q2QIhxyldyJcswde+9hhfDUZL
	Z
X-Google-Smtp-Source: AGHT+IHozdhWENFtYSiNW51hppR/6UWlYxrNZgU98Z6IuLUyKOa8uDIyf050rk+OT+Tv/n/HtNZZOA==
X-Received: by 2002:a05:6870:d24e:b0:254:a6ea:c315 with SMTP id 586e51a60fabf-25db348bc66mr6128043fac.21.1719847783572;
        Mon, 01 Jul 2024 08:29:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25d8e3841bdsm1781544fac.48.2024.07.01.08.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:29:42 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:29:39 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 17/17] fs/netfs/buffered_read.c:280
 netfs_read_to_pagecache() error: uninitialized symbol 'slice'.
Message-ID: <4c2dd2d5-1360-4611-b2a6-d63013104a8c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   ce62c8542631d1deea2fcedbbba41046c3f95285
commit: d75f8ece3c49fa2ab1299cdabfc879952702a19a [17/17] netfs: Speed up buffered reading
config: x86_64-randconfig-161-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220713.ZTEHfOyc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406220713.ZTEHfOyc-lkp@intel.com/

New smatch warnings:
fs/netfs/buffered_read.c:280 netfs_read_to_pagecache() error: uninitialized symbol 'slice'.
fs/smb/client/file.c:166 cifs_issue_read() warn: unsigned 'len' is never less than zero.

Old smatch warnings:
fs/smb/client/file.c:3054 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see line 3025)

vim +/slice +280 fs/netfs/buffered_read.c

d75f8ece3c49fa2 David Howells 2024-06-19  212  static int netfs_read_to_pagecache(struct netfs_io_request *rreq)
d75f8ece3c49fa2 David Howells 2024-06-19  213  {
d75f8ece3c49fa2 David Howells 2024-06-19  214  	struct netfs_inode *ictx = netfs_inode(rreq->inode);
d75f8ece3c49fa2 David Howells 2024-06-19  215  	unsigned long long start = rreq->start;
d75f8ece3c49fa2 David Howells 2024-06-19  216  	ssize_t size = rreq->len;
d75f8ece3c49fa2 David Howells 2024-06-19  217  
d75f8ece3c49fa2 David Howells 2024-06-19  218  	/* Chop the readahead request up into subrequests. */
d75f8ece3c49fa2 David Howells 2024-06-19  219  	do {
d75f8ece3c49fa2 David Howells 2024-06-19  220  		struct netfs_io_subrequest *subreq;
d75f8ece3c49fa2 David Howells 2024-06-19  221  		enum netfs_io_source source = NETFS_DOWNLOAD_FROM_SERVER;
d75f8ece3c49fa2 David Howells 2024-06-19  222  		ssize_t slice;
d75f8ece3c49fa2 David Howells 2024-06-19  223  
d75f8ece3c49fa2 David Howells 2024-06-19  224  		subreq = netfs_alloc_subrequest(rreq);
d75f8ece3c49fa2 David Howells 2024-06-19  225  		if (!subreq)
d75f8ece3c49fa2 David Howells 2024-06-19  226  			return -ENOMEM;
d75f8ece3c49fa2 David Howells 2024-06-19  227  
d75f8ece3c49fa2 David Howells 2024-06-19  228  		subreq->source	= NETFS_DOWNLOAD_FROM_SERVER;
d75f8ece3c49fa2 David Howells 2024-06-19  229  		subreq->start	= start;
d75f8ece3c49fa2 David Howells 2024-06-19  230  		subreq->len	= size;
d75f8ece3c49fa2 David Howells 2024-06-19  231  
d75f8ece3c49fa2 David Howells 2024-06-19  232  		spin_lock(&rreq->lock);
d75f8ece3c49fa2 David Howells 2024-06-19  233  		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
d75f8ece3c49fa2 David Howells 2024-06-19  234  		subreq->prev_donated = rreq->prev_donated;
d75f8ece3c49fa2 David Howells 2024-06-19  235  		rreq->prev_donated = 0;
d75f8ece3c49fa2 David Howells 2024-06-19  236  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
d75f8ece3c49fa2 David Howells 2024-06-19  237  		spin_unlock(&rreq->lock);
d75f8ece3c49fa2 David Howells 2024-06-19  238  
d75f8ece3c49fa2 David Howells 2024-06-19  239  		source = netfs_cache_prepare_read(rreq, subreq, rreq->i_size);
d75f8ece3c49fa2 David Howells 2024-06-19  240  		if (source == NETFS_DOWNLOAD_FROM_SERVER) {
d75f8ece3c49fa2 David Howells 2024-06-19  241  			if (subreq->start >= ictx->zero_point) {
d75f8ece3c49fa2 David Howells 2024-06-19  242  				subreq->source = source = NETFS_FILL_WITH_ZEROES;
d75f8ece3c49fa2 David Howells 2024-06-19  243  				goto fill_with_zeroes;

source == NETFS_DOWNLOAD_FROM_SERVER and we hit this goto

d75f8ece3c49fa2 David Howells 2024-06-19  244  			}
d75f8ece3c49fa2 David Howells 2024-06-19  245  
d75f8ece3c49fa2 David Howells 2024-06-19  246  			if (subreq->len > ictx->zero_point - subreq->start)
d75f8ece3c49fa2 David Howells 2024-06-19  247  				subreq->len = ictx->zero_point - subreq->start;
d75f8ece3c49fa2 David Howells 2024-06-19  248  			if (subreq->len > rreq->i_size - subreq->start)
d75f8ece3c49fa2 David Howells 2024-06-19  249  				subreq->len = rreq->i_size - subreq->start;
d75f8ece3c49fa2 David Howells 2024-06-19  250  
d75f8ece3c49fa2 David Howells 2024-06-19  251  			netfs_stat(&netfs_n_rh_download);
d75f8ece3c49fa2 David Howells 2024-06-19  252  			slice = rreq->netfs_ops->issue_read(subreq);
d75f8ece3c49fa2 David Howells 2024-06-19  253  			if (slice <= 0)
d75f8ece3c49fa2 David Howells 2024-06-19  254  				return slice;
d75f8ece3c49fa2 David Howells 2024-06-19  255  			goto done;
d75f8ece3c49fa2 David Howells 2024-06-19  256  		}
d75f8ece3c49fa2 David Howells 2024-06-19  257  
d75f8ece3c49fa2 David Howells 2024-06-19  258  	fill_with_zeroes:
d75f8ece3c49fa2 David Howells 2024-06-19  259  		if (source == NETFS_FILL_WITH_ZEROES) {
d75f8ece3c49fa2 David Howells 2024-06-19  260  			subreq->source = NETFS_FILL_WITH_ZEROES;
d75f8ece3c49fa2 David Howells 2024-06-19  261  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
d75f8ece3c49fa2 David Howells 2024-06-19  262  			netfs_stat(&netfs_n_rh_zero);
d75f8ece3c49fa2 David Howells 2024-06-19  263  			slice = subreq->len;
d75f8ece3c49fa2 David Howells 2024-06-19  264  			subreq->transferred = slice;
d75f8ece3c49fa2 David Howells 2024-06-19  265  			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
d75f8ece3c49fa2 David Howells 2024-06-19  266  			netfs_read_subreq_progress(subreq, 0, false);
d75f8ece3c49fa2 David Howells 2024-06-19  267  			goto done;
d75f8ece3c49fa2 David Howells 2024-06-19  268  		}
d75f8ece3c49fa2 David Howells 2024-06-19  269  
d75f8ece3c49fa2 David Howells 2024-06-19  270  		if (source == NETFS_READ_FROM_CACHE) {
d75f8ece3c49fa2 David Howells 2024-06-19  271  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
d75f8ece3c49fa2 David Howells 2024-06-19  272  			slice = netfs_read_cache_to_pagecache(rreq, subreq);
d75f8ece3c49fa2 David Howells 2024-06-19  273  			goto done;
d75f8ece3c49fa2 David Howells 2024-06-19  274  		}
d75f8ece3c49fa2 David Howells 2024-06-19  275  
d75f8ece3c49fa2 David Howells 2024-06-19  276  		if (source == NETFS_INVALID_READ)
d75f8ece3c49fa2 David Howells 2024-06-19  277  			break;
d75f8ece3c49fa2 David Howells 2024-06-19  278  
d75f8ece3c49fa2 David Howells 2024-06-19  279  	done:
d75f8ece3c49fa2 David Howells 2024-06-19 @280  		size -= slice;
                                                                ^^^^^
Uninitialized.

d75f8ece3c49fa2 David Howells 2024-06-19  281  		start += slice;
d75f8ece3c49fa2 David Howells 2024-06-19  282  		cond_resched();
d75f8ece3c49fa2 David Howells 2024-06-19  283  	} while (size > 0);
d75f8ece3c49fa2 David Howells 2024-06-19  284  
d75f8ece3c49fa2 David Howells 2024-06-19  285  	return 0;
d75f8ece3c49fa2 David Howells 2024-06-19  286  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

