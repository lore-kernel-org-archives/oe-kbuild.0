Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D439EA920
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Jul 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143817; cv=none; b=HbOcaqqWdOah/63Tnyj9ilw7OVBszVj44E2td/oTMcSFZwus3IdN1wur6qeKWp8PDDmXattdwLHFuSvXmuAxaBwXCqUNSXoFj242Z+UyRntQpnzJeC0A2Z+R6bWSPjYpCro7thiDHqhXjgG08zxK2luZbsuD5IpyMiEuqnFOK0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143817; c=relaxed/simple;
	bh=LySiqQxseYJVo1bKjA5IfSEPsifFtC7UQyqc88KLpMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbtk4Uk9KJrKttBbo9ri4Gqo8tHm0HwTcNUeYoheUziwtjtMAm7gYmpJV6LoExdUm8ntv9PLR0Rb7sD+irYirdVHW18kEL3hW1xq719bCvd/ecBsndW7gv1miobYv4kperIkjIc75eVsuxnHMX384yCJITDFNIU0xPNvuumGBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5/34QOw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5/34QOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752143816; x=1783679816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LySiqQxseYJVo1bKjA5IfSEPsifFtC7UQyqc88KLpMY=;
  b=B5/34QOwc+2fJ9sHOEMGZc8D57i10YLME1wihNy5dwmiHdaq5I9i90Y7
   Qo4QGFXk/hvYd0uCU30somen/KkhJqvwXx3kl+F8UYj1QX6blV+li61ps
   3917HsrYfGvW4ipNeq6dSOdn+5UbdL9TirxCwapzsnhuBaR7dva9HBu6q
   E2gwE03CfZitADtAEZc8+7srMB8Sf/Ep9UMGpY667bCNcNzc5HJW+/O/H
   XjctuoP02hrd6c91dHCajYRUutyOCeZQh2SkX11e6mTt64GntwWvosOB5
   R1cyyiyMFNUsCuYEbp6zlaURR6/YtVmjgQg6HxeLbzhsvLX8FA9T89Ffl
   A==;
X-CSE-ConnectionGUID: nCzqYfRPTc6JhuLEnQ8wOQ==
X-CSE-MsgGUID: dtvEEjJcQ5KfjgOQdSm3Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71868778"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="71868778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 03:36:55 -0700
X-CSE-ConnectionGUID: voBRBPTiRaW3Zimj0O8mhQ==
X-CSE-MsgGUID: XC4tbDQvTbu6/R1pcb2x8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160358427"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 03:36:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZoe3-0004vT-1c;
	Thu, 10 Jul 2025 10:36:51 +0000
Date: Thu, 10 Jul 2025 18:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 2/2] vhost_net: basic in_order support
Message-ID: <202507101801.ziCi2SjQ-lkp@intel.com>
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
In-Reply-To: <20250708064819.35282-3-jasowang@redhat.com>
References: <20250708064819.35282-3-jasowang@redhat.com>
TO: Jason Wang <jasowang@redhat.com>
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: eperezma@redhat.com
CC: kvm@vger.kernel.org
CC: virtualization@lists.linux.dev
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: jonah.palmer@oracle.com

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Wang/vhost-basic-in-order-support/20250708-145402
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250708064819.35282-3-jasowang%40redhat.com
patch subject: [PATCH net-next 2/2] vhost_net: basic in_order support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101801.ziCi2SjQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507101801.ziCi2SjQ-lkp@intel.com/

New smatch warnings:
drivers/vhost/net.c:1111 get_rx_bufs() error: uninitialized symbol 'd'.

Old smatch warnings:
drivers/vhost/net.c:1108 get_rx_bufs() error: uninitialized symbol 'len'.
drivers/vhost/net.c:1110 get_rx_bufs() error: uninitialized symbol 'len'.

vim +/d +1111 drivers/vhost/net.c

