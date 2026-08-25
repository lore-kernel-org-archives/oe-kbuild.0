Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3143D3EEAF2
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650159; cv=none; b=AIv/KLX1abkhU+vo9WDM78ZdzkMIU+vLOylKSIJ5LnINaeY1DcOfv+maIhN4GL+zG3lFG/hvSpsuF6ZzbrpSKguMeD1k+m0iUeOtI0Mut3suQqF/6MuYkbJ40Dc8A8POdHLxPhYXT3qBr9r+O3zDe1vwkMu6QqQWy3biG6FNFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650159; c=relaxed/simple;
	bh=oVApsaOVKoIZuQ5Rj/jo9rDv/fMI7u1U3+H/PSSbaJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b564Sgqr+cDx7mdP1WMauOU26DIcuOM3+O2sixdf2Lkrw+kV0AzbnO+E7lSr/WSritVNMuBiA5Ib5OdkV72Ry/TiK/ZjQ0lfnkpzoZPVQj9GYBgjh+WI8FvfIFXp0cCf5ZKM67kTP5yifVIpU9qSZ1qPcE35N5bcXJYYOOr9OZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDCgzqyT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDCgzqyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787650158; x=1819186158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVApsaOVKoIZuQ5Rj/jo9rDv/fMI7u1U3+H/PSSbaJU=;
  b=fDCgzqyTsSPH3VBf7uSx4/l6yuh3eDmib143lvRDEH6o0Ss+AxLsWhO1
   lEiuv+eKvPzLRKQSxNk5Uw1pFkDKTYiDPHDzuDcur6EXC0Etn/VdbU+lU
   mvCcwgrssU0RwndV6w8RF+/2R8IAJ+1mpvJk2rf1nYmuFlRRHGdc8blar
   yCjPSsxd3+XwR+8lWTbE9NYbAnoNX+okzTooR7ze489GWDxgKb0prjC+f
   2SuRGn4YhnuUgERxfIRQ6nLNJ9uBz1KYx3EIIAzPoc7T4+TSKtVo3q1KN
   KklaCVilPtzLQE8COTtGFLe2d5Nivsbiv5YiMB5u84GpAYTqIueEffZKs
   A==;
X-CSE-ConnectionGUID: LlSlvq46RxylqM7wgXCTaQ==
X-CSE-MsgGUID: fDmyKkl1TI+KeUxMdu666A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98700492"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98700492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:29:17 -0700
X-CSE-ConnectionGUID: k/6ecMVHReuJ11iLZLkX9g==
X-CSE-MsgGUID: wLHseu0YQL2wvUtvs510QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263499773"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2026 02:29:15 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wynSy-000000005Y3-3Kr6;
	Tue, 25 Aug 2026 09:29:12 +0000
Date: Tue, 25 Aug 2026 17:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v2] vhost: coalesce and retry IOTLB miss messages
Message-ID: <202608251701.w0nxG9o0-lkp@intel.com>
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
In-Reply-To: <20260810130336.138457-1-physicalmtea@gmail.com>
References: <20260810130336.138457-1-physicalmtea@gmail.com>
TO: Jia Jia <physicalmtea@gmail.com>

