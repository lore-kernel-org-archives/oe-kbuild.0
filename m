Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFC1A239D
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267530; cv=none; b=pQFeaJXzgFIFeaQMNw5qSH7v7VbkegjnWA/5b6W8rSNLHSUeIk+wfGyTc2xo72A9Rd3kXPG87+xaoOyKHwq9dWeNswLA8ORzDKEcyZVES6tjqLQ0vRWb2viTY9SvYIbUHwvQ6mPxEDXACJiVI9ajZt3oQxOSLckZVPx9SJ3+t8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267530; c=relaxed/simple;
	bh=axKNYLsl1out5QrHkYrqbGO2mEFv9KOnDlDmAhSIMqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dsvHLzkxIbJwyzFGdHlDy829XA7uNyS0F5O4MP6N0cR6UcK2p4SqEVp5MYxRgDI2wjIqgaxf8Um2aAaOyLbAZqCSNT1o2aNFtyBJSmlFl796gEgVUVP6zSsX8eym+PFD8NrjOkCFuFYQWK7wh+GwKW4vXLT+SH5Y8j6Z6iVDWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgHg+Plk; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgHg+Plk"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c172f1de1so4906870a34.3
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750267527; x=1750872327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5sgbKRide1If+01uUXeaw5TP7U7gEnnmOJxzckoU6MQ=;
        b=zgHg+PlkIKZneFGQK/11gFUL47C6JRg1io2nEzFsdKjZuCdC36oCg9HqkeDrITjpJ0
         6RaEOLE/Rc3m+Uct/fTp9cUbhci9MCHlRMEGPX5FgquPw4YPSVFBEQd2PAUX7liAvA8e
         7DPWImE8khlJjfopphyOhpymgqRctuBM4GaoIybr57/Mp3bpuwYSH+BROPDcPbsutlNK
         2UDIt3LBmfdCRfiOSuzL1oUs/i891giX4NycrJ0QzEZ2lq6ctVe8CLlcWbwkXRJxk7Tz
         c8bgZ7OQ/Nl0g2mfD3YovApgQ76ry3FV5OzjYMPFtL6QswZ52lfjQgzToaTRnzdR4toU
         4tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267527; x=1750872327;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sgbKRide1If+01uUXeaw5TP7U7gEnnmOJxzckoU6MQ=;
        b=uU70KS3jzIbw+Edj2wkMC65IdicvbbIM8QA/WosNZZ3AvQBsSWH4glDam4m58dxVbH
         mfLxKT9J422Tn6imEm+3AkQUdV/2ytbI5H/oF6kih7bRbxkBh2jRGX6yunn12a7DlAVY
         Ar9J6905vIorH56iX0uzzBNcKRJIOoLJoDGKX/PeCN1cJyb9a0PBzdwL300qIexLXARj
         miK8bDtw3rm7eEZ0N1hkHYLIRtEDDXnmi4cDBFTYMxjqHZiYprwMtQBG80QTbDX+TNal
         jwa4H/uj9LHrnyiKqXsYUT671HIEILNVg4ASBbDYQGog87jjta5dPiUfc6U8zozN4s/9
         xKfA==
X-Gm-Message-State: AOJu0Yysf8ww7mszDBByev9w1KCFvjUP2Cugm8YMTTEX1kAgRM8OUe1A
	h0yKJNNyt/BzJlE0CuM1yGwO5ooZ4zs7zoCfXUuvzO92YMo/I8u00gUDpteCV5Eenu6cpAxQyr3
	CFrRR
