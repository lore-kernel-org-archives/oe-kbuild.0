Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824D17A305
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842270; cv=none; b=k5zkaQjNYbX2Mq8LFoT4cQRdGcAmE06s8WHvBcyQ1XQMi+Avv9m6ZbwouKAxF8HiOT0L6o6Oc2tJOmLcIURjj9XlcZONyfqk6DRHYI8Vp9e2B2HVYfdAO5PvckZgUBDrK65ye6+PPqI8V2hkuEEw9Gvwoo2MBEAo0ELw7m4tk98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842270; c=relaxed/simple;
	bh=jtvUCX4c98rlkPKb3Wnz/RarsVsQ3p9JcjOpDRggHSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r7xTvGIbhL7P8gDrTT3j4TlFhcs4CO/6y/iegsixxx4ADouX5hXmsaoHNjHTG0q27ns2f3XDxCqAFO+drsWusu0dSNr/GgykqdyCiQyeMNbKauqGh3o9LqVm2vXAhDPh64euItWh6hS57oweHgxMVQOJvaiuSpB7Iu/uVLWaYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDTZCOMT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDTZCOMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775842267; x=1807378267;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jtvUCX4c98rlkPKb3Wnz/RarsVsQ3p9JcjOpDRggHSQ=;
  b=PDTZCOMTVY+1zU2d49FrLL9iOg8GoRmsAKa15yxR138sAvOD0M/91z38
   rgptsVa4h4gMT63pcZ5W7t++FcjmPRryD008FrW66NJc35v51UMOZxyL+
   TdTsBe5ZYXIQRMKAetMFIQFEq/G1NfuBIU1XzcBF7bHacDvhD/xkXS7qh
   InqZ1mNX6x1OB4g2DQTBRpUpnVeoqrKbdw85+iZCchLxdPW+XlU8+HsoR
   xp3R1/Sue3ct/5MXqm7lUBkOBVJDxdcZcwcklKX0ZW0agWvP5F0EsYiae
   Uj0d731S/mm3AEUc0cdRQvvcX3ebZfsIx6BSlVXUYtQZ4zLti/fPS4wUt
   w==;
X-CSE-ConnectionGUID: ds+ZG3gPShGT8jeDEV20vg==
X-CSE-MsgGUID: anyrYTtUQ3mJYqLmJ1PFog==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76887354"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76887354"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:31:07 -0700
X-CSE-ConnectionGUID: lJu4PQCsTeWEZmc9LHfCUg==
X-CSE-MsgGUID: exg+1ieTRmq+JRoEEXbH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="234071321"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 10:31:06 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBFh9-0000000045l-2cah;
	Fri, 10 Apr 2026 17:31:03 +0000
Date: Sat, 11 Apr 2026 01:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 38/38]
 drivers/gpu/drm/etnaviv/etnaviv_sched.c:66 etnaviv_sched_timedout_job() warn:
 variable dereferenced before check 'sched_job' (see line 37)
