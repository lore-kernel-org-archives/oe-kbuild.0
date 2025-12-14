Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0782BD024
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765699207; cv=none; b=II6ur2nx8hLFFHojpcLHxB43ZF/UFhGeOaPgFeNQsmKXr09cit31Nn1Ij9bdFnAjklHZS1O+V2VcKx4tYjYjdwB04m5BIuVHLYU0arKtdXejmQaaaOAVupVl1PTGyHdFQUEEodgHnt8gv4wzqAyJDKyPx7tBtZ5qWn/YFBborik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765699207; c=relaxed/simple;
	bh=uUQJqDIx87GZemkI+q8bd4oLhKqHa1pisluBCOAWnsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YK4+8SzCe+8eFZXv0nocSv97JNWMLYVyyVUBX+zKaEMHGJyfCRORZtP1MJFGVV/UycR8IuNouUbI+T/qjBfnXScvaaASCdt7JduqKzuSIrL1v4yz1FnEzmtBoPPxI59gc0vKMxZWYLhyXc26F6Mz4piP26Wv+LnCJcZx/YZka54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyPs/Sez; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyPs/Sez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765699205; x=1797235205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uUQJqDIx87GZemkI+q8bd4oLhKqHa1pisluBCOAWnsc=;
  b=dyPs/SezMODvbDQUv+8hZ2ue3S29aEeR/gE0NsgadQK7+b5sNP4AcMWM
   NsyfxWMQ2CSAFv5IiNGSfDCx5Q2Tjn5RiCz89fgyHK7PqJDx7NDOSw4yG
   Gev4VjuuWX6mCHCKhZPrVeC9hFzzcH6VrEkKl7B0ZUpG+a8ypHZgsOIMa
   B09Sph9LRHTYC3YjkIRB7c0WoITCSHysVMNNSzV5MFzUK7Y3S+incyLyi
   hg4F1oBsBQgXtpyXpLyBBvXOsKqrfAUSZsUg9PxdBtKnu+Gh30SRkHgjk
   8fS7TWfC1Z24RIjIL3OGeljew1FPv784Xe4adkXFt+elH+6T54XqNg6Kj
   Q==;
X-CSE-ConnectionGUID: zBdZJSp8QNiSEqMAriYAGQ==
X-CSE-MsgGUID: qF4d0dH3RKCMnABAS8wE1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="55197636"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="55197636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 00:00:00 -0800
X-CSE-ConnectionGUID: 2JZzR+RmQYqDcdNtnmdOQA==
X-CSE-MsgGUID: TYpcE0jZS1mO1d/yxd9rfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197223732"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 23:59:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUh1H-000000008qL-2lKs;
	Sun, 14 Dec 2025 07:59:55 +0000
Date: Sun, 14 Dec 2025 15:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pci-hyperv.c:2673 pci_devices_present_work()
 error: dereferencing freed memory 'dr' (line 2654)
Message-ID: <202512141520.96MXwe7j-lkp@intel.com>
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
TO: Roman Kisel <romank@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dfb36b2dcb666f116ba314e631bd3bc632c44d1
commit: d684f9b28809b783e8473727fdf14595b36d8fd3 PCI: hv: Get vPCI MSI IRQ domain from DeviceTree
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251214/202512141520.96MXwe7j-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141520.96MXwe7j-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pci-hyperv.c:2673 pci_devices_present_work() error: dereferencing freed memory 'dr' (line 2654)

Old smatch warnings:
drivers/pci/controller/pci-hyperv.c:2313 prepopulate_bars() error: buffer overflow 'hpdev->probed_bar' 6 <= 6

vim +/dr +2673 drivers/pci/controller/pci-hyperv.c

