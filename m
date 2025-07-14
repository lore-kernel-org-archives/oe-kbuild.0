Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD00276052
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752519968; cv=none; b=eRx8CfqFHcxh/1JPfw98WAN27+BcPWdpdUXOjUHg3kZlWdkVh220V1lIqklBrHK8Rd9puCBXs29nOPBALrbV8Yh1VVf1NpQasZiL1YSD0OP8D0kE9q4QVB3q+ssi/wHS+xXonQHm2u8qe9x3DSEmJqega6DRgRg3RKzqpE3/Vcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752519968; c=relaxed/simple;
	bh=36OXI6KdfNW5Azr1XrUS3aZkxv95IVhnKyZFnAzOoQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tKO8+7EcBhjeazyPshfTU68Rw5oJfyOz30e4ahQn/jzcrG7JR6xs0BzwFzGUDQ/e+Nv19vhVFLeWVZJhwZKeo+B8+DorzI96zjdhPRU/kGTGzB/NdTXBWZt299ahzWSbQOeP9wkntxnyhVuhxM9maErI4t+ywhDBH3nYlC3sUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZC4hqlyN; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZC4hqlyN"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-61594007beeso32879eaf.3
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752519965; x=1753124765; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kej+z2nwqH47H8syUxUZJZrrsTEp7h/K0YFhcC1+oo=;
        b=ZC4hqlyNwZJFrt6KYulz50jsDNS0y7jbc7YoVjJ0D4BGKzdsk0LaATM+T9EenJBQIC
         2+yJodKLPATOV5rADeB6ZZxIGN627DfmrC+JTG+J7kekY4vxVXsr0zz6MA2Oalw54T2V
         y2W3b7LAMKU0xuwqeJMekyu1o+3Gzf/63+Jo3mPRGEKbN3FBxtzVasQTVRbe+BT8qIWY
         Y0lMZXamro5yd0l+c/Q9QqmVPvHathTB7NdpgAp/jJKc1n35fm3kff7MmJON7rSbbQID
         0KnZGNob0+VaBDkHUMnfHJwsD1qdaAyxab8Lo7s3V6JIBF6DsrDa+4k5OjsAag8lL13h
         lS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752519965; x=1753124765;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Kej+z2nwqH47H8syUxUZJZrrsTEp7h/K0YFhcC1+oo=;
        b=O9aXv67wnbCHfii+7odjRyxEU8HjspIInmc6QGTYwXv8finFSCRASOgCf2Zl+0ezI2
         GAUnDcdRyxsypqbLHHeXqcZhL39sVSkgvXoGTO5pjYxjVTC/IdvL33IHWjq8pjgb/zTd
         m9/NF557m1dJ3uprC2HfoD39eaDDWoODRwQkxlMBoj9E1XN3O51RDQEAy7dEmR+kYZ4b
         Aq6R8d2DQqKlScl9F9b4QOUUOF1BaC2sTV/8FboiysDIMJOz1sGV8RlBnhkHLxKfgJXD
         0eaAklrdjKChJjV0drI+NpFw6SCst1ayH2fqP0HvjtP1V7lbw/xsrTPVMJYFF5e9FL44
         O3uA==
X-Gm-Message-State: AOJu0YxRpWqnoWC7oh0WR5aoBYPsmdIQXDKjX/DSgJVYSKKdMXZCnT0W
	56ar89zfzi9t/BVl+dHTLTEqADktXKCbdHpObIV4lL/o5dRxHMcqOIfvXlQEZfXJO84BLpttqr/
	C2xZO
X-Gm-Gg: ASbGnctW5P8u9ECHzW+xYiULHtV6TZsjqP3k8EJHMdR+foztMvJjbB4K4GP3wt5OWaZ
	94MySz304q2+4EgV4qHjoqEZ4tsQlyyf7vSt7bCLpdX+PYAW/E3IE7LwN/my7DwhK3QylW4Mgm5
	Fa66A3ddBO3cGP/zqU+NW9KrRlrR2WAUfn3XtToGUHciKYCnMPpL9n0ZNIuoqQ9kxQqA2uW4TXQ
	uy4MBnu9Xk9g8PmxdhKSvs13NE0knK38iop7KABc8n7/hPWdbLKdL6q71bWgQBAoiIkt8JBtKnX
	9A4Junjne/kSKCs3z14F9UfidmGXCKs1smOYuuy59/qW4F5ARZ16LaTXOZvsgHmV22IWOSSPKyl
	ogbjNtgvIed1N3ddPtcPCfvcQYVcXnw==
