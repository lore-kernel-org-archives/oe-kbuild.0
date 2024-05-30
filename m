Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DCF17C214
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081568; cv=none; b=r0A+nTjp43UoTbEiedvjRkyRX3kVnmpt48aaP0qc2MT/fRJUei8dn7Y1THae1UKnXTOr9HbqF3ntmZT657UHM8cfZ9GIyojwpJIYV1B6oPw1HLMT4GJFqnS1bPaqGc9ROz5X6thdvr2KnrY29h8xHW3PdnPAgiL9CGUXQN6Bnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081568; c=relaxed/simple;
	bh=wmpnIms+Ni0Ry0kfnKXn0gXyCrb7sifwgWadDYz1sB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6LaGSfmTSGKKZWW5E+WSGzMWEv2xLlC+juapCF036/sMtAHJ4hY7l9tBg4speuBlk8Owu6oCC/EWGpnSW5soFWHNLjD1wliCHMiGXrcwkioqeWvrOXj1lrIxTpVwUymIafbV20bWzAiQ5AEEqRfKa0LDxguEACb7dNPKTaszq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8Ss9rwD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8Ss9rwD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57864327f6eso1587416a12.1
        for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717081565; x=1717686365; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfTCm3TgmaVqE21yEOO5h5MBclylP+1WmzgquDnfhEE=;
        b=V8Ss9rwDP/a2u3HDXCnwPKCV92mHQDGvTdExFAE1dF0StMZzrm8pZrCI8fe5oq+yfn
         +br2C7PZYj/EuelIQR8yNeV8mekJbNNB0H1LeVd4fTDNbsuBNQIs15Ls/tdaezZyTKGi
         9c53+DLvC7CpaN1Av9tpZw5JR2F0aPnGV1sOlp9ReLaBamM2+UmdWfrySwqIepD3PrK/
         6R1uQ5bOnhCV2ooPJTsT4UruVQCd9EeHAtVycY00OneGTHUZMdSE5JDX7wTzrHSCZYx1
         uX0rXh73KyVQlnZIG/mv2//p6h4lOWVWSBEja3flXf64nWSExr3G51LXY6epJHiu2PWL
         +zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081565; x=1717686365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfTCm3TgmaVqE21yEOO5h5MBclylP+1WmzgquDnfhEE=;
        b=YIgAv44pWDvcjYOfGlsrykwRnrpoCxY6PzIw/1pnfHsnnuzRn16P4f23X65qSN1Q6y
         AZuVBPnGl4FpYE9wxV15S5thtbWSODDz2oKqAbWFUx5EvBtZjkLs0XjRWFnXnLOIpnho
         gGFvSWivqWunnA8lX/8F33OMCXrV+pIPdKcb/EnoEv/tsteEB9eyy159Wp3VN3iIC593
         /u5xhux4afz/AwMuiOQfbtDiuWo3NSP/mowjF0MOa605TMC/ni3eg1+SGM5yzqpB85su
         ElTfxYnn1yJbFDOfixIbRCu7ZfeZQ2gXEynadzn+wgGZ3zTCjCnwEVlgsjQVYMpS7s84
         qpyQ==
X-Gm-Message-State: AOJu0Yxkcm9O4ZunnTVNIXdaO+64LfYH1SnlH1OY0hknh7bA7znu1T3o
	xFUghW4BJ6mBXKckAO7uoOdCSJPHLIyuDOJpS0RWMTJaflqCgtQFj5Frt5UbKuh7h0hOU0bd41/
	j
X-Google-Smtp-Source: AGHT+IGFszHFfcj7wctFXE+SYTvuP+z6WVvHgpD1nVi2pkCWcCJDw9CqOdvJQ+km4DhaujCdkaYA5Q==
X-Received: by 2002:a50:999a:0:b0:574:ec3d:262a with SMTP id 4fb4d7f45d1cf-57a19f5d549mr1844685a12.5.1717081564934;
        Thu, 30 May 2024 08:06:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a231e5250sm817567a12.39.2024.05.30.08.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:06:04 -0700 (PDT)
Date: Thu, 30 May 2024 18:06:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Ziyang Xuan <william.xuanziyang@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22031/22588] net/tipc/udp_media.c:775
 cleanup_bearer() warn: variable dereferenced before check 'ub->ubsock' (see
 line 774)
Message-ID: <29a08432-8d91-4462-8224-b8e919485d21@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   03933bd11a64b94203f2cbe30ae71061807872fb
commit: f147e8f44610a18cff2d6db47d5e7bcad58a59a5 [22031/22588] tipc: wait and exit until all work queues are done
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240530/202405302145.ELvG0wIM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405302145.ELvG0wIM-lkp@intel.com/

