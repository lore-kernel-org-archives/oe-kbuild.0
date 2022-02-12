Content-Type: multipart/mixed; boundary="===============6271936189668421700=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:drm-misc-next 7/11] drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:415:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 13 Feb 2022 03:08:32 +0800
Message-ID: <202202130334.3uZK8a7n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6271936189668421700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   3675c2f26f33ab4928859fb8950a4697a16be5c9
commit: cfbb6b0047448e2d986160d9f30d60f604d9ad0f [7/11] drm/amdgpu: Rework =
reset domain to be refcounted.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20220210 (https://download.01.org/0day-ci/arc=
hive/20220213/202202130334.3uZK8a7n-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout cfbb6b0047448e2d986160d9f30d60f604d9ad0f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2547:32: note: Retur=
ning from 'si_get_pi'
           struct si_power_info *si_pi =3D si_get_pi(adev);
                                         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2547:2: note: 'si_pi=
' initialized here
           struct si_power_info *si_pi =3D si_get_pi(adev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2555:6: note: Assumi=
ng 'dte_data' is equal to NULL
           if (dte_data =3D=3D NULL)
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2555:2: note: Taking=
 true branch
           if (dte_data =3D=3D NULL)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2556:21: note: Acces=
s to field 'enable_dte' results in a dereference of a null pointer (loaded =
from variable 'si_pi')
                   si_pi->enable_dte =3D false;
                   ~~~~~             ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2913:5: warning: Val=
ue stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStores]
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_MSG_DisableDTE);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2913:5: note: Value =
stored to 'smc_result' is never read
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_MSG_DisableDTE);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2915:4: warning: Val=
ue stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStores]
                           smc_result =3D amdgpu_si_send_msg_to_smc(adev, P=
PSMC_MSG_DisableCac);
                           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2915:4: note: Value =
stored to 'smc_result' is never read
                           smc_result =3D amdgpu_si_send_msg_to_smc(adev, P=
PSMC_MSG_DisableCac);
                           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2920:5: warning: Val=
ue stored to 'smc_result' is never read [clang-analyzer-deadcode.DeadStores]
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_CACLongTermAvgDisable);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:2920:5: note: Value =
stored to 'smc_result' is never read
                                   smc_result =3D amdgpu_si_send_msg_to_smc=
(adev, PPSMC_CACLongTermAvgDisable);
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:4620:7: warning: Val=
ue stored to 'voltage_found' is never read [clang-analyzer-deadcode.DeadSto=
res]
                                                   voltage_found =3D true;
                                                   ^               ~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/si_dpm.c:4620:7: note: Value =
stored to 'voltage_found' is never read
                                                   voltage_found =3D true;
                                                   ^               ~~~~
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
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:78:2: warning: Value stored =
to 'pm_pg_lock' is never read [clang-analyzer-deadcode.DeadStores]
           pm_pg_lock =3D use_bank =3D use_ring =3D false;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:78:2: note: Value stored to =
'pm_pg_lock' is never read
           pm_pg_lock =3D use_bank =3D use_ring =3D false;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   12 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:415:5: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -ENOMEM;
                                   ^     ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:415:5: note: Value stored to 'r=
et' is never read
                                   ret =3D -ENOMEM;
                                   ^     ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:460:7: warning: Value stored to=
 'is_hi_req' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:460:7: note: Value stored to 'i=
s_hi_req' during its initialization is never read
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:467:2: warning: Value stored to=
 'request_adev' is never read [clang-analyzer-deadcode.DeadStores]
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:467:2: note: Value stored to 'r=
equest_adev' is never read
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:468:2: warning: Value stored to=
 'init_low' is never read [clang-analyzer-deadcode.DeadStores]
           init_low =3D hive->pstate =3D=3D AMDGPU_XGMI_PSTATE_UNKNOWN;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:468:2: note: Value stored to 'i=
