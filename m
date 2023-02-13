Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7EA1C26;
	Mon, 13 Feb 2023 05:30:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso10418680wmp.3;
        Sun, 12 Feb 2023 21:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvhpxDQXKeZtNY2kOg1NjTqJclEOHbxHiUQqZ6I9dxw=;
        b=qp3/C5926MROi1qC+NQSMfLtjLFurExr91eBEKuIFCbeA1Sh7bszDSOzGdNN5dImuT
         iRXHCbiU/mnl65PHX24obB0PX9XCg9nfWwBgp+D6g6wU1fnm7dhDsK3azsYI+x+ilTIB
         C7C6z0rwRSX59Ecrcvg0xz+uZGdKeso1ZK4pMuIAK6yWwegigk/0gVXA9BUPRMFUHkoN
         ieGc672uy1/w/QyI7/zqLDIQdPdt4MvFP2GH+D/2OSrgXzPcsg6uDS2nLCg3TA1Qc1Lj
         uoS/fZObKSirgMmXjOScgJBCZ/mZVnXX8OuZzhWCU8GTUo7htsn4mxYZr4JETzlFwsti
         Vy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvhpxDQXKeZtNY2kOg1NjTqJclEOHbxHiUQqZ6I9dxw=;
        b=6O1zEe+rOrC5ejzomtdTnCB8AigbmoMh0eCpbIY4fXCywNeoihhAxu7lkP2rm+gyMO
         AKwbBF7W8bB18fVy1H4FakZ1sQiAiAIdVPMZxWglcr+ZUEfkCrdsRhXXwgf0qZYoyGIA
         gx5bVaGZ2Hf81SjPvLlht2zwn3bj0qaVFYdE7KmAhhQJLkQvk7MYO9uLyIlhY6NGw0m/
         hIghmVJeNePO8MFUoHQyXYzdn3IMZyzOd+spfDZYQ4MoGWHmpngBhAQ0niQBXwHmK661
         87eUDpYlBqNP4A/k057sTAMbVqM5mFnDnESCBPwOmGiP62H/v1ZHIB5yNEds6rnhO84x
         iFsA==
X-Gm-Message-State: AO0yUKU04m7710Di15YZZUzlUQzhh9WlmASoxg2bVLtVe9N0NrSB2rMU
	URQErj1edhBv7faOX6KTg9A=
X-Google-Smtp-Source: AK7set8HlPyAMF4kK4KhmJs93HrfWCXInIDCyJoBhy9pE9ypwqk+Czc0+lWO2LUiInYHPnHOgul1Hg==
X-Received: by 2002:a05:600c:16c5:b0:3db:1434:c51a with SMTP id l5-20020a05600c16c500b003db1434c51amr17985268wmn.40.1676266252197;
        Sun, 12 Feb 2023 21:30:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003dd7edcc960sm12271594wmn.45.2023.02.12.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 21:30:51 -0800 (PST)
Date: Mon, 13 Feb 2023 08:30:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Guillaume Nault <gnault@redhat.com>
Cc: oe-kbuild@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing
 error code 'ret'
Message-ID: <Y+nLBPj70/03q8Do@kadam>
References: <202302031144.yY6UaRcD-lkp@intel.com>
 <Y9z8XPvcv5Wn2J8n@debian>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9z8XPvcv5Wn2J8n@debian>

On Fri, Feb 03, 2023 at 01:21:48PM +0100, Guillaume Nault wrote:
> On Fri, Feb 03, 2023 at 11:56:01AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   66a87fff1a87c260452f5a57123891ca5258c449
> > commit: c4d48a58f32c5972174a1d01c33b296fe378cce0 l2tp: convert l2tp_tunnel_list to idr
> > config: powerpc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031144.yY6UaRcD-lkp@intel.com/config)
> > compiler: powerpc-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing error code 'ret'
> > 
> > vim +/ret +1481 net/l2tp/l2tp_core.c
> > 
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1456  int l2tp_tunnel_register(struct l2tp_tunnel *tunnel, struct net *net,
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1457  			 struct l2tp_tunnel_cfg *cfg)
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1458  {
> > c4d48a58f32c59 Cong Wang       2023-01-13  1459  	struct l2tp_net *pn = l2tp_pernet(net);
> > c4d48a58f32c59 Cong Wang       2023-01-13  1460  	u32 tunnel_id = tunnel->tunnel_id;
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1461  	struct socket *sock;
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1462  	struct sock *sk;
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1463  	int ret;
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1464  
> > c4d48a58f32c59 Cong Wang       2023-01-13  1465  	spin_lock_bh(&pn->l2tp_tunnel_idr_lock);
> > c4d48a58f32c59 Cong Wang       2023-01-13  1466  	ret = idr_alloc_u32(&pn->l2tp_tunnel_idr, NULL, &tunnel_id, tunnel_id,
> > c4d48a58f32c59 Cong Wang       2023-01-13  1467  			    GFP_ATOMIC);
> > c4d48a58f32c59 Cong Wang       2023-01-13  1468  	spin_unlock_bh(&pn->l2tp_tunnel_idr_lock);
> > c4d48a58f32c59 Cong Wang       2023-01-13  1469  	if (ret)
> > c4d48a58f32c59 Cong Wang       2023-01-13  1470  		return ret == -ENOSPC ? -EEXIST : ret;
> > c4d48a58f32c59 Cong Wang       2023-01-13  1471  
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1472  	if (tunnel->fd < 0) {
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1473  		ret = l2tp_tunnel_sock_create(net, tunnel->tunnel_id,
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1474  					      tunnel->peer_tunnel_id, cfg,
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1475  					      &sock);
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1476  		if (ret < 0)
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1477  			goto err;
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1478  	} else {
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1479  		sock = sockfd_lookup(tunnel->fd, &ret);
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1480  		if (!sock)
> > 6b9f34239b00e6 Guillaume Nault 2018-04-10 @1481  			goto err;
> >                                                                         ^^^^^^^^^
> > I don't know why this is showing up as a 3 week old warning when it
> > looks like the code is from 2018...  Anyway, should this be an error
> > path or a success path?
> 
> This is an error path.
> But I don't understand this warning. Does it complain that 'ret' isn't
> initialised before the 'goto err;' jump? (this is done by
> sockfd_lookup() in case of error).

Or sorry, I didn't see the &ret.  Yes, Smatch thinks "ret" is zero here.
The kbuild-bot can't use the cross function database (building the DB
is too slow to scale).  So that's why the warning is printed.

regards,
dan carpenter
