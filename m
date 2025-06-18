Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526DF2ED174
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267620; cv=none; b=IBkxmlTzGT69k/S0LdCFudM4AS0w6VS4CkcREIfHIaOUuW4F+sbyEpVmtWSoO8FiN2lYKYkQq7L/fi+u0hd+uqzHxuIiQd9Px1A7AxMnRCj5yAAMrsyX51cy7zoxt+Y0R5m72TrcembOxHzhsrUZQg3oetXv/NCX3/Hz5JW+GEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267620; c=relaxed/simple;
	bh=J+BqwMFmKcN19hQQ3aT9eKAwy1PnKrQMbSUnQLnRrRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=saaTADJb442+TKJToANRG5td+LaP0kw61xwGkIInHGCpaqkQsS2yOYN81DecKc56YuV009k4i13rmG1Q3tnkHok6P9HKntW/nMmERY2vMhhHi2R7x8Kaat8ZNEL/bm/oNDdcS5sYx5+gNO7yHGI+xr85rOuVKTIXQE6zUH/0UU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ocl897MR; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ocl897MR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-735a6faec9eso4276107a34.3
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750267618; x=1750872418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6p/EuXGOB6YYcPGLEVBf9Y7M5MlRj/BCkj3EsNFJrV8=;
        b=Ocl897MRUpzE66RW0f6kBVunC9BZp1b6npRC/srGbXtJTBjdHyPwyFlZn4+qo/2qoe
         HqKQq5Ghuhzl002rAQ6PtiNOaaMX/uoKgPXhZUxSWmoO79TOYghl73OBCyg2KRfQFi2E
         mxbB3FZe2YjvvAfXNCYBYLPXPf6rJPVRRHsPBzSnOnlQYN9XJH34c3AeuxPyDHOx4VjW
         J7iz1GQuFSI3lMsvuqU6T+qiAc+RYZ4m9btU3kD4BRf7E5SlOe1fLWhBTfOoOq/CP4b/
         eHk3GQFVfVbYmOmezVRUjwNyuzgBzXPlxg8lfDUSSoXTbRHQytkoZ9dnL3irO7c+4um2
         5/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267618; x=1750872418;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6p/EuXGOB6YYcPGLEVBf9Y7M5MlRj/BCkj3EsNFJrV8=;
        b=huBwTUO7H+kcovU+aUPrjbzYI265KoNKVLInECpaAGMZtkVWFXk2pJ1yBEdgz9GqOA
         5YfctzXBoFXfrazRxzDGGin/9L0Plmv3cSERuXJ8WblL0aKlcpvL053EWis9df/Hqnqg
         elnBvJ/+gaBTooQZ3cYsazr3LiEjUkC22deZKCqhc3lkT2nFXOkOHP31HCa+9OzIiPJ0
         uD6Mi9g9EWFlT4+wMANMwJaA+yamL47syWIe3ZzEb/aStNaG7R0mHfi97ljn64DIa+pq
         uNJ6ekfk+gL+dh0PGgRNIBnRKsQCCY2fiTEN++Ig8WdJ8Ifg5M2iJg8Aiw9R6D1/twKW
         Xhgw==
X-Gm-Message-State: AOJu0YwbA5kOfDDX25SBmJDZ0sLyZmFMzTBrFA65ZuEdYoAHdZ4ixfLc
	GdGbZEdQKDwh9e/7hTO2mgCLQiJV+um5q7lzJYAffzCRJCKktJ4J91ssE82MpL6hw+gLMsZUcdg
	GeUCe
X-Gm-Gg: ASbGncslKVtuAJOTjkEUKB9cK28IJvj4ZwLtK+yFCj9JDNEYDGuE5/QxSq5MY2K3zoN
	FezSZRo3zwLA1HM2LTZSxwZ27GM3eHHMTdgFqau4xNEmhGn5V21Mj6KCIyZxdSL785ouIwIhSHx
	LGAOuYYtZStgeazMQH/HtUxi/VH2KsRmvrBz0+Q3KyTas1d6Dnno7Gam16FOrRYb62mEaWiHDAf
	iMjhyxgjubfOV7Kcasw2twRrSiDLkRXM3u8jPAQBP9a05HxxifAXY1XX4YY8NVHMIYSuTbidTBg
	+wZH591OXQ1LgOhRi2RMwcJe864UVCSrtx/7LX1uzAXuu/IB6pqH2wQE9J0a2EFxe2F57Q==
