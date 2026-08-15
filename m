Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FE2BDC2A
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786830098; cv=none; b=UJheAl07FUYNnecr/ykfAG1Uhe1x7wm5HDlDlmf/ZuIlEDQsmjfMTad1EAkqwUOMq4x8JIUd0DNFmTIEktscekf5i0oNvGHAglL9N0l/ig9e0FvBLATNCXK2rxJ2JAQq72E8vThzbBGjFpBrtOIgyx7ySOfAyMsV7y0ZyJ4Tpeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786830098; c=relaxed/simple;
	bh=cPQPomQ6VoD5wrxbWob3Y7rmAuf87x4O/aahraNI2ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m9PcYBjl9amIUhrDTSkN5ZGiT55qpCsSQKKy27SErgd7qy+NPlRtTye/84Dkvtr279j/8vykpLwe4Jgzo/PaeNpQaSbnoorg2blG6QImy7lpVl5XonH1uDZpBTsoGv4t9LnX+jt5bNxak/JMLrAjsOaLRDPgd8a9zKDsAkU0K3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHyBCmIe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHyBCmIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786830095; x=1818366095;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cPQPomQ6VoD5wrxbWob3Y7rmAuf87x4O/aahraNI2ww=;
  b=YHyBCmIep3j7vllpHEFHNCplmWcjyMOwSgbEjv8fbl4Vv44B+8QnMCAy
   /3uXOTwhR6xC3qAb8EYJFPZYMj5mwV5TdOrn6/E0S3huIHX6fvQk5HMBN
   pFRB9mOwy/yTE5K7eHhJ2c7AsTPmAfRVfshBfweTfTjLN6krcnDDVLI9p
   0yluxXU2JkKNHiN4GZZKd6aY4/e2tS6Wzx8+iv+onaRFj/KIQNEBHX+Ud
   TW7GyZrkk6oPRg4jgBPTWVPNdoPFto+iDr2lAN7U9iws2GPhnykLyWp8N
   BjKp/ouSVCNt4B0fr1BzmYEfIV6Br60oPS/CfxnAnDl0TEO1i0soBxKkh
   w==;
X-CSE-ConnectionGUID: z3qhnkATRASOgu2fUhVU3g==
X-CSE-MsgGUID: DnbS58yVQM+ndONPvmIzkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="89881186"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="89881186"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 14:41:34 -0700
X-CSE-ConnectionGUID: T02bXc85QK6UJFatPXLLAA==
X-CSE-MsgGUID: cOWwtNptQw2nLJX8DwMuFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="261894362"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Aug 2026 14:41:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvM8A-00000000cVG-1ATg;
	Sat, 15 Aug 2026 21:41:30 +0000
Date: Sun, 16 Aug 2026 05:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 14437/15435]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:239 amdgpu_ib_schedule() error: we
 previously assumed 'job' could be null (see line 221)