X-Gm-Gg: ASbGnctyEsmsO32KrPLVht/MFsnOi83v4cRIz8xcs/lz7tcIU2zKsCAfZXLXbSNcdys
	GfznMCxTLdJDMF2D/wyC2EC0QRLWDdIkNMeB+MxQs/qpz7fkKlxIKLY+eG5H7dJybG2V7Pnf4EI
	KtWkRligzG9b5C0jo6115NDjSlIKMJy/1ILu6Z0snrHqRZsEJBGGj76kwuZtgCHCQyAyzuaZV78
	9gspNxiEhvwDYjY7izML8rTB2tZZL2JRNcvILsJoBCUc4IBtQD6gK2gy3ZBSLdVjVD+lSSQ69bN
	3f6JzUxQPEEvlhHqYF2jA2z2PMxAzgWGqiQLtsHeNyX+VLa8uPvtGv0+5/qTYXr6vzgYxA==
X-Google-Smtp-Source: AGHT+IH+lVIT10b5Lcev6GUFpaEiWSOXt6pthwMeDSuc6MV5UownHP+w/AxUQWcW8JQdU4zzD63MpQ==
X-Received: by 2002:a05:6830:280e:b0:72b:a06b:dd71 with SMTP id 46e09a7af769-73a3625bc4dmr12790506a34.5.1750267526644;
        Wed, 18 Jun 2025 10:25:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a283dc154sm2023390a34.14.2025.06.18.10.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:25:26 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:25:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 4/9] net: ethtool: add dedicated callbacks for
 getting and setting rxfh fields
Message-ID: <b6f46ab5-ea6e-4e4b-a308-0bd18f2777a7@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611145949.2674086-5-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-ethtool-copy-the-rxfh-flow-handling/20250611-231716
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250611145949.2674086-5-kuba%40kernel.org
patch subject: [PATCH net-next 4/9] net: ethtool: add dedicated callbacks for getting and setting rxfh fields
config: i386-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131104.4D5TmGvi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506131104.4D5TmGvi-lkp@intel.com/

smatch warnings:
net/ethtool/ioctl.c:1592 ethtool_set_rxfh() error: we previously assumed 'ops->get_rxnfc' could be null (see line 1530)

vim +1592 net/ethtool/ioctl.c

