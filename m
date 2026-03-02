Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF054375ABD
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441575; cv=none; b=sSfNArEj1zwHScS4Csx8MIXGd+2+hN5DPPvv57B5AvUfgajWyhUr0i1Nh6n/2JLxMqHHroClyiLzdw59e0e29o/gOGsRqIgfcUSJwkq886FdfNkg+IqaiAE4/MjaL+6PKuH/3ImhT9Yy2QEhnLY8GVJzbkiW+eSkBgAXdiwGNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441575; c=relaxed/simple;
	bh=6s96Brt5PJ/frxaIA2U+I4FMrAZLr0ipXb0JtyhvgIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T35WzQyBpo24jmHq7Ta3GSYDvvFpdZfGzt2VoAAjxOdGWMZaFtdKXToKYSsfCi0D+rfstxorq5VkH+IVi8QNAn9bK3nRkkPqna7O35k8MiDsLSU5n2zlamNcsdQbQXdnzYuiKGALWLS3DPXEh3bOLvd51pibj6VigUuQOS/65EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GcdtqtJr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GcdtqtJr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436e87589e8so4057933f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Mar 2026 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772441571; x=1773046371; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D46BI+CNkJE5DLlJ6SA6UVHYE+hQWR7BF56tbHQc7zc=;
        b=GcdtqtJrbjcKI5QhpO//DuJuw8x38l+O2Ea3QA3yNMZHoO8Z4T3tniQfNy6RNF789J
         B0xTeLie6a/A4mE5WfotlvCdHnBCVhF42KeW8BlxiuPV4e8GDWa0pQih/wNfqwpJ8ekH
         JAFVBW/KbRgL18AULhu5dWILtEdqRss+ru+F+nlPwkPgPwYbm2R88huNMY5DD3V1E58I
         r625xgBmq1Iva26V3w5Hdc7J+6WmtIUmH6uDD8vrXiW+7M78KoZjm4Ivs3ibX8dyM8B0
         1XdoHByi6iSD0EgcwUjRuABf10FAkyvNe8Lu74nWPt3mTfWOTqlbf8voat87AIIwtQhr
         BzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441571; x=1773046371;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D46BI+CNkJE5DLlJ6SA6UVHYE+hQWR7BF56tbHQc7zc=;
        b=oPu5BafzsH86CD8Fi5exBBRjeeh2LIZNgV7kIpYcd4ReT57EOZGuvgTFTSqnQzV5T3
         JGZD0Mw/CV868rRYRRyvLIIahZf50SqvkPsbCzkzh4XORRjq0T3mzRLnFXQa5Sfd/qOq
         4BTJX8Zde/pGgmaZGxFEDACdFRe6N+STZyPxjRA8dXwRQNtxbXa7ThXKCxpnfwWDOPPO
         qikl36Xcl9g82siQQODtg7uJItWFoRUWqCiQ1xItOf2YKOqsS7RNvOGQffAhaUPSEJ8/
         TFmU1KCRvo2F1HULyeaoH0BqFcAEiN6dGXtOwke2GFnZ7RUMJifrZ2Utjc+AYPPxM7T4
         a2gA==
X-Gm-Message-State: AOJu0Yz2Arug6jDFj8uay6zRzZ3NacM6lvCV47ZwBjGYlZlZ+KZopp83
	tPoKHqF9TLpDu/enSDPwWorKqObUMYUYYKfvjObN7lBHoJPlwlNa73d3XDKFnyCcLfiSfZOBipq
	Bx+6m
X-Gm-Gg: ATEYQzzunmM0pGEtZ9kKvjJi3NcAzWPFGdPlMoSMAvgHqizZBAiNvKhU8MSGqolj8gY
	9ke9ydHu+H45qY7ztTWUxIWJ/evg2JJMRoGnF4f+SqaLbtfmAnbvcPZ4jvqQSRCPXHgRUbijgp4
	q2zvPcb23iswa1q99YLDGbAsf57OP73jheB4fpmPMOaFZkp1XmV+2Tfe1xYsKvMWu62+JKEtq/8
	2+taDGo6kQVazeWVUGA8r87LScgSlzbDlz/YWdV97YlF6dqj5t7/JuPZzupSHgfjawhQmk20TQa
	0yZg0aHL/GVUZeaKhuftHuMZJ4Wx9tej58Qaa3BkORzE46+tRj8beAunt9IF1tNqKEkOmbjbgY4
	rxRreOd5LQgz5InJYf7gpWcKAKbpdqzH6EumuthMZis/M682BO6YM7dxN4FGqFeSVg7Y/vKzmfK
	v8cg8LnTghM2rBl+I+QLRrBHfx9h2M
