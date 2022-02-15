Content-Type: multipart/mixed; boundary="===============7421837008134425563=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Date: Wed, 16 Feb 2022 04:55:52 +0800
Message-ID: <202202160402.Uh6K8l1J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7421837008134425563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220215084412.8090-2-marex@denx.de>
References: <20220215084412.8090-2-marex@denx.de>
TO: Marek Vasut <marex@denx.de>
TO: linux-clk(a)vger.kernel.org
CC: Marek Vasut <marex@denx.de>
CC: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen =
<mazziesaccount@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>
CC: devicetree(a)vger.kernel.org
CC: linux-power(a)fi.rohmeurope.com

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-cl=
k-Introduce-critical-clocks-property/20220215-164757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-c001-20220214 (https://download.01.org/0day-ci/arch=
ive/20220216/202202160402.Uh6K8l1J-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422=
f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/aded04bc3dec13df3f940621d=
94d84e32ff8a5ea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-clk-Introd=
uce-critical-clocks-property/20220215-164757
        git checkout aded04bc3dec13df3f940621d94d84e32ff8a5ea
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1893:22: note: Passing=
 'dest' via 1st parameter 'dest'
                   if (!dest_is_valid(&dest[i], flow_act, ft))
                                      ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1893:8: note: Calling =
'dest_is_valid'
                   if (!dest_is_valid(&dest[i], flow_act, ft))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1656:6: note: Assuming=
 'dest' is null
           if (dest && (dest->type =3D=3D MLX5_FLOW_DESTINATION_TYPE_COUNTE=
R))
               ^~~~
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1656:11: note: Left si=
de of '&&' is false
           if (dest && (dest->type =3D=3D MLX5_FLOW_DESTINATION_TYPE_COUNTE=
R))
                    ^
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1659:6: note: Assuming=
 the condition is false
           if (!(action & MLX5_FLOW_CONTEXT_ACTION_FWD_DEST))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1659:2: note: Taking f=
alse branch
           if (!(action & MLX5_FLOW_CONTEXT_ACTION_FWD_DEST))
           ^
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1662:6: note: Assuming=
 'ignore_level' is true
           if (ignore_level) {
               ^~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1662:2: note: Taking t=
rue branch
           if (ignore_level) {
           ^
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1663:7: note: Assuming=
 field 'type' is equal to FS_FT_FDB
                   if (ft->type !=3D FS_FT_FDB &&
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1663:29: note: Left si=
de of '&&' is false
                   if (ft->type !=3D FS_FT_FDB &&
                                             ^
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1667:7: note: Access t=
o field 'type' results in a dereference of a null pointer (loaded from vari=
able 'dest')
                   if (dest->type =3D=3D MLX5_FLOW_DESTINATION_TYPE_FLOW_TA=
BLE &&
                       ^~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/rtc/rtc-pcf2127.c:686:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-pcf2127.c:686:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/rtc/rtc-rs5c372.c:743:2: warning: Value stored to 'addr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           addr   =3D RS5C_ADDR(RS5C_REG_CTRL1);
           ^
   drivers/rtc/rtc-rs5c372.c:743:2: note: Value stored to 'addr' is never r=
ead
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/clk/clk.c:1952:3: warning: Value stored to 'best_parent_rate' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:1952:3: note: Value stored to 'best_parent_rate' is ne=
ver read
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
>> drivers/clk/clk.c:3905:4: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
                           ret =3D of_property_read_u32_index(np, "critical=
-clocks",
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/clk.c:3905:4: note: Value stored to 'ret' is never read
                           ret =3D of_property_read_u32_index(np, "critical=
-clocks",
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/clk-divider.c:330:9: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                   now =3D DIV_ROUND_UP_ULL((u64)parent_rate, i);
                         ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   arch/x86/include/asm/div64.h:33:21: note: expanded from macro 'do_div'
                           __upper =3D __high % (__base);            \
                                            ^
   drivers/clk/clk-divider.c:455:6: note: Assuming the condition is false
           if (divider->flags & CLK_DIVIDER_READ_ONLY) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:455:2: note: Taking false branch
           if (divider->flags & CLK_DIVIDER_READ_ONLY) {
           ^
   drivers/clk/clk-divider.c:466:9: note: Calling 'divider_determine_rate'
           return divider_determine_rate(hw, req, divider->table, divider->=
width,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/clk-divider.c:352:8: note: Calling 'clk_divider_bestdiv'
           div =3D clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:299:6: note: Assuming 'rate' is 0
           if (!rate)
               ^~~~~
   drivers/clk/clk-divider.c:299:2: note: Taking true branch
           if (!rate)
           ^
   drivers/clk/clk-divider.c:302:11: note: Calling '_get_maxdiv'
           maxdiv =3D _get_maxdiv(table, width, flags);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:71:6: note: Assuming the condition is false
           if (flags & CLK_DIVIDER_ONE_BASED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:71:2: note: Taking false branch
           if (flags & CLK_DIVIDER_ONE_BASED)
           ^
   drivers/clk/clk-divider.c:73:6: note: Assuming the condition is false
           if (flags & CLK_DIVIDER_POWER_OF_TWO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:73:2: note: Taking false branch
           if (flags & CLK_DIVIDER_POWER_OF_TWO)
           ^
   drivers/clk/clk-divider.c:75:6: note: Assuming 'table' is non-null, whic=
h participates in a condition later
           if (table)
               ^~~~~
   drivers/clk/clk-divider.c:75:2: note: Taking true branch
           if (table)
           ^
   drivers/clk/clk-divider.c:302:11: note: Returning from '_get_maxdiv'
           maxdiv =3D _get_maxdiv(table, width, flags);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:304:6: note: Assuming the condition is false
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:304:2: note: Taking false branch
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
           ^
   drivers/clk/clk-divider.c:316:11: note: '__UNIQUE_ID___x162' is >=3D '__=
UNIQUE_ID___y163'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/clk/clk-divider.c:316:11: note: '?' condition is false
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/clk/clk-divider.c:318:11: note: Calling '_next_div'
           for (i =3D _next_div(table, 0, flags); i <=3D maxdiv;

vim +/ret +3905 drivers/clk/clk.c

fc0c209c147f35 Stephen Boyd 2019-04-12  3874  =

aded04bc3dec13 Marek Vasut  2022-02-15  3875  static void
aded04bc3dec13 Marek Vasut  2022-02-15  3876  __clk_register_critical_clock=
(struct device_node *np, struct clk_core *core,
aded04bc3dec13 Marek Vasut  2022-02-15  3877  			      struct clk_hw *hw)
aded04bc3dec13 Marek Vasut  2022-02-15  3878  {
aded04bc3dec13 Marek Vasut  2022-02-15  3879  	struct of_phandle_args clksp=
ec;
aded04bc3dec13 Marek Vasut  2022-02-15  3880  	u32 clksize, clktotal;
aded04bc3dec13 Marek Vasut  2022-02-15  3881  	int ret, i, index;
aded04bc3dec13 Marek Vasut  2022-02-15  3882  =

aded04bc3dec13 Marek Vasut  2022-02-15  3883  	if (!np)
aded04bc3dec13 Marek Vasut  2022-02-15  3884  		return;
aded04bc3dec13 Marek Vasut  2022-02-15  3885  =

aded04bc3dec13 Marek Vasut  2022-02-15  3886  	if (!core->ops->match_clkspe=
c)
aded04bc3dec13 Marek Vasut  2022-02-15  3887  		return;
aded04bc3dec13 Marek Vasut  2022-02-15  3888  =

aded04bc3dec13 Marek Vasut  2022-02-15  3889  	if (of_property_read_u32(np,=
 "#clock-cells", &clksize))
aded04bc3dec13 Marek Vasut  2022-02-15  3890  		return;
aded04bc3dec13 Marek Vasut  2022-02-15  3891  =

aded04bc3dec13 Marek Vasut  2022-02-15  3892  	/* Clock node with #clock-ce=
lls =3D <0> uses critical-clocks; */
aded04bc3dec13 Marek Vasut  2022-02-15  3893  	if (clksize =3D=3D 0) {
aded04bc3dec13 Marek Vasut  2022-02-15  3894  		if (of_property_read_bool(n=
p, "critical-clocks") &&
aded04bc3dec13 Marek Vasut  2022-02-15  3895  		    !core->ops->match_clksp=
ec(hw, &clkspec))
aded04bc3dec13 Marek Vasut  2022-02-15  3896  			core->flags |=3D CLK_IS_CR=
ITICAL;
aded04bc3dec13 Marek Vasut  2022-02-15  3897  		return;
aded04bc3dec13 Marek Vasut  2022-02-15  3898  	}
aded04bc3dec13 Marek Vasut  2022-02-15  3899  =

aded04bc3dec13 Marek Vasut  2022-02-15  3900  	clkspec.np =3D np;
aded04bc3dec13 Marek Vasut  2022-02-15  3901  	clktotal =3D of_property_cou=
nt_u32_elems(np, "critical-clocks");
aded04bc3dec13 Marek Vasut  2022-02-15  3902  	clktotal /=3D clksize;
aded04bc3dec13 Marek Vasut  2022-02-15  3903  	for (index =3D 0; index < cl=
ktotal; index++) {
aded04bc3dec13 Marek Vasut  2022-02-15  3904  		for (i =3D 0; i < clksize; =
i++) {
aded04bc3dec13 Marek Vasut  2022-02-15 @3905  			ret =3D of_property_read_u=
32_index(np, "critical-clocks",
aded04bc3dec13 Marek Vasut  2022-02-15  3906  							 (index * clksize) + i,
aded04bc3dec13 Marek Vasut  2022-02-15  3907  							 &(clkspec.args[i]));
aded04bc3dec13 Marek Vasut  2022-02-15  3908  		}
aded04bc3dec13 Marek Vasut  2022-02-15  3909  		if (!core->ops->match_clksp=
ec(hw, &clkspec))
aded04bc3dec13 Marek Vasut  2022-02-15  3910  			core->flags |=3D CLK_IS_CR=
ITICAL;
aded04bc3dec13 Marek Vasut  2022-02-15  3911  	}
aded04bc3dec13 Marek Vasut  2022-02-15  3912  }
aded04bc3dec13 Marek Vasut  2022-02-15  3913  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7421837008134425563==--

