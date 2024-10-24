Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229F170A27
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810832; cv=none; b=OniNWWom9X/WK5luNE7O5zSrp1hJhojaehPaLDFTOsDe0Fh+cQQYkfYK3LhVLtIr62yjHjMk6YGZ6KdDO2Ctb+ktU0FSKEg+5gRK1RjkG6srNKwnaR/XMKsV1BHkoTAuprjz/7Ki6ICPCsCP1SVeubfhfyJtNOR3c56pEEpFQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810832; c=relaxed/simple;
	bh=aoxMAEoC9rwsM/NE+eyqKNpuWjJIiuKpsklqsrJoGnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwpXjB/4xocPRlPACTvuD3RorYI/wJsVaGdmNKeCpl72UKsLNtLGEX+ggFe1jEmOGPGsngyn1EJfflXY4bU+L+31z/cB3DkIgFW0cuJa+bcKp9pqFi2i0e9r92xi3q18ds7mol4Luu2+f5DjvNIi3wzYxkifRK7Z4DO+HfNUhps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ60ODK9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ60ODK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729810829; x=1761346829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aoxMAEoC9rwsM/NE+eyqKNpuWjJIiuKpsklqsrJoGnU=;
  b=aZ60ODK9b/ICHa3swIbJkLZkc2m4jFpWYnr2u5Xt1GEvgOsmotsqJ98w
   klAvh3vh8PseJ4tiR64hUieQ/CS9+wLMKhhRna1CY4dAEgv8/nCu2c0hg
   0rBoyUKNeDvcfPPul8P5za9bmt4i+jq0ua60jUZsYHiBqHynceopHF0iz
   5O3ot2U6zcmZkRSfYsp/QbXo5AFdrgVdOvelEr4OnOxgk2lvLnx+8fxOj
   7bi3T4yhyNY4lBRDd0kd4RPodzAVc8nnhBc9Ky+IsxxonCsPFa+O07WSi
   5X6WKbJnRrOUMaT+jFT4TmqgDFIbeeJUJMSCfBPTf5ucZ8aFOF6145jsg
   w==;
X-CSE-ConnectionGUID: 49vLwbPESaSg/eAkTazbSA==
X-CSE-MsgGUID: dJZWLlr7RlqVVz652UTLqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29331385"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29331385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: v6e2bnL6RXeBfIGbwlq2vQ==
X-CSE-MsgGUID: dJdmfR2SRyeBuzKd715Lgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85282304"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 16:00:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t46oa-000XFZ-17;
	Thu, 24 Oct 2024 23:00:24 +0000
Date: Fri, 25 Oct 2024 06:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: dvbdev: Avoid using uninitialized ret in
 dvb_register_device()