X-Received: by 2002:a05:6000:400c:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-439b59e610cmr5451173f8f.6.1772441571300;
        Mon, 02 Mar 2026 00:52:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55d15besm9028280f8f.30.2026.03.02.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:52:50 -0800 (PST)
Date: Mon, 2 Mar 2026 11:52:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 5/16] fs/netfs/bvecq.c:299
 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null
 (see line 289)
Message-ID: <202603011130.BCCzYGYx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260302085246.5AAlNXuaoLz3oJZTvjzWSZ-I-nXel459mhiHR-m-V0w@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   64a2722c2705a6c6f46b7214477a4a0a2106c1b6
commit: 7cdad319bd204a832475adebf1dfaf11ccad0d8a [5/16] netfs: Add some tools for managing bvecq chains
config: i386-randconfig-141-20260301 (https://download.01.org/0day-ci/archive/20260301/202603011130.BCCzYGYx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603011130.BCCzYGYx-lkp@intel.com/

smatch warnings:
fs/netfs/bvecq.c:299 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null (see line 289)

vim +/bq +299 fs/netfs/bvecq.c

7cdad319bd204a David Howells 2026-02-28  284  int netfs_shorten_bvecq_buffer(struct bvecq *bq, unsigned int seg, size_t size)
7cdad319bd204a David Howells 2026-02-28  285  {
7cdad319bd204a David Howells 2026-02-28  286  	ssize_t retain = size;
7cdad319bd204a David Howells 2026-02-28  287  
7cdad319bd204a David Howells 2026-02-28  288  	/* Skip through the segments we want to keep. */
7cdad319bd204a David Howells 2026-02-28 @289  	for (; bq; bq = bq->next) {
7cdad319bd204a David Howells 2026-02-28  290  		for (; seg < bq->nr_segs; seg++) {
7cdad319bd204a David Howells 2026-02-28  291  			retain -= bq->bv[seg].bv_len;
7cdad319bd204a David Howells 2026-02-28  292  			if (retain < 0)
7cdad319bd204a David Howells 2026-02-28  293  				goto found;
7cdad319bd204a David Howells 2026-02-28  294  		}
7cdad319bd204a David Howells 2026-02-28  295  		seg = 0;
7cdad319bd204a David Howells 2026-02-28  296  	}

bq is always NULL at this since there are no break statements.

7cdad319bd204a David Howells 2026-02-28  297  	if (WARN_ON_ONCE(retain > 0))
7cdad319bd204a David Howells 2026-02-28  298  		return -EMSGSIZE;
7cdad319bd204a David Howells 2026-02-28 @299  	bq->bv[seg].bv_len += retain;
                                                ^^^^^^
NULL dereference.

7cdad319bd204a David Howells 2026-02-28  300  	return 0;
7cdad319bd204a David Howells 2026-02-28  301  
7cdad319bd204a David Howells 2026-02-28  302  found:
7cdad319bd204a David Howells 2026-02-28  303  	/* Shorten the entry to be retained and clean the rest of this bvecq. */
7cdad319bd204a David Howells 2026-02-28  304  	bq->bv[seg].bv_len += retain;
7cdad319bd204a David Howells 2026-02-28  305  	seg++;
7cdad319bd204a David Howells 2026-02-28  306  	for (int i = seg; i < bq->nr_segs; i++)
7cdad319bd204a David Howells 2026-02-28  307  		netfs_bvecq_free_seg(bq, i);
7cdad319bd204a David Howells 2026-02-28  308  	bq->nr_segs = seg;
7cdad319bd204a David Howells 2026-02-28  309  
7cdad319bd204a David Howells 2026-02-28  310  	/* Free the queue tail. */
7cdad319bd204a David Howells 2026-02-28  311  	netfs_free_bvecq_buffer(bq->next);
7cdad319bd204a David Howells 2026-02-28  312  	bq->next = NULL;
7cdad319bd204a David Howells 2026-02-28  313  	return 0;
7cdad319bd204a David Howells 2026-02-28  314  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