03088137246065 Jason Wang         2016-03-04  1029  
8dd014adfea6f1 David Stevens      2010-07-27  1030  /* This is a multi-buffer version of vhost_get_desc, that works if
8dd014adfea6f1 David Stevens      2010-07-27  1031   *	vq has read descriptors only.
bf0f609d5ad14a Jason Wang         2025-07-08  1032   * @nvq		- the relevant vhost_net virtqueue
8dd014adfea6f1 David Stevens      2010-07-27  1033   * @datalen	- data length we'll be reading
8dd014adfea6f1 David Stevens      2010-07-27  1034   * @iovcount	- returned count of io vectors we fill
8dd014adfea6f1 David Stevens      2010-07-27  1035   * @log		- vhost log
8dd014adfea6f1 David Stevens      2010-07-27  1036   * @log_num	- log offset
94249369e99302 Jason Wang         2011-01-17  1037   * @quota       - headcount quota, 1 for big buffer
8dd014adfea6f1 David Stevens      2010-07-27  1038   *	returns number of buffer heads allocated, negative on error
8dd014adfea6f1 David Stevens      2010-07-27  1039   */
bf0f609d5ad14a Jason Wang         2025-07-08  1040  static int get_rx_bufs(struct vhost_net_virtqueue *nvq,
8dd014adfea6f1 David Stevens      2010-07-27  1041  		       struct vring_used_elem *heads,
bf0f609d5ad14a Jason Wang         2025-07-08  1042  		       u16 *nheads,
8dd014adfea6f1 David Stevens      2010-07-27  1043  		       int datalen,
8dd014adfea6f1 David Stevens      2010-07-27  1044  		       unsigned *iovcount,
8dd014adfea6f1 David Stevens      2010-07-27  1045  		       struct vhost_log *log,
94249369e99302 Jason Wang         2011-01-17  1046  		       unsigned *log_num,
94249369e99302 Jason Wang         2011-01-17  1047  		       unsigned int quota)
8dd014adfea6f1 David Stevens      2010-07-27  1048  {
bf0f609d5ad14a Jason Wang         2025-07-08  1049  	struct vhost_virtqueue *vq = &nvq->vq;
bf0f609d5ad14a Jason Wang         2025-07-08  1050  	bool in_order = vhost_has_feature(vq, VIRTIO_F_IN_ORDER);
8dd014adfea6f1 David Stevens      2010-07-27  1051  	unsigned int out, in;
8dd014adfea6f1 David Stevens      2010-07-27  1052  	int seg = 0;
8dd014adfea6f1 David Stevens      2010-07-27  1053  	int headcount = 0;
8dd014adfea6f1 David Stevens      2010-07-27  1054  	unsigned d;
8dd014adfea6f1 David Stevens      2010-07-27  1055  	int r, nlogs = 0;
8b38694a2dc8b1 Michael S. Tsirkin 2014-10-24  1056  	/* len is always initialized before use since we are always called with
8b38694a2dc8b1 Michael S. Tsirkin 2014-10-24  1057  	 * datalen > 0.
8b38694a2dc8b1 Michael S. Tsirkin 2014-10-24  1058  	 */
3f649ab728cda8 Kees Cook          2020-06-03  1059  	u32 len;
8dd014adfea6f1 David Stevens      2010-07-27  1060  
94249369e99302 Jason Wang         2011-01-17  1061  	while (datalen > 0 && headcount < quota) {
e0e9b406470b8d Jason Wang         2010-09-14  1062  		if (unlikely(seg >= UIO_MAXIOV)) {
8dd014adfea6f1 David Stevens      2010-07-27  1063  			r = -ENOBUFS;
8dd014adfea6f1 David Stevens      2010-07-27  1064  			goto err;
8dd014adfea6f1 David Stevens      2010-07-27  1065  		}
47283bef7ed356 Michael S. Tsirkin 2014-06-05  1066  		r = vhost_get_vq_desc(vq, vq->iov + seg,
8dd014adfea6f1 David Stevens      2010-07-27  1067  				      ARRAY_SIZE(vq->iov) - seg, &out,
8dd014adfea6f1 David Stevens      2010-07-27  1068  				      &in, log, log_num);
a39ee449f96a2c Michael S. Tsirkin 2014-03-27  1069  		if (unlikely(r < 0))
a39ee449f96a2c Michael S. Tsirkin 2014-03-27  1070  			goto err;
a39ee449f96a2c Michael S. Tsirkin 2014-03-27  1071  
a39ee449f96a2c Michael S. Tsirkin 2014-03-27  1072  		d = r;
8dd014adfea6f1 David Stevens      2010-07-27  1073  		if (d == vq->num) {
8dd014adfea6f1 David Stevens      2010-07-27  1074  			r = 0;
8dd014adfea6f1 David Stevens      2010-07-27  1075  			goto err;
8dd014adfea6f1 David Stevens      2010-07-27  1076  		}
8dd014adfea6f1 David Stevens      2010-07-27  1077  		if (unlikely(out || in <= 0)) {
8dd014adfea6f1 David Stevens      2010-07-27  1078  			vq_err(vq, "unexpected descriptor format for RX: "
8dd014adfea6f1 David Stevens      2010-07-27  1079  				"out %d, in %d\n", out, in);
8dd014adfea6f1 David Stevens      2010-07-27  1080  			r = -EINVAL;
8dd014adfea6f1 David Stevens      2010-07-27  1081  			goto err;
8dd014adfea6f1 David Stevens      2010-07-27  1082  		}
8dd014adfea6f1 David Stevens      2010-07-27  1083  		if (unlikely(log)) {
8dd014adfea6f1 David Stevens      2010-07-27  1084  			nlogs += *log_num;
8dd014adfea6f1 David Stevens      2010-07-27  1085  			log += *log_num;
8dd014adfea6f1 David Stevens      2010-07-27  1086  		}
8b38694a2dc8b1 Michael S. Tsirkin 2014-10-24  1087  		len = iov_length(vq->iov + seg, in);
bf0f609d5ad14a Jason Wang         2025-07-08  1088  		if (!in_order) {
bf0f609d5ad14a Jason Wang         2025-07-08  1089  			heads[headcount].id = cpu_to_vhost32(vq, d);
8b38694a2dc8b1 Michael S. Tsirkin 2014-10-24  1090  			heads[headcount].len = cpu_to_vhost32(vq, len);
bf0f609d5ad14a Jason Wang         2025-07-08  1091  		}
8dd014adfea6f1 David Stevens      2010-07-27  1092  		++headcount;
bf0f609d5ad14a Jason Wang         2025-07-08  1093  		datalen -= len;
8dd014adfea6f1 David Stevens      2010-07-27  1094  		seg += in;
8dd014adfea6f1 David Stevens      2010-07-27  1095  	}
bf0f609d5ad14a Jason Wang         2025-07-08  1096  
8dd014adfea6f1 David Stevens      2010-07-27  1097  	*iovcount = seg;
8dd014adfea6f1 David Stevens      2010-07-27  1098  	if (unlikely(log))
8dd014adfea6f1 David Stevens      2010-07-27  1099  		*log_num = nlogs;
d8316f3991d207 Michael S. Tsirkin 2014-03-27  1100  
d8316f3991d207 Michael S. Tsirkin 2014-03-27  1101  	/* Detect overrun */
d8316f3991d207 Michael S. Tsirkin 2014-03-27  1102  	if (unlikely(datalen > 0)) {
d8316f3991d207 Michael S. Tsirkin 2014-03-27  1103  		r = UIO_MAXIOV + 1;
d8316f3991d207 Michael S. Tsirkin 2014-03-27  1104  		goto err;
d8316f3991d207 Michael S. Tsirkin 2014-03-27  1105  	}
bf0f609d5ad14a Jason Wang         2025-07-08  1106  
bf0f609d5ad14a Jason Wang         2025-07-08  1107  	if (!in_order)
bf0f609d5ad14a Jason Wang         2025-07-08  1108  		heads[headcount - 1].len = cpu_to_vhost32(vq, len + datalen);
bf0f609d5ad14a Jason Wang         2025-07-08  1109  	else {
bf0f609d5ad14a Jason Wang         2025-07-08  1110  		heads[0].len = cpu_to_vhost32(vq, len + datalen);
bf0f609d5ad14a Jason Wang         2025-07-08 @1111  		heads[0].id = cpu_to_vhost32(vq, d);
bf0f609d5ad14a Jason Wang         2025-07-08  1112  		nheads[0] = headcount;
bf0f609d5ad14a Jason Wang         2025-07-08  1113  	}
bf0f609d5ad14a Jason Wang         2025-07-08  1114  
8dd014adfea6f1 David Stevens      2010-07-27  1115  	return headcount;
8dd014adfea6f1 David Stevens      2010-07-27  1116  err:
8dd014adfea6f1 David Stevens      2010-07-27  1117  	vhost_discard_vq_desc(vq, headcount);
8dd014adfea6f1 David Stevens      2010-07-27  1118  	return r;
8dd014adfea6f1 David Stevens      2010-07-27  1119  }
8dd014adfea6f1 David Stevens      2010-07-27  1120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
