Content-Type: multipart/mixed; boundary="===============8066904692316319405=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/pl330.c:2981:9: warning: Identical condition 'ret', second condition is always false
Date: Mon, 21 Sep 2020 19:15:55 +0800
Message-ID: <202009211949.t4KKF39m%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8066904692316319405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ulf Hansson <ulf.hansson@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ba4f184e126b751d1bffad5897f263108befc780
commit: a39cddc9e3775100100a4272feed64faac831be9 dmaengine: pl330: Drop boi=
lerplate code for suspend/resume
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma/pl330.c:2981:9: warning: Identical condition 'ret', second c=
ondition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/dma/pl330.c:2976:6: note: first condition
    if (ret)
        ^
   drivers/dma/pl330.c:2981:9: note: second condition
    return ret;
           ^
   drivers/dma/pl330.c:2798:23: warning: Variable 'desc->rqcfg.brst_len' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    desc->rqcfg.brst_len =3D get_burst_len(desc, len);
                         ^
   drivers/dma/pl330.c:2796:24: note: Variable 'desc->rqcfg.brst_len' is re=
assigned a value before the old one has been used.
     desc->rqcfg.brst_len =3D 1;
                          ^
   drivers/dma/pl330.c:2798:23: note: Variable 'desc->rqcfg.brst_len' is re=
assigned a value before the old one has been used.
    desc->rqcfg.brst_len =3D get_burst_len(desc, len);
                         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da39cddc9e3775100100a4272feed64faac831be9
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout a39cddc9e3775100100a4272feed64faac831be9
vim +/ret +2981 drivers/dma/pl330.c

b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2969  =

b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2970  static int __maybe_unu=
sed pl330_resume(struct device *dev)
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2971  {
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2972  	struct amba_device *p=
cdev =3D to_amba_device(dev);
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2973  	int ret;
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2974  =

b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2975  	ret =3D amba_pclk_pre=
pare(pcdev);
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2976  	if (ret)
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2977  		return ret;
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2978  =

a39cddc9e37751 Ulf Hansson         2019-12-05  2979  	pm_runtime_force_resu=
me(dev);
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2980  =

b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18 @2981  	return ret;
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2982  }
b816ccc5c01fb7 Krzysztof Kozlowski 2014-11-18  2983  =


:::::: The code at line 2981 was first introduced by commit
:::::: b816ccc5c01fb7fe1fb001ff7aa5aa7e5a8aa76b ARM: 8206/1: dmaengine: pl3=
30: Add PM sleep support

:::::: TO: Krzysztof Kozlowski <k.kozlowski@samsung.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8066904692316319405==--

