Content-Type: multipart/mixed; boundary="===============2254975614650856076=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-android-linux-5.10.y 2225/9999] drivers/media/mc/mc-entity.c:443:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Tue, 22 Mar 2022 02:59:53 +0800
Message-ID: <202203220211.0jzzu4ou-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2254975614650856076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Pratyush Yadav <p.yadav@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-lin=
ux-5.10.y
head:   6b231b04f2f17dfc0729efb6db9b5203a7786b12
commit: 80dac899053d08524a40f195905022bb08e6104c [2225/9999] media: entity:=
 Move the pipeline from entity to pads
:::::: branch date: 4 weeks ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220318 (https://download.01.org/0day-ci/archi=
ve/20220322/202203220211.0jzzu4ou-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e=
4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-android-linux-5.10.y
        git checkout 80dac899053d08524a40f195905022bb08e6104c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   drivers/iio/adc/ti-ads124s08.c:97:8: warning: Excessive padding in 'stru=
ct ads124s_private' (43 padding bytes, where 11 is optimal). =

   Optimal fields order: =

   data, =

   buffer, =

   chip_info, =

   reset_gpio, =

   spi, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads124s_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads124s08.c:97:8: note: Excessive padding in 'struct =
ads124s_private' (43 padding bytes, where 11 is optimal). Optimal fields or=
der: data, buffer, chip_info, reset_gpio, spi, lock, consider reordering th=
e fields or adding explicit padding members
   struct ads124s_private {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/adc/twl6030-gpadc.c:911:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D devm_request_threaded_irq(dev, irq, NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/twl6030-gpadc.c:911:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D devm_request_threaded_irq(dev, irq, NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:290:5: warning: Call to funct=
ion 'strcpy' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                                   strcpy(str, orient);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:290:5: note: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119
                                   strcpy(str, orient);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:292:5: warning: Call to funct=
ion 'strcpy' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                                   strcpy(str, &orient[1]);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:292:5: note: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119
                                   strcpy(str, &orient[1]);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:295:5: warning: Call to funct=
ion 'strcpy' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                                   strcpy(&str[1], orient);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:295:5: note: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119
                                   strcpy(&str[1], orient);
                                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   9 warnings generated.
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/mc/mc-entity.c:443:7: warning: Branch condition evaluates =
to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (ret)
                       ^
   drivers/media/mc/mc-entity.c:551:8: note: Calling '__media_pipeline_star=
t'
           ret =3D __media_pipeline_start(entity, pipe);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-entity.c:414:2: note: 'ret' declared without an init=
ial value
           int ret;
           ^~~~~~~
   drivers/media/mc/mc-entity.c:416:6: note: Assuming the condition is false
           if (!pipe->streaming_count++) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-entity.c:416:2: note: Taking false branch
           if (!pipe->streaming_count++) {
           ^
   drivers/media/mc/mc-entity.c:424:2: note: Loop condition is true.  Enter=
ing loop body
           while ((pad =3D media_graph_walk_next(graph))) {
           ^
   drivers/media/mc/mc-entity.c:426:26: note: Assuming field 'pipe' is not =
equal to NULL
                   bool skip_validation =3D pad->pipe !=3D NULL;
                                          ^~~~~~~~~~~~~~~~~
   drivers/media/mc/mc-entity.c:432:3: note: Loop condition is false. Execu=
tion continues on line 443
                   media_entity_for_each_pad(entity, iter) {
                   ^
   include/media/media-entity.h:1117:2: note: expanded from macro 'media_en=
tity_for_each_pad'
           for (iter =3D (entity)->pads;                             \
           ^
   drivers/media/mc/mc-entity.c:443:7: note: Branch condition evaluates to =
a garbage value
                   if (ret)
                       ^~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/xarray.c:2028:18: warning: Value stored to 'node' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   lib/xarray.c:2028:18: note: Value stored to 'node' during its initializa=
tion is never read
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/accel/bma400_core.c:242:31: warning: The result of the right=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           *val =3D BMA400_ACC_ODR_MAX_HZ >> (BMA400_ACC_ODR_MAX_RAW - raw);
                                        ^
   drivers/iio/accel/bma400_core.c:741:2: note: Control jumps to 'case IIO_=
CHAN_INFO_SAMP_FREQ:'  at line 742
           switch (mask) {
           ^
   drivers/iio/accel/bma400_core.c:747:7: note: Assuming field 'type' is eq=
ual to IIO_ACCEL
                   if (chan->type !=3D IIO_ACCEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:747:3: note: Taking false branch
                   if (chan->type !=3D IIO_ACCEL)
                   ^
   drivers/iio/accel/bma400_core.c:751:9: note: Calling 'bma400_set_accel_o=
utput_data_rate'
                   ret =3D bma400_set_accel_output_data_rate(data, val, val=
2);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:306:6: note: Assuming 'hz' is >=3D BMA40=
0_ACC_ODR_MIN_WHOLE_HZ
           if (hz >=3D BMA400_ACC_ODR_MIN_WHOLE_HZ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:306:2: note: Taking true branch
           if (hz >=3D BMA400_ACC_ODR_MIN_WHOLE_HZ) {
           ^
   drivers/iio/accel/bma400_core.c:307:7: note: Assuming 'uhz' is 0
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                       ^~~
   drivers/iio/accel/bma400_core.c:307:7: note: Left side of '||' is false
   drivers/iio/accel/bma400_core.c:307:14: note: Assuming 'hz' is <=3D BMA4=
00_ACC_ODR_MAX_HZ
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:307:3: note: Taking false branch
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                   ^
   drivers/iio/accel/bma400_core.c:313:7: note: Assuming the condition is f=
alse
                   if (hz >> idx !=3D BMA400_ACC_ODR_MIN_WHOLE_HZ)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:313:3: note: Taking false branch
                   if (hz >> idx !=3D BMA400_ACC_ODR_MIN_WHOLE_HZ)
                   ^
   drivers/iio/accel/bma400_core.c:324:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/bma400_core.c:324:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/bma400_core.c:331:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/bma400_core.c:331:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/bma400_core.c:334:2: note: Calling 'bma400_output_data=
_rate_from_raw'
           bma400_output_data_rate_from_raw(idx, &data->sample_freq.hz,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:242:31: note: The result of the right sh=
ift is undefined because the right operand is negative
           *val =3D BMA400_ACC_ODR_MAX_HZ >> (BMA400_ACC_ODR_MAX_RAW - raw);
                                        ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).

vim +443 drivers/media/mc/mc-entity.c

d295c6a460cd2a drivers/media/media-entity.c Niklas S=C3=B6derlund          =
2017-06-15  401  =

e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  402  /* ------------------------------------------------------------=
-----------------
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  403   * Pipeline management
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  404   */
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  405  =

20b852273642f4 drivers/media/media-entity.c Sakari Ailus              2016-=
11-21  406  __must_check int __media_pipeline_start(struct media_entity *en=
tity,
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  407  					struct media_pipeline *pipe)
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  408  {
d10c98949d1a1f drivers/media/media-entity.c Javier Martinez Canillas  2015-=
08-19  409  	struct media_device *mdev =3D entity->graph_obj.mdev;
20b852273642f4 drivers/media/media-entity.c Sakari Ailus              2016-=
11-21  410  	struct media_graph *graph =3D &pipe->graph;
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  411  	struct media_pad *pad =3D entity->pads;
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  412  	struct media_pad *pad_err =3D pad;
57208e5e25f263 drivers/media/media-entity.c Mauro Carvalho Chehab     2015-=
08-07  413  	struct media_link *link;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  414  	int ret;
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  415  =

74a4133079f739 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  416  	if (!pipe->streaming_count++) {
20b852273642f4 drivers/media/media-entity.c Sakari Ailus              2016-=
11-21  417  		ret =3D media_graph_walk_init(&pipe->graph, mdev);
74a4133079f739 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  418  		if (ret)
74a4133079f739 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  419  			goto error_graph_walk_start;
106b9907c368e3 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  420  	}
106b9907c368e3 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  421  =

cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  422  	media_graph_walk_start(&pipe->graph, pad);
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  423  =

cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  424  	while ((pad =3D media_graph_walk_next(graph))) {
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  425  		struct media_entity *entity =3D pad->entity;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  426  		bool skip_validation =3D pad->pipe !=3D NULL;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  427  		struct media_pad *iter;
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  428  =

ef69ee1bc2c10f drivers/media/media-entity.c Mauro Carvalho Chehab     2015-=
10-01  429  		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
ef69ee1bc2c10f drivers/media/media-entity.c Mauro Carvalho Chehab     2015-=
10-01  430  		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  431  =

80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  432  		media_entity_for_each_pad(entity, iter) {
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  433  			if (iter->pipe && iter->pipe !=3D pipe) {
3eb87773dee633 drivers/media/media-entity.c Shuah Khan                2019-=
02-22  434  				pr_err("Pipe active for %s. Can't start for %s\n",
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  435  				       entity->name, iter->entity->name);
8aaf62b5b9bef7 drivers/media/media-entity.c Sakari Ailus              2015-=
11-29  436  				ret =3D -EBUSY;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  437  			} else {
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  438  				iter->pipe =3D pipe;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  439  			}
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  440  			iter->stream_count++;
8aaf62b5b9bef7 drivers/media/media-entity.c Sakari Ailus              2015-=
11-29  441  		}
8aaf62b5b9bef7 drivers/media/media-entity.c Sakari Ailus              2015-=
11-29  442  =

80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14 @443  		if (ret)
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  444  			goto error;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  445  =

80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  446  		/* Already part of the pipeline, skip validation. */
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  447  		if (skip_validation)
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  448  			continue;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  449  =

af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  450  		if (!entity->ops || !entity->ops->link_validate)
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  451  			continue;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  452  =

de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  453  		bitmap_zero(active, entity->num_pads);
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  454  		bitmap_fill(has_no_links, entity->num_pads);
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  455  =

57208e5e25f263 drivers/media/media-entity.c Mauro Carvalho Chehab     2015-=
08-07  456  		list_for_each_entry(link, &entity->links, list) {
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  457  			struct media_pad *other_pad =3D
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  458  				link->sink->entity =3D=3D entity ?
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  459  				link->sink : link->source;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  460  =

de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  461  			/* Mark that a pad is connected by a link. */
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  462  			bitmap_clear(has_no_links, other_pad->index, 1);
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  463  =

de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  464  			/*
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  465  			 * Pads that either do not need to connect or
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  466  			 * are connected through an enabled link are
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  467  			 * fine.
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  468  			 */
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  469  			if (!(other_pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  470  			    link->flags & MEDIA_LNK_FL_ENABLED)
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  471  				bitmap_set(active, other_pad->index, 1);
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  472  =

de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  473  			/*
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  474  			 * Link validation will only take place for
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  475  			 * sink ends of the link that are enabled.
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  476  			 */
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  477  			if (link->sink !=3D other_pad ||
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  478  			    !(link->flags & MEDIA_LNK_FL_ENABLED))
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  479  				continue;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  480  =

af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  481  			ret =3D entity->ops->link_validate(link);
fab9d30b7b4216 drivers/media/media-entity.c Sakari Ailus              2014-=
10-28  482  			if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
d10c98949d1a1f drivers/media/media-entity.c Javier Martinez Canillas  2015-=
08-19  483  				dev_dbg(entity->graph_obj.mdev->dev,
91b619adeb3753 drivers/media/media-entity.c Sakari Ailus              2016-=
12-08  484  					"link validation failed for '%s':%u -> '%s':%u, error %d\n=
",
823ea2a639611f drivers/media/media-entity.c Sakari Ailus              2015-=
02-12  485  					link->source->entity->name,
823ea2a639611f drivers/media/media-entity.c Sakari Ailus              2015-=
02-12  486  					link->source->index,
823ea2a639611f drivers/media/media-entity.c Sakari Ailus              2015-=
02-12  487  					entity->name, link->sink->index, ret);
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  488  				goto error;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  489  			}
fab9d30b7b4216 drivers/media/media-entity.c Sakari Ailus              2014-=
10-28  490  		}
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  491  =

de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  492  		/* Either no links or validated links are fine. */
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  493  		bitmap_or(active, active, has_no_links, entity->num_pads);
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  494  =

de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  495  		if (!bitmap_full(active, entity->num_pads)) {
47dfdb3a888733 drivers/media/media-entity.c Helen Mae Koike Fornazier 2015-=
06-28  496  			ret =3D -ENOLINK;
d10c98949d1a1f drivers/media/media-entity.c Javier Martinez Canillas  2015-=
08-19  497  			dev_dbg(entity->graph_obj.mdev->dev,
91b619adeb3753 drivers/media/media-entity.c Sakari Ailus              2016-=
12-08  498  				"'%s':%u must be connected by an enabled link\n",
fab9d30b7b4216 drivers/media/media-entity.c Sakari Ailus              2014-=
10-28  499  				entity->name,
094f1ca516cd32 drivers/media/media-entity.c Sakari Ailus              2014-=
11-03  500  				(unsigned)find_first_zero_bit(
094f1ca516cd32 drivers/media/media-entity.c Sakari Ailus              2014-=
11-03  501  					active, entity->num_pads));
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  502  			goto error;
de49c285a36049 drivers/media/media-entity.c Sakari Ailus              2013-=
10-13  503  		}
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  504  	}
e02188c90f6ef6 drivers/media/media-entity.c Laurent Pinchart          2010-=
08-25  505  =

af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  506  	return 0;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  507  =

af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  508  error:
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  509  	/*
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  510  	 * Link validation on graph failed. We revert what we did and
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  511  	 * return the error.
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  512  	 */
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  513  	media_graph_walk_start(graph, pad_err);
cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  514  =

cd448544d8c6d3 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  515  	while ((pad_err =3D media_graph_walk_next(graph))) {
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  516  		struct media_entity *entity =3D pad_err->entity;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  517  		struct media_pad *iter;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  518  =

80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  519  		media_entity_for_each_pad(entity, iter) {
12030f489ef87d drivers/media/media-entity.c Sakari Ailus              2016-=
07-20  520  			/* Sanity check for negative stream_count */
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  521  			if (!WARN_ON_ONCE(iter->stream_count <=3D 0)) {
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  522  				--iter->stream_count;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  523  				if (iter->stream_count =3D=3D 0)
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  524  					iter->pipe =3D NULL;
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  525  			}
3801bc7d1b8dd7 drivers/media/media-entity.c Shuah Khan                2016-=
01-30  526  		}
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  527  =

af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  528  		/*
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  529  		 * We haven't increased stream_count further than this
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  530  		 * so we quit here.
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  531  		 */
80dac899053d08 drivers/media/mc/mc-entity.c Sakari Ailus              2021-=
07-14  532  		if (pad_err->entity =3D=3D pad->entity)
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  533  			break;
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  534  	}
af88be3887c1a0 drivers/media/media-entity.c Sakari Ailus              2012-=
01-11  535  =

74a4133079f739 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  536  error_graph_walk_start:
74a4133079f739 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  537  	if (!--pipe->streaming_count)
20b852273642f4 drivers/media/media-entity.c Sakari Ailus              2016-=
11-21  538  		media_graph_walk_cleanup(graph);
106b9907c368e3 drivers/media/media-entity.c Sakari Ailus              2015-=
12-16  539  =

fb49f20438f361 drivers/media/media-entity.c Shuah Khan                2016-=
02-11  540  	return ret;
fb49f20438f361 drivers/media/media-entity.c Shuah Khan                2016-=
02-11  541  }
20b852273642f4 drivers/media/media-entity.c Sakari Ailus              2016-=
11-21  542  EXPORT_SYMBOL_GPL(__media_pipeline_start);
fb49f20438f361 drivers/media/media-entity.c Shuah Khan                2016-=
02-11  543  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2254975614650856076==--

