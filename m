Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F415E5BB
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769262078; cv=none; b=QtK2mFh9bZfWconL622bLuZiGes8reEsBYTGW0yC/kBsjuF+kDltrSIxE9ECBt85hpVJf04LWB4G7aEIKAv1dDc3NF1kzqhROIY1NMnM5EMdffxgb6uJEyZd8JH+DBWczlAqb47Zf3chKVcOVslVk9aeZjto64i7m0GEGEEiEYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769262078; c=relaxed/simple;
	bh=3CICLpcZe+xgUTIFQHl5242xA8gGubO1+Mx6w1Oz0rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BWdtJo62gA1XwxkOhXu525FFajTLxbptePEYqcsclPQV2WiqBU6R8FrEGVJ4qf7MIIhgRYL5BHu5zfdGWIVqztJyv+dfTUcN1iqVguWWwSCE/4KG8aOpyIBmOnWTabMogQxYbH5P9fBHQNQ+M+nCGiLbP90+lq2vXMp+NEroD1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdglFu2u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdglFu2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769262076; x=1800798076;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3CICLpcZe+xgUTIFQHl5242xA8gGubO1+Mx6w1Oz0rg=;
  b=GdglFu2uNOKWyaLmnlQDf07ea5/EHbmPOYj9Yh15xu9uDKeN/dfImb9P
   7z2lJ64v+ua8FIGgNNH+oMI5X3WRKudI5l2Z8icIOW7hXb+5+hyW/u//C
   ez/YIvI7BgqaaQRPy3D9dK0IGxGf+ZPER0R2oVgeubJhSyVXyazjgehuu
   3MTeY2ZN3Emt/wrkcAF6SsevWD+/BOCWgWdrlAqxckYnukUd0YowjW0xy
   PG3GO3a0bhq2hurBK8TBV0zJGmqAQkGlLWIn03SfwAerhLjyRYeBy/Av6
   Ef3237UMnVp9zpXphHrJLjZ2MRqlAmvicDKbNRoqWboq3Dngz1IPWxQHv
   w==;
X-CSE-ConnectionGUID: JzY6F4l7RfmGZo5PCWI/3A==
X-CSE-MsgGUID: 5x3ED1UfT/ib4K8CK3ad+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81603578"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="81603578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 05:41:15 -0800
X-CSE-ConnectionGUID: oQ5caMoAQeWozJRsjRGdMg==
X-CSE-MsgGUID: 7Zri9v1lRdWZqAZV6WEPDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="230226065"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2026 05:41:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjdt0-00000000VD4-45PD;
	Sat, 24 Jan 2026 13:41:10 +0000
Date: Sat, 24 Jan 2026 21:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7695/9539]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:232 amdgpu_ib_schedule() warn: missing
 unwind goto?
Message-ID: <202601242106.1M65oIxI-lkp@intel.com>
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
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 5eb680a06007f2f6ea333d11a4e29039da90614b [7695/9539] drm/amdgpu: fi=
x error handling in ib_schedule()
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/arc=
hive/20260124/202601242106.1M65oIxI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601242106.1M65oIxI-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:232 amdgpu_ib_schedule() warn: missi=
ng unwind goto?

vim +232 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c

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
7d9c70d23550eb Jiansong Chen        2021-05-13  132  	bool need_ctx_switch;
92f250989b7098 Christian K=C3=B6nig      2016-05-06  133  	struct amdgpu_vm=
 *vm;
