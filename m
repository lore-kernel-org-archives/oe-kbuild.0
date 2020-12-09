Content-Type: multipart/mixed; boundary="===============0819421243436827254=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ebiggers:mmc-crypto-testing 6/134] drivers/input/touchscreen/nt36xxx.c:353:23: warning: Same expression on both sides of '&&'.
Date: Wed, 09 Dec 2020 20:08:03 +0800
Message-ID: <202012092059.RtBnM6tf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0819421243436827254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "=C5=81ukasz Patron" <priv.luk@gmail.com>
CC: Konrad Dybcio <konrad.dybcio@somainline.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git =
mmc-crypto-testing
head:   59de920e6312f7cf742790b1aa61a1385493d66e
commit: dd7be61e322fd7a375d8d58333ca4eeea34bb4fc [6/134] Input: add Novatek=
 NT36xxx touchscreen driver
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> drivers/input/touchscreen/nt36xxx.c:36:9: warning: Uninitialized variabl=
e: retries [uninitvar]
    while (retries < 5) {
           ^
   drivers/input/touchscreen/nt36xxx.c:63:9: warning: Uninitialized variabl=
e: retries [uninitvar]
    while (retries < 5) {
           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/input/touchscreen/nt36xxx.c:353:23: warning: Same expression on =
both sides of '&&'. [duplicateExpression]
    if (nvt_i2c->lab_reg && nvt_i2c->lab_reg) {
                         ^

vim +353 drivers/input/touchscreen/nt36xxx.c

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  335  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  336  static int nvt_enable_r=
eg(struct nvt_i2c *nvt_i2c, bool enable)
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  337  {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  338  	int ret;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  339  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  340  	if (!enable) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  341  		ret =3D 0;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  342  		goto disable_ibb_reg;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  343  	}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  344  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  345  	if (nvt_i2c->vddio_reg=
) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  346  		ret =3D regulator_ena=
ble(nvt_i2c->vddio_reg);
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  347  		if (ret < 0) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  348  			dev_err(&nvt_i2c->cl=
ient->dev, "Failed to enable vddio regulator\n");
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  349  			goto exit;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  350  		}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  351  	}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  352  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02 @353  	if (nvt_i2c->lab_reg &=
& nvt_i2c->lab_reg) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  354  		ret =3D regulator_ena=
ble(nvt_i2c->lab_reg);
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  355  		if (ret < 0) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  356  			dev_err(&nvt_i2c->cl=
ient->dev, "Failed to enable lab regulator\n");
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  357  			goto disable_vddio_r=
eg;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  358  		}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  359  	}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  360  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  361  	if (nvt_i2c->ibb_reg) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  362  		ret =3D regulator_ena=
ble(nvt_i2c->ibb_reg);
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  363  		if (ret < 0) {
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  364  			dev_err(&nvt_i2c->cl=
ient->dev, "Failed to enable ibb regulator\n");
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  365  			goto disable_lab_reg;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  366  		}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  367  	}
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  368  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  369  	return 0;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  370  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  371  disable_ibb_reg:
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  372  	if (nvt_i2c->ibb_reg)
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  373  		regulator_disable(nvt=
_i2c->ibb_reg);
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  374  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  375  disable_lab_reg:
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  376  	if (nvt_i2c->lab_reg)
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  377  		regulator_disable(nvt=
_i2c->lab_reg);
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  378  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  379  disable_vddio_reg:
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  380  	if (nvt_i2c->vddio_reg)
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  381  		regulator_disable(nvt=
_i2c->vddio_reg);
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  382  =

dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  383  exit:
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  384  	return ret;
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  385  }
dd7be61e322fd7a =C5=81ukasz Patron 2020-05-02  386  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0819421243436827254==--

