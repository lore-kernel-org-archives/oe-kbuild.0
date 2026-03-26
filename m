Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED033939BD
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 03:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495803; cv=none; b=UbKi/BZFx3A2iicJ/URDkXQUHbJiplYTdjB3zfK9ubJXBr8Q4VA9bR5qlJIXk1YLMbWICNL1J4gX+wgrNX51Hb0isd1Xdvd1lJIalBuatL6K9XIcC1pIpiTSL8XnRAijqzpewVxSWpORUYO4PxoGWzSjISIaUv3MmmP0pXFR6Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495803; c=relaxed/simple;
	bh=SKSO3UpUl+gsSTEXWIbKMWTrfIVvVbyqrTSM25YaplM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=opdcL+2ZRWRzaaiga1/zPGvlD7agxom7rtaAGkXRJsn8tYFVqLJMECZCuPBjFV0BB2swzdlPYYhNataecoJY/soIRjt0NoPB1Ufy3tOYruOwMWLKqCXHbGjuuwSbYC2JBSZUIMsxHr0A5C7z1z7t0+3iZU9qoy+8XsqFr6TzSeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mbx7eB1E; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mbx7eB1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495798; x=1806031798;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SKSO3UpUl+gsSTEXWIbKMWTrfIVvVbyqrTSM25YaplM=;
  b=Mbx7eB1EVXiKyWY9pB4XGnU9M+tYEuuLPV3wg1RUUerHjUKOhC8T+Jjl
   ggk5dXBryXlxhSb5Kfgk9/z4zCtuwXvfCD+FC3IZsWA21kvGm/6ecMEl8
   JJ6X6A6BRPnTsDsxSjTUP6yeHlOkwRBNVvaMo2Z4r1wZAggEJ+n9DuHCA
   iqYKrcWZiltRFgAZi+s033sqXBUsl4HMl2yg/jCY/w+mXfcWnzO1WMqcx
   q5kw/byikna9EvHnq2BoPsDJqjhlzIy4c9bedNdkBT5dzpgjEUmNRQ6Rw
   aNSdKBDWFdSLH4SE8x1iHZjuvP4tD/CTsv3vYKptmrq1t/SFp+Fk8AZzZ
   Q==;
X-CSE-ConnectionGUID: aGQbfxFSRdeDwGsv4niXhg==
X-CSE-MsgGUID: 64pE/5CXSUyKJFLKryP8YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75659883"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75659883"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:29:57 -0700
X-CSE-ConnectionGUID: xLFqT5GzRq+Cjm+Bqqoe9A==
X-CSE-MsgGUID: zhwZHyCLQOGsYYhF5s2/2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224898231"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2026 20:29:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bPs-0000000084H-2pbP;
	Thu, 26 Mar 2026 03:29:52 +0000
Date: Thu, 26 Mar 2026 11:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4694
 amdgpu_device_init() warn: 'adev->rmmio' from ioremap() not released on
 lines: 4376,4386,4400,4411,4429,4694.
