Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452E3D68
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 07:38:56 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31f7638be6eso3315371f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694417934; x=1695022734; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FetblLldLesZtXS0mMVb6VGHuGGMOUnVxGb31vZJsmU=;
        b=QaozwUw4lMDt/lzBJVBc4gLXl7U4QfGSMO7RcK3knIQPaSS6AIhCbHxA0CMaV/3AFn
         eNYp+El1JZdaJAEjzgwM/PhMkbdsf51JsLh1Y8Nozx3+iNYhGimv2OHQSTbY2d91N07I
         h1yd/tMP0KWbPSn93ISyygsY0nPsObPplHO7fTuXtD77IVxBpnIC7iIdO5FDmHLpRkYb
         m9vNJ1AZ5ubL0mOHOcppMAnhxUEu7Xttswc9FZdVjnTRZXdH5CdMj1nNS38hBAS5x8g5
         UNoW8JJTJFO0KccPGZ0RftBsKqqhz6zEL4Kw3wp2cEdikMMKXFGQUZYO8kMU1tVav2+4
         1oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694417934; x=1695022734;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FetblLldLesZtXS0mMVb6VGHuGGMOUnVxGb31vZJsmU=;
        b=in4qoMIQ13dgzxmZqAaJSItFxrPPxw+10V+O4d9rcOUMea6+cxtT5m4VuNMWqwmNoD
         EKmhuP9VmJjAIbZzh9yeBRv5m3bH62ufC/APqUETQaiqu9j8Hq0CbOHDpaBMG3rAO6vi
         uDqB1pVnSUbaIN+xyFzsQe/yNOnSFJX27/F9OW+QfS0QCRVlqeqWk+ELvcT7IRJ7ascb
         f+UgciUlJrkQ+0moGcg6r/pqkC0exOMtRZBxMM76mPDUwrEO/BLhQh7hjCFuz0/YxkHR
         Ynj7NaMM7YEzoTHVVB+pZBsbJePVZY0QOm2vFTVhEqy3CXBagGFpBp7jF0ck6WsPkGON
         S8/w==
X-Gm-Message-State: AOJu0YzO+OZAlRmMMmU+Zbn/JHcmKWFZiDuhnuWwJVNMvQGIpVP/7QrT
	U5CsZPxmQoQ/EPNWdmYSN05BZITsYHgiZWACBXQ=
X-Google-Smtp-Source: AGHT+IHg/uG/uVE9zFCBtAs3XxtVF56R/MorKt39RG457BLvWLiHlsIK2RlRVsKxIT8sY8Lo9YlNqQ==
X-Received: by 2002:adf:fe8c:0:b0:317:c2a9:9b0c with SMTP id l12-20020adffe8c000000b00317c2a99b0cmr7553093wrr.50.1694417934282;
        Mon, 11 Sep 2023 00:38:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b0031971ab70c9sm9211103wrx.73.2023.09.11.00.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 00:38:53 -0700 (PDT)
Date: Mon, 11 Sep 2023 10:38:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nick Alcock <nick.alcock@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.5 10/13] fs/eventpoll.c:1300
 ep_ptable_queue_proc() warn: maybe use && instead of &
Message-ID: <220ec8e8-f5b1-4b2a-b311-b414793053bb@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 [10/13] waitfd: new syscall implementing waitpid() over fds
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230909/202309090448.6VlaNPfY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090448.6VlaNPfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309090448.6VlaNPfY-lkp@intel.com/

smatch warnings:
fs/eventpoll.c:1300 ep_ptable_queue_proc() warn: maybe use && instead of &

vim +1300 fs/eventpoll.c

^1da177e4c3f4152 Linus Torvalds 2005-04-16  1290  static void ep_ptable_queue_proc(struct file *file, wait_queue_head_t *whead,
051cfd2102807119 Nick Alcock    2018-11-14  1291  				 poll_table *pt, unsigned long fixed_event)
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1292  {
364f374f22ba1b04 Al Viro        2020-09-02  1293  	struct ep_pqueue *epq = container_of(pt, struct ep_pqueue, pt);
364f374f22ba1b04 Al Viro        2020-09-02  1294  	struct epitem *epi = epq->epi;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1295  	struct eppoll_entry *pwq;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1296  
364f374f22ba1b04 Al Viro        2020-09-02  1297  	if (unlikely(!epi))	// an earlier allocation has failed
364f374f22ba1b04 Al Viro        2020-09-02  1298  		return;
364f374f22ba1b04 Al Viro        2020-09-02  1299  
051cfd2102807119 Nick Alcock    2018-11-14 @1300  	if (fixed_event & !(epi->event.events & fixed_event))

This should be && instead of &.  See my previous email:

https://download.01.org/0day-ci/archive/20230715/202307150418.yMkaVxN8-lkp@intel.com/reproduce

051cfd2102807119 Nick Alcock    2018-11-14  1301  		return;
051cfd2102807119 Nick Alcock    2018-11-14  1302  
051cfd2102807119 Nick Alcock    2018-11-14  1303  	if (fixed_event)
051cfd2102807119 Nick Alcock    2018-11-14  1304  		epi->fixed_event = fixed_event;
051cfd2102807119 Nick Alcock    2018-11-14  1305  
364f374f22ba1b04 Al Viro        2020-09-02  1306  	pwq = kmem_cache_alloc(pwq_cache, GFP_KERNEL);
364f374f22ba1b04 Al Viro        2020-09-02  1307  	if (unlikely(!pwq)) {
364f374f22ba1b04 Al Viro        2020-09-02  1308  		epq->epi = NULL;
364f374f22ba1b04 Al Viro        2020-09-02  1309  		return;
364f374f22ba1b04 Al Viro        2020-09-02  1310  	}
364f374f22ba1b04 Al Viro        2020-09-02  1311  
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1312  	init_waitqueue_func_entry(&pwq->wait, ep_poll_callback);
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1313  	pwq->whead = whead;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1314  	pwq->base = epi;
df0108c5da561c66 Jason Baron    2016-01-20  1315  	if (epi->event.events & EPOLLEXCLUSIVE)
df0108c5da561c66 Jason Baron    2016-01-20  1316  		add_wait_queue_exclusive(whead, &pwq->wait);
df0108c5da561c66 Jason Baron    2016-01-20  1317  	else
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1318  		add_wait_queue(whead, &pwq->wait);
80285b75c683484d Al Viro        2020-09-02  1319  	pwq->next = epi->pwqlist;
80285b75c683484d Al Viro        2020-09-02  1320  	epi->pwqlist = pwq;
296e236e96dddef3 Davide Libenzi 2009-03-31  1321  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

