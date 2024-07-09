Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57B2BD05
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507333; cv=none; b=omL9jekj/b9+vFnRwbTG1p4zz4UC9XElAr/B7PZuTopBpwwoWAdWnD4vEtTOXWxVO/9ZQ8S0sio0eQDe0KbSopWVuijLyYPeULqFGHqAZ9uVjIk2B3XBTOo+ZsLhVRSWIg/Qu9GLfkOtoID/MSnBzy29aH99NpAx4DF3Cob2aew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507333; c=relaxed/simple;
	bh=tio7iFL+D7gU1HmvEvjm9bC1IuRy1hdir46wHwGVQow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H1A0C2nf+rQ/ABLaG5LQ46pjlrQpvs5cdC2PdjcKkvfAAay/3VReFvlwX2o9mKC+XuyKDNExFajNp5iRyVIsps+dlUzuA2+CfqrtuPNKVcZLi5S7EN3A+MwuBpBwW0toBKCFynZABC+Rj8ymmUiRw2WuUqPiuzRQOuqJT8dLrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b64JDIFi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b64JDIFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720507331; x=1752043331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tio7iFL+D7gU1HmvEvjm9bC1IuRy1hdir46wHwGVQow=;
  b=b64JDIFiSCSPEFBVAb/huJxs6LPoSOJ9SvnPavvwEReB+01p53Drxf5s
   UIFwzAhPV8Wy9ynvL+P+y6uKsfdvx++C8DHa/3DKKsnk/3cyWqu/KLPaF
   dd4lz1T69g+JJUQo+3OqLIQUMocUtIRIBMunzSUEDvuS34AZcrrUpcOHp
   zKiISSKEemHTt7ezDP2fYI0tPytSsWQqQYnXXmfB4eW2EEHYOiDnPLL+O
   +IALtmStI5lRK4n/qXl/SfKw4vOPFz97jPDeMNCA8PUvHdoC4G2PXFwDN
   fM7CznR0gOJZphRXxuVmYG0gPdyumxNnaW0tAX59oxEbmrMvp7L+oIZca
   w==;
X-CSE-ConnectionGUID: 4LcmO3V7QKO6I4qw6qMIOA==
X-CSE-MsgGUID: Lg5lkPA4SX23wv+SQY20tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17879961"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17879961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 23:42:10 -0700
X-CSE-ConnectionGUID: vonfD+cKS3uFbZIta/DlFA==
X-CSE-MsgGUID: OoTmAnNTTNuVDDc/E+vbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="78901372"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2024 23:42:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR4YA-000WOY-25;
	Tue, 09 Jul 2024 06:42:06 +0000
Date: Tue, 9 Jul 2024 14:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/2] vdpa: support set mac address from vdpa tool
Message-ID: <202407091426.l8rH3Oge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240708064820.88955-2-lulu@redhat.com>
References: <20240708064820.88955-2-lulu@redhat.com>
TO: Cindy Lu <lulu@redhat.com>
TO: lulu@redhat.com
TO: dtatulea@nvidia.com
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: parav@nvidia.com
TO: sgarzare@redhat.com
TO: netdev@vger.kernel.org
TO: virtualization@lists.linux-foundation.org
TO: linux-kernel@vger.kernel.org
TO: kvm@vger.kernel.org

Hi Cindy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on horms-ipvs/master v6.10-rc7 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vdpa-support-set-mac-address-from-vdpa-tool/20240708-144942
base:   linus/master
patch link:    https://lore.kernel.org/r/20240708064820.88955-2-lulu%40redhat.com
patch subject: [PATCH v3 1/2] vdpa: support set mac address from vdpa tool
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091426.l8rH3Oge-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407091426.l8rH3Oge-lkp@intel.com/

smatch warnings:
drivers/vdpa/vdpa.c:1394 vdpa_dev_net_device_attr_set() error: uninitialized symbol 'err'.

vim +/err +1394 drivers/vdpa/vdpa.c

