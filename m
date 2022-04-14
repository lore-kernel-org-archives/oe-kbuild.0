Content-Type: multipart/mixed; boundary="===============1527521933280920800=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v2 14/16] drivers/opp/core.c:1215:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Thu, 14 Apr 2022 23:31:37 +0800
Message-ID: <202204142327.zrhNmG2E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1527521933280920800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v2
head:   bf7d30c9329c87f06dff42b303a9bcfd2e1f54eb
commit: be46c855d54f763bfb95424e5204fe7496e2ee5f [14/16] PM: opp: allow con=
trol of multiple clocks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220414 (https://download.01.org/0day-ci/archi=
ve/20220414/202204142327.zrhNmG2E-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6e=
a489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/krzk/linux/commit/be46c855d54f763bfb95424e5204=
fe7496e2ee5f
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/qcom-ufs-opp-v2
        git checkout be46c855d54f763bfb95424e5204fe7496e2ee5f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~   ~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/counter/microchip-tcb-capture.c:337:3: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
                   ^~~~~~~~
   drivers/counter/microchip-tcb-capture.c:337:3: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
                   ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   lib/test_meminit.c:55:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&p[i], GARBAGE_BYTE, size);
                   ^~~~~~
   lib/test_meminit.c:55:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&p[i], GARBAGE_BYTE, size);
                   ^~~~~~
   lib/test_meminit.c:245:4: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf_copy, buf, size);
                           ^~~~~~
   lib/test_meminit.c:245:4: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                           memcpy(buf_copy, buf, size);
                           ^~~~~~
   lib/test_meminit.c:297:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf_contents, buf, size);
           ^~~~~~
   lib/test_meminit.c:297:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(buf_contents, buf, size);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/opp/core.c:914:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->old_opp.supplies, old_opp->supplies, size);
                   ^~~~~~
   drivers/opp/core.c:914:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(data->old_opp.supplies, old_opp->supplies, size);
                   ^~~~~~
   drivers/opp/core.c:915:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->new_opp.supplies, opp->supplies, size);
                   ^~~~~~
   drivers/opp/core.c:915:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(data->new_opp.supplies, opp->supplies, size);
                   ^~~~~~
