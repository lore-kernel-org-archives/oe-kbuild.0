Content-Type: multipart/mixed; boundary="===============7436198818105796067=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/mgmt.c:1585 mgmt_set_connectable_complete() warn: variable dereferenced before check 'cmd' (see line 1577)
Date: Tue, 08 Mar 2022 14:16:23 +0800
Message-ID: <202203081447.x4h6aNyS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7436198818105796067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Brian Gix <brian.gix@intel.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ea4424be16887a37735d6550cfd0611528dbe5d9
commit: 275f3f64870245b06188f24bdf917e55a813d294 Bluetooth: Fix not checkin=
g MGMT cmd pending queue
date:   6 days ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: sh-randconfig-m031-20220302 (https://download.01.org/0day-ci/archiv=
e/20220308/202203081447.x4h6aNyS-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/mgmt.c:1585 mgmt_set_connectable_complete() warn: variable de=
referenced before check 'cmd' (see line 1577)

Old smatch warnings:
net/bluetooth/mgmt.c:4990 read_local_oob_data_complete() error: 'skb' deref=
erencing possible ERR_PTR()
net/bluetooth/mgmt.c:5004 read_local_oob_data_complete() error: 'skb' deref=
erencing possible ERR_PTR()
net/bluetooth/mgmt.c:7534 read_local_oob_ext_data_complete() error: 'skb' d=
ereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:7550 read_local_oob_ext_data_complete() error: 'skb' d=
ereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:8248 add_ext_adv_params_complete() warn: variable dere=
ferenced before check 'cmd' (see line 8207)

vim +/cmd +1585 net/bluetooth/mgmt.c

73f22f62388795 Johan Hedberg          2010-12-29  1561  =

f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1562  static void mgmt_se=
t_connectable_complete(struct hci_dev *hdev, void *data,
f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1563  					  int err)
2b76f4539c6a41 Johan Hedberg          2013-03-15  1564  {
f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1565  	struct mgmt_pendin=
g_cmd *cmd =3D data;
2b76f4539c6a41 Johan Hedberg          2013-03-15  1566  =

f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1567  	bt_dev_dbg(hdev, "=
err %d", err);
2b76f4539c6a41 Johan Hedberg          2013-03-15  1568  =

275f3f64870245 Brian Gix              2022-03-01  1569  	/* Make sure cmd s=
till outstanding. */
275f3f64870245 Brian Gix              2022-03-01  1570  	if (cmd !=3D pendi=
ng_find(MGMT_OP_SET_CONNECTABLE, hdev))
275f3f64870245 Brian Gix              2022-03-01  1571  		return;
275f3f64870245 Brian Gix              2022-03-01  1572  =

2b76f4539c6a41 Johan Hedberg          2013-03-15  1573  	hci_dev_lock(hdev);
2b76f4539c6a41 Johan Hedberg          2013-03-15  1574  =

f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1575  	if (err) {
f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1576  		u8 mgmt_err =3D m=
gmt_status(err);
a69e8375a134eb Johan Hedberg          2015-03-06 @1577  		mgmt_cmd_status(c=
md->sk, cmd->index, cmd->opcode, mgmt_err);
f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1578  		goto done;
37438c1f7f6d26 Johan Hedberg          2013-10-14  1579  	}
37438c1f7f6d26 Johan Hedberg          2013-10-14  1580  =

2b76f4539c6a41 Johan Hedberg          2013-03-15  1581  	send_settings_rsp(=
cmd->sk, MGMT_OP_SET_CONNECTABLE, hdev);
d7b856f9380d95 Johan Hedberg          2013-10-14  1582  	new_settings(hdev,=
 cmd->sk);
d7b856f9380d95 Johan Hedberg          2013-10-14  1583  =

f056a65783cce9 Luiz Augusto von Dentz 2021-11-11  1584  done:
275f3f64870245 Brian Gix              2022-03-01 @1585  	if (cmd)
275f3f64870245 Brian Gix              2022-03-01  1586  		mgmt_pending_remo=
ve(cmd);
275f3f64870245 Brian Gix              2022-03-01  1587  =

2b76f4539c6a41 Johan Hedberg          2013-03-15  1588  	hci_dev_unlock(hde=
v);
2b76f4539c6a41 Johan Hedberg          2013-03-15  1589  }
2b76f4539c6a41 Johan Hedberg          2013-03-15  1590  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7436198818105796067==--

