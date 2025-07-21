Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F919924D
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080950; cv=none; b=aO1kd6Rqc0wyh88EFc1GhK4S/diK3Uli0fuDUesAPwZrT8np8ETaJqGccJO0qj+7gsAInnhbZxxtvHe9/oYZ5/U/C2wJlNa44PWeSOg++LoEiyiy1tgJka73mK8Ikaa+xaBBb0bZDWHoR0wcc/BtKkJ82X8dtn2fA5Nsc0jHdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080950; c=relaxed/simple;
	bh=VM3G2XFpeTyh3sonp9nI10by0erBY73guLL2J1cqf/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftB1u1Boi+LfQ3igxGN9H0aDKI8pICBiwOX8nVRBWLyFAGc5fwmo8L2BM0YbzHttKu4USeoZjz3rZCLxH1yqJcBu/87ywO/Uzy2uS71ZH2EBABUsLsy3fknILL9byT0gONiU3e7LXhiG4eQvvoMAqEumInD88klnpnQlovlCkn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMW+CHPR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMW+CHPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753080949; x=1784616949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VM3G2XFpeTyh3sonp9nI10by0erBY73guLL2J1cqf/4=;
  b=eMW+CHPRXpoNY1ONe/1aw80S7EBbuQoDJcHgLn4t+jPtVY/1qzpqMC56
   W6+PRUGjiAjG4nqM+bWbzujHNzDo3QuNKSR9N8PlFPIffZkWBKFfvUogx
   W3mL4Mkn3AvkTJtNrkjunKOTO+hpYc5yAAYkg9YpaMIm+x9YFFghueXKf
   owLHXNHxrUJv8woxhYMlFCzSNOmsS26gwb783uk5HSfuHlraHDCKpYBL+
   FBhArDVx+6hGol1b3X8SnZHB4/MHEqNytKmo+EmL2CiffPJubhmXo5ciU
   QXoO0BIXREezra+8UbSLHDyDRk0ecW//lI+D/Wk2EhPD3Z4Sk+I3/pvqY
   w==;
X-CSE-ConnectionGUID: +7bjETsqQfe8YQOK4Vbcxw==
X-CSE-MsgGUID: VNwQ7+drTTKKVdGXXttYqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="42908662"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="42908662"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 23:55:48 -0700
X-CSE-ConnectionGUID: r2ZGdp6hRf2jYRu7VqCM2Q==
X-CSE-MsgGUID: oHeIGCw/Rz+fLMhBnrvclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158078176"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jul 2025 23:55:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udkR6-000GZV-1r;
	Mon, 21 Jul 2025 06:55:44 +0000
Date: Mon, 21 Jul 2025 14:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] scsi: mpi3mr: Emit uevent on controller diagnostic
 fault
Message-ID: <202507211423.eXWSnhP5-lkp@intel.com>
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
In-Reply-To: <20250717194025.3218107-1-salomondush@google.com>
References: <20250717194025.3218107-1-salomondush@google.com>
TO: Salomon Dushimirimana <salomondush@google.com>
TO: bvanassche@acm.org
CC: James.Bottomley@HansenPartnership.com
CC: kashyap.desai@broadcom.com
CC: linux-kernel@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: martin.petersen@oracle.com
CC: mpi3mr-linuxdrv.pdl@broadcom.com
CC: salomondush@google.com
CC: sathya.prakash@broadcom.com
CC: sreekanth.reddy@broadcom.com
CC: sumit.saxena@broadcom.com

Hi Salomon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.16-rc7 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salomon-Dushimirimana/scsi-mpi3mr-Emit-uevent-on-controller-diagnostic-fault/20250718-034234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250717194025.3218107-1-salomondush%40google.com
patch subject: [PATCH v2] scsi: mpi3mr: Emit uevent on controller diagnostic fault
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250720 (https://download.01.org/0day-ci/archive/20250721/202507211423.eXWSnhP5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507211423.eXWSnhP5-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1639 mpi3mr_fault_uevent_emit() error: uninitialized symbol 'env'.

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1548 mpi3mr_bring_ioc_ready() error: uninitialized symbol 'start_time'.
drivers/scsi/mpi3mr/mpi3mr_fw.c:1703 mpi3mr_issue_reset() error: uninitialized symbol 'host_diagnostic'.
drivers/scsi/mpi3mr/mpi3mr_fw.c:2227 mpi3mr_create_op_reply_q() error: we previously assumed 'op_reply_q->q_segments' could be null (see line 2180)
drivers/scsi/mpi3mr/mpi3mr_fw.c:2335 mpi3mr_create_op_req_q() error: we previously assumed 'op_req_q->q_segments' could be null (see line 2308)

vim +/env +1639 drivers/scsi/mpi3mr/mpi3mr_fw.c

824a156633dfdb Kashyap Desai         2021-05-20  1625  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1626  /**
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1627   * mpi3mr_fault_uevent_emit - Emit uevent for a controller diagnostic fault
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1628   * @mrioc: Pointer to the mpi3mr_ioc structure for the controller instance
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1629   * @reset_type: The type of reset that has occurred
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1630   * @reset_reason: The specific reason code for the reset
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1631   *
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1632   * This function is invoked when the controller undergoes a reset. It specifically
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1633   * filters for MPI3_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT and ignores other
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1634   * reset types, such as soft resets.
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1635   */
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1636  static void mpi3mr_fault_uevent_emit(struct mpi3mr_ioc *mrioc, u16 reset_type,
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1637  	u16 reset_reason)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1638  {
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17 @1639  	struct kobj_uevent_env *env __free(kfree);
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1640  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1641  	if (reset_type != MPI3_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1642  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1643  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1644  	env = kzalloc(sizeof(*env), GFP_KERNEL);
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1645  	if (!env)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1646  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1647  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1648  	if (add_uevent_var(env, "DRIVER=%s", mrioc->driver_name))
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1649  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1650  	if (add_uevent_var(env, "HBA_NUM=%u", mrioc->id))
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1651  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1652  	if (add_uevent_var(env, "EVENT_TYPE=FATAL_ERROR"))
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1653  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1654  	if (add_uevent_var(env, "RESET_TYPE=%s", mpi3mr_reset_type_name(reset_type)))
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1655  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1656  	if (add_uevent_var(env, "RESET_REASON=%s", mpi3mr_reset_rc_name(reset_reason)))
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1657  		return;
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1658  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1659  	kobject_uevent_env(&mrioc->shost->shost_gendev.kobj, KOBJ_CHANGE, env->envp);
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1660  }
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1661  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
