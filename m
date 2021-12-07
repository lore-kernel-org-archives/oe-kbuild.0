Content-Type: multipart/mixed; boundary="===============2645558165112457798=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ceph/messenger_v2.c:1289 prepare_auth_request() error: uninitialized symbol 'authorizer_len'.
Date: Tue, 07 Dec 2021 16:17:45 +0800
Message-ID: <202112071646.sSmI8XmX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2645558165112457798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Dryomov <idryomov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: cd1a677cad994021b19665ed476aea63f5d54f31 libceph, ceph: implement m=
sgr2.1 protocol (crc and secure modes)
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-m021-20211206 (https://download.01.org/0day-ci/arch=
ive/20211207/202112071646.sSmI8XmX-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ceph/messenger_v2.c:1289 prepare_auth_request() error: uninitialized sy=
mbol 'authorizer_len'.
net/ceph/messenger_v2.c:1293 prepare_auth_request() error: uninitialized sy=
mbol 'authorizer'.
net/ceph/messenger_v2.c:1328 prepare_auth_request_more() error: uninitializ=
ed symbol 'authorizer'.
net/ceph/messenger_v2.c:1328 prepare_auth_request_more() error: uninitializ=
ed symbol 'authorizer_len'.

vim +/authorizer_len +1289 net/ceph/messenger_v2.c

cd1a677cad99402 Ilya Dryomov 2020-11-19  1262  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1263  static int prepare_auth_requ=
est(struct ceph_connection *con)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1264  {
cd1a677cad99402 Ilya Dryomov 2020-11-19  1265  	void *authorizer, *authoriz=
er_copy;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1266  	int ctrl_len, authorizer_le=
n;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1267  	void *buf;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1268  	int ret;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1269  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1270  	ctrl_len =3D AUTH_BUF_LEN;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1271  	buf =3D alloc_conn_buf(con,=
 head_onwire_len(ctrl_len, false));
cd1a677cad99402 Ilya Dryomov 2020-11-19  1272  	if (!buf)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1273  		return -ENOMEM;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1274  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1275  	mutex_unlock(&con->mutex);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1276  	ret =3D con->ops->get_auth_=
request(con, CTRL_BODY(buf), &ctrl_len,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1277  					 &authorizer, &authoriz=
er_len);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1278  	mutex_lock(&con->mutex);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1279  	if (con->state !=3D CEPH_CO=
N_S_V2_HELLO) {
cd1a677cad99402 Ilya Dryomov 2020-11-19  1280  		dout("%s con %p state chan=
ged to %d\n", __func__, con,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1281  		     con->state);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1282  		return -EAGAIN;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1283  	}
cd1a677cad99402 Ilya Dryomov 2020-11-19  1284  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1285  	dout("%s con %p get_auth_re=
quest ret %d\n", __func__, con, ret);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1286  	if (ret)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1287  		return ret;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1288  =

cd1a677cad99402 Ilya Dryomov 2020-11-19 @1289  	authorizer_copy =3D alloc_c=
onn_buf(con, authorizer_len);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1290  	if (!authorizer_copy)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1291  		return -ENOMEM;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1292  =

cd1a677cad99402 Ilya Dryomov 2020-11-19 @1293  	memcpy(authorizer_copy, aut=
horizer, authorizer_len);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1294  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1295  	return __prepare_control(co=
n, FRAME_TAG_AUTH_REQUEST, buf, ctrl_len,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1296  				 authorizer_copy, author=
izer_len, true);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1297  }
cd1a677cad99402 Ilya Dryomov 2020-11-19  1298  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1299  static int prepare_auth_requ=
est_more(struct ceph_connection *con,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1300  				     void *reply, int re=
ply_len)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1301  {
cd1a677cad99402 Ilya Dryomov 2020-11-19  1302  	int ctrl_len, authorizer_le=
n;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1303  	void *authorizer;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1304  	void *buf;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1305  	int ret;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1306  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1307  	ctrl_len =3D AUTH_BUF_LEN;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1308  	buf =3D alloc_conn_buf(con,=
 head_onwire_len(ctrl_len, false));
cd1a677cad99402 Ilya Dryomov 2020-11-19  1309  	if (!buf)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1310  		return -ENOMEM;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1311  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1312  	mutex_unlock(&con->mutex);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1313  	ret =3D con->ops->handle_au=
th_reply_more(con, reply, reply_len,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1314  					       CTRL_BODY(buf), =
&ctrl_len,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1315  					       &authorizer, &au=
thorizer_len);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1316  	mutex_lock(&con->mutex);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1317  	if (con->state !=3D CEPH_CO=
N_S_V2_AUTH) {
cd1a677cad99402 Ilya Dryomov 2020-11-19  1318  		dout("%s con %p state chan=
ged to %d\n", __func__, con,
cd1a677cad99402 Ilya Dryomov 2020-11-19  1319  		     con->state);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1320  		return -EAGAIN;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1321  	}
cd1a677cad99402 Ilya Dryomov 2020-11-19  1322  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1323  	dout("%s con %p handle_auth=
_reply_more ret %d\n", __func__, con, ret);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1324  	if (ret)
cd1a677cad99402 Ilya Dryomov 2020-11-19  1325  		return ret;
cd1a677cad99402 Ilya Dryomov 2020-11-19  1326  =

cd1a677cad99402 Ilya Dryomov 2020-11-19  1327  	return __prepare_control(co=
n, FRAME_TAG_AUTH_REQUEST_MORE, buf,
cd1a677cad99402 Ilya Dryomov 2020-11-19 @1328  				 ctrl_len, authorizer, a=
uthorizer_len, true);
cd1a677cad99402 Ilya Dryomov 2020-11-19  1329  }
cd1a677cad99402 Ilya Dryomov 2020-11-19  1330  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2645558165112457798==--

