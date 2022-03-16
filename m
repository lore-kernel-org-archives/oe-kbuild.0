Content-Type: multipart/mixed; boundary="===============5426687081247047762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4172/12845] drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:415:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Mar 2022 17:40:33 +0800
Message-ID: <202203161739.AYbUlJdg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5426687081247047762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   a32cd981a6da2373c093d471ee4405a915e217d5
commit: cfbb6b0047448e2d986160d9f30d60f604d9ad0f [4172/12845] drm/amdgpu: R=
ework reset domain to be refcounted.
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220316/202203161739.AYbUlJdg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dcfbb6b0047448e2d986160d9f30d60f604d9ad0f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cfbb6b0047448e2d986160d9f30d60f604d9ad0f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                              ^ ~~~~~~~
   drivers/media/i2c/tvp7002.c:638:37: warning: The right operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           cpln =3D cpl_lsb | ((TVP7002_CL_MASK & cpl_msb) << TVP7002_CL_SH=
IFT);
                                              ^
   drivers/media/i2c/tvp7002.c:753:2: note: Calling 'tvp7002_query_dv'
           tvp7002_query_dv(sd, &detected);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:618:2: note: 'cpl_msb' declared without an i=
nitial value
           u8 cpl_msb;
           ^~~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:631:2: note: Calling 'tvp7002_read_err'
           tvp7002_read_err(sd, TVP7002_CLK_L_STAT_MSBS, &cpl_msb, &error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:475:2: note: Taking false branch
           if (!*err)
           ^
   drivers/media/i2c/tvp7002.c:477:1: note: Returning without writing to '*=
dst'
   }
   ^
   drivers/media/i2c/tvp7002.c:631:2: note: Returning from 'tvp7002_read_er=
r'
           tvp7002_read_err(sd, TVP7002_CLK_L_STAT_MSBS, &cpl_msb, &error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:633:6: note: 'error' is >=3D 0
           if (error < 0)
               ^~~~~
   drivers/media/i2c/tvp7002.c:633:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:638:37: note: The right operand of '&' is a =
garbage value
           cpln =3D cpl_lsb | ((TVP7002_CL_MASK & cpl_msb) << TVP7002_CL_SH=
IFT);
                                              ^ ~~~~~~~
   drivers/media/i2c/tvp7002.c:1004:2: warning: Value stored to 'error' is =
never read [clang-analyzer-deadcode.DeadStores]
           error =3D tvp7002_s_dv_timings(sd, &timings);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:1004:2: note: Value stored to 'error' is nev=
er read
           error =3D tvp7002_s_dv_timings(sd, &timings);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/fsi/fsi-sbefifo.c:176:4: warning: Value stored to 'w0' is never =
read [clang-analyzer-deadcode.DeadStores]
                           w0 =3D ffdc_sz;
                           ^    ~~~~~~~
   drivers/fsi/fsi-sbefifo.c:176:4: note: Value stored to 'w0' is never read
                           w0 =3D ffdc_sz;
                           ^    ~~~~~~~
   drivers/fsi/fsi-sbefifo.c:682:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &sbefifo->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-sbefifo.c:682:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D &sbefifo->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/magnetometer/ak8975.c:240:8: warning: Excessive padding in '=
struct ak_def' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   raw_to_gauss, =

   type, =

   range, =

   data_regs, =

   ctrl_masks, =

   ctrl_modes, =

   ctrl_regs, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ak_def {
   ~~~~~~~^~~~~~~~
   drivers/iio/magnetometer/ak8975.c:240:8: note: Excessive padding in 'str=
uct ak_def' (10 padding bytes, where 2 is optimal). Optimal fields order: r=
aw_to_gauss, type, range, data_regs, ctrl_masks, ctrl_modes, ctrl_regs, con=
sider reordering the fields or adding explicit padding members
   struct ak_def {
   ~~~~~~~^~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/firewire/core-device.c:310:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buf + ret, "\n");

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
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5426687081247047762==--

