Content-Type: multipart/mixed; boundary="===============8098130655415256095=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/emulex/benet/be_ethtool.c:1392 be_get_module_eeprom() error: uninitialized symbol 'status'.
Date: Tue, 20 Sep 2022 08:40:59 +0800
Message-ID: <202209200820.RPZrapD4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8098130655415256095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hristo Venev <hristo@venev.name>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: d7241f679a59cfe27f92cb5c6272cb429fb1f7ec be2net: Fix buffer overflo=
w in be_get_module_eeprom
date:   9 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 9 weeks ago
config: csky-randconfig-m041-20220918 (https://download.01.org/0day-ci/arch=
ive/20220920/202209200820.RPZrapD4-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/emulex/benet/be_ethtool.c:1392 be_get_module_eeprom() =
error: uninitialized symbol 'status'.

vim +/status +1392 drivers/net/ethernet/emulex/benet/be_ethtool.c

e36edd9d26cf25 Mark Leonard 2014-09-12  1359  =

e36edd9d26cf25 Mark Leonard 2014-09-12  1360  static int be_get_module_eepr=
om(struct net_device *netdev,
e36edd9d26cf25 Mark Leonard 2014-09-12  1361  				struct ethtool_eeprom *ee=
prom, u8 *data)
e36edd9d26cf25 Mark Leonard 2014-09-12  1362  {
e36edd9d26cf25 Mark Leonard 2014-09-12  1363  	struct be_adapter *adapter =
=3D netdev_priv(netdev);
e36edd9d26cf25 Mark Leonard 2014-09-12  1364  	int status;
d7241f679a59cf Hristo Venev 2022-07-16  1365  	u32 begin, end;
e36edd9d26cf25 Mark Leonard 2014-09-12  1366  =

e36edd9d26cf25 Mark Leonard 2014-09-12  1367  	if (!check_privilege(adapter=
, MAX_PRIVILEGES))
e36edd9d26cf25 Mark Leonard 2014-09-12  1368  		return -EOPNOTSUPP;
e36edd9d26cf25 Mark Leonard 2014-09-12  1369  =

d7241f679a59cf Hristo Venev 2022-07-16  1370  	begin =3D eeprom->offset;
d7241f679a59cf Hristo Venev 2022-07-16  1371  	end =3D eeprom->offset + eep=
rom->len;
d7241f679a59cf Hristo Venev 2022-07-16  1372  =

d7241f679a59cf Hristo Venev 2022-07-16  1373  	if (begin < PAGE_DATA_LEN) {
d7241f679a59cf Hristo Venev 2022-07-16  1374  		status =3D be_cmd_read_port=
_transceiver_data(adapter, TR_PAGE_A0, begin,
d7241f679a59cf Hristo Venev 2022-07-16  1375  							   min_t(u32, end, PAG=
E_DATA_LEN) - begin,
e36edd9d26cf25 Mark Leonard 2014-09-12  1376  							   data);
e36edd9d26cf25 Mark Leonard 2014-09-12  1377  		if (status)
e36edd9d26cf25 Mark Leonard 2014-09-12  1378  			goto err;
e36edd9d26cf25 Mark Leonard 2014-09-12  1379  =

d7241f679a59cf Hristo Venev 2022-07-16  1380  		data +=3D PAGE_DATA_LEN - b=
egin;
d7241f679a59cf Hristo Venev 2022-07-16  1381  		begin =3D PAGE_DATA_LEN;
d7241f679a59cf Hristo Venev 2022-07-16  1382  	}
d7241f679a59cf Hristo Venev 2022-07-16  1383  =

d7241f679a59cf Hristo Venev 2022-07-16  1384  	if (end > PAGE_DATA_LEN) {
d7241f679a59cf Hristo Venev 2022-07-16  1385  		status =3D be_cmd_read_port=
_transceiver_data(adapter, TR_PAGE_A2,
d7241f679a59cf Hristo Venev 2022-07-16  1386  							   begin - PAGE_DATA_L=
EN,
d7241f679a59cf Hristo Venev 2022-07-16  1387  							   end - begin, data);
e36edd9d26cf25 Mark Leonard 2014-09-12  1388  		if (status)
e36edd9d26cf25 Mark Leonard 2014-09-12  1389  			goto err;
e36edd9d26cf25 Mark Leonard 2014-09-12  1390  	}
e36edd9d26cf25 Mark Leonard 2014-09-12  1391  err:
e36edd9d26cf25 Mark Leonard 2014-09-12 @1392  	return be_cmd_status(status);
e36edd9d26cf25 Mark Leonard 2014-09-12  1393  }
e36edd9d26cf25 Mark Leonard 2014-09-12  1394  =


:::::: The code at line 1392 was first introduced by commit
:::::: e36edd9d26cf257511548edaf2b7a56eb4fed854 be2net: add ethtool "-m" op=
tion support

:::::: TO: Mark Leonard <mark.leonard@emulex.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8098130655415256095==--

