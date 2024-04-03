Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07EF5D467
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Apr 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712131157; cv=none; b=OpQ9Czq+7NeoaHc2R+1GLrnliAL6gmDELhi3/6uq0kg1gjjx9LjDWHVs0VvmrvtBGs0zEBFwZlbtPwiTAoMCNGEr4wuVTdAehYq0yjR2xGDaW2DhPvYdn4Fkw05DCekTH0qIvuuead8vTsWlyKQAakAijQocTDYnVku9PdnHkP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712131157; c=relaxed/simple;
	bh=zLpcfnoJ57ffYoYr0Y6VJ1PdooE3VcsH58nQRkSl5X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kWWi9y2lbTIAyJtxIw97Nz5cn7etqiGNCINVBt52vmU+HEt2m4Ej+jeqCuF8Ip7FMSq6pka/ohmbX06mM0/Pq+I06QR5XMx0HeDJdbJxejdE4FR/GBJXdG3ITNyZRjfjHflgVaBGYtuH3ryoodblMWhvlQUz0oYLJOySLRBB078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZFDQf6s; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZFDQf6s"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so1099016a12.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Apr 2024 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712131153; x=1712735953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+T8rqtYisNGZqbCq9ZjZi6CQUcb0/miQUSpXbs+uwYc=;
        b=AZFDQf6srSKTjBnC4Y5S+Wv2ci6V6+qn8PL02npbCYwR2zm8bcQ5Bg/3CqsRfegTm3
         1BEJ0oZLmr2hc6qS935DzdeV12glaC9eAaL3zBB/Y5OA6TKBvTram9sDBompu419nme0
         y62kOnYMAK/kDJVZFDqGXf0WYPFQ4Pfz2XWCu1Zar+G21qgwtXVyAcncrQtQBVlpHy3n
         pjn8mrQ92RqruaKxrx1ZgKbAMuBzCIzchkqMcz9aAFbiaStPh+gPEDFX0TeR991NfDbe
         dUfbrRWRH4IuHh9NimBhuGbV/BQnfDvJzTbefa6lEdHzkk+Lqh1iTb5xTLbm0D6lkTLu
         yqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131153; x=1712735953;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+T8rqtYisNGZqbCq9ZjZi6CQUcb0/miQUSpXbs+uwYc=;
        b=Np4Z03ZMdevsqGL9SO4xVobuZymxAKDuU6tXK8qWQuwWFKYS4tlxOLNjEpCqyVlgbn
         q+splaLdCD0a1U1ygAYnWTMr69S9GUd/Lve7LsHIdDHY/8WAFXpog7AKhPy/ebcXgAGr
         YMOCMUw7LZGP0JGpK2NxQtCy9ZnR3/MkjddM9h2oJCfzsyQGYZ2l0zgqOBZW0+RQk1NO
         Ni6fW5lOj7hO147R8plcxoCIRG5QY+xDJkpINXKHL7vk/TmtAAoieuRun5K/3MP7Mu24
         099DUnLM/hfzKYbYDVa2w80KtrAx9EoXv1ZBFBt0Yj6QblHiYQXueFp5hTk+lcqlwMxL
         FP4A==
X-Gm-Message-State: AOJu0YyC6sC7EhKxWRi9YeA+Xg4QK5SVrCAEqgpqP1eOayVMseqGr1LG
	k9V4HipktLzamXOgkoP0ndcCAdY+bBhm8+hhLezWOzaE0lKekc5j1VmdGtOxJ1n9NjKJmwXY3ye
	X
X-Google-Smtp-Source: AGHT+IFVNKJwf362TZXZQp4WEq/M8FFIkEXworELdBmfJ9zgXCTs2B2ZG1fMBS77cxj/kw2gxvUqBA==
X-Received: by 2002:a17:906:230d:b0:a4e:9e7d:6588 with SMTP id l13-20020a170906230d00b00a4e9e7d6588mr1156859eja.27.1712131152913;
        Wed, 03 Apr 2024 00:59:12 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906714300b00a4650ec48d0sm7581015ejj.140.2024.04.03.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:59:12 -0700 (PDT)
Date: Wed, 3 Apr 2024 10:59:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pawel Dembicki <paweldembicki@gmail.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	Simon Horman <horms@kernel.org>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com, Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v7 07/16] net: dsa: vsc73xx: Add vlan filtering
Message-ID: <9f34498c-f56e-4e16-b0c2-2ad2ae494b40@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325204344.2298241-8-paweldembicki@gmail.com>

