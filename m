Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E72194C6A
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733818806; cv=none; b=eow9sUQIyuE2+Lehki2WJur191mIV12N2M8UH5KfZhHDTht118oCMY9OkVLFVCGIZ4Uz3XfVQt7njuyVeXcnNEivy7IPrA+KFSw8fEID+qdntkv7C21xTkmwgd/SHJz6rwIZxylmf6Gf1lUMQkLO1A2uD8tGpDYCoMegI8S2i7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733818806; c=relaxed/simple;
	bh=wGqrlTAFmnEtPpcAJYG1ns+IKPo4HkHGJIZtkTBIZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyjvNpp3Gku1nAQYjlMK7JhinIULKXgaNtL+1oLZOR+SfR+dWuoN79jfW5wXAVIr08hfXIbVwCQgZuVMviWzC1fTT+2bx9KT2lFIHttabL49E6Obsb+wxs7o9ty7Bmtr040aUwK6ponkUY3Vu6N0i84ft5GTtn7ikMkfX+NCyq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmCFx2Qw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmCFx2Qw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733818805; x=1765354805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGqrlTAFmnEtPpcAJYG1ns+IKPo4HkHGJIZtkTBIZx0=;
  b=VmCFx2QwB82A6nsaUxiH74RQSSPNxa7or97/feNoMeMgRT/vJis85MIM
   GODQoRXJfEkQiS9TTLmtoeUCCYqgXrzRjp4agjwancsQYj5pT/IH4+OVD
   0zAFusDC7bmQG4+ErWlk44254EEh7o+f7JGs3eO5brhxS7kfJR0GAw3k+
   l32J6HDZXq+ANnspHQUjJZmsS4WP8i0s19YAANyeDyAFSLvrOx6lBuA/p
   ZH5viyP7OJFFxgPdSWZQZahmD2QtS8H4mzpbkL7buxt3HX/NwWvVatCeN
   nA8xsY11rykQ6UDx1V04VdgJC5J154dJZ3YA31AiOUZjX3RnqkEgSSNML
   w==;
X-CSE-ConnectionGUID: dVxue/5mRyqDU2WvsMLC6A==
X-CSE-MsgGUID: mxktf9I2TFakMCnukZbR8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33486201"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="33486201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 00:20:04 -0800
X-CSE-ConnectionGUID: snBFwrGmQAKZAFLRgzUEnw==
X-CSE-MsgGUID: LpLddbViQwedimIc84GRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95782569"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2024 00:20:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKvTM-0005HD-27;
	Tue, 10 Dec 2024 08:20:00 +0000
Date: Tue, 10 Dec 2024 16:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/virtio/virtio_mmio.c:526 vm_find_vqs() warn: 'irq' from
 request_irq() not released on lines: 522.