smatch warnings:
net/tipc/udp_media.c:775 cleanup_bearer() warn: variable dereferenced before check 'ub->ubsock' (see line 774)
net/tipc/udp_media.c:796 tipc_udp_disable() error: we previously assumed 'ub->ubsock' could be null (see line 791)

vim +775 net/tipc/udp_media.c

d0f91938bede20 Erik Hugne   2015-03-05  764  static void cleanup_bearer(struct work_struct *work)
d0f91938bede20 Erik Hugne   2015-03-05  765  {
d0f91938bede20 Erik Hugne   2015-03-05  766  	struct udp_bearer *ub = container_of(work, struct udp_bearer, work);
ef20cd4dd16339 Richard Alpe 2016-08-26  767  	struct udp_replicast *rcast, *tmp;
ef20cd4dd16339 Richard Alpe 2016-08-26  768  
ef20cd4dd16339 Richard Alpe 2016-08-26  769  	list_for_each_entry_safe(rcast, tmp, &ub->rcast.list, list) {
ef20cd4dd16339 Richard Alpe 2016-08-26  770  		list_del_rcu(&rcast->list);
ef20cd4dd16339 Richard Alpe 2016-08-26  771  		kfree_rcu(rcast, rcu);
ef20cd4dd16339 Richard Alpe 2016-08-26  772  	}
d0f91938bede20 Erik Hugne   2015-03-05  773  
f147e8f44610a1 Xin Long     2024-04-02 @774  	atomic_dec(&tipc_net(sock_net(ub->ubsock->sk))->wq_count);
                                                                              ^^^^^^^^^^^^^^
Unchecked dereference.

d0f91938bede20 Erik Hugne   2015-03-05 @775  	if (ub->ubsock)
                                                    ^^^^^^^^^^
Too late.

d0f91938bede20 Erik Hugne   2015-03-05  776  		udp_tunnel_sock_release(ub->ubsock);
d0f91938bede20 Erik Hugne   2015-03-05  777  	synchronize_net();
d0f91938bede20 Erik Hugne   2015-03-05  778  	kfree(ub);
d0f91938bede20 Erik Hugne   2015-03-05  779  }
d0f91938bede20 Erik Hugne   2015-03-05  780  
d0f91938bede20 Erik Hugne   2015-03-05  781  /* tipc_udp_disable - detach bearer from socket */
d0f91938bede20 Erik Hugne   2015-03-05  782  static void tipc_udp_disable(struct tipc_bearer *b)
d0f91938bede20 Erik Hugne   2015-03-05  783  {
d0f91938bede20 Erik Hugne   2015-03-05  784  	struct udp_bearer *ub;
d0f91938bede20 Erik Hugne   2015-03-05  785  
d0f91938bede20 Erik Hugne   2015-03-05  786  	ub = rcu_dereference_rtnl(b->media_ptr);
d0f91938bede20 Erik Hugne   2015-03-05  787  	if (!ub) {
d0f91938bede20 Erik Hugne   2015-03-05  788  		pr_err("UDP bearer instance not found\n");
d0f91938bede20 Erik Hugne   2015-03-05  789  		return;
d0f91938bede20 Erik Hugne   2015-03-05  790  	}
d0f91938bede20 Erik Hugne   2015-03-05 @791  	if (ub->ubsock)
                                                    ^^^^^^^^^^
Check for NULL

d0f91938bede20 Erik Hugne   2015-03-05  792  		sock_set_flag(ub->ubsock->sk, SOCK_DEAD);
d0f91938bede20 Erik Hugne   2015-03-05  793  	RCU_INIT_POINTER(ub->bearer, NULL);
d0f91938bede20 Erik Hugne   2015-03-05  794  
d0f91938bede20 Erik Hugne   2015-03-05  795  	/* sock_release need to be done outside of rtnl lock */
f147e8f44610a1 Xin Long     2024-04-02 @796  	atomic_inc(&tipc_net(sock_net(ub->ubsock->sk))->wq_count);
                                                                              ^^^^^^^^^^^^^^
Unchecked dereference

d0f91938bede20 Erik Hugne   2015-03-05  797  	INIT_WORK(&ub->work, cleanup_bearer);
d0f91938bede20 Erik Hugne   2015-03-05  798  	schedule_work(&ub->work);
d0f91938bede20 Erik Hugne   2015-03-05  799  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

