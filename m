Content-Type: multipart/mixed; boundary="===============5765029037946715940=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 2762/7920] drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3355 amdgpu_device_init() warn: 'adev->rmmio' not released on lines: 3355.
Date: Wed, 16 Sep 2020 17:56:26 +0300
Message-ID: <20200916145626.GJ18329@kadam>
In-Reply-To: <56ddb435-47b0-c069-ef72-c3c4c6e86949@amd.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5765029037946715940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 10:49:44AM -0400, Luben Tuikov wrote:
> On 2020-09-16 10:11, Dan Carpenter wrote:
> > [
> >   This is a new check that I pushed yesterday.  I've pushed some more
> >   improvements to hopefully cut down on the false positives.
> > =

> >   It finds a ton of bugs in ancient code.  The bug here is really five
> >   years old.  I don't know why it's picking this particular
> >   commit to blame.
> > =

> >   The other noteworthy for zero-day bot commit that I pushed yesterday
> >   is that I hopefully silenced the "double unlock" warnings.  Those were
> >   because CONFIG_SMP was disabled, so now the check is only enabled if
> >   CONFIG_SMP is set.
> > =

> >   - dan ]
> > =

> > tree:   https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.=
git&data=3D02%7C01%7Cluben.tuikov%40amd.com%7Cccc2dc5dde5e41ddd08f08d85a4ab=
dea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637358626896078157&sdata=
=3DdxPbGFOts1wZ8HXlTKWv5KbvjyT%2BQBtKJFCWg%2FfvO7I%3D&reserved=3D0  master
> > head:   6b02addb1d1748d21dd1261e46029b264be4e5a0
> > commit: 8aba21b75136c39c4bf63345d699d97dc477ce0e [2762/7920] drm/amdgpu=
: Embed drm_device into amdgpu_device (v3)
> > config: i386-randconfig-m021-20200916 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3355 amdgpu_device_init() wa=
rn: 'adev->rmmio' not released on lines: 3355.
> > =

> > # https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git%2F=
commit%2F%3Fid%3D8aba21b75136c39c4bf63345d699d97dc477ce0e&data=3D02%7C01%7C=
luben.tuikov%40amd.com%7Cccc2dc5dde5e41ddd08f08d85a4abdea%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637358626896078157&sdata=3DPNQQYNHAmcYNmjcJKWDR=
oc7tJmrc6ndkdCzzq5hkOq0%3D&reserved=3D0 =

> > git remote add linux-next https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2F=
next%2Flinux-next.git&data=3D02%7C01%7Cluben.tuikov%40amd.com%7Cccc2dc5dde5=
e41ddd08f08d85a4abdea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63735862=
6896088158&sdata=3DSPlOEMYnyysjERVVb5%2Fx8NBlgA1lEcnM0dIRVUTB6Jo%3D&reserve=
d=3D0 =