3aecd24c65b953 Monk Liu             2016-08-25  134  	uint64_t fence_ctx;
9a9db6ef7cf486 Alex Deucher         2016-09-16  135  	uint32_t status =3D 0=
, alloc_size;
fc8e55f378cf11 Srinivasan Shanmugam 2023-07-23  136  	unsigned int fence_fl=
ags =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  137  	bool secure, ini=
t_shadow;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  138  	u64 shadow_va, c=
sa_va, gds_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  139  	int vmid =3D AMD=
GPU_JOB_GET_VMID(job);
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  140  	bool need_pipe_s=
ync =3D false;
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  141  	unsigned int con=
d_exec;
fc8e55f378cf11 Srinivasan Shanmugam 2023-07-23  142  	unsigned int i;
d38ceaf99ed015 Alex Deucher         2015-04-20  143  	int r =3D 0;
d38ceaf99ed015 Alex Deucher         2015-04-20  144 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  145  	if (num_ibs =3D=3D 0)
d38ceaf99ed015 Alex Deucher         2015-04-20  146  		return -EINVAL;
d38ceaf99ed015 Alex Deucher         2015-04-20  147 =20
92f250989b7098 Christian K=C3=B6nig      2016-05-06  148  	/* ring tests do=
n't use a job */
92f250989b7098 Christian K=C3=B6nig      2016-05-06  149  	if (job) {
c5637837ba5d5b Monk Liu             2016-04-19  150  		vm =3D job->vm;
dcafbd50f2e4d5 Felix Kuehling       2019-09-05  151  		fence_ctx =3D job->b=
ase.s_fence ?
db36632ea51e8b Alex Deucher         2025-08-27  152  			job->base.s_fence->=
finished.context : 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  153  		shadow_va =3D j=
ob->shadow_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  154  		csa_va =3D job-=
>csa_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  155  		gds_va =3D job-=
>gds_va;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  156  		init_shadow =3D =
job->init_shadow;
db36632ea51e8b Alex Deucher         2025-08-27  157  		af =3D job->hw_fence;
77cc0da39c7ce2 Alex Deucher         2025-05-27  158  		/* Save the context =
of the job for reset handling.
77cc0da39c7ce2 Alex Deucher         2025-05-27  159  		 * The driver needs =
this so it can skip the ring
77cc0da39c7ce2 Alex Deucher         2025-05-27  160  		 * contents for guil=
ty contexts.
77cc0da39c7ce2 Alex Deucher         2025-05-27  161  		 */
db36632ea51e8b Alex Deucher         2025-08-27  162  		af->context =3D fenc=
e_ctx;
db36632ea51e8b Alex Deucher         2025-08-27  163  		/* the vm fence is a=
lso part of the job's context */
db36632ea51e8b Alex Deucher         2025-08-27  164  		job->hw_vm_fence->co=
ntext =3D fence_ctx;
92f250989b7098 Christian K=C3=B6nig      2016-05-06  165  	} else {
92f250989b7098 Christian K=C3=B6nig      2016-05-06  166  		vm =3D NULL;
3aecd24c65b953 Monk Liu             2016-08-25  167  		fence_ctx =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  168  		shadow_va =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  169  		csa_va =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  170  		gds_va =3D 0;
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  171  		init_shadow =3D =
false;
db36632ea51e8b Alex Deucher         2025-08-27  172  		af =3D kzalloc(sizeo=
f(*af), GFP_ATOMIC);
db36632ea51e8b Alex Deucher         2025-08-27  173  		if (!af)
db36632ea51e8b Alex Deucher         2025-08-27  174  			return -ENOMEM;
92f250989b7098 Christian K=C3=B6nig      2016-05-06  175  	}
d919ad49ac04e1 Christian K=C3=B6nig      2015-05-11  176 =20
4220d2c7c41b8e Alex Deucher         2025-03-12  177  	if (!ring->sched.read=
y) {
1b5836492de6a7 Tom St Denis         2016-08-22  178  		dev_err(adev->dev, "=
couldn't schedule ib on ring <%s>\n", ring->name);
f903b85ed0f14f Alex Deucher         2025-10-22  179  		r =3D -EINVAL;
f903b85ed0f14f Alex Deucher         2025-10-22  180  		goto free_fence;
d38ceaf99ed015 Alex Deucher         2015-04-20  181  	}
be86c606b50a53 Chunming Zhou        2016-01-15  182 =20
4220d2c7c41b8e Alex Deucher         2025-03-12  183  	if (vm && !job->vmid)=
 {
8d0a7cea824a27 Christian K=C3=B6nig      2015-11-03  184  		dev_err(adev->d=
ev, "VM IB without ID\n");
f903b85ed0f14f Alex Deucher         2025-10-22  185  		r =3D -EINVAL;
f903b85ed0f14f Alex Deucher         2025-10-22  186  		goto free_fence;
d38ceaf99ed015 Alex Deucher         2015-04-20  187  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  188 =20
b33f9d70b36889 Alex Deucher         2020-04-23  189  	if ((ib->flags & AMDG=
PU_IB_FLAGS_SECURE) &&
8c0f11ff3895ec Lang Yu              2022-03-15  190  	    (!ring->funcs->se=
cure_submission_supported)) {
8c0f11ff3895ec Lang Yu              2022-03-15  191  		dev_err(adev->dev, "=
secure submissions not supported on ring <%s>\n", ring->name);
f903b85ed0f14f Alex Deucher         2025-10-22  192  		r =3D -EINVAL;
f903b85ed0f14f Alex Deucher         2025-10-22  193  		goto free_fence;
b33f9d70b36889 Alex Deucher         2020-04-23  194  	}
b33f9d70b36889 Alex Deucher         2020-04-23  195 =20
e12f3d7a23c996 Christian K=C3=B6nig      2016-10-05  196  	alloc_size =3D r=
ing->funcs->emit_frame_size + num_ibs *
e12f3d7a23c996 Christian K=C3=B6nig      2016-10-05  197  		ring->funcs->em=
it_ib_size;
9a9db6ef7cf486 Alex Deucher         2016-09-16  198 =20
9a9db6ef7cf486 Alex Deucher         2016-09-16  199  	r =3D amdgpu_ring_all=
oc(ring, alloc_size);
91e1a5207edec9 Christian K=C3=B6nig      2015-07-06  200  	if (r) {
8d0a7cea824a27 Christian K=C3=B6nig      2015-11-03  201  		dev_err(adev->d=
ev, "scheduling IB failed (%d).\n", r);
f903b85ed0f14f Alex Deucher         2025-10-22  202  		goto free_fence;
91e1a5207edec9 Christian K=C3=B6nig      2015-07-06  203  	}
df83d1ebc9e304 Chunming Zhou        2017-05-09  204 =20
4f0ecd36f27694 Emily Deng           2018-08-22  205  	need_ctx_switch =3D r=
ing->current_ctx !=3D fence_ctx;
df83d1ebc9e304 Chunming Zhou        2017-05-09  206  	if (ring->funcs->emit=
_pipeline_sync && job &&
1b2d5eda5ad785 Christian K=C3=B6nig      2022-09-29  207  	    ((tmp =3D am=
dgpu_sync_get_fence(&job->explicit_sync)) ||
def59436fb0d3c Christian K=C3=B6nig      2024-12-20  208  	     need_ctx_sw=
itch || amdgpu_vm_need_pipeline_sync(ring, job))) {
def59436fb0d3c Christian K=C3=B6nig      2024-12-20  209 =20
8fdf074f1840ea Monk Liu             2017-06-06  210  		need_pipe_sync =3D t=
rue;
65f7260b135669 Andrey Grodzovsky    2018-07-31  211 =20
65f7260b135669 Andrey Grodzovsky    2018-07-31  212  		if (tmp)
65f7260b135669 Andrey Grodzovsky    2018-07-31  213  			trace_amdgpu_ib_pip=
e_sync(job, tmp);
65f7260b135669 Andrey Grodzovsky    2018-07-31  214 =20
df83d1ebc9e304 Chunming Zhou        2017-05-09  215  		dma_fence_put(tmp);
df83d1ebc9e304 Chunming Zhou        2017-05-09  216  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  217 =20
43c8546bcd8548 Andrey Grodzovsky    2020-04-28  218  	if ((ib->flags & AMDG=
PU_IB_FLAG_EMIT_MEM_SYNC) && ring->funcs->emit_mem_sync)
43c8546bcd8548 Andrey Grodzovsky    2020-04-28  219  		ring->funcs->emit_me=
m_sync(ring);
43c8546bcd8548 Andrey Grodzovsky    2020-04-28  220 =20
22e4f31529534e Nirmoy Das           2021-01-27  221  	if (ring->funcs->emit=
_wave_limit &&
22e4f31529534e Nirmoy Das           2021-01-27  222  	    ring->hw_prio =3D=
=3D AMDGPU_GFX_PIPE_PRIO_HIGH)
22e4f31529534e Nirmoy Das           2021-01-27  223  		ring->funcs->emit_wa=
ve_limit(ring, true);
22e4f31529534e Nirmoy Das           2021-01-27  224 =20
ef44f8541e8e99 Leo Liu              2017-05-11  225  	if (ring->funcs->inse=
rt_start)
ef44f8541e8e99 Leo Liu              2017-05-11  226  		ring->funcs->insert_=
start(ring);
ef44f8541e8e99 Leo Liu              2017-05-11  227 =20
df264f9e08081c Christian K=C3=B6nig      2017-06-28  228  	if (job) {
8fdf074f1840ea Monk Liu             2017-06-06  229  		r =3D amdgpu_vm_flus=
h(ring, job, need_pipe_sync);
41d9eb2c5a2a21 Christian K=C3=B6nig      2016-03-01  230  		if (r) {
41d9eb2c5a2a21 Christian K=C3=B6nig      2016-03-01  231  			amdgpu_ring_un=
do(ring);
41d9eb2c5a2a21 Christian K=C3=B6nig      2016-03-01 @232  			return r;
41d9eb2c5a2a21 Christian K=C3=B6nig      2016-03-01  233  		}
794ff5710eb1d8 Monk Liu             2016-05-04  234  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  235 =20
3f4c175d62d898 Jiadong.Zhu          2022-09-07  236  	amdgpu_ring_ib_begin(=
ring);
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  237 =20
38be7796f310cd Alex Deucher         2023-03-16  238  	if (ring->funcs->emit=
_gfx_shadow)
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  239  		amdgpu_ring_emi=
t_gfx_shadow(ring, shadow_va, csa_va, gds_va,
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  240  					    init_sha=
dow, vmid);
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  241 =20
38be7796f310cd Alex Deucher         2023-03-16  242  	if (ring->funcs->init=
_cond_exec)
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  243  		cond_exec =3D a=
mdgpu_ring_init_cond_exec(ring,
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  244  						       ring=
->cond_exe_gpu_addr);
e9d672b2910a8d Monk Liu             2017-03-15  245 =20
810085ddb7b76c Eric Huang           2021-06-02  246  	amdgpu_device_flush_h=
dp(adev, ring);
d2edb07b10fce5 Christian K=C3=B6nig      2015-05-11  247 =20
753ad49c9fdfc7 Monk Liu             2016-08-26  248  	if (need_ctx_switch)
753ad49c9fdfc7 Monk Liu             2016-08-26  249  		status |=3D AMDGPU_H=
AVE_CTX_SWITCH;
7e6bf80f739bc2 Monk Liu             2017-01-17  250 =20
c4c905ec7b8aae Jack Xiao            2019-01-18  251  	if (job && ring->func=
s->emit_cntxcntl) {
c4c905ec7b8aae Jack Xiao            2019-01-18  252  		status |=3D job->pre=
amble_status;
d8780dc71d56ac Jack Xiao            2019-01-17  253  		status |=3D job->pre=
emption_status;
0bb5d5b03f78ae Luben Tuikov         2020-04-22  254  		amdgpu_ring_emit_cnt=
xcntl(ring, status);
753ad49c9fdfc7 Monk Liu             2016-08-26  255  	}
753ad49c9fdfc7 Monk Liu             2016-08-26  256 =20
f77c9aff85caa9 Huang Rui            2020-03-09  257  	/* Setup initial TMZi=
ness and send it off.
f77c9aff85caa9 Huang Rui            2020-03-09  258  	 */
0bb5d5b03f78ae Luben Tuikov         2020-04-22  259  	secure =3D false;
f77c9aff85caa9 Huang Rui            2020-03-09  260  	if (job && ring->func=
s->emit_frame_cntl) {
f77c9aff85caa9 Huang Rui            2020-03-09  261  		secure =3D ib->flags=
 & AMDGPU_IB_FLAGS_SECURE;
f77c9aff85caa9 Huang Rui            2020-03-09  262  		amdgpu_ring_emit_fra=
me_cntl(ring, true, secure);
f77c9aff85caa9 Huang Rui            2020-03-09  263  	}
f77c9aff85caa9 Huang Rui            2020-03-09  264 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  265  	for (i =3D 0; i < num=
_ibs; ++i) {
f153d2867bf74f Christian K=C3=B6nig      2016-05-06  266  		ib =3D &ibs[i];
9f8fb5a2b339ba Christian K=C3=B6nig      2016-05-06  267 =20
f77c9aff85caa9 Huang Rui            2020-03-09  268  		if (job && ring->fun=
cs->emit_frame_cntl) {
f77c9aff85caa9 Huang Rui            2020-03-09  269  			if (secure !=3D !!(=
ib->flags & AMDGPU_IB_FLAGS_SECURE)) {
f77c9aff85caa9 Huang Rui            2020-03-09  270  				amdgpu_ring_emit_f=
rame_cntl(ring, false, secure);
f77c9aff85caa9 Huang Rui            2020-03-09  271  				secure =3D !secure;
f77c9aff85caa9 Huang Rui            2020-03-09  272  				amdgpu_ring_emit_f=
rame_cntl(ring, true, secure);
0bb5d5b03f78ae Luben Tuikov         2020-04-22  273  			}
0bb5d5b03f78ae Luben Tuikov         2020-04-22  274  		}
0bb5d5b03f78ae Luben Tuikov         2020-04-22  275 =20
c4c905ec7b8aae Jack Xiao            2019-01-18  276  		amdgpu_ring_emit_ib(=
ring, job, ib, status);
c4c905ec7b8aae Jack Xiao            2019-01-18  277  		status &=3D ~AMDGPU_=
HAVE_CTX_SWITCH;
d38ceaf99ed015 Alex Deucher         2015-04-20  278  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  279 =20
f77c9aff85caa9 Huang Rui            2020-03-09  280  	if (job && ring->func=
s->emit_frame_cntl)
f77c9aff85caa9 Huang Rui            2020-03-09  281  		amdgpu_ring_emit_fra=
me_cntl(ring, false, secure);
3b4d68e993d941 Monk Liu             2017-05-01  282 =20
810085ddb7b76c Eric Huang           2021-06-02  283  	amdgpu_device_invalid=
ate_hdp(adev, ring);
11afbde85eeba1 Chunming Zhou        2016-03-03  284 =20
d240cd9eddd943 Marek Ol=C5=A1=C3=A1k          2018-04-03  285  	if (ib->fla=
gs & AMDGPU_IB_FLAG_TC_WB_NOT_INVALIDATE)
d240cd9eddd943 Marek Ol=C5=A1=C3=A1k          2018-04-03  286  		fence_flag=
s |=3D AMDGPU_FENCE_FLAG_TC_WB_ONLY;
d240cd9eddd943 Marek Ol=C5=A1=C3=A1k          2018-04-03  287 =20
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  288  	/* wrap the last=
 IB with fence */
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  289  	if (job && job->=
uf_addr) {
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  290  		amdgpu_ring_emi=
t_fence(ring, job->uf_addr, job->uf_sequence,
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  291  				       fence_=
flags | AMDGPU_FENCE_FLAG_64BIT);
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  292  	}
9fc15f5fc83671 Nicolai H=C3=A4hnle       2018-06-29  293 =20
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  294  	if (ring->funcs-=
>emit_gfx_shadow && ring->funcs->init_cond_exec) {
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  295  		amdgpu_ring_emi=
t_gfx_shadow(ring, 0, 0, 0, false, 0);
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  296  		amdgpu_ring_ini=
t_cond_exec(ring, ring->cond_exe_gpu_addr);
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  297  	}
ac9287055ff16a Christian K=C3=B6nig      2023-03-09  298 =20
db36632ea51e8b Alex Deucher         2025-08-27  299  	r =3D amdgpu_fence_em=
it(ring, af, fence_flags);
d38ceaf99ed015 Alex Deucher         2015-04-20  300  	if (r) {
d38ceaf99ed015 Alex Deucher         2015-04-20  301  		dev_err(adev->dev, "=
failed to emit fence (%d)\n", r);
c4f46f22c448ff Christian K=C3=B6nig      2017-12-18  302  		if (job && job-=
>vmid)
0530553ba84288 Le Ma                2022-05-19  303  			amdgpu_vmid_reset(a=
dev, ring->vm_hub, job->vmid);
a27de35caab59b Christian K=C3=B6nig      2016-01-21  304  		amdgpu_ring_und=
o(ring);
5eb680a06007f2 Alex Deucher         2025-12-29  305  		goto free_fence;
d38ceaf99ed015 Alex Deucher         2015-04-20  306  	}
db36632ea51e8b Alex Deucher         2025-08-27  307  	*f =3D &af->base;
f903b85ed0f14f Alex Deucher         2025-10-22  308  	/* get a ref for the =
job */
f903b85ed0f14f Alex Deucher         2025-10-22  309  	if (job)
f903b85ed0f14f Alex Deucher         2025-10-22  310  		dma_fence_get(*f);
d38ceaf99ed015 Alex Deucher         2015-04-20  311 =20
135d4735d8c5d8 Leo Liu              2016-12-14  312  	if (ring->funcs->inse=
rt_end)
135d4735d8c5d8 Leo Liu              2016-12-14  313  		ring->funcs->insert_=
end(ring);
135d4735d8c5d8 Leo Liu              2016-12-14  314 =20
c68cbbfd54c684 Christian K=C3=B6nig      2023-08-15  315  	amdgpu_ring_patc=
h_cond_exec(ring, cond_exec);
03ccf481980f8d Monk Liu             2016-01-14  316 =20
3aecd24c65b953 Monk Liu             2016-08-25  317  	ring->current_ctx =3D =
fence_ctx;
b529093999ff05 Lin.Cao              2025-01-14  318  	if (job && ring->func=
s->emit_switch_buffer)
c2167a659cc910 Monk Liu             2016-08-26  319  		amdgpu_ring_emit_swi=
tch_buffer(ring);
22e4f31529534e Nirmoy Das           2021-01-27  320 =20
22e4f31529534e Nirmoy Das           2021-01-27  321  	if (ring->funcs->emit=
_wave_limit &&
22e4f31529534e Nirmoy Das           2021-01-27  322  	    ring->hw_prio =3D=
=3D AMDGPU_GFX_PIPE_PRIO_HIGH)
22e4f31529534e Nirmoy Das           2021-01-27  323  		ring->funcs->emit_wa=
ve_limit(ring, false);
22e4f31529534e Nirmoy Das           2021-01-27  324 =20
77cc0da39c7ce2 Alex Deucher         2025-05-27  325  	/* Save the wptr asso=
ciated with this fence.
77cc0da39c7ce2 Alex Deucher         2025-05-27  326  	 * This must be last =
for resets to work properly
77cc0da39c7ce2 Alex Deucher         2025-05-27  327  	 * as we need to save=
 the wptr associated with this
77cc0da39c7ce2 Alex Deucher         2025-05-27  328  	 * fence so we know w=
hat rings contents to backup
77cc0da39c7ce2 Alex Deucher         2025-05-27  329  	 * after we reset the=
 queue.
77cc0da39c7ce2 Alex Deucher         2025-05-27  330  	 */
db36632ea51e8b Alex Deucher         2025-08-27  331  	amdgpu_fence_save_wpt=
r(af);
77cc0da39c7ce2 Alex Deucher         2025-05-27  332 =20
3f4c175d62d898 Jiadong.Zhu          2022-09-07  333  	amdgpu_ring_ib_end(ri=
ng);
a27de35caab59b Christian K=C3=B6nig      2016-01-21  334  	amdgpu_ring_comm=
it(ring);
77cc0da39c7ce2 Alex Deucher         2025-05-27  335 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  336  	return 0;
f903b85ed0f14f Alex Deucher         2025-10-22  337 =20
f903b85ed0f14f Alex Deucher         2025-10-22  338  free_fence:
f903b85ed0f14f Alex Deucher         2025-10-22  339  	if (!job)
f903b85ed0f14f Alex Deucher         2025-10-22  340  		kfree(af);
f903b85ed0f14f Alex Deucher         2025-10-22  341  	return r;
d38ceaf99ed015 Alex Deucher         2015-04-20  342  }
d38ceaf99ed015 Alex Deucher         2015-04-20  343 =20

:::::: The code at line 232 was first introduced by commit
:::::: 41d9eb2c5a2a21c9120e906d077e77562883510e drm/amdgpu: add a fence aft=
er the VM flush

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
