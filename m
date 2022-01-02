Content-Type: multipart/mixed; boundary="===============7842629173621324856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] drm/msm/disp: Export helper for capturing snapshot
Date: Sun, 02 Jan 2022 11:52:35 +0800
Message-ID: <202201021118.lGfjzGvg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7842629173621324856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211215174524.1742389-3-robdclark@gmail.com>
References: <20211215174524.1742389-3-robdclark@gmail.com>
TO: Rob Clark <robdclark@gmail.com>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-exynos/exynos-drm-=
next tegra-drm/drm/tegra/for-next v5.16-rc7 next-20211224]
[cannot apply to drm-tip/drm-tip airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rob-Clark/drm-msm-Add-disp=
lay-snapshot-debugfs/20211216-015056
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20211226 (https://download.01.org/0day-ci/arc=
hive/20220102/202201021118.lGfjzGvg-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7e30a7c90ba728e8c7b3a7090=
75553d4f1243600
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rob-Clark/drm-msm-Add-display-snap=
shot-debugfs/20211216-015056
        git checkout 7e30a7c90ba728e8c7b3a709075553d4f1243600
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   security/keys/request_key.c:119:21: warning: Value stored to 'cred' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct cred *cred =3D current_cred();
                              ^~~~
   security/keys/request_key.c:119:21: note: Value stored to 'cred' during =
its initialization is never read
           const struct cred *cred =3D current_cred();
                              ^~~~
   security/keys/request_key.c:510:3: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   security/keys/request_key.c:510:3: note: Value stored to 'ret' is never =
read
                   ret =3D 0;
                   ^     ~
   Suppressed 8 warnings (8 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/msm/disp/msm_disp_snapshot.c:56:21: warning: Value store=
d to 'drm_dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct drm_device *drm_dev =3D kms->dev;
                              ^~~~~~~   ~~~~~~~~
   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c:56:21: note: Value stored t=
o 'drm_dev' during its initialization is never read
           struct drm_device *drm_dev =3D kms->dev;
                              ^~~~~~~   ~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:68:5: warning: Array a=
ccess (from variable 'dump_addr') results in a null pointer dereference [cl=
ang-analyzer-core.NullDereference]
                                   dump_addr[i * 4], dump_addr[i * 4 + 1],
                                   ^
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:78:6: note: Assuming '=
p' is non-null
           if (!p) {
               ^~
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:78:2: note: Taking fal=
se branch
           if (!p) {
           ^
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:90:2: note: Loop condi=
tion is true.  Entering loop body
           list_for_each_entry_safe(block, tmp, &state->blocks, node) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:92:3: note: Calling 'm=
sm_disp_state_print_regs'
                   msm_disp_state_print_regs(&block->state, block->size, bl=
ock->base_addr, p);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:55:2: note: 'dump_addr=
' initialized to a null pointer value
           u32 *dump_addr =3D NULL;
           ^~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:62:6: note: Assuming t=
he condition is false
           if (*reg)
               ^~~~
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:62:2: note: Taking fal=
se branch
           if (*reg)
           ^
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:65:14: note: Assuming =
'i' is < 'num_rows'
           for (i =3D 0; i < num_rows; i++) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:65:2: note: Loop condi=
tion is true.  Entering loop body
           for (i =3D 0; i < num_rows; i++) {
           ^
   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:68:5: note: Array acce=
ss (from variable 'dump_addr') results in a null pointer dereference
                                   dump_addr[i * 4], dump_addr[i * 4 + 1],
                                   ^~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/drm/drm_crtc.h:1268:9: warning: Access to field 'index' results =
in a dereference of a null pointer (loaded from variable 'crtc') [clang-ana=
lyzer-core.NullDereference]
           return crtc->index;
                  ^
   drivers/gpu/drm/msm/msm_atomic.c:202:2: note: 'async_crtc' initialized t=
o a null pointer value
           struct drm_crtc *async_crtc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:204:15: note: Assuming field 'vsync_tim=
e' is non-null
           bool async =3D kms->funcs->vsync_time &&
                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:204:15: note: Left side of '&&' is true
   drivers/gpu/drm/msm/msm_atomic.c:205:4: note: Calling 'can_do_async'
                           can_do_async(state, &async_crtc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:163:8: note: Assuming field 'legacy_cur=
sor_update' is true
           if (!(state->legacy_cursor_update || state->async_update))
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:163:36: note: Left side of '||' is true
           if (!(state->legacy_cursor_update || state->async_update))
                                             ^
   drivers/gpu/drm/msm/msm_atomic.c:163:2: note: Taking false branch
           if (!(state->legacy_cursor_update || state->async_update))
           ^
   drivers/gpu/drm/msm/msm_atomic.c:167:2: note: Assuming 'i' is >=3D field=
 'num_connector'
           for_each_new_connector_in_state(state, connector, connector_stat=
e, i)
           ^
   include/drm/drm_atomic.h:781:7: note: expanded from macro 'for_each_new_=
connector_in_state'
                (__i) < (__state)->num_connector;                          =
        \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:167:2: note: Loop condition is false. E=
xecution continues on line 170
           for_each_new_connector_in_state(state, connector, connector_stat=
e, i)
           ^
   include/drm/drm_atomic.h:780:2: note: expanded from macro 'for_each_new_=
connector_in_state'
           for ((__i) =3D 0;                                               =
          \
           ^
   drivers/gpu/drm/msm/msm_atomic.c:170:2: note: Assuming 'i' is >=3D field=
 'num_crtc'
           for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
           ^
   include/drm/drm_atomic.h:846:7: note: expanded from macro 'for_each_new_=
crtc_in_state'
                (__i) < (__state)->dev->mode_config.num_crtc;              \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:170:2: note: Loop condition is false. E=
xecution continues on line 178
           for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
           ^
   include/drm/drm_atomic.h:845:2: note: expanded from macro 'for_each_new_=
crtc_in_state'
           for ((__i) =3D 0;                                               =
  \
           ^
   drivers/gpu/drm/msm/msm_atomic.c:178:2: note: Returning without writing =
to '*async_crtc'
           return true;
           ^
   drivers/gpu/drm/msm/msm_atomic.c:205:4: note: Returning from 'can_do_asy=
nc'
                           can_do_async(state, &async_crtc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:233:6: note: 'async' is true

vim +/drm_dev +56 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c

7e30a7c90ba728 Rob Clark        2021-12-15  52  =

7e30a7c90ba728 Rob Clark        2021-12-15  53  static void _msm_disp_snaps=
hot_work(struct kthread_work *work)
7e30a7c90ba728 Rob Clark        2021-12-15  54  {
7e30a7c90ba728 Rob Clark        2021-12-15  55  	struct msm_kms *kms =3D co=
ntainer_of(work, struct msm_kms, dump_work);
7e30a7c90ba728 Rob Clark        2021-12-15 @56  	struct drm_device *drm_dev=
 =3D kms->dev;
7e30a7c90ba728 Rob Clark        2021-12-15  57  	struct msm_disp_state *dis=
p_state;
7e30a7c90ba728 Rob Clark        2021-12-15  58  	struct drm_printer p;
7e30a7c90ba728 Rob Clark        2021-12-15  59  =

7e30a7c90ba728 Rob Clark        2021-12-15  60  	/* Serialize dumping here =
*/
7e30a7c90ba728 Rob Clark        2021-12-15  61  	mutex_lock(&kms->dump_mute=
x);
7e30a7c90ba728 Rob Clark        2021-12-15  62  	disp_state =3D msm_disp_sn=
apshot_state_sync(kms);
2503003cb2b8cb Dmitry Baryshkov 2021-04-27  63  	mutex_unlock(&kms->dump_mu=
tex);
2503003cb2b8cb Dmitry Baryshkov 2021-04-27  64  =

7e30a7c90ba728 Rob Clark        2021-12-15  65  	if (IS_ERR(disp_state))
7e30a7c90ba728 Rob Clark        2021-12-15  66  		return;
7e30a7c90ba728 Rob Clark        2021-12-15  67  =

98659487b845c0 Abhinav Kumar    2021-04-16  68  	if (MSM_DISP_SNAPSHOT_DUMP=
_IN_CONSOLE) {
98659487b845c0 Abhinav Kumar    2021-04-16  69  		p =3D drm_info_printer(di=
sp_state->drm_dev->dev);
98659487b845c0 Abhinav Kumar    2021-04-16  70  		msm_disp_state_print(disp=
_state, &p);
98659487b845c0 Abhinav Kumar    2021-04-16  71  	}
98659487b845c0 Abhinav Kumar    2021-04-16  72  =

98659487b845c0 Abhinav Kumar    2021-04-16  73  	/*
2503003cb2b8cb Dmitry Baryshkov 2021-04-27  74  	 * If COREDUMP is disabled=
, the stub will call the free function.
2503003cb2b8cb Dmitry Baryshkov 2021-04-27  75  	 * If there is a codedump =
pending for the device, the dev_coredumpm()
2503003cb2b8cb Dmitry Baryshkov 2021-04-27  76  	 * will also free new core=
dump state.
98659487b845c0 Abhinav Kumar    2021-04-16  77  	 */
98659487b845c0 Abhinav Kumar    2021-04-16  78  	dev_coredumpm(disp_state->=
dev, THIS_MODULE, disp_state, 0, GFP_KERNEL,
2503003cb2b8cb Dmitry Baryshkov 2021-04-27  79  			disp_devcoredump_read, m=
sm_disp_state_free);
98659487b845c0 Abhinav Kumar    2021-04-16  80  }
98659487b845c0 Abhinav Kumar    2021-04-16  81  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7842629173621324856==--