X-Google-Smtp-Source: AGHT+IFP0GuBKlRwXw2OJNEzq9cywJo2wUE5iUpl+qcRNZHJ6Edt+/XzOGWu0ECCFUNYcg28rXeKvA==
X-Received: by 2002:a05:6830:6219:b0:735:b4ef:acaf with SMTP id 46e09a7af769-73a36405b46mr12502515a34.27.1750267618055;
        Wed, 18 Jun 2025 10:26:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284039bdsm2037108a34.22.2025.06.18.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:26:57 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:26:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 12/13] net: mctp: add gateway routing support
Message-ID: <c336c490-e002-48a8-bda7-b095ebde4c33@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-dev-forwarding-v1-12-6b69b1feb37f@codeconstruct.com.au>

Hi Jeremy,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-mctp-don-t-use-source-cb-data-when-forwarding-ensure-pkt_type-is-set/20250611-143319
base:   0097c4195b1d0ca57d15979626c769c74747b5a0
patch link:    https://lore.kernel.org/r/20250611-dev-forwarding-v1-12-6b69b1feb37f%40codeconstruct.com.au
patch subject: [PATCH net-next 12/13] net: mctp: add gateway routing support
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131515.a5tCsTj0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506131515.a5tCsTj0-lkp@intel.com/

New smatch warnings:
net/mctp/route.c:1381 mctp_route_nlparse_common() error: uninitialized symbol 'gateway'.

vim +/gateway +1381 net/mctp/route.c

33d33bef994e518 Jeremy Kerr   2025-06-11  1350  static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1351  				     struct netlink_ext_ack *extack,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1352  				     struct nlattr **tb, struct rtmsg **rtm,
33d33bef994e518 Jeremy Kerr   2025-06-11  1353  				     struct mctp_dev **mdev,
75626016e50cb9a Jeremy Kerr   2025-06-11  1354  				     struct mctp_fq_addr *gatewayp,
33d33bef994e518 Jeremy Kerr   2025-06-11  1355  				     mctp_eid_t *daddr_start)
06d2f4c583a7d89 Matt Johnston 2021-07-29  1356  {
75626016e50cb9a Jeremy Kerr   2025-06-11  1357  	struct mctp_fq_addr *gateway;
75626016e50cb9a Jeremy Kerr   2025-06-11  1358  	unsigned int ifindex = 0;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1359  	struct net_device *dev;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1360  	int rc;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1361  
06d2f4c583a7d89 Matt Johnston 2021-07-29  1362  	rc = nlmsg_parse(nlh, sizeof(struct rtmsg), tb, RTA_MAX,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1363  			 rta_mctp_policy, extack);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1364  	if (rc < 0) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1365  		NL_SET_ERR_MSG(extack, "incorrect format");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1366  		return rc;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1367  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1368  
06d2f4c583a7d89 Matt Johnston 2021-07-29  1369  	if (!tb[RTA_DST]) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1370  		NL_SET_ERR_MSG(extack, "dst EID missing");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1371  		return -EINVAL;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1372  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1373  	*daddr_start = nla_get_u8(tb[RTA_DST]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1374  
75626016e50cb9a Jeremy Kerr   2025-06-11  1375  	if (tb[RTA_OIF])
06d2f4c583a7d89 Matt Johnston 2021-07-29  1376  		ifindex = nla_get_u32(tb[RTA_OIF]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1377  
75626016e50cb9a Jeremy Kerr   2025-06-11  1378  	if (tb[RTA_GATEWAY])
75626016e50cb9a Jeremy Kerr   2025-06-11  1379  		gateway = nla_data(tb[RTA_GATEWAY]);

Unitialized on else path

06d2f4c583a7d89 Matt Johnston 2021-07-29  1380  
75626016e50cb9a Jeremy Kerr   2025-06-11 @1381  	if (ifindex && gateway) {
                                                                       ^^^^^^^
warning.

75626016e50cb9a Jeremy Kerr   2025-06-11  1382  		NL_SET_ERR_MSG(extack,
75626016e50cb9a Jeremy Kerr   2025-06-11  1383  			       "cannot specify both ifindex and gateway");
33d33bef994e518 Jeremy Kerr   2025-06-11  1384  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

