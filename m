Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D333998
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723383488; cv=none; b=dZuig0LFCpF849eclkn80YpnoldPJmV6a671cGJy8PVPo/+T2FQk9sjsyWo+iwbL+poQRT4lHcLO/c9MNZkFC0vhKjWpS5nJ1CBx1F/CS9OIgqHPhqlQblP2w8t8MWYnkQ3M1i02WLkVE0O3xd7zOaFbQl7V5Ozu04F0Kz1YdtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723383488; c=relaxed/simple;
	bh=rIu+sZxna2tqs2qA+Y1gBEwwySx4zvL0NETyGKb3lLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m/8zRwTLiL/YV+hnjtdiX0++TViC1xJf3O57Nq7jCozG8R4+dk37uyLsMBLeR2ZCqsNq7+fYU9m0p4TjYd3KZFywZDtHoITEMAgpxQegZzt+nMsfpG/YKk0/ZV5/ghI1leS7DLjQCQYYFZjdX73wnAMar4D8wl2Q1iW+kdeGFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipIzFNG+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipIzFNG+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so3959863a12.0
        for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723383485; x=1723988285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntbZfzpbTn9fLKFzz+NsQgIakdYBfGrf1/ID7Hrnpnw=;
        b=ipIzFNG+tCzDhHvuJYJROzq7P5XnGa5GO6L9Fv29EUKWYorRB4nMgbODTN7pIsyXqk
         OZcJ7HyIntn9udwNTEynDRyW8CtP/6k1ta4T+CJNPL4ymRfuIW4XyJCyPs9fQ2ImpDZI
         pLyJxVJ8R3Rbcku/nEXv3iztgc2/DB7x+cMKhldoghMys/4F8xDwu/tvYE9jvxLQm7qi
         5yGQgBZK37nQDPc5fFsBELQkaSI0oLmTGona0w3jIwzClC5rLJ5PWUGiSI33ypDo0Ov+
         aXZRC2iO8VL3pXMsdSJn0LLHQO4qKu9CEycqiS8aoDX3uLomG2b+0cG54y1QtRnKdQyH
         woiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723383485; x=1723988285;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntbZfzpbTn9fLKFzz+NsQgIakdYBfGrf1/ID7Hrnpnw=;
        b=SE8Ff+AC7TpFzKBGWDgZUICUOSNkbg5uvJNEzSPQwK7xJhM0MRYaXie/BuuTXPQ8vd
         ZmNXJxvA4JWx7lxqve9Jtj9bOWtl7e4CTdnnuoX7Sy/iGmw0OaYCm+oST/wqr6lv9v3o
         OGONMiweF/JicD9Dooy4O73GzBjI9rIney5jae4/pN/7SqEkV54Vh8xGjuhAACnjXd9+
         WJ+NPtt6pSYg8oOf7mpwcRgonBO1BdCPyTdWuhrVT0eb3VcbafYo4vunUH4eqpkZl0/v
         W5L0bKd/uJi/rM4HzKrhz2bOXVGEJaECUqaUKp6EYphOFeQg3H0SYsEGiGJL/zziKimK
         roGw==
X-Gm-Message-State: AOJu0YzPS7VZwQcT1ZkeYilY4YOTMaSQi913jIj94JCXLjZHO8Ukc0Pk
	x+1t1pO00pOsT5M2FYSPA+2U+doNnOQZaEq0oZfaju4Hs+z5d2MTpqgWx0XTAc2crFbPP/KVvR9
	w
X-Google-Smtp-Source: AGHT+IFsIOYLkzixmooHe5bmMgDKccxRDZXEBl/UMwQAWO9+jrUh7aF0mOIMe5VK83aTJYF0oYLGgA==
X-Received: by 2002:a05:6402:51d2:b0:5a2:3453:aaf2 with SMTP id 4fb4d7f45d1cf-5bd0a535ce4mr5244270a12.10.1723383484531;
        Sun, 11 Aug 2024 06:38:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f29d0sm1340942a12.2.2024.08.11.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 06:38:04 -0700 (PDT)
Date: Sun, 11 Aug 2024 16:38:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, James Chapman <jchapman@katalix.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 4/9] l2tp: add tunnel/session get_next helpers
Message-ID: <6a4c5e9b-2290-4618-9e0b-8ab3cf5b43c5@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4067ff5019040bf8ee2bd3c06db9e3d27ca39ded.1722856576.git.jchapman@katalix.com>

