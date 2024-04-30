Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A43F9C2
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462204; cv=none; b=AthiVzPnqRe2fgBamtBgG4We30yDj15Uv6FcryiaaR01qtYXOOpTF0JIbO88eGSNBhYPfjvFpNur8D1Vu1rUa6p8DUTGC7gYUxOvEHjNxqc0E6AwT4qBvftvsTSfi1FxKEBCEEp9AxfGIhGBTORX/LCnUPQYrCjFcXeCO8PQOGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462204; c=relaxed/simple;
	bh=vPRzrz4KHaiKE/Ee8BHlhjHFLIdji5EOgwc/kZSc/PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eS4pESLItQiOOKaXKpWCyYyR+A7SAhX0uFc5r49p8lbomC+Hr3GtUF5JYOoPF8wafA0HyXGGTCfFsKGdPCgOD15tjociVbKnGPGExqZ/FYRsqplF6N5Q+EsxIHVVN36/CIkiaXUCE8BfbfMySHQBdAelupeu2g2u/20hPm2UmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ok7Eclk8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ok7Eclk8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so6622217a12.0
        for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714462200; x=1715067000; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4O72YgIq0VJOrYsc+awiottllT2PSmLYAMhVusgwnMs=;
        b=ok7Eclk8CyuOd0rcgoZEOSD3PVY+ommRmEorOaJMnvKBB87JG68y6g6pDNliIRppe7
         oCZgodrU4TAqScPYCssdSHc0qJPIDLA9aK2+rSJQ9w8tXFbvpBoWC8BFEPYhxP3J6yYo
         qRW1a68R0Bty65SseYJDnXbpxYzCMuwBRL83d08NREWm5xR7W+Of5MXDur+cZQErBB4e
         LoqX+FDogIdqB6Rvebl0OagSVc/uSPU8d/Ll0aSwmYt6GBJwk7fDONEnxhnbXDh6ZKcO
         2CPSZN1jfP0ZVWGyETRMoXQsjUfE0zlS6/oiaGu81CWTkJ4YhC4e94hiyRMiLyM/tLJA
         7KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462200; x=1715067000;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4O72YgIq0VJOrYsc+awiottllT2PSmLYAMhVusgwnMs=;
        b=NVleOfKE4lx3s+bOKGbqNGI7LwqlSa1XMHTJD+oL+LzyKopBiSvKFd0/LzOp+DkoD3
         aXguCsN5peacg9a72P0a09ZKjE2y0SgGvBY4mdEbQjPvc39nASAwYyRL/qtxF08oAO9F
         huiMFLpJcGNf91i0KWWdewarC4E8YO/TBKtD4gtQANZ4dOvejAouPK56jmNrTeTPJ+q8
         y6WH0dAubvpm/L6+uzDMdWlUtFXoKaSa/uBjhqbC9CtxP9GVyV8ERb9ovHUm623P0Ap6
         vqemiyYHDSVvHduPbh65x7l2C3USRYPLzxY/shGTAKx/IsWGYCrwoJnbs8DlIcg0266K
         dj6w==
X-Gm-Message-State: AOJu0YzrQhu2wSsdqeDD81ChmVkMPNniERy7x9lb2Mg21XBSEH6lqI4y
	JteuZLgTBwNLj8dPUdfMC9mq9NHpfwZVwVQzuqnVlInl2jwNbqaWePY6TPjl/W2cs4dUyL+BGDE
	f
X-Google-Smtp-Source: AGHT+IEiwkwI3NRc3OGLDX431vIDn+YQEzn0uQmqy6DusWwU7/vYvKI5bJ51fYj0kVF837wMag1+uw==
X-Received: by 2002:a17:906:aed2:b0:a58:a2f9:d795 with SMTP id me18-20020a170906aed200b00a58a2f9d795mr12458252ejb.59.1714462199832;
        Tue, 30 Apr 2024 00:29:59 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s19-20020a170906a19300b00a590f9c1f91sm1066066ejy.197.2024.04.30.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:29:59 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:29:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Adrian Moreno <amorenoz@redhat.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, aconole@redhat.com,
	echaudro@redhat.com, horms@kernel.org, i.maximets@ovn.org,
	Adrian Moreno <amorenoz@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pravin B Shelar <pshelar@ovn.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	linux-kernel@vger.kernel.org, dev@openvswitch.org
