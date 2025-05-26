Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D901C861D
	for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241409; cv=none; b=M99qOXvXScRQdkKl20a7C3mAMpfl9RHxtWpLaOXP/B0gnJytiKof1KHSVlaDOIsVJIhcSExg7RXQdb177L7M68rM/8xj22JLwhTR1bEsMpH/pvD2SSuArfIZdCXgj0DR46rBrbbZ5pZjkmeszidkRUb+lOmpMq5pimI0o0TiYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241409; c=relaxed/simple;
	bh=f357TMpsKFIO6MjcV4osUpKN3OM2rvj7EyZMQSoPwis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gqJ2JlEM55qzhZ5Z+bDMHKZwfYolzxIATC+TduEH4i5Mn+T/W3W6Zy5JRG6j3viQ7QFnN6Rl0pVDprau81aDcfAp1Xrab/IdPuw2YadF07ohkXEJZ8nOskdsKVUUpPnW/hunvDfv4fGmRWOkkmuWgUEm8GfhSCb39wTuxi2kDSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbb+1vBt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbb+1vBt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so22539035e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748241405; x=1748846205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szPoFZo1qtuOcko9W28Xe98h6q8n7Lwdut0b0uqIg+c=;
        b=tbb+1vBtoQ/B6W8Ap9gosZdLVnAtpAHiNLFesSsQtw63aYVSkeUqvCO6OGS9p/6M2H
         wruvxCmPh2Zyvk0mkarRFvMmm9WdWDFqd5ryuzrtobVlxnuQL3YDxlW6AL9BE6y/hb+d
         Dm/Gq0iIeCAeUM1rItz7NUbze1/lUTYdMzfMwbO+0Er3zR7TJ9WZixKHwHm+gA+/AJug
         55aQhA24k2CrPs95lsagJdB7lczY92slpKrT5hfSlWhUDrAsR+zHtuKLhGZkcj5L9VAF
         GXPAMeOEqD/obzqkj/iKlOi+/wEN0N/+ll4lmX6K2WqX8MfvDLRRiN+3ahOW26A/eqCk
         xuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748241405; x=1748846205;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szPoFZo1qtuOcko9W28Xe98h6q8n7Lwdut0b0uqIg+c=;
        b=Ha7owVZy9yK0+e4JKxJzC/LW/6JcNw4/l70FXpudWZXU3Anx9Aec6xuUvC/wIqzGsf
         Fe3nAMRPgAzoVWVglDmqzAGL/Xwpj5IakMsOanGnpNGGfTftJYqbaL4BVncMTb3KBumY
         BynwLUQ+dFUYpleTS/GG+06nps8X9uJQPLPXsuGRMuRs3zPN32NQc3T70snSgDXwskge
         HUD6VprAQZaO1d7digYwjPIaXhQKMoslX4mlosyfA+XMLV98nBLcizKqNqze+pfyvN+f
         tihlNNPjKPuQA+O+QmI9dC6896E+B+62xAhEEev29dVZbIvoCOvePCIGWCmKab4nfnK+
         NhXA==
X-Gm-Message-State: AOJu0Yw4I0d3pmE6f0pDBHIsURxzF15Jm7PJg79gdqdZqVryrZHItIPS
	kED7DXhDm+n1q/uiSt6TGtRVoobTYfs5lXc1EaJi9O2UhqVpsI9cqmdO7wPXPVYOlBu5QwV1zf9
	yCb3/
X-Gm-Gg: ASbGncvr/BMl3xY33B7yvl1DOF45dIDnx5PR65B1t5apQHI/BGV3b+ExJzKzhE2fpDW
	yGFbqkQTRSUbOfmMPUhsdkOvB63QRbARMexrsYfpJj2XID9gPuyP+o3gFCwf4C4d/qnWlzFUAWH
	+hNxiwZUrnc+jr+zt6+mtV7U0UvvEpgUjvScHp4Uv6IRSEw1aXD5tWOYtk7Z3mM9uJLa+ll/Sd7
	v1YXZ+6utAeFvawj01tVnJvGNffPku2zsvzQCd3PZzRNvjL/cPcqYyRFw0/dKc05rmURA790UDj
	5pkCYIEgHeCDPQ2bc2xE1jh7y+IWyQvidMmxT7xUnEJ6pyRaCPg4S383
X-Google-Smtp-Source: AGHT+IEQ7uO7eq3sWoX6vR13FTdVqyDvylkH1GTJLSx4FN8jLcvB+d2mvQA5tQ2N/TYUDL6/KQ9IHw==
X-Received: by 2002:a05:600c:3b19:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-44c8f25dab7mr78164895e9.0.1748241405368;
        Sun, 25 May 2025 23:36:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4d10e98f8sm4698986f8f.42.2025.05.25.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 23:36:44 -0700 (PDT)
