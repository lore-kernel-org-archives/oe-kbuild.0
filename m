Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7633749EB
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 04:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786594374; cv=none; b=MNm+yEFGrWpfyPtKZnueWCK3v39FKDnVwPi556v3o4o8eM5xeI+TrVu9LoFnP3i1c2+tyPabCC+12JeiuSxs2m8fhLb4CIOSE+A7/KpgpX3tAE2f4nqBxCtOS3IX2fq4Wf5HK4lf2/DH6V18A2HqjlbBrkI8IvS2lcmFYl23hQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786594374; c=relaxed/simple;
	bh=OPMD/NMqItTkVoFaV3PjsqtbgQa3wgw0GckDS63j+Dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AJoYJzS2gTAb9N3k/ehCjQft5/5QVuF09ORx+fgiHiwGBVI9OzZnU/UmpvE2KcZRHRjfUKCNjzyWC0ik3PFiZKUwfE1JBoCIml3vIlJzqma2EaDQugZSk2+GS6gHQIg+c+xU2hrwbzAAilwAm/mrh49V2jUUHzcv8cT0ryJuHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ww2R4el2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ww2R4el2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786594372; x=1818130372;
  h=date:from:to:cc:subject:message-id;
  bh=OPMD/NMqItTkVoFaV3PjsqtbgQa3wgw0GckDS63j+Dw=;
  b=Ww2R4el2FUO8oWuXg/jlBebwMQ7Kw8tOotAdGjSDEkIVYJop080VwRjf
   YUPfmB0VbPdaeMDcscGuCscFrlVB49t5ux8pepoLXZMi8YFHIPcZfVjB/
   9YFDOw+64UngBHL4Roar99PXt5v5NOqvkbJfz/vjesTNnACnsJCI3ddW4
   GKduwA8vQviv4Cm4s0kexfK0FF0O9RHYMrOlAA+K44uXKDakmOwPgguEZ
   RAmLcdUc20vQ7Kv14uU2nGMtRQx0+lmqZVwpnlV3ZaMR4gnHvrKShXW1V
   +/HW8gWhLhBAvIc0pQFZFYnOH3m+qwx9L3QR3zqDQOh1iBvWk8Xh21Qw5
   A==;
X-CSE-ConnectionGUID: Lb+DvQ9nTd2kOjMYGXko8w==
X-CSE-MsgGUID: wAeQKKbHQ1SrhwD4gMqNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112704394"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="112704394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 21:12:51 -0700
X-CSE-ConnectionGUID: Pd5WmZBMSL2q6raEG2HvEQ==
X-CSE-MsgGUID: ryMNHsBfQL2qy0Bcjh+OBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260008496"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 21:12:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuMoB-00000000Slp-42gD;
	Thu, 13 Aug 2026 04:12:47 +0000
Date: Thu, 13 Aug 2026 12:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next-7.3 236/308]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:921 amdgpu_gfx_handle_priv_fault()
 warn: set_bit() takes a bit number
Message-ID: <202608131222.rn9Ecu9O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jesse Zhang <Jesse.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

Hi Jesse,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: e9e0bd23b55aec41f45d46007cb3cb38d40f552b [236/308] drm/amdgpu: recover user queues in the shared priv-fault helper
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260813/202608131222.rn9Ecu9O-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608131222.rn9Ecu9O-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:921 amdgpu_gfx_handle_priv_fault() warn: set_bit() takes a bit number

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:477 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:489 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:490 amdgpu_gfx_mqd_sw_init() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:518 amdgpu_gfx_mqd_sw_fini() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:519 amdgpu_gfx_mqd_sw_fini() error: buffer overflow 'adev->gfx.mec.mqd_backup' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:592 amdgpu_gfx_disable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:614 amdgpu_gfx_disable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:643 amdgpu_gfx_disable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:667 amdgpu_gfx_disable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:726 amdgpu_gfx_mes_enable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:784 amdgpu_gfx_enable_kcq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:816 amdgpu_gfx_enable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:841 amdgpu_gfx_enable_kgq() error: buffer overflow 'adev->gfx.gfx_ring' 2 <= s32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1828 amdgpu_gfx_run_cleaner_shader() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:3089 amdgpu_gfx_ring_preempt_ib() warn: inconsistent indenting

vim +921 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