Hi James,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/James-Chapman/documentation-networking-update-l2tp-docs/20240805-194031
base:   net-next/main
patch link:    https://lore.kernel.org/r/4067ff5019040bf8ee2bd3c06db9e3d27ca39ded.1722856576.git.jchapman%40katalix.com
patch subject: [PATCH net-next 4/9] l2tp: add tunnel/session get_next helpers
config: microblaze-randconfig-r073-20240810 (https://download.01.org/0day-ci/archive/20240811/202408111407.HtON8jqa-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408111407.HtON8jqa-lkp@intel.com/

New smatch warnings:
net/l2tp/l2tp_core.c:400 l2tp_v2_session_get_next() error: we previously assumed 'tunnel' could be null (see line 393)

vim +/tunnel +400 net/l2tp/l2tp_core.c

1506ceb77b949f James Chapman 2024-08-05  372  static struct l2tp_session *l2tp_v2_session_get_next(const struct net *net, u16 tid, unsigned long *key)
1506ceb77b949f James Chapman 2024-08-05  373  {
1506ceb77b949f James Chapman 2024-08-05  374  	struct l2tp_net *pn = l2tp_pernet(net);
1506ceb77b949f James Chapman 2024-08-05  375  	struct l2tp_session *session = NULL;
1506ceb77b949f James Chapman 2024-08-05  376  
1506ceb77b949f James Chapman 2024-08-05  377  	/* Start searching within the range of the tid */
1506ceb77b949f James Chapman 2024-08-05  378  	if (*key == 0)
1506ceb77b949f James Chapman 2024-08-05  379  		*key = l2tp_v2_session_key(tid, 0);
1506ceb77b949f James Chapman 2024-08-05  380  
1506ceb77b949f James Chapman 2024-08-05  381  	rcu_read_lock_bh();
1506ceb77b949f James Chapman 2024-08-05  382  again:
1506ceb77b949f James Chapman 2024-08-05  383  	session = idr_get_next_ul(&pn->l2tp_v2_session_idr, key);
1506ceb77b949f James Chapman 2024-08-05  384  	if (session) {
1506ceb77b949f James Chapman 2024-08-05  385  		struct l2tp_tunnel *tunnel = READ_ONCE(session->tunnel);
1506ceb77b949f James Chapman 2024-08-05  386  
1506ceb77b949f James Chapman 2024-08-05  387  		/* ignore sessions with id 0 as they are internal for pppol2tp */
1506ceb77b949f James Chapman 2024-08-05  388  		if (session->session_id == 0) {
1506ceb77b949f James Chapman 2024-08-05  389  			(*key)++;
1506ceb77b949f James Chapman 2024-08-05  390  			goto again;
1506ceb77b949f James Chapman 2024-08-05  391  		}
1506ceb77b949f James Chapman 2024-08-05  392  
1506ceb77b949f James Chapman 2024-08-05 @393  		if (tunnel && tunnel->tunnel_id == tid &&
                                                            ^^^^^^
Is this check really necessary?

1506ceb77b949f James Chapman 2024-08-05  394  		    refcount_inc_not_zero(&session->ref_count)) {
1506ceb77b949f James Chapman 2024-08-05  395  			rcu_read_unlock_bh();
1506ceb77b949f James Chapman 2024-08-05  396  			return session;
1506ceb77b949f James Chapman 2024-08-05  397  		}
1506ceb77b949f James Chapman 2024-08-05  398  
1506ceb77b949f James Chapman 2024-08-05  399  		(*key)++;
1506ceb77b949f James Chapman 2024-08-05 @400  		if (tunnel->tunnel_id == tid)
                                                            ^^^^^^^^^^^^^^^^^
Because if it is, then this will crash.

1506ceb77b949f James Chapman 2024-08-05  401  			goto again;
1506ceb77b949f James Chapman 2024-08-05  402  	}
1506ceb77b949f James Chapman 2024-08-05  403  	rcu_read_unlock_bh();
1506ceb77b949f James Chapman 2024-08-05  404  
1506ceb77b949f James Chapman 2024-08-05  405  	return NULL;
1506ceb77b949f James Chapman 2024-08-05  406  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

