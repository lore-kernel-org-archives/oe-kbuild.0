Content-Type: multipart/mixed; boundary="===============8463511161389638595=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_request.c:3350 hci_req_configure_datapath() error: uninitialized symbol 'vnd_len'.
Date: Wed, 08 Dec 2021 10:03:06 +0800
Message-ID: <202112080946.4eVd3xeE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8463511161389638595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kiran K <kiran.k@intel.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 9798fbdee88a893758f1432efdfe498ae410aab8 Bluetooth: Configure codec=
 for HFP offload use case
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20211206 (https://download.01.org/0day-ci/arch=
ive/20211208/202112080946.4eVd3xeE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bluetooth/hci_request.c:3350 hci_req_configure_datapath() error: uninit=
ialized symbol 'vnd_len'.

vim +/vnd_len +3350 net/bluetooth/hci_request.c

9798fbdee88a89 Kiran K 2021-09-07  3335  =

9798fbdee88a89 Kiran K 2021-09-07  3336  int hci_req_configure_datapath(str=
uct hci_dev *hdev, struct bt_codec *codec)
9798fbdee88a89 Kiran K 2021-09-07  3337  {
9798fbdee88a89 Kiran K 2021-09-07  3338  	struct hci_request req;
9798fbdee88a89 Kiran K 2021-09-07  3339  	int err;
9798fbdee88a89 Kiran K 2021-09-07  3340  	__u8 vnd_len, *vnd_data =3D NULL;
9798fbdee88a89 Kiran K 2021-09-07  3341  	struct hci_op_configure_data_path=
 *cmd =3D NULL;
9798fbdee88a89 Kiran K 2021-09-07  3342  =

9798fbdee88a89 Kiran K 2021-09-07  3343  	hci_req_init(&req, hdev);
9798fbdee88a89 Kiran K 2021-09-07  3344  =

9798fbdee88a89 Kiran K 2021-09-07  3345  	err =3D hdev->get_codec_config_da=
ta(hdev, ESCO_LINK, codec, &vnd_len,
9798fbdee88a89 Kiran K 2021-09-07  3346  					  &vnd_data);
9798fbdee88a89 Kiran K 2021-09-07  3347  	if (err < 0)
9798fbdee88a89 Kiran K 2021-09-07  3348  		goto error;
9798fbdee88a89 Kiran K 2021-09-07  3349  =

9798fbdee88a89 Kiran K 2021-09-07 @3350  	cmd =3D kzalloc(sizeof(*cmd) + vn=
d_len, GFP_KERNEL);
9798fbdee88a89 Kiran K 2021-09-07  3351  	if (!cmd) {
9798fbdee88a89 Kiran K 2021-09-07  3352  		err =3D -ENOMEM;
9798fbdee88a89 Kiran K 2021-09-07  3353  		goto error;
9798fbdee88a89 Kiran K 2021-09-07  3354  	}
9798fbdee88a89 Kiran K 2021-09-07  3355  =

9798fbdee88a89 Kiran K 2021-09-07  3356  	err =3D hdev->get_data_path_id(hd=
ev, &cmd->data_path_id);
9798fbdee88a89 Kiran K 2021-09-07  3357  	if (err < 0)
9798fbdee88a89 Kiran K 2021-09-07  3358  		goto error;
9798fbdee88a89 Kiran K 2021-09-07  3359  =

9798fbdee88a89 Kiran K 2021-09-07  3360  	cmd->vnd_len =3D vnd_len;
9798fbdee88a89 Kiran K 2021-09-07  3361  	memcpy(cmd->vnd_data, vnd_data, v=
nd_len);
9798fbdee88a89 Kiran K 2021-09-07  3362  =

9798fbdee88a89 Kiran K 2021-09-07  3363  	cmd->direction =3D 0x00;
9798fbdee88a89 Kiran K 2021-09-07  3364  	hci_req_add(&req, HCI_CONFIGURE_D=
ATA_PATH, sizeof(*cmd) + vnd_len, cmd);
9798fbdee88a89 Kiran K 2021-09-07  3365  =

9798fbdee88a89 Kiran K 2021-09-07  3366  	cmd->direction =3D 0x01;
9798fbdee88a89 Kiran K 2021-09-07  3367  	hci_req_add(&req, HCI_CONFIGURE_D=
ATA_PATH, sizeof(*cmd) + vnd_len, cmd);
9798fbdee88a89 Kiran K 2021-09-07  3368  =

9798fbdee88a89 Kiran K 2021-09-07  3369  	err =3D hci_req_run(&req, config_=
data_path_complete);
9798fbdee88a89 Kiran K 2021-09-07  3370  error:
9798fbdee88a89 Kiran K 2021-09-07  3371  =

9798fbdee88a89 Kiran K 2021-09-07  3372  	kfree(cmd);
9798fbdee88a89 Kiran K 2021-09-07  3373  	kfree(vnd_data);
9798fbdee88a89 Kiran K 2021-09-07  3374  	return err;
9798fbdee88a89 Kiran K 2021-09-07  3375  }
9798fbdee88a89 Kiran K 2021-09-07  3376  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8463511161389638595==--

