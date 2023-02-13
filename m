Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D32914
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676286940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgE91EF5P7iqqXpt6PtSMoHjg4zT1SgTrY7NGsebBbQ=;
	b=SPN47cjGGejosgnSE4jOeqdbvZg18DkozK0yHcdNPcPL55LJJbUANmKkaX2D/T74WADG3x
	97iQ//XaZ+7S39D76ZJIHqrZEArtCTqOl7/CJzFRCzI0gTJb6KCSVH1E8TjYrYj6IpOGkW
	lLyKZMKRmQVG4G7QoibshEEKlr2DQ/s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-n7BPICeyOHSm-TbNDEWs-A-1; Mon, 13 Feb 2023 06:15:39 -0500
X-MC-Unique: n7BPICeyOHSm-TbNDEWs-A-1
Received: by mail-qk1-f200.google.com with SMTP id x14-20020a05620a14ae00b0072f7f0f356bso7248950qkj.1
        for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 03:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgE91EF5P7iqqXpt6PtSMoHjg4zT1SgTrY7NGsebBbQ=;
        b=JBiE6ZeG6jbqQFqPFTaaPg0/k6iqreOZ1p4HzDb+7G/P2MJr6KK74qXLTTFGWUxA9O
         EQraS480JO1NNSQ2EVDSEm9WGm71IfAd6l1Jsh3BWrzQWDWUU8uTIjuzR+UEnJj21tkg
         ig/HKWr1fbeEyhFfQYGrMo/R7KSGObbmC1LO8wexo7w/KW/0ltba/wi5O1MyB5eo8yVZ
         Ls5OZ3CztvxlMRebbYTOB3WqrFCFvD20MWFPC4aiMGxDXcKztwqw5qt+cdUWXUF79x31
         RijBA//vN72L3gLW9njqJ71wQ8cSIcMq0bhc8CAMmgMiFnbJINshyu/W66zkiwnHzCYF
         nxfw==
X-Gm-Message-State: AO0yUKVd7JBGmNHNlzbSYOq9yuzTcFXbeIxUxhZPJUbS7FRtkpxcQn4r
	8SKCmooUHjL84w1mwfmiXb25MBBUHp25r+l4C7+9MHqJnmnBIsEyxCeZNHm5k3XUg22jfqyCED1
	24dpKTvdWYOUu4BQco+V5
X-Received: by 2002:a05:622a:1301:b0:3a8:2ccb:f55d with SMTP id v1-20020a05622a130100b003a82ccbf55dmr42017627qtk.33.1676286938877;
        Mon, 13 Feb 2023 03:15:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8LqotNWAhkP4eDucQle2O3z8eSl+aQYETnylIeG+7DeQodD4EiIoDQiEjonnYcGhrhfkbk2Q==
X-Received: by 2002:a05:622a:1301:b0:3a8:2ccb:f55d with SMTP id v1-20020a05622a130100b003a82ccbf55dmr42017604qtk.33.1676286938601;
        Mon, 13 Feb 2023 03:15:38 -0800 (PST)
Received: from debian (2a01cb058918ce0052a1c4711233f5f0.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:52a1:c471:1233:f5f0])
        by smtp.gmail.com with ESMTPSA id q1-20020ac84101000000b003b9dca4cdf4sm9035636qtl.83.2023.02.13.03.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 03:15:38 -0800 (PST)
Date: Mon, 13 Feb 2023 12:15:35 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing
 error code 'ret'
Message-ID: <Y+ob1xnM09kMlbRp@debian>
References: <202302031144.yY6UaRcD-lkp@intel.com>
 <Y9z8XPvcv5Wn2J8n@debian>
 <Y+nLBPj70/03q8Do@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y+nLBPj70/03q8Do@kadam>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 13, 2023 at 08:30:44AM +0300, Dan Carpenter wrote:
> On Fri, Feb 03, 2023 at 01:21:48PM +0100, Guillaume Nault wrote:
> > On Fri, Feb 03, 2023 at 11:56:01AM +0300, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   66a87fff1a87c260452f5a57123891ca5258c449
> > > commit: c4d48a58f32c5972174a1d01c33b296fe378cce0 l2tp: convert l2tp_tunnel_list to idr
> > > config: powerpc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031144.yY6UaRcD-lkp@intel.com/config)
> > > compiler: powerpc-linux-gcc (GCC) 12.1.0
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > 
> > > smatch warnings:
> > > net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing error code 'ret'
> > > 
> > > vim +/ret +1481 net/l2tp/l2tp_core.c
> > > 
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1456  int l2tp_tunnel_register(struct l2tp_tunnel *tunnel, struct net *net,
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1457  			 struct l2tp_tunnel_cfg *cfg)
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1458  {
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1459  	struct l2tp_net *pn = l2tp_pernet(net);
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1460  	u32 tunnel_id = tunnel->tunnel_id;
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1461  	struct socket *sock;
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1462  	struct sock *sk;
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1463  	int ret;
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1464  
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1465  	spin_lock_bh(&pn->l2tp_tunnel_idr_lock);
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1466  	ret = idr_alloc_u32(&pn->l2tp_tunnel_idr, NULL, &tunnel_id, tunnel_id,
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1467  			    GFP_ATOMIC);
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1468  	spin_unlock_bh(&pn->l2tp_tunnel_idr_lock);
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1469  	if (ret)
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1470  		return ret == -ENOSPC ? -EEXIST : ret;
> > > c4d48a58f32c59 Cong Wang       2023-01-13  1471  
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1472  	if (tunnel->fd < 0) {
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1473  		ret = l2tp_tunnel_sock_create(net, tunnel->tunnel_id,
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1474  					      tunnel->peer_tunnel_id, cfg,
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1475  					      &sock);
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1476  		if (ret < 0)
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1477  			goto err;
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1478  	} else {
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1479  		sock = sockfd_lookup(tunnel->fd, &ret);
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10  1480  		if (!sock)
> > > 6b9f34239b00e6 Guillaume Nault 2018-04-10 @1481  			goto err;
> > >                                                                         ^^^^^^^^^
> > > I don't know why this is showing up as a 3 week old warning when it
> > > looks like the code is from 2018...  Anyway, should this be an error
> > > path or a success path?
> > 
> > This is an error path.
> > But I don't understand this warning. Does it complain that 'ret' isn't
> > initialised before the 'goto err;' jump? (this is done by
> > sockfd_lookup() in case of error).
> 
> Or sorry, I didn't see the &ret.

No problem.

> Yes, Smatch thinks "ret" is zero here.
> The kbuild-bot can't use the cross function database (building the DB
> is too slow to scale).  So that's why the warning is printed.

Okay, thanks for the explanations.

> regards,
> dan carpenter
> 

