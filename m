Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E36155C94
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483400; cv=none; b=ZAV4QDJVi6z/bE/a/xSrkWZn6k2ntz5nIkfQIAJGKfBK6Py6tOC8YM7Y3AEVKbfUr/xfaT8LyyfP9d8t9JrAhOfOn1CHmAIVsVYe/gCYjwgRfEiMML3ow56RjAIglqSumB7M2lixiTWrAeDN0EPXic6TsLq0lWMqJKZUzmj2L6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483400; c=relaxed/simple;
	bh=sVF7qJ61JM5/gcbYMy0DgpHq6XTKrvRr4j8tB0XoCa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HttSPIPt9zVOdNitqfLvqj4qvU9wC5dZ51HUhA5sbOo7Aw+EfWxQFidtq0QDWvrxQ3eY/vDJFllIgC4ZtR5IJTzKaxVPRJgrJORMP5SkQ3zSOvw4r2jEHQd47x/n8+GOiJpuwn1Gn/HCqkQmK03WRaI31yzw1EYUtQfG6xkal0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjrSuW3z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjrSuW3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733483397; x=1765019397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVF7qJ61JM5/gcbYMy0DgpHq6XTKrvRr4j8tB0XoCa0=;
  b=UjrSuW3zvfxjKg8COSHNzUxLPiGD7uXZbIY9Eup+ipNprxkSUwFNqOE9
   KbcWMBfSdsZ4Q/qNcr4tKdSbjlP12RZV57a1qHrYUdaLVMKnAIDJHUqJ/
   Nafl1q7EqqtRYU7kxTLQyroQo8cIL+5YAi5dzf04tWpf99Qfrz1U19kCX
   6tHrWP0itYpgBS4kNhoCZyH0PdNRoMOeBPgMa1+tO3p0lPpBmWJ32MO29
   IoQ2iozbVYAWeMdbDRpjgbmIC6Iewg2r1KbEaNkVivIbA7QVS0RKRCYr8
   8KmV4vxX1HoaXl1c3ybwst8CqubLJSoffe1QwjzMOl3aolC2woZmfzzSk
   A==;
X-CSE-ConnectionGUID: DPaMSZYpR9O6186Y5Mvn1g==
X-CSE-MsgGUID: ntDeqfJ7TQOukR9sxi8MGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37617854"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37617854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 03:09:57 -0800
X-CSE-ConnectionGUID: DPJMruGdSw+uyxN/T1XdKA==
X-CSE-MsgGUID: PXvMJDK8StK3MBI/OpNZtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99444326"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Dec 2024 03:09:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJWDZ-0000y5-15;
	Fri, 06 Dec 2024 11:09:53 +0000
Date: Fri, 6 Dec 2024 19:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vhost/vhost.c:1654 vhost_vring_ioctl() error: uninitialized
 symbol 'vq'.
Message-ID: <202412061947.nNrM1l8R-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mike Christie <michael.christie@oracle.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: cef25866f41c45a01a933adb032b0dcfb25b847a vhost: add helper to parse userspace vring state/file
date:   1 year, 5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 5 months ago
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241206/202412061947.nNrM1l8R-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412061947.nNrM1l8R-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:1654 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:1685 vhost_vring_ioctl() error: uninitialized symbol 'idx'.

Old smatch warnings:
drivers/vhost/vhost.c:1657 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:1738 vhost_vring_ioctl() error: uninitialized symbol 'idx'.
drivers/vhost/vhost.c:1748 vhost_vring_ioctl() error: uninitialized symbol 'idx'.

vim +/vq +1654 drivers/vhost/vhost.c

