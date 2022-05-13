Content-Type: multipart/mixed; boundary="===============4614831414448474462=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 10/28] clk: tests: Add tests for single parent mux
Date: Fri, 13 May 2022 19:33:54 +0800
Message-ID: <202205131916.rO7OF4gs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4614831414448474462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220512160412.1317123-11-maxime@cerno.tech>
References: <20220512160412.1317123-11-maxime@cerno.tech>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Mike Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: linux-clk(a)vger.kernel.org
CC: Naresh Kamboju <naresh.kamboju@linaro.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Yassine Oudjana <y.oudjana@protonmail.com>
CC: Tony Lindgren <tony@atomide.com>
CC: Neil Armstrong <narmstrong@baylibre.com>
CC: Maxime Ripard <maxime@cerno.tech>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.18-rc6 next-20220512]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Mo=
re-clock-rate-fixes-and-tests/20220513-001815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-c002-20220512 (https://download.01.org/0day-ci/archi=
ve/20220513/202205131916.rO7OF4gs-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519da=
cab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/ede926b8462a345ebef=
7dccca9568e625707ac84
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-=
fixes-and-tests/20220513-001815
        git checkout ede926b8462a345ebef7dccca9568e625707ac84
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:61:61: note: expanded from ma=
cro 'STB0899_SETFIELD_VAL'
   #define STB0899_SETFIELD_VAL(bitf, mask, val)   (mask =3D (mask & (~(((1=
 << STB0899_WIDTH_##bitf) - 1) <<\
                                                            ~~~~ ^
   Suppressed 50 warnings (49 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/rtc/rtc-ds1347.c:135:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&config, 0, sizeof(config));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ds1347.c:135:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&config, 0, sizeof(config));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/firmware/memmap.c:301:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(entry, 0, sizeof(*entry));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/firmware/memmap.c:301:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(entry, 0, sizeof(*entry));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/firmware/memmap.c:372:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "0x%llx\n",
                  ^~~~~~~~
   drivers/firmware/memmap.c:372:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "0x%llx\n",
                  ^~~~~~~~
   drivers/firmware/memmap.c:378:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "0x%llx\n",
                  ^~~~~~~~
   drivers/firmware/memmap.c:378:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "0x%llx\n",
                  ^~~~~~~~
   drivers/firmware/memmap.c:384:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", entry->type);
                  ^~~~~~~~
   drivers/firmware/memmap.c:384:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", entry->type);
                  ^~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
>> drivers/clk/clk_test.c:425:14: warning: Value stored to 'clk' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:425:14: note: Value stored to 'clk' during its in=
itialization is never read
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:455:14: warning: Value stored to 'clk' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:455:14: note: Value stored to 'clk' during its in=
itialization is never read
           struct clk *clk =3D hw->clk;
                       ^~~   ~~~~~~~
   drivers/clk/clk_test.c:553:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&init, 0, sizeof(init));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/clk/clk_test.c:553:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&init, 0, sizeof(init));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/clk/clk-divider.c:330:9: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                   now =3D DIV_ROUND_UP_ULL((u64)parent_rate, i);
                         ^
   include/linux/math.h:43:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:40:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
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
   drivers/clk/clk-divider.c:316:11: note: '__UNIQUE_ID___x166' is >=3D '__=
UNIQUE_ID___y167'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);

vim +/clk +425 drivers/clk/clk_test.c

ede926b8462a34 Maxime Ripard 2022-05-12  410  =

ede926b8462a34 Maxime Ripard 2022-05-12  411  /*
ede926b8462a34 Maxime Ripard 2022-05-12  412   * Test that for a clock that=
 can't modify its rate and with a single
ede926b8462a34 Maxime Ripard 2022-05-12  413   * parent, if we set disjoint=
s range on the parent and then the child,
ede926b8462a34 Maxime Ripard 2022-05-12  414   * the second will return an =
error.
ede926b8462a34 Maxime Ripard 2022-05-12  415   *
ede926b8462a34 Maxime Ripard 2022-05-12  416   * FIXME: clk_set_rate_range(=
) only considers the current clock when
ede926b8462a34 Maxime Ripard 2022-05-12  417   * evaluating whether ranges =
are disjoints and not the upstream clocks
ede926b8462a34 Maxime Ripard 2022-05-12  418   * ranges.
ede926b8462a34 Maxime Ripard 2022-05-12  419   */
ede926b8462a34 Maxime Ripard 2022-05-12  420  static void
ede926b8462a34 Maxime Ripard 2022-05-12  421  clk_test_single_parent_mux_se=
t_range_disjoint_child_last(struct kunit *test)
ede926b8462a34 Maxime Ripard 2022-05-12  422  {
ede926b8462a34 Maxime Ripard 2022-05-12  423  	struct clk_single_parent_ctx=
 *ctx =3D test->priv;
ede926b8462a34 Maxime Ripard 2022-05-12  424  	struct clk_hw *hw =3D &ctx->=
hw;
ede926b8462a34 Maxime Ripard 2022-05-12 @425  	struct clk *clk =3D hw->clk;
ede926b8462a34 Maxime Ripard 2022-05-12  426  	struct clk *parent;
ede926b8462a34 Maxime Ripard 2022-05-12  427  	int ret;
ede926b8462a34 Maxime Ripard 2022-05-12  428  =

ede926b8462a34 Maxime Ripard 2022-05-12  429  	kunit_skip(test, "This needs=
 to be fixed in the core.");
ede926b8462a34 Maxime Ripard 2022-05-12  430  =

ede926b8462a34 Maxime Ripard 2022-05-12  431  	parent =3D clk_get_parent(cl=
k);
ede926b8462a34 Maxime Ripard 2022-05-12  432  	KUNIT_ASSERT_PTR_NE(test, pa=
rent, NULL);
ede926b8462a34 Maxime Ripard 2022-05-12  433  =

ede926b8462a34 Maxime Ripard 2022-05-12  434  	ret =3D clk_set_rate_range(p=
arent, 1000, 2000);
ede926b8462a34 Maxime Ripard 2022-05-12  435  	KUNIT_ASSERT_EQ(test, ret, 0=
);
ede926b8462a34 Maxime Ripard 2022-05-12  436  =

ede926b8462a34 Maxime Ripard 2022-05-12  437  	ret =3D clk_set_rate_range(c=
lk, 3000, 4000);
ede926b8462a34 Maxime Ripard 2022-05-12  438  	KUNIT_EXPECT_LT(test, ret, 0=
);
ede926b8462a34 Maxime Ripard 2022-05-12  439  }
ede926b8462a34 Maxime Ripard 2022-05-12  440  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4614831414448474462==--

