Content-Type: multipart/mixed; boundary="===============0189598036494081969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 6/8] drivers/soundwire/bus.c:1427:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 17 Apr 2022 08:47:40 +0800
Message-ID: <202204170827.Ytjc7trW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0189598036494081969==
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
head:   bc85b67a97aa2ce0c02aa7364781774f1766d952
commit: 99d62cba396dc2c733c62b8ffd1dde7ddc6701d3 [6/8] soundwire: bus: use =
no_pm IO routines for all interrupt handling
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20417/202204170827.Ytjc7trW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/cifs/connect.c:4909:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:4909:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:4912:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bcc_ptr, "?????");
           ^~~~~~
   fs/cifs/connect.c:4912:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(bcc_ptr, "?????");
           ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/soc/codecs/cs42l56.c:1246:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l56.c:1246:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/cs42l73.c:1329:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1329:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1332:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1332:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1335:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l73.c:1335:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l73->regmap, CS42L73_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/codecs/max98088.c:1441:8: warning: Value stored to 'best' is n=
ever read [clang-analyzer-deadcode.DeadStores]
          best =3D 0;
          ^      ~
   sound/soc/codecs/max98088.c:1441:8: note: Value stored to 'best' is neve=
r read
          best =3D 0;
          ^      ~
   sound/soc/codecs/max98088.c:1446:24: warning: Value stored to 'best' is =
never read [clang-analyzer-deadcode.DeadStores]
                          best =3D i;
                          ^      ~
   sound/soc/codecs/max98088.c:1446:24: note: Value stored to 'best' is nev=
er read
                          best =3D i;
                          ^      ~
   sound/soc/codecs/max98088.c:1488:8: warning: Value stored to 'best' is n=
ever read [clang-analyzer-deadcode.DeadStores]
          best =3D 0;
          ^      ~
   sound/soc/codecs/max98088.c:1488:8: note: Value stored to 'best' is neve=
r read
          best =3D 0;
          ^      ~
   sound/soc/codecs/max98088.c:1493:24: warning: Value stored to 'best' is =
never read [clang-analyzer-deadcode.DeadStores]
                          best =3D i;
                          ^      ~
   sound/soc/codecs/max98088.c:1493:24: note: Value stored to 'best' is nev=
er read
                          best =3D i;
                          ^      ~
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/ext2/dir.c:449:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:449:2: note: Value stored to 'err' is never read
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/soc/codecs/tlv320aic32x4-clk.c:39:8: warning: Excessive padding in=
 'struct aic32x4_clkdesc' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   parent_names, =

   ops, =

   num_parents, =

   reg, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct aic32x4_clkdesc {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   sound/soc/codecs/tlv320aic32x4-clk.c:39:8: note: Excessive padding in 's=
truct aic32x4_clkdesc' (8 padding bytes, where 0 is optimal). Optimal field=
s order: name, parent_names, ops, num_parents, reg, consider reordering the=
 fields or adding explicit padding members
   struct aic32x4_clkdesc {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/soc/codecs/wm8731.c:106:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8731.c:106:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).

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
--===============0189598036494081969==--