Hi Jia,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.2-rc6]
[cannot apply to mst-vhost/linux-next linus/master v7.2 v7.2-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Jia/vhost-coalesce-and-retry-IOTLB-miss-messages/20260810-210336
base:   v7.2-rc6
patch link:    https://lore.kernel.org/r/20260810130336.138457-1-physicalmtea%40gmail.com
patch subject: [RFC PATCH v2] vhost: coalesce and retry IOTLB miss messages
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260825/202608251701.w0nxG9o0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608251701.w0nxG9o0-lkp@intel.com/

smatch warnings:
drivers/vhost/vhost.c:1933 vhost_chr_read_iter() warn: check sign expansion for '-14'

vim +1933 drivers/vhost/vhost.c

6b1e6cc7855b09 Jason Wang 2016-06-23  1832  
6b1e6cc7855b09 Jason Wang 2016-06-23  1833  ssize_t vhost_chr_read_iter(struct vhost_dev *dev, struct iov_iter *to,
6b1e6cc7855b09 Jason Wang 2016-06-23  1834  			    int noblock)
6b1e6cc7855b09 Jason Wang 2016-06-23  1835  {
6b1e6cc7855b09 Jason Wang 2016-06-23  1836  	DEFINE_WAIT(wait);
e05ac0fdb960d9 Jia Jia    2026-08-10  1837  	union {
e05ac0fdb960d9 Jia Jia    2026-08-10  1838  		struct vhost_msg msg;
e05ac0fdb960d9 Jia Jia    2026-08-10  1839  		struct vhost_msg_v2 msg_v2;
e05ac0fdb960d9 Jia Jia    2026-08-10  1840  	} snapshot;
e05ac0fdb960d9 Jia Jia    2026-08-10  1841  	struct vhost_msg_node *miss_token = NULL;
e05ac0fdb960d9 Jia Jia    2026-08-10  1842  	struct vhost_virtqueue *miss_vq = NULL;
e05ac0fdb960d9 Jia Jia    2026-08-10  1843  	struct vhost_msg_node *node = NULL;
e05ac0fdb960d9 Jia Jia    2026-08-10  1844  	u64 miss_seq = 0;
6b1e6cc7855b09 Jason Wang 2016-06-23  1845  	ssize_t ret = 0;
6b1e6cc7855b09 Jason Wang 2016-06-23  1846  	unsigned size = sizeof(struct vhost_msg);
e05ac0fdb960d9 Jia Jia    2026-08-10  1847  	bool short_buffer = false;
e05ac0fdb960d9 Jia Jia    2026-08-10  1848  	bool wake = false;
6b1e6cc7855b09 Jason Wang 2016-06-23  1849  
6b1e6cc7855b09 Jason Wang 2016-06-23  1850  	if (iov_iter_count(to) < size)
6b1e6cc7855b09 Jason Wang 2016-06-23  1851  		return 0;
6b1e6cc7855b09 Jason Wang 2016-06-23  1852  
6b1e6cc7855b09 Jason Wang 2016-06-23  1853  	while (1) {
6b1e6cc7855b09 Jason Wang 2016-06-23  1854  		if (!noblock)
6b1e6cc7855b09 Jason Wang 2016-06-23  1855  			prepare_to_wait(&dev->wait, &wait,
6b1e6cc7855b09 Jason Wang 2016-06-23  1856  					TASK_INTERRUPTIBLE);
6b1e6cc7855b09 Jason Wang 2016-06-23  1857  
e05ac0fdb960d9 Jia Jia    2026-08-10  1858  		spin_lock(&dev->iotlb_lock);
e05ac0fdb960d9 Jia Jia    2026-08-10  1859  		if (!list_empty(&dev->read_list)) {
e05ac0fdb960d9 Jia Jia    2026-08-10  1860  			struct vhost_msg_node *first;
e05ac0fdb960d9 Jia Jia    2026-08-10  1861  
e05ac0fdb960d9 Jia Jia    2026-08-10  1862  			first = list_first_entry(&dev->read_list,
e05ac0fdb960d9 Jia Jia    2026-08-10  1863  						 struct vhost_msg_node, node);
e05ac0fdb960d9 Jia Jia    2026-08-10  1864  			if (first->vq->iotlb_miss_node == first) {
e05ac0fdb960d9 Jia Jia    2026-08-10  1865  				size = first->msg.type == VHOST_IOTLB_MSG_V2 ?
e05ac0fdb960d9 Jia Jia    2026-08-10  1866  				       sizeof(first->msg_v2) : sizeof(first->msg);
e05ac0fdb960d9 Jia Jia    2026-08-10  1867  				if (iov_iter_count(to) < size) {
e05ac0fdb960d9 Jia Jia    2026-08-10  1868  					short_buffer = true;
e05ac0fdb960d9 Jia Jia    2026-08-10  1869  				} else {
e05ac0fdb960d9 Jia Jia    2026-08-10  1870  					memcpy(&snapshot.msg_v2, &first->msg_v2,
e05ac0fdb960d9 Jia Jia    2026-08-10  1871  					       size);
e05ac0fdb960d9 Jia Jia    2026-08-10  1872  					list_move_tail(&first->node,
e05ac0fdb960d9 Jia Jia    2026-08-10  1873  						       &dev->pending_list);
e05ac0fdb960d9 Jia Jia    2026-08-10  1874  					first->vq->iotlb_miss_state =
e05ac0fdb960d9 Jia Jia    2026-08-10  1875  						VHOST_IOTLB_MISS_READING;
e05ac0fdb960d9 Jia Jia    2026-08-10  1876  					miss_vq = first->vq;
e05ac0fdb960d9 Jia Jia    2026-08-10  1877  					miss_token = first;
e05ac0fdb960d9 Jia Jia    2026-08-10  1878  					miss_seq = first->vq->iotlb_miss_seq;
e05ac0fdb960d9 Jia Jia    2026-08-10  1879  				}
e05ac0fdb960d9 Jia Jia    2026-08-10  1880  			} else {
e05ac0fdb960d9 Jia Jia    2026-08-10  1881  				list_del_init(&first->node);
e05ac0fdb960d9 Jia Jia    2026-08-10  1882  				node = first;
e05ac0fdb960d9 Jia Jia    2026-08-10  1883  			}
e05ac0fdb960d9 Jia Jia    2026-08-10  1884  		}
e05ac0fdb960d9 Jia Jia    2026-08-10  1885  		spin_unlock(&dev->iotlb_lock);
e05ac0fdb960d9 Jia Jia    2026-08-10  1886  
e05ac0fdb960d9 Jia Jia    2026-08-10  1887  		if (node || miss_vq || short_buffer)
6b1e6cc7855b09 Jason Wang 2016-06-23  1888  			break;
6b1e6cc7855b09 Jason Wang 2016-06-23  1889  		if (noblock) {
6b1e6cc7855b09 Jason Wang 2016-06-23  1890  			ret = -EAGAIN;
6b1e6cc7855b09 Jason Wang 2016-06-23  1891  			break;
6b1e6cc7855b09 Jason Wang 2016-06-23  1892  		}
6b1e6cc7855b09 Jason Wang 2016-06-23  1893  		if (signal_pending(current)) {
6b1e6cc7855b09 Jason Wang 2016-06-23  1894  			ret = -ERESTARTSYS;
6b1e6cc7855b09 Jason Wang 2016-06-23  1895  			break;
6b1e6cc7855b09 Jason Wang 2016-06-23  1896  		}
6b1e6cc7855b09 Jason Wang 2016-06-23  1897  		if (!dev->iotlb) {
6b1e6cc7855b09 Jason Wang 2016-06-23  1898  			ret = -EBADFD;
6b1e6cc7855b09 Jason Wang 2016-06-23  1899  			break;
6b1e6cc7855b09 Jason Wang 2016-06-23  1900  		}
6b1e6cc7855b09 Jason Wang 2016-06-23  1901  
6b1e6cc7855b09 Jason Wang 2016-06-23  1902  		schedule();
6b1e6cc7855b09 Jason Wang 2016-06-23  1903  	}
6b1e6cc7855b09 Jason Wang 2016-06-23  1904  
6b1e6cc7855b09 Jason Wang 2016-06-23  1905  	if (!noblock)
6b1e6cc7855b09 Jason Wang 2016-06-23  1906  		finish_wait(&dev->wait, &wait);
6b1e6cc7855b09 Jason Wang 2016-06-23  1907  
e05ac0fdb960d9 Jia Jia    2026-08-10  1908  	if (short_buffer)
e05ac0fdb960d9 Jia Jia    2026-08-10  1909  		return 0;
e05ac0fdb960d9 Jia Jia    2026-08-10  1910  
e05ac0fdb960d9 Jia Jia    2026-08-10  1911  	if (miss_vq) {
e05ac0fdb960d9 Jia Jia    2026-08-10  1912  		bool copied = copy_to_iter_full(&snapshot.msg_v2, size, to);
e05ac0fdb960d9 Jia Jia    2026-08-10  1913  
e05ac0fdb960d9 Jia Jia    2026-08-10  1914  		spin_lock(&dev->iotlb_lock);
e05ac0fdb960d9 Jia Jia    2026-08-10  1915  		node = miss_vq->iotlb_miss_node;
e05ac0fdb960d9 Jia Jia    2026-08-10  1916  		if (node == miss_token &&
e05ac0fdb960d9 Jia Jia    2026-08-10  1917  		    miss_vq->iotlb_miss_seq == miss_seq &&
e05ac0fdb960d9 Jia Jia    2026-08-10  1918  		    miss_vq->iotlb_miss_state == VHOST_IOTLB_MISS_READING) {
e05ac0fdb960d9 Jia Jia    2026-08-10  1919  			if (copied) {
e05ac0fdb960d9 Jia Jia    2026-08-10  1920  				miss_vq->iotlb_miss_state =
e05ac0fdb960d9 Jia Jia    2026-08-10  1921  					VHOST_IOTLB_MISS_PENDING;
e05ac0fdb960d9 Jia Jia    2026-08-10  1922  			} else {
e05ac0fdb960d9 Jia Jia    2026-08-10  1923  				list_move_tail(&node->node, &dev->read_list);
e05ac0fdb960d9 Jia Jia    2026-08-10  1924  				miss_vq->iotlb_miss_state = VHOST_IOTLB_MISS_READ;
e05ac0fdb960d9 Jia Jia    2026-08-10  1925  				wake = true;
e05ac0fdb960d9 Jia Jia    2026-08-10  1926  			}
e05ac0fdb960d9 Jia Jia    2026-08-10  1927  		}
e05ac0fdb960d9 Jia Jia    2026-08-10  1928  		spin_unlock(&dev->iotlb_lock);
e05ac0fdb960d9 Jia Jia    2026-08-10  1929  
e05ac0fdb960d9 Jia Jia    2026-08-10  1930  		if (wake)
e05ac0fdb960d9 Jia Jia    2026-08-10  1931  			wake_up_interruptible_poll(&dev->wait,
e05ac0fdb960d9 Jia Jia    2026-08-10  1932  						   EPOLLIN | EPOLLRDNORM);
e05ac0fdb960d9 Jia Jia    2026-08-10 @1933  		return copied ? size : -EFAULT;
e05ac0fdb960d9 Jia Jia    2026-08-10  1934  	}
e05ac0fdb960d9 Jia Jia    2026-08-10  1935  
6b1e6cc7855b09 Jason Wang 2016-06-23  1936  	if (node) {
429711aec282c4 Jason Wang 2018-08-06  1937  		struct vhost_iotlb_msg *msg;
429711aec282c4 Jason Wang 2018-08-06  1938  		void *start = &node->msg;
429711aec282c4 Jason Wang 2018-08-06  1939  
429711aec282c4 Jason Wang 2018-08-06  1940  		switch (node->msg.type) {
429711aec282c4 Jason Wang 2018-08-06  1941  		case VHOST_IOTLB_MSG:
429711aec282c4 Jason Wang 2018-08-06  1942  			size = sizeof(node->msg);
429711aec282c4 Jason Wang 2018-08-06  1943  			msg = &node->msg.iotlb;
429711aec282c4 Jason Wang 2018-08-06  1944  			break;
429711aec282c4 Jason Wang 2018-08-06  1945  		case VHOST_IOTLB_MSG_V2:
429711aec282c4 Jason Wang 2018-08-06  1946  			size = sizeof(node->msg_v2);
429711aec282c4 Jason Wang 2018-08-06  1947  			msg = &node->msg_v2.iotlb;
429711aec282c4 Jason Wang 2018-08-06  1948  			break;
429711aec282c4 Jason Wang 2018-08-06  1949  		default:
429711aec282c4 Jason Wang 2018-08-06  1950  			BUG();
429711aec282c4 Jason Wang 2018-08-06  1951  			break;
429711aec282c4 Jason Wang 2018-08-06  1952  		}
6b1e6cc7855b09 Jason Wang 2016-06-23  1953  
429711aec282c4 Jason Wang 2018-08-06  1954  		ret = copy_to_iter(start, size, to);
429711aec282c4 Jason Wang 2018-08-06  1955  		if (ret != size || msg->type != VHOST_IOTLB_MISS) {
6b1e6cc7855b09 Jason Wang 2016-06-23  1956  			kfree(node);
6b1e6cc7855b09 Jason Wang 2016-06-23  1957  			return ret;
6b1e6cc7855b09 Jason Wang 2016-06-23  1958  		}
6b1e6cc7855b09 Jason Wang 2016-06-23  1959  		vhost_enqueue_msg(dev, &dev->pending_list, node);
6b1e6cc7855b09 Jason Wang 2016-06-23  1960  	}
6b1e6cc7855b09 Jason Wang 2016-06-23  1961  
6b1e6cc7855b09 Jason Wang 2016-06-23  1962  	return ret;
6b1e6cc7855b09 Jason Wang 2016-06-23  1963  }
6b1e6cc7855b09 Jason Wang 2016-06-23  1964  EXPORT_SYMBOL_GPL(vhost_chr_read_iter);
6b1e6cc7855b09 Jason Wang 2016-06-23  1965  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
