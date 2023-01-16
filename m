Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D241852;
	Mon, 16 Jan 2023 09:04:10 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k8so12266320wrc.9;
        Mon, 16 Jan 2023 01:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wv8k8EuVFunz1/XjttdFyAnIrtF9oXGipLVqOLoy8EE=;
        b=PclT6y2kSF+9XfRSXQzG5xUdOghWFa1Gw1b8fYSOhdreguJXrh4qo4WZLNdgYh4CX7
         t68PbL8b46lZ2weCqBii5Imf2SmFNuKtpgAEdu0G/zFOWkwTwM1P1hia1q9yzbN/JBPJ
         r/LWPrBojIsyz3nXfIcW03Ni12a8X3NH8URzRoKzk3vYH7cNlgvI9N1iJ4zKOJlrcg9e
         ZHU4fjHbpUFrpcb8u1GEBRKtEN7e/Tca4CF7PUFs3ZNwXMpPNUNhewzFPG0c48TBz8yX
         GTlheODSTxHQ0ZpD06IVdEoRahNuSy5VomvqSf3FX2QYRj50A2Z7v0feV1K6LGh+BcEO
         uVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv8k8EuVFunz1/XjttdFyAnIrtF9oXGipLVqOLoy8EE=;
        b=HpfVMJOJsTsf1tTgGfwO/H4rJwHERfyzaOYBOJRWHk1//DBBm7OZeTuhtM8gg2vVqi
         vW+oeSslg/LP5qMxD8ondgUybosFO9fLyyQLrGLBsg0cbk6hDum/PoopNnj6wS7kDYgU
         7jMyq+HYqxL/Kx6poGNUk9MvB4WHfImxkLHjML+jLbfjU8+wzOtrx93QVpBnKcFUstdh
         XkLzqos1nVyWh5NjEfXj8kTzpmVbKNp5FqZNWeMEuFBp6WzNhfjzUPf4A2F7YpxKGcDd
         SzPKOY3QfhG0EU9UBwhx9q1pk8+PrBABEhdwisNawMi9gZLAyBmjKKVRMVIdDcpw2SFS
         0JaQ==
X-Gm-Message-State: AFqh2kounS0Kiv68lVwybYualcnfEvHMmH28p8euj5G9aaK3GMclUJjI
	p3aSiZwoDnoZB9Obr7zixA9o5NsfjOU=
X-Google-Smtp-Source: AMrXdXsFGXMMHRUC0M/DijIFFfetsaCAiWj8jJXEeoq8278V+Gu6c72O7AJqYkyZkPpuUj30e75PMA==
X-Received: by 2002:a5d:5484:0:b0:2b6:320e:45a5 with SMTP id h4-20020a5d5484000000b002b6320e45a5mr7181823wrv.29.1673859848532;
        Mon, 16 Jan 2023 01:04:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d6747000000b002b57bae7174sm25982484wrw.5.2023.01.16.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:04:08 -0800 (PST)
Date: Mon, 16 Jan 2023 12:04:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 bpf-next 1/7] netdev-genl: create a simple family for
 netdev stuff
Message-ID: <202301150819.NtqkP31A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <595c703c45c021fa943762829e71db775a16a3cb.1673710867.git.lorenzo@kernel.org>
Message-ID: <20230116090405.WktYmZhk65NF2b1bM_ve-SboAogpdJEabSXAWnJsrdA@z>

Hi Lorenzo,

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/netdev-genl-create-a-simple-family-for-netdev-stuff/20230114-235603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/595c703c45c021fa943762829e71db775a16a3cb.1673710867.git.lorenzo%40kernel.org
patch subject: [RFC v2 bpf-next 1/7] netdev-genl: create a simple family for netdev stuff
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/core/netdev-genl.c:32 netdev_nl_dev_fill() error: uninitialized symbol 'err'.

vim +/err +32 net/core/netdev-genl.c

653b9134fa5a21 Jakub Kicinski 2023-01-14   11  static int
653b9134fa5a21 Jakub Kicinski 2023-01-14   12  netdev_nl_dev_fill(struct net_device *netdev, struct sk_buff *rsp,
653b9134fa5a21 Jakub Kicinski 2023-01-14   13  		   u32 portid, u32 seq, int flags, u32 cmd)
653b9134fa5a21 Jakub Kicinski 2023-01-14   14  {
653b9134fa5a21 Jakub Kicinski 2023-01-14   15  	void *hdr;
653b9134fa5a21 Jakub Kicinski 2023-01-14   16  	int err;
653b9134fa5a21 Jakub Kicinski 2023-01-14   17  
653b9134fa5a21 Jakub Kicinski 2023-01-14   18  	hdr = genlmsg_put(rsp, portid, seq, &netdev_nl_family, flags, cmd);
653b9134fa5a21 Jakub Kicinski 2023-01-14   19  	if (!hdr)
653b9134fa5a21 Jakub Kicinski 2023-01-14   20  		return -EMSGSIZE;
653b9134fa5a21 Jakub Kicinski 2023-01-14   21  
653b9134fa5a21 Jakub Kicinski 2023-01-14   22  	if (nla_put_u32(rsp, NETDEV_A_DEV_IFINDEX, netdev->ifindex) ||
653b9134fa5a21 Jakub Kicinski 2023-01-14   23  	    nla_put_u64_64bit(rsp, NETDEV_A_DEV_XDP_FEATURES,
653b9134fa5a21 Jakub Kicinski 2023-01-14   24  			      netdev->xdp_features, NETDEV_A_DEV_PAD))
653b9134fa5a21 Jakub Kicinski 2023-01-14   25  		goto err_cancel_msg;

err = -ESOMETHING;

653b9134fa5a21 Jakub Kicinski 2023-01-14   26  
653b9134fa5a21 Jakub Kicinski 2023-01-14   27  	genlmsg_end(rsp, hdr);
653b9134fa5a21 Jakub Kicinski 2023-01-14   28  	return 0;
653b9134fa5a21 Jakub Kicinski 2023-01-14   29  
653b9134fa5a21 Jakub Kicinski 2023-01-14   30  err_cancel_msg:
653b9134fa5a21 Jakub Kicinski 2023-01-14   31  	genlmsg_cancel(rsp, hdr);
653b9134fa5a21 Jakub Kicinski 2023-01-14  @32  	return err;
653b9134fa5a21 Jakub Kicinski 2023-01-14   33  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