X-Google-Smtp-Source: AGHT+IGZFgkatUwd5pWgCV0TZaCErLH8Y+F35AINecBPyk3TXs9Ccww4XoxGRNH0aYE4YRF/Gl4C2A==
X-Received: by 2002:a05:6820:c85:b0:613:cb90:21c with SMTP id 006d021491bc7-613e6015f92mr9732936eaf.8.1752519965067;
        Mon, 14 Jul 2025 12:06:05 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9d6d51bsm1169531eaf.5.2025.07.14.12.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:06:03 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:06:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eric Woudstra <ericwouds@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, bridge@lists.linux.dev,
	Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH v13 nf-next 1/3] netfilter: utils: nf_checksum(_partial)
 correct data!=networkheader
Message-ID: <e70e50e8-9419-4ca0-b65d-dbf4869a5d89@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704191135.1815969-2-ericwouds@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/netfilter-utils-nf_checksum-_partial-correct-data-networkheader/20250705-031418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20250704191135.1815969-2-ericwouds%40gmail.com
patch subject: [PATCH v13 nf-next 1/3] netfilter: utils: nf_checksum(_partial) correct data!=networkheader
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061710.RCwA4Kjw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507061710.RCwA4Kjw-lkp@intel.com/

smatch warnings:
net/netfilter/utils.c:131 nf_checksum() warn: signedness bug returning '(-12)'
net/netfilter/utils.c:155 nf_checksum_partial() warn: signedness bug returning '(-12)'

vim +131 net/netfilter/utils.c

ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  123  __sum16 nf_checksum(struct sk_buff *skb, unsigned int hook,
                                                  ^^^^^^^
ebee5a50d0b7cd Florian Westphal  2018-06-25  124  		    unsigned int dataoff, u8 protocol,
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  125  		    unsigned short family)
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  126  {
39644744ee13d9 Eric Woudstra     2025-07-04  127  	unsigned int nhpull = skb_network_header(skb) - skb->data;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  128  	__sum16 csum = 0;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  129  
39644744ee13d9 Eric Woudstra     2025-07-04  130  	if (!pskb_may_pull(skb, nhpull))
39644744ee13d9 Eric Woudstra     2025-07-04 @131  		return -ENOMEM;

This -ENOMEM doesn't work because the return type is u16.

39644744ee13d9 Eric Woudstra     2025-07-04  132  	__skb_pull(skb, nhpull);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  133  	switch (family) {
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  134  	case AF_INET:
39644744ee13d9 Eric Woudstra     2025-07-04  135  		csum = nf_ip_checksum(skb, hook, dataoff - nhpull, protocol);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  136  		break;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  137  	case AF_INET6:
39644744ee13d9 Eric Woudstra     2025-07-04  138  		csum = nf_ip6_checksum(skb, hook, dataoff - nhpull, protocol);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  139  		break;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  140  	}
39644744ee13d9 Eric Woudstra     2025-07-04  141  	__skb_push(skb, nhpull);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  142  
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  143  	return csum;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  144  }
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  145  EXPORT_SYMBOL_GPL(nf_checksum);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  146  
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  147  __sum16 nf_checksum_partial(struct sk_buff *skb, unsigned int hook,
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  148  			    unsigned int dataoff, unsigned int len,
ebee5a50d0b7cd Florian Westphal  2018-06-25  149  			    u8 protocol, unsigned short family)
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  150  {
39644744ee13d9 Eric Woudstra     2025-07-04  151  	unsigned int nhpull = skb_network_header(skb) - skb->data;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  152  	__sum16 csum = 0;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  153  
39644744ee13d9 Eric Woudstra     2025-07-04  154  	if (!pskb_may_pull(skb, nhpull))
39644744ee13d9 Eric Woudstra     2025-07-04 @155  		return -ENOMEM;

Same.

39644744ee13d9 Eric Woudstra     2025-07-04  156  	__skb_pull(skb, nhpull);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  157  	switch (family) {
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  158  	case AF_INET:
39644744ee13d9 Eric Woudstra     2025-07-04  159  		csum = nf_ip_checksum_partial(skb, hook, dataoff - nhpull,
39644744ee13d9 Eric Woudstra     2025-07-04  160  					      len, protocol);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  161  		break;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  162  	case AF_INET6:
39644744ee13d9 Eric Woudstra     2025-07-04  163  		csum = nf_ip6_checksum_partial(skb, hook, dataoff - nhpull,
39644744ee13d9 Eric Woudstra     2025-07-04  164  					       len, protocol);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  165  		break;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  166  	}
39644744ee13d9 Eric Woudstra     2025-07-04  167  	__skb_push(skb, nhpull);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  168  
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  169  	return csum;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  170  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

