Content-Type: multipart/mixed; boundary="===============8705567696634265154=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in the drivers
Date: Tue, 07 Dec 2021 04:23:15 +0800
Message-ID: <202112070451.iv2dNdso-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8705567696634265154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Marc Zyngier <maz@kernel.org>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen =
<mazziesaccount@gmail.com>
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
TO: Chunyan Zhang <chunyan.zhang@unisoc.com>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Baruch Siach <baruch@tkos.co.il>
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
TO: Tony Lindgren <tony@atomide.com>
TO: Nicolas Saenz Julienne <nsaenz@kernel.org>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on thierry-reding-pwm/for-next]
[also build test WARNING on rockchip/for-next v5.16-rc4]
[cannot apply to linusw-gpio/for-next next-20211206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpio-Get-r=
id-of-duplicate-of_node-assignment-in-the-drivers/20211203-051909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linu=
x-pwm.git for-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001-20211205 (https://download.01.org/0day-ci/arch=
ive/20211207/202112070451.iv2dNdso-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6e8678=
903523019903222e4521a5e41af743cab0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/884ea5e4f18badef51842fc94=
8d3b4f0fa538b06
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpio-Get-rid-of-du=
plicate-of_node-assignment-in-the-drivers/20211203-051909
        git checkout 884ea5e4f18badef51842fc948d3b4f0fa538b06
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:343:6: warning: Branch condition e=
valuates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!r)
               ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:414:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:414:2: note: Taking false branch
           if (r)
           ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:417:6: note: Calling 'vcn_v3_0_hw_=
init'
           r =3D vcn_v3_0_hw_init(adev);
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:283:12: note: 'r' declared without=
 an initial value
           int i, j, r;
                     ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:285:6: note: Assuming the conditio=
n is false
           if (amdgpu_sriov_vf(adev)) {
               ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h:251:2: note: expanded=
 from macro 'amdgpu_sriov_vf'
   ((adev)->virt.caps & AMDGPU_SRIOV_CAPS_IS_VF)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:285:2: note: Taking false branch
           if (amdgpu_sriov_vf(adev)) {
           ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:320:15: note: Assuming 'i' is >=3D=
 field 'num_vcn_inst'
                   for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:320:3: note: Loop condition is fal=
se. Execution continues on line 343
                   for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
                   ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:343:6: note: Branch condition eval=
uates to a garbage value
           if (!r)
               ^~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1513:4: warning: Value stored to '=
r' is never read [clang-analyzer-deadcode.DeadStores]
                           r =3D vcn_v3_0_stop_dpg_mode(adev, i);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1513:4: note: Value stored to 'r' =
is never read
                           r =3D vcn_v3_0_stop_dpg_mode(adev, i);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpio/gpio-gw-pld.c:74:22: warning: Value stored to 'np' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/gpio/gpio-gw-pld.c:74:22: note: Value stored to 'np' during its =
initialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/cpufreq/longhaul.c:194:4: warning: Value stored to 't' is never =
read [clang-analyzer-deadcode.DeadStores]
                           t =3D inl(acpi_gbl_FADT.xpm_timer_block.address);
                           ^
   drivers/cpufreq/longhaul.c:194:4: note: Value stored to 't' is never read
   drivers/cpufreq/longhaul.c:211:3: warning: Value stored to 't' is never =
read [clang-analyzer-deadcode.DeadStores]
                   t =3D inl(acpi_gbl_FADT.xpm_timer_block.address);
                   ^
   drivers/cpufreq/longhaul.c:211:3: note: Value stored to 't' is never read

vim +/np +74 drivers/gpio/gpio-gw-pld.c

2a0b0a57fa86b9 Linus Walleij 2019-02-01   69  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01   70  static int gw_pld_probe(struc=
t i2c_client *client,
2a0b0a57fa86b9 Linus Walleij 2019-02-01   71  			const struct i2c_device_id=
 *id)
2a0b0a57fa86b9 Linus Walleij 2019-02-01   72  {
2a0b0a57fa86b9 Linus Walleij 2019-02-01   73  	struct device *dev =3D &clie=
nt->dev;
2a0b0a57fa86b9 Linus Walleij 2019-02-01  @74  	struct device_node *np =3D d=
ev->of_node;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   75  	struct gw_pld *gw;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   76  	int ret;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   77  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01   78  	gw =3D devm_kzalloc(dev, siz=
eof(*gw), GFP_KERNEL);
2a0b0a57fa86b9 Linus Walleij 2019-02-01   79  	if (!gw)
2a0b0a57fa86b9 Linus Walleij 2019-02-01   80  		return -ENOMEM;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   81  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01   82  	gw->chip.base =3D -1;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   83  	gw->chip.can_sleep =3D true;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   84  	gw->chip.parent =3D dev;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   85  	gw->chip.owner =3D THIS_MODU=
LE;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   86  	gw->chip.label =3D dev_name(=
dev);
2a0b0a57fa86b9 Linus Walleij 2019-02-01   87  	gw->chip.ngpio =3D 8;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   88  	gw->chip.direction_input =3D=
 gw_pld_input8;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   89  	gw->chip.get =3D gw_pld_get8;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   90  	gw->chip.direction_output =
=3D gw_pld_output8;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   91  	gw->chip.set =3D gw_pld_set8;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   92  	gw->client =3D client;
2a0b0a57fa86b9 Linus Walleij 2019-02-01   93  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01   94  	/*
2a0b0a57fa86b9 Linus Walleij 2019-02-01   95  	 * The Gateworks I2C PLD chi=
p does not properly send the acknowledge
2a0b0a57fa86b9 Linus Walleij 2019-02-01   96  	 * bit at all times, but we =
can still use the standard i2c_smbus
2a0b0a57fa86b9 Linus Walleij 2019-02-01   97  	 * functions by simply ignor=
ing this bit.
2a0b0a57fa86b9 Linus Walleij 2019-02-01   98  	 */
2a0b0a57fa86b9 Linus Walleij 2019-02-01   99  	client->flags |=3D I2C_M_IGN=
ORE_NAK;
2a0b0a57fa86b9 Linus Walleij 2019-02-01  100  	gw->out =3D 0xFF;
2a0b0a57fa86b9 Linus Walleij 2019-02-01  101  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01  102  	i2c_set_clientdata(client, g=
w);
2a0b0a57fa86b9 Linus Walleij 2019-02-01  103  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01  104  	ret =3D devm_gpiochip_add_da=
ta(dev, &gw->chip, gw);
2a0b0a57fa86b9 Linus Walleij 2019-02-01  105  	if (ret)
2a0b0a57fa86b9 Linus Walleij 2019-02-01  106  		return ret;
2a0b0a57fa86b9 Linus Walleij 2019-02-01  107  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01  108  	dev_info(dev, "registered Ga=
teworks PLD GPIO device\n");
2a0b0a57fa86b9 Linus Walleij 2019-02-01  109  =

2a0b0a57fa86b9 Linus Walleij 2019-02-01  110  	return 0;
2a0b0a57fa86b9 Linus Walleij 2019-02-01  111  }
2a0b0a57fa86b9 Linus Walleij 2019-02-01  112  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8705567696634265154==--

