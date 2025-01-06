Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36271DB522
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159863; cv=none; b=L2+W5EGPpFYfUx0dVqXzpaGC7qvn59RnEkvxQu5wfY7qr/LAxboJgTWp4lI38I4kp+MW0zLJnanVJwGtYisbIxxUn9c4g+azjQ+3Bx+7e7Syh8mK8kxmzsrm4rYqqeSOYCLgXCn+TBu0xrOAF2LE/KScLLUBoYR9GtwJ9XYcoms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159863; c=relaxed/simple;
	bh=quRPf5+PfHdlHnEA5M8N5dGuP+LWwVuW1Fda+pYW0vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGvg6lPRyXHoRWDdtV49byY+C6HsDMQtDhcsRzrio9Pi2Bk8jZ4itCKn8pDc2RRunYiNPFMA+wuDjJxGL42FKUmB0LzXqFECj8Qq/2aRxYzc8AGmEeRnuHEj0u+1XMBWpN4v4Z91rJc6PoOBmRNYmtr9QSYzzJpExEqx7/gXkgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cf0PvqNi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cf0PvqNi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436345cc17bso102651745e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736159859; x=1736764659; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jw5iGf3snAWQVAPigHDpYqiFBGsnJPk5BPWBWM1emNU=;
        b=Cf0PvqNivqoJBAfHyVdiAXeeohWSzQqQhFD3L9dmP4+nSIEHRxcql+bsojck1RILnm
         qGJ56zEDf1B82N8Z0gUY2qde6zOb58/LhTE4wPmqI8iWgSkchSorNQm9FCzebYJ8zPz+
         0aVhI0nZjB637+NAGy2VlgR4OCCaDS1OTrjt0aq6SQ2uBvk3IMWJguWpEsgi9GWRSzf4
         +7bapVDp41VP4/ChpHVN06IsluCTNrwEBHT5rGhUnLDafZA+AOHNUE7QbceMowNVP3i1
         9IPU35obDX7Z+dGi+qCIw/32DycBoxGqRygbFObnjLh4HResBz7FyOcQpoxSo8Azz+lo
         9u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159859; x=1736764659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw5iGf3snAWQVAPigHDpYqiFBGsnJPk5BPWBWM1emNU=;
        b=HSgW5DbK3OIMXIGMCtL1652tg4tXkBX0Iyk1E1WC1OVOdL8SMyxQFD1bXthps3v7X3
         2fcagapBOI23MU/1pM1nGPBq/NeJKuMgK6TUiQmxh9AMLjta+JTFCUh6Puyd1jbETzRg
         mrFy0iyhkP323fNRSyT96B7b+WeUsEApBItZ//DuzPTQNDljTuC1u6PA4uqROjM+n1h6
         dqxB00nn2kf2vr/eSJrr/QbDwolgTORyaJ0HzM2E5sx753TJnG2m7twtBuMNEUGm4Pd9
         svsnop1p7psLIxXWwWpoN7cNcDlsJxgkq0yVdFAVn0MDO53m93a9XiuVUwPqUtBXl3W1
         qzcQ==
X-Gm-Message-State: AOJu0YxPCEO0QioMpS6lenu1L5TR34n3ZsSR7B+VW+mvgvfTs9Y1t0VH
	pa6mbu6AyQ/hSUaEt6oLjCtcdDTye3soeRhH16rnuzAQhiKdOxd0wmocc3WIQlnunb4JRVh/kd2
	y
X-Gm-Gg: ASbGncteA9a38G/WCWdDcXIZANkTyVH896vpt18xujo0p7sy7cu34NOKc7Jb+J3qK4m
	rsTlsT1qgSAKB+l2aB7HSFkJCKTiGVFpVF1dparJBrHrnvlGE/Ja0Fq3vRS7Q09HYLHWYZSx8es
	9GOowY1HTpYDlCI/EGar4/u+vFbqVXh/bM6dN3ouMkVTqCP9ioEOjURUrMii4iem4sh3YvzSxXu
	qOcWiVGO6bOZEwvX13A/I+MaluUvyQhuNTO0EosFOIbgGC85297724AqVl+DA==
