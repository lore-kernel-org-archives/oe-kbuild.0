Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D75729A2
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675426914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/iWvwr9L2DmJ1MAQBDrXjwhR/OpMGxajLpmUomtu16k=;
	b=YPtfuI2UnnKaCKVDCUo4tnncdJAycODogz9PQrhN6RkucUwx2iMGeDZtR7BeWMSh2JWdP6
	BqWAy7bNqh1XzIoYYsHlBLmRczD8scPuLvxQmOurIRUKjA/+diMoFLCT9DW561wJ3ISZ2p
	hJq1VmPaMm9fV1pDOawvcXHMkneRmL8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-sey6vBjAPPeUpUFmYDBohw-1; Fri, 03 Feb 2023 07:21:53 -0500
X-MC-Unique: sey6vBjAPPeUpUFmYDBohw-1
Received: by mail-qk1-f199.google.com with SMTP id j29-20020a05620a001d00b00724fd33cb3eso3206862qki.14
        for <oe-kbuild@lists.linux.dev>; Fri, 03 Feb 2023 04:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iWvwr9L2DmJ1MAQBDrXjwhR/OpMGxajLpmUomtu16k=;
        b=SolokDtRrSjNDCiVqS8v4JeDAg4cvKr98xmSTB+ewe095GMVTqZlU6dVtUONe2IE0p
         gt8yZx2Dp/Dh2KVWx/56eu357hzRCR3UtJX0Ht0YWna1FDifrgrG/D0P/suvNkiiu2ts
         YHVa95lzOS3AeRnrD2EMPlFfK3BWo7k8uK++5CLUHt+UefpJnFJo39brCYSWvOeuV1dl
         nCHDHurqHkckcRxUawfhterivZYZ6Zf3oXUGXrh3uF4SDLL9imHef90e8IFxitx1FnsT
         zmifF3xY7Suj7OU5I3LQwHRIbMUwN3ObHRCa5ANZo+a/7/Jj3/eyAJ7LyiRPJwo3psXh
         TvVw==
X-Gm-Message-State: AO0yUKXDk083+9Fqp9EuYwLKmo/HofpgJ/R4qp/114EGWg+GDGf/+uXh
	s0Gf35KHNTrQchvGe4abrcD9t+Bl6M9+jbJfnSCHb3jJ3JxZAmxyWM3yyJkiq90kGzEEV8eiz1j
	SE+tfAfm9UVsmy/ad8bpI
X-Received: by 2002:ad4:4ea9:0:b0:569:ca4a:f43a with SMTP id ed9-20020ad44ea9000000b00569ca4af43amr2068046qvb.17.1675426912748;
        Fri, 03 Feb 2023 04:21:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8twCog3F1I1XaD90c7D1NEz0cVPNiyWLY81koaeGmUA3SfTejDiOh0CnX2PpEpPWkURyvyiQ==
X-Received: by 2002:ad4:4ea9:0:b0:569:ca4a:f43a with SMTP id ed9-20020ad44ea9000000b00569ca4af43amr2068011qvb.17.1675426912479;
        Fri, 03 Feb 2023 04:21:52 -0800 (PST)
Received: from debian (2a01cb058918ce0086895da7f8f951ef.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:8689:5da7:f8f9:51ef])
        by smtp.gmail.com with ESMTPSA id 3-20020ac856e3000000b003b86c0046a0sm1462861qtu.20.2023.02.03.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 04:21:51 -0800 (PST)
Date: Fri, 3 Feb 2023 13:21:48 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing
 error code 'ret'
Message-ID: <Y9z8XPvcv5Wn2J8n@debian>
References: <202302031144.yY6UaRcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202302031144.yY6UaRcD-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 11:56:01AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   66a87fff1a87c260452f5a57123891ca5258c449
> commit: c4d48a58f32c5972174a1d01c33b296fe378cce0 l2tp: convert l2tp_tunnel_list to idr
> config: powerpc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031144.yY6UaRcD-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing error code 'ret'
> 
> vim +/ret +1481 net/l2tp/l2tp_core.c
> 
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1456  int l2tp_tunnel_register(struct l2tp_tunnel *tunnel, struct net *net,
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1457  			 struct l2tp_tunnel_cfg *cfg)
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1458  {
> c4d48a58f32c59 Cong Wang       2023-01-13  1459  	struct l2tp_net *pn = l2tp_pernet(net);
> c4d48a58f32c59 Cong Wang       2023-01-13  1460  	u32 tunnel_id = tunnel->tunnel_id;
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1461  	struct socket *sock;
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1462  	struct sock *sk;
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1463  	int ret;
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1464  
> c4d48a58f32c59 Cong Wang       2023-01-13  1465  	spin_lock_bh(&pn->l2tp_tunnel_idr_lock);
> c4d48a58f32c59 Cong Wang       2023-01-13  1466  	ret = idr_alloc_u32(&pn->l2tp_tunnel_idr, NULL, &tunnel_id, tunnel_id,
> c4d48a58f32c59 Cong Wang       2023-01-13  1467  			    GFP_ATOMIC);
> c4d48a58f32c59 Cong Wang       2023-01-13  1468  	spin_unlock_bh(&pn->l2tp_tunnel_idr_lock);
> c4d48a58f32c59 Cong Wang       2023-01-13  1469  	if (ret)
> c4d48a58f32c59 Cong Wang       2023-01-13  1470  		return ret == -ENOSPC ? -EEXIST : ret;
> c4d48a58f32c59 Cong Wang       2023-01-13  1471  
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1472  	if (tunnel->fd < 0) {
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1473  		ret = l2tp_tunnel_sock_create(net, tunnel->tunnel_id,
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1474  					      tunnel->peer_tunnel_id, cfg,
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1475  					      &sock);
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1476  		if (ret < 0)
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1477  			goto err;
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1478  	} else {
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1479  		sock = sockfd_lookup(tunnel->fd, &ret);
> 6b9f34239b00e6 Guillaume Nault 2018-04-10  1480  		if (!sock)
> 6b9f34239b00e6 Guillaume Nault 2018-04-10 @1481  			goto err;
>                                                                         ^^^^^^^^^
> I don't know why this is showing up as a 3 week old warning when it
> looks like the code is from 2018...  Anyway, should this be an error
> path or a success path?

This is an error path.
But I don't understand this warning. Does it complain that 'ret' isn't
initialised before the 'goto err;' jump? (this is done by
sockfd_lookup() in case of error).

