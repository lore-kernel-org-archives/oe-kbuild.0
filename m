Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BB380FCA
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080706; cv=none; b=jlenVst3rhURJEg/VN2ZF8wp2WAtPZsKU1u+REeIe7OtKW46qi4jn7o6G6H4Wep/S+qC4XMInXeS8+A14nAjY/Z+xVmttME1dD8jYpMRrH9EoOvAbpYz/7/u9GxJ1rfZQX9QZbu05/8loHfylMfEkkJk/McB2d0GDdsWzkjT1Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080706; c=relaxed/simple;
	bh=4psL8+GeXk1WC2qi5mfnbdwsUCFjRWRHtfZOf/s9n9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hb+h0u1ki5GJcvYwkQDDkvnaKRMfA9BwUYnz8VtbhoaOJUf+7drzj4vjcKkI8fqFzIGiOyYUi+J+djKvzxhAQhVpsE5re7B2KdizwyDvQ3PGWrzXrq7L4FLOCGZGl+9qv7CUn+kv2eayLlWKW9IwqiOWkbjpzgfMsCGobkdmFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbVAwasz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbVAwasz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48d102471a4so13120955e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 22:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080702; x=1779685502; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZnk31N5kzSsttMZ0C8iHVgYBVwpdizhC6C5uXZVAuI=;
        b=YbVAwaszjuSg6gvy7B5RZsl//J8VlefXHLeFVtpMjdXcMI/FBB26RpziNJZIUqLiOT
         Ldyh0UuuwO4E9h909U1UR63RfgldmP28NGG4r7QOij4uza2K2wWHwiNVIQwN6BZIZoI3
         R+Xo2ulhdL7SgdbWBMARZNJ7NZ56YcxdFLNJtzz+mz6p2wKZPuIVesZXq/FH+7eMKi70
         IS8QypaCpxWVQGL8QhXZdyjHglkwyTvBbeY8rybz4wK6aPkwKXUA53Uoi4s3Gk92Ae5O
         IC/baI1P20LON+kaB8Byci1s25okdqVjO7sy/ShXVyndqj6Jmq6W8XAaJIdztSiR7Cbl
         lybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080702; x=1779685502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZnk31N5kzSsttMZ0C8iHVgYBVwpdizhC6C5uXZVAuI=;
        b=RXZn6sOdbkwdww55KhrmO83qKkex/+rdOr5pP+XaGcwZfrxa5LvUbmZ9X561ysNqlj
         BPtL6lkbJEvMAp2vveAp0qi7PC0lFRt86+2qYdsT9eeUNqQsEHgQxVLDi4kw98QFjT7/
         kCSuCk52WKf0UThJm3ZCJiT6I2WvMOkqcMk2n3uoc7XDEFkb59k8jo7uAlKj4JMKNo/2
         vQvtHACE/Z/+PP8cDkCh3V6z+Mr/m5lDlyiJjpyx/PRTgrOuP9T6yInxcsLH+fV1MSFF
         KdEor1f2VwwBoV/CH00G+bZK4GJJV+KqV846T6Pe5dz3EzVttaOvy2gTUOMgqWYdxtz7
         FBUA==
X-Gm-Message-State: AOJu0YwO3WLYvquMXlB7NTJyh25CLlzQ3GXuWJLRNh4d6LcfKjfAwlRw
	ZRbB4TR+UkLwlbnyVDOl6WX9Ux84gOHSPAsmf43VU//7aUk+wiMVQ1eQ1dMQig==
X-Gm-Gg: Acq92OHg1bkGEtjyKQQgePcrk68ew408uz20QuLoVijpZ452Oe0Si6CNmxr8LCDJxr4
	wJeocoZauCsLbyhevISUveZpQDgi42OnLlObJ6SNp6JfGEh7YP4CoPogCCy9P+qSs/ghJBqHSeR
	qoTxyPYLkh2+vW9o3Vru7E+UCyBjL2GETI+wApbGhGLu7Z2vEdfPLQBz/9BNU8VRd6L/9myJk3u
	ZCHIaVwVy+H5+h4nUVxU5g+bpWaTutPPZ6bCyZ2hp1J0U9HDDEaEyEubg1XBL0B1K83BveHoNoN
	Nrq780e7fFs7+AUWEmmmzZN57GTe76T82ZSZy8pOwiuGw2n6deUfifgNb6ZOZj8iT8vKqzMz2Wz
	RTVhHzV8o0jvJhzotmqyBtu/rDgMFAxOzKRqhm54Z5zkyQUE7NHhpZ13l/Hr942wr6HZIGPTnJu
	R/NsW5faENMFmpJ7RTXEc=
