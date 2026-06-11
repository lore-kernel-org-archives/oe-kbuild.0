Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300F33ADB5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 04:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150416; cv=none; b=VNQaktBcYbj8Y+GxsESRQWHBDTxCQiO3QjZclobe6DDabfvhucG7WYwiy5SGGC0Ya8f8ldelbEuvQhuzRJWZfDjh+WAwH20a87gbQw/KHdhHR9msOZ1e9qKWym0NLJyO2yZjiRPTNIi4lMtzMumbaDuT26zyWlV56XdSxOOLUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150416; c=relaxed/simple;
	bh=9t9KV+to4nhAvHp9YXTGzjhJj7f8jvgkDN09kIu8lb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UmUr5Lr+P+0V127+6xjjzqbhGZ4ZJJCCqjJMYooCNiCljmOsJtpOroMcy1A7Zuh5NkIiAw4mVrQCliTkMBsJ39EziRUHlZVgmlb8b3uIvhpAs2mX/t7pWyo1OijxmlZflfXNsyRiX5S5l83b4HdQyjHFmHMAtx+WtrlkVadIRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLiaUEfJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLiaUEfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781150414; x=1812686414;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9t9KV+to4nhAvHp9YXTGzjhJj7f8jvgkDN09kIu8lb8=;
  b=VLiaUEfJxa+DYXCrNGmFUzhQUI3igyvtaE3zOruMiBuiUXvdSodxBjfa
   9Hv7faUBD20bJ+d2ry9ozniKZKabCkG1NXG/+/Z+jipwxjq7QWlkIzoAA
   V1xktJ41fgMSyeeIfL2cKxnODcTfwwJtmp7dAYNzJryVS8Y/7kioWaRsU
   3H08CFsVOkDVPXPcCdqUXWM1IS/lpJM8mJhXDO5b06bnnhrSlTcBhYCql
   YK9faQlhLy49n1uq/n3Bb08twhwQ41bP0yicKpRyMK8Kb2hdNLzLgLPMm
   mPl/FkPpKWcqSTb7EMciuAq38Mb0++vGhSVcYPwIVIWL30uQwnfTSiaL7
   g==;
X-CSE-ConnectionGUID: W1MeX46+Q+CRf3RJcVLT6w==
X-CSE-MsgGUID: 8cmhjwJXQ5yTI+6jiBzm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99381120"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99381120"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:00:13 -0700
X-CSE-ConnectionGUID: eQTWyNt/Qzas62QtB8YCyw==
X-CSE-MsgGUID: waAfwkbgQ2KfgoGoIsgkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="241936596"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2026 21:00:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXWaP-00000000MJm-0gD6;
	Thu, 11 Jun 2026 04:00:09 +0000
Date: Thu, 11 Jun 2026 12:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] vduse: Add suspend
Message-ID: <202606111115.tKKe1qCE-lkp@intel.com>
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
In-Reply-To: <20260610083452.477759-1-eperezma@redhat.com>
References: <20260610083452.477759-1-eperezma@redhat.com>
TO: "Eugenio Pérez" <eperezma@redhat.com>
TO: "Michael S . Tsirkin" <mst@redhat.com>
CC: virtualization@lists.linux.dev
CC: Jason Wang <jasowang@redhat.com>
CC: Cindy Lu <lulu@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Stefano Garzarella <sgarzare@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: Laurent Vivier <lvivier@redhat.com>
CC: Yongji Xie <xieyongji@bytedance.com>
CC: "Eugenio Pérez" <eperezma@redhat.com>
CC: Maxime Coquelin <mcoqueli@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260609]
[cannot apply to linus/master v7.1-rc7 v7.1-rc6 v7.1-rc5 v7.1-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-Add-suspend/20260610-164534
base:   next-20260609
patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperezma%40redhat.com
patch subject: [PATCH v3] vduse: Add suspend
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com/

smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsistent returns '&vq->kick_lock'.
drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn: inconsistent returns '&dev->rwsem'.

vim +577 drivers/vdpa/vdpa_user/vduse_dev.c

c8a6153b6c59d9 Xie Yongji        2021-08-31  561  
c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_kick(struct vduse_virtqueue *vq)
c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
c8a6153b6c59d9 Xie Yongji        2021-08-31  564  	spin_lock(&vq->kick_lock);
c8a6153b6c59d9 Xie Yongji        2021-08-31  565  	if (!vq->ready)
c8a6153b6c59d9 Xie Yongji        2021-08-31  566  		goto unlock;
c8a6153b6c59d9 Xie Yongji        2021-08-31  567  
9c4307e82fa1dc Eugenio Pérez     2026-06-10  568  	guard(rwsem_read)(&vq->dev->rwsem);
9c4307e82fa1dc Eugenio Pérez     2026-06-10  569  	if (vq->dev->suspended)
9c4307e82fa1dc Eugenio Pérez     2026-06-10  570  		return;
9c4307e82fa1dc Eugenio Pérez     2026-06-10  571  
c8a6153b6c59d9 Xie Yongji        2021-08-31  572  	if (vq->kickfd)
3652117f854819 Christian Brauner 2023-11-22  573  		eventfd_signal(vq->kickfd);
c8a6153b6c59d9 Xie Yongji        2021-08-31  574  	else
c8a6153b6c59d9 Xie Yongji        2021-08-31  575  		vq->kicked = true;
c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
c8a6153b6c59d9 Xie Yongji        2021-08-31 @577  	spin_unlock(&vq->kick_lock);
c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }
c8a6153b6c59d9 Xie Yongji        2021-08-31  579  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
