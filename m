Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC77F48A
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718022222; cv=none; b=ff6fCK2QkL41ImKolUNlZz1K5+LdtcjN59TJ0SCV0ifpxI8bqgJFKi8WcxIYhx8Fcid28CYRjLUp8IyHJsETJo3OGZtaevmPKoAUUIR8egjf9bVJM6/hM2s+i+j0d8EOImC6ExhBbLvMTTpaEfsv7X6CeFqbBs4kLHx0mUzYbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718022222; c=relaxed/simple;
	bh=StCf/fjIqjYK8JG+G36Wd+LflmxT27akvyFiBrPPcsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1rey4U1n4YnzEYn9iH0VpMrMqQRN2TPAqNYikrfd6gMQieb+GKBwcJn4demIzhJiH3g4wbcfe6/QS0cPd1oCDYfbfg+v9HuilbGRqzwMQxujLu8yeOcsj/Y1ACLAlbAlGFY9KgkJAAo50oE7z+I0VSNTN8j8N2D8Qy0l64SHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4L/GgLb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4L/GgLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718022220; x=1749558220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StCf/fjIqjYK8JG+G36Wd+LflmxT27akvyFiBrPPcsM=;
  b=R4L/GgLbosuLS7cbpmdTfcCRpZ7s/RAuhL4Tkgb4JVSAvI4Phi2JyJLk
   dJ+adM+H31CFv9R0ccbUIEk2fqjZmSRvZc6QiMZmYwqzqipHGtyoLLYEg
   hPB5iN2JoJ/c3EJBfdYmKq5dXC9DOSsuzo+pRYyXgRvHQLx6poEnXX76K
   IKQS6z2CiMJ+IzQohUKMjUTSp4dCyx/MVo4TOY2X+Q+RkLtMePFkJDesP
   EJDjAsNDJDeDFg2kvByTXYJUlbNiHtNWfvv/3nn9EkIrSP8qhVcOCWkny
   +DMyrmusAAPf75QYzb2Ho8cYH5552VEvVlXSvq7yjG/KyX4F0hPftlSKy
   w==;
X-CSE-ConnectionGUID: LBFLzuB9QguN5FbO79h+3Q==
X-CSE-MsgGUID: iz9ZsS7MQH69s942LrYVfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14473034"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14473034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:23:39 -0700
X-CSE-ConnectionGUID: aP3GXPdWQ7aJpctveDIBrw==
X-CSE-MsgGUID: HpDuB4uiQzGe8KgKJk2tvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44190202"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jun 2024 05:23:39 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGe3k-00028X-19;
	Mon, 10 Jun 2024 12:23:36 +0000
Date: Mon, 10 Jun 2024 20:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jmondi:imx8mp/media-state/extensible-format 8/8]
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:2397
 rkisp1_params_vb2_buf_init() warn: passing zero to 'PTR_ERR'
Message-ID: <202406102010.Gk3F3QRr-lkp@intel.com>
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
TO: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/media-state/extensible-format
head:   091749220cf4a01bcfc64c9125ab07d632d578fe
commit: 091749220cf4a01bcfc64c9125ab07d632d578fe [8/8] media: rkisp1: Copy and validate parameters buffer
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406102010.Gk3F3QRr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406102010.Gk3F3QRr-lkp@intel.com/

smatch warnings:
drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:2397 rkisp1_params_vb2_buf_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +2397 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c           Jacob Chen   2020-01-08  2381  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2382  static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2383  {
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2384  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2385  	struct rkisp1_params_buffer *params_buf =
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2386  		container_of(vbuf, struct rkisp1_params_buffer, vb);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2387  	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2388  	size_t buf_size = params->metafmt.buffersize;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2389  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2390  	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2391  		params_buf->cfg = NULL;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2392  		return 0;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2393  	}
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2394  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2395  	params_buf->cfg = kvmalloc(buf_size, GFP_KERNEL);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2396  	if (IS_ERR_OR_NULL(params_buf->cfg))
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05 @2397  		return PTR_ERR(params_buf->cfg);
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2398  
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2399  	return 0;
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2400  }
091749220cf4a0 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c Jacopo Mondi 2024-06-05  2401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
