Content-Type: multipart/mixed; boundary="===============4532567404087943419=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10029/11953] drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:210 amdgpu_ctx_init_entity() warn: missing error code 'r'
Date: Fri, 11 Mar 2022 13:49:25 +0800
Message-ID: <202203111333.Mnna3DNH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4532567404087943419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: d18b8eadd83e3d8d63a45f9479478640dbcfca02 [10029/11953] drm/amdgpu: =
install ctx entities with cmpxchg
:::::: branch date: 21 hours ago
:::::: commit date: 7 days ago
config: parisc-randconfig-m031-20220310 (https://download.01.org/0day-ci/ar=
chive/20220311/202203111333.Mnna3DNH-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:210 amdgpu_ctx_init_entity() warn: =
missing error code 'r'

vim +/r +210 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c

1c6d567bdf73a2 Nirmoy Das          2020-04-01  164  =

84d588c3de84d0 Nirmoy Das          2021-08-24  165  =

1c6d567bdf73a2 Nirmoy Das          2020-04-01  166  static int amdgpu_ctx_i=
nit_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
1c6d567bdf73a2 Nirmoy Das          2020-04-01  167  				  const u32 ring)
d38ceaf99ed015 Alex Deucher        2015-04-20  168  {
977f7e1068be60 Nirmoy Das          2020-01-21  169  	struct amdgpu_device *=
adev =3D ctx->adev;
977f7e1068be60 Nirmoy Das          2020-01-21  170  	struct amdgpu_ctx_enti=
ty *entity;
977f7e1068be60 Nirmoy Das          2020-01-21  171  	struct drm_gpu_schedul=
er **scheds =3D NULL, *sched =3D NULL;
977f7e1068be60 Nirmoy Das          2020-01-21  172  	unsigned num_scheds =
=3D 0;
84d588c3de84d0 Nirmoy Das          2021-08-24  173  	int32_t ctx_prio;
1c6d567bdf73a2 Nirmoy Das          2020-04-01  174  	unsigned int hw_prio;
84d588c3de84d0 Nirmoy Das          2021-08-24  175  	enum drm_sched_priorit=
y drm_prio;
47f38501f11fa4 Christian K=C3=B6nig     2015-08-04  176  	int r;
d38ceaf99ed015 Alex Deucher        2015-04-20  177  =

201a4eb9dc960b Gustavo A. R. Silva 2020-10-08  178  	entity =3D kzalloc(str=
uct_size(entity, fences, amdgpu_sched_jobs),
1b1f2fecb699bb Christian K=C3=B6nig     2018-08-01  179  			 GFP_KERNEL);
977f7e1068be60 Nirmoy Das          2020-01-21  180  	if (!entity)
63e3ab9a8226c0 Nirmoy Das          2020-01-21  181  		return  -ENOMEM;
63e3ab9a8226c0 Nirmoy Das          2020-01-21  182  =

84d588c3de84d0 Nirmoy Das          2021-08-24  183  	ctx_prio =3D (ctx->ove=
rride_priority =3D=3D AMDGPU_CTX_PRIORITY_UNSET) ?
977f7e1068be60 Nirmoy Das          2020-01-21  184  			ctx->init_priority :=
 ctx->override_priority;
84d588c3de84d0 Nirmoy Das          2021-08-24  185  	entity->sequence =3D 1;
84d588c3de84d0 Nirmoy Das          2021-08-24  186  	hw_prio =3D amdgpu_ctx=
_get_hw_prio(ctx, hw_ip);
84d588c3de84d0 Nirmoy Das          2021-08-24  187  	drm_prio =3D amdgpu_ct=
x_to_drm_sched_prio(ctx_prio);
1c6d567bdf73a2 Nirmoy Das          2020-04-01  188  =

1c6d567bdf73a2 Nirmoy Das          2020-04-01  189  	hw_ip =3D array_index_=
nospec(hw_ip, AMDGPU_HW_IP_NUM);
1c6d567bdf73a2 Nirmoy Das          2020-04-01  190  	scheds =3D adev->gpu_s=
ched[hw_ip][hw_prio].sched;
1c6d567bdf73a2 Nirmoy Das          2020-04-01  191  	num_scheds =3D adev->g=
pu_sched[hw_ip][hw_prio].num_scheds;
1c6d567bdf73a2 Nirmoy Das          2020-04-01  192  =

bc21585f3ff050 Nirmoy Das          2020-08-29  193  	/* disable load balanc=
e if the hw engine retains context among dependent jobs */
bc21585f3ff050 Nirmoy Das          2020-08-29  194  	if (hw_ip =3D=3D AMDGP=
U_HW_IP_VCN_ENC ||
bc21585f3ff050 Nirmoy Das          2020-08-29  195  	    hw_ip =3D=3D AMDGP=
U_HW_IP_VCN_DEC ||
bc21585f3ff050 Nirmoy Das          2020-08-29  196  	    hw_ip =3D=3D AMDGP=
U_HW_IP_UVD_ENC ||
bc21585f3ff050 Nirmoy Das          2020-08-29  197  	    hw_ip =3D=3D AMDGP=
U_HW_IP_UVD) {
1c6d567bdf73a2 Nirmoy Das          2020-04-01  198  		sched =3D drm_sched_p=
ick_best(scheds, num_scheds);
4ff7d8ba4c80b8 Nirmoy Das          2020-03-13  199  		scheds =3D &sched;
4ff7d8ba4c80b8 Nirmoy Das          2020-03-13  200  		num_scheds =3D 1;
845e6fdf3b52ae Christian K=C3=B6nig     2018-07-13  201  	}
845e6fdf3b52ae Christian K=C3=B6nig     2018-07-13  202  =

84d588c3de84d0 Nirmoy Das          2021-08-24  203  	r =3D drm_sched_entity=
_init(&entity->entity, drm_prio, scheds, num_scheds,
977f7e1068be60 Nirmoy Das          2020-01-21  204  				  &ctx->guilty);
47f38501f11fa4 Christian K=C3=B6nig     2015-08-04  205  	if (r)
977f7e1068be60 Nirmoy Das          2020-01-21  206  		goto error_free_entit=
y;
9cb7e5a91f6cd4 Chunming Zhou       2015-07-21  207  =

d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23  208  	/* It's not an er=
ror if we fail to install the new entity */
d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23  209  	if (cmpxchg(&ctx-=
>entities[hw_ip][ring], NULL, entity))
d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23 @210  		goto cleanup_ent=
ity;
d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23  211  =

8ed8147abc7cf1 Huang Rui           2016-10-26  212  	return 0;
8ed8147abc7cf1 Huang Rui           2016-10-26  213  =

d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23  214  cleanup_entity:
d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23  215  	drm_sched_entity_=
fini(&entity->entity);
d18b8eadd83e3d Christian K=C3=B6nig     2022-02-23  216  =

977f7e1068be60 Nirmoy Das          2020-01-21  217  error_free_entity:
977f7e1068be60 Nirmoy Das          2020-01-21  218  	kfree(entity);
1b1f2fecb699bb Christian K=C3=B6nig     2018-08-01  219  =

977f7e1068be60 Nirmoy Das          2020-01-21  220  	return r;
63e3ab9a8226c0 Nirmoy Das          2020-01-21  221  }
63e3ab9a8226c0 Nirmoy Das          2020-01-21  222  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4532567404087943419==--

