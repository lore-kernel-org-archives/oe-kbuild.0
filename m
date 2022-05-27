Content-Type: multipart/mixed; boundary="===============8030618171978092623=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: warning: Value stored to 'pf_q' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 27 May 2022 12:31:07 +0800
Message-ID: <202205271213.1X7QjLjM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8030618171978092623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7f50d4dfe816dd916a7cbf39039674825c2b388b
commit: 65662a8dcdd01342b71ee44234bcfd0162e195af i40e: Fix logic of disabli=
ng queues
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220522 (https://download.01.org/0day-ci/archi=
ve/20220527/202205271213.1X7QjLjM-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443db=
aba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D65662a8dcdd01342b71ee44234bcfd0162e195af
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 65662a8dcdd01342b71ee44234bcfd0162e195af
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/cisco/enic/vnic_dev.c:1215:2: note: Taking false br=
anch
           if (cmd =3D=3D CLSF_ADD) {
           ^
   drivers/net/ethernet/cisco/enic/vnic_dev.c:1244:13: note: Assuming 'cmd'=
 is equal to CLSF_DEL
           } else if (cmd =3D=3D CLSF_DEL) {
                      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/cisco/enic/vnic_dev.c:1244:9: note: Taking true bra=
nch
           } else if (cmd =3D=3D CLSF_DEL) {
                  ^
   drivers/net/ethernet/cisco/enic/vnic_dev.c:1246:9: note: Calling 'vnic_d=
ev_cmd'
                   ret =3D vnic_dev_cmd(vdev, CMD_DEL_FILTER, &a0, &a1, wai=
t);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cisco/enic/vnic_dev.c:522:2: note: Control jumps to=
 'case PROXY_NONE:'  at line 529
           switch (vdev->proxy) {
           ^
   drivers/net/ethernet/cisco/enic/vnic_dev.c:531:10: note: Calling 'vnic_d=
ev_cmd_no_proxy'
                   return vnic_dev_cmd_no_proxy(vdev, cmd, a0, a1, wait);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cisco/enic/vnic_dev.c:495:16: note: Assigned value =
is garbage or undefined
           vdev->args[1] =3D *a1;
                         ^ ~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: warning: Value store=
d to 'pf_q' is never read [clang-analyzer-deadcode.DeadStores]
           pf_q =3D vsi->base_queue;
           ^      ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:4643:2: note: Value stored t=
o 'pf_q' is never read
           pf_q =3D vsi->base_queue;
           ^      ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:7949:3: warning: Value store=
d to 'need_reset' is never read [clang-analyzer-deadcode.DeadStores]
                   need_reset =3D false;
                   ^            ~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:7949:3: note: Value stored t=
o 'need_reset' is never read
                   need_reset =3D false;
                   ^            ~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9179:6: warning: Value store=
d to 'queue' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 queue =3D le32_to_cpu(data->prtdcb_rupto);
               ^~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9179:6: note: Value stored t=
o 'queue' during its initialization is never read
           u32 queue =3D le32_to_cpu(data->prtdcb_rupto);
               ^~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9828:4: warning: Value store=
d to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D i40e_vc_process_vf_msg(pf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:9828:4: note: Value stored t=
o 'ret' is never read
                           ret =3D i40e_vc_process_vf_msg(pf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:10707:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D i40e_setup_misc_vector(pf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:10707:3: note: Value stored =
to 'ret' is never read
                   ret =3D i40e_setup_misc_vector(pf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:14131:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D i40e_vsi_config_rss(vsi);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_main.c:14131:3: note: Value stored =
to 'ret' is never read
                   ret =3D i40e_vsi_config_rss(vsi);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:49:39: warning: Dereferenc=
e of null pointer [clang-analyzer-core.NullDereference]
                           const struct nvkm_vmm_desc *pair =3D page[-1].de=
sc;
                                                              ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1145:8: note: Assuming  is=
 non-null
           if (!(*pvmm =3D kzalloc(sizeof(**pvmm), GFP_KERNEL)))
                 ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1145:2: note: Taking false=
 branch
           if (!(*pvmm =3D kzalloc(sizeof(**pvmm), GFP_KERNEL)))
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1147:9: note: Calling 'nvk=
m_vmm_ctor'
           return nvkm_vmm_ctor(func, mmu, hdr, managed, addr, size, key, n=
ame, *pvmm);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1051:43: note: Assuming 'k=
ey' is null
           __mutex_init(&vmm->mutex, "&vmm->mutex", key ? key : &_key);
                                                    ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1051:43: note: '?' conditi=
on is false
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1056:2: note: Loop conditi=
on is false. Execution continues on line 1063
           while (page[1].shift)
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1063:2: note: Loop conditi=
on is false. Execution continues on line 1065
           for (levels =3D 0, desc =3D page->desc; desc->bits; desc++, leve=
ls++)
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1068:6: note: Taking false=
 branch
           if (WARN_ON(levels > NVKM_VMM_LEVELS_MAX))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1068:2: note: Taking false=
 branch
           if (WARN_ON(levels > NVKM_VMM_LEVELS_MAX))
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1072:41: note: Passing nul=
l pointer value via 3rd parameter 'page'
           vmm->pd =3D nvkm_vmm_pt_new(desc, false, NULL);
                                                  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1072:12: note: Calling 'nv=
km_vmm_pt_new'
           vmm->pd =3D nvkm_vmm_pt_new(desc, false, NULL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:47:6: note: Assuming field=
 'type' is > PGT
           if (desc->type > PGT) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:47:2: note: Taking true br=
anch
           if (desc->type > PGT) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:48:7: note: Assuming field=
 'type' is equal to SPT
                   if (desc->type =3D=3D SPT) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:48:3: note: Taking true br=
anch
                   if (desc->type =3D=3D SPT) {
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:49:39: note: Dereference o=
f null pointer
                           const struct nvkm_vmm_desc *pair =3D page[-1].de=
sc;
                                                              ^~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:535:3: warning: Assigned v=
alue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   const u32 ptei =3D it.pte[0];
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1869:6: note: Assuming 're=
t' is not equal to 0
           if (ret)
               ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1869:2: note: Taking true =
branch

vim +/pf_q +4643 drivers/net/ethernet/intel/i40e/i40e_main.c

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4616  =

3aa7b74dbeedfb Filip Sadowski       2016-10-11  4617  /**
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4618   * i40e_vsi_stop_ring=
s - Stop a VSI's rings
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4619   * @vsi: the VSI bein=
g configured
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4620   **/
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4621  void i40e_vsi_stop_ri=
ngs(struct i40e_vsi *vsi)
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4622  {
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4623  	struct i40e_pf *pf =
=3D vsi->back;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4624  	int pf_q, err, q_end;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4625  =

3480756f2cb93c Jacob Keller         2017-04-13  4626  	/* When port TX is s=
uspended, don't wait */
0da36b9774cc24 Jacob Keller         2017-04-19  4627  	if (test_bit(__I40E_=
PORT_SUSPENDED, vsi->back->state))
3480756f2cb93c Jacob Keller         2017-04-13  4628  		return i40e_vsi_sto=
p_rings_no_wait(vsi);
3480756f2cb93c Jacob Keller         2017-04-13  4629  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4630  	q_end =3D vsi->base_=
queue + vsi->num_queue_pairs;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4631  	for (pf_q =3D vsi->b=
ase_queue; pf_q < q_end; pf_q++)
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4632  		i40e_pre_tx_queue_c=
fg(&pf->hw, (u32)pf_q, false);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4633  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4634  	for (pf_q =3D vsi->b=
ase_queue; pf_q < q_end; pf_q++) {
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4635  		err =3D i40e_contro=
l_wait_rx_q(pf, pf_q, false);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4636  		if (err)
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4637  			dev_info(&pf->pdev=
->dev,
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4638  				 "VSI seid %d Rx =
ring %d dissable timeout\n",
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4639  				 vsi->seid, pf_q);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4640  	}
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4641  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4642  	msleep(I40E_DISABLE_=
TX_GAP_MSEC);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29 @4643  	pf_q =3D vsi->base_q=
ueue;
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4644  	for (pf_q =3D vsi->b=
ase_queue; pf_q < q_end; pf_q++)
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4645  		wr32(&pf->hw, I40E_=
QTX_ENA(pf_q), 0);
65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4646  =

65662a8dcdd013 Arkadiusz Kubalewski 2021-04-29  4647  	i40e_vsi_wait_queues=
_disabled(vsi);
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4648  }
3aa7b74dbeedfb Filip Sadowski       2016-10-11  4649  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8030618171978092623==--