4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2603  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2604  /**
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2605   * pci_devices_present_work() - Handle new list of child devices
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2606   * @work:	Work struct embedded in struct hv_dr_work
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2607   *
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2608   * "Bus Relations" is the Windows term for "children of this
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2609   * bus."  The terminology is preserved here for people trying to
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2610   * debug the interaction between Hyper-V and Linux.  This
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2611   * function is called when the parent partition reports a list
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2612   * of functions that should be observed under this PCI Express
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2613   * port (bus).
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2614   *
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2615   * This function updates the list, and must tolerate being
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2616   * called multiple times with the same information.  The typical
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2617   * number of child devices is one, with very atypical cases
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2618   * involving three or four, so the algorithms used here can be
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2619   * simple and inefficient.
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2620   *
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2621   * It must also treat the omission of a previously observed device as
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2622   * notification that the device no longer exists.
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2623   *
021ad274d7dc31 drivers/pci/host/pci-hyperv.c       Dexuan Cui        2018-03-15  2624   * Note that this function is serialized with hv_eject_device_work(),
021ad274d7dc31 drivers/pci/host/pci-hyperv.c       Dexuan Cui        2018-03-15  2625   * because both are pushed to the ordered workqueue hbus->wq.
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2626   */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2627  static void pci_devices_present_work(struct work_struct *work)
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2628  {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2629  	u32 child_no;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2630  	bool found;
f9ad0f361cf3b5 drivers/pci/controller/pci-hyperv.c Long Li           2020-02-25  2631  	struct hv_pcidev_description *new_desc;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2632  	struct hv_pci_dev *hpdev;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2633  	struct hv_pcibus_device *hbus;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2634  	struct list_head removed;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2635  	struct hv_dr_work *dr_wrk;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2636  	struct hv_dr_state *dr = NULL;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2637  	unsigned long flags;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2638  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2639  	dr_wrk = container_of(work, struct hv_dr_work, wrk);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2640  	hbus = dr_wrk->bus;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2641  	kfree(dr_wrk);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2642  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2643  	INIT_LIST_HEAD(&removed);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2644  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2645  	/* Pull this off the queue and process it if it was the last one. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2646  	spin_lock_irqsave(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2647  	while (!list_empty(&hbus->dr_list)) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2648  		dr = list_first_entry(&hbus->dr_list, struct hv_dr_state,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2649  				      list_entry);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2650  		list_del(&dr->list_entry);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2651  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2652  		/* Throw this away if the list still has stuff in it. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2653  		if (!list_empty(&hbus->dr_list)) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16 @2654  			kfree(dr);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2655  			continue;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2656  		}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2657  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2658  	spin_unlock_irqrestore(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2659  
326dc2e1e59a98 drivers/pci/controller/pci-hyperv.c Long Li           2021-05-12  2660  	if (!dr)
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2661  		return;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2662  
067d6ec7ed5b49 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2023-06-14  2663  	mutex_lock(&hbus->state_lock);
067d6ec7ed5b49 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2023-06-14  2664  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2665  	/* First, mark all existing children as reported missing. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2666  	spin_lock_irqsave(&hbus->device_list_lock, flags);
5b8db8f66e08fa drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2667  	list_for_each_entry(hpdev, &hbus->children, list_entry) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2668  		hpdev->reported_missing = true;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2669  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2670  	spin_unlock_irqrestore(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2671  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2672  	/* Next, add back any reported devices. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16 @2673  	for (child_no = 0; child_no < dr->device_count; child_no++) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2674  		found = false;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2675  		new_desc = &dr->func[child_no];
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2676  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2677  		spin_lock_irqsave(&hbus->device_list_lock, flags);
5b8db8f66e08fa drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2678  		list_for_each_entry(hpdev, &hbus->children, list_entry) {
5b8db8f66e08fa drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2679  			if ((hpdev->desc.win_slot.slot == new_desc->win_slot.slot) &&
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2680  			    (hpdev->desc.v_id == new_desc->v_id) &&
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2681  			    (hpdev->desc.d_id == new_desc->d_id) &&
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2682  			    (hpdev->desc.ser == new_desc->ser)) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2683  				hpdev->reported_missing = false;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2684  				found = true;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2685  			}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2686  		}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2687  		spin_unlock_irqrestore(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2688  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2689  		if (!found) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2690  			hpdev = new_pcichild_device(hbus, new_desc);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2691  			if (!hpdev)
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2692  				dev_err(&hbus->hdev->device,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2693  					"couldn't record a child device.\n");
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2694  		}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2695  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2696  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2697  	/* Move missing children to a list on the stack. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2698  	spin_lock_irqsave(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2699  	do {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2700  		found = false;
5b8db8f66e08fa drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2701  		list_for_each_entry(hpdev, &hbus->children, list_entry) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2702  			if (hpdev->reported_missing) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2703  				found = true;
8c99e120ffcabc drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2704  				put_pcichild(hpdev);
4f1cb01a789258 drivers/pci/host/pci-hyperv.c       Wei Yongjun       2016-07-28  2705  				list_move_tail(&hpdev->list_entry, &removed);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2706  				break;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2707  			}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2708  		}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2709  	} while (found);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2710  	spin_unlock_irqrestore(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2711  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2712  	/* Delete everything that should no longer exist. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2713  	while (!list_empty(&removed)) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2714  		hpdev = list_first_entry(&removed, struct hv_pci_dev,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2715  					 list_entry);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2716  		list_del(&hpdev->list_entry);
340d455699400f drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-03-04  2717  
340d455699400f drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-03-04  2718  		if (hpdev->pci_slot)
340d455699400f drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-03-04  2719  			pci_destroy_slot(hpdev->pci_slot);
340d455699400f drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-03-04  2720  
8c99e120ffcabc drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2721  		put_pcichild(hpdev);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2722  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2723  
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2724  	switch (hbus->state) {
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2725  	case hv_pcibus_installed:
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2726  		/*
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2727  		 * Tell the core to rescan bus
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2728  		 * because there may have been changes.
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2729  		 */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2730  		pci_lock_rescan_remove();
418cb6c8e05111 drivers/pci/controller/pci-hyperv.c Arnd Bergmann     2021-07-27  2731  		pci_scan_child_bus(hbus->bridge->bus);
999dd956d8389f drivers/pci/controller/pci-hyperv.c Long Li           2020-02-25  2732  		hv_pci_assign_numa_node(hbus);
a15f2c08c70811 drivers/pci/controller/pci-hyperv.c Stephen Hemminger 2018-09-14  2733  		hv_pci_assign_slots(hbus);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2734  		pci_unlock_rescan_remove();
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2735  		break;
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2736  
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2737  	case hv_pcibus_init:
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2738  	case hv_pcibus_probed:
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2739  		survey_child_resources(hbus);
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2740  		break;
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2741  
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2742  	default:
d3a78d8bf759d8 drivers/pci/host/pci-hyperv.c       Long Li           2017-03-23  2743  		break;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2744  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2745  
067d6ec7ed5b49 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2023-06-14  2746  	mutex_unlock(&hbus->state_lock);
067d6ec7ed5b49 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2023-06-14  2747  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2748  	kfree(dr);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2749  }
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2750  

:::::: The code at line 2673 was first introduced by commit
:::::: 4daace0d8ce851f8f8f91563c835e3000c954d5e PCI: hv: Add paravirtual PCI front-end for Microsoft Hyper-V VMs

:::::: TO: Jake Oshins <jakeo@microsoft.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
