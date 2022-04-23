Content-Type: multipart/mixed; boundary="===============2490974463500695803=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 6/8] drivers/soundwire/bus.c:1427:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 24 Apr 2022 03:02:59 +0800
Message-ID: <202204240207.yNegEpOx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2490974463500695803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: nanli2x <nanx.li@intel.com>
CC: Rander Wang <rander.wang@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   6410aba3b60feba47b9713f297d9b3bdb79981f5
commit: 99d62cba396dc2c733c62b8ffd1dde7ddc6701d3 [6/8] soundwire: bus: use =
no_pm IO routines for all interrupt handling
:::::: branch date: 4 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20424/202204240207.yNegEpOx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/99d62cba396dc2c73=
3c62b8ffd1dde7ddc6701d3
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 99d62cba396dc2c733c62b8ffd1dde7ddc6701d3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/codecs/sti-sas.c:430:7: warning: Access to field 'data' result=
s in a dereference of a null pointer (loaded from variable 'of_id') [clang-=
analyzer-core.NullDereference]
           if (!of_id->data) {
                ^~~~~
   sound/soc/codecs/sti-sas.c:425:6: note: Assuming 'drvdata' is non-null
           if (!drvdata)
               ^~~~~~~~
   sound/soc/codecs/sti-sas.c:425:2: note: Taking false branch
           if (!drvdata)
           ^
   sound/soc/codecs/sti-sas.c:429:2: note: Null pointer value stored to 'of=
_id'
           of_id =3D of_match_node(sti_sas_dev_match, pnode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sti-sas.c:430:7: note: Access to field 'data' results i=
n a dereference of a null pointer (loaded from variable 'of_id')
           if (!of_id->data) {
                ^~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/codecs/tas2764.c:54:23: warning: Value stored to 'tas2764' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/tas2764.c:54:23: note: Value stored to 'tas2764' during=
 its initialization is never read
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
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
   11 warnings generated.
   sound/soc/codecs/cs43130.c:179:8: warning: Excessive padding in 'struct =
cs43130_pll_params' (7 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   pll_in, =

   pll_div_frac, =

   pll_out, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs43130_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:179:8: note: Excessive padding in 'struct cs4=
3130_pll_params' (7 padding bytes, where 3 is optimal). Optimal fields orde=
r: pll_in, pll_div_frac, pll_out, sclk_prediv, pll_div_int, pll_mode, pll_d=
ivout, pll_cal_ratio, consider reordering the fields or adding explicit pad=
ding members
   struct cs43130_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:1937:28: warning: Value stored to 'component'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct snd_soc_component *component =3D cs43130->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:1937:28: note: Value stored to 'component' du=
ring its initialization is never read
           struct snd_soc_component *component =3D cs43130->component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:2472:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs43130->regmap, CS43130_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:2472:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs43130->regmap, CS43130_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:2475:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs43130->regmap, CS43130_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:2475:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs43130->regmap, CS43130_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:2477:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs43130->regmap, CS43130_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs43130.c:2477:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs43130->regmap, CS43130_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/soundwire/bus.c:1427:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D sdw_write(slave, addr, clear);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1427:3: note: Value stored to 'ret' is never read
                   ret =3D sdw_write(slave, addr, clear);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/soundwire/stream.c:847:10: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
                           kfree(bus->defer_msg.msg->buf);
                                 ^
   drivers/soundwire/stream.c:1755:6: note: Assuming 'stream' is non-null
           if (!stream) {
               ^~~~~~~
   drivers/soundwire/stream.c:1755:2: note: Taking false branch
           if (!stream) {
           ^
   drivers/soundwire/stream.c:1762:6: note: Assuming field 'state' is equal=
 to SDW_STREAM_ENABLED
           if (stream->state !=3D SDW_STREAM_ENABLED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/stream.c:1762:2: note: Taking false branch
           if (stream->state !=3D SDW_STREAM_ENABLED) {
           ^
   drivers/soundwire/stream.c:1769:8: note: Calling '_sdw_disable_stream'
           ret =3D _sdw_disable_stream(stream);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/stream.c:1700:2: note: Left side of '&&' is false
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/soundwire/stream.c:1700:2: note: Taking false branch
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/soundwire/stream.c:1700:2: note: Loop condition is false.  Exiti=
ng loop
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:1700:2: note: Loop condition is false. Execut=
ion continues on line 1710
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^

vim +/ret +1427 drivers/soundwire/bus.c

b0a9c37b0178bf Vinod Koul           2017-12-14  1383  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1384  static int sdw_handle=
_port_interrupt(struct sdw_slave *slave,
b0a9c37b0178bf Vinod Koul           2017-12-14  1385  				     int port, u8=
 *slave_status)
b0a9c37b0178bf Vinod Koul           2017-12-14  1386  {
b0a9c37b0178bf Vinod Koul           2017-12-14  1387  	u8 clear =3D 0, impl=
_int_mask;
b0a9c37b0178bf Vinod Koul           2017-12-14  1388  	int status, status2,=
 ret, count =3D 0;
b0a9c37b0178bf Vinod Koul           2017-12-14  1389  	u32 addr;
b0a9c37b0178bf Vinod Koul           2017-12-14  1390  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1391  	if (port =3D=3D 0)
b0a9c37b0178bf Vinod Koul           2017-12-14  1392  		return sdw_handle_d=
p0_interrupt(slave, slave_status);
b0a9c37b0178bf Vinod Koul           2017-12-14  1393  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1394  	addr =3D SDW_DPN_INT=
(port);
99d62cba396dc2 Pierre-Louis Bossart 2021-01-22  1395  	status =3D sdw_read_=
no_pm(slave, addr);
b0a9c37b0178bf Vinod Koul           2017-12-14  1396  	if (status < 0) {
60d3d1770d7321 Pierre-Louis Bossart 2021-01-22  1397  		dev_err(&slave->dev,
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1398  			"SDW_DPN_INT read =
failed:%d\n", status);
b0a9c37b0178bf Vinod Koul           2017-12-14  1399  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1400  		return status;
b0a9c37b0178bf Vinod Koul           2017-12-14  1401  	}
b0a9c37b0178bf Vinod Koul           2017-12-14  1402  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1403  	do {
b0a9c37b0178bf Vinod Koul           2017-12-14  1404  		if (status & SDW_DP=
N_INT_TEST_FAIL) {
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1405  			dev_err(&slave->de=
v, "Test fail for port:%d\n", port);
b0a9c37b0178bf Vinod Koul           2017-12-14  1406  			clear |=3D SDW_DPN=
_INT_TEST_FAIL;
b0a9c37b0178bf Vinod Koul           2017-12-14  1407  		}
b0a9c37b0178bf Vinod Koul           2017-12-14  1408  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1409  		/*
b0a9c37b0178bf Vinod Koul           2017-12-14  1410  		 * Assumption: PORT=
_READY interrupt will be received only
b0a9c37b0178bf Vinod Koul           2017-12-14  1411  		 * for ports implem=
enting CP_SM.
b0a9c37b0178bf Vinod Koul           2017-12-14  1412  		 */
b0a9c37b0178bf Vinod Koul           2017-12-14  1413  		if (status & SDW_DP=
N_INT_PORT_READY) {
b0a9c37b0178bf Vinod Koul           2017-12-14  1414  			complete(&slave->p=
ort_ready[port]);
b0a9c37b0178bf Vinod Koul           2017-12-14  1415  			clear |=3D SDW_DPN=
_INT_PORT_READY;
b0a9c37b0178bf Vinod Koul           2017-12-14  1416  		}
b0a9c37b0178bf Vinod Koul           2017-12-14  1417  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1418  		impl_int_mask =3D S=
DW_DPN_INT_IMPDEF1 |
b0a9c37b0178bf Vinod Koul           2017-12-14  1419  			SDW_DPN_INT_IMPDEF=
2 | SDW_DPN_INT_IMPDEF3;
b0a9c37b0178bf Vinod Koul           2017-12-14  1420  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1421  		if (status & impl_i=
nt_mask) {
b0a9c37b0178bf Vinod Koul           2017-12-14  1422  			clear |=3D impl_in=
t_mask;
b0a9c37b0178bf Vinod Koul           2017-12-14  1423  			*slave_status =3D =
clear;
b0a9c37b0178bf Vinod Koul           2017-12-14  1424  		}
b0a9c37b0178bf Vinod Koul           2017-12-14  1425  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1426  		/* clear the interr=
upt */
b0a9c37b0178bf Vinod Koul           2017-12-14 @1427  		ret =3D sdw_write(s=
lave, addr, clear);
99d62cba396dc2 Pierre-Louis Bossart 2021-01-22  1428  		/* clear the interr=
upt but don't touch reserved fields */
99d62cba396dc2 Pierre-Louis Bossart 2021-01-22  1429  		ret =3D sdw_write_n=
o_pm(slave, addr, clear);
b0a9c37b0178bf Vinod Koul           2017-12-14  1430  		if (ret < 0) {
60d3d1770d7321 Pierre-Louis Bossart 2021-01-22  1431  			dev_err(&slave->de=
v,
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1432  				"SDW_DPN_INT writ=
e failed:%d\n", ret);
b0a9c37b0178bf Vinod Koul           2017-12-14  1433  			return ret;
b0a9c37b0178bf Vinod Koul           2017-12-14  1434  		}
b0a9c37b0178bf Vinod Koul           2017-12-14  1435  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1436  		/* Read DPN interru=
pt again */
99d62cba396dc2 Pierre-Louis Bossart 2021-01-22  1437  		status2 =3D sdw_rea=
d_no_pm(slave, addr);
80cd8f0175d03f Wei Yongjun          2018-01-08  1438  		if (status2 < 0) {
60d3d1770d7321 Pierre-Louis Bossart 2021-01-22  1439  			dev_err(&slave->de=
v,
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1440  				"SDW_DPN_INT read=
 failed:%d\n", status2);
80cd8f0175d03f Wei Yongjun          2018-01-08  1441  			return status2;
b0a9c37b0178bf Vinod Koul           2017-12-14  1442  		}
b0a9c37b0178bf Vinod Koul           2017-12-14  1443  		status &=3D status2;
b0a9c37b0178bf Vinod Koul           2017-12-14  1444  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1445  		count++;
b0a9c37b0178bf Vinod Koul           2017-12-14  1446  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1447  		/* we can get alert=
s while processing so keep retrying */
b0a9c37b0178bf Vinod Koul           2017-12-14  1448  	} while (status !=3D=
 0 && count < SDW_READ_INTR_CLEAR_RETRY);
b0a9c37b0178bf Vinod Koul           2017-12-14  1449  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1450  	if (count =3D=3D SDW=
_READ_INTR_CLEAR_RETRY)
60d3d1770d7321 Pierre-Louis Bossart 2021-01-22  1451  		dev_warn(&slave->de=
v, "Reached MAX_RETRY on port read");
b0a9c37b0178bf Vinod Koul           2017-12-14  1452  =

b0a9c37b0178bf Vinod Koul           2017-12-14  1453  	return ret;
b0a9c37b0178bf Vinod Koul           2017-12-14  1454  }
b0a9c37b0178bf Vinod Koul           2017-12-14  1455  =


:::::: The code at line 1427 was first introduced by commit
:::::: b0a9c37b0178bf397393952e98789b0d4dc7fd6c soundwire: Add slave status=
 handling

:::::: TO: Vinod Koul <vinod.koul@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2490974463500695803==--

