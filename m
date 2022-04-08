Content-Type: multipart/mixed; boundary="===============6560552636756865434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/isl7998x.c:677:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 08 Apr 2022 22:51:47 +0800
Message-ID: <202204082259.8nHx5sPi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6560552636756865434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marek Vasut <marex@denx.de>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Michael Tretter <m.tretter@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1831fed559732b132aef0ea8261ac77e73f7eadf
commit: 51ef2be546e2e480e56fdb59fdeb9a4406e8d52e media: i2c: isl7998x: Add =
driver for Intersil ISL7998x
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220408 (https://download.01.org/0day-ci/archi=
ve/20220408/202204082259.8nHx5sPi-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D51ef2be546e2e480e56fdb59fdeb9a4406e8d52e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 51ef2be546e2e480e56fdb59fdeb9a4406e8d52e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/base/bus.c:871:2: note: Returning from 'bus_remove_groups'
           bus_remove_groups(bus, bus->bus_groups);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:872:2: note: Calling 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:572:2: note: Calling 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_autoprobe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:145:6: note: Calling 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:44:6: note: 'bus' is non-null
           if (bus) {
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:572:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_autoprobe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:573:2: note: Calling 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:145:6: note: Calling 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:44:6: note: 'bus' is non-null
           if (bus) {
               ^~~
   drivers/base/bus.c:44:2: note: Taking true branch
           if (bus) {
           ^
   drivers/base/bus.c:46:3: note: Returning without writing to 'bus->p'
                   return bus;
                   ^
   drivers/base/bus.c:145:6: note: Returning from 'bus_get'
           if (bus_get(bus)) {
               ^~~~~~~~~~~~
   drivers/base/bus.c:145:2: note: Taking true branch
           if (bus_get(bus)) {
           ^
   drivers/base/bus.c:147:3: note: Calling 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:53:6: note: 'bus' is non-null
           if (bus)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:573:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:574:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:872:2: note: Returning from 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:873:18: note: Access to field 'drivers_kset' results =
in a dereference of a null pointer (loaded from field 'p')
           kset_unregister(bus->p->drivers_kset);
                           ^    ~
   3 warnings generated.
>> drivers/media/i2c/isl7998x.c:677:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D isl7998x->subdev.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/isl7998x.c:677:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D isl7998x->subdev.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/isl7998x.c:919:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/media/i2c/isl7998x.c:919:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   drivers/media/i2c/rdacm21.c:373:11: warning: The left operand of '=3D=3D=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (val =3D=3D OV10640_ID_HIGH)
                           ^
   drivers/media/i2c/rdacm21.c:550:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   drivers/media/i2c/rdacm21.c:550:2: note: Taking false branch
           if (!dev)
           ^
   drivers/media/i2c/rdacm21.c:557:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/media/i2c/rdacm21.c:557:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/media/i2c/rdacm21.c:564:2: note: Taking false branch
           if (IS_ERR(dev->isp))
           ^
   drivers/media/i2c/rdacm21.c:567:8: note: Calling 'rdacm21_initialize'
           ret =3D rdacm21_initialize(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:481:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:481:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:489:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:489:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:493:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:493:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:501:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:501:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:505:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:505:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:510:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:510:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:514:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:514:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:520:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:520:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:526:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:526:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:530:8: note: Calling 'ov490_initialize'
           ret =3D ov490_initialize(dev);
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:399:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < OV490_PID_TIMEOUT; ++i) {
           ^
   drivers/media/i2c/rdacm21.c:401:7: note: 'ret' is equal to 0
                   if (ret =3D=3D 0)

vim +/dev +677 drivers/media/i2c/isl7998x.c

51ef2be546e2e4 Marek Vasut 2022-02-17  664  =

51ef2be546e2e4 Marek Vasut 2022-02-17  665  static int isl7998x_init(struct=
 isl7998x *isl7998x)
51ef2be546e2e4 Marek Vasut 2022-02-17  666  {
51ef2be546e2e4 Marek Vasut 2022-02-17  667  	const unsigned int lanes =3D i=
sl7998x->nr_mipi_lanes;
51ef2be546e2e4 Marek Vasut 2022-02-17  668  	const u32 isl7998x_video_in_ch=
an_map[] =3D { 0x00, 0x11, 0x02, 0x02 };
51ef2be546e2e4 Marek Vasut 2022-02-17  669  	const struct reg_sequence isl7=
998x_init_seq_custom[] =3D {
51ef2be546e2e4 Marek Vasut 2022-02-17  670  		{ ISL7998X_REG_P0_VIDEO_IN_CH=
AN_CTL,
51ef2be546e2e4 Marek Vasut 2022-02-17  671  		  isl7998x_video_in_chan_map[=
isl7998x->nr_inputs - 1] },
51ef2be546e2e4 Marek Vasut 2022-02-17  672  		{ ISL7998X_REG_P0_CLK_CTL_4,
51ef2be546e2e4 Marek Vasut 2022-02-17  673  		  (lanes =3D=3D 1) ? 0x40 : 0=
x41 },
51ef2be546e2e4 Marek Vasut 2022-02-17  674  		{ ISL7998X_REG_P5_LI_ENGINE_C=
TL,
51ef2be546e2e4 Marek Vasut 2022-02-17  675  		  (lanes =3D=3D 1) ? 0x01 : 0=
x02 },
51ef2be546e2e4 Marek Vasut 2022-02-17  676  	};
51ef2be546e2e4 Marek Vasut 2022-02-17 @677  	struct device *dev =3D isl7998=
x->subdev.dev;
51ef2be546e2e4 Marek Vasut 2022-02-17  678  	struct regmap *regmap =3D isl7=
998x->regmap;
51ef2be546e2e4 Marek Vasut 2022-02-17  679  	int ret;
51ef2be546e2e4 Marek Vasut 2022-02-17  680  =

51ef2be546e2e4 Marek Vasut 2022-02-17  681  	dev_dbg(dev, "configuring %d l=
anes for %d inputs (norm %s)\n",
51ef2be546e2e4 Marek Vasut 2022-02-17  682  		isl7998x->nr_mipi_lanes, isl7=
998x->nr_inputs,
51ef2be546e2e4 Marek Vasut 2022-02-17  683  		v4l2_norm_to_name(isl7998x->n=
orm));
51ef2be546e2e4 Marek Vasut 2022-02-17  684  =

51ef2be546e2e4 Marek Vasut 2022-02-17  685  	ret =3D regmap_register_patch(=
regmap, isl7998x_init_seq_1,
51ef2be546e2e4 Marek Vasut 2022-02-17  686  				    ARRAY_SIZE(isl7998x_ini=
t_seq_1));
51ef2be546e2e4 Marek Vasut 2022-02-17  687  	if (ret)
51ef2be546e2e4 Marek Vasut 2022-02-17  688  		return ret;
51ef2be546e2e4 Marek Vasut 2022-02-17  689  =

51ef2be546e2e4 Marek Vasut 2022-02-17  690  	mutex_lock(&isl7998x->lock);
51ef2be546e2e4 Marek Vasut 2022-02-17  691  	ret =3D isl7998x_set_standard(=
isl7998x, isl7998x->norm);
51ef2be546e2e4 Marek Vasut 2022-02-17  692  	mutex_unlock(&isl7998x->lock);
51ef2be546e2e4 Marek Vasut 2022-02-17  693  	if (ret)
51ef2be546e2e4 Marek Vasut 2022-02-17  694  		return ret;
51ef2be546e2e4 Marek Vasut 2022-02-17  695  =

51ef2be546e2e4 Marek Vasut 2022-02-17  696  	ret =3D regmap_register_patch(=
regmap, isl7998x_init_seq_custom,
51ef2be546e2e4 Marek Vasut 2022-02-17  697  				    ARRAY_SIZE(isl7998x_ini=
t_seq_custom));
51ef2be546e2e4 Marek Vasut 2022-02-17  698  	if (ret)
51ef2be546e2e4 Marek Vasut 2022-02-17  699  		return ret;
51ef2be546e2e4 Marek Vasut 2022-02-17  700  =

51ef2be546e2e4 Marek Vasut 2022-02-17  701  	return regmap_register_patch(r=
egmap, isl7998x_init_seq_2,
51ef2be546e2e4 Marek Vasut 2022-02-17  702  				     ARRAY_SIZE(isl7998x_in=
it_seq_2));
51ef2be546e2e4 Marek Vasut 2022-02-17  703  }
51ef2be546e2e4 Marek Vasut 2022-02-17  704  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6560552636756865434==--