Date: Mon, 26 May 2025 09:36:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rafal Bilkowski <rafalbilkowski@gmail.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, dsahern@kernel.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	Rafal Bilkowski <rafalbilkowski@gmail.com>
Subject: Re: [PATCH]    net: ipv6: sanitize RPL SRH cmpre/cmpre fields to fix
 taint issue
Message-ID: <202505251717.YSYmRdLZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524055159.32982-1-rafalbilkowski@gmail.com>
Message-ID: <20250526063641.g4-PcVwL-ytETsDnr3bv9URjdDpHtVvC385jHS5xBGk@z>

Hi Rafal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafal-Bilkowski/net-ipv6-sanitize-RPL-SRH-cmpre-cmpre-fields-to-fix-taint-issue/20250524-135351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git master
patch link:    https://lore.kernel.org/r/20250524055159.32982-1-rafalbilkowski%40gmail.com
patch subject: [PATCH]    net: ipv6: sanitize RPL SRH cmpre/cmpre fields to fix taint issue
config: parisc-randconfig-r072-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251717.YSYmRdLZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505251717.YSYmRdLZ-lkp@intel.com/

smatch warnings:
net/ipv6/exthdrs.c:511 ipv6_rpl_srh_rcv() error: uninitialized symbol 'hdr'.
net/ipv6/exthdrs.c:547 ipv6_rpl_srh_rcv() warn: impossible condition '(hdr->cmpri > 15) => (0-15 > 15)'
net/ipv6/exthdrs.c:547 ipv6_rpl_srh_rcv() warn: impossible condition '(hdr->cmpre > 15) => (0-15 > 15)'
net/ipv6/exthdrs.c:550 ipv6_rpl_srh_rcv() warn: impossible condition '(hdr->pad > 15) => (0-15 > 15)'
net/ipv6/exthdrs.c:555 ipv6_rpl_srh_rcv() warn: 'n' unsigned <= 0

vim +/hdr +511 net/ipv6/exthdrs.c

