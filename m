Content-Type: multipart/mixed; boundary="===============6689625108939777255=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 2762/7920] drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3355 amdgpu_device_init() warn: 'adev->rmmio' not released on lines: 3355.
Date: Wed, 16 Sep 2020 17:11:41 +0300
Message-ID: <20200916141141.GI4282@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6689625108939777255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[
  This is a new check that I pushed yesterday.  I've pushed some more
  improvements to hopefully cut down on the false positives.

  It finds a ton of bugs in ancient code.  The bug here is really five
  years old.  I don't know why it's picking this particular
  commit to blame.

  The other noteworthy for zero-day bot commit that I pushed yesterday
  is that I hopefully silenced the "double unlock" warnings.  Those were
  because CONFIG_SMP was disabled, so now the check is only enabled if
  CONFIG_SMP is set.

  - dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6b02addb1d1748d21dd1261e46029b264be4e5a0
commit: 8aba21b75136c39c4bf63345d699d97dc477ce0e [2762/7920] drm/amdgpu: Em=
bed drm_device into amdgpu_device (v3)
config: i386-randconfig-m021-20200916 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3355 amdgpu_device_init() warn: =
'adev->rmmio' not released on lines: 3355.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D8aba21b75136c39c4bf63345d699d97dc477ce0e
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout 8aba21b75136c39c4bf63345d699d97dc477ce0e
vim +3355 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

d38ceaf99ed015 Alex Deucher      2015-04-20  2988  int amdgpu_device_init(s=
truct amdgpu_device *adev,
d38ceaf99ed015 Alex Deucher      2015-04-20  2989  		       uint32_t flags)
d38ceaf99ed015 Alex Deucher      2015-04-20  2990  {
8aba21b75136c3 Luben Tuikov      2020-08-14  2991  	struct drm_device *ddev=
 =3D adev_to_drm(adev);
8aba21b75136c3 Luben Tuikov      2020-08-14  2992  	struct pci_dev *pdev =
=3D adev->pdev;
d38ceaf99ed015 Alex Deucher      2015-04-20  2993  	int r, i;
3840c5bcc24563 Alex Deucher      2019-10-04  2994  	bool boco =3D false;
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  2995  	u32 max_MBps;
d38ceaf99ed015 Alex Deucher      2015-04-20  2996  =

d38ceaf99ed015 Alex Deucher      2015-04-20  2997  	adev->shutdown =3D fals=
e;
d38ceaf99ed015 Alex Deucher      2015-04-20  2998  	adev->flags =3D flags;
4e66d7d2156243 Yong Zhao         2019-08-30  2999  =

4e66d7d2156243 Yong Zhao         2019-08-30  3000  	if (amdgpu_force_asic_t=
ype >=3D 0 && amdgpu_force_asic_type < CHIP_LAST)
4e66d7d2156243 Yong Zhao         2019-08-30  3001  		adev->asic_type =3D am=
dgpu_force_asic_type;
4e66d7d2156243 Yong Zhao         2019-08-30  3002  	else
2f7d10b393c83a Jammy Zhou        2015-07-22  3003  		adev->asic_type =3D fl=
ags & AMD_ASIC_MASK;
4e66d7d2156243 Yong Zhao         2019-08-30  3004  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3005  	adev->usec_timeout =3D =
AMDGPU_MAX_USEC_TIMEOUT;
593aa2d282259e Shaoyun Liu       2018-02-07  3006  	if (amdgpu_emu_mode =3D=
=3D 1)
8bdab6bb1cf120 Yong Zhao         2020-02-25  3007  		adev->usec_timeout *=
=3D 10;
770d13b19fdf36 Christian K=C3=B6nig   2018-01-12  3008  	adev->gmc.gart_siz=
e =3D 512 * 1024 * 1024;
d38ceaf99ed015 Alex Deucher      2015-04-20  3009  	adev->accel_working =3D=
 false;
d38ceaf99ed015 Alex Deucher      2015-04-20  3010  	adev->num_rings =3D 0;
d38ceaf99ed015 Alex Deucher      2015-04-20  3011  	adev->mman.buffer_funcs=
 =3D NULL;
d38ceaf99ed015 Alex Deucher      2015-04-20  3012  	adev->mman.buffer_funcs=
_ring =3D NULL;
d38ceaf99ed015 Alex Deucher      2015-04-20  3013  	adev->vm_manager.vm_pte=
_funcs =3D NULL;
0c88b43032131f Nirmoy Das        2019-12-06  3014  	adev->vm_manager.vm_pte=
_num_scheds =3D 0;
132f34e4b55848 Christian K=C3=B6nig   2018-01-12  3015  	adev->gmc.gmc_func=
s =3D NULL;
f54d1867005c33 Chris Wilson      2016-10-25  3016  	adev->fence_context =3D=
 dma_fence_context_alloc(AMDGPU_MAX_RINGS);
b8866c26ec072f Andres Rodriguez  2017-04-28  3017  	bitmap_zero(adev->gfx.p=
ipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
d38ceaf99ed015 Alex Deucher      2015-04-20  3018  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3019  	adev->smc_rreg =3D &amd=
gpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3020  	adev->smc_wreg =3D &amd=
gpu_invalid_wreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3021  	adev->pcie_rreg =3D &am=
dgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3022  	adev->pcie_wreg =3D &am=
dgpu_invalid_wreg;
36b9a952bbf688 Huang Rui         2016-08-31  3023  	adev->pciep_rreg =3D &a=
mdgpu_invalid_rreg;
36b9a952bbf688 Huang Rui         2016-08-31  3024  	adev->pciep_wreg =3D &a=
mdgpu_invalid_wreg;
4fa1c6a679bb0d Tao Zhou          2019-07-24  3025  	adev->pcie_rreg64 =3D &=
amdgpu_invalid_rreg64;
4fa1c6a679bb0d Tao Zhou          2019-07-24  3026  	adev->pcie_wreg64 =3D &=
amdgpu_invalid_wreg64;
d38ceaf99ed015 Alex Deucher      2015-04-20  3027  	adev->uvd_ctx_rreg =3D =
&amdgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3028  	adev->uvd_ctx_wreg =3D =
&amdgpu_invalid_wreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3029  	adev->didt_rreg =3D &am=
dgpu_invalid_rreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3030  	adev->didt_wreg =3D &am=
dgpu_invalid_wreg;
ccdbb20a75e3e3 Rex Zhu           2016-06-08  3031  	adev->gc_cac_rreg =3D &=
amdgpu_invalid_rreg;
ccdbb20a75e3e3 Rex Zhu           2016-06-08  3032  	adev->gc_cac_wreg =3D &=
amdgpu_invalid_wreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3033  	adev->audio_endpt_rreg =
=3D &amdgpu_block_invalid_rreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3034  	adev->audio_endpt_wreg =
=3D &amdgpu_block_invalid_wreg;
d38ceaf99ed015 Alex Deucher      2015-04-20  3035  =

3e39ab90833b20 Alex Deucher      2015-06-05  3036  	DRM_INFO("initializing =
kernel modesetting (%s 0x%04X:0x%04X 0x%04X:0x%04X 0x%02X).\n",
d38ceaf99ed015 Alex Deucher      2015-04-20  3037  		 amdgpu_asic_name[adev=
->asic_type], pdev->vendor, pdev->device,
3e39ab90833b20 Alex Deucher      2015-06-05  3038  		 pdev->subsystem_vendo=
r, pdev->subsystem_device, pdev->revision);
d38ceaf99ed015 Alex Deucher      2015-04-20  3039  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3040  	/* mutex initialization=
 are all done here so we
d38ceaf99ed015 Alex Deucher      2015-04-20  3041  	 * can recall function =
without having locking issues */
d38ceaf99ed015 Alex Deucher      2015-04-20  3042  	atomic_set(&adev->irq.i=
h.lock, 0);
0e5ca0d1ac07ef Huang Rui         2017-03-03  3043  	mutex_init(&adev->firmw=
are.mutex);
d38ceaf99ed015 Alex Deucher      2015-04-20  3044  	mutex_init(&adev->pm.mu=
tex);
d38ceaf99ed015 Alex Deucher      2015-04-20  3045  	mutex_init(&adev->gfx.g=
pu_clock_mutex);
d38ceaf99ed015 Alex Deucher      2015-04-20  3046  	mutex_init(&adev->srbm_=
mutex);
b8866c26ec072f Andres Rodriguez  2017-04-28  3047  	mutex_init(&adev->gfx.p=
ipe_reserve_mutex);
d23ee13fba23a3 Rex Zhu           2018-07-30  3048  	mutex_init(&adev->gfx.g=
fx_off_mutex);
d38ceaf99ed015 Alex Deucher      2015-04-20  3049  	mutex_init(&adev->grbm_=
idx_mutex);
d38ceaf99ed015 Alex Deucher      2015-04-20  3050  	mutex_init(&adev->mn_lo=
ck);
e23b74aab5dc48 Alex Deucher      2017-09-28  3051  	mutex_init(&adev->virt.=
vf_errors.lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3052  	hash_init(adev->mn_hash=
);
53b3f8f40e6cff Dennis Li         2020-08-19  3053  	atomic_set(&adev->in_gp=
u_reset, 0);
6049db43d6dd9c Dennis Li         2020-08-20  3054  	init_rwsem(&adev->reset=
_sem);
32eaeae0ef193b Alex Deucher      2019-07-08  3055  	mutex_init(&adev->psp.m=
utex);
bd052211233266 Pan, Xinhui       2020-01-16  3056  	mutex_init(&adev->notif=
ier_lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3057  =

912dfc846aad77 Evan Quan         2019-04-29  3058  	r =3D amdgpu_device_che=
ck_arguments(adev);
912dfc846aad77 Evan Quan         2019-04-29  3059  	if (r)
912dfc846aad77 Evan Quan         2019-04-29  3060  		return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  3061  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3062  	spin_lock_init(&adev->m=
mio_idx_lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3063  	spin_lock_init(&adev->s=
mc_idx_lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3064  	spin_lock_init(&adev->p=
cie_idx_lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3065  	spin_lock_init(&adev->u=
vd_ctx_idx_lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3066  	spin_lock_init(&adev->d=
idt_idx_lock);
ccdbb20a75e3e3 Rex Zhu           2016-06-08  3067  	spin_lock_init(&adev->g=
c_cac_idx_lock);
16abb5d206499d Evan Quan         2017-07-04  3068  	spin_lock_init(&adev->s=
e_cac_idx_lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3069  	spin_lock_init(&adev->a=
udio_endpt_idx_lock);
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3070  	spin_lock_ini=
t(&adev->mm_stats.lock);
d38ceaf99ed015 Alex Deucher      2015-04-20  3071  =

0c4e7fa56112b0 Chunming Zhou     2016-08-17  3072  	INIT_LIST_HEAD(&adev->s=
hadow_list);
0c4e7fa56112b0 Chunming Zhou     2016-08-17  3073  	mutex_init(&adev->shado=
w_list_lock);
0c4e7fa56112b0 Chunming Zhou     2016-08-17  3074  =

beff74bc6e0fa9 Alex Deucher      2019-05-28  3075  	INIT_DELAYED_WORK(&adev=
->delayed_init_work,
beff74bc6e0fa9 Alex Deucher      2019-05-28  3076  			  amdgpu_device_delay=
ed_init_work_handler);
1e317b99f0c244 Rex Zhu           2018-07-27  3077  	INIT_DELAYED_WORK(&adev=
->gfx.gfx_off_delay_work,
1e317b99f0c244 Rex Zhu           2018-07-27  3078  			  amdgpu_device_delay=
_enable_gfx_off);
2dc80b00652f2a Shirish S         2017-05-25  3079  =

d4535e2c018bba Andrey Grodzovsky 2018-11-29  3080  	INIT_WORK(&adev->xgmi_r=
eset_work, amdgpu_device_xgmi_reset_func);
d4535e2c018bba Andrey Grodzovsky 2018-11-29  3081  =

d23ee13fba23a3 Rex Zhu           2018-07-30  3082  	adev->gfx.gfx_off_req_c=
ount =3D 1;
b6e79d9a314ebe Jason Yan         2020-04-27  3083  	adev->pm.ac_power =3D p=
ower_supply_is_system_supplied() > 0;
b1ddf548472729 Rex Zhu           2018-06-04  3084  =

b265bdbd9f2811 Evan Quan         2020-05-22  3085  	atomic_set(&adev->throt=
tling_logging_enabled, 1);
b265bdbd9f2811 Evan Quan         2020-05-22  3086  	/*
b265bdbd9f2811 Evan Quan         2020-05-22  3087  	 * If throttling contin=
ues, logging will be performed every minute
b265bdbd9f2811 Evan Quan         2020-05-22  3088  	 * to avoid log floodin=
g. "-1" is subtracted since the thermal
b265bdbd9f2811 Evan Quan         2020-05-22  3089  	 * throttling interrupt=
 comes every second. Thus, the total logging
b265bdbd9f2811 Evan Quan         2020-05-22  3090  	 * interval is 59 secon=
ds(retelimited printk interval) + 1(waiting
b265bdbd9f2811 Evan Quan         2020-05-22  3091  	 * for throttling inter=
rupt) =3D 60 seconds.
b265bdbd9f2811 Evan Quan         2020-05-22  3092  	 */
b265bdbd9f2811 Evan Quan         2020-05-22  3093  	ratelimit_state_init(&a=
dev->throttling_logging_rs, (60 - 1) * HZ, 1);
b265bdbd9f2811 Evan Quan         2020-05-22  3094  	ratelimit_set_flags(&ad=
ev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
b265bdbd9f2811 Evan Quan         2020-05-22  3095  =

0fa4955838ea1e Alex Xie          2017-06-08  3096  	/* Registers mapping */
0fa4955838ea1e Alex Xie          2017-06-08  3097  	/* TODO: block userspac=
e mapping of io register */
da69c161448d6a Ken Wang          2016-01-21  3098  	if (adev->asic_type >=
=3D CHIP_BONAIRE) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3099  		adev->rmmio_base =3D p=
ci_resource_start(adev->pdev, 5);
d38ceaf99ed015 Alex Deucher      2015-04-20  3100  		adev->rmmio_size =3D p=
ci_resource_len(adev->pdev, 5);
da69c161448d6a Ken Wang          2016-01-21  3101  	} else {
da69c161448d6a Ken Wang          2016-01-21  3102  		adev->rmmio_base =3D p=
ci_resource_start(adev->pdev, 2);
da69c161448d6a Ken Wang          2016-01-21  3103  		adev->rmmio_size =3D p=
ci_resource_len(adev->pdev, 2);
da69c161448d6a Ken Wang          2016-01-21  3104  	}
5c1354bd30c118 Chunming Zhou     2016-08-30  3105  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3106  	adev->rmmio =3D ioremap=
(adev->rmmio_base, adev->rmmio_size);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This isn't released on error.

d38ceaf99ed015 Alex Deucher      2015-04-20  3107  	if (adev->rmmio =3D=3D =
NULL) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3108  		return -ENOMEM;
d38ceaf99ed015 Alex Deucher      2015-04-20  3109  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3110  	DRM_INFO("register mmio=
 base: 0x%08X\n", (uint32_t)adev->rmmio_base);
d38ceaf99ed015 Alex Deucher      2015-04-20  3111  	DRM_INFO("register mmio=
 size: %u\n", (unsigned)adev->rmmio_size);
d38ceaf99ed015 Alex Deucher      2015-04-20  3112  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3113  	/* io port mapping */
d38ceaf99ed015 Alex Deucher      2015-04-20  3114  	for (i =3D 0; i < DEVIC=
E_COUNT_RESOURCE; i++) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3115  		if (pci_resource_flags=
(adev->pdev, i) & IORESOURCE_IO) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3116  			adev->rio_mem_size =
=3D pci_resource_len(adev->pdev, i);
d38ceaf99ed015 Alex Deucher      2015-04-20  3117  			adev->rio_mem =3D pci=
_iomap(adev->pdev, i, adev->rio_mem_size);
d38ceaf99ed015 Alex Deucher      2015-04-20  3118  			break;
d38ceaf99ed015 Alex Deucher      2015-04-20  3119  		}
d38ceaf99ed015 Alex Deucher      2015-04-20  3120  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3121  	if (adev->rio_mem =3D=
=3D NULL)
b64a18c502feda Amber Lin         2017-01-04  3122  		DRM_INFO("PCI I/O BAR =
is not found.\n");
d38ceaf99ed015 Alex Deucher      2015-04-20  3123  =

b2109d8ed69765 Jack Xiao         2019-05-24  3124  	/* enable PCIE atomic o=
ps */
b2109d8ed69765 Jack Xiao         2019-05-24  3125  	r =3D pci_enable_atomic=
_ops_to_root(adev->pdev,
b2109d8ed69765 Jack Xiao         2019-05-24  3126  					  PCI_EXP_DEVCAP2_A=
TOMIC_COMP32 |
b2109d8ed69765 Jack Xiao         2019-05-24  3127  					  PCI_EXP_DEVCAP2_A=
TOMIC_COMP64);
b2109d8ed69765 Jack Xiao         2019-05-24  3128  	if (r) {
b2109d8ed69765 Jack Xiao         2019-05-24  3129  		adev->have_atomics_sup=
port =3D false;
b2109d8ed69765 Jack Xiao         2019-05-24  3130  		DRM_INFO("PCIE atomic =
ops is not supported\n");
b2109d8ed69765 Jack Xiao         2019-05-24  3131  	} else {
b2109d8ed69765 Jack Xiao         2019-05-24  3132  		adev->have_atomics_sup=
port =3D true;
b2109d8ed69765 Jack Xiao         2019-05-24  3133  	}
b2109d8ed69765 Jack Xiao         2019-05-24  3134  =

5494d8640ffc1d Alex Deucher      2018-03-09  3135  	amdgpu_device_get_pcie_=
info(adev);
5494d8640ffc1d Alex Deucher      2018-03-09  3136  =

b239c01727459b Jack Xiao         2019-01-10  3137  	if (amdgpu_mcbp)
b239c01727459b Jack Xiao         2019-01-10  3138  		DRM_INFO("MCBP is enab=
led\n");
b239c01727459b Jack Xiao         2019-01-10  3139  =

5f84cc635bce58 Jack Xiao         2019-01-25  3140  	if (amdgpu_mes && adev-=
>asic_type >=3D CHIP_NAVI10)
5f84cc635bce58 Jack Xiao         2019-01-25  3141  		adev->enable_mes =3D t=
rue;
5f84cc635bce58 Jack Xiao         2019-01-25  3142  =

3aa0115d238c71 Monk Liu          2020-03-04  3143  	/* detect hw virtualiza=
tion here */
3aa0115d238c71 Monk Liu          2020-03-04  3144  	amdgpu_detect_virtualiz=
ation(adev);
3aa0115d238c71 Monk Liu          2020-03-04  3145  =

dffa11b4f74b15 Monk Liu          2020-03-04  3146  	r =3D amdgpu_device_get=
_job_timeout_settings(adev);
a190d1c75c73ce Xiaojie Yuan      2019-03-27  3147  	if (r) {
dffa11b4f74b15 Monk Liu          2020-03-04  3148  		dev_err(adev->dev, "in=
valid lockup_timeout parameter syntax\n");
a190d1c75c73ce Xiaojie Yuan      2019-03-27  3149  		return r;
a190d1c75c73ce Xiaojie Yuan      2019-03-27  3150  	}
a190d1c75c73ce Xiaojie Yuan      2019-03-27  3151  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3152  	/* early init functions=
 */
06ec907054c5a4 Alex Deucher      2017-12-14  3153  	r =3D amdgpu_device_ip_=
early_init(adev);
d38ceaf99ed015 Alex Deucher      2015-04-20  3154  	if (r)
d38ceaf99ed015 Alex Deucher      2015-04-20  3155  		return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  3156  =

6585661ddd6a0a Oak Zeng          2018-11-19  3157  	/* doorbell bar mapping=
 and doorbell index init*/
6585661ddd6a0a Oak Zeng          2018-11-19  3158  	amdgpu_device_doorbell_=
init(adev);
6585661ddd6a0a Oak Zeng          2018-11-19  3159  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3160  	/* if we have > 1 VGA c=
ards, then disable the amdgpu VGA resources */
d38ceaf99ed015 Alex Deucher      2015-04-20  3161  	/* this will fail for c=
ards that aren't VGA class devices, just
d38ceaf99ed015 Alex Deucher      2015-04-20  3162  	 * ignore it */
06ec907054c5a4 Alex Deucher      2017-12-14  3163  	vga_client_register(ade=
v->pdev, adev, NULL, amdgpu_device_vga_set_decode);
d38ceaf99ed015 Alex Deucher      2015-04-20  3164  =

31af062acfbd5d Alex Deucher      2019-10-04  3165  	if (amdgpu_device_suppo=
rts_boco(ddev))
3840c5bcc24563 Alex Deucher      2019-10-04  3166  		boco =3D true;
3840c5bcc24563 Alex Deucher      2019-10-04  3167  	if (amdgpu_has_atpx() &&
3840c5bcc24563 Alex Deucher      2019-10-04  3168  	    (amdgpu_is_atpx_hyb=
rid() ||
3840c5bcc24563 Alex Deucher      2019-10-04  3169  	     amdgpu_has_atpx_dg=
pu_power_cntl()) &&
3840c5bcc24563 Alex Deucher      2019-10-04  3170  	    !pci_is_thunderbolt=
_attached(adev->pdev))
84c8b22e9fe8d9 Lukas Wunner      2017-03-10  3171  		vga_switcheroo_registe=
r_client(adev->pdev,
3840c5bcc24563 Alex Deucher      2019-10-04  3172  					       &amdgpu_swit=
cheroo_ops, boco);
3840c5bcc24563 Alex Deucher      2019-10-04  3173  	if (boco)
d38ceaf99ed015 Alex Deucher      2015-04-20  3174  		vga_switcheroo_init_do=
main_pm_ops(adev->dev, &adev->vga_pm_domain);
d38ceaf99ed015 Alex Deucher      2015-04-20  3175  =

9475a9434f594f Shaoyun Liu       2018-02-01  3176  	if (amdgpu_emu_mode =3D=
=3D 1) {
9475a9434f594f Shaoyun Liu       2018-02-01  3177  		/* post the asic on em=
ulation mode */
9475a9434f594f Shaoyun Liu       2018-02-01  3178  		emu_soc_asic_init(adev=
);
bfca02892773d2 Shaoyun Liu       2018-02-01  3179  		goto fence_driver_init;
9475a9434f594f Shaoyun Liu       2018-02-01  3180  	}
bfca02892773d2 Shaoyun Liu       2018-02-01  3181  =

4e99a44e37bfed Monk Liu          2016-03-31  3182  	/* detect if we are wit=
h an SRIOV vbios */
4e99a44e37bfed Monk Liu          2016-03-31  3183  	amdgpu_device_detect_sr=
iov_bios(adev);
048765ad5af7c8 Andres Rodriguez  2016-06-11  3184  =

95e8e59ec49f7c Alex Deucher      2018-11-01  3185  	/* check if we need to =
reset the asic
95e8e59ec49f7c Alex Deucher      2018-11-01  3186  	 *  E.g., driver was no=
t cleanly unloaded previously, etc.
95e8e59ec49f7c Alex Deucher      2018-11-01  3187  	 */
f14899fd2a5607 wentalou          2019-01-17  3188  	if (!amdgpu_sriov_vf(ad=
ev) && amdgpu_asic_need_reset_on_init(adev)) {
95e8e59ec49f7c Alex Deucher      2018-11-01  3189  		r =3D amdgpu_asic_rese=
t(adev);
95e8e59ec49f7c Alex Deucher      2018-11-01  3190  		if (r) {
95e8e59ec49f7c Alex Deucher      2018-11-01  3191  			dev_err(adev->dev, "a=
sic reset on init failed\n");
95e8e59ec49f7c Alex Deucher      2018-11-01  3192  			goto failed;
95e8e59ec49f7c Alex Deucher      2018-11-01  3193  		}
95e8e59ec49f7c Alex Deucher      2018-11-01  3194  	}
95e8e59ec49f7c Alex Deucher      2018-11-01  3195  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3196  	/* Post card if necessa=
ry */
39c640c086ad12 Alex Deucher      2017-12-15  3197  	if (amdgpu_device_need_=
post(adev)) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3198  		if (!adev->bios) {
bec86378befae4 Monk Liu          2016-09-14  3199  			dev_err(adev->dev, "n=
o vBIOS found\n");
83ba126a9be318 Alex Deucher      2016-06-03  3200  			r =3D -EINVAL;
83ba126a9be318 Alex Deucher      2016-06-03  3201  			goto failed;
d38ceaf99ed015 Alex Deucher      2015-04-20  3202  		}
bec86378befae4 Monk Liu          2016-09-14  3203  		DRM_INFO("GPU posting =
now...\n");
4e99a44e37bfed Monk Liu          2016-03-31  3204  		r =3D amdgpu_atom_asic=
_init(adev->mode_info.atom_context);
4e99a44e37bfed Monk Liu          2016-03-31  3205  		if (r) {
4e99a44e37bfed Monk Liu          2016-03-31  3206  			dev_err(adev->dev, "g=
pu post error!\n");
4e99a44e37bfed Monk Liu          2016-03-31  3207  			goto failed;
4e99a44e37bfed Monk Liu          2016-03-31  3208  		}
d38ceaf99ed015 Alex Deucher      2015-04-20  3209  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3210  =

88b64e9536746e Alex Deucher      2017-07-10  3211  	if (adev->is_atom_fw) {
88b64e9536746e Alex Deucher      2017-07-10  3212  		/* Initialize clocks */
88b64e9536746e Alex Deucher      2017-07-10  3213  		r =3D amdgpu_atomfirmw=
are_get_clock_info(adev);
88b64e9536746e Alex Deucher      2017-07-10  3214  		if (r) {
88b64e9536746e Alex Deucher      2017-07-10  3215  			dev_err(adev->dev, "a=
mdgpu_atomfirmware_get_clock_info failed\n");
e23b74aab5dc48 Alex Deucher      2017-09-28  3216  			amdgpu_vf_error_put(a=
dev, AMDGIM_ERROR_VF_ATOMBIOS_GET_CLOCK_FAIL, 0, 0);
88b64e9536746e Alex Deucher      2017-07-10  3217  			goto failed;
88b64e9536746e Alex Deucher      2017-07-10  3218  		}
88b64e9536746e Alex Deucher      2017-07-10  3219  	} else {
d38ceaf99ed015 Alex Deucher      2015-04-20  3220  		/* Initialize clocks */
d38ceaf99ed015 Alex Deucher      2015-04-20  3221  		r =3D amdgpu_atombios_=
get_clock_info(adev);
2c1a2784039442 Alex Deucher      2015-12-07  3222  		if (r) {
2c1a2784039442 Alex Deucher      2015-12-07  3223  			dev_err(adev->dev, "a=
mdgpu_atombios_get_clock_info failed\n");
e23b74aab5dc48 Alex Deucher      2017-09-28  3224  			amdgpu_vf_error_put(a=
dev, AMDGIM_ERROR_VF_ATOMBIOS_GET_CLOCK_FAIL, 0, 0);
890419409a3aba Gavin Wan         2017-06-23  3225  			goto failed;
2c1a2784039442 Alex Deucher      2015-12-07  3226  		}
d38ceaf99ed015 Alex Deucher      2015-04-20  3227  		/* init i2c buses */
4562236b3bc0a2 Harry Wentland    2017-09-12  3228  		if (!amdgpu_device_has=
_dc_support(adev))
d38ceaf99ed015 Alex Deucher      2015-04-20  3229  			amdgpu_atombios_i2c_i=
nit(adev);
a5bde2f964fa06 Alex Deucher      2016-09-23  3230  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3231  =

bfca02892773d2 Shaoyun Liu       2018-02-01  3232  fence_driver_init:
d38ceaf99ed015 Alex Deucher      2015-04-20  3233  	/* Fence driver */
d38ceaf99ed015 Alex Deucher      2015-04-20  3234  	r =3D amdgpu_fence_driv=
er_init(adev);
2c1a2784039442 Alex Deucher      2015-12-07  3235  	if (r) {
2c1a2784039442 Alex Deucher      2015-12-07  3236  		dev_err(adev->dev, "am=
dgpu_fence_driver_init failed\n");
e23b74aab5dc48 Alex Deucher      2017-09-28  3237  		amdgpu_vf_error_put(ad=
ev, AMDGIM_ERROR_VF_FENCE_INIT_FAIL, 0, 0);
83ba126a9be318 Alex Deucher      2016-06-03  3238  		goto failed;
2c1a2784039442 Alex Deucher      2015-12-07  3239  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3240  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3241  	/* init the mode config=
 */
4a580877bdcb83 Luben Tuikov      2020-08-24  3242  	drm_mode_config_init(ad=
ev_to_drm(adev));
d38ceaf99ed015 Alex Deucher      2015-04-20  3243  =

06ec907054c5a4 Alex Deucher      2017-12-14  3244  	r =3D amdgpu_device_ip_=
init(adev);
d38ceaf99ed015 Alex Deucher      2015-04-20  3245  	if (r) {
8840a3878d40c9 pding             2017-10-23  3246  		/* failed in exclusive=
 mode due to timeout */
8840a3878d40c9 pding             2017-10-23  3247  		if (amdgpu_sriov_vf(ad=
ev) &&
8840a3878d40c9 pding             2017-10-23  3248  		    !amdgpu_sriov_runt=
ime(adev) &&
8840a3878d40c9 pding             2017-10-23  3249  		    amdgpu_virt_mmio_b=
locked(adev) &&
8840a3878d40c9 pding             2017-10-23  3250  		    !amdgpu_virt_wait_=
reset(adev)) {
8840a3878d40c9 pding             2017-10-23  3251  			dev_err(adev->dev, "V=
F exclusive mode timeout\n");
1daee8b472e896 Pixel Ding        2017-11-08  3252  			/* Don't send request=
 since VF is inactive. */
1daee8b472e896 Pixel Ding        2017-11-08  3253  			adev->virt.caps &=3D =
~AMDGPU_SRIOV_CAPS_RUNTIME;
1daee8b472e896 Pixel Ding        2017-11-08  3254  			adev->virt.ops =3D NU=
LL;
8840a3878d40c9 pding             2017-10-23  3255  			r =3D -EAGAIN;
8840a3878d40c9 pding             2017-10-23  3256  			goto failed;
8840a3878d40c9 pding             2017-10-23  3257  		}
06ec907054c5a4 Alex Deucher      2017-12-14  3258  		dev_err(adev->dev, "am=
dgpu_device_ip_init failed\n");
e23b74aab5dc48 Alex Deucher      2017-09-28  3259  		amdgpu_vf_error_put(ad=
ev, AMDGIM_ERROR_VF_AMDGPU_INIT_FAIL, 0, 0);
83ba126a9be318 Alex Deucher      2016-06-03  3260  		goto failed;
d38ceaf99ed015 Alex Deucher      2015-04-20  3261  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3262  =

d69b8971e540ae Yong Zhao         2020-04-17  3263  	dev_info(adev->dev,
d69b8971e540ae Yong Zhao         2020-04-17  3264  		"SE %d, SH per SE %d, =
CU per SH %d, active_cu_number %d\n",
d7f72fe482bfb7 Yong Zhao         2019-12-11  3265  			adev->gfx.config.max_=
shader_engines,
d7f72fe482bfb7 Yong Zhao         2019-12-11  3266  			adev->gfx.config.max_=
sh_per_se,
d7f72fe482bfb7 Yong Zhao         2019-12-11  3267  			adev->gfx.config.max_=
cu_per_sh,
d7f72fe482bfb7 Yong Zhao         2019-12-11  3268  			adev->gfx.cu_info.num=
ber);
d7f72fe482bfb7 Yong Zhao         2019-12-11  3269  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3270  	adev->accel_working =3D=
 true;
d38ceaf99ed015 Alex Deucher      2015-04-20  3271  =

e59c020598666f Alex Xie          2017-06-01  3272  	amdgpu_vm_check_compute=
_bug(adev);
e59c020598666f Alex Xie          2017-06-01  3273  =

95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3274  	/* Initialize=
 the buffer migration limit. */
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3275  	if (amdgpu_mo=
verate >=3D 0)
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3276  		max_MBps =3D=
 amdgpu_moverate;
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3277  	else
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3278  		max_MBps =3D=
 8; /* Allow 8 MB/s. */
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3279  	/* Get a log2=
 for easy divisions. */
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3280  	adev->mm_stat=
s.log2_max_MBps =3D ilog2(max(1u, max_MBps));
95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3281  =

9bc92b9c8d0919 Monk Liu          2017-02-08  3282  	amdgpu_fbdev_init(adev);
9bc92b9c8d0919 Monk Liu          2017-02-08  3283  =

d2f52ac800fec2 Rex Zhu           2017-09-22  3284  	r =3D amdgpu_pm_sysfs_i=
nit(adev);
7c868b592d5c2c Yintian Tao       2019-11-29  3285  	if (r) {
7c868b592d5c2c Yintian Tao       2019-11-29  3286  		adev->pm_sysfs_en =3D =
false;
d2f52ac800fec2 Rex Zhu           2017-09-22  3287  		DRM_ERROR("registering=
 pm debugfs failed (%d).\n", r);
7c868b592d5c2c Yintian Tao       2019-11-29  3288  	} else
7c868b592d5c2c Yintian Tao       2019-11-29  3289  		adev->pm_sysfs_en =3D =
true;
d2f52ac800fec2 Rex Zhu           2017-09-22  3290  =

5bb23532732384 Ori Messinger     2019-04-22  3291  	r =3D amdgpu_ucode_sysf=
s_init(adev);
7c868b592d5c2c Yintian Tao       2019-11-29  3292  	if (r) {
7c868b592d5c2c Yintian Tao       2019-11-29  3293  		adev->ucode_sysfs_en =
=3D false;
5bb23532732384 Ori Messinger     2019-04-22  3294  		DRM_ERROR("Creating fi=
rmware sysfs failed (%d).\n", r);
7c868b592d5c2c Yintian Tao       2019-11-29  3295  	} else
7c868b592d5c2c Yintian Tao       2019-11-29  3296  		adev->ucode_sysfs_en =
=3D true;
5bb23532732384 Ori Messinger     2019-04-22  3297  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3298  	if ((amdgpu_testing & 1=
)) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3299  		if (adev->accel_workin=
g)
d38ceaf99ed015 Alex Deucher      2015-04-20  3300  			amdgpu_test_moves(ade=
v);
d38ceaf99ed015 Alex Deucher      2015-04-20  3301  		else
d38ceaf99ed015 Alex Deucher      2015-04-20  3302  			DRM_INFO("amdgpu: acc=
eleration disabled, skipping move tests\n");
d38ceaf99ed015 Alex Deucher      2015-04-20  3303  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3304  	if (amdgpu_benchmarking=
) {
d38ceaf99ed015 Alex Deucher      2015-04-20  3305  		if (adev->accel_workin=
g)
d38ceaf99ed015 Alex Deucher      2015-04-20  3306  			amdgpu_benchmark(adev=
, amdgpu_benchmarking);
d38ceaf99ed015 Alex Deucher      2015-04-20  3307  		else
d38ceaf99ed015 Alex Deucher      2015-04-20  3308  			DRM_INFO("amdgpu: acc=
eleration disabled, skipping benchmarks\n");
d38ceaf99ed015 Alex Deucher      2015-04-20  3309  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3310  =

b0adca4d50169d Evan Quan         2019-11-05  3311  	/*
b0adca4d50169d Evan Quan         2019-11-05  3312  	 * Register gpu instanc=
e before amdgpu_device_enable_mgpu_fan_boost.
b0adca4d50169d Evan Quan         2019-11-05  3313  	 * Otherwise the mgpu f=
an boost feature will be skipped due to the
b0adca4d50169d Evan Quan         2019-11-05  3314  	 * gpu instance is coun=
ted less.
b0adca4d50169d Evan Quan         2019-11-05  3315  	 */
b0adca4d50169d Evan Quan         2019-11-05  3316  	amdgpu_register_gpu_ins=
tance(adev);
b0adca4d50169d Evan Quan         2019-11-05  3317  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3318  	/* enable clockgating, =
etc. after ib tests, etc. since some blocks require
d38ceaf99ed015 Alex Deucher      2015-04-20  3319  	 * explicit gating rath=
er than handling it automatically.
d38ceaf99ed015 Alex Deucher      2015-04-20  3320  	 */
06ec907054c5a4 Alex Deucher      2017-12-14  3321  	r =3D amdgpu_device_ip_=
late_init(adev);
2c1a2784039442 Alex Deucher      2015-12-07  3322  	if (r) {
06ec907054c5a4 Alex Deucher      2017-12-14  3323  		dev_err(adev->dev, "am=
dgpu_device_ip_late_init failed\n");
e23b74aab5dc48 Alex Deucher      2017-09-28  3324  		amdgpu_vf_error_put(ad=
ev, AMDGIM_ERROR_VF_AMDGPU_LATE_INIT_FAIL, 0, r);
83ba126a9be318 Alex Deucher      2016-06-03  3325  		goto failed;
2c1a2784039442 Alex Deucher      2015-12-07  3326  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  3327  =

108c6a6309c96a xinhui pan        2019-03-11  3328  	/* must succeed. */
511fdbc33aaa47 xinhui pan        2019-05-09  3329  	amdgpu_ras_resume(adev);
108c6a6309c96a xinhui pan        2019-03-11  3330  =

beff74bc6e0fa9 Alex Deucher      2019-05-28  3331  	queue_delayed_work(syst=
em_wq, &adev->delayed_init_work,
beff74bc6e0fa9 Alex Deucher      2019-05-28  3332  			   msecs_to_jiffies(A=
MDGPU_RESUME_MS));
beff74bc6e0fa9 Alex Deucher      2019-05-28  3333  =

2c738637bac1aa Monk Liu          2020-06-29  3334  	if (amdgpu_sriov_vf(ade=
v))
2c738637bac1aa Monk Liu          2020-06-29  3335  		flush_delayed_work(&ad=
ev->delayed_init_work);
2c738637bac1aa Monk Liu          2020-06-29  3336  =

77f3a5cd7023d9 Nirmoy Das        2020-05-07  3337  	r =3D sysfs_create_file=
s(&adev->dev->kobj, amdgpu_dev_attributes);
bd607166af7fe3 Kent Russell      2020-03-13  3338  	if (r) {
77f3a5cd7023d9 Nirmoy Das        2020-05-07  3339  		dev_err(adev->dev, "Co=
uld not create amdgpu device attr\n");
bd607166af7fe3 Kent Russell      2020-03-13  3340  		return r;
                                                                ^^^^^^^^
This should probably be "goto failed;"?

bd607166af7fe3 Kent Russell      2020-03-13  3341  	}
bd607166af7fe3 Kent Russell      2020-03-13  3342  =

d155bef0636e01 Arnd Bergmann     2019-07-08  3343  	if (IS_ENABLED(CONFIG_P=
ERF_EVENTS))
9c7c85f7ea1fe5 Jonathan Kim      2019-06-19  3344  		r =3D amdgpu_pmu_init(=
adev);
9c7c85f7ea1fe5 Jonathan Kim      2019-06-19  3345  	if (r)
9c7c85f7ea1fe5 Jonathan Kim      2019-06-19  3346  		dev_err(adev->dev, "am=
dgpu_pmu_init failed\n");
9c7c85f7ea1fe5 Jonathan Kim      2019-06-19  3347  =

d38ceaf99ed015 Alex Deucher      2015-04-20  3348  	return 0;
83ba126a9be318 Alex Deucher      2016-06-03  3349  =

83ba126a9be318 Alex Deucher      2016-06-03  3350  failed:
890419409a3aba Gavin Wan         2017-06-23  3351  	amdgpu_vf_error_trans_a=
ll(adev);
3840c5bcc24563 Alex Deucher      2019-10-04  3352  	if (boco)
83ba126a9be318 Alex Deucher      2016-06-03  3353  		vga_switcheroo_fini_do=
main_pm_ops(adev->dev);
8840a3878d40c9 pding             2017-10-23  3354  =

83ba126a9be318 Alex Deucher      2016-06-03 @3355  	return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  3356  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6689625108939777255==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6689625108939777255==--

