Content-Type: multipart/mixed; boundary="===============3708273892352649643=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/pm8001/pm8001_sas.c:381:24: warning: Value stored to 'pm8001_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 21 Apr 2022 14:32:06 +0800
Message-ID: <202204202002.zsf44OL8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3708273892352649643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: John Garry <john.garry@huawei.com>
CC: Jack Wang <jinpu.wang@ionos.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   559089e0a93d44280ec3ab478830af319c56dbe3
commit: e29c47fe8946cc732b0e0d393b65b13c84bb69d0 scsi: pm8001: Simplify pm8=
001_task_exec()
date:   8 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220419 (https://download.01.org/0day-ci/arc=
hive/20220420/202204202002.zsf44OL8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a=
356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De29c47fe8946cc732b0e0d393b65b13c84bb69d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e29c47fe8946cc732b0e0d393b65b13c84bb69d0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   mm/zsmalloc.c:1901:2: note: Loop condition is false.  Exiting loop
           kunmap_atomic(s_addr);
           ^
   include/linux/highmem-internal.h:245:2: note: expanded from macro 'kunma=
p_atomic'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/zsmalloc.c:1901:2: note: Loop condition is false.  Exiting loop
           kunmap_atomic(s_addr);
           ^
   include/linux/highmem-internal.h:243:35: note: expanded from macro 'kunm=
ap_atomic'
   #define kunmap_atomic(__addr)                                   \
                                                                   ^
   mm/zsmalloc.c:1903:2: note: Calling 'replace_sub_page'
           replace_sub_page(class, zspage, newpage, page);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:1801:2: note: Initializing to a null pointer value
           struct page *pages[ZS_MAX_PAGES_PER_ZSPAGE] =3D {NULL, };
           ^~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:1806:7: note: Assuming 'page' is not equal to 'oldpage'
                   if (page =3D=3D oldpage)
                       ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:1806:3: note: Taking false branch
                   if (page =3D=3D oldpage)
                   ^
   mm/zsmalloc.c:1805:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   mm/zsmalloc.c:1813:2: note: Calling 'create_page_chain'
           create_page_chain(class, zspage, pages);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:1033:14: note: Assuming 'i' is < 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   mm/zsmalloc.c:1033:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_pages; i++) {
           ^
   mm/zsmalloc.c:1037:7: note: 'i' is equal to 0
                   if (i =3D=3D 0) {
                       ^
   mm/zsmalloc.c:1037:3: note: Taking true branch
                   if (i =3D=3D 0) {
                   ^
   mm/zsmalloc.c:1040:17: note: Assuming field 'objs_per_zspage' is not equ=
al to 1
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/zsmalloc.c:1040:45: note: Left side of '&&' is false
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                                                                    ^
   mm/zsmalloc.c:1040:4: note: Taking false branch
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                           ^
   mm/zsmalloc.c:1033:28: note: The value 1 is assigned to 'i'
           for (i =3D 0; i < nr_pages; i++) {
                                     ^~~
   mm/zsmalloc.c:1033:14: note: Assuming 'i' is < 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   mm/zsmalloc.c:1033:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_pages; i++) {
           ^
   mm/zsmalloc.c:1034:3: note: Null pointer value stored to 'page'
                   page =3D pages[i];
                   ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:1035:20: note: Passing null pointer value via 1st paramete=
r 'page'
                   set_page_private(page, (unsigned long)zspage);
                                    ^~~~
   mm/zsmalloc.c:1035:3: note: Calling 'set_page_private'
                   set_page_private(page, (unsigned long)zspage);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:308:16: note: Dereference of null pointer
           page->private =3D private;
           ~~~~~~~~~~~~~~^~~~~~~~~
   mm/zsmalloc.c:934:2: warning: Value stored to 'next' is never read [clan=
g-analyzer-deadcode.DeadStores]
           next =3D page =3D get_first_page(zspage);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:934:2: note: Value stored to 'next' is never read
           next =3D page =3D get_first_page(zspage);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/scsi/pm8001/pm8001_sas.c:381:24: warning: Value stored to 'pm800=
1_dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct pm8001_device *pm8001_dev =3D dev->lldd_dev;
                                 ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:381:24: note: Value stored to 'pm8001_d=
ev' during its initialization is never read
           struct pm8001_device *pm8001_dev =3D dev->lldd_dev;
                                 ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:639:4: warning: Value stored to 'res' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           res =3D -1;
                           ^     ~~
   drivers/scsi/pm8001/pm8001_sas.c:639:4: note: Value stored to 'res' is n=
ever read
                           res =3D -1;
                           ^     ~~
   drivers/scsi/pm8001/pm8001_sas.c:943:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:943:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:959:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:959:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:987:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:987:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:989:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D sas_phy_reset(phy, 1);
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:989:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D sas_phy_reset(phy, 1);
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:1179:4: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D pm8001_exec_internal_task_abort(pm8001_ha,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:1179:4: note: Value stored to 'rc' is n=
ever read
                           rc =3D pm8001_exec_internal_task_abort(pm8001_ha,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:154:48: warning: Access t=
o field 'data' results in a dereference of an undefined pointer value (load=
ed from variable 'fw') [clang-analyzer-core.NullDereference]
           nvkm_acr_lsfw_from_desc(&nvfw_ls_desc(subdev, fw->data)->head, l=
sfw);
                                                         ^~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:146:2: note: 'fw' declare=
d without an initial value
           const struct firmware *fw;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:149:9: note: Calling 'nvk=
m_acr_lsfw_load_sig_image_desc_'
           lsfw =3D nvkm_acr_lsfw_load_sig_image_desc_(subdev, falcon, id, =
path, ver,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:97:2: note: Taking false =
branch
           if (IS_ERR((lsfw =3D nvkm_acr_lsfw_add(func, acr, falcon, id))))
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:101:6: note: Assuming 're=
t' is not equal to 0
           if (ret)
               ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:101:2: note: Taking true =
branch
           if (ret)
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:102:3: note: Control jump=
s to line 110
                   goto done;
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:110:6: note: 'ret' is not=
 equal to 0
           if (ret) {
               ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:110:2: note: Taking true =
branch
           if (ret) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:112:3: note: Returning wi=
thout writing to '*pdesc'
                   return ERR_PTR(ret);
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:149:9: note: Returning fr=
om 'nvkm_acr_lsfw_load_sig_image_desc_'
           lsfw =3D nvkm_acr_lsfw_load_sig_image_desc_(subdev, falcon, id, =
path, ver,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:151:2: note: Taking false=
 branch
           if (IS_ERR(lsfw))
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:154:48: note: Access to f=
ield 'data' results in a dereference of an undefined pointer value (loaded =
from variable 'fw')
           nvkm_acr_lsfw_from_desc(&nvfw_ls_desc(subdev, fw->data)->head, l=
sfw);
                                                         ^~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:174:51: warning: Access t=
o field 'data' results in a dereference of an undefined pointer value (load=
ed from variable 'fw') [clang-analyzer-core.NullDereference]
           nvkm_acr_lsfw_from_desc(&nvfw_ls_desc_v1(subdev, fw->data)->head=
, lsfw);
                                                            ^~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:166:2: note: 'fw' declare=
d without an initial value
           const struct firmware *fw;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:169:9: note: Calling 'nvk=
m_acr_lsfw_load_sig_image_desc_'
           lsfw =3D nvkm_acr_lsfw_load_sig_image_desc_(subdev, falcon, id, =
path, ver,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:97:2: note: Taking false =
branch
           if (IS_ERR((lsfw =3D nvkm_acr_lsfw_add(func, acr, falcon, id))))
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:101:6: note: Assuming 're=
t' is not equal to 0
           if (ret)

vim +/pm8001_dev +381 drivers/scsi/pm8001/pm8001_sas.c

1cc943ae5003e4 jack wang       2009-12-07  366  =

a0cf5ce40d125a Lee Jones       2020-07-21  367  #define DEV_IS_GONE(pm8001_=
dev)	\
a0cf5ce40d125a Lee Jones       2020-07-21  368  	((!pm8001_dev || (pm8001_d=
ev->dev_type =3D=3D SAS_PHY_UNUSED)))
96e54376a8b270 John Garry      2022-02-17  369  =

dbf9bfe615717d jack wang       2009-10-14  370  /**
96e54376a8b270 John Garry      2022-02-17  371    * pm8001_queue_command - =
register for upper layer used, all IO commands sent
96e54376a8b270 John Garry      2022-02-17  372    * to HBA are from this in=
terface.
dbf9bfe615717d jack wang       2009-10-14  373    * @task: the task to be e=
xecute.
96e54376a8b270 John Garry      2022-02-17  374    * @gfp_flags: gfp_flags
dbf9bfe615717d jack wang       2009-10-14  375    */
96e54376a8b270 John Garry      2022-02-17  376  int pm8001_queue_command(st=
ruct sas_task *task, gfp_t gfp_flags)
dbf9bfe615717d jack wang       2009-10-14  377  {
e29c47fe8946cc Damien Le Moal  2022-02-20  378  	struct task_status_struct =
*ts =3D &task->task_status;
e29c47fe8946cc Damien Le Moal  2022-02-20  379  	enum sas_protocol task_pro=
to =3D task->task_proto;
dbf9bfe615717d jack wang       2009-10-14  380  	struct domain_device *dev =
=3D task->dev;
e29c47fe8946cc Damien Le Moal  2022-02-20 @381  	struct pm8001_device *pm80=
01_dev =3D dev->lldd_dev;
dbf9bfe615717d jack wang       2009-10-14  382  	struct pm8001_hba_info *pm=
8001_ha;
1cc943ae5003e4 jack wang       2009-12-07  383  	struct pm8001_port *port =
=3D NULL;
dbf9bfe615717d jack wang       2009-10-14  384  	struct pm8001_ccb_info *cc=
b;
96e54376a8b270 John Garry      2022-02-17  385  	struct sas_tmf_task *tmf =
=3D task->tmf;
96e54376a8b270 John Garry      2022-02-17  386  	int is_tmf =3D !!task->tmf;
e29c47fe8946cc Damien Le Moal  2022-02-20  387  	unsigned long flags;
e29c47fe8946cc Damien Le Moal  2022-02-20  388  	u32 n_elem =3D 0;
e29c47fe8946cc Damien Le Moal  2022-02-20  389  	int rc =3D 0;
dbf9bfe615717d jack wang       2009-10-14  390  =

dbf9bfe615717d jack wang       2009-10-14  391  	if (!dev->port) {
e29c47fe8946cc Damien Le Moal  2022-02-20  392  		ts->resp =3D SAS_TASK_UND=
ELIVERED;
e29c47fe8946cc Damien Le Moal  2022-02-20  393  		ts->stat =3D SAS_PHY_DOWN;
aa9f8328fc5146 James Bottomley 2013-05-07  394  		if (dev->dev_type !=3D SA=
S_SATA_DEV)
e29c47fe8946cc Damien Le Moal  2022-02-20  395  			task->task_done(task);
dbf9bfe615717d jack wang       2009-10-14  396  		return 0;
dbf9bfe615717d jack wang       2009-10-14  397  	}
72349b62a571ef Deepak Ukey     2018-09-11  398  =

e29c47fe8946cc Damien Le Moal  2022-02-20  399  	pm8001_ha =3D pm8001_find_=
ha_by_dev(dev);
e29c47fe8946cc Damien Le Moal  2022-02-20  400  	if (pm8001_ha->controller_=
fatal_error) {
72349b62a571ef Deepak Ukey     2018-09-11  401  		ts->resp =3D SAS_TASK_UND=
ELIVERED;
e29c47fe8946cc Damien Le Moal  2022-02-20  402  		task->task_done(task);
72349b62a571ef Deepak Ukey     2018-09-11  403  		return 0;
72349b62a571ef Deepak Ukey     2018-09-11  404  	}
e29c47fe8946cc Damien Le Moal  2022-02-20  405  =

1b5d2793283dcb Joe Perches     2020-11-20  406  	pm8001_dbg(pm8001_ha, IO, =
"pm8001_task_exec device\n");
e29c47fe8946cc Damien Le Moal  2022-02-20  407  =

dbf9bfe615717d jack wang       2009-10-14  408  	spin_lock_irqsave(&pm8001_=
ha->lock, flags);
e29c47fe8946cc Damien Le Moal  2022-02-20  409  =

dbf9bfe615717d jack wang       2009-10-14  410  	pm8001_dev =3D dev->lldd_d=
ev;
1cc943ae5003e4 jack wang       2009-12-07  411  	port =3D &pm8001_ha->port[=
sas_find_local_port_id(dev)];
e29c47fe8946cc Damien Le Moal  2022-02-20  412  =

b90b378ad5767c Mark Salyzyn    2011-09-22  413  	if (DEV_IS_GONE(pm8001_dev=
) || !port->port_attached) {
1cc943ae5003e4 jack wang       2009-12-07  414  		ts->resp =3D SAS_TASK_UND=
ELIVERED;
1cc943ae5003e4 jack wang       2009-12-07  415  		ts->stat =3D SAS_PHY_DOWN;
e29c47fe8946cc Damien Le Moal  2022-02-20  416  		if (sas_protocol_ata(task=
_proto)) {
1cc943ae5003e4 jack wang       2009-12-07  417  			spin_unlock_irqrestore(&=
pm8001_ha->lock, flags);
e29c47fe8946cc Damien Le Moal  2022-02-20  418  			task->task_done(task);
1cc943ae5003e4 jack wang       2009-12-07  419  			spin_lock_irqsave(&pm800=
1_ha->lock, flags);
1cc943ae5003e4 jack wang       2009-12-07  420  		} else {
e29c47fe8946cc Damien Le Moal  2022-02-20  421  			task->task_done(task);
1cc943ae5003e4 jack wang       2009-12-07  422  		}
e29c47fe8946cc Damien Le Moal  2022-02-20  423  		rc =3D -ENODEV;
e29c47fe8946cc Damien Le Moal  2022-02-20  424  		goto err_out;
1cc943ae5003e4 jack wang       2009-12-07  425  	}
99df0edb5a9849 Damien Le Moal  2022-02-20  426  =

e29c47fe8946cc Damien Le Moal  2022-02-20  427  	ccb =3D pm8001_ccb_alloc(p=
m8001_ha, pm8001_dev, task);
99df0edb5a9849 Damien Le Moal  2022-02-20  428  	if (!ccb) {
99df0edb5a9849 Damien Le Moal  2022-02-20  429  		rc =3D -SAS_QUEUE_FULL;
dbf9bfe615717d jack wang       2009-10-14  430  		goto err_out;
99df0edb5a9849 Damien Le Moal  2022-02-20  431  	}
dbf9bfe615717d jack wang       2009-10-14  432  =

a88d9db94c4c9f Vikram Auradkar 2019-11-14  433  	if (!sas_protocol_ata(task=
_proto)) {
e29c47fe8946cc Damien Le Moal  2022-02-20  434  		if (task->num_scatter) {
e29c47fe8946cc Damien Le Moal  2022-02-20  435  			n_elem =3D dma_map_sg(pm=
8001_ha->dev, task->scatter,
e29c47fe8946cc Damien Le Moal  2022-02-20  436  					    task->num_scatter,=
 task->data_dir);
dbf9bfe615717d jack wang       2009-10-14  437  			if (!n_elem) {
dbf9bfe615717d jack wang       2009-10-14  438  				rc =3D -ENOMEM;
99df0edb5a9849 Damien Le Moal  2022-02-20  439  				goto err_out_ccb;
dbf9bfe615717d jack wang       2009-10-14  440  			}
dbf9bfe615717d jack wang       2009-10-14  441  		}
dbf9bfe615717d jack wang       2009-10-14  442  	} else {
e29c47fe8946cc Damien Le Moal  2022-02-20  443  		n_elem =3D task->num_scat=
ter;
dbf9bfe615717d jack wang       2009-10-14  444  	}
dbf9bfe615717d jack wang       2009-10-14  445  =

e29c47fe8946cc Damien Le Moal  2022-02-20  446  	task->lldd_task =3D ccb;
dbf9bfe615717d jack wang       2009-10-14  447  	ccb->n_elem =3D n_elem;
99df0edb5a9849 Damien Le Moal  2022-02-20  448  =

e29c47fe8946cc Damien Le Moal  2022-02-20  449  	atomic_inc(&pm8001_dev->ru=
nning_req);
e29c47fe8946cc Damien Le Moal  2022-02-20  450  =

a88d9db94c4c9f Vikram Auradkar 2019-11-14  451  	switch (task_proto) {
dbf9bfe615717d jack wang       2009-10-14  452  	case SAS_PROTOCOL_SMP:
dbf9bfe615717d jack wang       2009-10-14  453  		rc =3D pm8001_task_prep_s=
mp(pm8001_ha, ccb);
dbf9bfe615717d jack wang       2009-10-14  454  		break;
dbf9bfe615717d jack wang       2009-10-14  455  	case SAS_PROTOCOL_SSP:
dbf9bfe615717d jack wang       2009-10-14  456  		if (is_tmf)
e29c47fe8946cc Damien Le Moal  2022-02-20  457  			rc =3D pm8001_task_prep_=
ssp_tm(pm8001_ha, ccb, tmf);
dbf9bfe615717d jack wang       2009-10-14  458  		else
dbf9bfe615717d jack wang       2009-10-14  459  			rc =3D pm8001_task_prep_=
ssp(pm8001_ha, ccb);
dbf9bfe615717d jack wang       2009-10-14  460  		break;
dbf9bfe615717d jack wang       2009-10-14  461  	case SAS_PROTOCOL_SATA:
dbf9bfe615717d jack wang       2009-10-14  462  	case SAS_PROTOCOL_STP:
dbf9bfe615717d jack wang       2009-10-14  463  		rc =3D pm8001_task_prep_a=
ta(pm8001_ha, ccb);
dbf9bfe615717d jack wang       2009-10-14  464  		break;
dbf9bfe615717d jack wang       2009-10-14  465  	default:
dbf9bfe615717d jack wang       2009-10-14  466  		dev_printk(KERN_ERR, pm80=
01_ha->dev,
a88d9db94c4c9f Vikram Auradkar 2019-11-14  467  			   "unknown sas_task pro=
to: 0x%x\n", task_proto);
dbf9bfe615717d jack wang       2009-10-14  468  		rc =3D -EINVAL;
dbf9bfe615717d jack wang       2009-10-14  469  		break;
dbf9bfe615717d jack wang       2009-10-14  470  	}
dbf9bfe615717d jack wang       2009-10-14  471  =

dbf9bfe615717d jack wang       2009-10-14  472  	if (rc) {
4a2efd4b89fcaa Viswas G        2020-11-02  473  		atomic_dec(&pm8001_dev->r=
unning_req);
e29c47fe8946cc Damien Le Moal  2022-02-20  474  		if (!sas_protocol_ata(tas=
k_proto) && n_elem)
e29c47fe8946cc Damien Le Moal  2022-02-20  475  			dma_unmap_sg(pm8001_ha->=
dev, task->scatter,
e29c47fe8946cc Damien Le Moal  2022-02-20  476  				     task->num_scatter,=
 task->data_dir);
99df0edb5a9849 Damien Le Moal  2022-02-20  477  err_out_ccb:
99df0edb5a9849 Damien Le Moal  2022-02-20  478  		pm8001_ccb_free(pm8001_ha=
, ccb);
e29c47fe8946cc Damien Le Moal  2022-02-20  479  =

dbf9bfe615717d jack wang       2009-10-14  480  err_out:
e29c47fe8946cc Damien Le Moal  2022-02-20  481  		pm8001_dbg(pm8001_ha, IO,=
 "pm8001_task_exec failed[%d]!\n", rc);
e29c47fe8946cc Damien Le Moal  2022-02-20  482  	}
e29c47fe8946cc Damien Le Moal  2022-02-20  483  =

dbf9bfe615717d jack wang       2009-10-14  484  	spin_unlock_irqrestore(&pm=
8001_ha->lock, flags);
e29c47fe8946cc Damien Le Moal  2022-02-20  485  =

dbf9bfe615717d jack wang       2009-10-14  486  	return rc;
dbf9bfe615717d jack wang       2009-10-14  487  }
dbf9bfe615717d jack wang       2009-10-14  488  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3708273892352649643==--

