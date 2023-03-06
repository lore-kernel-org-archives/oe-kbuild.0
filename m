Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CFD320E;
	Mon,  6 Mar 2023 15:17:33 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id a25so40268680edb.0;
        Mon, 06 Mar 2023 07:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678115852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vD3pTKOSQUqZ+UJn/Y7zVf+0Kd/j1+IqO4HRzZNJT0U=;
        b=Gyh8b3eO/RRxdR1QXsuwG0838Ofnr+8Y2LQZzsqCbsbYQ480FQ1dNr3WjkwpiGmnPV
         JFxedOKnSBE6T7xTWKul4kTUfE5Psbj0MQc4VqzV3l/bPE14FJvc3JkqrKxZZWlqtj+e
         +lMfWblsVQ9ktohP8csmzaV+w6xh1e+i4eKGnqhwvcSKHKG/oy0uC7KH4od+tJCuQkdt
         RDQRGCEfBeF2bC7MSWw34fLvMsOdaIfB75r6Tgn6/wE4/p3zO9wUI9tov+XkvzaD4BL/
         9UlbtzP6UwE7YXp2Fi/zF3IvDY0+ei8RjwnE3wpfq8tTZ2VmFyTfwabtoP2YiapahYLf
         TELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678115852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vD3pTKOSQUqZ+UJn/Y7zVf+0Kd/j1+IqO4HRzZNJT0U=;
        b=e6fCF8FG/WuO8lxJezHpqvkRQp6Nd3CxWMIApNhi9UoJ6eRbz8l7wJOKwKi1XWt3bG
         6nt5eq7iZk7QbsyBRkguTE0zev9bPCY7zyxEp85gTLRRZDe1UrdfRw6JWyHYfNqd1BZZ
         SD1YX6gbcnbPcvrf1esKpjoRIwh6MFPYaWDnoBo8j27CJslMBUDS4gE8y1lgx1uHllzI
         OiFnwkRDbPGghEKP0D4+eGbnCKO49RLv0Tj+OjIP6ccoazS5a98zi/gGEUirvU90b5/f
         X2l9XDHA2qDczrhrT29X0ORWx2kXgADl/pSZtUv2hcRxJpzAs86m6zq+dQKXUEv8B+TJ
         /mtA==
X-Gm-Message-State: AO0yUKUlKsn6N94DkNFxq5wXM3EJMTKPkE8f2yWLu9h9A4XWeverXC2f
	FGoIOoggUe1F7FaqsZm6D0s=
X-Google-Smtp-Source: AK7set/j/gpGnYT9Fe/DpfQrtlVhQYEU3y6bdSrk1jNFlUInGCiKGmny9OYuEu8yfHIp9DvCeSj9Zg==
X-Received: by 2002:a17:906:c091:b0:888:9bd6:34d2 with SMTP id f17-20020a170906c09100b008889bd634d2mr9997106ejz.63.1678115851633;
        Mon, 06 Mar 2023 07:17:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id uo17-20020a170907cc1100b008b17ed98d05sm4675212ejc.120.2023.03.06.07.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:17:31 -0800 (PST)
Date: Mon, 6 Mar 2023 18:17:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [cel:topic-rpc-with-tls-upcall 1/18] net/handshake/netlink.c:187
 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
Message-ID: <9cbf9852-e58d-451d-9911-484112a92d6c@kili.mountain>
References: <85ee6966-32b0-4ff2-8af0-2678ecf77609@kili.mountain>
 <55614170-7D09-4865-9EA8-E9532D3E3F73@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55614170-7D09-4865-9EA8-E9532D3E3F73@oracle.com>

On Mon, Mar 06, 2023 at 03:11:23PM +0000, Chuck Lever III wrote:
> 
> 
> > On Mar 6, 2023, at 5:01 AM, Dan Carpenter <error27@gmail.com> wrote:
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
> > head:   88897fb973ffb2448e3452ca4e9283908bd257f6
> > commit: d166e9ec5e3800de085444eca5883ce1738f6cb3 [1/18] net/handshake: Create a NETLINK service for handling handshake requests
> > config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230306/202303061707.ICwrtQsr-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202303061707.ICwrtQsr-lkp@intel.com/
> > 
> > smatch warnings:
> > net/handshake/netlink.c:187 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
> > net/handshake/netlink.c:240 handshake_nl_done_doit() error: uninitialized symbol 'req'.
> > net/handshake/request.c:193 handshake_complete() warn: test_and_set_bit() takes a bit number
> > net/handshake/request.c:236 handshake_req_cancel() warn: test_and_set_bit() takes a bit number

Thanks Chuck, but don't forget about these as well.  I haven't looked
at the code but I suspect that it's passing BIT(x) to test_bit() instead
of just passing x.

regards,
dan carpenter

