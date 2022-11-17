Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91E317E0;
	Thu, 17 Nov 2022 07:36:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso1141368wmp.5;
        Wed, 16 Nov 2022 23:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFcbW7NW5DDCKre2yJpKCmdI+15tLoMafsU/GK41iCg=;
        b=oHr+FaZgYEv23JaNnCjuR1kU450HEhhtx+qI1mgdxExYBkKbCAFN3d1CeBhwdbDKUU
         MOH6YGskf/ogOfAonyZVA0CDqr8iY/90NBYrE95Vw4vCNbzdzd7CuPwda4qHgH1cm3ug
         QZResj+c/Wu+euO8OFAvzJwwnCheNifFO76JHRV3uMr511m6Kkmiqj5vsapWDumyXgTZ
         y3G5HbcB/spzcaU5ha6ukgyKXXQZ/Qr8qhkLlcoFZfk8oTlJ8np345efK99fqjoeLRpY
         3V8DXaF0xKaBd/y6dir6d5OUeiNQ6vPIXIp3WV6UTyDupam/Xz0Y8/B1DP7ekpxw0Isy
         VhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFcbW7NW5DDCKre2yJpKCmdI+15tLoMafsU/GK41iCg=;
        b=IGJaVVszFdJdi+7nnrek8htL8sh6uohZZDM7NTRWC1Es/p6na497ZXjmoaZoayl4yY
         eDQJHCbjdq5s0m+H/1TC+yh+weLeQRpUhRR06Euj8LqGdWj0zE2V/Wmj4ABZwJsmtq3k
         GfPz/TLgAr8u+fg5mJXA3Yj4PANc3WJYSiQ+FwFRoV9I+GJD3/16bpx7KinnN8wOGdYH
         /ThJjDLKfphYAE6R35DYtg3DXw4o58k/MIaT+gmgW6kS6A+c4wzMT6Ex9NDvpduw/5mV
         9pKf3uGgngINhdoekqj78/fub1QTN1N36lrk7SSP2Hb5QGsbpTgAiICBuCVJ/9CX2p3B
         x4Zw==
X-Gm-Message-State: ANoB5pl4DUQM2DYBrIn/EWr03B0GdegyxVb7VoHTo1hPU0YpbGXNrqDS
	2x9RYO26q+sGdCoOin8BVuH4yUdoFr/9gQ==
X-Google-Smtp-Source: AA0mqf43jItg7WqELp/x05EyDow+9qYAHfTbuUbJ28ducG6oUYJtvv6zNgytfK+w7qNpDpTDUYISOA==
X-Received: by 2002:a05:600c:3ba8:b0:3cf:59c9:4a4e with SMTP id n40-20020a05600c3ba800b003cf59c94a4emr4345877wms.17.1668670582659;
        Wed, 16 Nov 2022 23:36:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c182600b003c6deb5c1edsm238259wmp.45.2022.11.16.23.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 23:36:22 -0800 (PST)
Date: Thu, 17 Nov 2022 10:36:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Eric Dumazet <edumazet@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: [net-next:master 25/27] net/core/dev.c:6409 napi_disable() error:
 uninitialized symbol 'new'.
Message-ID: <202211171520.UF5VyYSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221117073619.mRaGPxq1akmk0iWLpDPM3sN_IvDoV32Xs5BB09ByQV4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
head:   d82303df06481235fe7cbaf605075e0c2c87e99b
commit: 4ffa1d1c6842a97e84cfbe56bfcf70edb23608e2 [25/27] net: adopt try_cmpxchg() in napi_{enable|disable}()
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
net/core/dev.c:6409 napi_disable() error: uninitialized symbol 'new'.

Old smatch warnings:
net/core/dev.c:10356 netdev_run_todo() warn: passing freed memory 'dev'

vim +/new +6409 net/core/dev.c

3b47d30396bae4 Eric Dumazet   2014-11-06  6393  void napi_disable(struct napi_struct *n)
3b47d30396bae4 Eric Dumazet   2014-11-06  6394  {
719c571970109b Jakub Kicinski 2021-09-24  6395  	unsigned long val, new;
719c571970109b Jakub Kicinski 2021-09-24  6396  
3b47d30396bae4 Eric Dumazet   2014-11-06  6397  	might_sleep();
3b47d30396bae4 Eric Dumazet   2014-11-06  6398  	set_bit(NAPI_STATE_DISABLE, &n->state);
3b47d30396bae4 Eric Dumazet   2014-11-06  6399  
719c571970109b Jakub Kicinski 2021-09-24  6400  	val = READ_ONCE(n->state);
4ffa1d1c6842a9 Eric Dumazet   2022-11-15  6401  	do {
719c571970109b Jakub Kicinski 2021-09-24  6402  		if (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
719c571970109b Jakub Kicinski 2021-09-24  6403  			usleep_range(20, 200);
719c571970109b Jakub Kicinski 2021-09-24  6404  			continue;

"new" not initialized for first iteration through the loop.

719c571970109b Jakub Kicinski 2021-09-24  6405  		}
719c571970109b Jakub Kicinski 2021-09-24  6406  
719c571970109b Jakub Kicinski 2021-09-24  6407  		new = val | NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC;
719c571970109b Jakub Kicinski 2021-09-24  6408  		new &= ~(NAPIF_STATE_THREADED | NAPIF_STATE_PREFER_BUSY_POLL);
4ffa1d1c6842a9 Eric Dumazet   2022-11-15 @6409  	} while (!try_cmpxchg(&n->state, &val, new));
                                                                                               ^^^

3b47d30396bae4 Eric Dumazet   2014-11-06  6410  
3b47d30396bae4 Eric Dumazet   2014-11-06  6411  	hrtimer_cancel(&n->timer);
3b47d30396bae4 Eric Dumazet   2014-11-06  6412  
3b47d30396bae4 Eric Dumazet   2014-11-06  6413  	clear_bit(NAPI_STATE_DISABLE, &n->state);
3b47d30396bae4 Eric Dumazet   2014-11-06  6414  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

