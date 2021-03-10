Content-Type: multipart/mixed; boundary="===============1920955018475471335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] devres: better type safety with devm_*_action()
Date: Wed, 10 Mar 2021 22:08:14 +0800
Message-ID: <202103102232.WBGoCJ5S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1920955018475471335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210309235917.2134565-1-linux@rasmusvillemoes.dk>
References: <20210309235917.2134565-1-linux@rasmusvillemoes.dk>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Hi Rasmus,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on linux/master linus/master v5.12-rc2 next-202103=
10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rasmus-Villemoes/devres-be=
tter-type-safety-with-devm_-_action/20210310-080019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git a38fd8748464831584a19438cbb3082b5a2dab15
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: s390-randconfig-s032-20210310 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-262-g5e674421-dirty
        # https://github.com/0day-ci/linux/commit/663d41317b8fa291fc1c82100=
b3e2526627ab4d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rasmus-Villemoes/devres-better-typ=
e-safety-with-devm_-_action/20210310-080019
        git checkout 663d41317b8fa291fc1c82100b3e2526627ab4d4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/input/touchscreen/stmfts.c: note: in included file (through incl=
ude/linux/acpi.h, include/linux/i2c.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/input/touchscreen/stmfts.c:708:15: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/touchscreen/stmfts.c:708:15: sparse: sparse: arithmetics o=
n pointers to functions
>> drivers/input/touchscreen/stmfts.c:708:15: sparse: sparse: static assert=
ion failed: "__same_type(stmfts_power_off + 0, void (*)(void *)) || __same_=
type(stmfts_power_off + 0, void (*)(typeof(sdata)))"
--
   drivers/nvdimm/core.c: note: in included file (through include/linux/blk=
_types.h, include/linux/bio.h, include/linux/libnvdimm.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/nvdimm/core.c:172:13: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/nvdimm/core.c:172:13: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/nvdimm/core.c:172:13: sparse: sparse: static assertion failed: "=
__same_type(nvdimm_map_put + 0, void (*)(void *)) || __same_type(nvdimm_map=
_put + 0, void (*)(typeof(nvdimm_map)))"
--
   drivers/nvdimm/dimm_devs.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/nvdimm/dimm_devs.c:663:16: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/nvdimm/dimm_devs.c:663:16: sparse: sparse: arithmetics on pointe=
rs to functions
>> drivers/nvdimm/dimm_devs.c:663:16: sparse: sparse: static assertion fail=
ed: "__same_type(shutdown_security_notify + 0, void (*)(void *)) || __same_=
type(shutdown_security_notify + 0, void (*)(typeof(nvdimm)))"
--
   drivers/nvdimm/namespace_devs.c: note: in included file:
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/nvdimm/namespace_devs.c:2594:16: sparse: sparse: arithmetics on =
pointers to functions
>> drivers/nvdimm/namespace_devs.c:2594:16: sparse: sparse: arithmetics on =
pointers to functions
>> drivers/nvdimm/namespace_devs.c:2594:16: sparse: sparse: static assertio=
n failed: "__same_type(deactivate_labels + 0, void (*)(void *)) || __same_t=
ype(deactivate_labels + 0, void (*)(typeof(nd_region)))"
--
   drivers/nvdimm/pmem.c: note: in included file (through include/linux/blk=
_types.h, include/linux/genhd.h, include/linux/blkdev.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/nvdimm/pmem.c:450:21: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/nvdimm/pmem.c:450:21: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/nvdimm/pmem.c:450:21: sparse: sparse: static assertion failed: "=
__same_type(pmem_release_queue + 0, void (*)(void *)) || __same_type(pmem_r=
elease_queue + 0, void (*)(typeof(&pmem->pgmap)))"
   drivers/nvdimm/pmem.c:501:13: sparse: sparse: arithmetics on pointers to=
 functions
   drivers/nvdimm/pmem.c:501:13: sparse: sparse: arithmetics on pointers to=
 functions
>> drivers/nvdimm/pmem.c:501:13: sparse: sparse: static assertion failed: "=
__same_type(pmem_release_disk + 0, void (*)(void *)) || __same_type(pmem_re=
lease_disk + 0, void (*)(typeof(pmem)))"
--
   drivers/nvdimm/blk.c: note: in included file (through include/linux/blk_=
types.h, include/linux/genhd.h, include/linux/blkdev.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/nvdimm/blk.c:256:13: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/nvdimm/blk.c:256:13: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/nvdimm/blk.c:256:13: sparse: sparse: static assertion failed: "_=
_same_type(nd_blk_release_queue + 0, void (*)(void *)) || __same_type(nd_bl=
k_release_queue + 0, void (*)(typeof(q)))"
   drivers/nvdimm/blk.c:274:13: sparse: sparse: arithmetics on pointers to =
functions
   drivers/nvdimm/blk.c:274:13: sparse: sparse: arithmetics on pointers to =
functions
>> drivers/nvdimm/blk.c:274:13: sparse: sparse: static assertion failed: "_=
_same_type(nd_blk_release_disk + 0, void (*)(void *)) || __same_type(nd_blk=
_release_disk + 0, void (*)(typeof(disk)))"
--
   drivers/cxl/mem.c: note: in included file (through include/linux/cdev.h):
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: arithmetics on pointers t=
o functions
   include/linux/device.h:290:15: sparse: sparse: static assertion failed: =
"__same_type(action + 0, void (*)(void *)) || __same_type(action + 0, void =
(*)(typeof(data)))"
>> drivers/cxl/mem.c:1216:16: sparse: sparse: arithmetics on pointers to fu=
nctions
>> drivers/cxl/mem.c:1216:16: sparse: sparse: arithmetics on pointers to fu=
nctions
>> drivers/cxl/mem.c:1216:16: sparse: sparse: static assertion failed: "__s=
ame_type(cxlmdev_unregister + 0, void (*)(void *)) || __same_type(cxlmdev_u=
nregister + 0, void (*)(typeof(cxlmd)))"

vim +708 drivers/input/touchscreen/stmfts.c

78bcac7b2ae1e4 Andi Shyti       2017-06-05  624  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  625  static int stmfts_probe(st=
ruct i2c_client *client,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  626  			const struct i2c_device=
_id *id)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  627  {
78bcac7b2ae1e4 Andi Shyti       2017-06-05  628  	int err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  629  	struct stmfts_data *sdata;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  630  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  631  	if (!i2c_check_functional=
ity(client->adapter, I2C_FUNC_I2C |
78bcac7b2ae1e4 Andi Shyti       2017-06-05  632  						I2C_FUNC_SMBUS_BYTE_=
DATA |
78bcac7b2ae1e4 Andi Shyti       2017-06-05  633  						I2C_FUNC_SMBUS_I2C_B=
LOCK))
78bcac7b2ae1e4 Andi Shyti       2017-06-05  634  		return -ENODEV;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  635  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  636  	sdata =3D devm_kzalloc(&c=
lient->dev, sizeof(*sdata), GFP_KERNEL);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  637  	if (!sdata)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  638  		return -ENOMEM;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  639  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  640  	i2c_set_clientdata(client=
, sdata);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  641  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  642  	sdata->client =3D client;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  643  	mutex_init(&sdata->mutex);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  644  	init_completion(&sdata->c=
md_done);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  645  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  646  	sdata->regulators[STMFTS_=
REGULATOR_VDD].supply =3D "vdd";
78bcac7b2ae1e4 Andi Shyti       2017-06-05  647  	sdata->regulators[STMFTS_=
REGULATOR_AVDD].supply =3D "avdd";
78bcac7b2ae1e4 Andi Shyti       2017-06-05  648  	err =3D devm_regulator_bu=
lk_get(&client->dev,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  649  				      ARRAY_SIZE(sdata=
->regulators),
78bcac7b2ae1e4 Andi Shyti       2017-06-05  650  				      sdata->regulator=
s);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  651  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  652  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  653  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  654  	sdata->input =3D devm_inp=
ut_allocate_device(&client->dev);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  655  	if (!sdata->input)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  656  		return -ENOMEM;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  657  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  658  	sdata->input->name =3D ST=
MFTS_DEV_NAME;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  659  	sdata->input->id.bustype =
=3D BUS_I2C;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  660  	sdata->input->open =3D st=
mfts_input_open;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  661  	sdata->input->close =3D s=
tmfts_input_close;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  662  =

c9bfb2f0031a2d Chanwoo Choi     2017-10-18  663  	input_set_capability(sdat=
a->input, EV_ABS, ABS_MT_POSITION_X);
c9bfb2f0031a2d Chanwoo Choi     2017-10-18  664  	input_set_capability(sdat=
a->input, EV_ABS, ABS_MT_POSITION_Y);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  665  	touchscreen_parse_propert=
ies(sdata->input, true, &sdata->prop);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  666  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  667  	input_set_abs_params(sdat=
a->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  668  	input_set_abs_params(sdat=
a->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  669  	input_set_abs_params(sdat=
a->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  670  	input_set_abs_params(sdat=
a->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  671  	input_set_abs_params(sdat=
a->input, ABS_DISTANCE, 0, 255, 0, 0);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  672  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  673  	sdata->use_key =3D device=
_property_read_bool(&client->dev,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  674  						   "touch-key-connec=
ted");
78bcac7b2ae1e4 Andi Shyti       2017-06-05  675  	if (sdata->use_key) {
78bcac7b2ae1e4 Andi Shyti       2017-06-05  676  		input_set_capability(sda=
ta->input, EV_KEY, KEY_MENU);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  677  		input_set_capability(sda=
ta->input, EV_KEY, KEY_BACK);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  678  	}
78bcac7b2ae1e4 Andi Shyti       2017-06-05  679  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  680  	err =3D input_mt_init_slo=
ts(sdata->input,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  681  				  STMFTS_MAX_FINGERS, =
INPUT_MT_DIRECT);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  682  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  683  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  684  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  685  	input_set_drvdata(sdata->=
input, sdata);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  686  =

cba04cdf437d74 Andi Shyti       2018-01-22  687  	/*
cba04cdf437d74 Andi Shyti       2018-01-22  688  	 * stmfts_power_on expect=
s interrupt to be disabled, but
cba04cdf437d74 Andi Shyti       2018-01-22  689  	 * at this point the devi=
ce is still off and I do not trust
cba04cdf437d74 Andi Shyti       2018-01-22  690  	 * the status of the irq =
line that can generate some spurious
cba04cdf437d74 Andi Shyti       2018-01-22  691  	 * interrupts. To be on t=
he safe side it's better to not enable
cba04cdf437d74 Andi Shyti       2018-01-22  692  	 * the interrupts during =
their request.
cba04cdf437d74 Andi Shyti       2018-01-22  693  	 */
cba04cdf437d74 Andi Shyti       2018-01-22  694  	irq_set_status_flags(clie=
nt->irq, IRQ_NOAUTOEN);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  695  	err =3D devm_request_thre=
aded_irq(&client->dev, client->irq,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  696  					NULL, stmfts_irq_hand=
ler,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  697  					IRQF_ONESHOT,
78bcac7b2ae1e4 Andi Shyti       2017-06-05  698  					"stmfts_irq", sdata);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  699  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  700  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  701  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  702  	dev_dbg(&client->dev, "in=
itializing ST-Microelectronics FTS...\n");
78bcac7b2ae1e4 Andi Shyti       2017-06-05  703  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  704  	err =3D stmfts_power_on(s=
data);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  705  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  706  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  707  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05 @708  	err =3D devm_add_action_o=
r_reset(&client->dev, stmfts_power_off, sdata);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  709  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  710  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  711  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  712  	err =3D input_register_de=
vice(sdata->input);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  713  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  714  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  715  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  716  	if (sdata->use_key) {
78bcac7b2ae1e4 Andi Shyti       2017-06-05  717  		err =3D stmfts_enable_le=
d(sdata);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  718  		if (err) {
78bcac7b2ae1e4 Andi Shyti       2017-06-05  719  			/*
78bcac7b2ae1e4 Andi Shyti       2017-06-05  720  			 * Even if the LEDs hav=
e failed to be initialized and
78bcac7b2ae1e4 Andi Shyti       2017-06-05  721  			 * used in the driver, =
I can still use the device even
78bcac7b2ae1e4 Andi Shyti       2017-06-05  722  			 * without LEDs. The le=
dvdd regulator pointer will be
78bcac7b2ae1e4 Andi Shyti       2017-06-05  723  			 * used as a flag.
78bcac7b2ae1e4 Andi Shyti       2017-06-05  724  			 */
78bcac7b2ae1e4 Andi Shyti       2017-06-05  725  			dev_warn(&client->dev, =
"unable to use touchkey leds\n");
78bcac7b2ae1e4 Andi Shyti       2017-06-05  726  			sdata->ledvdd =3D NULL;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  727  		}
78bcac7b2ae1e4 Andi Shyti       2017-06-05  728  	}
78bcac7b2ae1e4 Andi Shyti       2017-06-05  729  =

c2690bd69788c6 Andi Shyti       2017-09-22  730  	err =3D devm_device_add_g=
roup(&client->dev, &stmfts_attribute_group);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  731  	if (err)
78bcac7b2ae1e4 Andi Shyti       2017-06-05  732  		return err;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  733  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  734  	pm_runtime_enable(&client=
->dev);
1d960003603403 Marek Szyprowski 2018-03-30  735  	device_enable_async_suspe=
nd(&client->dev);
78bcac7b2ae1e4 Andi Shyti       2017-06-05  736  =

78bcac7b2ae1e4 Andi Shyti       2017-06-05  737  	return 0;
78bcac7b2ae1e4 Andi Shyti       2017-06-05  738  }
78bcac7b2ae1e4 Andi Shyti       2017-06-05  739  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1920955018475471335==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Vl/+D9icx0vtbgEA
--===============1920955018475471335==--

