Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D9EBF;
	Thu,  6 Apr 2023 09:08:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso8470638wms.5;
        Thu, 06 Apr 2023 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680772082; x=1683364082;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tVjY0hAqB8YrG2hE8ml3g3CrSQ4h6bCY/Q2vqkHBThw=;
        b=Gr4gFcHMgTB7otqKSzGcba6cGVzb1sfTEos/1ml00lbqYoy1fuUOsEmMhzQ8vvb1Gf
         6KOvUyhpDmZvuMo60TE0dTleZxuFwIj8NeBwNKegaEvH+zJNa1GoVUuJKUjMx8NiiqA8
         vI/EzScIM1Eo/DgQKj+x9l65it2+fBze60FYfS74huh++r831KUHUs7ePXSJ4p+H9saZ
         GzC6Gtx+aAYO0/JowLEU6uDvb6MHfCJfzquHNdvwq4mmTvgJoP3txSRZjx+b9/WufjgT
         eLXCWm9tLdKieay9kaZVc8LRSRA8mkES64lvr4wuHrMalFyjHyEJtkLJVpYFiFhUNYm2
         1Isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680772082; x=1683364082;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVjY0hAqB8YrG2hE8ml3g3CrSQ4h6bCY/Q2vqkHBThw=;
        b=6IX+rTF1WWh0qK8obXpiY9GfshzvJbm5hocSewkjj5MDAgebEl+9RYyKWODI8sOZMh
         zm4YUROdmq/L2H75m39T+Eicl3nDPEV/tvG1fZFCqu2FOVtTrtu5Kjdsq9pEJeGzWU6w
         oXkyooZPPYcncgMlu7d1fUmh3e6gvbTwxxwxVDrOXqFxWM0afBxlUtFEdyPvvlmkwXNy
         Gb7ZKoGGxkFziqT9A4fQuKtz46becMH44iezsPCmY5VlL/SkZxanUJnmUCte6t6ffDVP
         dmcALKxdetbuMJK/QGchaXgDVbE37t6kVk6wuI9qEx4FnyPa6T8RIKH6/qAV8mGnBA7W
         I3qA==
X-Gm-Message-State: AAQBX9fnwRV+Dl8cK2BBp/+WhWyOWVeKNoyJxx358GBE7QIa34S+PpAa
	oUXTRixvOBeySY8Bq3G8ak3Uobbaee4=
X-Google-Smtp-Source: AKy350ZR74iwbXQ+ZFXcu6eNORqNcgScpryXeMKCD0Momv0uYo38lBIGDIqiY4//KPrS3u9DqUhnUA==
X-Received: by 2002:a1c:f418:0:b0:3ed:bc83:3745 with SMTP id z24-20020a1cf418000000b003edbc833745mr6689476wma.25.1680772082273;
        Thu, 06 Apr 2023 02:08:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c029000b003ef71d541cbsm1012047wmk.1.2023.04.06.02.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 02:08:01 -0700 (PDT)
Date: Thu, 6 Apr 2023 12:07:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, edward.cree@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 2/6] net: ethtool: record custom RSS
 contexts in the IDR
Message-ID: <ab0484a5-07a1-4fde-80be-940dbff6a014@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57c0a5a7d41e1341e8a7b0256ca8ed6f3e3ea9c0.1680538846.git.ecree.xilinx@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/edward-cree-amd-com/net-ethtool-attach-an-IDR-of-custom-RSS-contexts-to-a-netdevice/20230404-003917
patch link:    https://lore.kernel.org/r/57c0a5a7d41e1341e8a7b0256ca8ed6f3e3ea9c0.1680538846.git.ecree.xilinx%40gmail.com
patch subject: [RFC PATCH net-next 2/6] net: ethtool: record custom RSS contexts in the IDR
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230405/202304050121.mBnnA2B8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304050121.mBnnA2B8-lkp@intel.com/

New smatch warnings:
net/ethtool/ioctl.c:1402 ethtool_set_rxfh() error: uninitialized symbol 'ctx'.

Old smatch warnings:
net/ethtool/ioctl.c:1419 ethtool_set_rxfh() warn: possible memory leak of 'ctx'

vim +/ctx +1402 net/ethtool/ioctl.c