Message-ID: <202603261115.9fNJbqE7-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
commit: 0d9a95099dcb05b5f4719c830d15bf4fdcad0dc2 drm/amdgpu: grab an additi=
onal reference on the gang fence v2
date:   1 year ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-r071-20260325 (https://download.01.org/0day-ci/arc=
hive/20260326/202603261115.9fNJbqE7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603261115.9fNJbqE7-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4694 amdgpu_device_init() warn: =
'adev->rmmio' from ioremap() not released on lines: 4376,4386,4400,4411,442=
9,4694.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6936 amdgpu_device_switch_gang()=
 warn: passing freed memory 'old' (line 6935)

vim +4694 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

02ff519e99fc90 Alex Deucher               2023-06-16  4193 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4194  /**
d38ceaf99ed015 Alex Deucher               2015-04-20  4195   * amdgpu_devic=
e_init - initialize the driver
d38ceaf99ed015 Alex Deucher               2015-04-20  4196   *
d38ceaf99ed015 Alex Deucher               2015-04-20  4197   * @adev: amdgp=
u_device pointer
d38ceaf99ed015 Alex Deucher               2015-04-20  4198   * @flags: driv=
er flags
d38ceaf99ed015 Alex Deucher               2015-04-20  4199   *
d38ceaf99ed015 Alex Deucher               2015-04-20  4200   * Initializes =
the driver info and hw (all asics).
d38ceaf99ed015 Alex Deucher               2015-04-20  4201   * Returns 0 fo=
r success or an error on failure.
d38ceaf99ed015 Alex Deucher               2015-04-20  4202   * Called at dr=
iver startup.
d38ceaf99ed015 Alex Deucher               2015-04-20  4203   */
d38ceaf99ed015 Alex Deucher               2015-04-20  4204  int amdgpu_devi=
ce_init(struct amdgpu_device *adev,
d38ceaf99ed015 Alex Deucher               2015-04-20  4205  		       uint32=
_t flags)
d38ceaf99ed015 Alex Deucher               2015-04-20  4206  {
8aba21b75136c3 Luben Tuikov               2020-08-14  4207  	struct drm_dev=
ice *ddev =3D adev_to_drm(adev);
8aba21b75136c3 Luben Tuikov               2020-08-14  4208  	struct pci_dev=
 *pdev =3D adev->pdev;
d38ceaf99ed015 Alex Deucher               2015-04-20  4209  	int r, i;
b98c6299ef9926 Alex Deucher               2021-03-10  4210  	bool px =3D fa=
lse;
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4211  	u32 =
max_MBps;
59e9fff1983eaa lyndonli                   2023-04-23  4212  	int tmp;
d38ceaf99ed015 Alex Deucher               2015-04-20  4213 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4214  	adev->shutdown=
 =3D false;
d38ceaf99ed015 Alex Deucher               2015-04-20  4215  	adev->flags =
=3D flags;
4e66d7d2156243 Yong Zhao                  2019-08-30  4216 =20
4e66d7d2156243 Yong Zhao                  2019-08-30  4217  	if (amdgpu_for=
ce_asic_type >=3D 0 && amdgpu_force_asic_type < CHIP_LAST)
4e66d7d2156243 Yong Zhao                  2019-08-30  4218  		adev->asic_ty=
pe =3D amdgpu_force_asic_type;
4e66d7d2156243 Yong Zhao                  2019-08-30  4219  	else
2f7d10b393c83a Jammy Zhou                 2015-07-22  4220  		adev->asic_ty=
pe =3D flags & AMD_ASIC_MASK;
4e66d7d2156243 Yong Zhao                  2019-08-30  4221 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4222  	adev->usec_tim=
eout =3D AMDGPU_MAX_USEC_TIMEOUT;
593aa2d282259e Shaoyun Liu                2018-02-07  4223  	if (amdgpu_emu=
_mode =3D=3D 1)
8bdab6bb1cf120 Yong Zhao                  2020-02-25  4224  		adev->usec_ti=
meout *=3D 10;
770d13b19fdf36 Christian K=C3=B6nig            2018-01-12  4225  	adev->gmc=
.gart_size =3D 512 * 1024 * 1024;
d38ceaf99ed015 Alex Deucher               2015-04-20  4226  	adev->accel_wo=
rking =3D false;
d38ceaf99ed015 Alex Deucher               2015-04-20  4227  	adev->num_ring=
s =3D 0;
68ce8b24224265 Christian K=C3=B6nig            2022-03-02  4228  	RCU_INIT_=
POINTER(adev->gang_submit, dma_fence_get_stub());
d38ceaf99ed015 Alex Deucher               2015-04-20  4229  	adev->mman.buf=
fer_funcs =3D NULL;
d38ceaf99ed015 Alex Deucher               2015-04-20  4230  	adev->mman.buf=
fer_funcs_ring =3D NULL;
d38ceaf99ed015 Alex Deucher               2015-04-20  4231  	adev->vm_manag=
er.vm_pte_funcs =3D NULL;
0c88b43032131f Nirmoy Das                 2019-12-06  4232  	adev->vm_manag=
er.vm_pte_num_scheds =3D 0;
132f34e4b55848 Christian K=C3=B6nig            2018-01-12  4233  	adev->gmc=
.gmc_funcs =3D NULL;
7bd939d04db9e6 Likun GAO                  2021-04-29  4234  	adev->harvest_=
ip_mask =3D 0x0;
f54d1867005c33 Chris Wilson               2016-10-25  4235  	adev->fence_co=
ntext =3D dma_fence_context_alloc(AMDGPU_MAX_RINGS);
b8866c26ec072f Andres Rodriguez           2017-04-28  4236  	bitmap_zero(ad=
ev->gfx.pipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
d38ceaf99ed015 Alex Deucher               2015-04-20  4237 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4238  	adev->smc_rreg=
 =3D &amdgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4239  	adev->smc_wreg=
 =3D &amdgpu_invalid_wreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4240  	adev->pcie_rre=
g =3D &amdgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4241  	adev->pcie_wre=
g =3D &amdgpu_invalid_wreg;
0c552ed38780f2 Le Ma                      2022-04-02  4242  	adev->pcie_rre=
g_ext =3D &amdgpu_invalid_rreg_ext;
0c552ed38780f2 Le Ma                      2022-04-02  4243  	adev->pcie_wre=
g_ext =3D &amdgpu_invalid_wreg_ext;
36b9a952bbf688 Huang Rui                  2016-08-31  4244  	adev->pciep_rr=
eg =3D &amdgpu_invalid_rreg;
36b9a952bbf688 Huang Rui                  2016-08-31  4245  	adev->pciep_wr=
eg =3D &amdgpu_invalid_wreg;
4fa1c6a679bb0d Tao Zhou                   2019-07-24  4246  	adev->pcie_rre=
g64 =3D &amdgpu_invalid_rreg64;
4fa1c6a679bb0d Tao Zhou                   2019-07-24  4247  	adev->pcie_wre=
g64 =3D &amdgpu_invalid_wreg64;
a76b2870bd3107 Candice Li                 2023-05-17  4248  	adev->pcie_rre=
g64_ext =3D &amdgpu_invalid_rreg64_ext;
a76b2870bd3107 Candice Li                 2023-05-17  4249  	adev->pcie_wre=
g64_ext =3D &amdgpu_invalid_wreg64_ext;
d38ceaf99ed015 Alex Deucher               2015-04-20  4250  	adev->uvd_ctx_=
rreg =3D &amdgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4251  	adev->uvd_ctx_=
wreg =3D &amdgpu_invalid_wreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4252  	adev->didt_rre=
g =3D &amdgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4253  	adev->didt_wre=
g =3D &amdgpu_invalid_wreg;
ccdbb20a75e3e3 Rex Zhu                    2016-06-08  4254  	adev->gc_cac_r=
reg =3D &amdgpu_invalid_rreg;
ccdbb20a75e3e3 Rex Zhu                    2016-06-08  4255  	adev->gc_cac_w=
reg =3D &amdgpu_invalid_wreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4256  	adev->audio_en=
dpt_rreg =3D &amdgpu_block_invalid_rreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4257  	adev->audio_en=
dpt_wreg =3D &amdgpu_block_invalid_wreg;
d38ceaf99ed015 Alex Deucher               2015-04-20  4258 =20
3e39ab90833b20 Alex Deucher               2015-06-05  4259  	DRM_INFO("init=
ializing kernel modesetting (%s 0x%04X:0x%04X 0x%04X:0x%04X 0x%02X).\n",
d38ceaf99ed015 Alex Deucher               2015-04-20  4260  		 amdgpu_asic_=
name[adev->asic_type], pdev->vendor, pdev->device,
3e39ab90833b20 Alex Deucher               2015-06-05  4261  		 pdev->subsys=
tem_vendor, pdev->subsystem_device, pdev->revision);
d38ceaf99ed015 Alex Deucher               2015-04-20  4262 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4263  	/* mutex initi=
alization are all done here so we
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4264  	 * can recall =
function without having locking issues
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4265  	 */
0e5ca0d1ac07ef Huang Rui                  2017-03-03  4266  	mutex_init(&ad=
ev->firmware.mutex);
d38ceaf99ed015 Alex Deucher               2015-04-20  4267  	mutex_init(&ad=
ev->pm.mutex);
d38ceaf99ed015 Alex Deucher               2015-04-20  4268  	mutex_init(&ad=
ev->gfx.gpu_clock_mutex);
d38ceaf99ed015 Alex Deucher               2015-04-20  4269  	mutex_init(&ad=
ev->srbm_mutex);
b8866c26ec072f Andres Rodriguez           2017-04-28  4270  	mutex_init(&ad=
ev->gfx.pipe_reserve_mutex);
d23ee13fba23a3 Rex Zhu                    2018-07-30  4271  	mutex_init(&ad=
ev->gfx.gfx_off_mutex);
98a54e88e87f72 Le Ma                      2022-05-17  4272  	mutex_init(&ad=
ev->gfx.partition_mutex);
d38ceaf99ed015 Alex Deucher               2015-04-20  4273  	mutex_init(&ad=
ev->grbm_idx_mutex);
d38ceaf99ed015 Alex Deucher               2015-04-20  4274  	mutex_init(&ad=
ev->mn_lock);
e23b74aab5dc48 Alex Deucher               2017-09-28  4275  	mutex_init(&ad=
ev->virt.vf_errors.lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4276  	hash_init(adev=
->mn_hash);
32eaeae0ef193b Alex Deucher               2019-07-08  4277  	mutex_init(&ad=
ev->psp.mutex);
bd052211233266 Pan, Xinhui                2020-01-16  4278  	mutex_init(&ad=
ev->notifier_lock);
8cda7a4f96e435 Alex Deucher               2022-01-07  4279  	mutex_init(&ad=
ev->pm.stable_pstate_ctx_lock);
f113cc32e35b55 Alex Deucher               2022-02-18  4280  	mutex_init(&ad=
ev->benchmark_mutex);
76acba7b7f1251 Alex Deucher               2024-07-12  4281  	mutex_init(&ad=
ev->gfx.reset_sem_mutex);
e189be9b2e3820 Srinivasan Shanmugam       2024-05-27  4282  	/* Initialize =
the mutex for cleaner shader isolation between GFX and compute processes */
e189be9b2e3820 Srinivasan Shanmugam       2024-05-27  4283  	mutex_init(&ad=
ev->enforce_isolation_mutex);
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4284  	mutex_init(&ad=
ev->gfx.kfd_sch_mutex);
d38ceaf99ed015 Alex Deucher               2015-04-20  4285 =20
4eaf21b752891f Prike Liang                2021-11-26  4286  	amdgpu_device_=
init_apu_flags(adev);
9f6a78572033b9 Huang Rui                  2021-06-22  4287 =20
912dfc846aad77 Evan Quan                  2019-04-29  4288  	r =3D amdgpu_d=
evice_check_arguments(adev);
912dfc846aad77 Evan Quan                  2019-04-29  4289  	if (r)
912dfc846aad77 Evan Quan                  2019-04-29  4290  		return r;
d38ceaf99ed015 Alex Deucher               2015-04-20  4291 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4292  	spin_lock_init=
(&adev->mmio_idx_lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4293  	spin_lock_init=
(&adev->smc_idx_lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4294  	spin_lock_init=
(&adev->pcie_idx_lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4295  	spin_lock_init=
(&adev->uvd_ctx_idx_lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4296  	spin_lock_init=
(&adev->didt_idx_lock);
ccdbb20a75e3e3 Rex Zhu                    2016-06-08  4297  	spin_lock_init=
(&adev->gc_cac_idx_lock);
16abb5d206499d Evan Quan                  2017-07-04  4298  	spin_lock_init=
(&adev->se_cac_idx_lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4299  	spin_lock_init=
(&adev->audio_endpt_idx_lock);
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4300  	spin=
_lock_init(&adev->mm_stats.lock);
dc0297f3198bd6 Srinivasan Shanmugam       2025-02-14  4301  	spin_lock_init=
(&adev->virt.rlcg_reg_lock);
497d7cee24572d Alex Deucher               2024-04-19  4302  	spin_lock_init=
(&adev->wb.lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  4303 =20
655ce9cb13b596 shaoyunl                   2021-03-04  4304  	INIT_LIST_HEAD=
(&adev->reset_list);
655ce9cb13b596 shaoyunl                   2021-03-04  4305 =20
6492e1b07c0339 yipechai                   2022-01-04  4306  	INIT_LIST_HEAD=
(&adev->ras_list);
6492e1b07c0339 yipechai                   2022-01-04  4307 =20
3e38b634f94ef7 Evan Quan                  2023-08-10  4308  	INIT_LIST_HEAD=
(&adev->pm.od_kobj_list);
3e38b634f94ef7 Evan Quan                  2023-08-10  4309 =20
beff74bc6e0fa9 Alex Deucher               2019-05-28  4310  	INIT_DELAYED_W=
ORK(&adev->delayed_init_work,
beff74bc6e0fa9 Alex Deucher               2019-05-28  4311  			  amdgpu_dev=
ice_delayed_init_work_handler);
1e317b99f0c244 Rex Zhu                    2018-07-27  4312  	INIT_DELAYED_W=
ORK(&adev->gfx.gfx_off_delay_work,
1e317b99f0c244 Rex Zhu                    2018-07-27  4313  			  amdgpu_dev=
ice_delay_enable_gfx_off);
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4314  	/*
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4315  	 * Initialize =
the enforce_isolation work structures for each XCP
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4316  	 * partition. =
 This work handler is responsible for enforcing shader
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4317  	 * isolation o=
n AMD GPUs.  It counts the number of emitted fences for
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4318  	 * each GFX an=
d compute ring.  If there are any fences, it schedules
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4319  	 * the `enforc=
e_isolation_work` to be run after a delay.  If there are
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4320  	 * no fences, =
it signals the Kernel Fusion Driver (KFD) to resume the
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4321  	 * runqueue.
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4322  	 */
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4323  	for (i =3D 0; =
i < MAX_XCP; i++) {
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4324  		INIT_DELAYED_=
WORK(&adev->gfx.enforce_isolation[i].work,
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4325  				  amdgpu_gf=
x_enforce_isolation_handler);
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4326  		adev->gfx.enf=
orce_isolation[i].adev =3D adev;
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4327  		adev->gfx.enf=
orce_isolation[i].xcp_id =3D i;
afefd6f2450246 Srinivasan Shanmugam       2024-06-06  4328  	}
2dc80b00652f2a Shirish S                  2017-05-25  4329 =20
d4535e2c018bba Andrey Grodzovsky          2018-11-29  4330  	INIT_WORK(&ade=
v->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
d4535e2c018bba Andrey Grodzovsky          2018-11-29  4331 =20
d23ee13fba23a3 Rex Zhu                    2018-07-30  4332  	adev->gfx.gfx_=
off_req_count =3D 1;
0ad7347a64ac4b Andr=C3=A9 Almeida              2022-08-10  4333  	adev->gfx=
.gfx_off_residency =3D 0;
0ad7347a64ac4b Andr=C3=A9 Almeida              2022-08-10  4334  	adev->gfx=
.gfx_off_entrycount =3D 0;
b6e79d9a314ebe Jason Yan                  2020-04-27  4335  	adev->pm.ac_po=
wer =3D power_supply_is_system_supplied() > 0;
b1ddf548472729 Rex Zhu                    2018-06-04  4336 =20
b265bdbd9f2811 Evan Quan                  2020-05-22  4337  	atomic_set(&ad=
ev->throttling_logging_enabled, 1);
b265bdbd9f2811 Evan Quan                  2020-05-22  4338  	/*
b265bdbd9f2811 Evan Quan                  2020-05-22  4339  	 * If throttli=
ng continues, logging will be performed every minute
b265bdbd9f2811 Evan Quan                  2020-05-22  4340  	 * to avoid lo=
g flooding. "-1" is subtracted since the thermal
b265bdbd9f2811 Evan Quan                  2020-05-22  4341  	 * throttling =
interrupt comes every second. Thus, the total logging
b265bdbd9f2811 Evan Quan                  2020-05-22  4342  	 * interval is=
 59 seconds(retelimited printk interval) + 1(waiting
b265bdbd9f2811 Evan Quan                  2020-05-22  4343  	 * for throttl=
ing interrupt) =3D 60 seconds.
b265bdbd9f2811 Evan Quan                  2020-05-22  4344  	 */
b265bdbd9f2811 Evan Quan                  2020-05-22  4345  	ratelimit_stat=
e_init(&adev->throttling_logging_rs, (60 - 1) * HZ, 1);
84a2947ecc85c6 Victor Skvortsov           2024-10-30  4346 =20
b265bdbd9f2811 Evan Quan                  2020-05-22  4347  	ratelimit_set_=
flags(&adev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
b265bdbd9f2811 Evan Quan                  2020-05-22  4348 =20
0fa4955838ea1e Alex Xie                   2017-06-08  4349  	/* Registers m=
apping */
0fa4955838ea1e Alex Xie                   2017-06-08  4350  	/* TODO: block=
 userspace mapping of io register */
da69c161448d6a Ken Wang                   2016-01-21  4351  	if (adev->asic=
_type >=3D CHIP_BONAIRE) {
d38ceaf99ed015 Alex Deucher               2015-04-20  4352  		adev->rmmio_b=
ase =3D pci_resource_start(adev->pdev, 5);
d38ceaf99ed015 Alex Deucher               2015-04-20  4353  		adev->rmmio_s=
ize =3D pci_resource_len(adev->pdev, 5);
da69c161448d6a Ken Wang                   2016-01-21  4354  	} else {
da69c161448d6a Ken Wang                   2016-01-21  4355  		adev->rmmio_b=
ase =3D pci_resource_start(adev->pdev, 2);
da69c161448d6a Ken Wang                   2016-01-21  4356  		adev->rmmio_s=
ize =3D pci_resource_len(adev->pdev, 2);
da69c161448d6a Ken Wang                   2016-01-21  4357  	}
5c1354bd30c118 Chunming Zhou              2016-08-30  4358 =20
6c08e0ef87b8b4 Evan Quan                  2021-11-05  4359  	for (i =3D 0; =
i < AMD_IP_BLOCK_TYPE_NUM; i++)
6c08e0ef87b8b4 Evan Quan                  2021-11-05  4360  		atomic_set(&a=
dev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
6c08e0ef87b8b4 Evan Quan                  2021-11-05  4361 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4362  	adev->rmmio =
=3D ioremap(adev->rmmio_base, adev->rmmio_size);
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4363  	if (!adev->rmm=
io)
d38ceaf99ed015 Alex Deucher               2015-04-20  4364  		return -ENOME=
M;
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4365 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4366  	DRM_INFO("regi=
ster mmio base: 0x%08X\n", (uint32_t)adev->rmmio_base);
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4367  	DRM_INFO("regi=
ster mmio size: %u\n", (unsigned int)adev->rmmio_size);
d38ceaf99ed015 Alex Deucher               2015-04-20  4368 =20
436afdfa35dc8a Philip Yang                2022-03-15  4369  	/*
436afdfa35dc8a Philip Yang                2022-03-15  4370  	 * Reset domai=
n needs to be present early, before XGMI hive discovered
a567db808ec948 Randy Dunlap               2024-11-27  4371  	 * (if any) an=
d initialized to use reset sem and in_gpu reset flag
436afdfa35dc8a Philip Yang                2022-03-15  4372  	 * early on du=
ring init and before calling to RREG32.
436afdfa35dc8a Philip Yang                2022-03-15  4373  	 */
436afdfa35dc8a Philip Yang                2022-03-15  4374  	adev->reset_do=
main =3D amdgpu_reset_create_reset_domain(SINGLE_DEVICE, "amdgpu-reset-dev"=
);
03c6284df179de Ma Jun                     2024-03-19  4375  	if (!adev->res=
et_domain)
03c6284df179de Ma Jun                     2024-03-19  4376  		return -ENOME=
M;
436afdfa35dc8a Philip Yang                2022-03-15  4377 =20
3aa0115d238c71 Monk Liu                   2020-03-04  4378  	/* detect hw v=
irtualization here */
a91d91b6004796 Tony Yi                    2025-02-26  4379  	amdgpu_virt_in=
it(adev);
3aa0115d238c71 Monk Liu                   2020-03-04  4380 =20
04e8595819480b Tong Liu01                 2023-05-16  4381  	amdgpu_device_=
get_pcie_info(adev);
04e8595819480b Tong Liu01                 2023-05-16  4382 =20
dffa11b4f74b15 Monk Liu                   2020-03-04  4383  	r =3D amdgpu_d=
evice_get_job_timeout_settings(adev);
a190d1c75c73ce Xiaojie Yuan               2019-03-27  4384  	if (r) {
dffa11b4f74b15 Monk Liu                   2020-03-04  4385  		dev_err(adev-=
>dev, "invalid lockup_timeout parameter syntax\n");
03c6284df179de Ma Jun                     2024-03-19  4386  		return r;
a190d1c75c73ce Xiaojie Yuan               2019-03-27  4387  	}
a190d1c75c73ce Xiaojie Yuan               2019-03-27  4388 =20
bf909454fefa4a Pierre-Eric Pelloux-Prayer 2024-02-16  4389  	amdgpu_device_=
set_mcbp(adev);
bf909454fefa4a Pierre-Eric Pelloux-Prayer 2024-02-16  4390 =20
14f2fe34f5c68e Lijo Lazar                 2024-08-19  4391  	/*
14f2fe34f5c68e Lijo Lazar                 2024-08-19  4392  	 * By default,=
 use default mode where all blocks are expected to be
14f2fe34f5c68e Lijo Lazar                 2024-08-19  4393  	 * initialized=
. At present a 'swinit' of blocks is required to be
14f2fe34f5c68e Lijo Lazar                 2024-08-19  4394  	 * completed b=
efore the need for a different level is detected.
14f2fe34f5c68e Lijo Lazar                 2024-08-19  4395  	 */
14f2fe34f5c68e Lijo Lazar                 2024-08-19  4396  	amdgpu_set_ini=
t_level(adev, AMDGPU_INIT_LEVEL_DEFAULT);
d38ceaf99ed015 Alex Deucher               2015-04-20  4397  	/* early init =
functions */
06ec907054c5a4 Alex Deucher               2017-12-14  4398  	r =3D amdgpu_d=
evice_ip_early_init(adev);
d38ceaf99ed015 Alex Deucher               2015-04-20  4399  	if (r)
03c6284df179de Ma Jun                     2024-03-19  4400  		return r;
d38ceaf99ed015 Alex Deucher               2015-04-20  4401 =20
9deacd6c55f1b3 Alex Deucher               2024-09-25  4402  	/*
9deacd6c55f1b3 Alex Deucher               2024-09-25  4403  	 * No need to =
remove conflicting FBs for non-display class devices.
9deacd6c55f1b3 Alex Deucher               2024-09-25  4404  	 * This preven=
ts the sysfb from being freed accidently.
9deacd6c55f1b3 Alex Deucher               2024-09-25  4405  	 */
9deacd6c55f1b3 Alex Deucher               2024-09-25  4406  	if ((pdev->cla=
ss >> 8) =3D=3D PCI_CLASS_DISPLAY_VGA ||
9deacd6c55f1b3 Alex Deucher               2024-09-25  4407  	    (pdev->cla=
ss >> 8) =3D=3D PCI_CLASS_DISPLAY_OTHER) {
b7cdb41e7d25ce Mario Limonciello          2022-12-27  4408  		/* Get rid of=
 things like offb */
ea1d2a38fb6f0c Thomas Zimmermann          2024-09-30  4409  		r =3D apertur=
e_remove_conflicting_pci_devices(adev->pdev, amdgpu_kms_driver.name);
b7cdb41e7d25ce Mario Limonciello          2022-12-27  4410  		if (r)
03c6284df179de Ma Jun                     2024-03-19  4411  			return r;
9deacd6c55f1b3 Alex Deucher               2024-09-25  4412  	}
b7cdb41e7d25ce Mario Limonciello          2022-12-27  4413 =20
4d33e7040d70b5 Sunil Khatri               2022-05-17  4414  	/* Enable TMZ =
based on IP_VERSION */
4d33e7040d70b5 Sunil Khatri               2022-05-17  4415  	amdgpu_gmc_tmz=
_set(adev);
4d33e7040d70b5 Sunil Khatri               2022-05-17  4416 =20
3e2dacca540643 Danijel Slivka             2024-03-27  4417  	if (amdgpu_sri=
ov_vf(adev) &&
3e2dacca540643 Danijel Slivka             2024-03-27  4418  	    amdgpu_ip_=
version(adev, GC_HWIP, 0) >=3D IP_VERSION(10, 3, 0))
3e2dacca540643 Danijel Slivka             2024-03-27  4419  		/* VF MMIO ac=
cess (except mailbox range) from CPU
3e2dacca540643 Danijel Slivka             2024-03-27  4420  		 * will be bl=
ocked during sriov runtime
3e2dacca540643 Danijel Slivka             2024-03-27  4421  		 */
3e2dacca540643 Danijel Slivka             2024-03-27  4422  		adev->virt.ca=
ps |=3D AMDGPU_VF_MMIO_ACCESS_PROTECT;
3e2dacca540643 Danijel Slivka             2024-03-27  4423 =20
957b0787ee5d5c Yifan Zhang                2022-03-01  4424  	amdgpu_gmc_nor=
etry_set(adev);
4a0165f0603f33 Victor Skvortsov           2021-12-15  4425  	/* Need to get=
 xgmi info early to decide the reset behavior*/
4a0165f0603f33 Victor Skvortsov           2021-12-15  4426  	if (adev->gmc.=
xgmi.supported) {
4a0165f0603f33 Victor Skvortsov           2021-12-15  4427  		r =3D adev->g=
fxhub.funcs->get_xgmi_info(adev);
4a0165f0603f33 Victor Skvortsov           2021-12-15  4428  		if (r)
03c6284df179de Ma Jun                     2024-03-19  4429  			return r;
4a0165f0603f33 Victor Skvortsov           2021-12-15  4430  	}
4a0165f0603f33 Victor Skvortsov           2021-12-15  4431 =20
8e6d0b699635ec shaoyunl                   2021-09-08  4432  	/* enable PCIE=
 atomic ops */
b4520bfd801338 Gavin Wan                  2023-03-17  4433  	if (amdgpu_sri=
ov_vf(adev)) {
b4520bfd801338 Gavin Wan                  2023-03-17  4434  		if (adev->vir=
t.fw_reserve.p_pf2vf)
8e6d0b699635ec shaoyunl                   2021-09-08  4435  			adev->have_a=
tomics_support =3D ((struct amd_sriov_msg_pf2vf_info *)
e15c9d06e9ad70 Bokun Zhang                2022-04-21  4436  						      ade=
v->virt.fw_reserve.p_pf2vf)->pcie_atomic_ops_support_flags =3D=3D
8e6d0b699635ec shaoyunl                   2021-09-08  4437  				(PCI_EXP_DE=
VCAP2_ATOMIC_COMP32 | PCI_EXP_DEVCAP2_ATOMIC_COMP64);
0e768043bf68dc Yifan Zhang                2023-04-27  4438  	/* APUs w/ gfx=
9 onwards doesn't reply on PCIe atomics, rather it is a
0e768043bf68dc Yifan Zhang                2023-04-27  4439  	 * internal pa=
th natively support atomics, set have_atomics_support to true.
0e768043bf68dc Yifan Zhang                2023-04-27  4440  	 */
b4520bfd801338 Gavin Wan                  2023-03-17  4441  	} else if ((ad=
ev->flags & AMD_IS_APU) &&
4e8303cf2c4dd2 Lijo Lazar                 2023-09-11  4442  		   (amdgpu_ip=
_version(adev, GC_HWIP, 0) >
4e8303cf2c4dd2 Lijo Lazar                 2023-09-11  4443  		    IP_VERSIO=
N(9, 0, 0))) {
0e768043bf68dc Yifan Zhang                2023-04-27  4444  		adev->have_at=
omics_support =3D true;
b4520bfd801338 Gavin Wan                  2023-03-17  4445  	} else {
8e6d0b699635ec shaoyunl                   2021-09-08  4446  		adev->have_at=
omics_support =3D
8e6d0b699635ec shaoyunl                   2021-09-08  4447  			!pci_enable_=
atomic_ops_to_root(adev->pdev,
8e6d0b699635ec shaoyunl                   2021-09-08  4448  					  PCI_EXP_=
DEVCAP2_ATOMIC_COMP32 |
8e6d0b699635ec shaoyunl                   2021-09-08  4449  					  PCI_EXP_=
DEVCAP2_ATOMIC_COMP64);
b4520bfd801338 Gavin Wan                  2023-03-17  4450  	}
b4520bfd801338 Gavin Wan                  2023-03-17  4451 =20
8e6d0b699635ec shaoyunl                   2021-09-08  4452  	if (!adev->hav=
e_atomics_support)
8e6d0b699635ec shaoyunl                   2021-09-08  4453  		dev_info(adev=
->dev, "PCIE atomic ops is not supported\n");
8e6d0b699635ec shaoyunl                   2021-09-08  4454 =20
6585661ddd6a0a Oak Zeng                   2018-11-19  4455  	/* doorbell ba=
r mapping and doorbell index init*/
43c064db65e2bb Shashank Sharma            2023-07-14  4456  	amdgpu_doorbel=
l_init(adev);
6585661ddd6a0a Oak Zeng                   2018-11-19  4457 =20
9475a9434f594f Shaoyun Liu                2018-02-01  4458  	if (amdgpu_emu=
_mode =3D=3D 1) {
9475a9434f594f Shaoyun Liu                2018-02-01  4459  		/* post the a=
sic on emulation mode */
9475a9434f594f Shaoyun Liu                2018-02-01  4460  		emu_soc_asic_=
init(adev);
bfca02892773d2 Shaoyun Liu                2018-02-01  4461  		goto fence_dr=
iver_init;
9475a9434f594f Shaoyun Liu                2018-02-01  4462  	}
bfca02892773d2 Shaoyun Liu                2018-02-01  4463 =20
04442bf70debb1 Lijo Lazar                 2021-03-16  4464  	amdgpu_reset_i=
nit(adev);
04442bf70debb1 Lijo Lazar                 2021-03-16  4465 =20
4e99a44e37bfed Monk Liu                   2016-03-31  4466  	/* detect if w=
e are with an SRIOV vbios */
b4520bfd801338 Gavin Wan                  2023-03-17  4467  	if (adev->bios)
4e99a44e37bfed Monk Liu                   2016-03-31  4468  		amdgpu_device=
_detect_sriov_bios(adev);
048765ad5af7c8 Andres Rodriguez           2016-06-11  4469 =20
95e8e59ec49f7c Alex Deucher               2018-11-01  4470  	/* check if we=
 need to reset the asic
95e8e59ec49f7c Alex Deucher               2018-11-01  4471  	 *  E.g., driv=
er was not cleanly unloaded previously, etc.
95e8e59ec49f7c Alex Deucher               2018-11-01  4472  	 */
f14899fd2a5607 wentalou                   2019-01-17  4473  	if (!amdgpu_sr=
iov_vf(adev) && amdgpu_asic_need_reset_on_init(adev)) {
e3c1b0712fdb03 shaoyunl                   2021-02-16  4474  		if (adev->gmc=
.xgmi.num_physical_nodes) {
e3c1b0712fdb03 shaoyunl                   2021-02-16  4475  			dev_info(ade=
v->dev, "Pending hive reset.\n");
5839d27d5b2dad Lijo Lazar                 2024-08-19  4476  			amdgpu_set_i=
nit_level(adev,
5839d27d5b2dad Lijo Lazar                 2024-08-19  4477  					      AMDG=
PU_INIT_LEVEL_MINIMAL_XGMI);
7c1d9e10e66431 Kenneth Feng               2024-03-28  4478  		} else if (am=
dgpu_ip_version(adev, MP1_HWIP, 0) =3D=3D IP_VERSION(13, 0, 10) &&
7c1d9e10e66431 Kenneth Feng               2024-03-28  4479  				   !amdgpu_=
device_has_display_hardware(adev)) {
7c1d9e10e66431 Kenneth Feng               2024-03-28  4480  					r =3D psp_=
gpu_reset(adev);
e3c1b0712fdb03 shaoyunl                   2021-02-16  4481  		} else {
59e9fff1983eaa lyndonli                   2023-04-23  4482  				tmp =3D amd=
gpu_reset_method;
59e9fff1983eaa lyndonli                   2023-04-23  4483  				/* It shoul=
d do a default reset when loading or reloading the driver,
59e9fff1983eaa lyndonli                   2023-04-23  4484  				 * regardle=
ss of the module parameter reset_method.
59e9fff1983eaa lyndonli                   2023-04-23  4485  				 */
59e9fff1983eaa lyndonli                   2023-04-23  4486  				amdgpu_rese=
t_method =3D AMD_RESET_METHOD_NONE;
95e8e59ec49f7c Alex Deucher               2018-11-01  4487  				r =3D amdgp=
u_asic_reset(adev);
59e9fff1983eaa lyndonli                   2023-04-23  4488  				amdgpu_rese=
t_method =3D tmp;
7c1d9e10e66431 Kenneth Feng               2024-03-28  4489  		}
7c1d9e10e66431 Kenneth Feng               2024-03-28  4490 =20
95e8e59ec49f7c Alex Deucher               2018-11-01  4491  		if (r) {
95e8e59ec49f7c Alex Deucher               2018-11-01  4492  		  dev_err(ade=
v->dev, "asic reset on init failed\n");
95e8e59ec49f7c Alex Deucher               2018-11-01  4493  		  goto failed;
95e8e59ec49f7c Alex Deucher               2018-11-01  4494  		}
95e8e59ec49f7c Alex Deucher               2018-11-01  4495  	}
95e8e59ec49f7c Alex Deucher               2018-11-01  4496 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4497  	/* Post card i=
f necessary */
39c640c086ad12 Alex Deucher               2017-12-15  4498  	if (amdgpu_dev=
ice_need_post(adev)) {
d38ceaf99ed015 Alex Deucher               2015-04-20  4499  		if (!adev->bi=
os) {
bec86378befae4 Monk Liu                   2016-09-14  4500  			dev_err(adev=
->dev, "no vBIOS found\n");
83ba126a9be318 Alex Deucher               2016-06-03  4501  			r =3D -EINVA=
L;
83ba126a9be318 Alex Deucher               2016-06-03  4502  			goto failed;
d38ceaf99ed015 Alex Deucher               2015-04-20  4503  		}
bec86378befae4 Monk Liu                   2016-09-14  4504  		DRM_INFO("GPU=
 posting now...\n");
4d2997ab2182fc Alex Deucher               2020-08-24  4505  		r =3D amdgpu_=
device_asic_init(adev);
4e99a44e37bfed Monk Liu                   2016-03-31  4506  		if (r) {
4e99a44e37bfed Monk Liu                   2016-03-31  4507  			dev_err(adev=
->dev, "gpu post error!\n");
4e99a44e37bfed Monk Liu                   2016-03-31  4508  			goto failed;
4e99a44e37bfed Monk Liu                   2016-03-31  4509  		}
d38ceaf99ed015 Alex Deucher               2015-04-20  4510  	}
d38ceaf99ed015 Alex Deucher               2015-04-20  4511 =20
9535a86a4072ba Shiwu Zhang                2023-05-17  4512  	if (adev->bios=
) {
88b64e9536746e Alex Deucher               2017-07-10  4513  		if (adev->is_=
atom_fw) {
88b64e9536746e Alex Deucher               2017-07-10  4514  			/* Initializ=
e clocks */
88b64e9536746e Alex Deucher               2017-07-10  4515  			r =3D amdgpu=
_atomfirmware_get_clock_info(adev);
88b64e9536746e Alex Deucher               2017-07-10  4516  			if (r) {
88b64e9536746e Alex Deucher               2017-07-10  4517  				dev_err(ade=
v->dev, "amdgpu_atomfirmware_get_clock_info failed\n");
e23b74aab5dc48 Alex Deucher               2017-09-28  4518  				amdgpu_vf_e=
rror_put(adev, AMDGIM_ERROR_VF_ATOMBIOS_GET_CLOCK_FAIL, 0, 0);
88b64e9536746e Alex Deucher               2017-07-10  4519  				goto failed;
88b64e9536746e Alex Deucher               2017-07-10  4520  			}
88b64e9536746e Alex Deucher               2017-07-10  4521  		} else {
d38ceaf99ed015 Alex Deucher               2015-04-20  4522  			/* Initializ=
e clocks */
d38ceaf99ed015 Alex Deucher               2015-04-20  4523  			r =3D amdgpu=
_atombios_get_clock_info(adev);
2c1a2784039442 Alex Deucher               2015-12-07  4524  			if (r) {
2c1a2784039442 Alex Deucher               2015-12-07  4525  				dev_err(ade=
v->dev, "amdgpu_atombios_get_clock_info failed\n");
e23b74aab5dc48 Alex Deucher               2017-09-28  4526  				amdgpu_vf_e=
rror_put(adev, AMDGIM_ERROR_VF_ATOMBIOS_GET_CLOCK_FAIL, 0, 0);
890419409a3aba Gavin Wan                  2017-06-23  4527  				goto failed;
2c1a2784039442 Alex Deucher               2015-12-07  4528  			}
d38ceaf99ed015 Alex Deucher               2015-04-20  4529  			/* init i2c =
buses */
1c0b144bf7628a Alex Deucher               2024-12-19  4530  			amdgpu_i2c_i=
nit(adev);
a5bde2f964fa06 Alex Deucher               2016-09-23  4531  		}
9535a86a4072ba Shiwu Zhang                2023-05-17  4532  	}
d38ceaf99ed015 Alex Deucher               2015-04-20  4533 =20
bfca02892773d2 Shaoyun Liu                2018-02-01  4534  fence_driver_in=
it:
d38ceaf99ed015 Alex Deucher               2015-04-20  4535  	/* Fence drive=
r */
067f44c8b4590c Guchun Chen                2021-07-29  4536  	r =3D amdgpu_f=
ence_driver_sw_init(adev);
2c1a2784039442 Alex Deucher               2015-12-07  4537  	if (r) {
067f44c8b4590c Guchun Chen                2021-07-29  4538  		dev_err(adev-=
>dev, "amdgpu_fence_driver_sw_init failed\n");
e23b74aab5dc48 Alex Deucher               2017-09-28  4539  		amdgpu_vf_err=
or_put(adev, AMDGIM_ERROR_VF_FENCE_INIT_FAIL, 0, 0);
83ba126a9be318 Alex Deucher               2016-06-03  4540  		goto failed;
2c1a2784039442 Alex Deucher               2015-12-07  4541  	}
d38ceaf99ed015 Alex Deucher               2015-04-20  4542 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4543  	/* init the mo=
de config */
4a580877bdcb83 Luben Tuikov               2020-08-24  4544  	drm_mode_confi=
g_init(adev_to_drm(adev));
d38ceaf99ed015 Alex Deucher               2015-04-20  4545 =20
06ec907054c5a4 Alex Deucher               2017-12-14  4546  	r =3D amdgpu_d=
evice_ip_init(adev);
d38ceaf99ed015 Alex Deucher               2015-04-20  4547  	if (r) {
06ec907054c5a4 Alex Deucher               2017-12-14  4548  		dev_err(adev-=
>dev, "amdgpu_device_ip_init failed\n");
e23b74aab5dc48 Alex Deucher               2017-09-28  4549  		amdgpu_vf_err=
or_put(adev, AMDGIM_ERROR_VF_AMDGPU_INIT_FAIL, 0, 0);
970fd197643490 Stanley.Yang               2021-03-10  4550  		goto release_=
ras_con;
d38ceaf99ed015 Alex Deucher               2015-04-20  4551  	}
d38ceaf99ed015 Alex Deucher               2015-04-20  4552 =20
8d35a2596164c1 Likun Gao                  2021-07-26  4553  	amdgpu_fence_d=
river_hw_init(adev);
8d35a2596164c1 Likun Gao                  2021-07-26  4554 =20
d69b8971e540ae Yong Zhao                  2020-04-17  4555  	dev_info(adev-=
>dev,
d69b8971e540ae Yong Zhao                  2020-04-17  4556  		"SE %d, SH pe=
r SE %d, CU per SH %d, active_cu_number %d\n",
d7f72fe482bfb7 Yong Zhao                  2019-12-11  4557  			adev->gfx.co=
nfig.max_shader_engines,
d7f72fe482bfb7 Yong Zhao                  2019-12-11  4558  			adev->gfx.co=
nfig.max_sh_per_se,
d7f72fe482bfb7 Yong Zhao                  2019-12-11  4559  			adev->gfx.co=
nfig.max_cu_per_sh,
d7f72fe482bfb7 Yong Zhao                  2019-12-11  4560  			adev->gfx.cu=
_info.number);
d7f72fe482bfb7 Yong Zhao                  2019-12-11  4561 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4562  	adev->accel_wo=
rking =3D true;
d38ceaf99ed015 Alex Deucher               2015-04-20  4563 =20
e59c020598666f Alex Xie                   2017-06-01  4564  	amdgpu_vm_chec=
k_compute_bug(adev);
e59c020598666f Alex Xie                   2017-06-01  4565 =20
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4566  	/* I=
nitialize the buffer migration limit. */
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4567  	if (=
amdgpu_moverate >=3D 0)
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4568  		max=
_MBps =3D amdgpu_moverate;
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4569  	else
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4570  		max=
_MBps =3D 8; /* Allow 8 MB/s. */
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4571  	/* G=
et a log2 for easy divisions. */
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4572  	adev=
->mm_stats.log2_max_MBps =3D ilog2(max(1u, max_MBps));
95844d20ae024b Marek Ol=C5=A1=C3=A1k                2016-08-17  4573 =20
b0adca4d50169d Evan Quan                  2019-11-05  4574  	/*
b0adca4d50169d Evan Quan                  2019-11-05  4575  	 * Register gp=
u instance before amdgpu_device_enable_mgpu_fan_boost.
b0adca4d50169d Evan Quan                  2019-11-05  4576  	 * Otherwise t=
he mgpu fan boost feature will be skipped due to the
b0adca4d50169d Evan Quan                  2019-11-05  4577  	 * gpu instanc=
e is counted less.
b0adca4d50169d Evan Quan                  2019-11-05  4578  	 */
b0adca4d50169d Evan Quan                  2019-11-05  4579  	amdgpu_registe=
r_gpu_instance(adev);
b0adca4d50169d Evan Quan                  2019-11-05  4580 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4581  	/* enable cloc=
kgating, etc. after ib tests, etc. since some blocks require
d38ceaf99ed015 Alex Deucher               2015-04-20  4582  	 * explicit ga=
ting rather than handling it automatically.
d38ceaf99ed015 Alex Deucher               2015-04-20  4583  	 */
5839d27d5b2dad Lijo Lazar                 2024-08-19  4584  	if (adev->init=
_lvl->level !=3D AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
06ec907054c5a4 Alex Deucher               2017-12-14  4585  		r =3D amdgpu_=
device_ip_late_init(adev);
2c1a2784039442 Alex Deucher               2015-12-07  4586  		if (r) {
06ec907054c5a4 Alex Deucher               2017-12-14  4587  			dev_err(adev=
->dev, "amdgpu_device_ip_late_init failed\n");
e23b74aab5dc48 Alex Deucher               2017-09-28  4588  			amdgpu_vf_er=
ror_put(adev, AMDGIM_ERROR_VF_AMDGPU_LATE_INIT_FAIL, 0, r);
970fd197643490 Stanley.Yang               2021-03-10  4589  			goto release=
_ras_con;
2c1a2784039442 Alex Deucher               2015-12-07  4590  		}
108c6a6309c96a xinhui pan                 2019-03-11  4591  		/* must succe=
ed. */
511fdbc33aaa47 xinhui pan                 2019-05-09  4592  		amdgpu_ras_re=
sume(adev);
beff74bc6e0fa9 Alex Deucher               2019-05-28  4593  		queue_delayed=
_work(system_wq, &adev->delayed_init_work,
beff74bc6e0fa9 Alex Deucher               2019-05-28  4594  				   msecs_to=
_jiffies(AMDGPU_RESUME_MS));
e3c1b0712fdb03 shaoyunl                   2021-02-16  4595  	}
beff74bc6e0fa9 Alex Deucher               2019-05-28  4596 =20
38eecbe086a4e5 Chong Li                   2023-04-14  4597  	if (amdgpu_sri=
ov_vf(adev)) {
38eecbe086a4e5 Chong Li                   2023-04-14  4598  		amdgpu_virt_r=
elease_full_gpu(adev, true);
2c738637bac1aa Monk Liu                   2020-06-29  4599  		flush_delayed=
_work(&adev->delayed_init_work);
38eecbe086a4e5 Chong Li                   2023-04-14  4600  	}
2c738637bac1aa Monk Liu                   2020-06-29  4601 =20
90bcb9b595549d Evan Quan                  2023-08-11  4602  	/*
90bcb9b595549d Evan Quan                  2023-08-11  4603  	 * Place those=
 sysfs registering after `late_init`. As some of those
90bcb9b595549d Evan Quan                  2023-08-11  4604  	 * operations =
performed in `late_init` might affect the sysfs
90bcb9b595549d Evan Quan                  2023-08-11  4605  	 * interfaces =
creating.
90bcb9b595549d Evan Quan                  2023-08-11  4606  	 */
90bcb9b595549d Evan Quan                  2023-08-11  4607  	r =3D amdgpu_a=
tombios_sysfs_init(adev);
90bcb9b595549d Evan Quan                  2023-08-11  4608  	if (r)
90bcb9b595549d Evan Quan                  2023-08-11  4609  		drm_err(&adev=
->ddev,
90bcb9b595549d Evan Quan                  2023-08-11  4610  			"registering=
 atombios sysfs failed (%d).\n", r);
90bcb9b595549d Evan Quan                  2023-08-11  4611 =20
90bcb9b595549d Evan Quan                  2023-08-11  4612  	r =3D amdgpu_p=
m_sysfs_init(adev);
90bcb9b595549d Evan Quan                  2023-08-11  4613  	if (r)
90bcb9b595549d Evan Quan                  2023-08-11  4614  		DRM_ERROR("re=
gistering pm sysfs failed (%d).\n", r);
90bcb9b595549d Evan Quan                  2023-08-11  4615 =20
90bcb9b595549d Evan Quan                  2023-08-11  4616  	r =3D amdgpu_u=
code_sysfs_init(adev);
90bcb9b595549d Evan Quan                  2023-08-11  4617  	if (r) {
90bcb9b595549d Evan Quan                  2023-08-11  4618  		adev->ucode_s=
ysfs_en =3D false;
90bcb9b595549d Evan Quan                  2023-08-11  4619  		DRM_ERROR("Cr=
eating firmware sysfs failed (%d).\n", r);
90bcb9b595549d Evan Quan                  2023-08-11  4620  	} else
90bcb9b595549d Evan Quan                  2023-08-11  4621  		adev->ucode_s=
ysfs_en =3D true;
90bcb9b595549d Evan Quan                  2023-08-11  4622 =20
77f3a5cd7023d9 Nirmoy Das                 2020-05-07  4623  	r =3D sysfs_cr=
eate_files(&adev->dev->kobj, amdgpu_dev_attributes);
5aea5327ea2ddf Luben Tuikov               2020-09-16  4624  	if (r)
77f3a5cd7023d9 Nirmoy Das                 2020-05-07  4625  		dev_err(adev-=
>dev, "Could not create amdgpu device attr\n");
bd607166af7fe3 Kent Russell               2020-03-13  4626 =20
76da73f0266cd0 Lijo Lazar                 2023-09-28  4627  	r =3D devm_dev=
ice_add_group(adev->dev, &amdgpu_board_attrs_group);
76da73f0266cd0 Lijo Lazar                 2023-09-28  4628  	if (r)
76da73f0266cd0 Lijo Lazar                 2023-09-28  4629  		dev_err(adev-=
>dev,
76da73f0266cd0 Lijo Lazar                 2023-09-28  4630  			"Could not c=
reate amdgpu board attributes\n");
76da73f0266cd0 Lijo Lazar                 2023-09-28  4631 =20
7957ec80ef97e9 Lijo Lazar                 2023-08-04  4632  	amdgpu_fru_sys=
fs_init(adev);
af39e6f4d8032b Lijo Lazar                 2023-10-06  4633  	amdgpu_reg_sta=
te_sysfs_init(adev);
4ae86dc8785046 Lijo Lazar                 2024-09-09  4634  	amdgpu_xcp_cfg=
_sysfs_init(adev);
7957ec80ef97e9 Lijo Lazar                 2023-08-04  4635 =20
d155bef0636e01 Arnd Bergmann              2019-07-08  4636  	if (IS_ENABLED=
(CONFIG_PERF_EVENTS))
9c7c85f7ea1fe5 Jonathan Kim               2019-06-19  4637  		r =3D amdgpu_=
pmu_init(adev);
9c7c85f7ea1fe5 Jonathan Kim               2019-06-19  4638  	if (r)
9c7c85f7ea1fe5 Jonathan Kim               2019-06-19  4639  		dev_err(adev-=
>dev, "amdgpu_pmu_init failed\n");
9c7c85f7ea1fe5 Jonathan Kim               2019-06-19  4640 =20
c1dd4aa624076c Andrey Grodzovsky          2020-08-24  4641  	/* Have stored=
 pci confspace at hand for restore in sudden PCI error */
c1dd4aa624076c Andrey Grodzovsky          2020-08-24  4642  	if (amdgpu_dev=
ice_cache_pci_state(adev->pdev))
c1dd4aa624076c Andrey Grodzovsky          2020-08-24  4643  		pci_restore_s=
tate(pdev);
c1dd4aa624076c Andrey Grodzovsky          2020-08-24  4644 =20
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4645  	/* if we have =
> 1 VGA cards, then disable the amdgpu VGA resources */
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4646  	/* this will f=
ail for cards that aren't VGA class devices, just
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4647  	 * ignore it
b8920e1e0dae10 Srinivasan Shanmugam       2023-07-23  4648  	 */
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4649  	if ((adev->pde=
v->class >> 8) =3D=3D PCI_CLASS_DISPLAY_VGA)
bf44e8cecc03c9 Christoph Hellwig          2021-07-16  4650  		vga_client_re=
gister(adev->pdev, amdgpu_device_vga_set_decode);
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4651 =20
d37a3929ca0363 Orlando Chamberlain        2023-03-03  4652  	px =3D amdgpu_=
device_supports_px(ddev);
d37a3929ca0363 Orlando Chamberlain        2023-03-03  4653 =20
7b1c6263eaf4fd Alex Deucher               2023-10-17  4654  	if (px || (!de=
v_is_removable(&adev->pdev->dev) &&
d37a3929ca0363 Orlando Chamberlain        2023-03-03  4655  				apple_gmux_=
detect(NULL, NULL)))
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4656  		vga_switchero=
o_register_client(adev->pdev,
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4657  					       &am=
dgpu_switcheroo_ops, px);
d37a3929ca0363 Orlando Chamberlain        2023-03-03  4658 =20
d37a3929ca0363 Orlando Chamberlain        2023-03-03  4659  	if (px)
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4660  		vga_switchero=
o_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
8c3dd61cfa05a6 Kai-Heng Feng              2021-04-26  4661 =20
5839d27d5b2dad Lijo Lazar                 2024-08-19  4662  	if (adev->init=
_lvl->level =3D=3D AMDGPU_INIT_LEVEL_MINIMAL_XGMI)
631af731ee9cc7 Lijo Lazar                 2024-08-26  4663  		amdgpu_xgmi_r=
eset_on_init(adev);
e3c1b0712fdb03 shaoyunl                   2021-02-16  4664 =20
4a74c38cd67b3e Philip Yang                2021-12-06  4665  	amdgpu_device_=
check_iommu_direct_map(adev);
4a74c38cd67b3e Philip Yang                2021-12-06  4666 =20
2965e6355dcdf1 Mario Limonciello          2024-11-27  4667  	adev->pm_nb.no=
tifier_call =3D amdgpu_device_pm_notifier;
2965e6355dcdf1 Mario Limonciello          2024-11-27  4668  	r =3D register=
_pm_notifier(&adev->pm_nb);
2965e6355dcdf1 Mario Limonciello          2024-11-27  4669  	if (r)
2965e6355dcdf1 Mario Limonciello          2024-11-27  4670  		goto failed;
2965e6355dcdf1 Mario Limonciello          2024-11-27  4671 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  4672  	return 0;
83ba126a9be318 Alex Deucher               2016-06-03  4673 =20
970fd197643490 Stanley.Yang               2021-03-10  4674  release_ras_con:
38eecbe086a4e5 Chong Li                   2023-04-14  4675  	if (amdgpu_sri=
ov_vf(adev))
38eecbe086a4e5 Chong Li                   2023-04-14  4676  		amdgpu_virt_r=
elease_full_gpu(adev, true);
38eecbe086a4e5 Chong Li                   2023-04-14  4677 =20
38eecbe086a4e5 Chong Li                   2023-04-14  4678  	/* failed in e=
xclusive mode due to timeout */
38eecbe086a4e5 Chong Li                   2023-04-14  4679  	if (amdgpu_sri=
ov_vf(adev) &&
38eecbe086a4e5 Chong Li                   2023-04-14  4680  		!amdgpu_sriov=
_runtime(adev) &&
38eecbe086a4e5 Chong Li                   2023-04-14  4681  		amdgpu_virt_m=
mio_blocked(adev) &&
38eecbe086a4e5 Chong Li                   2023-04-14  4682  		!amdgpu_virt_=
wait_reset(adev)) {
38eecbe086a4e5 Chong Li                   2023-04-14  4683  		dev_err(adev-=
>dev, "VF exclusive mode timeout\n");
38eecbe086a4e5 Chong Li                   2023-04-14  4684  		/* Don't send=
 request since VF is inactive. */
38eecbe086a4e5 Chong Li                   2023-04-14  4685  		adev->virt.ca=
ps &=3D ~AMDGPU_SRIOV_CAPS_RUNTIME;
38eecbe086a4e5 Chong Li                   2023-04-14  4686  		adev->virt.op=
s =3D NULL;
38eecbe086a4e5 Chong Li                   2023-04-14  4687  		r =3D -EAGAIN;
38eecbe086a4e5 Chong Li                   2023-04-14  4688  	}
970fd197643490 Stanley.Yang               2021-03-10  4689  	amdgpu_release=
_ras_context(adev);
970fd197643490 Stanley.Yang               2021-03-10  4690 =20
83ba126a9be318 Alex Deucher               2016-06-03  4691  failed:
890419409a3aba Gavin Wan                  2017-06-23  4692  	amdgpu_vf_erro=
r_trans_all(adev);
8840a3878d40c9 pding                      2017-10-23  4693 =20
83ba126a9be318 Alex Deucher               2016-06-03 @4694  	return r;
d38ceaf99ed015 Alex Deucher               2015-04-20  4695  }
d38ceaf99ed015 Alex Deucher               2015-04-20  4696 =20

:::::: The code at line 4694 was first introduced by commit
:::::: 83ba126a9be318ca4f66b066faadd2c728d1568c drm/amdgpu: properly clean =
up runtime pm

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
