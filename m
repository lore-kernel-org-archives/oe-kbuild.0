Content-Type: multipart/mixed; boundary="===============6201694159535157167=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/ralink/clk-mt7621.c:50:8: warning: Excessive padding in 'struct mt7621_gate' (11 padding bytes, where 3 is optimal).
Date: Tue, 22 Feb 2022 12:07:30 +0800
Message-ID: <202202221210.vmq1ia3F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6201694159535157167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   038101e6b2cd5c55f888f85db42ea2ad3aecb4b6
commit: 48df7a26f4700aac8b7e5ab68796daf25c27e062 clk: ralink: add clock dri=
ver for mt7621 SoC
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20220217 (https://download.01.org/0day-ci/arc=
hive/20220222/202202221210.vmq1ia3F-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7c=
b56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D48df7a26f4700aac8b7e5ab68796daf25c27e062
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 48df7a26f4700aac8b7e5ab68796daf25c27e062
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/math/rational.c:82:35: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                                                 (max_denominator - d0) / d=
1);
                                                                        ^
   include/linux/minmax.h:51:36: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                            ^
   include/linux/minmax.h:44:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:38:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   lib/math/rational.c:52:7: note: The value 0 is assigned to 'd1'
           n0 =3D d1 =3D 0;
                ^~~~~~
   lib/math/rational.c:55:2: note: Loop condition is true.  Entering loop b=
ody
           for (;;) {
           ^
   lib/math/rational.c:58:7: note: Assuming 'd' is not equal to 0
                   if (d =3D=3D 0)
                       ^~~~~~
   lib/math/rational.c:58:3: note: Taking false branch
                   if (d =3D=3D 0)
                   ^
   lib/math/rational.c:80:8: note: Assuming 'n2' is > 'max_numerator'
                   if ((n2 > max_numerator) || (d2 > max_denominator)) {
                        ^~~~~~~~~~~~~~~~~~
   lib/math/rational.c:80:28: note: Left side of '||' is true
                   if ((n2 > max_numerator) || (d2 > max_denominator)) {
                                            ^
   lib/math/rational.c:82:35: note: Division by zero
                                                 (max_denominator - d0) / d=
1);
                                                                        ^
   include/linux/minmax.h:51:36: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                            ^
   include/linux/minmax.h:44:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:38:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/clk/ralink/clk-mt7621.c:50:8: warning: Excessive padding in 'str=
uct mt7621_gate' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   parent_name, =

   priv, =

   hw, =

   bit_idx, =

   idx, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct mt7621_gate {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/clk/ralink/clk-mt7621.c:50:8: note: Excessive padding in 'struct=
 mt7621_gate' (11 padding bytes, where 3 is optimal). Optimal fields order:=
 name, parent_name, priv, hw, bit_idx, idx, consider reordering the fields =
or adding explicit padding members
   struct mt7621_gate {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/pinctrl/samsung/pinctrl-samsung.c:1065:19: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   bank->eint_base =3D virt_base[0];
                                   ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1102:6: note: Assuming 'drvdat=
a' is non-null
           if (!drvdata)
               ^~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1102:2: note: Taking false bra=
nch
           if (!drvdata)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1105:9: note: Calling 'samsung=
_pinctrl_get_soc_data'
           ctrl =3D samsung_pinctrl_get_soc_data(drvdata, pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Calling 'samsung=
_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:6: note: Assuming 'id' is =
>=3D 0
           if (id < 0) {
               ^~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:2: note: Taking false bran=
ch
           if (id < 0) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:6: note: Assuming 'id' is =
< field 'num_ctrl'
           if (id >=3D of_data->num_ctrl) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:2: note: Taking false bran=
ch
           if (id >=3D of_data->num_ctrl) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1002:2: note: Returning pointe=
r, which participates in a condition later
           return &(of_data->ctrl[id]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Returning from '=
samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:6: note: Assuming 'ctrl' =
is non-null
           if (!ctrl)
               ^~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:2: note: Taking false bra=
nch
           if (!ctrl)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Calling 'devm_k=
calloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^

vim +50 drivers/clk/ralink/clk-mt7621.c

48df7a26f4700a Sergio Paracuellos 2021-04-10  49  =

48df7a26f4700a Sergio Paracuellos 2021-04-10 @50  struct mt7621_gate {
48df7a26f4700a Sergio Paracuellos 2021-04-10  51  	u8 idx;
48df7a26f4700a Sergio Paracuellos 2021-04-10  52  	const char *name;
48df7a26f4700a Sergio Paracuellos 2021-04-10  53  	const char *parent_name;
48df7a26f4700a Sergio Paracuellos 2021-04-10  54  	struct mt7621_clk_priv *=
priv;
48df7a26f4700a Sergio Paracuellos 2021-04-10  55  	u32 bit_idx;
48df7a26f4700a Sergio Paracuellos 2021-04-10  56  	struct clk_hw hw;
48df7a26f4700a Sergio Paracuellos 2021-04-10  57  };
48df7a26f4700a Sergio Paracuellos 2021-04-10  58  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6201694159535157167==--

