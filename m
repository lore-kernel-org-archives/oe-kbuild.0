Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D75661
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688482199; x=1720018199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrOxfVeZ4yTMEZ6jvOg+DYA8/Y0tESQ5Efyyo4z2kJk=;
  b=SjVA88bkgMwa4DsSQ7ubHDouPGiwREvKzFoj1k/9l/YgBL58yQwb1gl0
   McnR5CjZgGrceYmOYuTIwJ23jFdMdSPfsE1W4fEdENg60iqxsaFohT0QP
   3CyF5KhcHsMTdOH11PAQoyjwKGZA6DGSj9EM698IVqqx/yBgkJcOOSQGt
   qy0Mu4Ai09pNsBKFxCDneHMGaS6YpmG3NqmA+kibtpd34L+WlOvzZezqX
   Jf4C9xirh98KtDkkD3hrKVZf6nrSj8Y579lLLBZ/E4k4M6EamyUUPQq5y
   41i4lmAPdZtiNUxG70BxIV1zvmtispPF+JMQyMnXAkC8UvZ4swZAkmm4J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="449504686"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="449504686"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="722097397"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="722097397"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2023 07:49:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGhLn-000IIx-3D;
	Tue, 04 Jul 2023 14:49:55 +0000
Date: Tue, 4 Jul 2023 22:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12223/12997] drivers/vhost/vhost.c:1654
 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
Message-ID: <202307042241.Pax1zFVN-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Christie <michael.christie@oracle.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1
commit: 8e355b19cf9c524883c6ec7c3431cd377a5f05bd [12223/12997] vhost: add helper to parse userspace vring state/file
:::::: branch date: 11 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230704/202307042241.Pax1zFVN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042241.Pax1zFVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307042241.Pax1zFVN-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:1654 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:1685 vhost_vring_ioctl() error: uninitialized symbol 'idx'.

Old smatch warnings:
drivers/vhost/vhost.c:1657 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:1738 vhost_vring_ioctl() error: uninitialized symbol 'idx'.
drivers/vhost/vhost.c:1748 vhost_vring_ioctl() error: uninitialized symbol 'idx'.

vim +/vq +1654 drivers/vhost/vhost.c

