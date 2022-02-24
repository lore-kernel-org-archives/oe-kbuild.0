Content-Type: multipart/mixed; boundary="===============6314569861854362777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 2/2] Input: add Imagis touchscreen driver
Date: Fri, 25 Feb 2022 03:09:48 +0800
Message-ID: <202202250109.qr1l07ts-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6314569861854362777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220222203414.8656-3-markuss.broks@gmail.com>
References: <20220222203414.8656-3-markuss.broks@gmail.com>
TO: Markuss Broks <markuss.broks@gmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: phone-devel(a)vger.kernel.org
CC: ~postmarketos/upstreaming(a)lists.sr.ht
CC: Markuss Broks <markuss.broks@gmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Henrik Rydberg <rydberg@bitmath.org>
CC: linux-input(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org

Hi Markuss,

I love your patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on linux/master robh/for-next linus/master v5.17-r=
c5 next-20220223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Markuss-Broks/Add-support-=
for-Imagis-touchscreens/20220223-043645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-m031-20220224 (https://download.01.org/0day-c=
i/archive/20220225/202202250109.qr1l07ts-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/input/touchscreen/imagis.c:305 imagis_suspend() error: uninitialize=
d symbol 'ret'.
drivers/input/touchscreen/imagis.c:321 imagis_resume() error: uninitialized=
 symbol 'ret'.

vim +/ret +305 drivers/input/touchscreen/imagis.c

bc77ee5e0d7309 Markuss Broks 2022-02-22  291  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  292  static int __maybe_unused ima=
gis_suspend(struct device *dev)
bc77ee5e0d7309 Markuss Broks 2022-02-22  293  {
bc77ee5e0d7309 Markuss Broks 2022-02-22  294  	struct i2c_client *client =
=3D to_i2c_client(dev);
bc77ee5e0d7309 Markuss Broks 2022-02-22  295  	struct imagis_ts *ts =3D i2c=
_get_clientdata(client);
bc77ee5e0d7309 Markuss Broks 2022-02-22  296  	int ret;
bc77ee5e0d7309 Markuss Broks 2022-02-22  297  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  298  	mutex_lock(&ts->input_dev->m=
utex);
bc77ee5e0d7309 Markuss Broks 2022-02-22  299  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  300  	if (input_device_enabled(ts-=
>input_dev))
bc77ee5e0d7309 Markuss Broks 2022-02-22  301  		ret =3D imagis_stop(ts);
bc77ee5e0d7309 Markuss Broks 2022-02-22  302  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  303  	mutex_unlock(&ts->input_dev-=
>mutex);
bc77ee5e0d7309 Markuss Broks 2022-02-22  304  =

bc77ee5e0d7309 Markuss Broks 2022-02-22 @305  	return ret;
bc77ee5e0d7309 Markuss Broks 2022-02-22  306  }
bc77ee5e0d7309 Markuss Broks 2022-02-22  307  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  308  static int __maybe_unused ima=
gis_resume(struct device *dev)
bc77ee5e0d7309 Markuss Broks 2022-02-22  309  {
bc77ee5e0d7309 Markuss Broks 2022-02-22  310  	struct i2c_client *client =
=3D to_i2c_client(dev);
bc77ee5e0d7309 Markuss Broks 2022-02-22  311  	struct imagis_ts *ts =3D i2c=
_get_clientdata(client);
bc77ee5e0d7309 Markuss Broks 2022-02-22  312  	int ret;
bc77ee5e0d7309 Markuss Broks 2022-02-22  313  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  314  	mutex_lock(&ts->input_dev->m=
utex);
bc77ee5e0d7309 Markuss Broks 2022-02-22  315  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  316  	if (input_device_enabled(ts-=
>input_dev))
bc77ee5e0d7309 Markuss Broks 2022-02-22  317  		ret =3D imagis_start(ts);
bc77ee5e0d7309 Markuss Broks 2022-02-22  318  =

bc77ee5e0d7309 Markuss Broks 2022-02-22  319  	mutex_unlock(&ts->input_dev-=
>mutex);
bc77ee5e0d7309 Markuss Broks 2022-02-22  320  =

bc77ee5e0d7309 Markuss Broks 2022-02-22 @321  	return ret;
bc77ee5e0d7309 Markuss Broks 2022-02-22  322  }
bc77ee5e0d7309 Markuss Broks 2022-02-22  323  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6314569861854362777==--