8610c7c6e3bd64 Alexander Aring     2020-03-27  482  static int ipv6_rpl_srh_rcv(struct sk_buff *skb)
8610c7c6e3bd64 Alexander Aring     2020-03-27  483  {
8610c7c6e3bd64 Alexander Aring     2020-03-27  484  	struct ipv6_rpl_sr_hdr *hdr, *ohdr, *chdr;
8610c7c6e3bd64 Alexander Aring     2020-03-27  485  	struct inet6_skb_parm *opt = IP6CB(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  486  	struct net *net = dev_net(skb->dev);
8610c7c6e3bd64 Alexander Aring     2020-03-27  487  	struct inet6_dev *idev;
8610c7c6e3bd64 Alexander Aring     2020-03-27  488  	struct ipv6hdr *oldhdr;
8610c7c6e3bd64 Alexander Aring     2020-03-27  489  	unsigned char *buf;
8610c7c6e3bd64 Alexander Aring     2020-03-27  490  	int accept_rpl_seg;
8610c7c6e3bd64 Alexander Aring     2020-03-27  491  	int i, err;
8610c7c6e3bd64 Alexander Aring     2020-03-27  492  	u64 n = 0;
8610c7c6e3bd64 Alexander Aring     2020-03-27  493  	u32 r;
8610c7c6e3bd64 Alexander Aring     2020-03-27  494  
8610c7c6e3bd64 Alexander Aring     2020-03-27  495  	idev = __in6_dev_get(skb->dev);
8610c7c6e3bd64 Alexander Aring     2020-03-27  496  
8610c7c6e3bd64 Alexander Aring     2020-03-27  497  	accept_rpl_seg = net->ipv6.devconf_all->rpl_seg_enabled;
8610c7c6e3bd64 Alexander Aring     2020-03-27  498  	if (accept_rpl_seg > idev->cnf.rpl_seg_enabled)
8610c7c6e3bd64 Alexander Aring     2020-03-27  499  		accept_rpl_seg = idev->cnf.rpl_seg_enabled;
8610c7c6e3bd64 Alexander Aring     2020-03-27  500  
8610c7c6e3bd64 Alexander Aring     2020-03-27  501  	if (!accept_rpl_seg) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  502  		kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  503  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  504  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  505  
8610c7c6e3bd64 Alexander Aring     2020-03-27  506  looped_back:
045bd21f380952 Rafal Bilkowski     2025-05-24  507  
045bd21f380952 Rafal Bilkowski     2025-05-24  508  	if (!pskb_may_pull(skb, skb_transport_offset(skb) + sizeof(struct ipv6_rpl_sr_hdr)))
045bd21f380952 Rafal Bilkowski     2025-05-24  509  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  510  	// Check if there is enough memory available for the header and hdrlen is in valid range
045bd21f380952 Rafal Bilkowski     2025-05-24 @511  	if (skb_tailroom(skb) < ((hdr->hdrlen + 1) << 3) ||

Where is hdr initialized?  Is part of the commit missing?

045bd21f380952 Rafal Bilkowski     2025-05-24  512  	    hdr->hdrlen == 0 ||
045bd21f380952 Rafal Bilkowski     2025-05-24  513  	    hdr->hdrlen > U8_MAX)
045bd21f380952 Rafal Bilkowski     2025-05-24  514  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  515  
8610c7c6e3bd64 Alexander Aring     2020-03-27  516  	hdr = (struct ipv6_rpl_sr_hdr *)skb_transport_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  517  
8610c7c6e3bd64 Alexander Aring     2020-03-27  518  	if (hdr->segments_left == 0) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  519  		if (hdr->nexthdr == NEXTHDR_IPV6) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  520  			int offset = (hdr->hdrlen + 1) << 3;
8610c7c6e3bd64 Alexander Aring     2020-03-27  521  
8610c7c6e3bd64 Alexander Aring     2020-03-27  522  			skb_postpull_rcsum(skb, skb_network_header(skb),
8610c7c6e3bd64 Alexander Aring     2020-03-27  523  					   skb_network_header_len(skb));
ac9d8a66e41d55 Kuniyuki Iwashima   2023-06-14  524  			skb_pull(skb, offset);
8610c7c6e3bd64 Alexander Aring     2020-03-27  525  			skb_postpull_rcsum(skb, skb_transport_header(skb),
8610c7c6e3bd64 Alexander Aring     2020-03-27  526  					   offset);
8610c7c6e3bd64 Alexander Aring     2020-03-27  527  
8610c7c6e3bd64 Alexander Aring     2020-03-27  528  			skb_reset_network_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  529  			skb_reset_transport_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  530  			skb->encapsulation = 0;
8610c7c6e3bd64 Alexander Aring     2020-03-27  531  
8610c7c6e3bd64 Alexander Aring     2020-03-27  532  			__skb_tunnel_rx(skb, skb->dev, net);
8610c7c6e3bd64 Alexander Aring     2020-03-27  533  
8610c7c6e3bd64 Alexander Aring     2020-03-27  534  			netif_rx(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  535  			return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  536  		}
8610c7c6e3bd64 Alexander Aring     2020-03-27  537  
8610c7c6e3bd64 Alexander Aring     2020-03-27  538  		opt->srcrt = skb_network_header_len(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  539  		opt->lastopt = opt->srcrt;
8610c7c6e3bd64 Alexander Aring     2020-03-27  540  		skb->transport_header += (hdr->hdrlen + 1) << 3;
8610c7c6e3bd64 Alexander Aring     2020-03-27  541  		opt->nhoff = (&hdr->nexthdr) - skb_network_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  542  
8610c7c6e3bd64 Alexander Aring     2020-03-27  543  		return 1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  544  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  545  
045bd21f380952 Rafal Bilkowski     2025-05-24  546  	// Check if cmpri and cmpre are valid and do not exceed 15

These comments are pointless.  It's just explaining what an if statement
does but it doesn't explain why 15 is chosen.  #MagicNumber

045bd21f380952 Rafal Bilkowski     2025-05-24 @547  	if (hdr->cmpri > 15 || hdr->cmpre > 15)
045bd21f380952 Rafal Bilkowski     2025-05-24  548  		goto error;

I don't normally report these because it's fine to add pointless
if statements if it makes the code more readable.  But that's
not really what's happening here based on the commit message.

045bd21f380952 Rafal Bilkowski     2025-05-24  549  	// Check if pad value is valid and does not exceed 15
045bd21f380952 Rafal Bilkowski     2025-05-24 @550  	if (hdr->pad > 15)
045bd21f380952 Rafal Bilkowski     2025-05-24  551  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  552  
8610c7c6e3bd64 Alexander Aring     2020-03-27  553  	n = (hdr->hdrlen << 3) - hdr->pad - (16 - hdr->cmpre);
045bd21f380952 Rafal Bilkowski     2025-05-24  554  	// Check if n is non-negative
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
n is unsigned so it can't be negative.

045bd21f380952 Rafal Bilkowski     2025-05-24 @555  	if (n <= 0)
045bd21f380952 Rafal Bilkowski     2025-05-24  556  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  557  
8610c7c6e3bd64 Alexander Aring     2020-03-27  558  	r = do_div(n, (16 - hdr->cmpri));
8610c7c6e3bd64 Alexander Aring     2020-03-27  559  	/* checks if calculation was without remainder and n fits into
8610c7c6e3bd64 Alexander Aring     2020-03-27  560  	 * unsigned char which is segments_left field. Should not be
8610c7c6e3bd64 Alexander Aring     2020-03-27  561  	 * higher than that.
8610c7c6e3bd64 Alexander Aring     2020-03-27  562  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