nit_low' is never read
           init_low =3D hive->pstate =3D=3D AMDGPU_XGMI_PSTATE_UNKNOWN;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (7 in non-user code, 2 with check filters).
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
   9 warnings generated.
   drivers/spi/spi-amd.c:162:17: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
                           cmd_opcode =3D *(u8 *)xfer->tx_buf;
                                        ^
   drivers/spi/spi-amd.c:216:2: note: Calling 'amd_spi_fifo_xfer'
           amd_spi_fifo_xfer(amd_spi, master, msg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amd.c:152:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(xfer, &message->transfers,
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-amd.c:154:7: note: Assuming field 'rx_buf' is null
                   if (xfer->rx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:154:3: note: Taking false branch
                   if (xfer->rx_buf)
                   ^
   drivers/spi/spi-amd.c:156:7: note: Assuming field 'tx_buf' is non-null
                   if (xfer->tx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:156:3: note: Taking true branch
                   if (xfer->tx_buf)
                   ^
   drivers/spi/spi-amd.c:159:3: note: Taking true branch
                   if (m_cmd & AMD_SPI_XFER_TX) {
                   ^
   drivers/spi/spi-amd.c:167:16: note: Assuming 'i' is >=3D 'tx_len'
                           for (i =3D 0; i < tx_len; i++) {
                                       ^~~~~~~~~~
   drivers/spi/spi-amd.c:167:4: note: Loop condition is false. Execution co=
ntinues on line 172
                           for (i =3D 0; i < tx_len; i++) {
                           ^
   drivers/spi/spi-amd.c:177:3: note: Taking false branch
                   if (m_cmd & AMD_SPI_XFER_RX) {
                   ^
   drivers/spi/spi-amd.c:152:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(xfer, &message->transfers,
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-amd.c:154:7: note: Assuming field 'rx_buf' is null
                   if (xfer->rx_buf)
                       ^~~~~~~~~~~~
   drivers/spi/spi-amd.c:154:3: note: Taking false branch
                   if (xfer->rx_buf)

vim +/ret +415 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c

b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  363  =

b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  364  =

b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  365  =

d95e8e97e2d522 Dennis Li         2020-08-18  366  struct amdgpu_hive_info *=
amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
fb30fc59a24551 Shaoyun Liu       2018-06-27  367  {
be8901c2ee3a16 Kevin Wang        2021-02-03  368  	struct amdgpu_hive_info =
*hive =3D NULL;
d95e8e97e2d522 Dennis Li         2020-08-18  369  	int ret;
fb30fc59a24551 Shaoyun Liu       2018-06-27  370  =

fb30fc59a24551 Shaoyun Liu       2018-06-27  371  	if (!adev->gmc.xgmi.hive=
_id)
fb30fc59a24551 Shaoyun Liu       2018-06-27  372  		return NULL;
22d6575b8db590 Tom St Denis      2019-01-07  373  =

d95e8e97e2d522 Dennis Li         2020-08-18  374  	if (adev->hive) {
d95e8e97e2d522 Dennis Li         2020-08-18  375  		kobject_get(&adev->hive=
->kobj);
d95e8e97e2d522 Dennis Li         2020-08-18  376  		return adev->hive;
d95e8e97e2d522 Dennis Li         2020-08-18  377  	}
d95e8e97e2d522 Dennis Li         2020-08-18  378  =

22d6575b8db590 Tom St Denis      2019-01-07  379  	mutex_lock(&xgmi_mutex);
22d6575b8db590 Tom St Denis      2019-01-07  380  =

be8901c2ee3a16 Kevin Wang        2021-02-03  381  	list_for_each_entry(hive=
, &xgmi_hive_list, node)  {
d95e8e97e2d522 Dennis Li         2020-08-18  382  		if (hive->hive_id =3D=
=3D adev->gmc.xgmi.hive_id)
d95e8e97e2d522 Dennis Li         2020-08-18  383  			goto pro_end;
22d6575b8db590 Tom St Denis      2019-01-07  384  	}
fb30fc59a24551 Shaoyun Liu       2018-06-27  385  =

d95e8e97e2d522 Dennis Li         2020-08-18  386  	hive =3D kzalloc(sizeof(=
*hive), GFP_KERNEL);
d95e8e97e2d522 Dennis Li         2020-08-18  387  	if (!hive) {
d95e8e97e2d522 Dennis Li         2020-08-18  388  		dev_err(adev->dev, "XGM=
I: allocation failed\n");
d95e8e97e2d522 Dennis Li         2020-08-18  389  		hive =3D NULL;
d95e8e97e2d522 Dennis Li         2020-08-18  390  		goto pro_end;
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  391  	}
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  392  =

d95e8e97e2d522 Dennis Li         2020-08-18  393  	/* initialize new hive i=
f not exist */
d95e8e97e2d522 Dennis Li         2020-08-18  394  	ret =3D kobject_init_and=
_add(&hive->kobj,
d95e8e97e2d522 Dennis Li         2020-08-18  395  			&amdgpu_xgmi_hive_type,
d95e8e97e2d522 Dennis Li         2020-08-18  396  			&adev->dev->kobj,
d95e8e97e2d522 Dennis Li         2020-08-18  397  			"%s", "xgmi_hive_info"=
);
d95e8e97e2d522 Dennis Li         2020-08-18  398  	if (ret) {
d95e8e97e2d522 Dennis Li         2020-08-18  399  		dev_err(adev->dev, "XGM=
I: failed initializing kobject for xgmi hive\n");
7b833d680481f4 Bernard Zhao      2021-11-14  400  		kobject_put(&hive->kobj=
);
d95e8e97e2d522 Dennis Li         2020-08-18  401  		kfree(hive);
d95e8e97e2d522 Dennis Li         2020-08-18  402  		hive =3D NULL;
d95e8e97e2d522 Dennis Li         2020-08-18  403  		goto pro_end;
d95e8e97e2d522 Dennis Li         2020-08-18  404  	}
d95e8e97e2d522 Dennis Li         2020-08-18  405  =

cfbb6b0047448e Andrey Grodzovsky 2022-01-21  406  	/**
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  407  	 * Avoid recreating rese=
t domain when hive is reconstructed for the case
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  408  	 * of reset the devices =
in the XGMI hive during probe for SRIOV
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  409  	 * See https://www.spini=
cs.net/lists/amd-gfx/msg58836.html
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  410  	 */
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  411  	if (adev->reset_domain->=
type !=3D XGMI_HIVE) {
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  412  		hive->reset_domain =3D =
amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  413  			if (!hive->reset_domai=
n) {
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  414  				dev_err(adev->dev, "X=
GMI: failed initializing reset domain for xgmi hive\n");
cfbb6b0047448e Andrey Grodzovsky 2022-01-21 @415  				ret =3D -ENOMEM;
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  416  				kobject_put(&hive->ko=
bj);
a4c63cafa58b4b Andrey Grodzovsky 2021-11-30  417  				kfree(hive);
a4c63cafa58b4b Andrey Grodzovsky 2021-11-30  418  				hive =3D NULL;
a4c63cafa58b4b Andrey Grodzovsky 2021-11-30  419  				goto pro_end;
a4c63cafa58b4b Andrey Grodzovsky 2021-11-30  420  			}
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  421  	} else {
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  422  		amdgpu_reset_get_reset_=
domain(adev->reset_domain);
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  423  		hive->reset_domain =3D =
adev->reset_domain;
cfbb6b0047448e Andrey Grodzovsky 2022-01-21  424  	}
a4c63cafa58b4b Andrey Grodzovsky 2021-11-30  425  =

d95e8e97e2d522 Dennis Li         2020-08-18  426  	hive->hive_id =3D adev->=
gmc.xgmi.hive_id;
d95e8e97e2d522 Dennis Li         2020-08-18  427  	INIT_LIST_HEAD(&hive->de=
vice_list);
d95e8e97e2d522 Dennis Li         2020-08-18  428  	INIT_LIST_HEAD(&hive->no=
de);
d95e8e97e2d522 Dennis Li         2020-08-18  429  	mutex_init(&hive->hive_l=
ock);
d95e8e97e2d522 Dennis Li         2020-08-18  430  	atomic_set(&hive->number=
_devices, 0);
d95e8e97e2d522 Dennis Li         2020-08-18  431  	task_barrier_init(&hive-=
>tb);
d95e8e97e2d522 Dennis Li         2020-08-18  432  	hive->pstate =3D AMDGPU_=
XGMI_PSTATE_UNKNOWN;
d95e8e97e2d522 Dennis Li         2020-08-18  433  	hive->hi_req_gpu =3D NUL=
L;
a4c63cafa58b4b Andrey Grodzovsky 2021-11-30  434  =

d84a430d9f7b1c Jonathan Kim      2020-03-17  435  	/*
d84a430d9f7b1c Jonathan Kim      2020-03-17  436  	 * hive pstate on boot i=
s high in vega20 so we have to go to low
d84a430d9f7b1c Jonathan Kim      2020-03-17  437  	 * pstate on after boot.
d84a430d9f7b1c Jonathan Kim      2020-03-17  438  	 */
d95e8e97e2d522 Dennis Li         2020-08-18  439  	hive->hi_req_count =3D A=
MDGPU_MAX_XGMI_DEVICE_PER_HIVE;
d95e8e97e2d522 Dennis Li         2020-08-18  440  	list_add_tail(&hive->nod=
e, &xgmi_hive_list);
d95e8e97e2d522 Dennis Li         2020-08-18  441  =

d95e8e97e2d522 Dennis Li         2020-08-18  442  pro_end:
d95e8e97e2d522 Dennis Li         2020-08-18  443  	if (hive)
d95e8e97e2d522 Dennis Li         2020-08-18  444  		kobject_get(&hive->kobj=
);
22d6575b8db590 Tom St Denis      2019-01-07  445  	mutex_unlock(&xgmi_mutex=
);
d95e8e97e2d522 Dennis Li         2020-08-18  446  	return hive;
d95e8e97e2d522 Dennis Li         2020-08-18  447  }
ed2bf5229c53f2 Andrey Grodzovsky 2018-11-14  448  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6271936189668421700==--

