Content-Type: multipart/mixed; boundary="===============3454264989259332463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/ti-abb-regulator.c:485:15: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Wed, 23 Mar 2022 04:20:10 +0800
Message-ID: <202203230401.8oh2cdUw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3454264989259332463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b47d5a4f6b8d42f8a8fbe891b36215e4fddc53be
commit: b36061c2ea5bdacf51305f8bc79f29595b343eb6 regulator: ti-abb: Kconfig=
: Add helper dependency on COMPILE_TEST
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220323/202203230401.8oh2cdUw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db36061c2ea5bdacf51305f8bc79f29595b343eb6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b36061c2ea5bdacf51305f8bc79f29595b343eb6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:178:10: note: Returning from 'xlog_do_io'
           error =3D xlog_do_io(log, blk_no, nbblks, data, REQ_OP_READ);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:179:7: note: 'error' is not equal to 0, which p=
articipates in a condition later
           if (!error)
                ^~~~~
   fs/xfs/xfs_log_recover.c:179:2: note: Taking false branch
           if (!error)
           ^
   fs/xfs/xfs_log_recover.c:181:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:813:12: note: Returning from 'xlog_bread'
                           error =3D xlog_bread(log, i, 1, buffer, &offset);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:814:8: note: 'error' is not equal to 0, which p=
articipates in a condition later
                           if (error)
                               ^~~~~
   fs/xfs/xfs_log_recover.c:814:4: note: Taking true branch
                           if (error)
                           ^
   fs/xfs/xfs_log_recover.c:815:5: note: Control jumps to line 831
                                   goto out_error;
                                   ^
   fs/xfs/xfs_log_recover.c:831:2: note: Returning without writing to '*rhe=
ad'
           return error;
           ^
   fs/xfs/xfs_log_recover.c:831:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:1287:10: note: Returning from 'xlog_rseek_logre=
