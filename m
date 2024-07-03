Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00604176ADB
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016454; cv=none; b=uVW2qleG4dUUvET3LGadLAcV3jl5Jvc7eC1+L0GE+xCWU9a98bKHZZbh62tZ2oUd/lvFCvZAUi50WG2YtJ3255loqWQ/c6Mve8Yqw8b7vl2DGLJ1QtFFO0vkSMSQDoK/mOgBMwM5Idr2o+55hrXaQOudTNuIWKJ+e6QiXN6iOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016454; c=relaxed/simple;
	bh=lqCvilgHnv+7FohAQ4T1vjFpZ3+Zam8pAgCND10TAT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OaCxlEFB9BmMaUGDTYzdgUkSOhTMt7h7TMsSghQYwi+RofhdrKWUBT9WzXLGfPJg1FBfQ38UaE1lEJFLsoadOQpqTDGw8Z3kLVYwpdOqRPlgkIm1CY7xE6G2UkNbdCxKtMwAFcrB8a0K/I2kqQQjJt5EAjqIlpZ9T9SRpQw/XkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qw57uERR; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qw57uERR"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-250c0555a63so2732337fac.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jul 2024 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720016452; x=1720621252; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7L1UJO5CVf+ex11YQP3BKJRqwMEMyOp7WQL5pl4QQg=;
        b=qw57uERR3flKehXZV0GLQ2BdupDy6BEuzb4Rg49hUaLyGpNgw41E5U2FDfL2dUnUe6
         51w0FODfWpAcPo3YUCeq7iQs7O+lJrvJ8/C6BpuVT4aSoCwy3AjmdhprYJZEKl9HUs9c
         jpnNOrk1XziBFa4w97+EMea6FxDO6JbqMn+7iPr0rYuqBldCeJFrjPU7KFw1Eo0Tk5l/
         9wizcHDN9reXRVNBXtUjQ6TL41P7R+bPXrpQSC5THuDbuFm1AfwL+GPxVTjw3TTMpLXe
         laSPYeMqdnbPFTacQ2RLl+9XVYwzgQem7ijLxE1HncX0THagWBPNuXsNUsmEADGwr+iE
         vZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720016452; x=1720621252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7L1UJO5CVf+ex11YQP3BKJRqwMEMyOp7WQL5pl4QQg=;
        b=i208tC9jepC7sdMx0ZAD5uo0/wvZC3yGLHr1l+t3Tu+qE6V8iKh1gvjCHCHzb+pblk
         LqoWICCHb3WZ1IXx9hWc8Vko+RO9bvD5bc6iaAwuYfVIZilegPe/I1fzixUjrzg2SnTE
         D+LBqEjL62mSIA5ArvLmP8t4/y3rQ5WAkxup2OynA5lhZYvudxPCqv55OPcNhYXAmWMe
         4PADstUB1N1f9PUbslx4VOWyYU9qE5c2H+tnrdD29bzOrVyaF+HXHYQ4xr4UrF5aZqIt
         53FN92nWFNY6KmuNCkkjJGUsvRqC1DlVbIImfjXHS5rduSbPP/TF9B5eNIa4GED0GuGk
         ubxw==
X-Gm-Message-State: AOJu0YyxuZdENLfoDILIqa6KxYeWeNSLc3R0gYGjm8J+THVgEi//atnq
	8M1DD/XSqddiApqMZxNNA2ICh0j1ov6yIl2cSIxsuFm360skUV1To/CJCcD+QlxnIEEyM8XC3FD
	M
X-Google-Smtp-Source: AGHT+IHpgd9xHebwYRYsECSEOPMLy6oRLK2ztQA5kLhWR35q3B7a+UhtHgAzMPXDJr9RIzDvDjvu6w==
X-Received: by 2002:a05:6870:8a0c:b0:25e:12b9:be40 with SMTP id 586e51a60fabf-25e12b9e979mr1303575fac.25.1720016451691;
        Wed, 03 Jul 2024 07:20:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:5b79:ebe0:e3cb:2ba6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e036fd73csm564136fac.26.2024.07.03.07.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:20:51 -0700 (PDT)
Date: Wed, 3 Jul 2024 16:20:49 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 16/17] fs/netfs/read_collect.c:170
 netfs_consume_read_data() error: we previously assumed 'folioq' could be
 null (see line 110)
Message-ID: <6cc43674-4d95-49b6-a279-4b0c7f7f4ceb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   87ff2bfa2eb1cac0a80d376b99b244e96f582721
commit: 5a2bec0ed38eec31673fd7c48b558c29db922e1a [16/17] netfs: Speed up buffered reading
config: i386-randconfig-141-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031405.z0FPKCLr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407031405.z0FPKCLr-lkp@intel.com/