Message-ID: <202412101647.WsCQufot-lkp@intel.com>
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
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: sparc-randconfig-r073-20241209 (https://download.01.org/0day-ci/archive/20241210/202412101647.WsCQufot-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412101647.WsCQufot-lkp@intel.com/

smatch warnings:
drivers/virtio/virtio_mmio.c:526 vm_find_vqs() warn: 'irq' from request_irq() not released on lines: 522.
drivers/scsi/myrb.c:3150 DAC960_PD_hw_init() warn: 'cb->io_addr' from __request_region() not released on lines: 3130,3137,3143.
drivers/scsi/myrb.c:3316 DAC960_P_hw_init() warn: 'cb->io_addr' from __request_region() not released on lines: 3296,3303,3309.
drivers/scsi/BusLogic.c:2395 blogic_init() warn: 'myadapter->io_addr' from __request_region() not released on lines: 2395.
drivers/scsi/BusLogic.c:2395 blogic_init() warn: 'probeinfo->io_addr' from __request_region() not released on lines: 2395.

vim +/irq +526 drivers/virtio/virtio_mmio.c

edfd52e6367270 Pawel Moll         2011-10-24  489  
3153234097f6a0 Solomon Tan        2022-04-18  490  static int vm_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
edfd52e6367270 Pawel Moll         2011-10-24  491  		       struct virtqueue *vqs[],
edfd52e6367270 Pawel Moll         2011-10-24  492  		       vq_callback_t *callbacks[],
fb5e31d970ce8b Christoph Hellwig  2017-02-05  493  		       const char * const names[],
f94682dde5ed23 Michael S. Tsirkin 2017-03-06  494  		       const bool *ctx,
fb5e31d970ce8b Christoph Hellwig  2017-02-05  495  		       struct irq_affinity *desc)
edfd52e6367270 Pawel Moll         2011-10-24  496  {
edfd52e6367270 Pawel Moll         2011-10-24  497  	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
5e663f0410fa2f Ihor Matushchak    2019-07-02  498  	int irq = platform_get_irq(vm_dev->pdev, 0);
a229989d975eb9 Wei Wang           2018-12-28  499  	int i, err, queue_idx = 0;
edfd52e6367270 Pawel Moll         2011-10-24  500  
0c35c67412f0ae Markus Elfring     2020-04-05  501  	if (irq < 0)
5e663f0410fa2f Ihor Matushchak    2019-07-02  502  		return irq;
5e663f0410fa2f Ihor Matushchak    2019-07-02  503  
edfd52e6367270 Pawel Moll         2011-10-24  504  	err = request_irq(irq, vm_interrupt, IRQF_SHARED,
edfd52e6367270 Pawel Moll         2011-10-24  505  			dev_name(&vdev->dev), vm_dev);
edfd52e6367270 Pawel Moll         2011-10-24  506  	if (err)
edfd52e6367270 Pawel Moll         2011-10-24  507  		return err;
edfd52e6367270 Pawel Moll         2011-10-24  508  
02213273f72a43 Minghao Xue        2022-06-10  509  	if (of_property_read_bool(vm_dev->pdev->dev.of_node, "wakeup-source"))
02213273f72a43 Minghao Xue        2022-06-10  510  		enable_irq_wake(irq);
02213273f72a43 Minghao Xue        2022-06-10  511  
edfd52e6367270 Pawel Moll         2011-10-24  512  	for (i = 0; i < nvqs; ++i) {
a229989d975eb9 Wei Wang           2018-12-28  513  		if (!names[i]) {
a229989d975eb9 Wei Wang           2018-12-28  514  			vqs[i] = NULL;
a229989d975eb9 Wei Wang           2018-12-28  515  			continue;
a229989d975eb9 Wei Wang           2018-12-28  516  		}
a229989d975eb9 Wei Wang           2018-12-28  517  
a229989d975eb9 Wei Wang           2018-12-28  518  		vqs[i] = vm_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
f94682dde5ed23 Michael S. Tsirkin 2017-03-06  519  				     ctx ? ctx[i] : false);
edfd52e6367270 Pawel Moll         2011-10-24  520  		if (IS_ERR(vqs[i])) {
edfd52e6367270 Pawel Moll         2011-10-24  521  			vm_del_vqs(vdev);
edfd52e6367270 Pawel Moll         2011-10-24  522  			return PTR_ERR(vqs[i]);
edfd52e6367270 Pawel Moll         2011-10-24  523  		}
edfd52e6367270 Pawel Moll         2011-10-24  524  	}
edfd52e6367270 Pawel Moll         2011-10-24  525  
edfd52e6367270 Pawel Moll         2011-10-24 @526  	return 0;
edfd52e6367270 Pawel Moll         2011-10-24  527  }
edfd52e6367270 Pawel Moll         2011-10-24  528  

:::::: The code at line 526 was first introduced by commit
:::::: edfd52e6367270c90f3fd7cc302b375ffa89f91e virtio: Add platform bus driver for memory mapped virtio device

:::::: TO: Pawel Moll <pawel.moll@arm.com>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
