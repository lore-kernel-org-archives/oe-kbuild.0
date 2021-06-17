Content-Type: multipart/mixed; boundary="===============1420184125580640865=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/stm/stm32_sai_sub.c:386:22: warning: Either the condition 'div<0' is redundant or there is division by zero@line 386. [zerodivcond]
Date: Thu, 17 Jun 2021 18:58:17 +0800
Message-ID: <202106171805.Ia7CKAab-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1420184125580640865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   70585216fe7730d9fb5453d3e2804e149d0fe201
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   10 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 weeks ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/stm/stm32_sai_sub.c:386:22: warning: Either the condition 'div=
<0' is redundant or there is division by zero@line 386. [zerodivcond]
    mclk->freq =3D *prate / div;
                        ^
   sound/soc/stm/stm32_sai_sub.c:383:10: note: Assuming that condition 'div=
<0' is not redundant
    if (div < 0)
            ^
   sound/soc/stm/stm32_sai_sub.c:386:22: note: Division by zero
    mclk->freq =3D *prate / div;
                        ^

vim +386 sound/soc/stm/stm32_sai_sub.c

e37c2deafe7058 Olivier Moysan 2019-04-10  374  =

8307b2afd386cc Olivier Moysan 2018-10-15  375  static long stm32_sai_mclk_r=
ound_rate(struct clk_hw *hw, unsigned long rate,
8307b2afd386cc Olivier Moysan 2018-10-15  376  				      unsigned long *pra=
te)
8307b2afd386cc Olivier Moysan 2018-10-15  377  {
8307b2afd386cc Olivier Moysan 2018-10-15  378  	struct stm32_sai_mclk_data =
*mclk =3D to_mclk_data(hw);
8307b2afd386cc Olivier Moysan 2018-10-15  379  	struct stm32_sai_sub_data *=
sai =3D mclk->sai_data;
8307b2afd386cc Olivier Moysan 2018-10-15  380  	int div;
8307b2afd386cc Olivier Moysan 2018-10-15  381  =

8307b2afd386cc Olivier Moysan 2018-10-15  382  	div =3D stm32_sai_get_clk_d=
iv(sai, *prate, rate);
8307b2afd386cc Olivier Moysan 2018-10-15  383  	if (div < 0)
8307b2afd386cc Olivier Moysan 2018-10-15  384  		return div;
8307b2afd386cc Olivier Moysan 2018-10-15  385  =

8307b2afd386cc Olivier Moysan 2018-10-15 @386  	mclk->freq =3D *prate / div;
8307b2afd386cc Olivier Moysan 2018-10-15  387  =

8307b2afd386cc Olivier Moysan 2018-10-15  388  	return mclk->freq;
8307b2afd386cc Olivier Moysan 2018-10-15  389  }
8307b2afd386cc Olivier Moysan 2018-10-15  390  =


:::::: The code at line 386 was first introduced by commit
:::::: 8307b2afd386ccce369821daa2196068c47fe8cd ASoC: stm32: sai: set sai a=
s mclk clock provider

:::::: TO: Olivier Moysan <olivier.moysan@st.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1420184125580640865==--

