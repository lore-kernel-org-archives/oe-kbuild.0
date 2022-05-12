Content-Type: multipart/mixed; boundary="===============6430254537142940820=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/davicom/dm9051.c:610 dm9051_get_eeprom() error: uninitialized symbol 'ret'.
Date: Thu, 12 May 2022 12:43:45 +0800
Message-ID: <202205121231.hPQrGSE5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6430254537142940820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Joseph CHAMG <josright123@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: 2dc95a4d30eddac9679f295ba4304a7ab0e4ae02 net: Add dm9051 driver
date:   3 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220512/202205121231.hPQrGSE5-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/davicom/dm9051.c:610 dm9051_get_eeprom() error: uninit=
ialized symbol 'ret'.
drivers/net/ethernet/davicom/dm9051.c:632 dm9051_set_eeprom() error: uninit=
ialized symbol 'ret'.

Old smatch warnings:
drivers/net/ethernet/davicom/dm9051.c:527 dm9051_map_chipid() warn: unsigne=
d 'ret' is never less than zero.

vim +/ret +610 drivers/net/ethernet/davicom/dm9051.c

2dc95a4d30edda Joseph CHAMG 2022-02-11  591  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  592  static int dm9051_get_eeprom(s=
truct net_device *ndev,
2dc95a4d30edda Joseph CHAMG 2022-02-11  593  			     struct ethtool_eeprom =
*ee, u8 *data)
2dc95a4d30edda Joseph CHAMG 2022-02-11  594  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  595  	struct board_info *db =3D to_=
dm9051_board(ndev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  596  	int offset =3D ee->offset;
2dc95a4d30edda Joseph CHAMG 2022-02-11  597  	int len =3D ee->len;
2dc95a4d30edda Joseph CHAMG 2022-02-11  598  	int i, ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  599  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  600  	if ((len | offset) & 1)
2dc95a4d30edda Joseph CHAMG 2022-02-11  601  		return -EINVAL;
2dc95a4d30edda Joseph CHAMG 2022-02-11  602  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  603  	ee->magic =3D DM_EEPROM_MAGIC;
2dc95a4d30edda Joseph CHAMG 2022-02-11  604  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  605  	for (i =3D 0; i < len; i +=3D=
 2) {
2dc95a4d30edda Joseph CHAMG 2022-02-11  606  		ret =3D dm9051_eeprom_read(d=
b, (offset + i) / 2, data + i);
2dc95a4d30edda Joseph CHAMG 2022-02-11  607  		if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  608  			break;
2dc95a4d30edda Joseph CHAMG 2022-02-11  609  	}
2dc95a4d30edda Joseph CHAMG 2022-02-11 @610  	return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  611  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  612  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  613  static int dm9051_set_eeprom(s=
truct net_device *ndev,
2dc95a4d30edda Joseph CHAMG 2022-02-11  614  			     struct ethtool_eeprom =
*ee, u8 *data)
2dc95a4d30edda Joseph CHAMG 2022-02-11  615  {
2dc95a4d30edda Joseph CHAMG 2022-02-11  616  	struct board_info *db =3D to_=
dm9051_board(ndev);
2dc95a4d30edda Joseph CHAMG 2022-02-11  617  	int offset =3D ee->offset;
2dc95a4d30edda Joseph CHAMG 2022-02-11  618  	int len =3D ee->len;
2dc95a4d30edda Joseph CHAMG 2022-02-11  619  	int i, ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  620  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  621  	if ((len | offset) & 1)
2dc95a4d30edda Joseph CHAMG 2022-02-11  622  		return -EINVAL;
2dc95a4d30edda Joseph CHAMG 2022-02-11  623  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  624  	if (ee->magic !=3D DM_EEPROM_=
MAGIC)
2dc95a4d30edda Joseph CHAMG 2022-02-11  625  		return -EINVAL;
2dc95a4d30edda Joseph CHAMG 2022-02-11  626  =

2dc95a4d30edda Joseph CHAMG 2022-02-11  627  	for (i =3D 0; i < len; i +=3D=
 2) {
2dc95a4d30edda Joseph CHAMG 2022-02-11  628  		ret =3D dm9051_eeprom_write(=
db, (offset + i) / 2, data + i);
2dc95a4d30edda Joseph CHAMG 2022-02-11  629  		if (ret)
2dc95a4d30edda Joseph CHAMG 2022-02-11  630  			break;
2dc95a4d30edda Joseph CHAMG 2022-02-11  631  	}
2dc95a4d30edda Joseph CHAMG 2022-02-11 @632  	return ret;
2dc95a4d30edda Joseph CHAMG 2022-02-11  633  }
2dc95a4d30edda Joseph CHAMG 2022-02-11  634  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6430254537142940820==--

