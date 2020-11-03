Content-Type: multipart/mixed; boundary="===============1233644089979368745=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/wcd934x.c:1571:9: warning: Identical condition 'ret', second condition is always false
Date: Tue, 03 Nov 2020 14:21:30 +0800
Message-ID: <202011031426.TJ8YX4qF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1233644089979368745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b7cbaf59f62f8ab8f157698f9e31642bff525bd0
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk =
framework to be selectable
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/wcd934x.c:1571:9: warning: Identical condition 'ret', s=
econd condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   sound/soc/codecs/wcd934x.c:1568:6: note: first condition
    if (ret)
        ^
   sound/soc/codecs/wcd934x.c:1571:9: note: second condition
    return ret;
           ^

vim +/ret +1571 sound/soc/codecs/wcd934x.c

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1544  =

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1545  static int wcd934x_se=
t_interpolator_rate(struct snd_soc_dai *dai,
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1546  					 u32 sample_rate)
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1547  {
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1548  	int rate_val =3D 0;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1549  	int i, ret;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1550  =

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1551  	for (i =3D 0; i < AR=
RAY_SIZE(sr_val_tbl); i++) {
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1552  		if (sample_rate =3D=
=3D sr_val_tbl[i].sample_rate) {
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1553  			rate_val =3D sr_va=
l_tbl[i].rate_val;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1554  			break;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1555  		}
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1556  	}
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1557  	if ((i =3D=3D ARRAY_=
SIZE(sr_val_tbl)) || (rate_val < 0)) {
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1558  		dev_err(dai->dev, "=
Unsupported sample rate: %d\n", sample_rate);
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1559  		return -EINVAL;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1560  	}
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1561  =

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1562  	ret =3D wcd934x_set_=
prim_interpolator_rate(dai, (u8)rate_val,
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1563  						 sample_rate);
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1564  	if (ret)
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1565  		return ret;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1566  	ret =3D wcd934x_set_=
mix_interpolator_rate(dai, (u8)rate_val,
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1567  						sample_rate);
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1568  	if (ret)
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1569  		return ret;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1570  =

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19 @1571  	return ret;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1572  }
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1573  =


:::::: The code at line 1571 was first introduced by commit
:::::: a61f3b4f476eceb25274161e5a53a8d18e42610b ASoC: wcd934x: add support =
to wcd9340/wcd9341 codec

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1233644089979368745==--