Message-ID: <202608160508.ovXgFIkK-lkp@intel.com>
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
TO: Alex Deucher <alexander.deucher@amd.com>
CC: David Rosca <david.rosca@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: cb1e657ccac89bee3569d85dfa3fe6d9bde9a33b [14437/15435] drm/amdgpu: =
handle GDS and SPM without a VM fence
:::::: branch date: 29 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20260815 (https://download.01.org/0day-ci/archi=
ve/20260816/202608160508.ovXgFIkK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608160508.ovXgFIkK-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:239 amdgpu_ib_schedule() error: we p=
reviously assumed 'job' could be null (see line 221)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:866 amdgpu_vm_flush() error: we prev=
iously assumed 'adev->gfx.rlc.funcs->update_spm_vmid' could be null (see li=
ne 783)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:869 amdgpu_vm_flush() error: we prev=
iously assumed 'ring->funcs->emit_gds_switch' could be null (see line 785)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:858 amdgpu_vm_flush() error: we prev=
iously assumed 'ring->funcs->emit_vm_flush' could be null (see line 809)

vim +/job +239 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c

d38ceaf99ed015 Alex Deucher         2015-04-20  101 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  102  /**
d38ceaf99ed015 Alex Deucher         2015-04-20  103   * amdgpu_ib_schedule =
- schedule an IB (Indirect Buffer) on the ring
d38ceaf99ed015 Alex Deucher         2015-04-20  104   *
ad8eb024c8721a Lee Jones            2020-11-13  105   * @ring: ring index t=
he IB is associated with
d38ceaf99ed015 Alex Deucher         2015-04-20  106   * @num_ibs: number of=
 IBs to schedule
d38ceaf99ed015 Alex Deucher         2015-04-20  107   * @ibs: IB objects to=
 schedule
7ad0c80c5ecbb5 Lee Jones            2020-11-23  108   * @job: job to schedu=
le
ec72b8006c1e69 Christian K=C3=B6nig      2016-02-01  109   * @f: fence crea=
ted during this submission
d38ceaf99ed015 Alex Deucher         2015-04-20  110   *
d38ceaf99ed015 Alex Deucher         2015-04-20  111   * Schedule an IB on t=
he associated ring (all asics).
d38ceaf99ed015 Alex Deucher         2015-04-20  112   * Returns 0 on succes=
s, error on failure.
d38ceaf99ed015 Alex Deucher         2015-04-20  113   *
d38ceaf99ed015 Alex Deucher         2015-04-20  114   * On SI, there are tw=
o parallel engines fed from the primary ring,
d38ceaf99ed015 Alex Deucher         2015-04-20  115   * the CE (Constant En=
gine) and the DE (Drawing Engine).  Since
d38ceaf99ed015 Alex Deucher         2015-04-20  116   * resource descriptor=
s have moved to memory, the CE allows you to
d38ceaf99ed015 Alex Deucher         2015-04-20  117   * prime the caches wh=
ile the DE is updating register state so that
d38ceaf99ed015 Alex Deucher         2015-04-20  118   * the resource descri=
ptors will be already in cache when the draw is
d38ceaf99ed015 Alex Deucher         2015-04-20  119   * processed.  To acco=
mplish this, the userspace driver submits two
d38ceaf99ed015 Alex Deucher         2015-04-20  120   * IBs, one for the CE=
 and one for the DE.  If there is a CE IB (called
d38ceaf99ed015 Alex Deucher         2015-04-20  121   * a CONST_IB), it wil=
l be put on the ring prior to the DE IB.  Prior
d38ceaf99ed015 Alex Deucher         2015-04-20  122   * to SI there was jus=
t a DE IB.
d38ceaf99ed015 Alex Deucher         2015-04-20  123   */
fc8e55f378cf11 Srinivasan Shanmugam 2023-07-23  124  int amdgpu_ib_schedule=
(struct amdgpu_ring *ring, unsigned int num_ibs,
50ddc75e32bba7 Junwei Zhang         2017-01-23  125  		       struct amdgpu=
_ib *ibs, struct amdgpu_job *job,
50ddc75e32bba7 Junwei Zhang         2017-01-23  126  		       struct dma_fe=
nce **f)
d38ceaf99ed015 Alex Deucher         2015-04-20  127  {
b07c60c0652c49 Christian K=C3=B6nig      2016-01-31  128  	struct amdgpu_de=
vice *adev =3D ring->adev;
d38ceaf99ed015 Alex Deucher         2015-04-20  129  	struct amdgpu_ib *ib =
=3D &ibs[0];
b9bf33d5ac55aa Chunming Zhou        2017-05-11  130  	struct dma_fence *tmp=
 =3D NULL;
d0c35c84dcfa66 Alex Deucher         2025-06-16  131  	struct amdgpu_fence *=
af;
a17ef941212bf2 Alex Deucher         2026-01-15  132  	struct amdgpu_fence *=
vm_af;
7d9c70d23550eb Jiansong Chen        2021-05-13  133  	bool need_ctx_switch;
cb1e657ccac89b Alex Deucher         2026-06-05  134  	bool emit_spm_needed =
=3D false;
cb1e657ccac89b Alex Deucher         2026-06-05  135  	bool emit_gds_needed =
=3D false;
92f250989b7098 Christian K=C3=B6nig      2016-05-06  136  	struct amdgpu_vm=
 *vm;
3aecd24c65b953 Monk Liu             2016-08-25  137  	uint64_t fence_ctx;
9a9db6ef7cf486 Alex Deucher         2016-09-16  138  	uint32_t status =3D 0=
, alloc_size;
fc8e55f378cf11 Srinivasan Shanmugam 2023-07-23  139  	unsigned int fence_fl=
ags =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  140  	bool secure, ini=
t_shadow;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  141  	u64 shadow_va, c=
sa_va, gds_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  142  	int vmid =3D AMD=
GPU_JOB_GET_VMID(job);
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  143  	bool need_pipe_s=
ync =3D false;
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  144  	unsigned int con=
d_exec;
fc8e55f378cf11 Srinivasan Shanmugam 2023-07-23  145  	unsigned int i;
d38ceaf99ed015 Alex Deucher         2015-04-20  146  	int r =3D 0;
d38ceaf99ed015 Alex Deucher         2015-04-20  147 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  148  	if (num_ibs =3D=3D 0)
d38ceaf99ed015 Alex Deucher         2015-04-20  149  		return -EINVAL;
d38ceaf99ed015 Alex Deucher         2015-04-20  150 =20
92f250989b7098 Christian K=C3=B6nig      2016-05-06  151  	/* ring tests do=
n't use a job */
92f250989b7098 Christian K=C3=B6nig      2016-05-06  152  	if (job) {
c5637837ba5d5b Monk Liu             2016-04-19  153  		vm =3D job->vm;
dcafbd50f2e4d5 Felix Kuehling       2019-09-05  154  		fence_ctx =3D job->b=
ase.s_fence ?
db36632ea51e8b Alex Deucher         2025-08-27  155  			job->base.s_fence->=
finished.context : 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  156  		shadow_va =3D j=
ob->shadow_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  157  		csa_va =3D job-=
>csa_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  158  		gds_va =3D job-=
>gds_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  159  		init_shadow =3D =
job->init_shadow;
db36632ea51e8b Alex Deucher         2025-08-27  160  		af =3D job->hw_fence;
77cc0da39c7ce2 Alex Deucher         2025-05-27  161  		/* Save the context =
of the job for reset handling.
77cc0da39c7ce2 Alex Deucher         2025-05-27  162  		 * The driver needs =
this so it can skip the ring
77cc0da39c7ce2 Alex Deucher         2025-05-27  163  		 * contents for guil=
ty contexts.
77cc0da39c7ce2 Alex Deucher         2025-05-27  164  		 */
db36632ea51e8b Alex Deucher         2025-08-27  165  		af->context =3D fenc=
e_ctx;
db36632ea51e8b Alex Deucher         2025-08-27  166  		/* the vm fence is a=
lso part of the job's context */
db36632ea51e8b Alex Deucher         2025-08-27  167  		job->hw_vm_fence->co=
ntext =3D fence_ctx;
92f250989b7098 Christian K=C3=B6nig      2016-05-06  168  	} else {
92f250989b7098 Christian K=C3=B6nig      2016-05-06  169  		vm =3D NULL;
3aecd24c65b953 Monk Liu             2016-08-25  170  		fence_ctx =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  171  		shadow_va =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  172  		csa_va =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  173  		gds_va =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  174  		init_shadow =3D =
false;
69050f8d6d075d Kees Cook            2026-02-20  175  		af =3D kzalloc_obj(*=
af, GFP_ATOMIC);
db36632ea51e8b Alex Deucher         2025-08-27  176  		if (!af)
db36632ea51e8b Alex Deucher         2025-08-27  177  			return -ENOMEM;
92f250989b7098 Christian K=C3=B6nig      2016-05-06  178  	}
d919ad49ac04e1 Christian K=C3=B6nig      2015-05-11  179 =20
4220d2c7c41b8e Alex Deucher         2025-03-12  180  	if (!ring->sched.read=
y) {
1b5836492de6a7 Tom St Denis         2016-08-22  181  		dev_err(adev->dev, "=
couldn't schedule ib on ring <%s>\n", ring->name);
f903b85ed0f14f Alex Deucher         2025-10-22  182  		r =3D -EINVAL;
f903b85ed0f14f Alex Deucher         2025-10-22  183  		goto free_fence;
d38ceaf99ed015 Alex Deucher         2015-04-20  184  	}
be86c606b50a53 Chunming Zhou        2016-01-15  185 =20
4220d2c7c41b8e Alex Deucher         2025-03-12  186  	if (vm && !job->vmid)=
 {
8d0a7cea824a27 Christian K=C3=B6nig      2015-11-03  187  		dev_err(adev->d=
ev, "VM IB without ID\n");
f903b85ed0f14f Alex Deucher         2025-10-22  188  		r =3D -EINVAL;
f903b85ed0f14f Alex Deucher         2025-10-22  189  		goto free_fence;
d38ceaf99ed015 Alex Deucher         2015-04-20  190  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  191 =20
b33f9d70b36889 Alex Deucher         2020-04-23  192  	if ((ib->flags & AMDG=
PU_IB_FLAGS_SECURE) &&
8c0f11ff3895ec Lang Yu              2022-03-15  193  	    (!ring->funcs->se=
cure_submission_supported)) {
8c0f11ff3895ec Lang Yu              2022-03-15  194  		dev_err(adev->dev, "=
secure submissions not supported on ring <%s>\n", ring->name);
f903b85ed0f14f Alex Deucher         2025-10-22  195  		r =3D -EINVAL;
f903b85ed0f14f Alex Deucher         2025-10-22  196  		goto free_fence;
b33f9d70b36889 Alex Deucher         2020-04-23  197  	}
b33f9d70b36889 Alex Deucher         2020-04-23  198 =20
e12f3d7a23c996 Christian K=C3=B6nig      2016-10-05  199  	alloc_size =3D r=
ing->funcs->emit_frame_size + num_ibs *
e12f3d7a23c996 Christian K=C3=B6nig      2016-10-05  200  		ring->funcs->em=
it_ib_size;
9a9db6ef7cf486 Alex Deucher         2016-09-16  201 =20
9a9db6ef7cf486 Alex Deucher         2016-09-16  202  	r =3D amdgpu_ring_all=
oc(ring, alloc_size);
91e1a5207edec9 Christian K=C3=B6nig      2015-07-06  203  	if (r) {
8d0a7cea824a27 Christian K=C3=B6nig      2015-11-03  204  		dev_err(adev->d=
ev, "scheduling IB failed (%d).\n", r);
f903b85ed0f14f Alex Deucher         2025-10-22  205  		goto free_fence;
91e1a5207edec9 Christian K=C3=B6nig      2015-07-06  206  	}
df83d1ebc9e304 Chunming Zhou        2017-05-09  207 =20
4f0ecd36f27694 Emily Deng           2018-08-22  208  	need_ctx_switch =3D r=
ing->current_ctx !=3D fence_ctx;
df83d1ebc9e304 Chunming Zhou        2017-05-09  209  	if (ring->funcs->emit=
_pipeline_sync && job &&
1b2d5eda5ad785 Christian K=C3=B6nig      2022-09-29  210  	    ((tmp =3D am=
dgpu_sync_get_fence(&job->explicit_sync)) ||
def59436fb0d3c Christian K=C3=B6nig      2024-12-20  211  	     need_ctx_sw=
itch || amdgpu_vm_need_pipeline_sync(ring, job))) {
def59436fb0d3c Christian K=C3=B6nig      2024-12-20  212 =20
8fdf074f1840ea Monk Liu             2017-06-06  213  		need_pipe_sync =3D t=
rue;
65f7260b135669 Andrey Grodzovsky    2018-07-31  214 =20
65f7260b135669 Andrey Grodzovsky    2018-07-31  215  		if (tmp)
65f7260b135669 Andrey Grodzovsky    2018-07-31  216  			trace_amdgpu_ib_pip=
e_sync(job, tmp);
65f7260b135669 Andrey Grodzovsky    2018-07-31  217 =20
df83d1ebc9e304 Chunming Zhou        2017-05-09  218  		dma_fence_put(tmp);
df83d1ebc9e304 Chunming Zhou        2017-05-09  219  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  220 =20
a17ef941212bf2 Alex Deucher         2026-01-15 @221  	if (job) {
a17ef941212bf2 Alex Deucher         2026-01-15  222  		vm_af =3D job->hw_vm=
_fence;
a17ef941212bf2 Alex Deucher         2026-01-15  223  		/* VM sequence */
a17ef941212bf2 Alex Deucher         2026-01-15  224  		vm_af->ib_wptr =3D r=
ing->wptr;
cb1e657ccac89b Alex Deucher         2026-06-05  225  		amdgpu_vm_flush(ring=
, job, need_pipe_sync, &emit_spm_needed,
cb1e657ccac89b Alex Deucher         2026-06-05  226  				&emit_gds_needed);
a17ef941212bf2 Alex Deucher         2026-01-15  227  		vm_af->ib_dw_size =
=3D
a17ef941212bf2 Alex Deucher         2026-01-15  228  			amdgpu_ring_get_dw_=
distance(ring, vm_af->ib_wptr, ring->wptr);
a17ef941212bf2 Alex Deucher         2026-01-15  229  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  230 =20
a17ef941212bf2 Alex Deucher         2026-01-15  231  	/* IB sequence */
a17ef941212bf2 Alex Deucher         2026-01-15  232  	af->ib_wptr =3D ring-=
>wptr;
3f4c175d62d898 Jiadong.Zhu          2022-09-07  233  	amdgpu_ring_ib_begin(=
ring);
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  234 =20
d3499de3b737f3 Alex Deucher         2026-01-23  235  	if (ring->funcs->inse=
rt_start)
d3499de3b737f3 Alex Deucher         2026-01-23  236  		ring->funcs->insert_=
start(ring);
d3499de3b737f3 Alex Deucher         2026-01-23  237 =20
cb1e657ccac89b Alex Deucher         2026-06-05  238  	if (emit_spm_needed)
cb1e657ccac89b Alex Deucher         2026-06-05 @239  		adev->gfx.rlc.funcs-=
>update_spm_vmid(adev, ring->xcc_id, ring, job->vmid);
cb1e657ccac89b Alex Deucher         2026-06-05  240 =20
cb1e657ccac89b Alex Deucher         2026-06-05  241  	if (emit_gds_needed)
cb1e657ccac89b Alex Deucher         2026-06-05  242  		amdgpu_ring_emit_gds=
_switch(ring, job->vmid, job->gds_base,
cb1e657ccac89b Alex Deucher         2026-06-05  243  					    job->gds_size=
, job->gws_base,
cb1e657ccac89b Alex Deucher         2026-06-05  244  					    job->gws_size=
, job->oa_base,
cb1e657ccac89b Alex Deucher         2026-06-05  245  					    job->oa_size);
cb1e657ccac89b Alex Deucher         2026-06-05  246 =20
d3499de3b737f3 Alex Deucher         2026-01-23  247  	if ((ib->flags & AMDG=
PU_IB_FLAG_EMIT_MEM_SYNC) && ring->funcs->emit_mem_sync)
d3499de3b737f3 Alex Deucher         2026-01-23  248  		ring->funcs->emit_me=
m_sync(ring);
d3499de3b737f3 Alex Deucher         2026-01-23  249 =20
d3499de3b737f3 Alex Deucher         2026-01-23  250  	if (ring->funcs->emit=
_wave_limit &&
d3499de3b737f3 Alex Deucher         2026-01-23  251  	    ring->hw_prio =3D=
=3D AMDGPU_GFX_PIPE_PRIO_HIGH)
d3499de3b737f3 Alex Deucher         2026-01-23  252  		ring->funcs->emit_wa=
ve_limit(ring, true);
d3499de3b737f3 Alex Deucher         2026-01-23  253 =20
ba205ac3d6e83f Alex Deucher         2026-01-26  254  	if (ring->funcs->emit=
_gfx_shadow && adev->gfx.cp_gfx_shadow)
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  255  		amdgpu_ring_emi=
t_gfx_shadow(ring, shadow_va, csa_va, gds_va,
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  256  					    init_sha=
dow, vmid);
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  257 =20
38be7796f310cd Alex Deucher         2023-03-16  258  	if (ring->funcs->init=
_cond_exec)
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  259  		cond_exec =3D a=
mdgpu_ring_init_cond_exec(ring,
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  260  						       ring=
->cond_exe_gpu_addr);
e9d672b2910a8d Monk Liu             2017-03-15  261 =20
a17ef941212bf2 Alex Deucher         2026-01-15  262  	/* Skip the IB for gu=
ilty contexts */
a17ef941212bf2 Alex Deucher         2026-01-15  263  	af->skip_ib_dw_start_=
offset =3D
a17ef941212bf2 Alex Deucher         2026-01-15  264  		amdgpu_ring_get_dw_d=
istance(ring, af->ib_wptr, ring->wptr);
810085ddb7b76c Eric Huang           2021-06-02  265  	amdgpu_device_flush_h=
dp(adev, ring);
d2edb07b10fce5 Christian K=C3=B6nig      2015-05-11  266 =20
753ad49c9fdfc7 Monk Liu             2016-08-26  267  	if (need_ctx_switch)
753ad49c9fdfc7 Monk Liu             2016-08-26  268  		status |=3D AMDGPU_H=
AVE_CTX_SWITCH;
7e6bf80f739bc2 Monk Liu             2017-01-17  269 =20
c4c905ec7b8aae Jack Xiao            2019-01-18  270  	if (job && ring->func=
s->emit_cntxcntl) {
c4c905ec7b8aae Jack Xiao            2019-01-18  271  		status |=3D job->pre=
amble_status;
d8780dc71d56ac Jack Xiao            2019-01-17  272  		status |=3D job->pre=
emption_status;
0bb5d5b03f78ae Luben Tuikov         2020-04-22  273  		amdgpu_ring_emit_cnt=
xcntl(ring, status);
753ad49c9fdfc7 Monk Liu             2016-08-26  274  	}
753ad49c9fdfc7 Monk Liu             2016-08-26  275 =20
f77c9aff85caa9 Huang Rui            2020-03-09  276  	/* Setup initial TMZi=
ness and send it off.
f77c9aff85caa9 Huang Rui            2020-03-09  277  	 */
0bb5d5b03f78ae Luben Tuikov         2020-04-22  278  	secure =3D false;
f77c9aff85caa9 Huang Rui            2020-03-09  279  	if (job && ring->func=
s->emit_frame_cntl) {
f77c9aff85caa9 Huang Rui            2020-03-09  280  		secure =3D ib->flags=
 & AMDGPU_IB_FLAGS_SECURE;
f77c9aff85caa9 Huang Rui            2020-03-09  281  		amdgpu_ring_emit_fra=
me_cntl(ring, true, secure);
f77c9aff85caa9 Huang Rui            2020-03-09  282  	}
f77c9aff85caa9 Huang Rui            2020-03-09  283 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  284  	for (i =3D 0; i < num=
_ibs; ++i) {
f153d2867bf74f Christian K=C3=B6nig      2016-05-06  285  		ib =3D &ibs[i];
9f8fb5a2b339ba Christian K=C3=B6nig      2016-05-06  286 =20
f77c9aff85caa9 Huang Rui            2020-03-09  287  		if (job && ring->fun=
cs->emit_frame_cntl) {
f77c9aff85caa9 Huang Rui            2020-03-09  288  			if (secure !=3D !!(=
ib->flags & AMDGPU_IB_FLAGS_SECURE)) {
f77c9aff85caa9 Huang Rui            2020-03-09  289  				amdgpu_ring_emit_f=
rame_cntl(ring, false, secure);
f77c9aff85caa9 Huang Rui            2020-03-09  290  				secure =3D !secure;
f77c9aff85caa9 Huang Rui            2020-03-09  291  				amdgpu_ring_emit_f=
rame_cntl(ring, true, secure);
0bb5d5b03f78ae Luben Tuikov         2020-04-22  292  			}
0bb5d5b03f78ae Luben Tuikov         2020-04-22  293  		}
0bb5d5b03f78ae Luben Tuikov         2020-04-22  294 =20
c4c905ec7b8aae Jack Xiao            2019-01-18  295  		amdgpu_ring_emit_ib(=
ring, job, ib, status);
c4c905ec7b8aae Jack Xiao            2019-01-18  296  		status &=3D ~AMDGPU_=
HAVE_CTX_SWITCH;
d38ceaf99ed015 Alex Deucher         2015-04-20  297  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  298 =20
f77c9aff85caa9 Huang Rui            2020-03-09  299  	if (job && ring->func=
s->emit_frame_cntl)
f77c9aff85caa9 Huang Rui            2020-03-09  300  		amdgpu_ring_emit_fra=
me_cntl(ring, false, secure);
3b4d68e993d941 Monk Liu             2017-05-01  301 =20
810085ddb7b76c Eric Huang           2021-06-02  302  	amdgpu_device_invalid=
ate_hdp(adev, ring);
a17ef941212bf2 Alex Deucher         2026-01-15  303  	/* Skip the IB for gu=
ilty contexts */
a17ef941212bf2 Alex Deucher         2026-01-15  304  	af->skip_ib_dw_end_of=
fset =3D
a17ef941212bf2 Alex Deucher         2026-01-15  305  		amdgpu_ring_get_dw_d=
istance(ring, af->ib_wptr, ring->wptr);
11afbde85eeba1 Chunming Zhou        2016-03-03  306 =20
d240cd9eddd943 Marek Ol=C5=A1=C3=A1k          2018-04-03  307  	if (ib->fla=
gs & AMDGPU_IB_FLAG_TC_WB_NOT_INVALIDATE)
d240cd9eddd943 Marek Ol=C5=A1=C3=A1k          2018-04-03  308  		fence_flag=
s |=3D AMDGPU_FENCE_FLAG_TC_WB_ONLY;
d240cd9eddd943 Marek Ol=C5=A1=C3=A1k          2018-04-03  309 =20
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  310  	/* wrap the last=
 IB with fence */
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  311  	if (job && job->=
uf_addr) {
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  312  		amdgpu_ring_emi=
t_fence(ring, job->uf_addr, job->uf_sequence,
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  313  				       fence_=
flags | AMDGPU_FENCE_FLAG_64BIT);
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  314  	}
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  315 =20
ba205ac3d6e83f Alex Deucher         2026-01-26  316  	if (ring->funcs->emit=
_gfx_shadow && ring->funcs->init_cond_exec &&
ba205ac3d6e83f Alex Deucher         2026-01-26  317  	    adev->gfx.cp_gfx_=
shadow) {
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  318  		amdgpu_ring_emi=
t_gfx_shadow(ring, 0, 0, 0, false, 0);
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  319  		amdgpu_ring_ini=
t_cond_exec(ring, ring->cond_exe_gpu_addr);
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  320  	}
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  321 =20
7abc868acf804e Srinivasan Shanmugam 2026-02-10  322  	amdgpu_fence_emit(rin=
g, af, fence_flags);
db36632ea51e8b Alex Deucher         2025-08-27  323  	*f =3D &af->base;
f903b85ed0f14f Alex Deucher         2025-10-22  324  	/* get a ref for the =
job */
f903b85ed0f14f Alex Deucher         2025-10-22  325  	if (job)
f903b85ed0f14f Alex Deucher         2025-10-22  326  		dma_fence_get(*f);
d38ceaf99ed015 Alex Deucher         2015-04-20  327 =20
135d4735d8c5d8 Leo Liu              2016-12-14  328  	if (ring->funcs->inse=
rt_end)
135d4735d8c5d8 Leo Liu              2016-12-14  329  		ring->funcs->insert_=
end(ring);
135d4735d8c5d8 Leo Liu              2016-12-14  330 =20
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  331  	amdgpu_ring_patc=
h_cond_exec(ring, cond_exec);
03ccf481980f8d Monk Liu             2016-01-14  332 =20
3aecd24c65b953 Monk Liu             2016-08-25  333  	ring->current_ctx =3D =
fence_ctx;
b529093999ff05 Lin.Cao              2025-01-14  334  	if (job && ring->func=
s->emit_switch_buffer)
c2167a659cc910 Monk Liu             2016-08-26  335  		amdgpu_ring_emit_swi=
tch_buffer(ring);
22e4f31529534e Nirmoy Das           2021-01-27  336 =20
22e4f31529534e Nirmoy Das           2021-01-27  337  	if (ring->funcs->emit=
_wave_limit &&
22e4f31529534e Nirmoy Das           2021-01-27  338  	    ring->hw_prio =3D=
=3D AMDGPU_GFX_PIPE_PRIO_HIGH)
22e4f31529534e Nirmoy Das           2021-01-27  339  		ring->funcs->emit_wa=
ve_limit(ring, false);
22e4f31529534e Nirmoy Das           2021-01-27  340 =20
d3499de3b737f3 Alex Deucher         2026-01-23  341  	amdgpu_ring_ib_end(ri=
ng);
a17ef941212bf2 Alex Deucher         2026-01-15  342 =20
a17ef941212bf2 Alex Deucher         2026-01-15  343  	af->ib_dw_size =3D am=
dgpu_ring_get_dw_distance(ring, af->ib_wptr, ring->wptr);
77cc0da39c7ce2 Alex Deucher         2025-05-27  344 =20
a27de35caab59b Christian K=C3=B6nig      2016-01-21  345  	amdgpu_ring_comm=
it(ring);
77cc0da39c7ce2 Alex Deucher         2025-05-27  346 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  347  	return 0;
f903b85ed0f14f Alex Deucher         2025-10-22  348 =20
f903b85ed0f14f Alex Deucher         2025-10-22  349  free_fence:
f903b85ed0f14f Alex Deucher         2025-10-22  350  	if (!job)
f903b85ed0f14f Alex Deucher         2025-10-22  351  		kfree(af);
f903b85ed0f14f Alex Deucher         2025-10-22  352  	return r;
d38ceaf99ed015 Alex Deucher         2015-04-20  353  }
d38ceaf99ed015 Alex Deucher         2015-04-20  354 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
