Content-Type: multipart/mixed; boundary="===============6079089121103506788=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/ti-aemif.c:210:10: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Sun, 21 Feb 2021 04:43:07 +0800
Message-ID: <202102210403.HOXoxk3O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6079089121103506788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f40ddce88593482919761f74910f42f4b84c004b
commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile tes=
ting for most of the drivers
date:   6 months ago
:::::: branch date: 6 days ago
:::::: commit date: 6 months ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/memory/ti-aemif.c:210:10: warning: Shifting signed 32-bit value =
by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    val &=3D ~CONFIG_MASK;
            ^
   drivers/memory/ti-aemif.c:249:20: warning: Shifting signed 32-bit value =
by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    data->enable_ss =3D SSTROBE_VAL(val);
                      ^

vim +210 drivers/memory/ti-aemif.c

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  159  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  160  /**
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  161   * aemif_config_abus - =
configure async bus parameters
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  162   * @pdev: platform devi=
ce to configure for
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  163   * @csnum: aemif chip s=
elect number
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  164   *
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  165   * This function progra=
ms the given timing values (in real clock) into the
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  166   * AEMIF registers taki=
ng the AEMIF clock into account.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  167   *
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  168   * This function does n=
ot use any locking while programming the AEMIF
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  169   * because it is expect=
ed that there is only one user of a given
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  170   * chip-select.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  171   *
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  172   * Returns 0 on success=
, else negative errno.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  173   */
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  174  static int aemif_config=
_abus(struct platform_device *pdev, int csnum)
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  175  {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  176  	struct aemif_device *a=
emif =3D platform_get_drvdata(pdev);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  177  	struct aemif_cs_data *=
data =3D &aemif->cs_data[csnum];
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  178  	int ta, rhold, rstrobe=
, rsetup, whold, wstrobe, wsetup;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  179  	unsigned long clk_rate=
 =3D aemif->clk_rate;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  180  	unsigned offset;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  181  	u32 set, val;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  182  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  183  	offset =3D A1CR_OFFSET=
 + (data->cs - aemif->cs_offset) * 4;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  184  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  185  	ta	=3D aemif_calc_rate=
(pdev, data->ta, clk_rate, TA_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  186  	rhold	=3D aemif_calc_r=
ate(pdev, data->rhold, clk_rate, RHOLD_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  187  	rstrobe	=3D aemif_calc=
_rate(pdev, data->rstrobe, clk_rate, RSTROBE_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  188  	rsetup	=3D aemif_calc_=
rate(pdev, data->rsetup, clk_rate, RSETUP_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  189  	whold	=3D aemif_calc_r=
ate(pdev, data->whold, clk_rate, WHOLD_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  190  	wstrobe	=3D aemif_calc=
_rate(pdev, data->wstrobe, clk_rate, WSTROBE_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  191  	wsetup	=3D aemif_calc_=
rate(pdev, data->wsetup, clk_rate, WSETUP_MAX);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  192  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  193  	if (ta < 0 || rhold < =
0 || rstrobe < 0 || rsetup < 0 ||
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  194  	    whold < 0 || wstro=
be < 0 || wsetup < 0) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  195  		dev_err(&pdev->dev, "=
%s: cannot get suitable timings\n",
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  196  			__func__);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  197  		return -EINVAL;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  198  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  199  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  200  	set =3D TA(ta) | RHOLD=
(rhold) | RSTROBE(rstrobe) | RSETUP(rsetup) |
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  201  		WHOLD(whold) | WSTROB=
E(wstrobe) | WSETUP(wsetup);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  202  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  203  	set |=3D (data->asize =
& ACR_ASIZE_MASK);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  204  	if (data->enable_ew)
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  205  		set |=3D ACR_EW_MASK;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  206  	if (data->enable_ss)
fdc482ff73215f Krzysztof Kozlowski 2020-07-24  207  		set |=3D ACR_SSTROBE_=
MASK;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  208  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  209  	val =3D readl(aemif->b=
ase + offset);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24 @210  	val &=3D ~CONFIG_MASK;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  211  	val |=3D set;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  212  	writel(val, aemif->bas=
e + offset);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  213  =

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  214  	return 0;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  215  }
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  216  =


:::::: The code at line 210 was first introduced by commit
:::::: 5a7c81547c1db7563afc005a509d1ac38d9e0884 memory: ti-aemif: introduce=
 AEMIF driver

:::::: TO: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6079089121103506788==--

