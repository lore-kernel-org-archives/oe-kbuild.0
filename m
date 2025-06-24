Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC417A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757461; cv=none; b=G60RU8VftE3GbX4VrQmHKmlQR3AQWnJv7agrHk+4sxmTKgwUFQq9FxzGAgtzlsVgDehMybjSEpRfRrS0PK70M2+r/GSlvqDM4hVnW/yaA6Ml2eMvk40c5fKm39uk47mZEgnMbpxVIB3JObPHaw2qkHEgouBko+rOGHAP+Efm60Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757461; c=relaxed/simple;
	bh=4zRRalBzzw1Esmp/i1SOwTQt/GHle5JEbmYpk4Y5bnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JB/MtSIehnMTe5uxuGfR0EGwsvlQWtLEHRD5GsIzSLHyIZkVcF+0ACYVr3N04IO+DzJvATxPg2THCZdWANf118AqqjCOWgDSNKcWeejiEr3KOiW0mTTC3pKWrkUexYSfODBz63IREKCB3tHmORITL4vpnqLq2ej/rnlLminhYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIvoQzKW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIvoQzKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750757459; x=1782293459;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4zRRalBzzw1Esmp/i1SOwTQt/GHle5JEbmYpk4Y5bnk=;
  b=AIvoQzKWLsZthC52F4Hdx/JNlkrDTHa9aRgIoUx9PZ+/nJzzoyiy95XF
   YSBI9GpumUgp3cfyMaDBnEaxwem8meFsEVo0sWHFnnNnf/bLxE26LX9q5
   /IhdT9t9/0FQ2y/qSj7xelfaIfMIV7BDEIYB7iWQ8OUTNX12QgZT1I2/w
   BIzAB5/8cp+NsUgk2mEoB86QouLac6W30RBlqqVT8H/gquoJGQwfrvVXB
   lE9w+DbCExQ5ZR3Ed/ash4wfMEmi89SgeazVhO3Cc0sMn9R7BVqU+wzcH
   5feGSsNXyIdQ2T1B8/j0DbCj2bEMoilF9rVDMRx2cP1YATDQcese+4Dr1
   A==;
X-CSE-ConnectionGUID: pWtlaJpQQW2oGuPNQ22kag==
X-CSE-MsgGUID: ug+4V5WEQKC3SRSS7eeEvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55618887"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="55618887"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:30:58 -0700
X-CSE-ConnectionGUID: QfSCS51zSCi4sZWOPK8g7g==
X-CSE-MsgGUID: sT7D7ItqSSelN7Bni46YoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151996942"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2025 02:30:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTzzS-000Ryo-2k;
	Tue, 24 Jun 2025 09:30:54 +0000
Date: Tue, 24 Jun 2025 17:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 net-next 4/9] vhost-net: allow configuring extended
 features
Message-ID: <202506241710.pvHQGmeZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <e195567cf1f705143477f6eee7b528ee15918873.1750436464.git.pabeni@redhat.com>
References: <e195567cf1f705143477f6eee7b528ee15918873.1750436464.git.pabeni@redhat.com>
TO: Paolo Abeni <pabeni@redhat.com>
TO: netdev@vger.kernel.org
CC: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "Eugenio Pérez" <eperezma@redhat.com>
CC: Yuri Benditovich <yuri.benditovich@daynix.com>
CC: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: kvm@vger.kernel.org

Hi Paolo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250621-014409
base:   net-next/main
patch link:    https://lore.kernel.org/r/e195567cf1f705143477f6eee7b528ee15918873.1750436464.git.pabeni%40redhat.com
patch subject: [PATCH v5 net-next 4/9] vhost-net: allow configuring extended features
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241710.pvHQGmeZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506241710.pvHQGmeZ-lkp@intel.com/

New smatch warnings:
drivers/vhost/net.c:1724 vhost_net_ioctl() warn: check for integer overflow 'count'

Old smatch warnings:
drivers/vhost/net.c:1081 get_rx_bufs() error: uninitialized symbol 'len'.

vim +/count +1724 drivers/vhost/net.c