> > git fetch --no-tags linux-next master
> > git checkout 8aba21b75136c39c4bf63345d699d97dc477ce0e
> > vim +3355 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  2988  int amdgpu_device_in=
it(struct amdgpu_device *adev,
> > d38ceaf99ed015 Alex Deucher      2015-04-20  2989  		       uint32_t fl=
ags)
> > d38ceaf99ed015 Alex Deucher      2015-04-20  2990  {
> > 8aba21b75136c3 Luben Tuikov      2020-08-14  2991  	struct drm_device *=
ddev =3D adev_to_drm(adev);
> > 8aba21b75136c3 Luben Tuikov      2020-08-14  2992  	struct pci_dev *pde=
v =3D adev->pdev;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  2993  	int r, i;
> > 3840c5bcc24563 Alex Deucher      2019-10-04  2994  	bool boco =3D false;
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  2995  	u32 max_M=
Bps;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  2996  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  2997  	adev->shutdown =3D =
false;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  2998  	adev->flags =3D fla=
gs;
> > 4e66d7d2156243 Yong Zhao         2019-08-30  2999  =

> > 4e66d7d2156243 Yong Zhao         2019-08-30  3000  	if (amdgpu_force_as=
ic_type >=3D 0 && amdgpu_force_asic_type < CHIP_LAST)
> > 4e66d7d2156243 Yong Zhao         2019-08-30  3001  		adev->asic_type =
=3D amdgpu_force_asic_type;
> > 4e66d7d2156243 Yong Zhao         2019-08-30  3002  	else
> > 2f7d10b393c83a Jammy Zhou        2015-07-22  3003  		adev->asic_type =
=3D flags & AMD_ASIC_MASK;
> > 4e66d7d2156243 Yong Zhao         2019-08-30  3004  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3005  	adev->usec_timeout =
=3D AMDGPU_MAX_USEC_TIMEOUT;
> > 593aa2d282259e Shaoyun Liu       2018-02-07  3006  	if (amdgpu_emu_mode=
 =3D=3D 1)
> > 8bdab6bb1cf120 Yong Zhao         2020-02-25  3007  		adev->usec_timeout=
 *=3D 10;
> > 770d13b19fdf36 Christian K=C3=B6nig   2018-01-12  3008  	adev->gmc.gart=
_size =3D 512 * 1024 * 1024;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3009  	adev->accel_working=
 =3D false;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3010  	adev->num_rings =3D=
 0;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3011  	adev->mman.buffer_f=
uncs =3D NULL;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3012  	adev->mman.buffer_f=
uncs_ring =3D NULL;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3013  	adev->vm_manager.vm=
_pte_funcs =3D NULL;
> > 0c88b43032131f Nirmoy Das        2019-12-06  3014  	adev->vm_manager.vm=
_pte_num_scheds =3D 0;
> > 132f34e4b55848 Christian K=C3=B6nig   2018-01-12  3015  	adev->gmc.gmc_=
funcs =3D NULL;
> > f54d1867005c33 Chris Wilson      2016-10-25  3016  	adev->fence_context=
 =3D dma_fence_context_alloc(AMDGPU_MAX_RINGS);
> > b8866c26ec072f Andres Rodriguez  2017-04-28  3017  	bitmap_zero(adev->g=
fx.pipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3018  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3019  	adev->smc_rreg =3D =
&amdgpu_invalid_rreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3020  	adev->smc_wreg =3D =
&amdgpu_invalid_wreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3021  	adev->pcie_rreg =3D=
 &amdgpu_invalid_rreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3022  	adev->pcie_wreg =3D=
 &amdgpu_invalid_wreg;
> > 36b9a952bbf688 Huang Rui         2016-08-31  3023  	adev->pciep_rreg =
=3D &amdgpu_invalid_rreg;
> > 36b9a952bbf688 Huang Rui         2016-08-31  3024  	adev->pciep_wreg =
=3D &amdgpu_invalid_wreg;
> > 4fa1c6a679bb0d Tao Zhou          2019-07-24  3025  	adev->pcie_rreg64 =
=3D &amdgpu_invalid_rreg64;
> > 4fa1c6a679bb0d Tao Zhou          2019-07-24  3026  	adev->pcie_wreg64 =
=3D &amdgpu_invalid_wreg64;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3027  	adev->uvd_ctx_rreg =
=3D &amdgpu_invalid_rreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3028  	adev->uvd_ctx_wreg =
=3D &amdgpu_invalid_wreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3029  	adev->didt_rreg =3D=
 &amdgpu_invalid_rreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3030  	adev->didt_wreg =3D=
 &amdgpu_invalid_wreg;
> > ccdbb20a75e3e3 Rex Zhu           2016-06-08  3031  	adev->gc_cac_rreg =
=3D &amdgpu_invalid_rreg;
> > ccdbb20a75e3e3 Rex Zhu           2016-06-08  3032  	adev->gc_cac_wreg =
=3D &amdgpu_invalid_wreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3033  	adev->audio_endpt_r=
reg =3D &amdgpu_block_invalid_rreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3034  	adev->audio_endpt_w=
reg =3D &amdgpu_block_invalid_wreg;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3035  =

> > 3e39ab90833b20 Alex Deucher      2015-06-05  3036  	DRM_INFO("initializ=
ing kernel modesetting (%s 0x%04X:0x%04X 0x%04X:0x%04X 0x%02X).\n",
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3037  		 amdgpu_asic_name[=
adev->asic_type], pdev->vendor, pdev->device,
> > 3e39ab90833b20 Alex Deucher      2015-06-05  3038  		 pdev->subsystem_v=
endor, pdev->subsystem_device, pdev->revision);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3039  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3040  	/* mutex initializa=
tion are all done here so we
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3041  	 * can recall funct=
ion without having locking issues */
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3042  	atomic_set(&adev->i=
rq.ih.lock, 0);
> > 0e5ca0d1ac07ef Huang Rui         2017-03-03  3043  	mutex_init(&adev->f=
irmware.mutex);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3044  	mutex_init(&adev->p=
m.mutex);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3045  	mutex_init(&adev->g=
fx.gpu_clock_mutex);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3046  	mutex_init(&adev->s=
rbm_mutex);
> > b8866c26ec072f Andres Rodriguez  2017-04-28  3047  	mutex_init(&adev->g=
fx.pipe_reserve_mutex);
> > d23ee13fba23a3 Rex Zhu           2018-07-30  3048  	mutex_init(&adev->g=
fx.gfx_off_mutex);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3049  	mutex_init(&adev->g=
rbm_idx_mutex);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3050  	mutex_init(&adev->m=
n_lock);
> > e23b74aab5dc48 Alex Deucher      2017-09-28  3051  	mutex_init(&adev->v=
irt.vf_errors.lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3052  	hash_init(adev->mn_=
hash);
> > 53b3f8f40e6cff Dennis Li         2020-08-19  3053  	atomic_set(&adev->i=
n_gpu_reset, 0);
> > 6049db43d6dd9c Dennis Li         2020-08-20  3054  	init_rwsem(&adev->r=
eset_sem);
> > 32eaeae0ef193b Alex Deucher      2019-07-08  3055  	mutex_init(&adev->p=
sp.mutex);
> > bd052211233266 Pan, Xinhui       2020-01-16  3056  	mutex_init(&adev->n=
otifier_lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3057  =

> > 912dfc846aad77 Evan Quan         2019-04-29  3058  	r =3D amdgpu_device=
_check_arguments(adev);
> > 912dfc846aad77 Evan Quan         2019-04-29  3059  	if (r)
> > 912dfc846aad77 Evan Quan         2019-04-29  3060  		return r;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3061  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3062  	spin_lock_init(&ade=
v->mmio_idx_lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3063  	spin_lock_init(&ade=
v->smc_idx_lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3064  	spin_lock_init(&ade=
v->pcie_idx_lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3065  	spin_lock_init(&ade=
v->uvd_ctx_idx_lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3066  	spin_lock_init(&ade=
v->didt_idx_lock);
> > ccdbb20a75e3e3 Rex Zhu           2016-06-08  3067  	spin_lock_init(&ade=
v->gc_cac_idx_lock);
> > 16abb5d206499d Evan Quan         2017-07-04  3068  	spin_lock_init(&ade=
v->se_cac_idx_lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3069  	spin_lock_init(&ade=
v->audio_endpt_idx_lock);
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3070  	spin_lock=
_init(&adev->mm_stats.lock);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3071  =

> > 0c4e7fa56112b0 Chunming Zhou     2016-08-17  3072  	INIT_LIST_HEAD(&ade=
v->shadow_list);
> > 0c4e7fa56112b0 Chunming Zhou     2016-08-17  3073  	mutex_init(&adev->s=
hadow_list_lock);
> > 0c4e7fa56112b0 Chunming Zhou     2016-08-17  3074  =

> > beff74bc6e0fa9 Alex Deucher      2019-05-28  3075  	INIT_DELAYED_WORK(&=
adev->delayed_init_work,
> > beff74bc6e0fa9 Alex Deucher      2019-05-28  3076  			  amdgpu_device_d=
elayed_init_work_handler);
> > 1e317b99f0c244 Rex Zhu           2018-07-27  3077  	INIT_DELAYED_WORK(&=
adev->gfx.gfx_off_delay_work,
> > 1e317b99f0c244 Rex Zhu           2018-07-27  3078  			  amdgpu_device_d=
elay_enable_gfx_off);
> > 2dc80b00652f2a Shirish S         2017-05-25  3079  =

> > d4535e2c018bba Andrey Grodzovsky 2018-11-29  3080  	INIT_WORK(&adev->xg=
mi_reset_work, amdgpu_device_xgmi_reset_func);
> > d4535e2c018bba Andrey Grodzovsky 2018-11-29  3081  =

> > d23ee13fba23a3 Rex Zhu           2018-07-30  3082  	adev->gfx.gfx_off_r=
eq_count =3D 1;
> > b6e79d9a314ebe Jason Yan         2020-04-27  3083  	adev->pm.ac_power =
=3D power_supply_is_system_supplied() > 0;
> > b1ddf548472729 Rex Zhu           2018-06-04  3084  =

> > b265bdbd9f2811 Evan Quan         2020-05-22  3085  	atomic_set(&adev->t=
hrottling_logging_enabled, 1);
> > b265bdbd9f2811 Evan Quan         2020-05-22  3086  	/*
> > b265bdbd9f2811 Evan Quan         2020-05-22  3087  	 * If throttling co=
ntinues, logging will be performed every minute
> > b265bdbd9f2811 Evan Quan         2020-05-22  3088  	 * to avoid log flo=
oding. "-1" is subtracted since the thermal
> > b265bdbd9f2811 Evan Quan         2020-05-22  3089  	 * throttling inter=
rupt comes every second. Thus, the total logging
> > b265bdbd9f2811 Evan Quan         2020-05-22  3090  	 * interval is 59 s=
econds(retelimited printk interval) + 1(waiting
> > b265bdbd9f2811 Evan Quan         2020-05-22  3091  	 * for throttling i=
nterrupt) =3D 60 seconds.
> > b265bdbd9f2811 Evan Quan         2020-05-22  3092  	 */
> > b265bdbd9f2811 Evan Quan         2020-05-22  3093  	ratelimit_state_ini=
t(&adev->throttling_logging_rs, (60 - 1) * HZ, 1);
> > b265bdbd9f2811 Evan Quan         2020-05-22  3094  	ratelimit_set_flags=
(&adev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
> > b265bdbd9f2811 Evan Quan         2020-05-22  3095  =

> > 0fa4955838ea1e Alex Xie          2017-06-08  3096  	/* Registers mappin=
g */
> > 0fa4955838ea1e Alex Xie          2017-06-08  3097  	/* TODO: block user=
space mapping of io register */
> > da69c161448d6a Ken Wang          2016-01-21  3098  	if (adev->asic_type=
 >=3D CHIP_BONAIRE) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3099  		adev->rmmio_base =
=3D pci_resource_start(adev->pdev, 5);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3100  		adev->rmmio_size =
=3D pci_resource_len(adev->pdev, 5);
> > da69c161448d6a Ken Wang          2016-01-21  3101  	} else {
> > da69c161448d6a Ken Wang          2016-01-21  3102  		adev->rmmio_base =
=3D pci_resource_start(adev->pdev, 2);
> > da69c161448d6a Ken Wang          2016-01-21  3103  		adev->rmmio_size =
=3D pci_resource_len(adev->pdev, 2);
> > da69c161448d6a Ken Wang          2016-01-21  3104  	}
> > 5c1354bd30c118 Chunming Zhou     2016-08-30  3105  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3106  	adev->rmmio =3D ior=
emap(adev->rmmio_base, adev->rmmio_size);
> >                                                         ^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > This isn't released on error.
> > =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3107  	if (adev->rmmio =3D=
=3D NULL) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3108  		return -ENOMEM;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3109  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3110  	DRM_INFO("register =
mmio base: 0x%08X\n", (uint32_t)adev->rmmio_base);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3111  	DRM_INFO("register =
mmio size: %u\n", (unsigned)adev->rmmio_size);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3112  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3113  	/* io port mapping =
*/
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3114  	for (i =3D 0; i < D=
EVICE_COUNT_RESOURCE; i++) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3115  		if (pci_resource_f=
lags(adev->pdev, i) & IORESOURCE_IO) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3116  			adev->rio_mem_siz=
e =3D pci_resource_len(adev->pdev, i);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3117  			adev->rio_mem =3D=
 pci_iomap(adev->pdev, i, adev->rio_mem_size);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3118  			break;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3119  		}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3120  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3121  	if (adev->rio_mem =
=3D=3D NULL)
> > b64a18c502feda Amber Lin         2017-01-04  3122  		DRM_INFO("PCI I/O =
BAR is not found.\n");
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3123  =

> > b2109d8ed69765 Jack Xiao         2019-05-24  3124  	/* enable PCIE atom=
ic ops */
> > b2109d8ed69765 Jack Xiao         2019-05-24  3125  	r =3D pci_enable_at=
omic_ops_to_root(adev->pdev,
> > b2109d8ed69765 Jack Xiao         2019-05-24  3126  					  PCI_EXP_DEVCA=
P2_ATOMIC_COMP32 |
> > b2109d8ed69765 Jack Xiao         2019-05-24  3127  					  PCI_EXP_DEVCA=
P2_ATOMIC_COMP64);
> > b2109d8ed69765 Jack Xiao         2019-05-24  3128  	if (r) {
> > b2109d8ed69765 Jack Xiao         2019-05-24  3129  		adev->have_atomics=
_support =3D false;
> > b2109d8ed69765 Jack Xiao         2019-05-24  3130  		DRM_INFO("PCIE ato=
mic ops is not supported\n");
> > b2109d8ed69765 Jack Xiao         2019-05-24  3131  	} else {
> > b2109d8ed69765 Jack Xiao         2019-05-24  3132  		adev->have_atomics=
_support =3D true;
> > b2109d8ed69765 Jack Xiao         2019-05-24  3133  	}
> > b2109d8ed69765 Jack Xiao         2019-05-24  3134  =

> > 5494d8640ffc1d Alex Deucher      2018-03-09  3135  	amdgpu_device_get_p=
cie_info(adev);
> > 5494d8640ffc1d Alex Deucher      2018-03-09  3136  =

> > b239c01727459b Jack Xiao         2019-01-10  3137  	if (amdgpu_mcbp)
> > b239c01727459b Jack Xiao         2019-01-10  3138  		DRM_INFO("MCBP is =
enabled\n");
> > b239c01727459b Jack Xiao         2019-01-10  3139  =

> > 5f84cc635bce58 Jack Xiao         2019-01-25  3140  	if (amdgpu_mes && a=
dev->asic_type >=3D CHIP_NAVI10)
> > 5f84cc635bce58 Jack Xiao         2019-01-25  3141  		adev->enable_mes =
=3D true;
> > 5f84cc635bce58 Jack Xiao         2019-01-25  3142  =

> > 3aa0115d238c71 Monk Liu          2020-03-04  3143  	/* detect hw virtua=
lization here */
> > 3aa0115d238c71 Monk Liu          2020-03-04  3144  	amdgpu_detect_virtu=
alization(adev);
> > 3aa0115d238c71 Monk Liu          2020-03-04  3145  =

> > dffa11b4f74b15 Monk Liu          2020-03-04  3146  	r =3D amdgpu_device=
_get_job_timeout_settings(adev);
> > a190d1c75c73ce Xiaojie Yuan      2019-03-27  3147  	if (r) {
> > dffa11b4f74b15 Monk Liu          2020-03-04  3148  		dev_err(adev->dev,=
 "invalid lockup_timeout parameter syntax\n");
> > a190d1c75c73ce Xiaojie Yuan      2019-03-27  3149  		return r;
> > a190d1c75c73ce Xiaojie Yuan      2019-03-27  3150  	}
> > a190d1c75c73ce Xiaojie Yuan      2019-03-27  3151  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3152  	/* early init funct=
ions */
> > 06ec907054c5a4 Alex Deucher      2017-12-14  3153  	r =3D amdgpu_device=
_ip_early_init(adev);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3154  	if (r)
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3155  		return r;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3156  =

> > 6585661ddd6a0a Oak Zeng          2018-11-19  3157  	/* doorbell bar map=
ping and doorbell index init*/
> > 6585661ddd6a0a Oak Zeng          2018-11-19  3158  	amdgpu_device_doorb=
ell_init(adev);
> > 6585661ddd6a0a Oak Zeng          2018-11-19  3159  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3160  	/* if we have > 1 V=
GA cards, then disable the amdgpu VGA resources */
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3161  	/* this will fail f=
or cards that aren't VGA class devices, just
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3162  	 * ignore it */
> > 06ec907054c5a4 Alex Deucher      2017-12-14  3163  	vga_client_register=
(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3164  =

> > 31af062acfbd5d Alex Deucher      2019-10-04  3165  	if (amdgpu_device_s=
upports_boco(ddev))
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3166  		boco =3D true;
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3167  	if (amdgpu_has_atpx=
() &&
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3168  	    (amdgpu_is_atpx=
_hybrid() ||
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3169  	     amdgpu_has_atp=
x_dgpu_power_cntl()) &&
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3170  	    !pci_is_thunder=
bolt_attached(adev->pdev))
> > 84c8b22e9fe8d9 Lukas Wunner      2017-03-10  3171  		vga_switcheroo_reg=
ister_client(adev->pdev,
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3172  					       &amdgpu_=
switcheroo_ops, boco);
> > 3840c5bcc24563 Alex Deucher      2019-10-04  3173  	if (boco)
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3174  		vga_switcheroo_ini=
t_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3175  =

> > 9475a9434f594f Shaoyun Liu       2018-02-01  3176  	if (amdgpu_emu_mode=
 =3D=3D 1) {
> > 9475a9434f594f Shaoyun Liu       2018-02-01  3177  		/* post the asic o=
n emulation mode */
> > 9475a9434f594f Shaoyun Liu       2018-02-01  3178  		emu_soc_asic_init(=
adev);
> > bfca02892773d2 Shaoyun Liu       2018-02-01  3179  		goto fence_driver_=
init;
> > 9475a9434f594f Shaoyun Liu       2018-02-01  3180  	}
> > bfca02892773d2 Shaoyun Liu       2018-02-01  3181  =

> > 4e99a44e37bfed Monk Liu          2016-03-31  3182  	/* detect if we are=
 with an SRIOV vbios */
> > 4e99a44e37bfed Monk Liu          2016-03-31  3183  	amdgpu_device_detec=
t_sriov_bios(adev);
> > 048765ad5af7c8 Andres Rodriguez  2016-06-11  3184  =

> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3185  	/* check if we need=
 to reset the asic
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3186  	 *  E.g., driver wa=
s not cleanly unloaded previously, etc.
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3187  	 */
> > f14899fd2a5607 wentalou          2019-01-17  3188  	if (!amdgpu_sriov_v=
f(adev) && amdgpu_asic_need_reset_on_init(adev)) {
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3189  		r =3D amdgpu_asic_=
reset(adev);
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3190  		if (r) {
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3191  			dev_err(adev->dev=
, "asic reset on init failed\n");
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3192  			goto failed;
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3193  		}
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3194  	}
> > 95e8e59ec49f7c Alex Deucher      2018-11-01  3195  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3196  	/* Post card if nec=
essary */
> > 39c640c086ad12 Alex Deucher      2017-12-15  3197  	if (amdgpu_device_n=
eed_post(adev)) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3198  		if (!adev->bios) {
> > bec86378befae4 Monk Liu          2016-09-14  3199  			dev_err(adev->dev=
, "no vBIOS found\n");
> > 83ba126a9be318 Alex Deucher      2016-06-03  3200  			r =3D -EINVAL;
> > 83ba126a9be318 Alex Deucher      2016-06-03  3201  			goto failed;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3202  		}
> > bec86378befae4 Monk Liu          2016-09-14  3203  		DRM_INFO("GPU post=
ing now...\n");
> > 4e99a44e37bfed Monk Liu          2016-03-31  3204  		r =3D amdgpu_atom_=
asic_init(adev->mode_info.atom_context);
> > 4e99a44e37bfed Monk Liu          2016-03-31  3205  		if (r) {
> > 4e99a44e37bfed Monk Liu          2016-03-31  3206  			dev_err(adev->dev=
, "gpu post error!\n");
> > 4e99a44e37bfed Monk Liu          2016-03-31  3207  			goto failed;
> > 4e99a44e37bfed Monk Liu          2016-03-31  3208  		}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3209  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3210  =

> > 88b64e9536746e Alex Deucher      2017-07-10  3211  	if (adev->is_atom_f=
w) {
> > 88b64e9536746e Alex Deucher      2017-07-10  3212  		/* Initialize cloc=
ks */
> > 88b64e9536746e Alex Deucher      2017-07-10  3213  		r =3D amdgpu_atomf=
irmware_get_clock_info(adev);
> > 88b64e9536746e Alex Deucher      2017-07-10  3214  		if (r) {
> > 88b64e9536746e Alex Deucher      2017-07-10  3215  			dev_err(adev->dev=
, "amdgpu_atomfirmware_get_clock_info failed\n");
> > e23b74aab5dc48 Alex Deucher      2017-09-28  3216  			amdgpu_vf_error_p=
ut(adev, AMDGIM_ERROR_VF_ATOMBIOS_GET_CLOCK_FAIL, 0, 0);
> > 88b64e9536746e Alex Deucher      2017-07-10  3217  			goto failed;
> > 88b64e9536746e Alex Deucher      2017-07-10  3218  		}
> > 88b64e9536746e Alex Deucher      2017-07-10  3219  	} else {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3220  		/* Initialize cloc=
ks */
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3221  		r =3D amdgpu_atomb=
ios_get_clock_info(adev);
> > 2c1a2784039442 Alex Deucher      2015-12-07  3222  		if (r) {
> > 2c1a2784039442 Alex Deucher      2015-12-07  3223  			dev_err(adev->dev=
, "amdgpu_atombios_get_clock_info failed\n");
> > e23b74aab5dc48 Alex Deucher      2017-09-28  3224  			amdgpu_vf_error_p=
ut(adev, AMDGIM_ERROR_VF_ATOMBIOS_GET_CLOCK_FAIL, 0, 0);
> > 890419409a3aba Gavin Wan         2017-06-23  3225  			goto failed;
> > 2c1a2784039442 Alex Deucher      2015-12-07  3226  		}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3227  		/* init i2c buses =
*/
> > 4562236b3bc0a2 Harry Wentland    2017-09-12  3228  		if (!amdgpu_device=
_has_dc_support(adev))
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3229  			amdgpu_atombios_i=
2c_init(adev);
> > a5bde2f964fa06 Alex Deucher      2016-09-23  3230  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3231  =

> > bfca02892773d2 Shaoyun Liu       2018-02-01  3232  fence_driver_init:
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3233  	/* Fence driver */
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3234  	r =3D amdgpu_fence_=
driver_init(adev);
> > 2c1a2784039442 Alex Deucher      2015-12-07  3235  	if (r) {
> > 2c1a2784039442 Alex Deucher      2015-12-07  3236  		dev_err(adev->dev,=
 "amdgpu_fence_driver_init failed\n");
> > e23b74aab5dc48 Alex Deucher      2017-09-28  3237  		amdgpu_vf_error_pu=
t(adev, AMDGIM_ERROR_VF_FENCE_INIT_FAIL, 0, 0);
> > 83ba126a9be318 Alex Deucher      2016-06-03  3238  		goto failed;
> > 2c1a2784039442 Alex Deucher      2015-12-07  3239  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3240  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3241  	/* init the mode co=
nfig */
> > 4a580877bdcb83 Luben Tuikov      2020-08-24  3242  	drm_mode_config_ini=
t(adev_to_drm(adev));
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3243  =

> > 06ec907054c5a4 Alex Deucher      2017-12-14  3244  	r =3D amdgpu_device=
_ip_init(adev);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3245  	if (r) {
> > 8840a3878d40c9 pding             2017-10-23  3246  		/* failed in exclu=
sive mode due to timeout */
> > 8840a3878d40c9 pding             2017-10-23  3247  		if (amdgpu_sriov_v=
f(adev) &&
> > 8840a3878d40c9 pding             2017-10-23  3248  		    !amdgpu_sriov_=
runtime(adev) &&
> > 8840a3878d40c9 pding             2017-10-23  3249  		    amdgpu_virt_mm=
io_blocked(adev) &&
> > 8840a3878d40c9 pding             2017-10-23  3250  		    !amdgpu_virt_w=
ait_reset(adev)) {
> > 8840a3878d40c9 pding             2017-10-23  3251  			dev_err(adev->dev=
, "VF exclusive mode timeout\n");
> > 1daee8b472e896 Pixel Ding        2017-11-08  3252  			/* Don't send req=
uest since VF is inactive. */
> > 1daee8b472e896 Pixel Ding        2017-11-08  3253  			adev->virt.caps &=
=3D ~AMDGPU_SRIOV_CAPS_RUNTIME;
> > 1daee8b472e896 Pixel Ding        2017-11-08  3254  			adev->virt.ops =
=3D NULL;
> > 8840a3878d40c9 pding             2017-10-23  3255  			r =3D -EAGAIN;
> > 8840a3878d40c9 pding             2017-10-23  3256  			goto failed;
> > 8840a3878d40c9 pding             2017-10-23  3257  		}
> > 06ec907054c5a4 Alex Deucher      2017-12-14  3258  		dev_err(adev->dev,=
 "amdgpu_device_ip_init failed\n");
> > e23b74aab5dc48 Alex Deucher      2017-09-28  3259  		amdgpu_vf_error_pu=
t(adev, AMDGIM_ERROR_VF_AMDGPU_INIT_FAIL, 0, 0);
> > 83ba126a9be318 Alex Deucher      2016-06-03  3260  		goto failed;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3261  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3262  =

> > d69b8971e540ae Yong Zhao         2020-04-17  3263  	dev_info(adev->dev,
> > d69b8971e540ae Yong Zhao         2020-04-17  3264  		"SE %d, SH per SE =
%d, CU per SH %d, active_cu_number %d\n",
> > d7f72fe482bfb7 Yong Zhao         2019-12-11  3265  			adev->gfx.config.=
max_shader_engines,
> > d7f72fe482bfb7 Yong Zhao         2019-12-11  3266  			adev->gfx.config.=
max_sh_per_se,
> > d7f72fe482bfb7 Yong Zhao         2019-12-11  3267  			adev->gfx.config.=
max_cu_per_sh,
> > d7f72fe482bfb7 Yong Zhao         2019-12-11  3268  			adev->gfx.cu_info=
.number);
> > d7f72fe482bfb7 Yong Zhao         2019-12-11  3269  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3270  	adev->accel_working=
 =3D true;
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3271  =

> > e59c020598666f Alex Xie          2017-06-01  3272  	amdgpu_vm_check_com=
pute_bug(adev);
> > e59c020598666f Alex Xie          2017-06-01  3273  =

> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3274  	/* Initia=
lize the buffer migration limit. */
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3275  	if (amdgp=
u_moverate >=3D 0)
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3276  		max_MBps=
 =3D amdgpu_moverate;
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3277  	else
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3278  		max_MBps=
 =3D 8; /* Allow 8 MB/s. */
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3279  	/* Get a =
log2 for easy divisions. */
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3280  	adev->mm_=
stats.log2_max_MBps =3D ilog2(max(1u, max_MBps));
> > 95844d20ae024b Marek Ol=C5=A1=C3=A1k       2016-08-17  3281  =

> > 9bc92b9c8d0919 Monk Liu          2017-02-08  3282  	amdgpu_fbdev_init(a=
dev);
> > 9bc92b9c8d0919 Monk Liu          2017-02-08  3283  =

> > d2f52ac800fec2 Rex Zhu           2017-09-22  3284  	r =3D amdgpu_pm_sys=
fs_init(adev);
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3285  	if (r) {
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3286  		adev->pm_sysfs_en =
=3D false;
> > d2f52ac800fec2 Rex Zhu           2017-09-22  3287  		DRM_ERROR("registe=
ring pm debugfs failed (%d).\n", r);
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3288  	} else
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3289  		adev->pm_sysfs_en =
=3D true;
> > d2f52ac800fec2 Rex Zhu           2017-09-22  3290  =

> > 5bb23532732384 Ori Messinger     2019-04-22  3291  	r =3D amdgpu_ucode_=
sysfs_init(adev);
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3292  	if (r) {
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3293  		adev->ucode_sysfs_=
en =3D false;
> > 5bb23532732384 Ori Messinger     2019-04-22  3294  		DRM_ERROR("Creatin=
g firmware sysfs failed (%d).\n", r);
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3295  	} else
> > 7c868b592d5c2c Yintian Tao       2019-11-29  3296  		adev->ucode_sysfs_=
en =3D true;
> > 5bb23532732384 Ori Messinger     2019-04-22  3297  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3298  	if ((amdgpu_testing=
 & 1)) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3299  		if (adev->accel_wo=
rking)
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3300  			amdgpu_test_moves=
(adev);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3301  		else
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3302  			DRM_INFO("amdgpu:=
 acceleration disabled, skipping move tests\n");
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3303  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3304  	if (amdgpu_benchmar=
king) {
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3305  		if (adev->accel_wo=
rking)
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3306  			amdgpu_benchmark(=
adev, amdgpu_benchmarking);
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3307  		else
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3308  			DRM_INFO("amdgpu:=
 acceleration disabled, skipping benchmarks\n");
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3309  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3310  =

> > b0adca4d50169d Evan Quan         2019-11-05  3311  	/*
> > b0adca4d50169d Evan Quan         2019-11-05  3312  	 * Register gpu ins=
tance before amdgpu_device_enable_mgpu_fan_boost.
> > b0adca4d50169d Evan Quan         2019-11-05  3313  	 * Otherwise the mg=
pu fan boost feature will be skipped due to the
> > b0adca4d50169d Evan Quan         2019-11-05  3314  	 * gpu instance is =
counted less.
> > b0adca4d50169d Evan Quan         2019-11-05  3315  	 */
> > b0adca4d50169d Evan Quan         2019-11-05  3316  	amdgpu_register_gpu=
_instance(adev);
> > b0adca4d50169d Evan Quan         2019-11-05  3317  =

> > d38ceaf99ed015 Alex Deucher      2015-04-20  3318  	/* enable clockgati=
ng, etc. after ib tests, etc. since some blocks require
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3319  	 * explicit gating =
rather than handling it automatically.
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3320  	 */
> > 06ec907054c5a4 Alex Deucher      2017-12-14  3321  	r =3D amdgpu_device=
_ip_late_init(adev);
> > 2c1a2784039442 Alex Deucher      2015-12-07  3322  	if (r) {
> > 06ec907054c5a4 Alex Deucher      2017-12-14  3323  		dev_err(adev->dev,=
 "amdgpu_device_ip_late_init failed\n");
> > e23b74aab5dc48 Alex Deucher      2017-09-28  3324  		amdgpu_vf_error_pu=
t(adev, AMDGIM_ERROR_VF_AMDGPU_LATE_INIT_FAIL, 0, r);
> > 83ba126a9be318 Alex Deucher      2016-06-03  3325  		goto failed;
> > 2c1a2784039442 Alex Deucher      2015-12-07  3326  	}
> > d38ceaf99ed015 Alex Deucher      2015-04-20  3327  =

> > 108c6a6309c96a xinhui pan        2019-03-11  3328  	/* must succeed. */
> > 511fdbc33aaa47 xinhui pan        2019-05-09  3329  	amdgpu_ras_resume(a=
dev);
> > 108c6a6309c96a xinhui pan        2019-03-11  3330  =

> > beff74bc6e0fa9 Alex Deucher      2019-05-28  3331  	queue_delayed_work(=
system_wq, &adev->delayed_init_work,
> > beff74bc6e0fa9 Alex Deucher      2019-05-28  3332  			   msecs_to_jiffi=
es(AMDGPU_RESUME_MS));
> > beff74bc6e0fa9 Alex Deucher      2019-05-28  3333  =

> > 2c738637bac1aa Monk Liu          2020-06-29  3334  	if (amdgpu_sriov_vf=
(adev))
> > 2c738637bac1aa Monk Liu          2020-06-29  3335  		flush_delayed_work=
(&adev->delayed_init_work);
> > 2c738637bac1aa Monk Liu          2020-06-29  3336  =

> > 77f3a5cd7023d9 Nirmoy Das        2020-05-07  3337  	r =3D sysfs_create_=
files(&adev->dev->kobj, amdgpu_dev_attributes);
> > bd607166af7fe3 Kent Russell      2020-03-13  3338  	if (r) {
> > 77f3a5cd7023d9 Nirmoy Das        2020-05-07  3339  		dev_err(adev->dev,=
 "Could not create amdgpu device attr\n");
> > bd607166af7fe3 Kent Russell      2020-03-13  3340  		return r;
> >                                                                 ^^^^^^^^
> > This should probably be "goto failed;"?
> =

> I'm not sure if we want to fail here because we couldn't create sysfs fil=
es.
> If we can enable display anyway, all is good?


In that case, then print an error and continue instead of returning
an error code.

regards,
dan carpenter

--===============5765029037946715940==--