Message-ID: <202604110106.aMi7vRva-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   831eddf6244dd5478d58b2f2f83a856781ba030b
commit: f503efe2c5da084dc5ee2db38409f7a7e4f1bc1e [38/38] drm/etnaviv: Prote=
ct the scheduler's pending list with its lock
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20260410 (https://download.01.org/0day-ci/archi=
ve/20260411/202604110106.aMi7vRva-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110106.aMi7vRva-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_sched.c:66 etnaviv_sched_timedout_job() war=
n: variable dereferenced before check 'sched_job' (see line 37)

vim +/sched_job +66 drivers/gpu/drm/etnaviv/etnaviv_sched.c

e93b6deeb45a78 Lucas Stach       2017-12-04  32 =20
a6a1f036c74e3d Luben Tuikov      2021-01-20  33  static enum drm_gpu_sched_=
stat etnaviv_sched_timedout_job(struct drm_sched_job
a6a1f036c74e3d Luben Tuikov      2021-01-20  34  							  *sched_job)
e93b6deeb45a78 Lucas Stach       2017-12-04  35  {
6d7a20c0776036 Lucas Stach       2017-12-06  36  	struct etnaviv_gem_submit=
 *submit =3D to_etnaviv_submit(sched_job);
f503efe2c5da08 Ma=C3=ADra Canal       2025-06-02 @37  	struct drm_gpu_sched=
uler *sched =3D sched_job->sched;
6d7a20c0776036 Lucas Stach       2017-12-06  38  	struct etnaviv_gpu *gpu =
=3D submit->gpu;
2c83a726d6fbb5 Lucas Stach       2018-06-27  39  	u32 dma_addr;
2c83a726d6fbb5 Lucas Stach       2018-06-27  40  	int change;
2c83a726d6fbb5 Lucas Stach       2018-06-27  41 =20
2c83a726d6fbb5 Lucas Stach       2018-06-27  42  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  43  	 * If the GPU managed to =
complete this jobs fence, the timout is
2c83a726d6fbb5 Lucas Stach       2018-06-27  44  	 * spurious. Bail out.
2c83a726d6fbb5 Lucas Stach       2018-06-27  45  	 */
6fce3a406108ee Lucas Stach       2018-10-04  46  	if (dma_fence_is_signaled=
(submit->out_fence))
50248a3ec0f5e5 Lucas Stach       2020-08-24  47  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  48 =20
2c83a726d6fbb5 Lucas Stach       2018-06-27  49  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  50  	 * If the GPU is still ma=
king forward progress on the front-end (which
2c83a726d6fbb5 Lucas Stach       2018-06-27  51  	 * should never loop) we =
shift out the timeout to give it a chance to
2c83a726d6fbb5 Lucas Stach       2018-06-27  52  	 * finish the job.
2c83a726d6fbb5 Lucas Stach       2018-06-27  53  	 */
2c83a726d6fbb5 Lucas Stach       2018-06-27  54  	dma_addr =3D gpu_read(gpu=
, VIVS_FE_DMA_ADDRESS);
2c83a726d6fbb5 Lucas Stach       2018-06-27  55  	change =3D dma_addr - gpu=
->hangcheck_dma_addr;
cdd156955f946b Lucas Stach       2021-12-22  56  	if (gpu->completed_fence =
!=3D gpu->hangcheck_fence ||
cdd156955f946b Lucas Stach       2021-12-22  57  	    change < 0 || change =
> 16) {
2c83a726d6fbb5 Lucas Stach       2018-06-27  58  		gpu->hangcheck_dma_addr =
=3D dma_addr;
cdd156955f946b Lucas Stach       2021-12-22  59  		gpu->hangcheck_fence =3D =
gpu->completed_fence;
50248a3ec0f5e5 Lucas Stach       2020-08-24  60  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  61  	}
6d7a20c0776036 Lucas Stach       2017-12-06  62 =20
2dd415c2e34c5a Lucas Stach       2024-06-21  63  	/* block scheduler */
2dd415c2e34c5a Lucas Stach       2024-06-21  64  	drm_sched_stop(&gpu->sche=
d, sched_job);
2dd415c2e34c5a Lucas Stach       2024-06-21  65 =20
222b5f04415987 Andrey Grodzovsky 2018-12-04 @66  	if(sched_job)
222b5f04415987 Andrey Grodzovsky 2018-12-04  67  		drm_sched_increase_karma=
(sched_job);
6d7a20c0776036 Lucas Stach       2017-12-06  68 =20
6d7a20c0776036 Lucas Stach       2017-12-06  69  	/* get the GPU back into =
the init state */
9a1fdae5876016 Lucas Stach       2019-08-09  70  	etnaviv_core_dump(submit);
6d7a20c0776036 Lucas Stach       2017-12-06  71  	etnaviv_gpu_recover_hang(=
gpu);
6d7a20c0776036 Lucas Stach       2017-12-06  72 =20
222b5f04415987 Andrey Grodzovsky 2018-12-04  73  	drm_sched_resubmit_jobs(&=
gpu->sched);
222b5f04415987 Andrey Grodzovsky 2018-12-04  74 =20
a6a1f036c74e3d Luben Tuikov      2021-01-20  75  	drm_sched_start(&gpu->sch=
ed, true);
a6a1f036c74e3d Luben Tuikov      2021-01-20  76  	return DRM_GPU_SCHED_STAT=
_NOMINAL;
a6a1f036c74e3d Luben Tuikov      2021-01-20  77 =20
50248a3ec0f5e5 Lucas Stach       2020-08-24  78  out_no_timeout:
f503efe2c5da08 Ma=C3=ADra Canal       2025-06-02  79  	spin_lock(&sched->jo=
b_list_lock);
f503efe2c5da08 Ma=C3=ADra Canal       2025-06-02  80  	list_add(&sched_job-=
>list, &sched->pending_list);
f503efe2c5da08 Ma=C3=ADra Canal       2025-06-02  81  	spin_unlock(&sched->=
job_list_lock);
a6a1f036c74e3d Luben Tuikov      2021-01-20  82  	return DRM_GPU_SCHED_STAT=
_NOMINAL;
e93b6deeb45a78 Lucas Stach       2017-12-04  83  }
e93b6deeb45a78 Lucas Stach       2017-12-04  84 =20

:::::: The code at line 66 was first introduced by commit
:::::: 222b5f044159877504dbac9bc1910f89a74136e2 drm/sched: Refactor ring mi=
rror list handling.

:::::: TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