b1ad8496c9f47d Asias He           2013-05-06  1682  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1683  static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1684  			    unsigned long arg)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1685  {
059c23697448c5 Paolo Abeni        2025-06-20  1686  	u64 all_features[VIRTIO_FEATURES_DWORDS];
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1687  	struct vhost_net *n = f->private_data;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1688  	void __user *argp = (void __user *)arg;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1689  	u64 __user *featurep = argp;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1690  	struct vhost_vring_file backend;
059c23697448c5 Paolo Abeni        2025-06-20  1691  	u64 features, count, copied;
059c23697448c5 Paolo Abeni        2025-06-20  1692  	int r, i;
d47effe1be0c4f Krishna Kumar      2011-03-01  1693  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1694  	switch (ioctl) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1695  	case VHOST_NET_SET_BACKEND:
d3553a52490dca Takuya Yoshikawa   2010-05-27  1696  		if (copy_from_user(&backend, argp, sizeof backend))
d3553a52490dca Takuya Yoshikawa   2010-05-27  1697  			return -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1698  		return vhost_net_set_backend(n, backend.index, backend.fd);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1699  	case VHOST_GET_FEATURES:
059c23697448c5 Paolo Abeni        2025-06-20  1700  		features = vhost_net_features[0];
d3553a52490dca Takuya Yoshikawa   2010-05-27  1701  		if (copy_to_user(featurep, &features, sizeof features))
d3553a52490dca Takuya Yoshikawa   2010-05-27  1702  			return -EFAULT;
d3553a52490dca Takuya Yoshikawa   2010-05-27  1703  		return 0;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1704  	case VHOST_SET_FEATURES:
d3553a52490dca Takuya Yoshikawa   2010-05-27  1705  		if (copy_from_user(&features, featurep, sizeof features))
d3553a52490dca Takuya Yoshikawa   2010-05-27  1706  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1707  		if (features & ~vhost_net_features[0])
059c23697448c5 Paolo Abeni        2025-06-20  1708  			return -EOPNOTSUPP;
059c23697448c5 Paolo Abeni        2025-06-20  1709  
059c23697448c5 Paolo Abeni        2025-06-20  1710  		virtio_features_from_u64(all_features, features);
059c23697448c5 Paolo Abeni        2025-06-20  1711  		return vhost_net_set_features(n, all_features);
059c23697448c5 Paolo Abeni        2025-06-20  1712  	case VHOST_GET_FEATURES_ARRAY:
059c23697448c5 Paolo Abeni        2025-06-20  1713  		if (get_user(count, featurep))
059c23697448c5 Paolo Abeni        2025-06-20  1714  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1715  
059c23697448c5 Paolo Abeni        2025-06-20  1716  		/* Copy the net features, up to the user-provided buffer size */
059c23697448c5 Paolo Abeni        2025-06-20  1717  		argp += sizeof(u64);
059c23697448c5 Paolo Abeni        2025-06-20  1718  		copied = min(count, VIRTIO_FEATURES_DWORDS);
059c23697448c5 Paolo Abeni        2025-06-20  1719  		if (copy_to_user(argp, vhost_net_features,
059c23697448c5 Paolo Abeni        2025-06-20  1720  				 copied * sizeof(u64)))
059c23697448c5 Paolo Abeni        2025-06-20  1721  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1722  
059c23697448c5 Paolo Abeni        2025-06-20  1723  		/* Zero the trailing space provided by user-space, if any */
059c23697448c5 Paolo Abeni        2025-06-20 @1724  		if (clear_user(argp, (count - copied) * sizeof(u64)))
059c23697448c5 Paolo Abeni        2025-06-20  1725  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1726  		return 0;
059c23697448c5 Paolo Abeni        2025-06-20  1727  	case VHOST_SET_FEATURES_ARRAY:
059c23697448c5 Paolo Abeni        2025-06-20  1728  		if (get_user(count, featurep))
059c23697448c5 Paolo Abeni        2025-06-20  1729  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1730  
059c23697448c5 Paolo Abeni        2025-06-20  1731  		virtio_features_zero(all_features);
059c23697448c5 Paolo Abeni        2025-06-20  1732  		argp += sizeof(u64);
059c23697448c5 Paolo Abeni        2025-06-20  1733  		copied = min(count, VIRTIO_FEATURES_DWORDS);
059c23697448c5 Paolo Abeni        2025-06-20  1734  		if (copy_from_user(all_features, argp, copied * sizeof(u64)))
059c23697448c5 Paolo Abeni        2025-06-20  1735  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1736  
059c23697448c5 Paolo Abeni        2025-06-20  1737  		/*
059c23697448c5 Paolo Abeni        2025-06-20  1738  		 * Any feature specified by user-space above
059c23697448c5 Paolo Abeni        2025-06-20  1739  		 * VIRTIO_FEATURES_MAX is not supported by definition.
059c23697448c5 Paolo Abeni        2025-06-20  1740  		 */
059c23697448c5 Paolo Abeni        2025-06-20  1741  		for (i = copied; i < count; ++i) {
059c23697448c5 Paolo Abeni        2025-06-20  1742  			if (get_user(features, featurep + 1 + i))
059c23697448c5 Paolo Abeni        2025-06-20  1743  				return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1744  			if (features)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1745  				return -EOPNOTSUPP;
059c23697448c5 Paolo Abeni        2025-06-20  1746  		}
059c23697448c5 Paolo Abeni        2025-06-20  1747  
059c23697448c5 Paolo Abeni        2025-06-20  1748  		for (i = 0; i < VIRTIO_FEATURES_DWORDS; i++)
059c23697448c5 Paolo Abeni        2025-06-20  1749  			if (all_features[i] & ~vhost_net_features[i])
059c23697448c5 Paolo Abeni        2025-06-20  1750  				return -EOPNOTSUPP;
059c23697448c5 Paolo Abeni        2025-06-20  1751  
059c23697448c5 Paolo Abeni        2025-06-20  1752  		return vhost_net_set_features(n, all_features);
429711aec282c4 Jason Wang         2018-08-06  1753  	case VHOST_GET_BACKEND_FEATURES:
429711aec282c4 Jason Wang         2018-08-06  1754  		features = VHOST_NET_BACKEND_FEATURES;
429711aec282c4 Jason Wang         2018-08-06  1755  		if (copy_to_user(featurep, &features, sizeof(features)))
429711aec282c4 Jason Wang         2018-08-06  1756  			return -EFAULT;
429711aec282c4 Jason Wang         2018-08-06  1757  		return 0;
429711aec282c4 Jason Wang         2018-08-06  1758  	case VHOST_SET_BACKEND_FEATURES:
429711aec282c4 Jason Wang         2018-08-06  1759  		if (copy_from_user(&features, featurep, sizeof(features)))
429711aec282c4 Jason Wang         2018-08-06  1760  			return -EFAULT;
429711aec282c4 Jason Wang         2018-08-06  1761  		if (features & ~VHOST_NET_BACKEND_FEATURES)
429711aec282c4 Jason Wang         2018-08-06  1762  			return -EOPNOTSUPP;
460f7ce19f50e6 Jason Wang         2020-08-04  1763  		vhost_set_backend_features(&n->dev, features);
460f7ce19f50e6 Jason Wang         2020-08-04  1764  		return 0;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1765  	case VHOST_RESET_OWNER:
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1766  		return vhost_net_reset_owner(n);
b1ad8496c9f47d Asias He           2013-05-06  1767  	case VHOST_SET_OWNER:
b1ad8496c9f47d Asias He           2013-05-06  1768  		return vhost_net_set_owner(n);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1769  	default:
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1770  		mutex_lock(&n->dev.mutex);
935cdee7ee1595 Michael S. Tsirkin 2012-12-06  1771  		r = vhost_dev_ioctl(&n->dev, ioctl, argp);
935cdee7ee1595 Michael S. Tsirkin 2012-12-06  1772  		if (r == -ENOIOCTLCMD)
935cdee7ee1595 Michael S. Tsirkin 2012-12-06  1773  			r = vhost_vring_ioctl(&n->dev, ioctl, argp);
935cdee7ee1595 Michael S. Tsirkin 2012-12-06  1774  		else
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1775  			vhost_net_flush(n);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1776  		mutex_unlock(&n->dev.mutex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1777  		return r;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1778  	}
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1779  }
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
