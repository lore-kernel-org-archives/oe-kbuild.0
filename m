Content-Type: multipart/mixed; boundary="===============5142923063604602256=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [char-misc:char-misc-linus 1/1] drivers/slimbus/qcom-ctrl.c:514:2-9: line 514 is redundant because platform_get_irq() already prints an error
Date: Tue, 10 May 2022 07:10:46 +0800
Message-ID: <202205100730.LEVP50Zt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5142923063604602256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Miaoqian Lin <linmq006@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-linus
head:   fe503887eed6ea528e144ec8dacfa1d47aa701ac
commit: fe503887eed6ea528e144ec8dacfa1d47aa701ac [1/1] slimbus: qcom: Fix I=
RQ check in qcom_slim_probe
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20220510/=
202205100730.LEVP50Zt-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/slimbus/qcom-ctrl.c:514:2-9: line 514 is redundant because platf=
orm_get_irq() already prints an error

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5142923063604602256==--