3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1246  static noinline_for_stack int ethtool_set_rxfh(struct net_device *dev,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1247  					       void __user *useraddr)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1248  {
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1249  	int ret;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1250  	const struct ethtool_ops *ops = dev->ethtool_ops;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1251  	struct ethtool_rxfh_context *ctx;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1252  	struct ethtool_rxnfc rx_rings;
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1253  	struct ethtool_rxfh rxfh;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1254  	u32 dev_indir_size = 0, dev_key_size = 0, dev_priv_size = 0, i;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1255  	u32 *indir = NULL, indir_bytes = 0;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1256  	u8 *hkey = NULL;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1257  	u8 *rss_config;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1258  	u32 rss_cfg_offset = offsetof(struct ethtool_rxfh, rss_config[0]);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1259  	bool create = false, delete = false;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1260  
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1261  	if (!ops->get_rxnfc || !ops->set_rxfh)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1262  		return -EOPNOTSUPP;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1263  
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1264  	if (ops->get_rxfh_indir_size)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1265  		dev_indir_size = ops->get_rxfh_indir_size(dev);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1266  	if (ops->get_rxfh_key_size)
d340c862e76081 net/core/ethtool.c  Dan Carpenter   2015-02-20  1267  		dev_key_size = ops->get_rxfh_key_size(dev);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1268  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1269  	if (copy_from_user(&rxfh, useraddr, sizeof(rxfh)))
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1270  		return -EFAULT;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1271  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1272  	/* Check that reserved fields are 0 for now */
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1273  	if (rxfh.rsvd8[0] || rxfh.rsvd8[1] || rxfh.rsvd8[2] || rxfh.rsvd32)
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1274  		return -EINVAL;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1275  	/* Most drivers don't handle rss_context, check it's 0 as well */
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1276  	if (rxfh.rss_context && !ops->set_rxfh_context)
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1277  		return -EOPNOTSUPP;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1278  	create = rxfh.rss_context == ETH_RXFH_CONTEXT_ALLOC;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1279  	if (create && ops->get_rxfh_priv_size)
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1280  		dev_priv_size = ops->get_rxfh_priv_size(dev);
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1281  
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1282  	/* If either indir, hash key or function is valid, proceed further.
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1283  	 * Must request at least one change: indir size, hash key or function.
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1284  	 */
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1285  	if ((rxfh.indir_size &&
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1286  	     rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE &&
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1287  	     rxfh.indir_size != dev_indir_size) ||
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1288  	    (rxfh.key_size && (rxfh.key_size != dev_key_size)) ||
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1289  	    (rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE &&
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1290  	     rxfh.key_size == 0 && rxfh.hfunc == ETH_RSS_HASH_NO_CHANGE))
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1291  		return -EINVAL;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1292  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1293  	if (rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1294  		indir_bytes = dev_indir_size * sizeof(indir[0]);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1295  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1296  	rss_config = kzalloc(indir_bytes + rxfh.key_size, GFP_USER);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1297  	if (!rss_config)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1298  		return -ENOMEM;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1299  
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1300  	rx_rings.cmd = ETHTOOL_GRXRINGS;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1301  	ret = ops->get_rxnfc(dev, &rx_rings, NULL);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1302  	if (ret)
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1303  		goto out;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1304  
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1305  	/* rxfh.indir_size == 0 means reset the indir table to default (master
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1306  	 * context) or delete the context (other RSS contexts).
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1307  	 * rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE means leave it unchanged.
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1308  	 */
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1309  	if (rxfh.indir_size &&
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1310  	    rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE) {
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1311  		indir = (u32 *)rss_config;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1312  		ret = ethtool_copy_validate_indir(indir,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1313  						  useraddr + rss_cfg_offset,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1314  						  &rx_rings,
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1315  						  rxfh.indir_size);
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1316  		if (ret)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1317  			goto out;
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1318  	} else if (rxfh.indir_size == 0) {
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1319  		if (rxfh.rss_context == 0) {
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1320  			indir = (u32 *)rss_config;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1321  			for (i = 0; i < dev_indir_size; i++)
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1322  				indir[i] = ethtool_rxfh_indir_default(i, rx_rings.data);
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1323  		} else {
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1324  			delete = true;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1325  		}
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1326  	}
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1327  
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1328  	if (rxfh.key_size) {
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1329  		hkey = rss_config + indir_bytes;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1330  		if (copy_from_user(hkey,
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1331  				   useraddr + rss_cfg_offset + indir_bytes,
f062a3844845d2 net/core/ethtool.c  Ben Hutchings   2014-05-15  1332  				   rxfh.key_size)) {
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1333  			ret = -EFAULT;
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1334  			goto out;
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1335  		}
278bc4296bd64f net/core/ethtool.c  Ben Hutchings   2011-12-15  1336  	}
7850f63f162051 net/core/ethtool.c  Ben Hutchings   2011-12-15  1337  
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1338  	if (create) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1339  		if (delete) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1340  			ret = -EINVAL;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1341  			goto out;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1342  		}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1343  		ctx = kzalloc(ethtool_rxfh_context_size(dev_indir_size,
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1344  							dev_key_size,
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1345  							dev_priv_size),
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1346  			      GFP_USER);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1347  		if (!ctx) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1348  			ret = -ENOMEM;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1349  			goto out;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1350  		}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1351  		ctx->indir_size = dev_indir_size;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1352  		ctx->key_size = dev_key_size;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1353  		ctx->hfunc = rxfh.hfunc;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1354  		ctx->priv_size = dev_priv_size;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1355  	} else if (rxfh.rss_context) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1356  		ctx = idr_find(&dev->rss_ctx, rxfh.rss_context);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1357  		if (!ctx) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1358  			ret = -ENOENT;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1359  			goto out;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1360  		}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1361  	}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1362  
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1363  	if (rxfh.rss_context)
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1364  		ret = ops->set_rxfh_context(dev, indir, hkey, rxfh.hfunc,
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1365  					    &rxfh.rss_context, delete);
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1366  	else
892311f66f2411 net/core/ethtool.c  Eyal Perry      2014-12-02  1367  		ret = ops->set_rxfh(dev, indir, hkey, rxfh.hfunc);
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1368  	if (ret)
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1369  		goto out;
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1370  
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1371  	if (copy_to_user(useraddr + offsetof(struct ethtool_rxfh, rss_context),
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1372  			 &rxfh.rss_context, sizeof(rxfh.rss_context)))
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1373  		ret = -EFAULT;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1374  
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1375  	if (!rxfh.rss_context) {
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1376  		/* indicate whether rxfh was set to default */
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1377  		if (rxfh.indir_size == 0)
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1378  			dev->priv_flags &= ~IFF_RXFH_CONFIGURED;
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1379  		else if (rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE)
d4ab4286276fcd net/core/ethtool.c  Keller, Jacob E 2016-02-08  1380  			dev->priv_flags |= IFF_RXFH_CONFIGURED;
84a1d9c4820080 net/core/ethtool.c  Edward Cree     2018-03-08  1381  	}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1382  	/* Update rss_ctx tracking */
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1383  	if (create) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1384  		/* Ideally this should happen before calling the driver,
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1385  		 * so that we can fail more cleanly; but we don't have the
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1386  		 * context ID until the driver picks it, so we have to
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1387  		 * wait until after.
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1388  		 */
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1389  		if (WARN_ON(idr_find(&dev->rss_ctx, rxfh.rss_context)))
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1390  			/* context ID reused, our tracking is screwed */
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1391  			goto out;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1392  		/* Allocate the exact ID the driver gave us */
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1393  		WARN_ON(idr_alloc(&dev->rss_ctx, ctx, rxfh.rss_context,
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1394  				  rxfh.rss_context + 1, GFP_KERNEL) !=
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1395  			rxfh.rss_context);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1396  		ctx->indir_no_change = rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1397  		ctx->key_no_change = !rxfh.key_size;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1398  	}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1399  	if (delete) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1400  		WARN_ON(idr_remove(&dev->rss_ctx, rxfh.rss_context) != ctx);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1401  		kfree(ctx);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03 @1402  	} else if (ctx) {

"ctx" is either non-NULL or uninitialized so this condition doesn't
make sense.

59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1403  		if (indir) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1404  			for (i = 0; i < dev_indir_size; i++)
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1405  				ethtool_rxfh_context_indir(ctx)[i] = indir[i];
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1406  			ctx->indir_no_change = 0;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1407  		}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1408  		if (hkey) {
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1409  			memcpy(ethtool_rxfh_context_key(ctx), hkey,
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1410  			       dev_key_size);
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1411  			ctx->key_no_change = 0;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1412  		}
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1413  		if (rxfh.hfunc != ETH_RSS_HASH_NO_CHANGE)
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1414  			ctx->hfunc = rxfh.hfunc;
59b320b4d43d43 net/ethtool/ioctl.c Edward Cree     2023-04-03  1415  	}
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1416  
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1417  out:
3de0b592394d17 net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1418  	kfree(rss_config);
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1419  	return ret;
a5b6ee291e39e2 net/core/ethtool.c  Ben Hutchings   2010-06-30  1420  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