feebcaeac79ad86 Jason Wang         2019-05-24  1612  
feebcaeac79ad86 Jason Wang         2019-05-24  1613  static long vhost_vring_set_num_addr(struct vhost_dev *d,
feebcaeac79ad86 Jason Wang         2019-05-24  1614  				     struct vhost_virtqueue *vq,
feebcaeac79ad86 Jason Wang         2019-05-24  1615  				     unsigned int ioctl,
feebcaeac79ad86 Jason Wang         2019-05-24  1616  				     void __user *argp)
feebcaeac79ad86 Jason Wang         2019-05-24  1617  {
feebcaeac79ad86 Jason Wang         2019-05-24  1618  	long r;
feebcaeac79ad86 Jason Wang         2019-05-24  1619  
feebcaeac79ad86 Jason Wang         2019-05-24  1620  	mutex_lock(&vq->mutex);
feebcaeac79ad86 Jason Wang         2019-05-24  1621  
feebcaeac79ad86 Jason Wang         2019-05-24  1622  	switch (ioctl) {
feebcaeac79ad86 Jason Wang         2019-05-24  1623  	case VHOST_SET_VRING_NUM:
feebcaeac79ad86 Jason Wang         2019-05-24  1624  		r = vhost_vring_set_num(d, vq, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1625  		break;
feebcaeac79ad86 Jason Wang         2019-05-24  1626  	case VHOST_SET_VRING_ADDR:
feebcaeac79ad86 Jason Wang         2019-05-24  1627  		r = vhost_vring_set_addr(d, vq, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1628  		break;
feebcaeac79ad86 Jason Wang         2019-05-24  1629  	default:
feebcaeac79ad86 Jason Wang         2019-05-24  1630  		BUG();
feebcaeac79ad86 Jason Wang         2019-05-24  1631  	}
feebcaeac79ad86 Jason Wang         2019-05-24  1632  
feebcaeac79ad86 Jason Wang         2019-05-24  1633  	mutex_unlock(&vq->mutex);
feebcaeac79ad86 Jason Wang         2019-05-24  1634  
feebcaeac79ad86 Jason Wang         2019-05-24  1635  	return r;
feebcaeac79ad86 Jason Wang         2019-05-24  1636  }
26b36604523f4a6 Sonny Rao          2018-03-14  1637  long vhost_vring_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1638  {
cecb46f194460d2 Al Viro            2012-08-27  1639  	struct file *eventfp, *filep = NULL;
cecb46f194460d2 Al Viro            2012-08-27  1640  	bool pollstart = false, pollstop = false;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1641  	struct eventfd_ctx *ctx = NULL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1642  	struct vhost_virtqueue *vq;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1643  	struct vhost_vring_state s;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1644  	struct vhost_vring_file f;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1645  	u32 idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1646  	long r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1647  
cef25866f41c45a Mike Christie      2023-06-26  1648  	r = vhost_get_vq_from_user(d, argp, &vq, &idx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1649  	if (r < 0)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1650  		return r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1651  
feebcaeac79ad86 Jason Wang         2019-05-24  1652  	if (ioctl == VHOST_SET_VRING_NUM ||
feebcaeac79ad86 Jason Wang         2019-05-24  1653  	    ioctl == VHOST_SET_VRING_ADDR) {
feebcaeac79ad86 Jason Wang         2019-05-24 @1654  		return vhost_vring_set_num_addr(d, vq, ioctl, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1655  	}
feebcaeac79ad86 Jason Wang         2019-05-24  1656  
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1657  	mutex_lock(&vq->mutex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1658  
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1659  	switch (ioctl) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1660  	case VHOST_SET_VRING_BASE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1661  		/* Moving base with an active backend?
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1662  		 * You don't want to do that. */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1663  		if (vq->private_data) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1664  			r = -EBUSY;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1665  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1666  		}
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1667  		if (copy_from_user(&s, argp, sizeof s)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1668  			r = -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1669  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1670  		}
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1671  		if (vhost_has_feature(vq, VIRTIO_F_RING_PACKED)) {
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1672  			vq->last_avail_idx = s.num & 0xffff;
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1673  			vq->last_used_idx = (s.num >> 16) & 0xffff;
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1674  		} else {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1675  			if (s.num > 0xffff) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1676  				r = -EINVAL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1677  				break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1678  			}
8d65843c44269c2 Jason Wang         2017-07-27  1679  			vq->last_avail_idx = s.num;
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1680  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1681  		/* Forget the cached index value. */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1682  		vq->avail_idx = vq->last_avail_idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1683  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1684  	case VHOST_GET_VRING_BASE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14 @1685  		s.index = idx;
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1686  		if (vhost_has_feature(vq, VIRTIO_F_RING_PACKED))
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1687  			s.num = (u32)vq->last_avail_idx | ((u32)vq->last_used_idx << 16);
55d8122f5cd62d5 Shannon Nelson     2023-04-24  1688  		else
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1689  			s.num = vq->last_avail_idx;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1690  		if (copy_to_user(argp, &s, sizeof s))
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1691  			r = -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1692  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1693  	case VHOST_SET_VRING_KICK:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1694  		if (copy_from_user(&f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1695  			r = -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1696  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1697  		}
e0136c16fae95dc Zhu Lingshan       2020-06-05  1698  		eventfp = f.fd == VHOST_FILE_UNBIND ? NULL : eventfd_fget(f.fd);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1699  		if (IS_ERR(eventfp)) {
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1700  			r = PTR_ERR(eventfp);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1701  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1702  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1703  		if (eventfp != vq->kick) {
cecb46f194460d2 Al Viro            2012-08-27  1704  			pollstop = (filep = vq->kick) != NULL;
cecb46f194460d2 Al Viro            2012-08-27  1705  			pollstart = (vq->kick = eventfp) != NULL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1706  		} else
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1707  			filep = eventfp;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1708  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1709  	case VHOST_SET_VRING_CALL:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1710  		if (copy_from_user(&f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1711  			r = -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1712  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1713  		}
e0136c16fae95dc Zhu Lingshan       2020-06-05  1714  		ctx = f.fd == VHOST_FILE_UNBIND ? NULL : eventfd_ctx_fdget(f.fd);
e050c7d93f4adb2 Eric Biggers       2018-01-06  1715  		if (IS_ERR(ctx)) {
e050c7d93f4adb2 Eric Biggers       2018-01-06  1716  			r = PTR_ERR(ctx);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1717  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1718  		}
265a0ad8731dc04 Zhu Lingshan       2020-07-31  1719  
265a0ad8731dc04 Zhu Lingshan       2020-07-31  1720  		swap(ctx, vq->call_ctx.ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1721  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1722  	case VHOST_SET_VRING_ERR:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1723  		if (copy_from_user(&f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1724  			r = -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1725  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1726  		}
e0136c16fae95dc Zhu Lingshan       2020-06-05  1727  		ctx = f.fd == VHOST_FILE_UNBIND ? NULL : eventfd_ctx_fdget(f.fd);
09f332a589232f5 Eric Biggers       2018-01-06  1728  		if (IS_ERR(ctx)) {
09f332a589232f5 Eric Biggers       2018-01-06  1729  			r = PTR_ERR(ctx);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1730  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1731  		}
09f332a589232f5 Eric Biggers       2018-01-06  1732  		swap(ctx, vq->error_ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1733  		break;
2751c9882b94729 Greg Kurz          2015-04-24  1734  	case VHOST_SET_VRING_ENDIAN:
2751c9882b94729 Greg Kurz          2015-04-24  1735  		r = vhost_set_vring_endian(vq, argp);
2751c9882b94729 Greg Kurz          2015-04-24  1736  		break;
2751c9882b94729 Greg Kurz          2015-04-24  1737  	case VHOST_GET_VRING_ENDIAN:
2751c9882b94729 Greg Kurz          2015-04-24  1738  		r = vhost_get_vring_endian(vq, idx, argp);
2751c9882b94729 Greg Kurz          2015-04-24  1739  		break;
030881372460654 Jason Wang         2016-03-04  1740  	case VHOST_SET_VRING_BUSYLOOP_TIMEOUT:
030881372460654 Jason Wang         2016-03-04  1741  		if (copy_from_user(&s, argp, sizeof(s))) {
030881372460654 Jason Wang         2016-03-04  1742  			r = -EFAULT;
030881372460654 Jason Wang         2016-03-04  1743  			break;
030881372460654 Jason Wang         2016-03-04  1744  		}
030881372460654 Jason Wang         2016-03-04  1745  		vq->busyloop_timeout = s.num;
030881372460654 Jason Wang         2016-03-04  1746  		break;
030881372460654 Jason Wang         2016-03-04  1747  	case VHOST_GET_VRING_BUSYLOOP_TIMEOUT:
030881372460654 Jason Wang         2016-03-04  1748  		s.index = idx;
030881372460654 Jason Wang         2016-03-04  1749  		s.num = vq->busyloop_timeout;
030881372460654 Jason Wang         2016-03-04  1750  		if (copy_to_user(argp, &s, sizeof(s)))
030881372460654 Jason Wang         2016-03-04  1751  			r = -EFAULT;
030881372460654 Jason Wang         2016-03-04  1752  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1753  	default:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1754  		r = -ENOIOCTLCMD;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1755  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1756  
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1757  	if (pollstop && vq->handle_kick)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1758  		vhost_poll_stop(&vq->poll);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1759  
e050c7d93f4adb2 Eric Biggers       2018-01-06  1760  	if (!IS_ERR_OR_NULL(ctx))
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1761  		eventfd_ctx_put(ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1762  	if (filep)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1763  		fput(filep);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1764  
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1765  	if (pollstart && vq->handle_kick)
2b8b328b61c7999 Jason Wang         2013-01-28  1766  		r = vhost_poll_start(&vq->poll, vq->kick);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1767  
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1768  	mutex_unlock(&vq->mutex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1769  
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1770  	if (pollstop && vq->handle_kick)
b2ffa407ed5dd93 Mike Christie      2022-05-17  1771  		vhost_dev_flush(vq->poll.dev);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1772  	return r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1773  }
6ac1afbf6132df0 Asias He           2013-05-06  1774  EXPORT_SYMBOL_GPL(vhost_vring_ioctl);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1775  

:::::: The code at line 1654 was first introduced by commit
:::::: feebcaeac79ad86fb289ef55fa92f4a97ab8314e vhost: factor out setting vring addr and num

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
