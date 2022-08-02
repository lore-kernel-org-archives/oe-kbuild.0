Content-Type: multipart/mixed; boundary="===============7364028462578812460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/torture.c:491 torture_shuffle_task_register() warn: possible memory leak of 'stp'
Date: Tue, 02 Aug 2022 12:06:39 +0800
Message-ID: <202208021257.o4aL7bR3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7364028462578812460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9de1f9c8ca5100a02a2e271bdbde36202e251b4b
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-m031-20220801 (https://download.01.org/0day-ci/a=
rchive/20220802/202208021257.o4aL7bR3-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
kernel/torture.c:491 torture_shuffle_task_register() warn: possible memory =
leak of 'stp'
drivers/gpu/drm/drm_modeset_lock.c:103 drm_modeset_lock_all() warn: possibl=
e memory leak of 'ctx'
drivers/gpu/drm/drm_writeback.c:385 drm_writeback_signal_completion() error=
: we previously assumed 'job' could be null (see line 377)
drivers/gpu/drm/drm_atomic_uapi.c:196 drm_atomic_set_crtc_for_plane() warn:=
 passing zero to 'PTR_ERR'
net/mac80211/key.c:464 ieee80211_key_replace() error: we previously assumed=
 'new' could be null (see line 446)
lib/test_rhashtable.c:544 test_insert_dup() warn: possible memory leak of '=
rhlt'
kernel/sched/topology.c:1338 asym_cpu_capacity_update_data() warn: possible=
 memory leak of 'entry'
drivers/gpu/drm/nouveau/nouveau_connector.c:260 nouveau_conn_reset() error:=
 uninitialized symbol 'asyc'.
drivers/gpu/drm/nouveau/dispnv50/head.c:483 nv50_head_reset() error: uninit=
ialized symbol 'asyh'.
drivers/gpu/drm/nouveau/dispnv50/wndw.c:632 nv50_wndw_reset() error: uninit=
ialized symbol 'asyw'.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5926 dm_crtc_re=
set_state() warn: possible memory leak of 'state'

Old smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/wndw.c:633 nv50_wndw_reset() error: we pre=
viously assumed 'plane->state' could be null (see line 629)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1349 amdgpu_dm_=
fini() warn: variable dereferenced before check 'adev->dm.dc' (see line 133=
6)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5878 create_str=
eam_for_sink() error: we previously assumed 'aconnector->dc_sink' could be =
null (see line 5776)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8182 handle_cur=
sor_update() error: we previously assumed 'afb' could be null (see line 814=
1)

vim +/stp +491 kernel/torture.c

3808dc9fab0591 Paul E. McKenney 2014-01-28  478  =

3808dc9fab0591 Paul E. McKenney 2014-01-28  479  /*
3808dc9fab0591 Paul E. McKenney 2014-01-28  480   * Register a task to be s=
huffled.  If there is no memory, just splat
3808dc9fab0591 Paul E. McKenney 2014-01-28  481   * and don't bother regist=
ering.
3808dc9fab0591 Paul E. McKenney 2014-01-28  482   */
3808dc9fab0591 Paul E. McKenney 2014-01-28  483  void torture_shuffle_task_=
register(struct task_struct *tp)
3808dc9fab0591 Paul E. McKenney 2014-01-28  484  {
3808dc9fab0591 Paul E. McKenney 2014-01-28  485  	struct shuffle_task *stp;
3808dc9fab0591 Paul E. McKenney 2014-01-28  486  =

3808dc9fab0591 Paul E. McKenney 2014-01-28  487  	if (WARN_ON_ONCE(tp =3D=
=3D NULL))
3808dc9fab0591 Paul E. McKenney 2014-01-28  488  		return;
3808dc9fab0591 Paul E. McKenney 2014-01-28  489  	stp =3D kmalloc(sizeof(*s=
tp), GFP_KERNEL);
3808dc9fab0591 Paul E. McKenney 2014-01-28  490  	if (WARN_ON_ONCE(stp =3D=
=3D NULL))
3808dc9fab0591 Paul E. McKenney 2014-01-28 @491  		return;
3808dc9fab0591 Paul E. McKenney 2014-01-28  492  	stp->st_t =3D tp;
3808dc9fab0591 Paul E. McKenney 2014-01-28  493  	mutex_lock(&shuffle_task_=
mutex);
3808dc9fab0591 Paul E. McKenney 2014-01-28  494  	list_add(&stp->st_l, &shu=
ffle_task_list);
3808dc9fab0591 Paul E. McKenney 2014-01-28  495  	mutex_unlock(&shuffle_tas=
k_mutex);
3808dc9fab0591 Paul E. McKenney 2014-01-28  496  }
3808dc9fab0591 Paul E. McKenney 2014-01-28  497  EXPORT_SYMBOL_GPL(torture_=
shuffle_task_register);
3808dc9fab0591 Paul E. McKenney 2014-01-28  498  =


:::::: The code at line 491 was first introduced by commit
:::::: 3808dc9fab05913060626d7f0edd0f195cb9dcab rcutorture: Abstract tortur=
e_shuffle()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7364028462578812460==--