smatch warnings:
fs/netfs/read_collect.c:170 netfs_consume_read_data() error: we previously assumed 'folioq' could be null (see line 110)

vim +/folioq +170 fs/netfs/read_collect.c

5a2bec0ed38eec David Howells 2024-07-02   81  static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq, bool was_async)
5a2bec0ed38eec David Howells 2024-07-02   82  {
5a2bec0ed38eec David Howells 2024-07-02   83  	struct netfs_io_subrequest *prev, *next;
5a2bec0ed38eec David Howells 2024-07-02   84  	struct netfs_io_request *rreq = subreq->rreq;
5a2bec0ed38eec David Howells 2024-07-02   85  	struct folio_queue *folioq = subreq->curr_folioq;
5a2bec0ed38eec David Howells 2024-07-02   86  	size_t avail, prev_donated, next_donated, fsize, part, excess;
5a2bec0ed38eec David Howells 2024-07-02   87  	loff_t fpos, start;
5a2bec0ed38eec David Howells 2024-07-02   88  	loff_t fend;
5a2bec0ed38eec David Howells 2024-07-02   89  	int slot = subreq->curr_folioq_slot;
5a2bec0ed38eec David Howells 2024-07-02   90  
5a2bec0ed38eec David Howells 2024-07-02   91  	if (WARN(subreq->transferred > subreq->len,
5a2bec0ed38eec David Howells 2024-07-02   92  		 "Subreq overread: R%x[%x] %zu > %zu",
5a2bec0ed38eec David Howells 2024-07-02   93  		 rreq->debug_id, subreq->debug_index,
5a2bec0ed38eec David Howells 2024-07-02   94  		 subreq->transferred, subreq->len))
5a2bec0ed38eec David Howells 2024-07-02   95  		subreq->transferred = subreq->len;
5a2bec0ed38eec David Howells 2024-07-02   96  
5a2bec0ed38eec David Howells 2024-07-02   97  next_folio:
5a2bec0ed38eec David Howells 2024-07-02   98  	fsize = PAGE_SIZE << subreq->curr_folio_order;
5a2bec0ed38eec David Howells 2024-07-02   99  	fpos = round_down(subreq->start + subreq->consumed, fsize);
5a2bec0ed38eec David Howells 2024-07-02  100  	fend = fpos + fsize;
5a2bec0ed38eec David Howells 2024-07-02  101  
5a2bec0ed38eec David Howells 2024-07-02  102  	if (WARN_ON_ONCE(!folioq) ||

Presumably we're never going to trigger this warning...

5a2bec0ed38eec David Howells 2024-07-02  103  	    WARN_ON_ONCE(!folioq_folio(folioq, slot)) ||
5a2bec0ed38eec David Howells 2024-07-02  104  	    WARN_ON_ONCE(folioq_folio(folioq, slot)->index != fpos / PAGE_SIZE)) {
5a2bec0ed38eec David Howells 2024-07-02  105  		pr_err("R=%08x[%x] s=%llx-%llx ctl=%zx/%zx/%zx sl=%u\n",
5a2bec0ed38eec David Howells 2024-07-02  106  		       rreq->debug_id, subreq->debug_index,
5a2bec0ed38eec David Howells 2024-07-02  107  		       subreq->start, subreq->start + subreq->transferred,
5a2bec0ed38eec David Howells 2024-07-02  108  		       subreq->consumed, subreq->transferred, subreq->len,
5a2bec0ed38eec David Howells 2024-07-02  109  		       slot);
5a2bec0ed38eec David Howells 2024-07-02 @110  		if (folioq) {
5a2bec0ed38eec David Howells 2024-07-02  111  			struct folio *folio = folioq_folio(folioq, slot);
5a2bec0ed38eec David Howells 2024-07-02  112  
5a2bec0ed38eec David Howells 2024-07-02  113  			pr_err("folioq: %02x%02x%02x%02x\n",
5a2bec0ed38eec David Howells 2024-07-02  114  			       folioq->orders[0], folioq->orders[1],
5a2bec0ed38eec David Howells 2024-07-02  115  			       folioq->orders[2], folioq->orders[3]);
5a2bec0ed38eec David Howells 2024-07-02  116  			if (folio)
5a2bec0ed38eec David Howells 2024-07-02  117  				pr_err("folio: %llx-%llx ix=%llx o=%u qo=%u\n",
5a2bec0ed38eec David Howells 2024-07-02  118  				       fpos, fend - 1, folio_pos(folio), folio_order(folio),
5a2bec0ed38eec David Howells 2024-07-02  119  				       folioq_folio_order(folioq, slot));
5a2bec0ed38eec David Howells 2024-07-02  120  		}
5a2bec0ed38eec David Howells 2024-07-02  121  	}
5a2bec0ed38eec David Howells 2024-07-02  122  
5a2bec0ed38eec David Howells 2024-07-02  123  donation_changed:
5a2bec0ed38eec David Howells 2024-07-02  124  	/* Try to consume the current folio if we've hit or passed the end of
5a2bec0ed38eec David Howells 2024-07-02  125  	 * it.  There's a possibility that this subreq doesn't start at the
5a2bec0ed38eec David Howells 2024-07-02  126  	 * beginning of the folio, in which case we need to donate to/from the
5a2bec0ed38eec David Howells 2024-07-02  127  	 * preceding subreq.
5a2bec0ed38eec David Howells 2024-07-02  128  	 *
5a2bec0ed38eec David Howells 2024-07-02  129  	 * We also need to include any potential donation back from the
5a2bec0ed38eec David Howells 2024-07-02  130  	 * following subreq.
5a2bec0ed38eec David Howells 2024-07-02  131  	 */
5a2bec0ed38eec David Howells 2024-07-02  132  	prev_donated = READ_ONCE(subreq->prev_donated);
5a2bec0ed38eec David Howells 2024-07-02  133  	next_donated =  READ_ONCE(subreq->next_donated);
5a2bec0ed38eec David Howells 2024-07-02  134  	if (prev_donated || next_donated) {
5a2bec0ed38eec David Howells 2024-07-02  135  		spin_lock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  136  		prev_donated = subreq->prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  137  		next_donated =  subreq->next_donated;
5a2bec0ed38eec David Howells 2024-07-02  138  		subreq->start -= prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  139  		subreq->len += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  140  		subreq->transferred += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  141  		prev_donated = subreq->prev_donated = 0;
5a2bec0ed38eec David Howells 2024-07-02  142  		if (subreq->transferred == subreq->len) {
5a2bec0ed38eec David Howells 2024-07-02  143  			subreq->len += next_donated;
5a2bec0ed38eec David Howells 2024-07-02  144  			subreq->transferred += next_donated;
5a2bec0ed38eec David Howells 2024-07-02  145  			next_donated = subreq->next_donated = 0;
5a2bec0ed38eec David Howells 2024-07-02  146  		}
5a2bec0ed38eec David Howells 2024-07-02  147  		trace_netfs_sreq(subreq, netfs_sreq_trace_add_donations);
5a2bec0ed38eec David Howells 2024-07-02  148  		spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  149  	}
5a2bec0ed38eec David Howells 2024-07-02  150  
5a2bec0ed38eec David Howells 2024-07-02  151  	avail = subreq->transferred;
5a2bec0ed38eec David Howells 2024-07-02  152  	if (avail == subreq->len)
5a2bec0ed38eec David Howells 2024-07-02  153  		avail += next_donated;
5a2bec0ed38eec David Howells 2024-07-02  154  	start = subreq->start;
5a2bec0ed38eec David Howells 2024-07-02  155  	if (subreq->consumed == 0) {
5a2bec0ed38eec David Howells 2024-07-02  156  		start -= prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  157  		avail += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  158  	} else {
5a2bec0ed38eec David Howells 2024-07-02  159  		start += subreq->consumed;
5a2bec0ed38eec David Howells 2024-07-02  160  		avail -= subreq->consumed;
5a2bec0ed38eec David Howells 2024-07-02  161  	}
5a2bec0ed38eec David Howells 2024-07-02  162  	part = umin(avail, fsize);
5a2bec0ed38eec David Howells 2024-07-02  163  
5a2bec0ed38eec David Howells 2024-07-02  164  	trace_netfs_progress(subreq, start, avail, part);
5a2bec0ed38eec David Howells 2024-07-02  165  
5a2bec0ed38eec David Howells 2024-07-02  166  	if (start + avail >= fend) {
5a2bec0ed38eec David Howells 2024-07-02  167  		if (fpos == start) {
5a2bec0ed38eec David Howells 2024-07-02  168  			/* Flush, unlock and mark for caching any folio we've just read. */
5a2bec0ed38eec David Howells 2024-07-02  169  			subreq->consumed = fend - subreq->start;
5a2bec0ed38eec David Howells 2024-07-02 @170  			netfs_unlock_read_folio(subreq, rreq, folioq_folio(folioq, slot));
                                                                                                                   ^^^^^^
Unchecked dereference.

5a2bec0ed38eec David Howells 2024-07-02  171  			folioq_mark2(folioq, slot);
5a2bec0ed38eec David Howells 2024-07-02  172  			if (subreq->consumed >= subreq->len)
5a2bec0ed38eec David Howells 2024-07-02  173  				goto remove_subreq;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