c_hdr'
           error =3D xlog_rseek_logrec_hdr(log, *head_blk, *head_blk, 1, bu=
ffer,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/xfs/xfs_log_recover.c:1289:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   fs/xfs/xfs_log_recover.c:1289:2: note: Taking false branch
           if (error < 0)
           ^
   fs/xfs/xfs_log_recover.c:1291:7: note: 'error' is not equal to 0
           if (!error) {
                ^~~~~
   fs/xfs/xfs_log_recover.c:1291:2: note: Taking false branch
           if (!error) {
           ^
   fs/xfs/xfs_log_recover.c:1296:24: note: Access to field 'h_tail_lsn' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
rhead')
           *tail_blk =3D BLOCK_LSN(be64_to_cpu(rhead->h_tail_lsn));
                                 ^
   include/linux/byteorder/generic.h:93:21: note: expanded from macro 'be64=
_to_cpu'
   #define be64_to_cpu __be64_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:38:58: note: expanded from =
macro '__be64_to_cpu'
   #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
                                                            ^~
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                                                        ^
   fs/xfs/libxfs/xfs_log_format.h:52:32: note: expanded from macro 'BLOCK_L=
SN'
   #define BLOCK_LSN(lsn) ((uint)(lsn))
                                  ^~~
   fs/xfs/xfs_log_recover.c:3525:20: warning: Value stored to 'mp' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_mount        *mp =3D log->l_mp;
                                    ^~   ~~~~~~~~~
   fs/xfs/xfs_log_recover.c:3525:20: note: Value stored to 'mp' during its =
initialization is never read
           struct xfs_mount        *mp =3D log->l_mp;
                                    ^~   ~~~~~~~~~
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/regulator/ti-abb-regulator.c:485:15: warning: Division by zero [=
clang-analyzer-core.DivideZero]
           cycle_rate =3D DIV_ROUND_CLOSEST(clock_cycles * 10, clk_rate);
                        ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                    ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/regulator/ti-abb-regulator.c:427:8: note: Calling 'of_property_r=
ead_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &abb->settling=
_time);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/of.h:1256:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:504:12: note: Value assigned to field 'settling_time'=
, which participates in a condition later
           int ret =3D of_property_read_variable_u32_array(np, propname, ou=
t_values,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/of.h:506:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:506:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:507:3: note: Returning zero, which participates in a =
condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1256:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:427:8: note: Returning from 'of_pro=
perty_read_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &abb->settling=
_time);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/regulator/ti-abb-regulator.c:428:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/ti-abb-regulator.c:428:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/ti-abb-regulator.c:434:6: note: Assuming field 'settli=
ng_time' is not equal to 0
           if (!abb->settling_time) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:434:2: note: Taking false branch
           if (!abb->settling_time) {
           ^
   drivers/regulator/ti-abb-regulator.c:440:8: note: Calling 'of_property_r=
ead_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &clock_cycles);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:504:12: note: Value assigned to 'clock_cycles', which=
 participates in a condition later
           int ret =3D of_property_read_variable_u32_array(np, propname, ou=
t_values,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/of.h:506:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:506:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:507:3: note: Returning zero, which participates in a =
condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1256:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:440:8: note: Returning from 'of_pro=
perty_read_u32'
           ret =3D of_property_read_u32(dev->of_node, pname, &clock_cycles);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:441:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/ti-abb-regulator.c:441:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/ti-abb-regulator.c:446:6: note: Assuming 'clock_cycles=
' is not equal to 0
           if (!clock_cycles) {
               ^~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:446:2: note: Taking false branch
           if (!clock_cycles) {
           ^
   drivers/regulator/ti-abb-regulator.c:452:6: note: Calling 'IS_ERR'
           if (IS_ERR(abb->clk)) {
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:452:6: note: Returning from 'IS_ERR'
           if (IS_ERR(abb->clk)) {
               ^~~~~~~~~~~~~~~~
   drivers/regulator/ti-abb-regulator.c:452:2: note: Taking false branch
           if (IS_ERR(abb->clk)) {
           ^
   drivers/regulator/ti-abb-regulator.c:482:13: note: Left side of '||' is =
true
           clk_rate =3D DIV_ROUND_CLOSEST(clk_get_rate(abb->clk), 1000000);
                      ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \

vim +485 drivers/regulator/ti-abb-regulator.c

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  410  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  411  /**
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  412   * ti_abb_init_timings()=
 - setup ABB clock timing for the current platform
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  413   * @dev:	device
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  414   * @abb:	pointer to the =
abb instance
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  415   *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  416   * Return: 0 if timing i=
s updated, else returns error result.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  417   */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  418  static int ti_abb_init_t=
imings(struct device *dev, struct ti_abb *abb)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  419  {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  420  	u32 clock_cycles;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  421  	u32 clk_rate, sr2_wt_cn=
t_val, cycle_rate;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  422  	const struct ti_abb_reg=
 *regs =3D abb->regs;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  423  	int ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  424  	char *pname =3D "ti,set=
tling-time";
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  425  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  426  	/* read device tree pro=
perties */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  427  	ret =3D of_property_rea=
d_u32(dev->of_node, pname, &abb->settling_time);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  428  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  429  		dev_err(dev, "Unable t=
o get property '%s'(%d)\n", pname, ret);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  430  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  431  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  432  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  433  	/* ABB LDO cannot be se=
ttle in 0 time */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  434  	if (!abb->settling_time=
) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  435  		dev_err(dev, "Invalid =
property:'%s' set as 0!\n", pname);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  436  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  437  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  438  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  439  	pname =3D "ti,clock-cyc=
les";
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  440  	ret =3D of_property_rea=
d_u32(dev->of_node, pname, &clock_cycles);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  441  	if (ret) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  442  		dev_err(dev, "Unable t=
o get property '%s'(%d)\n", pname, ret);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  443  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  444  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  445  	/* ABB LDO cannot be se=
ttle in 0 clock cycles */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  446  	if (!clock_cycles) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  447  		dev_err(dev, "Invalid =
property:'%s' set as 0!\n", pname);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  448  		return -EINVAL;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  449  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  450  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  451  	abb->clk =3D devm_clk_g=
et(dev, NULL);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  452  	if (IS_ERR(abb->clk)) {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  453  		ret =3D PTR_ERR(abb->c=
lk);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  454  		dev_err(dev, "%s: Unab=
le to get clk(%d)\n", __func__, ret);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  455  		return ret;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  456  	}
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  457  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  458  	/*
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  459  	 * SR2_WTCNT_VALUE is t=
he settling time for the ABB ldo after a
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  460  	 * transition and must =
be programmed with the correct time at boot.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  461  	 * The value programmed=
 into the register is the number of SYS_CLK
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  462  	 * clock cycles that ma=
tch a given wall time profiled for the ldo.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  463  	 * This value depends o=
n:
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  464  	 * settling time of ldo=
 in micro-seconds (varies per OMAP family)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  465  	 * # of clock cycles pe=
r SYS_CLK period (varies per OMAP family)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  466  	 * the SYS_CLK frequenc=
y in MHz (varies per board)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  467  	 * The formula is:
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  468  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  469  	 *                     =
 ldo settling time (in micro-seconds)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  470  	 * SR2_WTCNT_VALUE =3D =
------------------------------------------
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  471  	 *                   (#=
 system clock cycles) * (sys_clk period)
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  472  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  473  	 * Put another way:
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  474  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  475  	 * SR2_WTCNT_VALUE =3D =
settling time / (# SYS_CLK cycles / SYS_CLK rate))
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  476  	 *
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  477  	 * To avoid dividing by=
 zero multiply both "# clock cycles" and
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  478  	 * "settling time" by 1=
0 such that the final result is the one we want.
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  479  	 */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  480  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  481  	/* Convert SYS_CLK rate=
 to MHz & prevent divide by zero */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  482  	clk_rate =3D DIV_ROUND_=
CLOSEST(clk_get_rate(abb->clk), 1000000);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  483  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  484  	/* Calculate cycle rate=
 */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02 @485  	cycle_rate =3D DIV_ROUN=
D_CLOSEST(clock_cycles * 10, clk_rate);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  486  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  487  	/* Calulate SR2_WTCNT_V=
ALUE */
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  488  	sr2_wt_cnt_val =3D DIV_=
ROUND_CLOSEST(abb->settling_time * 10, cycle_rate);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  489  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  490  	dev_dbg(dev, "%s: Clk_r=
ate=3D%ld, sr2_cnt=3D0x%08x\n", __func__,
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  491  		clk_get_rate(abb->clk)=
, sr2_wt_cnt_val);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  492  =

6127daa85094e2 Nishanth Menon     2014-01-23  493  	ti_abb_rmw(regs->sr2_wt=
cnt_value_mask, sr2_wt_cnt_val, abb->setup_reg);
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  494  =

40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  495  	return 0;
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  496  }
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  497  =


:::::: The code at line 485 was first introduced by commit
:::::: 40b1936efebdb9c31d9ed6fe59055f71ea366509 regulator: Introduce TI Ada=
ptive Body Bias(ABB) on-chip LDO driver

:::::: TO: Andrii.Tseglytskyi <andrii.tseglytskyi@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3454264989259332463==--

