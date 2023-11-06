Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAD215ACC
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pB+e6zxI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9d10f94f70bso611497366b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Nov 2023 01:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699261878; x=1699866678; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJ31m0TsVDUq2R/F21AGORoI9bPFyvlysbTWLK5sAv0=;
        b=pB+e6zxIGIUSEfLhQwLoI7M0qZ0YuGWTJbxbwiecMRhez/WVdQ7o/GtilE5gFonFUo
         35KfSLdYCwmlvHIrXoG0KKBvO1S7f034/bGAMgd26RZnRMIUuo8rSENAcRuceV5LSqNG
         v3VPEpZr5tEyRx4w/ZKKhXMKERACZSAEtSuoKgVljYtNjeEnKoztYYEwSUV6g7AMGPN3
         DE52RHo0RPHNxEJf2Qhz0iaROzQNKeGxrNFVWVPyLJeMlaw5G3Y4WG4C2oTyCS1dfzOR
         Jum1kqnPg2LXlXm2xzJxhIepBqLJq94d16P4fpVJq/1Rk7HvwEyi5HyDGXwN2q5WCLW8
         je6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699261878; x=1699866678;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ31m0TsVDUq2R/F21AGORoI9bPFyvlysbTWLK5sAv0=;
        b=kbeEtj+SihLNuBrD6YNSbDNLaDhF+tfoswgeLCaXRr5nZeFudgpKng7WEST+zngHh1
         R8SMssI7IucdCDMUXAFHtGJHbNfmpyrBxLNnNgWVafEnbMyt7y0InAtuLT8eIaxmJjS9
         Xg7m1u53Eeu+q0+m7Dr/UojIaSpPF+ojrIEQPFZ70Up/46UmnsINGKUDacR25QBiiZdg
         ehwVC+Wa9S3wp+TghMVdLiU1O3xZ8q0aQVePpU8fG+K3VKDjVjJdWUMrUmaOXMZPf7/E
         URVPbzJvLkz1LmbjouTjm3Np6kk1YqWxNSFA6/MU2gauOCSiJCJiydw/H3f9AD+2i5c/
         Kc9Q==
X-Gm-Message-State: AOJu0YwUGmg8bA0ECzTPCG6KxIHfqzuiwz6MvN7wkLOxMqA83lzR4u4B
	ebYa9uX+Tf9uHr8Rn/U9WWZEOt/hR/+PKDnEt5M=
X-Google-Smtp-Source: AGHT+IGvbbZQHu8gzGhrcpZBBp31NAm5pt4UOYI9KXb62ZsaDJWCxOWnUJ4ob6F2n2rGGnbCJsA3SQ==
X-Received: by 2002:a17:906:d555:b0:9c4:67f:3ef5 with SMTP id cr21-20020a170906d55500b009c4067f3ef5mr12688099ejc.50.1699261878032;
        Mon, 06 Nov 2023 01:11:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709063b0a00b009ada9f7217asm3869359ejf.88.2023.11.06.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 01:11:17 -0800 (PST)
Date: Mon, 6 Nov 2023 12:11:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zheng Wang <zyytlz.wz@163.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Coly Li <colyli@suse.de>
Subject: drivers/md/bcache/btree.c:1511 btree_gc_rewrite_node() error: 'n'
 dereferencing possible ERR_PTR()
Message-ID: <a754f8a3-cbfb-42bb-b776-94ecac062daf@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 028ddcac477b691dd9205c92f991cc15259d033e bcache: Remove unnecessary NULL point check in node allocations
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311060857.2jHVe0uk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060857.2jHVe0uk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311060857.2jHVe0uk-lkp@intel.com/

New smatch warnings:
drivers/md/bcache/btree.c:1511 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/md/bcache/btree.c:1527 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

vim +/n +1511 drivers/md/bcache/btree.c

0a63b66db566cf Kent Overstreet 2014-03-17  1497  static int btree_gc_rewrite_node(struct btree *b, struct btree_op *op,
0a63b66db566cf Kent Overstreet 2014-03-17  1498  				 struct btree *replace)
0a63b66db566cf Kent Overstreet 2014-03-17  1499  {
0a63b66db566cf Kent Overstreet 2014-03-17  1500  	struct keylist keys;
0a63b66db566cf Kent Overstreet 2014-03-17  1501  	struct btree *n;
0a63b66db566cf Kent Overstreet 2014-03-17  1502  
0a63b66db566cf Kent Overstreet 2014-03-17  1503  	if (btree_check_reserve(b, NULL))
0a63b66db566cf Kent Overstreet 2014-03-17  1504  		return 0;
0a63b66db566cf Kent Overstreet 2014-03-17  1505  
0a63b66db566cf Kent Overstreet 2014-03-17  1506  	n = btree_node_alloc_replacement(replace, NULL);

Needs some error handling.  I don't know why the zero day bot is
sending repeat warnings today but this one is still worth fixing.
I guess the zero day bot sent the previous warning to the wrong people
last time.

https://lore.kernel.org/all/bab6966d-3f96-44a0-b666-ddf976179eab@kadam.mountain/

0a63b66db566cf Kent Overstreet 2014-03-17  1507  
0a63b66db566cf Kent Overstreet 2014-03-17  1508  	/* recheck reserve after allocating replacement node */
0a63b66db566cf Kent Overstreet 2014-03-17  1509  	if (btree_check_reserve(b, NULL)) {
0a63b66db566cf Kent Overstreet 2014-03-17  1510  		btree_node_free(n);
0a63b66db566cf Kent Overstreet 2014-03-17 @1511  		rw_unlock(true, n);
0a63b66db566cf Kent Overstreet 2014-03-17  1512  		return 0;
0a63b66db566cf Kent Overstreet 2014-03-17  1513  	}
0a63b66db566cf Kent Overstreet 2014-03-17  1514  
0a63b66db566cf Kent Overstreet 2014-03-17  1515  	bch_btree_node_write_sync(n);
0a63b66db566cf Kent Overstreet 2014-03-17  1516  
0a63b66db566cf Kent Overstreet 2014-03-17  1517  	bch_keylist_init(&keys);
0a63b66db566cf Kent Overstreet 2014-03-17  1518  	bch_keylist_add(&keys, &n->key);
0a63b66db566cf Kent Overstreet 2014-03-17  1519  
0a63b66db566cf Kent Overstreet 2014-03-17  1520  	make_btree_freeing_key(replace, keys.top);
0a63b66db566cf Kent Overstreet 2014-03-17  1521  	bch_keylist_push(&keys);
0a63b66db566cf Kent Overstreet 2014-03-17  1522  
0a63b66db566cf Kent Overstreet 2014-03-17  1523  	bch_btree_insert_node(b, op, &keys, NULL, NULL);
0a63b66db566cf Kent Overstreet 2014-03-17  1524  	BUG_ON(!bch_keylist_empty(&keys));
0a63b66db566cf Kent Overstreet 2014-03-17  1525  
0a63b66db566cf Kent Overstreet 2014-03-17  1526  	btree_node_free(replace);
0a63b66db566cf Kent Overstreet 2014-03-17  1527  	rw_unlock(true, n);
0a63b66db566cf Kent Overstreet 2014-03-17  1528  
0a63b66db566cf Kent Overstreet 2014-03-17  1529  	/* Invalidated our iterator */
0a63b66db566cf Kent Overstreet 2014-03-17  1530  	return -EINTR;
0a63b66db566cf Kent Overstreet 2014-03-17  1531  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