Subject: Re: [PATCH net-next 6/8] net:openvswitch: add psample support
Message-ID: <29e82a41-5e10-4135-9928-468e5d3abf39@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424135109.3524355-7-amorenoz@redhat.com>

Hi Adrian,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-netlink-export-genl-private-pointer-getters/20240424-215821
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240424135109.3524355-7-amorenoz%40redhat.com
patch subject: [PATCH net-next 6/8] net:openvswitch: add psample support
config: i386-randconfig-141-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300611.kJOZL2KI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404300611.kJOZL2KI-lkp@intel.com/

New smatch warnings:
net/openvswitch/actions.c:1097 sample() error: uninitialized symbol 'ret'.

vim +/ret +1097 net/openvswitch/actions.c

ccb1352e76cff0 Jesse Gross        2011-10-25  1061  static int sample(struct datapath *dp, struct sk_buff *skb,
ccea74457bbdaf Neil McKee         2015-05-26  1062  		  struct sw_flow_key *key, const struct nlattr *attr,
798c166173ffb5 andy zhou          2017-03-20  1063  		  bool last)
ccb1352e76cff0 Jesse Gross        2011-10-25  1064  {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1065  	const struct sample_arg *arg;
798c166173ffb5 andy zhou          2017-03-20  1066  	struct nlattr *sample_arg;
798c166173ffb5 andy zhou          2017-03-20  1067  	int rem = nla_len(attr);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1068  	struct nlattr *actions;
bef7f7567a104a andy zhou          2017-03-20  1069  	bool clone_flow_key;
ccc0b9e4657efd Adrian Moreno      2024-04-24  1070  	int ret;
ccb1352e76cff0 Jesse Gross        2011-10-25  1071  
798c166173ffb5 andy zhou          2017-03-20  1072  	/* The first action is always 'OVS_SAMPLE_ATTR_ARG'. */
798c166173ffb5 andy zhou          2017-03-20  1073  	sample_arg = nla_data(attr);
798c166173ffb5 andy zhou          2017-03-20  1074  	arg = nla_data(sample_arg);
798c166173ffb5 andy zhou          2017-03-20  1075  	actions = nla_next(sample_arg, &rem);
e05176a3283822 Wenyu Zhang        2015-08-05  1076  
798c166173ffb5 andy zhou          2017-03-20  1077  	if ((arg->probability != U32_MAX) &&
a251c17aa558d8 Jason A. Donenfeld 2022-10-05  1078  	    (!arg->probability || get_random_u32() > arg->probability)) {
798c166173ffb5 andy zhou          2017-03-20  1079  		if (last)
9d802da40b7c82 Adrian Moreno      2023-08-11  1080  			ovs_kfree_skb_reason(skb, OVS_DROP_LAST_ACTION);
ccb1352e76cff0 Jesse Gross        2011-10-25  1081  		return 0;
ccb1352e76cff0 Jesse Gross        2011-10-25  1082  	}
651887b0c22cff Simon Horman       2014-07-21  1083  
ccc0b9e4657efd Adrian Moreno      2024-04-24  1084  	if (arg->flags & OVS_SAMPLE_ARG_FLAG_PSAMPLE) {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1085  		ret = ovs_psample_packet(dp, key, arg, skb);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1086  		if (ret)
ccc0b9e4657efd Adrian Moreno      2024-04-24  1087  			return ret;
ccc0b9e4657efd Adrian Moreno      2024-04-24  1088  	}
ccc0b9e4657efd Adrian Moreno      2024-04-24  1089  
ccc0b9e4657efd Adrian Moreno      2024-04-24  1090  	if (nla_ok(actions, rem)) {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1091  		clone_flow_key = !(arg->flags & OVS_SAMPLE_ARG_FLAG_EXEC);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1092  		ret = clone_execute(dp, skb, key, 0, actions, rem, last,
bef7f7567a104a andy zhou          2017-03-20  1093  				    clone_flow_key);
ccc0b9e4657efd Adrian Moreno      2024-04-24  1094  	} else if (last) {
ccc0b9e4657efd Adrian Moreno      2024-04-24  1095  		ovs_kfree_skb_reason(skb, OVS_DROP_LAST_ACTION);

ret is uninitialized on this last path.

ccc0b9e4657efd Adrian Moreno      2024-04-24  1096  	}
ccc0b9e4657efd Adrian Moreno      2024-04-24 @1097  	return ret;
971427f353f3c4 Andy Zhou          2014-09-15  1098  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