>> drivers/opp/core.c:1215:2: warning: Undefined or garbage value returned =
to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/opp/core.c:1160:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   drivers/opp/core.c:1163:2: note: Taking false branch
           if (IS_ERR(opp_table)) {
           ^
   drivers/opp/core.c:1168:6: note: Assuming 'target_freq' is not equal to 0
           if (target_freq) {
               ^~~~~~~~~~~
   drivers/opp/core.c:1168:2: note: Taking true branch
           if (target_freq) {
           ^
   drivers/opp/core.c:1176:7: note: Assuming the condition is true
                   if (!_get_opp_count(opp_table)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/opp/core.c:1176:3: note: Taking true branch
                   if (!_get_opp_count(opp_table)) {
                   ^
   drivers/opp/core.c:1177:8: note: Assuming field 'clks' is null
                           if (opp_table->clks)
                               ^~~~~~~~~~~~~~~
   drivers/opp/core.c:1177:4: note: Taking false branch
                           if (opp_table->clks)
                           ^
   drivers/opp/core.c:1181:4: note: Control jumps to line 1214
                           goto put_opp_table;
                           ^
   drivers/opp/core.c:1215:2: note: Undefined or garbage value returned to =
caller
           return ret;
           ^      ~~~
   Suppressed 42 warnings (41 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/opp/of.c:586:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "opp-microvolt-%s",
                   ^~~~~~~~
   drivers/opp/of.c:586:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "opp-microvolt-%s",
                   ^~~~~~~~
   drivers/opp/of.c:593:3: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "opp-microvolt");
                   ^~~~~~~
   drivers/opp/of.c:593:3: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
                   sprintf(name, "opp-microvolt");
                   ^~~~~~~
   drivers/opp/of.c:649:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "opp-microamp-%s",
                   ^~~~~~~~
   drivers/opp/of.c:649:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "opp-microamp-%s",
                   ^~~~~~~~
   drivers/opp/of.c:656:3: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "opp-microamp");
                   ^~~~~~~
   drivers/opp/of.c:656:3: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
                   sprintf(name, "opp-microamp");
                   ^~~~~~~
   drivers/opp/of.c:693:2: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "opp-microwatt");
           ^~~~~~~
   drivers/opp/of.c:693:2: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           sprintf(name, "opp-microwatt");
           ^~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/clk/clk-si5341.c:691:2: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
           err =3D si5341_encode_44_32(synth->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:691:2: note: Value stored to 'err' is never read
           err =3D si5341_encode_44_32(synth->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:856:23: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                   rate =3D *parent_rate / (r << 1);
                          ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/clk/clk-si5341.c:835:6: note: Assuming 'rate' is not equal to 0
           if (!rate)
               ^~~~~
   drivers/clk/clk-si5341.c:835:2: note: Taking false branch
           if (!rate)
           ^
   drivers/clk/clk-si5341.c:841:6: note: Assuming 'r' is 0
           if (r && !(r % rate))
               ^
   drivers/clk/clk-si5341.c:841:8: note: Left side of '&&' is false
           if (r && !(r % rate))
                 ^
   drivers/clk/clk-si5341.c:844:6: note: Assuming the condition is false
           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:844:2: note: Taking false branch
           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
           ^
   drivers/clk/clk-si5341.c:856:23: note: Division by zero
                   rate =3D *parent_rate / (r << 1);

vim +1215 drivers/opp/core.c

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1143  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1144  /**
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1145   * dev_pm_opp_set_rate() - Configure new OPP based on frequency
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1146   * @dev:	 device for which we do this operation
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1147   * @target_freq: frequency to achieve
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1148   *
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1149   * This configures the power-supplies to the levels specified by th=
e OPP
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1150   * corresponding to the target_freq, and programs the clock to a va=
lue <=3D
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1151   * target_freq, as rounded by clk_round_rate(). Device wanting to r=
un@fmax
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1152   * provided by the opp, should have already rounded to the target O=
PP's
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1153   * frequency.
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1154   */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1155  int dev_pm_opp_set_rate(struct device *dev, unsigned long target_fr=
eq)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1156  {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1157  	struct opp_table *opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1158  	unsigned long freq =3D 0, temp_freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1159  	struct dev_pm_opp *opp =3D NULL;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1160  	int ret;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1161  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1162  	opp_table =3D _find_opp_table(dev);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1163  	if (IS_ERR(opp_table)) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1164  		dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1165  		return PTR_ERR(opp_table);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1166  	}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1167  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1168  	if (target_freq) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1169  		/*
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1170  		 * For IO devices which require an OPP on some platforms/SoCs
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1171  		 * while just needing to scale the clock on some others
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1172  		 * we look for empty OPP tables with just a clock handle and
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1173  		 * scale only the clk. This makes dev_pm_opp_set_rate()
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1174  		 * equivalent to a clk_set_rate()
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1175  		 */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1176  		if (!_get_opp_count(opp_table)) {
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1177  			if (opp_table->clks)
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1178  				ret =3D _generic_set_opp_clk_only(dev,
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1179  								opp_table->clks[0],
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1180  								target_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1181  			goto put_opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1182  		}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1183  =

be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1184  		if (opp_table->clks)
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1185  			freq =3D clk_round_rate(opp_table->clks[0], target_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1186  		if ((long)freq <=3D 0)
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1187  			freq =3D target_freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1188  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1189  		/*
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1190  		 * The clock driver may support finer resolution of the
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1191  		 * frequencies than the OPP table, don't update the frequency we
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1192  		 * pass to clk_set_rate() here.
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1193  		 */
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1194  		temp_freq =3D freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1195  		opp =3D _find_freq_ceil(opp_table, &temp_freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1196  		if (IS_ERR(opp)) {
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1197  			ret =3D PTR_ERR(opp);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1198  			dev_err(dev, "%s: failed to find OPP for freq %lu (%d)\n",
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1199  				__func__, freq, ret);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1200  			goto put_opp_table;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1201  		}
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1202  		/*
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1203  		 * opp->rates are used for scaling clocks, so be sure accurate
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1204  		 * 'freq' is used, instead what was defined via e.g. Devicetree.
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1205  		 */
be46c855d54f76 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-05=
  1206  		opp->rates[0] =3D freq;
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1207  	}
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1208  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1209  	ret =3D _set_opp(dev, opp_table, opp, freq);
386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1210  =

386ba854d9f316 drivers/opp/core.c            Viresh Kumar        2021-01-21=
  1211  	if (target_freq)
8a31d9d94297b1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1212  		dev_pm_opp_put(opp);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1213  put_opp_table:
5b650b388844f2 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
  1214  	dev_pm_opp_put_opp_table(opp_table);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar        2017-01-23=
 @1215  	return ret;
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1216  }
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1217  EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
6a0712f6f199e7 drivers/base/power/opp/core.c Viresh Kumar        2016-02-09=
  1218  =


:::::: The code at line 1215 was first introduced by commit
:::::: 052c6f19141dd13f266cc465fde6f38ddc93d5fb PM / OPP: Move away from RC=
U locking

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1527521933280920800==--