X-Google-Smtp-Source: AGHT+IEePWXQ2gEoZC/gxUJ3HOXj7WQzEIrzqvnWBH0X6zcyQZd2MJ+n/a8TkfuQDGr42U2R1w+nPQ==
X-Received: by 2002:a7b:cd95:0:b0:436:30e4:4590 with SMTP id 5b1f17b1804b1-43668b7a1d0mr424647475e9.32.1736159858799;
        Mon, 06 Jan 2025 02:37:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm592162175e9.12.2025.01.06.02.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:37:38 -0800 (PST)
Date: Mon, 6 Jan 2025 13:37:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kishor408 <kishorx.buchi@intel.com>,
	Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>
Subject: [intel-lts:6.12/linux 1/1] net/core/rtnetlink.c:1593 rtnl_xdp_fill()
 warn: missing error code 'err'
Message-ID: <ee667823-e39c-4a62-b7ba-f85dad13da5e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   af28adffb0fe876a7f6b55f145e6cae4861209a9
commit: d422faba40f2b00b944ed5ffa9c365bf904c950b [1/1] rtnetlink: Fix unchecked return value of dev_xdp_query_md_btf()
config: i386-randconfig-141-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261741.KiMk9t5S-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412261741.KiMk9t5S-lkp@intel.com/

New smatch warnings:
net/core/rtnetlink.c:1593 rtnl_xdp_fill() warn: missing error code 'err'

vim +/err +1593 net/core/rtnetlink.c

d1fdd9138682e0 Brenden Blanco            2016-07-19  1554  static int rtnl_xdp_fill(struct sk_buff *skb, struct net_device *dev)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1555  {
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1556  	u32 prog_id, md_btf_id;
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1557  	u8 md_btf_enabled = 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1558  	struct nlattr *xdp;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1559  	int err;
4f91da26c81145 Jakub Kicinski            2018-07-11  1560  	u8 mode;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1561  
ae0be8de9a53cd Michal Kubecek            2019-04-26  1562  	xdp = nla_nest_start_noflag(skb, IFLA_XDP);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1563  	if (!xdp)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1564  		return -EMSGSIZE;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1565  
a25717d2b60434 Jakub Kicinski            2018-07-11  1566  	prog_id = 0;
a25717d2b60434 Jakub Kicinski            2018-07-11  1567  	mode = XDP_ATTACHED_NONE;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1568  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_SKB,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1569  				  IFLA_XDP_SKB_PROG_ID, rtnl_xdp_prog_skb);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1570  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1571  		goto err_cancel;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1572  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_DRV,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1573  				  IFLA_XDP_DRV_PROG_ID, rtnl_xdp_prog_drv);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1574  	if (err)
a25717d2b60434 Jakub Kicinski            2018-07-11  1575  		goto err_cancel;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1576  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_HW,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1577  				  IFLA_XDP_HW_PROG_ID, rtnl_xdp_prog_hw);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1578  	if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1579  		goto err_cancel;
4f91da26c81145 Jakub Kicinski            2018-07-11  1580  
a25717d2b60434 Jakub Kicinski            2018-07-11  1581  	err = nla_put_u8(skb, IFLA_XDP_ATTACHED, mode);
b5cdae3291f7be David S. Miller           2017-04-18  1582  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1583  		goto err_cancel;
d67b9cd28c1d7f Daniel Borkmann           2017-05-12  1584  
a25717d2b60434 Jakub Kicinski            2018-07-11  1585  	if (prog_id && mode != XDP_ATTACHED_MULTI) {
58038695e62b44 Martin KaFai Lau          2017-06-15  1586  		err = nla_put_u32(skb, IFLA_XDP_PROG_ID, prog_id);
58038695e62b44 Martin KaFai Lau          2017-06-15  1587  		if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1588  			goto err_cancel;
58038695e62b44 Martin KaFai Lau          2017-06-15  1589  	}
58038695e62b44 Martin KaFai Lau          2017-06-15  1590  
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1591  	md_btf_id = dev_xdp_query_md_btf(dev, &md_btf_enabled);
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30  1592  	if (!md_btf_id)
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30 @1593  		goto err_cancel;

Set err on this path?

d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30  1594  
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1595  	nla_put_u32(skb, IFLA_XDP_MD_BTF_ID, md_btf_id);
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1596  	nla_put_u8(skb, IFLA_XDP_MD_BTF_STATE, md_btf_enabled);
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1597  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1598  	nla_nest_end(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1599  	return 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1600  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1601  err_cancel:
d1fdd9138682e0 Brenden Blanco            2016-07-19  1602  	nla_nest_cancel(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1603  	return err;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1604  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

