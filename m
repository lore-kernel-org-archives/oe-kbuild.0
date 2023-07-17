Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CFE79C3
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jul 2023 06:16:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so4470583f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574564; x=1692166564;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=beAZDBeIWAyPdJQnhyc/jkbMJ4Ak7vhS+as9jIxSrLU=;
        b=Fo7CYFg6Q5iXp/SdV76lJJ+W9oCiyeeJ5yo7Hukd7t1KwWuK1XzmS8RLxNXP+ROcYN
         YQLg1KxyUP8dhi1bL5J1qzDoV7Wuz9nkqQfb2WRc+aBEFQ2fxLVVyZyAsSuLPCO0kguY
         O8zxATWCJW5S/xn/SDPxFZlYKGC6zO3TCTfALM7i6t4JdDXLkRpZPWE03fBblBsZnRkO
         jHVWEnrQmjXpvQluITBdIJ3jfBWKL5S+JXjTbt6+qOtHukotZMjRD+0Slk6+tmztHKZV
         rggZV/EH8VYZh1FHenHPD5dpyQYNMStOgSLrT09RM181875uPM5gcC4xeL8v8WphVsF4
         C+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574564; x=1692166564;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beAZDBeIWAyPdJQnhyc/jkbMJ4Ak7vhS+as9jIxSrLU=;
        b=OiW9zUzQFOlWx2uxwUaf6Rk2rtB6tSiraQ9lLgKR3uAUujxfDIWyMl20I4WrKpTjKT
         uhOR4Gk08tV2ruAiU9ql0J1fxnUfZe60nDBy8qTlRkvulcFOpfCStS14u+W1FdMbn/AH
         VmPKw0KMeAelCX+AvWcis6wKl7h4rr7W3oEunqtGBxRpZVggJ5mNE3V1Ntup0fSsZjsl
         drFYaJusQrM215JnHOmqH/+cyo8dcYwfPxoU+j+hdOIq6H6HeViBe4cQTRKXeChlYzMc
         n2XgoNfJan+WGk0kg9zjiWOUTYrgzPucSLN1rAdgjZN1nfgVQZtNZibIhYu1C7Vg57yi
         z1Jw==
X-Gm-Message-State: ABy/qLYbTBcKL9i1CEp6kIcgTigQ75qpxusd54O067J/H8papV7qxyBo
	T1yU6zhNLa5FLBM44T+85naZi/vyQnd3HSTrB04=
X-Google-Smtp-Source: APBJJlFOX7BNOruhIIKmyx1lFqOwkCy66bgnLy8orEPfvwPQtoussLBA/9c2x3y3pm6yk5lb/KJDMg==
X-Received: by 2002:a5d:5958:0:b0:313:df08:7b7e with SMTP id e24-20020a5d5958000000b00313df087b7emr9979174wri.14.1689574563934;
        Sun, 16 Jul 2023 23:16:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q3-20020a5d5743000000b003143c6e09ccsm18052401wrw.16.2023.07.16.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:16:02 -0700 (PDT)
Date: Mon, 17 Jul 2023 09:15:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nick Alcock <nick.alcock@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.4 10/13] fs/eventpoll.c:1300
 ep_ptable_queue_proc() warn: maybe use && instead of &
Message-ID: <5e68464a-dd6c-4fb4-8a1d-219344bb056b@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
config: m68k-randconfig-m041-20230713 (https://download.01.org/0day-ci/archive/20230715/202307150418.yMkaVxN8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150418.yMkaVxN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307150418.yMkaVxN8-lkp@intel.com/

smatch warnings:
fs/eventpoll.c:1300 ep_ptable_queue_proc() warn: maybe use && instead of &

vim +1300 fs/eventpoll.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1290  static void ep_ptable_queue_proc(struct file *file, wait_queue_head_t *whead,
19ce4a9705869b Nick Alcock    2018-11-14  1291  				 poll_table *pt, unsigned long fixed_event)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1292  {
364f374f22ba1b Al Viro        2020-09-02  1293  	struct ep_pqueue *epq = container_of(pt, struct ep_pqueue, pt);
364f374f22ba1b Al Viro        2020-09-02  1294  	struct epitem *epi = epq->epi;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1295  	struct eppoll_entry *pwq;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1296  
364f374f22ba1b Al Viro        2020-09-02  1297  	if (unlikely(!epi))	// an earlier allocation has failed
364f374f22ba1b Al Viro        2020-09-02  1298  		return;
364f374f22ba1b Al Viro        2020-09-02  1299  
19ce4a9705869b Nick Alcock    2018-11-14 @1300  	if (fixed_event & !(epi->event.events & fixed_event))

This has a lot of unexplained magic.  "If BIT(0) is set and there are no
bits set on both epi->event.events & fixed_event, then return?"  Probably
the checker is correct that && was intended instead of &.  Then it
becomes, "if there are bits set in fixed_event but none of them in
epi->event.events then return."

But I also wonder if maybe it should be:

	fixed = 0;
	if (fixed_event) {
		fixed = epi->event.events & fixed_event;
		if (fixed != fixed_event)
			return;
Or maybe:
		if (!fixed)
			return;
	}

	if (fixed)
		epi->fixed_event = fixed;

19ce4a9705869b Nick Alcock    2018-11-14  1301  		return;
19ce4a9705869b Nick Alcock    2018-11-14  1302  
19ce4a9705869b Nick Alcock    2018-11-14  1303  	if (fixed_event)
19ce4a9705869b Nick Alcock    2018-11-14  1304  		epi->fixed_event = fixed_event;
19ce4a9705869b Nick Alcock    2018-11-14  1305  
364f374f22ba1b Al Viro        2020-09-02  1306  	pwq = kmem_cache_alloc(pwq_cache, GFP_KERNEL);
364f374f22ba1b Al Viro        2020-09-02  1307  	if (unlikely(!pwq)) {
364f374f22ba1b Al Viro        2020-09-02  1308  		epq->epi = NULL;
364f374f22ba1b Al Viro        2020-09-02  1309  		return;
364f374f22ba1b Al Viro        2020-09-02  1310  	}
364f374f22ba1b Al Viro        2020-09-02  1311  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1312  	init_waitqueue_func_entry(&pwq->wait, ep_poll_callback);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1313  	pwq->whead = whead;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1314  	pwq->base = epi;
df0108c5da561c Jason Baron    2016-01-20  1315  	if (epi->event.events & EPOLLEXCLUSIVE)
df0108c5da561c Jason Baron    2016-01-20  1316  		add_wait_queue_exclusive(whead, &pwq->wait);
df0108c5da561c Jason Baron    2016-01-20  1317  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16  1318  		add_wait_queue(whead, &pwq->wait);
80285b75c68348 Al Viro        2020-09-02  1319  	pwq->next = epi->pwqlist;
80285b75c68348 Al Viro        2020-09-02  1320  	epi->pwqlist = pwq;
296e236e96ddde Davide Libenzi 2009-03-31  1321  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

