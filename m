Content-Type: multipart/mixed; boundary="===============1456690912168448345=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/5] media: xc2028: rename the driver from tuner-xc2028
Date: Sat, 12 Mar 2022 01:28:34 +0800
Message-ID: <202203120100.XSFDxLze-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1456690912168448345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <b0fed7364a4aa503bcf6bd6693bb047f5da4335f.1646842741.git.mcheh=
ab@kernel.org>
References: <b0fed7364a4aa503bcf6bd6693bb047f5da4335f.1646842741.git.mcheha=
b@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220308]
[also build test WARNING on v5.17-rc7]
[cannot apply to media-tree/master linux/master linus/master v5.17-rc7 v5.1=
7-rc6 v5.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/medi=
a-sort-Makefile-entries/20220310-011503
base:    cb153b68ff91cbc434f3de70ac549e110543e1bb
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220310 (https://download.01.org/0day-ci/archi=
ve/20220312/202203120100.XSFDxLze-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/1c9c0f68ece3b18557287bbde=
4f469aa97c8ee75
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/media-sort-M=
akefile-entries/20220310-011503
        git checkout 1c9c0f68ece3b18557287bbde4f469aa97c8ee75
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:838:19: note: Returning from 'devm_k=
calloc'
           adc->iio_chans =3D devm_kcalloc(adc->dev, adc->nchans,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:840:6: note: Assuming field 'iio_cha=
ns' is non-null
           if (!adc->iio_chans)
               ^~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:840:2: note: Taking false branch
           if (!adc->iio_chans)
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:843:15: note: Calling 'devm_kcalloc'
           adc->chans =3D devm_kcalloc(adc->dev, adc->nchans,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:216:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:219:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:843:15: note: Returning from 'devm_k=
calloc'
           adc->chans =3D devm_kcalloc(adc->dev, adc->nchans,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:845:6: note: Assuming field 'chans' =
is non-null
           if (!adc->chans)
               ^~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:845:2: note: Taking false branch
           if (!adc->chans)
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:849:39: note: Assuming 'child' is no=
t equal to null
           for_each_available_child_of_node(np, child) {
                                                ^
   include/linux/of.h:1371:58: note: expanded from macro 'for_each_availabl=
e_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
                                                                   ^~~~~~~~=
~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:849:2: note: Loop condition is true.=
  Entering loop body
           for_each_available_child_of_node(np, child) {
           ^
   include/linux/of.h:1371:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:852:8: note: Passing value via 3rd p=
arameter 'hw_channels'
                                                    adc->variant->channels,
                                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:851:9: note: Calling 'pm8xxx_xoadc_p=
arse_channel'
                   ret =3D pm8xxx_xoadc_parse_channel(adc->dev, child,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:748:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:748:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:753:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:753:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:760:2: note: Value assigned to 'hwch=
an'
           hwchan =3D &hw_channels[0];
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:761:9: note: Assuming 'hwchan' is nu=
ll
           while (hwchan && hwchan->datasheet_name) {
                  ^~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:761:16: note: Left side of '&&' is f=
alse
           while (hwchan && hwchan->datasheet_name) {
                         ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:769:7: note: Access to field 'datash=
eet_name' results in a dereference of a null pointer (loaded from variable =
'hwchan')
           if (!hwchan->datasheet_name) {
                ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/media/tuners/xc2028.c:1037:3: warning: Value stored to 'rc' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/xc2028.c:1037:3: note: Value stored to 'rc' is neve=
r read
   Suppressed 13 warnings (11 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (11 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (11 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (11 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/iio/proximity/vcnl3020.c:76:8: warning: Excessive padding in 'st=
ruct vcnl3020_data' (45 padding bytes, where 13 is optimal). =

   Optimal fields order: =

   buf, =

   rev, =

   regmap, =

   dev, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/proximity/vcnl3020.c:76:8: note: Excessive padding in 'struc=
t vcnl3020_data' (45 padding bytes, where 13 is optimal). Optimal fields or=
der: buf, rev, regmap, dev, lock, consider reordering the fields or adding =
explicit padding members
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/media/i2c/ov2659.c:895:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:895:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:986:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:986:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1002:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1002:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1028:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1028:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1151:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1151:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1160:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1160:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1312:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1312:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/fpga/dfl-afu-dma-region.c:38:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:38:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:86:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~

vim +/rc +1037 drivers/media/tuners/xc2028.c

6cb45879dca84c drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-02  1007  =

00deff1a076dc1 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-24  1008  static int generic_set_freq(struct dvb_frontend *fe,=
 u32 freq /* in HZ */,
aa40d194975e23 drivers/media/common/tuners/tuner-xc2028.c Hans Verkuil     =
     2011-03-06  1009  			    enum v4l2_tuner_type new_type,
00deff1a076dc1 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-24  1010  			    unsigned int type,
66c2d53db28276 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-25  1011  			    v4l2_std_id std,
66c2d53db28276 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-25  1012  			    u16 int_freq)
6cb45879dca84c drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-02  1013  {
215b95baf969c6 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-23  1014  	struct xc2028_data *priv =3D fe->tuner_priv;
215b95baf969c6 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-23  1015  	int		   rc =3D -EINVAL;
2ce4b3aa7c3c19 drivers/media/video/tuner-xc2028.c         Chris Pascoe     =
     2007-11-19  1016  	unsigned char	   buf[4];
701672eb738739 drivers/media/video/tuner-xc2028.c         Michel Ludwig    =
     2007-07-18  1017  	u32		   div, offset =3D 0;
6cb45879dca84c drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-02  1018  =

7e28adb2497f6b drivers/media/video/tuner-xc2028.c         Harvey Harrison  =
     2008-04-08  1019  	tuner_dbg("%s called\n", __func__);
215b95baf969c6 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-23  1020  =

de3fe21ba2fdc0 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-24  1021  	mutex_lock(&priv->lock);
de3fe21ba2fdc0 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-24  1022  =

2ce4b3aa7c3c19 drivers/media/video/tuner-xc2028.c         Chris Pascoe     =
     2007-11-19  1023  	tuner_dbg("should set frequency %d kHz\n", freq / 1=
000);
6cb45879dca84c drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-10-02  1024  =

66c2d53db28276 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-25  1025  	if (check_firmware(fe, type, std, int_freq) < 0)
3b20532c791399 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-09-27  1026  		goto ret;
2e4160ca8046e3 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-07-18  1027  =

2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1028  	/* On some cases xc2028 can disable video output, if
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1029  	 * very weak signals are received. By sending a soft
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1030  	 * reset, this is re-enabled. So, it is better to a=
lways
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1031  	 * send a soft reset before changing channels, to b=
e sure
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1032  	 * that xc2028 will be in a safe state.
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1033  	 * Maybe this might also be needed for DTV.
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22  1034  	 */
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1035  	switch (new_type) {
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1036  	case V4L2_TUNER_ANALOG_TV:
2800ae9cd669db drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-11-22 @1037  		rc =3D send_seq(priv, {0x00, 0x00});
0a863975e28866 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2009-06-01  1038  =

fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1039  		/* Analog mode requires offset =3D 0 */
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1040  		break;
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1041  	case V4L2_TUNER_RADIO:
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1042  		/* Radio mode requires offset =3D 0 */
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1043  		break;
fd34cb08babcd8 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2011-08-31  1044  	case V4L2_TUNER_DIGITAL_TV:
0a863975e28866 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2009-06-01  1045  		/*
0a863975e28866 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2009-06-01  1046  		 * Digital modes require an offset to adjust to the
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1047  		 * proper frequency. The offset depends on what
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1048  		 * firmware version is used.
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1049  		 */
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1050  =

7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1051  		/*
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1052  		 * Adjust to the center frequency. This is calcula=
ted by the
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1053  		 * formula: offset =3D 1.25MHz - BW/2
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1054  		 * For DTV 7/8, the firmware uses BW =3D 8000, so =
it needs a
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1055  		 * further adjustment to get the frequency center =
on VHF
0a863975e28866 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2009-06-01  1056  		 */
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1057  =

98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1058  		/*
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1059  		 * The firmware DTV78 used to work fine in UHF ban=
d (8 MHz
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1060  		 * bandwidth) but not@all in VHF band (7 MHz ba=
ndwidth).
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1061  		 * The real problem was connected to the formula u=
sed to
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1062  		 * calculate the center frequency offset in VHF ba=
nd.
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1063  		 * In fact, removing the 500KHz adjustment fixed t=
he problem.
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1064  		 * This is coherent to what was implemented for th=
e DTV7
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1065  		 * firmware.
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1066  		 * In the end, now the center frequency is the sam=
e for all 3
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1067  		 * firmwares (DTV7, DTV8, DTV78) and doesn't depen=
d on channel
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1068  		 * bandwidth.
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1069  		 */
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1070  =

0a863975e28866 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2009-06-01  1071  		if (priv->cur_fw.type & DTV6)
d536c9df41f5e4 drivers/media/video/tuner-xc2028.c         Michael Krufky   =
     2007-12-18  1072  			offset =3D 1750000;
98ab8550aea472 drivers/media/common/tuners/tuner-xc2028.c Gianluca Gennari =
     2012-01-04  1073  		else	/* DTV7 or DTV8 or DTV78 */
d4e7668104f7f1 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Ch=
ehab 2007-07-18  1074  			offset =3D 2750000;
0a863975e28866 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2009-06-01  1075  =

897b842296f128 drivers/media/video/tuner-xc2028.c         Chris Pascoe     =
     2007-12-02  1076  		/*
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1077  		 * xc3028 additional "magic"
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1078  		 * Depending on the firmware version, it needs som=
e adjustments
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1079  		 * to properly centralize the frequency. This seem=
s to be
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1080  		 * needed to compensate the SCODE table adjustment=
s made by
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1081  		 * newer firmwares
897b842296f128 drivers/media/video/tuner-xc2028.c         Chris Pascoe     =
     2007-12-02  1082  		 */
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1083  =

7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1084  		/*
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1085  		 * The proper adjustment would be to do it at s-co=
de table.
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1086  		 * However, this didn't work, as reported by
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1087  		 * Robert Lowery <rglowery@exemail.com.au>
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1088  		 */
7f2199c03b4946 drivers/media/common/tuners/tuner-xc2028.c Mauro Carvalho Ch=
ehab 2010-02-19  1089  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1456690912168448345==--