1156e1a60f024ce Alex Deucher   2023-04-24  858  
9243cf4777fc780 Ulisses Paixao 2026-07-29  859  /**
9243cf4777fc780 Ulisses Paixao 2026-07-29  860   * amdgpu_gfx_handle_priv_fault - Handle privileged instruction fault
9243cf4777fc780 Ulisses Paixao 2026-07-29  861   *
9243cf4777fc780 Ulisses Paixao 2026-07-29  862   * @adev: amdgpu_device pointer
9243cf4777fc780 Ulisses Paixao 2026-07-29  863   * @entry: interrupt vector entry containing fault information
9243cf4777fc780 Ulisses Paixao 2026-07-29  864   * @me_id: micro-engine ID of the faulty ring
9243cf4777fc780 Ulisses Paixao 2026-07-29  865   * @pipe_id: pipe ID of the faulty ring
9243cf4777fc780 Ulisses Paixao 2026-07-29  866   * @queue_id: queue ID of the faulty ring
9243cf4777fc780 Ulisses Paixao 2026-07-29  867   *
9243cf4777fc780 Ulisses Paixao 2026-07-29  868   * This function handles privileged instruction faults by identifying
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  869   * the faulty ring (gfx or compute) and triggering a scheduler fault, or by
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  870   * recovering the faulting user queue.
9243cf4777fc780 Ulisses Paixao 2026-07-29  871   */
9243cf4777fc780 Ulisses Paixao 2026-07-29  872  void amdgpu_gfx_handle_priv_fault(struct amdgpu_device *adev,
9243cf4777fc780 Ulisses Paixao 2026-07-29  873  					struct amdgpu_iv_entry *entry,
9243cf4777fc780 Ulisses Paixao 2026-07-29  874  					u8 me_id, u8 pipe_id, u8 queue_id)
9243cf4777fc780 Ulisses Paixao 2026-07-29  875  {
9243cf4777fc780 Ulisses Paixao 2026-07-29  876  	struct amdgpu_ring *ring;
9243cf4777fc780 Ulisses Paixao 2026-07-29  877  	u32 doorbell_offset;
9243cf4777fc780 Ulisses Paixao 2026-07-29  878  	int i;
9243cf4777fc780 Ulisses Paixao 2026-07-29  879  
9243cf4777fc780 Ulisses Paixao 2026-07-29  880  	/*
9243cf4777fc780 Ulisses Paixao 2026-07-29  881  	 * Try KQ first by ring_id (HW slot is authoritative). The
9243cf4777fc780 Ulisses Paixao 2026-07-29  882  	 * KMD compute_hqd_mask contract guarantees KCQ and user queues
9243cf4777fc780 Ulisses Paixao 2026-07-29  883  	 * never share a HW slot.
9243cf4777fc780 Ulisses Paixao 2026-07-29  884  	 */
9243cf4777fc780 Ulisses Paixao 2026-07-29  885  	if (!adev->gfx.disable_kq) {
9243cf4777fc780 Ulisses Paixao 2026-07-29  886  		for (i = 0; i < adev->gfx.num_gfx_rings; i++) {
9243cf4777fc780 Ulisses Paixao 2026-07-29  887  			ring = &adev->gfx.gfx_ring[i];
9243cf4777fc780 Ulisses Paixao 2026-07-29  888  			if (ring->me == me_id && ring->pipe == pipe_id &&
9243cf4777fc780 Ulisses Paixao 2026-07-29  889  			    ring->queue == queue_id) {
9243cf4777fc780 Ulisses Paixao 2026-07-29  890  				drm_sched_fault(&ring->sched);
9243cf4777fc780 Ulisses Paixao 2026-07-29  891  				return;
9243cf4777fc780 Ulisses Paixao 2026-07-29  892  			}
9243cf4777fc780 Ulisses Paixao 2026-07-29  893  		}
9243cf4777fc780 Ulisses Paixao 2026-07-29  894  
9243cf4777fc780 Ulisses Paixao 2026-07-29  895  		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
9243cf4777fc780 Ulisses Paixao 2026-07-29  896  			ring = &adev->gfx.compute_ring[i];
9243cf4777fc780 Ulisses Paixao 2026-07-29  897  			if (ring->me == me_id && ring->pipe == pipe_id &&
9243cf4777fc780 Ulisses Paixao 2026-07-29  898  			    ring->queue == queue_id) {
9243cf4777fc780 Ulisses Paixao 2026-07-29  899  				drm_sched_fault(&ring->sched);
9243cf4777fc780 Ulisses Paixao 2026-07-29  900  				return;
9243cf4777fc780 Ulisses Paixao 2026-07-29  901  			}
9243cf4777fc780 Ulisses Paixao 2026-07-29  902  		}
9243cf4777fc780 Ulisses Paixao 2026-07-29  903  	}
9243cf4777fc780 Ulisses Paixao 2026-07-29  904  
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  905  	/* No KQ matched: the faulting slot belongs to a user queue. */
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  906  	if (adev->gfx.disable_uq)
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  907  		return;
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  908  
9243cf4777fc780 Ulisses Paixao 2026-07-29  909  	doorbell_offset = entry->src_data[0] & AMDGPU_CTXID0_DOORBELL_ID_MASK;
9243cf4777fc780 Ulisses Paixao 2026-07-29  910  
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  911  	/*
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  912  	 * A compute user-queue fault IV carries the doorbell offset, so reset
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  913  	 * the queue directly from it. A gfx user-queue fault is raised by the
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  914  	 * ME and carries only the HW slot (no doorbell); record the slot and
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  915  	 * let the worker read the doorbell back from the HQD.
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  916  	 */
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  917  	if (doorbell_offset) {
9243cf4777fc780 Ulisses Paixao 2026-07-29  918  		amdgpu_userq_process_reset_irq(adev, entry->pasid,
9243cf4777fc780 Ulisses Paixao 2026-07-29  919  					       doorbell_offset);
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  920  	} else {
e9e0bd23b55aec4 Jesse Zhang    2026-07-31 @921  		set_bit(pipe_id | (queue_id << 2), &adev->gfx.userq_priv_fault_slots);
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  922  		schedule_work(&adev->gfx.userq_priv_fault_work);
e9e0bd23b55aec4 Jesse Zhang    2026-07-31  923  	}
9243cf4777fc780 Ulisses Paixao 2026-07-29  924  }
9243cf4777fc780 Ulisses Paixao 2026-07-29  925  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