Hi Pawel,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Dembicki/net-dsa-vsc73xx-use-read_poll_timeout-instead-delay-loop/20240326-053458
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240325204344.2298241-8-paweldembicki%40gmail.com
patch subject: [PATCH net-next v7 07/16] net: dsa: vsc73xx: Add vlan filtering
config: i386-randconfig-141-20240402 (https://download.01.org/0day-ci/archive/20240403/202404030102.Tv5bGJdv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404030102.Tv5bGJdv-lkp@intel.com/

smatch warnings:
drivers/net/dsa/vitesse-vsc73xx-core.c:1455 vsc73xx_port_vlan_add() error: uninitialized symbol 'ret'.

vim +/ret +1455 drivers/net/dsa/vitesse-vsc73xx-core.c

cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1381  static int vsc73xx_port_vlan_add(struct dsa_switch *ds, int port,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1382  				 const struct switchdev_obj_port_vlan *vlan,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1383  				 struct netlink_ext_ack *extack)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1384  {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1385  	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1386  	bool pvid = vlan->flags & BRIDGE_VLAN_INFO_PVID;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1387  	struct dsa_port *dp = dsa_to_port(ds, port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1388  	enum vsc73xx_port_vlan_conf port_vlan_conf;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1389  	struct vsc73xx_bridge_vlan *vsc73xx_vlan;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1390  	struct vsc73xx_vlan_summary summary;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1391  	struct vsc73xx *vsc = ds->priv;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1392  	bool operate_on_storage;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1393  	int ret;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1394  	u16 vid;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1395  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1396  	/* Be sure to deny alterations to the configuration done by tag_8021q.
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1397  	 */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1398  	if (vid_is_dsa_8021q(vlan->vid)) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1399  		NL_SET_ERR_MSG_MOD(extack,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1400  				   "Range 3072-4095 reserved for dsa_8021q operation");
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1401  		return -EBUSY;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1402  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1403  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1404  	/* The processed vlan->vid is excluded from the search because the VLAN
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1405  	 * can be re-added with a different set of flags, so it's easiest to
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1406  	 * ignore its old flags from the VLAN database software copy.
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1407  	 */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1408  	vsc73xx_bridge_vlan_summary(vsc, port, &summary, vlan->vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1409  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1410  	/* VSC73XX allow only three untagged states: none, one or all */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1411  	if ((untagged && summary.num_tagged > 0 && summary.num_untagged > 0) ||
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1412  	    (!untagged && summary.num_untagged > 1)) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1413  		NL_SET_ERR_MSG_MOD(extack,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1414  				   "Port can have only none, one or all untagged vlan");
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1415  		return -EBUSY;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1416  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1417  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1418  	vsc73xx_vlan = vsc73xx_bridge_vlan_find(vsc, vlan->vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1419  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1420  	if (!vsc73xx_vlan) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1421  		vsc73xx_vlan = kzalloc(sizeof(*vsc73xx_vlan), GFP_KERNEL);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1422  		if (!vsc73xx_vlan)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1423  			return -ENOMEM;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1424  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1425  		vsc73xx_vlan->vid = vlan->vid;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1426  		vsc73xx_vlan->portmask = 0;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1427  		vsc73xx_vlan->untagged = 0;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1428  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1429  		INIT_LIST_HEAD(&vsc73xx_vlan->list);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1430  		list_add_tail(&vsc73xx_vlan->list, &vsc->vlans);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1431  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1432  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1433  	vsc73xx_vlan->portmask |= BIT(port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1434  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1435  	if (untagged)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1436  		vsc73xx_vlan->untagged |= BIT(port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1437  	else
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1438  		vsc73xx_vlan->untagged &= ~BIT(port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1439  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1440  	/* CPU port must be always tagged because port separation is based on
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1441  	 * tag_8021q.
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1442  	 */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1443  	if (port == CPU_PORT)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1444  		goto update_vlan_table;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1445  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1446  	operate_on_storage = vsc73xx_tag_8021q_active(dp);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1447  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1448  	if (pvid)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1449  		ret = vsc73xx_vlan_set_pvid(vsc, port, vlan->vid,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1450  					    operate_on_storage, false);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1451  	else if (vsc73xx_port_get_pvid(vsc, port, &vid, false) &&
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1452  		 vid == vlan->vid)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1453  		ret = vsc73xx_vlan_clear_pvid(vsc, port, operate_on_storage,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1454  					      false);

"ret" not initialized on else path

cb0eaf3f8563b0 Pawel Dembicki 2024-03-25 @1455  	if (ret)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1456  		goto err;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1457  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1458  	if (operate_on_storage)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1459  		goto update_vlan_table;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1460  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1461  	port_vlan_conf = VSC73XX_VLAN_FILTER;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1462  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1463  	if (summary.num_tagged == 0 && untagged)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1464  		port_vlan_conf = VSC73XX_VLAN_FILTER_UNTAG_ALL;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1465  	vsc73xx_set_vlan_conf(vsc, port, port_vlan_conf);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1466  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1467  	if (port_vlan_conf == VSC73XX_VLAN_FILTER_UNTAG_ALL)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1468  		goto update_vlan_table;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1469  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1470  	if (untagged) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1471  		ret = vsc73xx_vlan_set_untagged_hw(vsc, port, vlan->vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1472  	} else if (summary.num_untagged == 1) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1473  		vid = vsc73xx_find_first_vlan_untagged(vsc, port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1474  		ret = vsc73xx_vlan_set_untagged_hw(vsc, port, vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1475  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1476  	if (ret)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1477  		goto err;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1478  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1479  update_vlan_table:
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1480  	ret = vsc73xx_update_vlan_table(vsc, port, vlan->vid, true);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1481  	if (!ret)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1482  		return 0;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1483  err:
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1484  	list_del(&vsc73xx_vlan->list);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1485  	kfree(vsc73xx_vlan);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1486  	return ret;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1487  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