Message-ID: <202410250612.76ayydUl-lkp@intel.com>
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
In-Reply-To: <20241021-dvbdev-fix-uninitialized-return-v1-1-a704945f20e5@kernel.org>
References: <20241021-dvbdev-fix-uninitialized-return-v1-1-a704945f20e5@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: patches@lists.linux.dev
CC: kernel test robot <lkp@intel.com>
CC: Dan Carpenter <error27@gmail.com>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ba9cf6b430433e57bfc8072364e944b7c0eca2a4]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/media-dvbdev-Avoid-using-uninitialized-ret-in-dvb_register_device/20241022-000519
base:   ba9cf6b430433e57bfc8072364e944b7c0eca2a4
patch link:    https://lore.kernel.org/r/20241021-dvbdev-fix-uninitialized-return-v1-1-a704945f20e5%40kernel.org
patch subject: [PATCH] media: dvbdev: Avoid using uninitialized ret in dvb_register_device()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241025 (https://download.01.org/0day-ci/archive/20241025/202410250612.76ayydUl-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250612.76ayydUl-lkp@intel.com/

smatch warnings:
drivers/media/dvb-core/dvbdev.c:600 dvb_register_device() warn: inconsistent returns 'global &minor_rwsem'.

vim +600 drivers/media/dvb-core/dvbdev.c

8211b187ec6461 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-08-21  453  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  454  int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
6bbf7a855d200d drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2017-09-19  455  			const struct dvb_device *template, void *priv,
6bbf7a855d200d drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2017-09-19  456  			enum dvb_device_type type, int demux_sink_pads)
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  457  {
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  458  	struct dvb_device *dvbdev;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  459  	struct file_operations *dvbdevfops = NULL;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  460  	struct dvbdevfops_node *node = NULL, *new_node = NULL;
5f553388b06532 drivers/media/dvb/dvb-core/dvbdev.c Kay Sievers           2007-08-15  461  	struct device *clsdev;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  462  	int minor;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  463  	int id, ret;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  464  
c278850206fd9d drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-03-10  465  	mutex_lock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  466  
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  467  	id = dvbdev_get_free_id(adap, type);
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  468  	if (id < 0) {
1e4baed379a2bf drivers/media/dvb/dvb-core/dvbdev.c Ingo Molnar           2006-01-15  469  		mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  470  		*pdvbdev = NULL;
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  471  		pr_err("%s: couldn't find free device id\n", __func__);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  472  		return -ENFILE;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  473  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  474  
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  475  	*pdvbdev = dvbdev = kzalloc(sizeof(*dvbdev), GFP_KERNEL);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  476  	if (!dvbdev) {
1e4baed379a2bf drivers/media/dvb/dvb-core/dvbdev.c Ingo Molnar           2006-01-15  477  		mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  478  		return -ENOMEM;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  479  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  480  
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  481  	/*
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  482  	 * When a device of the same type is probe()d more than once,
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  483  	 * the first allocated fops are used. This prevents memory leaks
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  484  	 * that can occur when the same device is probe()d repeatedly.
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  485  	 */
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  486  	list_for_each_entry(node, &dvbdevfops_list, list_head) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  487  		if (node->fops->owner == adap->module &&
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  488  		    node->type == type && node->template == template) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  489  			dvbdevfops = node->fops;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  490  			break;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  491  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  492  	}
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  493  
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  494  	if (!dvbdevfops) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  495  		dvbdevfops = kmemdup(template->fops, sizeof(*dvbdevfops), GFP_KERNEL);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  496  		if (!dvbdevfops) {
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  497  			kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  498  			*pdvbdev = NULL;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  499  			mutex_unlock(&dvbdev_register_lock);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  500  			return -ENOMEM;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  501  		}
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  502  
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  503  		new_node = kzalloc(sizeof(*new_node), GFP_KERNEL);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  504  		if (!new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  505  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  506  			kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  507  			*pdvbdev = NULL;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  508  			mutex_unlock(&dvbdev_register_lock);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  509  			return -ENOMEM;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  510  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  511  
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  512  		new_node->fops = dvbdevfops;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  513  		new_node->type = type;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  514  		new_node->template = template;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  515  		list_add_tail(&new_node->list_head, &dvbdevfops_list);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  516  	}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  517  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  518  	memcpy(dvbdev, template, sizeof(struct dvb_device));
3a664569b71b0a drivers/media/dvb-core/dvbdev.c     Lin Ma                2022-11-28  519  	kref_init(&dvbdev->ref);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  520  	dvbdev->type = type;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  521  	dvbdev->id = id;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  522  	dvbdev->adapter = adap;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  523  	dvbdev->priv = priv;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  524  	dvbdev->fops = dvbdevfops;
ca5be9cd051662 drivers/media/dvb/dvb-core/dvbdev.c Markus Rechberger     2007-04-14  525  	init_waitqueue_head(&dvbdev->wait_queue);
784e29d2031b53 drivers/media/dvb/dvb-core/dvbdev.c Jan Engelhardt        2009-01-11  526  	dvbdevfops->owner = adap->module;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  527  	list_add_tail(&dvbdev->list_head, &adap->device_list);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  528  	down_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  529  #ifdef CONFIG_DVB_DYNAMIC_MINORS
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  530  	for (minor = 0; minor < MAX_DVB_MINORS; minor++)
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  531  		if (!dvb_minors[minor])
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  532  			break;
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  533  	if (minor >= MAX_DVB_MINORS) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  534  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  535  			list_del(&new_node->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  536  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  537  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  538  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  539  		list_del(&dvbdev->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  540  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  541  		*pdvbdev = NULL;
82163edcdfa4eb drivers/media/dvb/dvb-core/dvbdev.c Santosh Nayak         2012-06-23  542  		up_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  543  		mutex_unlock(&dvbdev_register_lock);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  544  		return -EINVAL;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  545  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  546  #else
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  547  	minor = nums2minor(adap->num, type, id);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  548  	if (minor >= MAX_DVB_MINORS) {
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  549  		dvb_media_device_free(dvbdev);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  550  		list_del(&dvbdev->list_head);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  551  		kfree(dvbdev);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  552  		*pdvbdev = NULL;
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  553  		mutex_unlock(&dvbdev_register_lock);
922fbcc41a2134 drivers/media/dvb-core/dvbdev.c     Nathan Chancellor     2024-10-21  554  		return -EINVAL;
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  555  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  556  #endif
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  557  	dvbdev->minor = minor;
0fc044b2b5e2d0 drivers/media/dvb-core/dvbdev.c     Lin Ma                2022-08-07  558  	dvb_minors[minor] = dvb_device_get(dvbdev);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  559  	up_write(&minor_rwsem);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  560  	ret = dvb_register_media_device(dvbdev, type, minor, demux_sink_pads);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  561  	if (ret) {
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  562  		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  563  		       __func__);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  564  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  565  			list_del(&new_node->list_head);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  566  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  567  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  568  		}
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  569  		dvb_media_device_free(dvbdev);
1fec2ecc252301 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2021-06-09  570  		list_del(&dvbdev->list_head);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  571  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  572  		*pdvbdev = NULL;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  573  		mutex_unlock(&dvbdev_register_lock);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  574  		return ret;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  575  	}
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  576  
a9b12619f7b6f1 drivers/media/dvb/dvb-core/dvbdev.c Greg Kroah-Hartman    2008-07-21  577  	clsdev = device_create(dvb_class, adap->device,
b7496780e80006 drivers/media/dvb/dvb-core/dvbdev.c Hans Verkuil          2008-11-03  578  			       MKDEV(DVB_MAJOR, minor),
a5f4c0ce682efa drivers/media/dvb/dvb-core/dvbdev.c Kay Sievers           2008-10-27  579  			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  580  	if (IS_ERR(clsdev)) {
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  581  		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
46b4f7c176a2dd drivers/media/dvb/dvb-core/dvbdev.c Harvey Harrison       2008-04-08  582  		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  583  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  584  			list_del(&new_node->list_head);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  585  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  586  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  587  		}
167faadfcf9339 drivers/media/dvb-core/dvbdev.c     Dinghao Liu           2020-08-24  588  		dvb_media_device_free(dvbdev);
1fec2ecc252301 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2021-06-09  589  		list_del(&dvbdev->list_head);
167faadfcf9339 drivers/media/dvb-core/dvbdev.c     Dinghao Liu           2020-08-24  590  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  591  		*pdvbdev = NULL;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  592  		mutex_unlock(&dvbdev_register_lock);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  593  		return PTR_ERR(clsdev);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  594  	}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  595  
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  596  	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  597  		adap->num, dnames[type], id, minor, minor);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  598  
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  599  	mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16 @600  	return 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  601  }
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  602  EXPORT_SYMBOL(dvb_register_device);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
