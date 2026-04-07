Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1291330324
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553484; cv=none; b=nTRxVAeP1TqRaPwy4fNTqu/Z5Q8yLv688cwp8Jqe3rmDq6OU3ufHXekM1J1p+7rXvyV51kp/amQPo2iTTmiS8QGF+lsmou95kF3yyVXvE3VftgmTbIzEViHXrmqsUXPH4xEjpN93f8JdFSIdgwxNR+XZgu6kz/0NOKOtqx7peV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553484; c=relaxed/simple;
	bh=ua6NBcpMsmGxkxsRFCt9qqLfoN5fo54vzR5LLZbWBnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZEmt9u5rhmMVCgqDXUu1VnEIC9/hRjDNQ8cl2zNxUR40NupIs7VDUlT24xsEl67u/AHax8Oh3HmOyUEh2B3LxGvujfT9j11qwhSqJV3oAkQPu9V64BHBaaWt5bPPZ/yNPNpLRrfjNn08qBHKM8nT/wFqGAq576gnVgPibZb+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW4xU8EC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW4xU8EC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43ccda008cdso2906380f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 07 Apr 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775553480; x=1776158280; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QAXViyT/yNLbimjFZQ0oxVgoLoR8JjMuycPU0pt+qI=;
        b=fW4xU8ECQ9g/O3fDee+2BQBxvhAxayljz6FdLL3E0zESJkV9CuNGcnQ81e3Z18aN8o
         8DmgWxZxIvA1174k2T3xsoMnXpfT5HXPCkUg9ywFJvGclZRCGBQsxQQ6Hcoka482SNKX
         ir3AnJvu7bP+C+2xhSgmtjddlV7z6VRikzPGc+6RbVysfYEB2VI7HtsMhmYA2uqfHTWs
         Y/0Xx8S45kzCqRFkYvSqNLtBhitUkv8IuXqazFTuCchPdeatNaB88ss7QH2MVSDvBMCw
         cPBZlDHGZThDPrUFHl2wgnNfDXfSx2QD7cEK36hroPT7So+6OmCcDmqR7SEJb/ubIoFG
         9dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553480; x=1776158280;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QAXViyT/yNLbimjFZQ0oxVgoLoR8JjMuycPU0pt+qI=;
        b=S69fn3JRT4desyATc0O/fbeKV01q+aQ1k2XiMfzYb9jrVbqXJrbleH2it0uENOFh/1
         O14PiWBOWEMKGgLjWi/NmWrJtz+G5PRrMmd11NULAo5qLRzjH8/YbNmT2+OTNfzWvaoz
         5DdoX1JcHh7HhI8beKA1ics1kHx1zhhhCL4UwDUMyJdqSMBxDaRaKQKToTVvgYGWv9J9
         YdMcygPm1lPB+UTROG6QQ31a5g9tqf+7Y3Gd+BIj+Vn3XYRYG5RDs/v9q4ASEyJhYu7O
         eWuJshebBMBYKAR4JiBZ2axT3BUqtn7+Nv8PDex8neksg/ElU4z4mAjlnmnk3JkpYd28
         LZ+g==
X-Gm-Message-State: AOJu0YyJvU9aVK95G+AgJuwopV9WtwewUAZwHhn4TofwCKd9bVWj7/HC
	NCYaBOkW7g9MDSOGYgSeQ12tc5ii0IE6VRWbaADMcR0tUq8jC/VnCktYVpQigQ==
X-Gm-Gg: AeBDiesyfsdtUmeR3lGGcL5gIGuIonA7Ip5lwyAvZ2WbJdNKuTV2DSpicLPKc5+LZ5l
	5OoPWOLRANmBQDoRgbpZUY7+jTOjaEBHIcEEsSDjBdtCLTIumjYuPDzWDPseZo7R9BXPv9fFiuu
	z8UkrMMggPYc6ZjVEgx5yRSZN2nLOhbyzYaARbqNypJytJhWAmCdsF7aHPRsg0r20lEbY4igHp4
	U4uLUSaucz7wEH9f2aJcakVcujhZFmtqq/Ma62K6ZAyKGC/3WpH+Uz614QQlUheHnJqNa0wyjB8
	kz8jHguzO47/PFv7YuXT8f1oM0RR2JCfaJuiXGwsSvDgz1f5VKJpOoL4XjNC3cEyDxCAf/vA262
	7DfGg9AsXMFuGkp5qwyZSq/FsLiNvPmJpWJLHea0EV7rwmvrmSIHXcSX9RumA74B6iXNbceuyOp
	6Hyi+1k0X5p9enLprFElM=
X-Received: by 2002:a5d:5847:0:b0:43d:25a6:624 with SMTP id ffacd0b85a97d-43d28fb74abmr24068950f8f.11.1775553479509;
        Tue, 07 Apr 2026 02:17:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm51421864f8f.6.2026.04.07.02.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:17:58 -0700 (PDT)
