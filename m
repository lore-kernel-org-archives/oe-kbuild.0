Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4E4E8DF9
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949975; cv=none; b=l10n2Xgy6khejVkJNWu3E4Q6rIKXDZpzx2LOlyocMsosc58cacmOE2qOJuPb6NUGJocb9/fOBV9XeH8V1OgYKu+OYq0ZSRnj47N7HK6gjDrgvZ6wwnr/cxbq3Dzx2QOJU8lmbYj44mceyJqxbRh0p9BHuysYXTCoxgP2qwd2KSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949975; c=relaxed/simple;
	bh=9E2W1JEZB814gMmSK+IcuZqD62KdOrGZziC3gfnSn4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Aoq7y3Ii5zefuurD4ExAyNC7+Ze2BMhSjGoRpNj52x2EKjamwWTFIhC6RihMTRmXUmKEL7QVZDQgKeajZ42ZCKs+yFXKmFuRgOcU9YFpSRZdrKiggmd++zlf7LSvgMi6lEfcd0HsikEr39dKLGmBK9dHaG66z3IKnGQwh6Br3Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDYGF+bx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDYGF+bx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c20ce3c118aso960655066b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Sep 2026 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788949972; x=1789554772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvMuTTBW9YU4ijC51bqyFbYjUHG0eU/fPxWV4VgUGIA=;
        b=bDYGF+bxDc2Rcj7PHoGjOAeByNIBfndFpGuuI55vcSDD85kVNX0tq0cmey3WUJzlxz
         VCaQYH++rzDaucKM4qXyMxpvE82zXJhRgenHyLZSTQtbesk8kICs4pLq02i+rpJcxqHY
         AlpKzyUn/6GpcLigyEy9j1lGofuMc0BI6Ha/dVAtdNCJzTRw5AAi5M4/7iRfKosp0qPo
         zBj5SZ6Ce6uWHLb5yBQOCteH4vVHV/2UtSLTihiWZIU85c6H5MQt7ggri8hd21q8H4pT
         xnaZHbcwvndrS/ovquX0gQtyCN1CgAXE14Eu+J8TOhNgISKWyO9UAk71T7zCwkrmcPkv
         GD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949972; x=1789554772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvMuTTBW9YU4ijC51bqyFbYjUHG0eU/fPxWV4VgUGIA=;
        b=I06LaK6nC3CqxY8ButnxhY/+Lq6nWaikmbe/LMR9h+I7IGX1PTbIGbUSM+jeNWLjmd
         RMhS1Exa4zu5qEzLLdGeSBEJ9kWQPU7d/N1vPtPEVi2QM8ruaXkcvcOcyebRMCU8BHKQ
         RA5XhMymPN++KOSKUGdk+PcZ3q6NnJJ5YljXZZ0HUsvmv5WP07EcL5aoXVql/moLmTx3
         +zBmKgv3vIDCFWNVwcmMKF8cP6BgHydXxausGIy+Q9bRJlB4VsxTJLzAaNX2O7uq6c65
         x52KnhfKRoXgctXeREgi0g1BRYL2U/3RIXl47S8l6XtL0UF0s3njoQoGkLUze/ziZf60
         JdNQ==
X-Gm-Message-State: AFuF++kkAQjAyliVs7HMOAIIWQ/7nRhzJ4eztcIWQeWZ4aHSov2hO6AC
	nsJv8u1E+gZd1UHAzdnH8fcrocnVYX3yptWOnwLA6bI/7fAwErSpai7RLhsa1Yg6ZjXtXQ==
X-Gm-Gg: AYBFou3w9V0UhITXUZU0/rdQhLjKbY+b2eTfSh4D+o3Khjf7jqrWRNPFbZxe2ee/JPK
	R6k6fyfQiefrJx17IUIMGndmmvjuccSU9b2N2x85Q8EbH+TFIIqfcMYuA/zc4KtDjqZGqlTHFsW
	0A+N47+rd+mwkDZtGav0w1WLRKBzycjFzOZWMuLiPulPNkvCaXULZJiHegYKCeQekY8WC4XeVKP
	8txpJDE7VsrWPNeedEKvO0dy5YT+megVe13FV/2s6OL47r+J7sOm5yIOXVIfp9vgQQq9WbP0wcJ
	7Xfe/+p1Hqjr428uJarxY9uQ5sxxbvLBEmpaFDYalx0CRNOL2TTwOsySxdH6fmlVvTIwK/es0Xj
	pjmTx8mX7liEjw9V+qpFqm47lQ0G55kttVjcvBvYvlVZvW4tQ0hOwwuj0nlcFtQg0IeQUPZn0aX
	QsWDynjmFJdzFAvytvmt6pZK9H0VPOXvR2+4v2Upa2/F6CX62L6Zo6YOoOd6RClHICcKA=
X-Received: by 2002:a17:906:7953:b0:c25:f7dc:2d6 with SMTP id a640c23a62f3a-c25f7dc096cmr1512888266b.23.1788949971925;
        Wed, 09 Sep 2026 03:32:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293eaf1ae8sm14313766b.40.2026.09.09.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:32:51 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:32:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jia Jia <physicalmtea@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
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
In-Reply-To: <20260810130336.138457-1-physicalmtea@gmail.com>
Message-ID: <20260909103247.AL_ds3v-5CJX7fKp5RSFYfn-avtiaBh71pVd2EV-mAk@z>

Hi Jia,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Jia/vhost-coalesce-and-retry-IOTLB-miss-messages/20260810-210336
base:   v7.2-rc6
patch link:    https://lore.kernel.org/r/20260810130336.138457-1-physicalmtea%40gmail.com
patch subject: [RFC PATCH v2] vhost: coalesce and retry IOTLB miss messages
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
                                                               ^^^^^^^^^^^^^^^^^^^^^^^

This is supposed to return -EFAULT (-14) as a signed long but because
size is a u32 then it actually returns a positive value near U32_MAX.

e05ac0fdb960d9 Jia Jia    2026-08-10  1934  	}
e05ac0fdb960d9 Jia Jia    2026-08-10  1935  
6b1e6cc7855b09 Jason Wang 2016-06-23  1936  	if (node) {
429711aec282c4 Jason Wang 2018-08-06  1937  		struct vhost_iotlb_msg *msg;
429711aec282c4 Jason Wang 2018-08-06  1938  		void *start = &node->msg;
429711aec282c4 Jason Wang 2018-08-06  1939  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