feebcaeac79ad8 Jason Wang         2019-05-24  1612  
feebcaeac79ad8 Jason Wang         2019-05-24  1613  static long vhost_vring_set_num_addr(struct vhost_dev *d,
feebcaeac79ad8 Jason Wang         2019-05-24  1614  				     struct vhost_virtqueue *vq,
feebcaeac79ad8 Jason Wang         2019-05-24  1615  				     unsigned int ioctl,
feebcaeac79ad8 Jason Wang         2019-05-24  1616  				     void __user *argp)
feebcaeac79ad8 Jason Wang         2019-05-24  1617  {
feebcaeac79ad8 Jason Wang         2019-05-24  1618  	long r;
feebcaeac79ad8 Jason Wang         2019-05-24  1619  
feebcaeac79ad8 Jason Wang         2019-05-24  1620  	mutex_lock(&vq->mutex);
feebcaeac79ad8 Jason Wang         2019-05-24  1621  
feebcaeac79ad8 Jason Wang         2019-05-24  1622  	switch (ioctl) {
feebcaeac79ad8 Jason Wang         2019-05-24  1623  	case VHOST_SET_VRING_NUM:
feebcaeac79ad8 Jason Wang         2019-05-24  1624  		r = vhost_vring_set_num(d, vq, argp);
feebcaeac79ad8 Jason Wang         2019-05-24  1625  		break;
feebcaeac79ad8 Jason Wang         2019-05-24  1626  	case VHOST_SET_VRING_ADDR:
feebcaeac79ad8 Jason Wang         2019-05-24  1627  		r = vhost_vring_set_addr(d, vq, argp);
feebcaeac79ad8 Jason Wang         2019-05-24  1628  		break;
feebcaeac79ad8 Jason Wang         2019-05-24  1629  	default:
feebcaeac79ad8 Jason Wang         2019-05-24  1630  		BUG();
feebcaeac79ad8 Jason Wang         2019-05-24  1631  	}
feebcaeac79ad8 Jason Wang         2019-05-24  1632  
feebcaeac79ad8 Jason Wang         2019-05-24  1633  	mutex_unlock(&vq->mutex);
feebcaeac79ad8 Jason Wang         2019-05-24  1634  
feebcaeac79ad8 Jason Wang         2019-05-24  1635  	return r;
feebcaeac79ad8 Jason Wang         2019-05-24  1636  }
26b36604523f4a Sonny Rao          2018-03-14  1637  long vhost_vring_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1638  {
cecb46f194460d Al Viro            2012-08-27  1639  	struct file *eventfp, *filep = NULL;
cecb46f194460d Al Viro            2012-08-27  1640  	bool pollstart = false, pollstop = false;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1641  	struct eventfd_ctx *ctx = NULL;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1642  	struct vhost_virtqueue *vq;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1643  	struct vhost_vring_state s;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1644  	struct vhost_vring_file f;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1645  	u32 idx;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1646  	long r;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1647  
8e355b19cf9c52 Mike Christie      2023-06-26  1648  	r = vhost_get_vq_from_user(d, argp, &vq, &idx);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1649  	if (r < 0)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1650  		return r;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1651  
feebcaeac79ad8 Jason Wang         2019-05-24  1652  	if (ioctl == VHOST_SET_VRING_NUM ||
feebcaeac79ad8 Jason Wang         2019-05-24  1653  	    ioctl == VHOST_SET_VRING_ADDR) {
feebcaeac79ad8 Jason Wang         2019-05-24 @1654  		return vhost_vring_set_num_addr(d, vq, ioctl, argp);
feebcaeac79ad8 Jason Wang         2019-05-24  1655  	}
feebcaeac79ad8 Jason Wang         2019-05-24  1656  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1657  	mutex_lock(&vq->mutex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1658  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1659  	switch (ioctl) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1660  	case VHOST_SET_VRING_BASE:
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1661  		/* Moving base with an active backend?
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1662  		 * You don't want to do that. */
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1663  		if (vq->private_data) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1664  			r = -EBUSY;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1665  			break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1666  		}
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1667  		if (copy_from_user(&s, argp, sizeof s)) {
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1668  			r = -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1669  			break;
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1670  		}
55d8122f5cd62d Shannon Nelson     2023-04-24  1671  		if (vhost_has_feature(vq, VIRTIO_F_RING_PACKED)) {
55d8122f5cd62d Shannon Nelson     2023-04-24  1672  			vq->last_avail_idx = s.num & 0xffff;
55d8122f5cd62d Shannon Nelson     2023-04-24  1673  			vq->last_used_idx = (s.num >> 16) & 0xffff;
55d8122f5cd62d Shannon Nelson     2023-04-24  1674  		} else {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1675  			if (s.num > 0xffff) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1676  				r = -EINVAL;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1677  				break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1678  			}
8d65843c44269c Jason Wang         2017-07-27  1679  			vq->last_avail_idx = s.num;
55d8122f5cd62d Shannon Nelson     2023-04-24  1680  		}
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1681  		/* Forget the cached index value. */
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1682  		vq->avail_idx = vq->last_avail_idx;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1683  		break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1684  	case VHOST_GET_VRING_BASE:
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14 @1685  		s.index = idx;
55d8122f5cd62d Shannon Nelson     2023-04-24  1686  		if (vhost_has_feature(vq, VIRTIO_F_RING_PACKED))
55d8122f5cd62d Shannon Nelson     2023-04-24  1687  			s.num = (u32)vq->last_avail_idx | ((u32)vq->last_used_idx << 16);
55d8122f5cd62d Shannon Nelson     2023-04-24  1688  		else
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1689  			s.num = vq->last_avail_idx;
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1690  		if (copy_to_user(argp, &s, sizeof s))
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1691  			r = -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1692  		break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1693  	case VHOST_SET_VRING_KICK:
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1694  		if (copy_from_user(&f, argp, sizeof f)) {
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1695  			r = -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1696  			break;
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1697  		}
e0136c16fae95d Zhu Lingshan       2020-06-05  1698  		eventfp = f.fd == VHOST_FILE_UNBIND ? NULL : eventfd_fget(f.fd);
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1699  		if (IS_ERR(eventfp)) {
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1700  			r = PTR_ERR(eventfp);
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1701  			break;
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1702  		}
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1703  		if (eventfp != vq->kick) {
cecb46f194460d Al Viro            2012-08-27  1704  			pollstop = (filep = vq->kick) != NULL;
cecb46f194460d Al Viro            2012-08-27  1705  			pollstart = (vq->kick = eventfp) != NULL;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1706  		} else
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1707  			filep = eventfp;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1708  		break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1709  	case VHOST_SET_VRING_CALL:
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1710  		if (copy_from_user(&f, argp, sizeof f)) {
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1711  			r = -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1712  			break;
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1713  		}
e0136c16fae95d Zhu Lingshan       2020-06-05  1714  		ctx = f.fd == VHOST_FILE_UNBIND ? NULL : eventfd_ctx_fdget(f.fd);
e050c7d93f4adb Eric Biggers       2018-01-06  1715  		if (IS_ERR(ctx)) {
e050c7d93f4adb Eric Biggers       2018-01-06  1716  			r = PTR_ERR(ctx);
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1717  			break;
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1718  		}
265a0ad8731dc0 Zhu Lingshan       2020-07-31  1719  
265a0ad8731dc0 Zhu Lingshan       2020-07-31  1720  		swap(ctx, vq->call_ctx.ctx);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1721  		break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1722  	case VHOST_SET_VRING_ERR:
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1723  		if (copy_from_user(&f, argp, sizeof f)) {
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1724  			r = -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1725  			break;
7ad9c9d2704854 Takuya Yoshikawa   2010-05-27  1726  		}
e0136c16fae95d Zhu Lingshan       2020-06-05  1727  		ctx = f.fd == VHOST_FILE_UNBIND ? NULL : eventfd_ctx_fdget(f.fd);
09f332a589232f Eric Biggers       2018-01-06  1728  		if (IS_ERR(ctx)) {
09f332a589232f Eric Biggers       2018-01-06  1729  			r = PTR_ERR(ctx);
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1730  			break;
535297a6ae4c3b Michael S. Tsirkin 2010-03-17  1731  		}
09f332a589232f Eric Biggers       2018-01-06  1732  		swap(ctx, vq->error_ctx);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1733  		break;
2751c9882b9472 Greg Kurz          2015-04-24  1734  	case VHOST_SET_VRING_ENDIAN:
2751c9882b9472 Greg Kurz          2015-04-24  1735  		r = vhost_set_vring_endian(vq, argp);
2751c9882b9472 Greg Kurz          2015-04-24  1736  		break;
2751c9882b9472 Greg Kurz          2015-04-24  1737  	case VHOST_GET_VRING_ENDIAN:
2751c9882b9472 Greg Kurz          2015-04-24  1738  		r = vhost_get_vring_endian(vq, idx, argp);
2751c9882b9472 Greg Kurz          2015-04-24  1739  		break;
03088137246065 Jason Wang         2016-03-04  1740  	case VHOST_SET_VRING_BUSYLOOP_TIMEOUT:
03088137246065 Jason Wang         2016-03-04  1741  		if (copy_from_user(&s, argp, sizeof(s))) {
03088137246065 Jason Wang         2016-03-04  1742  			r = -EFAULT;
03088137246065 Jason Wang         2016-03-04  1743  			break;
03088137246065 Jason Wang         2016-03-04  1744  		}
03088137246065 Jason Wang         2016-03-04  1745  		vq->busyloop_timeout = s.num;
03088137246065 Jason Wang         2016-03-04  1746  		break;
03088137246065 Jason Wang         2016-03-04  1747  	case VHOST_GET_VRING_BUSYLOOP_TIMEOUT:
03088137246065 Jason Wang         2016-03-04  1748  		s.index = idx;
03088137246065 Jason Wang         2016-03-04  1749  		s.num = vq->busyloop_timeout;
03088137246065 Jason Wang         2016-03-04  1750  		if (copy_to_user(argp, &s, sizeof(s)))
03088137246065 Jason Wang         2016-03-04  1751  			r = -EFAULT;
03088137246065 Jason Wang         2016-03-04  1752  		break;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1753  	default:
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1754  		r = -ENOIOCTLCMD;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1755  	}
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1756  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1757  	if (pollstop && vq->handle_kick)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1758  		vhost_poll_stop(&vq->poll);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1759  
e050c7d93f4adb Eric Biggers       2018-01-06  1760  	if (!IS_ERR_OR_NULL(ctx))
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1761  		eventfd_ctx_put(ctx);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1762  	if (filep)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1763  		fput(filep);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1764  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1765  	if (pollstart && vq->handle_kick)
2b8b328b61c799 Jason Wang         2013-01-28  1766  		r = vhost_poll_start(&vq->poll, vq->kick);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1767  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1768  	mutex_unlock(&vq->mutex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1769  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1770  	if (pollstop && vq->handle_kick)
b2ffa407ed5dd9 Mike Christie      2022-05-17  1771  		vhost_dev_flush(vq->poll.dev);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1772  	return r;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1773  }
6ac1afbf6132df Asias He           2013-05-06  1774  EXPORT_SYMBOL_GPL(vhost_vring_ioctl);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1775  

:::::: The code at line 1654 was first introduced by commit
:::::: feebcaeac79ad86fb289ef55fa92f4a97ab8314e vhost: factor out setting vring addr and num

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