ad69dd0bf26b88 Parav Pandit 2021-10-26  1363  
5397c64ea5a487 Cindy Lu     2024-07-08  1364  static int vdpa_dev_net_device_attr_set(struct vdpa_device *vdev,
5397c64ea5a487 Cindy Lu     2024-07-08  1365  					struct genl_info *info)
5397c64ea5a487 Cindy Lu     2024-07-08  1366  {
5397c64ea5a487 Cindy Lu     2024-07-08  1367  	struct vdpa_dev_set_config set_config = {};
5397c64ea5a487 Cindy Lu     2024-07-08  1368  	const u8 *macaddr;
5397c64ea5a487 Cindy Lu     2024-07-08  1369  	struct vdpa_mgmt_dev *mdev = vdev->mdev;
5397c64ea5a487 Cindy Lu     2024-07-08  1370  	struct nlattr **nl_attrs = info->attrs;
5397c64ea5a487 Cindy Lu     2024-07-08  1371  	int err;
5397c64ea5a487 Cindy Lu     2024-07-08  1372  
5397c64ea5a487 Cindy Lu     2024-07-08  1373  	if (!vdev->mdev)
5397c64ea5a487 Cindy Lu     2024-07-08  1374  		return -EINVAL;
5397c64ea5a487 Cindy Lu     2024-07-08  1375  
5397c64ea5a487 Cindy Lu     2024-07-08  1376  	down_write(&vdev->cf_lock);
5397c64ea5a487 Cindy Lu     2024-07-08  1377  	if ((mdev->supported_features & BIT_ULL(VIRTIO_NET_F_MAC)) &&
5397c64ea5a487 Cindy Lu     2024-07-08  1378  	    nl_attrs[VDPA_ATTR_DEV_NET_CFG_MACADDR]) {
5397c64ea5a487 Cindy Lu     2024-07-08  1379  		set_config.mask |= BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MACADDR);
5397c64ea5a487 Cindy Lu     2024-07-08  1380  		macaddr = nla_data(nl_attrs[VDPA_ATTR_DEV_NET_CFG_MACADDR]);
5397c64ea5a487 Cindy Lu     2024-07-08  1381  		memcpy(set_config.net.mac, macaddr, ETH_ALEN);
5397c64ea5a487 Cindy Lu     2024-07-08  1382  
5397c64ea5a487 Cindy Lu     2024-07-08  1383  		if (mdev->ops->dev_set_attr) {
5397c64ea5a487 Cindy Lu     2024-07-08  1384  			err = mdev->ops->dev_set_attr(mdev, vdev, &set_config);
5397c64ea5a487 Cindy Lu     2024-07-08  1385  		} else {
5397c64ea5a487 Cindy Lu     2024-07-08  1386  			NL_SET_ERR_MSG_FMT_MOD(info->extack,
5397c64ea5a487 Cindy Lu     2024-07-08  1387  					       "features 0x%llx not supported",
5397c64ea5a487 Cindy Lu     2024-07-08  1388  					       BIT_ULL(VIRTIO_NET_F_MAC));
5397c64ea5a487 Cindy Lu     2024-07-08  1389  			err = -EINVAL;
5397c64ea5a487 Cindy Lu     2024-07-08  1390  		}
5397c64ea5a487 Cindy Lu     2024-07-08  1391  	}
5397c64ea5a487 Cindy Lu     2024-07-08  1392  	up_write(&vdev->cf_lock);
5397c64ea5a487 Cindy Lu     2024-07-08  1393  
5397c64ea5a487 Cindy Lu     2024-07-08 @1394  	return err;
5397c64ea5a487 Cindy Lu     2024-07-08  1395  }
5397c64ea5a487 Cindy Lu     2024-07-08  1396  static int vdpa_nl_cmd_dev_attr_set_doit(struct sk_buff *skb,
5397c64ea5a487 Cindy Lu     2024-07-08  1397  					 struct genl_info *info)
5397c64ea5a487 Cindy Lu     2024-07-08  1398  {
5397c64ea5a487 Cindy Lu     2024-07-08  1399  	const char *name;
5397c64ea5a487 Cindy Lu     2024-07-08  1400  	int err = 0;
5397c64ea5a487 Cindy Lu     2024-07-08  1401  	struct device *dev;
5397c64ea5a487 Cindy Lu     2024-07-08  1402  	struct vdpa_device *vdev;
5397c64ea5a487 Cindy Lu     2024-07-08  1403  	u64 classes;
5397c64ea5a487 Cindy Lu     2024-07-08  1404  
5397c64ea5a487 Cindy Lu     2024-07-08  1405  	if (!info->attrs[VDPA_ATTR_DEV_NAME])
5397c64ea5a487 Cindy Lu     2024-07-08  1406  		return -EINVAL;
5397c64ea5a487 Cindy Lu     2024-07-08  1407  
5397c64ea5a487 Cindy Lu     2024-07-08  1408  	name = nla_data(info->attrs[VDPA_ATTR_DEV_NAME]);
5397c64ea5a487 Cindy Lu     2024-07-08  1409  
5397c64ea5a487 Cindy Lu     2024-07-08  1410  	down_write(&vdpa_dev_lock);
5397c64ea5a487 Cindy Lu     2024-07-08  1411  	dev = bus_find_device(&vdpa_bus, NULL, name, vdpa_name_match);
5397c64ea5a487 Cindy Lu     2024-07-08  1412  	if (!dev) {
5397c64ea5a487 Cindy Lu     2024-07-08  1413  		NL_SET_ERR_MSG_MOD(info->extack, "device not found");
5397c64ea5a487 Cindy Lu     2024-07-08  1414  		err = -ENODEV;
5397c64ea5a487 Cindy Lu     2024-07-08  1415  		goto dev_err;
5397c64ea5a487 Cindy Lu     2024-07-08  1416  	}
5397c64ea5a487 Cindy Lu     2024-07-08  1417  	vdev = container_of(dev, struct vdpa_device, dev);
5397c64ea5a487 Cindy Lu     2024-07-08  1418  	if (!vdev->mdev) {
5397c64ea5a487 Cindy Lu     2024-07-08  1419  		NL_SET_ERR_MSG_MOD(
5397c64ea5a487 Cindy Lu     2024-07-08  1420  			info->extack,
5397c64ea5a487 Cindy Lu     2024-07-08  1421  			"Fail to find the specified management device");
5397c64ea5a487 Cindy Lu     2024-07-08  1422  		err = -EINVAL;
5397c64ea5a487 Cindy Lu     2024-07-08  1423  		goto mdev_err;
5397c64ea5a487 Cindy Lu     2024-07-08  1424  	}
5397c64ea5a487 Cindy Lu     2024-07-08  1425  	classes = vdpa_mgmtdev_get_classes(vdev->mdev, NULL);
5397c64ea5a487 Cindy Lu     2024-07-08  1426  	if (classes & BIT_ULL(VIRTIO_ID_NET)) {
5397c64ea5a487 Cindy Lu     2024-07-08  1427  		err = vdpa_dev_net_device_attr_set(vdev, info);
5397c64ea5a487 Cindy Lu     2024-07-08  1428  	} else {
5397c64ea5a487 Cindy Lu     2024-07-08  1429  		NL_SET_ERR_MSG_FMT_MOD(info->extack, "%s device not supported",
5397c64ea5a487 Cindy Lu     2024-07-08  1430  				       name);
5397c64ea5a487 Cindy Lu     2024-07-08  1431  	}
5397c64ea5a487 Cindy Lu     2024-07-08  1432  
5397c64ea5a487 Cindy Lu     2024-07-08  1433  mdev_err:
5397c64ea5a487 Cindy Lu     2024-07-08  1434  	put_device(dev);
5397c64ea5a487 Cindy Lu     2024-07-08  1435  dev_err:
5397c64ea5a487 Cindy Lu     2024-07-08  1436  	up_write(&vdpa_dev_lock);
5397c64ea5a487 Cindy Lu     2024-07-08  1437  	return err;
5397c64ea5a487 Cindy Lu     2024-07-08  1438  }
5397c64ea5a487 Cindy Lu     2024-07-08  1439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