X-Received: by 2002:a05:600c:858d:b0:48f:e230:80a2 with SMTP id 5b1f17b1804b1-48fe65148e1mr161591795e9.32.1779080702339;
        Sun, 17 May 2026 22:05:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm76467155e9.4.2026.05.17.22.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:05:00 -0700 (PDT)
Date: Mon, 18 May 2026 08:04:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2026.05.08a 39/43] kernel/rcu/tree_exp.h:822
 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks'
 could be null (see line 818)
Message-ID: <202605171129.6vsB2TG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260518050457.qlsVuYLNnk7gzUDBd-ImUwkvLMI84cJVUOKjPRJX3_0@z>

tree:   https://github.com/paulmckrcu/linux dev.2026.05.08a
head:   86ed69edce527e32495da86900fe50b9ca3266d9
commit: b32c53e658b25c6ed973a78b40bddc95e1948eac [39/43] rcu: Make rcu_print_task_exp_stall() dump ->dqs_blkd_tasks
config: parisc-randconfig-r071-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171129.6vsB2TG2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605171129.6vsB2TG2-lkp@intel.com/

smatch warnings:
kernel/rcu/tree_exp.h:822 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks' could be null (see line 818)

vim +822 kernel/rcu/tree_exp.h

d87cda5094585b Paul E. McKenney 2019-01-11  811  static int rcu_print_task_exp_stall(struct rcu_node *rnp)
d87cda5094585b Paul E. McKenney 2019-01-11  812  {
314eeb43e5f228 Paul E. McKenney 2020-01-03  813  	unsigned long flags;
d87cda5094585b Paul E. McKenney 2019-01-11  814  	int ndetected = 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  815  	struct task_struct *t;
d87cda5094585b Paul E. McKenney 2019-01-11  816  
314eeb43e5f228 Paul E. McKenney 2020-01-03  817  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
b32c53e658b25c Paul E. McKenney 2026-05-16 @818  	if (!rnp->exp_tasks && list_empty(&rnp->dqs_blkd_tasks)) {
                                                            ^^^^^^^^^^^^^^^
If rnp->exp_tasks is NULL

3c1566bca3f834 Zqiang           2022-12-24  819  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  820  		return 0;
3c1566bca3f834 Zqiang           2022-12-24  821  	}
d87cda5094585b Paul E. McKenney 2019-01-11 @822  	t = list_entry(rnp->exp_tasks->prev,
                                                                       ^^^^^^^^^^^^^^^^^^^^
then this will crash.

d87cda5094585b Paul E. McKenney 2019-01-11  823  		       struct task_struct, rcu_node_entry);
d87cda5094585b Paul E. McKenney 2019-01-11  824  	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
d87cda5094585b Paul E. McKenney 2019-01-11  825  		pr_cont(" P%d", t->pid);
d87cda5094585b Paul E. McKenney 2019-01-11  826  		ndetected++;
d87cda5094585b Paul E. McKenney 2019-01-11  827  	}
b32c53e658b25c Paul E. McKenney 2026-05-16  828  	list_for_each_entry(t, &rnp->dqs_blkd_tasks, rcu_node_entry) {
b32c53e658b25c Paul E. McKenney 2026-05-16  829  		pr_cont(" Q%d", t->pid);
b32c53e658b25c Paul E. McKenney 2026-05-16  830  		ndetected++;
b32c53e658b25c Paul E. McKenney 2026-05-16  831  	}
314eeb43e5f228 Paul E. McKenney 2020-01-03  832  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  833  	return ndetected;
d87cda5094585b Paul E. McKenney 2019-01-11  834  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