3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1513  static noinline_for_stack int ethtool_set_rxfh(struct net_device *dev,
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1514  					       void __user *useraddr)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1515  {
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1516  	u32 rss_cfg_offset = offsetof(struct ethtool_rxfh, rss_config[0]);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1517  	const struct ethtool_ops *ops = dev->ethtool_ops;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1518  	u32 dev_indir_size = 0, dev_key_size = 0, i;
7195f0ef7f5b8c6 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1519  	u32 user_indir_len = 0, indir_bytes = 0;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1520  	struct ethtool_rxfh_param rxfh_dev = {};
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1521  	struct ethtool_rxfh_context *ctx = NULL;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1522  	struct netlink_ext_ack *extack = NULL;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1523  	struct ethtool_rxnfc rx_rings;
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1524  	struct ethtool_rxfh rxfh;
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1525  	bool locked = false; /* dev->ethtool->rss_lock taken */
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1526  	bool create = false;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1527  	u8 *rss_config;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1528  	int ret;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1529  
65107e14ebb8971 net/ethtool/ioctl.c Jakub Kicinski  2025-06-11 @1530  	if ((!ops->get_rxnfc && !ops->get_rxfh_fields) || !ops->set_rxfh)
                                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Imagine ops->get_rxnfc is NULL but ops->get_rxfh_fields is not
and also ops->set_rxfh is not.  Seems unlikely...

3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1531  		return -EOPNOTSUPP;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1532  
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1533  	if (ops->get_rxfh_indir_size)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1534  		dev_indir_size = ops->get_rxfh_indir_size(dev);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1535  	if (ops->get_rxfh_key_size)
d340c862e760815 net/core/ethtool.c  Dan Carpenter   2015-02-20  1536  		dev_key_size = ops->get_rxfh_key_size(dev);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1537  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1538  	if (copy_from_user(&rxfh, useraddr, sizeof(rxfh)))
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1539  		return -EFAULT;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1540  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1541  	/* Check that reserved fields are 0 for now */
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1542  	if (rxfh.rsvd8[0] || rxfh.rsvd8[1] || rxfh.rsvd32)
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1543  		return -EINVAL;
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1544  	/* Most drivers don't handle rss_context, check it's 0 as well */
ce056504e2e53b2 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1545  	if (rxfh.rss_context && !(ops->cap_rss_ctx_supported ||
ce056504e2e53b2 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1546  				  ops->create_rxfh_context))
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1547  		return -EOPNOTSUPP;
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1548  	/* Check input data transformation capabilities */
948f97f9d8d2aa3 net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1549  	if (rxfh.input_xfrm && rxfh.input_xfrm != RXH_XFRM_SYM_XOR &&
ecdff893384cf16 net/ethtool/ioctl.c Gal Pressman    2025-02-24  1550  	    rxfh.input_xfrm != RXH_XFRM_SYM_OR_XOR &&
948f97f9d8d2aa3 net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1551  	    rxfh.input_xfrm != RXH_XFRM_NO_CHANGE)
948f97f9d8d2aa3 net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1552  		return -EINVAL;
503757c809281a2 net/ethtool/ioctl.c Saeed Mahameed  2024-07-10  1553  	if (rxfh.input_xfrm != RXH_XFRM_NO_CHANGE &&
ecdff893384cf16 net/ethtool/ioctl.c Gal Pressman    2025-02-24  1554  	    rxfh.input_xfrm & ~ops->supported_input_xfrm)
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1555  		return -EOPNOTSUPP;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1556  	create = rxfh.rss_context == ETH_RXFH_CONTEXT_ALLOC;
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1557  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1558  	if ((rxfh.indir_size &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1559  	     rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1560  	     rxfh.indir_size != dev_indir_size) ||
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1561  	    (rxfh.key_size && rxfh.key_size != dev_key_size))
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1562  		return -EINVAL;
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1563  
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1564  	/* Must request at least one change: indir size, hash key, function
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1565  	 * or input transformation.
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1566  	 * There's no need for any of it in case of context creation.
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1567  	 */
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1568  	if (!create &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1569  	    (rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE &&
0dd415d155050f5 net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1570  	     rxfh.key_size == 0 && rxfh.hfunc == ETH_RSS_HASH_NO_CHANGE &&
0dd415d155050f5 net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1571  	     rxfh.input_xfrm == RXH_XFRM_NO_CHANGE))
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1572  		return -EINVAL;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1573  
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1574  	ret = ethtool_check_flow_types(dev, rxfh.input_xfrm);
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1575  	if (ret)
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1576  		return ret;
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1577  
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1578  	indir_bytes = dev_indir_size * sizeof(rxfh_dev.indir[0]);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1579  
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1580  	/* Check settings which may be global rather than per RSS-context */
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1581  	if (rxfh.rss_context && !ops->rxfh_per_ctx_key)
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1582  		if (rxfh.key_size ||
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1583  		    (rxfh.hfunc && rxfh.hfunc != ETH_RSS_HASH_NO_CHANGE) ||
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1584  		    (rxfh.input_xfrm && rxfh.input_xfrm != RXH_XFRM_NO_CHANGE))
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1585  			return -EOPNOTSUPP;
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1586  
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1587  	rss_config = kzalloc(indir_bytes + dev_key_size, GFP_USER);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1588  	if (!rss_config)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1589  		return -ENOMEM;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1590  
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1591  	rx_rings.cmd = ETHTOOL_GRXRINGS;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21 @1592  	ret = ops->get_rxnfc(dev, &rx_rings, NULL);

Then this would be a NULL dereference.  There is no way we succeed
when ops->get_rxnfc is NULL.

3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1593  	if (ret)
7850f63f1620512 net/core/ethtool.c  Ben Hutchings   2011-12-15  1594  		goto out;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1595  
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1596  	/* rxfh.indir_size == 0 means reset the indir table to default (master
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1597  	 * context) or delete the context (other RSS contexts).

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