Date: Tue, 7 Apr 2026 12:17:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next-7.1 55/56]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:423 amdgpu_coredump()
 error: we previously assumed 'job' could be null (see line 414)
Message-ID: <202604071441.vAPwv1su-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260407091755.bZLLHEGPug2efXAZAALBaxEmBVMd7-7tYjhuCkHk4Xw@z>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.1
head:   7b15fc2d1f1a00fb99f0146e404ff2600999ec74
commit: 32ab301b89b30d71a2e68d86f564eca66f7c52c5 [55/56] drm/amdgpu: store ib info for devcoredump
config: x86_64-randconfig-161-20260405 (https://download.01.org/0day-ci/archive/20260407/202604071441.vAPwv1su-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604071441.vAPwv1su-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:423 amdgpu_coredump() error: we previously assumed 'job' could be null (see line 414)
drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:425 amdgpu_coredump() warn: variable dereferenced before check 'job' (see line 423)

vim +/job +423 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

6122f5c72e38a88 Trigger Huang              2024-08-19  399  void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
6122f5c72e38a88 Trigger Huang              2024-08-19  400  		     bool vram_lost, struct amdgpu_job *job)
9022f01b9709331 Sunil Khatri               2024-03-21  401  {
9022f01b9709331 Sunil Khatri               2024-03-21  402  	struct drm_device *dev = adev_to_drm(adev);
6122f5c72e38a88 Trigger Huang              2024-08-19  403  	struct amdgpu_coredump_info *coredump;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  404  	size_t size = sizeof(*coredump);
9022f01b9709331 Sunil Khatri               2024-03-21  405  	struct drm_sched_job *s_job;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  406  	u64 total_ring_size, ring_count;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  407  	struct amdgpu_ring *ring;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  408  	int i, off, idx;
9022f01b9709331 Sunil Khatri               2024-03-21  409  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  410  	/* No need to generate a new coredump if there's one in progress already. */
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  411  	if (work_pending(&adev->coredump_work))
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  412  		return;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  413  
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04 @414  	if (job && job->pasid)
                                                                    ^^^
Can job be NULL?

32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  415  		size += sizeof(struct amdgpu_coredump_ib_info) * job->num_ibs;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  416  
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  417  	coredump = kzalloc(size, GFP_NOWAIT);
e29172987309526 Mario Limonciello (AMD     2025-12-14  418) 	if (!coredump)
9022f01b9709331 Sunil Khatri               2024-03-21  419  		return;
9022f01b9709331 Sunil Khatri               2024-03-21  420  
6122f5c72e38a88 Trigger Huang              2024-08-19  421  	coredump->skip_vram_check = skip_vram_check;
9022f01b9709331 Sunil Khatri               2024-03-21  422  	coredump->reset_vram_lost = vram_lost;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04 @423  	coredump->pasid = job->pasid;
                                                                                  ^^^^^^^^^^
Unchecked dereference

9022f01b9709331 Sunil Khatri               2024-03-21  424  
8d1a13816e59254 Christian König            2024-12-12 @425  	if (job && job->pasid) {
                                                                    ^^^
The next line assumes it can be NULL again.

9022f01b9709331 Sunil Khatri               2024-03-21  426  		struct amdgpu_task_info *ti;
9022f01b9709331 Sunil Khatri               2024-03-21  427  
8d1a13816e59254 Christian König            2024-12-12  428  		ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
9022f01b9709331 Sunil Khatri               2024-03-21  429  		if (ti) {
9022f01b9709331 Sunil Khatri               2024-03-21  430  			coredump->reset_task_info = *ti;
9022f01b9709331 Sunil Khatri               2024-03-21  431  			amdgpu_vm_put_task_info(ti);
9022f01b9709331 Sunil Khatri               2024-03-21  432  		}
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  433  		coredump->num_ibs = job->num_ibs;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  434  		for (i = 0; i < job->num_ibs; ++i) {
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  435  			coredump->ibs[i].gpu_addr = job->ibs[i].gpu_addr;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  436  			coredump->ibs[i].ib_size_dw = job->ibs[i].length_dw;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  437  		}
9022f01b9709331 Sunil Khatri               2024-03-21  438  	}
9022f01b9709331 Sunil Khatri               2024-03-21  439  
9022f01b9709331 Sunil Khatri               2024-03-21  440  	if (job) {
9022f01b9709331 Sunil Khatri               2024-03-21  441  		s_job = &job->base;
9022f01b9709331 Sunil Khatri               2024-03-21  442  		coredump->ring = to_amdgpu_ring(s_job->sched);
9022f01b9709331 Sunil Khatri               2024-03-21  443  	}
9022f01b9709331 Sunil Khatri               2024-03-21  444  
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  445  	/* Dump ring content if memory allocation succeeds. */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

