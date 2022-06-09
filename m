Content-Type: multipart/mixed; boundary="===============6054291971849982345=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/misc/iqs7222.c:1404 iqs7222_dev_init() error: uninitialized symbol 'error'.
Date: Fri, 10 Jun 2022 04:48:11 +0800
Message-ID: <202206100446.PKvWYKIL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6054291971849982345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bfb56e93bcef41859c2d5ab234ffd80b691be35
commit: e505edaedcb9e7d16eefddc62d2189afaea0febc Input: add support for Azo=
teq IQS7222A/B/C
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: openrisc-randconfig-m031-20220609 (https://download.01.org/0day-ci/=
archive/20220610/202206100446.PKvWYKIL-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/input/misc/iqs7222.c:1404 iqs7222_dev_init() error: uninitialized s=
ymbol 'error'.

vim +/error +1404 drivers/input/misc/iqs7222.c

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1329  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1330  static int iqs7222_dev_init(s=
truct iqs7222_private *iqs7222, int dir)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1331  {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1332  	const struct iqs7222_dev_des=
c *dev_desc =3D iqs7222->dev_desc;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1333  	int comms_offset =3D dev_des=
c->comms_offset;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1334  	int error, i, j, k;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1335  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1336  	/*
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1337  	 * Take advantage of the sto=
p-bit disable function, if available, to
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1338  	 * save the trouble of havin=
g to reopen a communication window after
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1339  	 * each burst read or write.
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1340  	 */
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1341  	if (comms_offset) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1342  		u16 comms_setup;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1343  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1344  		error =3D iqs7222_read_word=
(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1345  					  IQS7222_SYS_SETUP + co=
mms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1346  					  &comms_setup);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1347  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1348  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1349  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1350  		error =3D iqs7222_write_wor=
d(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1351  					   IQS7222_SYS_SETUP + c=
omms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1352  					   comms_setup | IQS7222=
_COMMS_HOLD);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1353  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1354  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1355  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1356  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1357  	for (i =3D 0; i < IQS7222_NU=
M_REG_GRPS; i++) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1358  		int num_row =3D dev_desc->r=
eg_grps[i].num_row;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1359  		int num_col =3D dev_desc->r=
eg_grps[i].num_col;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1360  		u16 reg =3D dev_desc->reg_g=
rps[i].base;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1361  		__le16 *val_buf;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1362  		u16 *val;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1363  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1364  		if (!num_col)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1365  			continue;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1366  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1367  		val =3D iqs7222_setup(iqs72=
22, i, 0);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1368  		if (!val)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1369  			continue;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1370  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1371  		val_buf =3D kcalloc(num_col=
, sizeof(__le16), GFP_KERNEL);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1372  		if (!val_buf)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1373  			return -ENOMEM;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1374  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1375  		for (j =3D 0; j < num_row; =
j++) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1376  			switch (dir) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1377  			case READ:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1378  				error =3D iqs7222_read_bu=
rst(iqs7222, reg,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1379  							   val_buf, num_col);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1380  				for (k =3D 0; k < num_col=
; k++)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1381  					val[k] =3D le16_to_cpu(v=
al_buf[k]);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1382  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1383  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1384  			case WRITE:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1385  				for (k =3D 0; k < num_col=
; k++)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1386  					val_buf[k] =3D cpu_to_le=
16(val[k]);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1387  				error =3D iqs7222_write_b=
urst(iqs7222, reg,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1388  							    val_buf, num_col);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1389  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1390  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1391  			default:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1392  				error =3D -EINVAL;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1393  			}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1394  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1395  			if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1396  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1397  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1398  			reg +=3D IQS7222_REG_OFFSE=
T;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1399  			val +=3D iqs7222_max_cols[=
i];
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1400  		}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1401  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1402  		kfree(val_buf);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1403  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08 @1404  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1405  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1406  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1407  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1408  	if (comms_offset) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1409  		u16 comms_setup;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1410  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1411  		error =3D iqs7222_read_word=
(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1412  					  IQS7222_SYS_SETUP + co=
mms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1413  					  &comms_setup);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1414  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1415  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1416  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1417  		error =3D iqs7222_write_wor=
d(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1418  					   IQS7222_SYS_SETUP + c=
omms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1419  					   comms_setup & ~IQS722=
2_COMMS_HOLD);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1420  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1421  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1422  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1423  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1424  	if (dir =3D=3D READ)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1425  		return 0;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1426  =

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1427  	return iqs7222_ati_trigger(i=
qs7222);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1428  }
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1429  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6054291971849982345==--

