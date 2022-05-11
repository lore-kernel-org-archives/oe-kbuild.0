Content-Type: multipart/mixed; boundary="===============4002137659224412806=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_sync.c:170 __hci_cmd_sync_sk() error: (-2147483647) too low for ERR_PTR
Date: Thu, 12 May 2022 02:50:38 +0800
Message-ID: <202205120217.TO4wjOpr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4002137659224412806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marcel Holtmann <marcel@holtmann.org>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: 6a98e3836fa2077b169f10a35c2ca9952d53f987 Bluetooth: Add helper for =
serialized HCI command execution
date:   6 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 months ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220512/202205120217.TO4wjOpr-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/hci_sync.c:170 __hci_cmd_sync_sk() error: (-2147483647) too l=
ow for ERR_PTR

Old smatch warnings:
net/bluetooth/hci_sync.c:226 __hci_cmd_sync_status_sk() warn: passing zero =
to 'PTR_ERR'
net/bluetooth/hci_sync.c:228 __hci_cmd_sync_status_sk() warn: passing zero =
to 'PTR_ERR'

vim +170 net/bluetooth/hci_sync.c

6a98e3836fa207 Marcel Holtmann 2021-10-27  118  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  119  /* This function requires t=
he caller holds hdev->req_lock. */
6a98e3836fa207 Marcel Holtmann 2021-10-27  120  struct sk_buff *__hci_cmd_s=
ync_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
6a98e3836fa207 Marcel Holtmann 2021-10-27  121  				  const void *param, u8=
 event, u32 timeout,
6a98e3836fa207 Marcel Holtmann 2021-10-27  122  				  struct sock *sk)
6a98e3836fa207 Marcel Holtmann 2021-10-27  123  {
6a98e3836fa207 Marcel Holtmann 2021-10-27  124  	struct hci_request req;
6a98e3836fa207 Marcel Holtmann 2021-10-27  125  	struct sk_buff *skb;
6a98e3836fa207 Marcel Holtmann 2021-10-27  126  	int err =3D 0;
6a98e3836fa207 Marcel Holtmann 2021-10-27  127  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  128  	bt_dev_dbg(hdev, "");
6a98e3836fa207 Marcel Holtmann 2021-10-27  129  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  130  	hci_req_init(&req, hdev);
6a98e3836fa207 Marcel Holtmann 2021-10-27  131  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  132  	hci_cmd_sync_add(&req, opc=
ode, plen, param, event, sk);
6a98e3836fa207 Marcel Holtmann 2021-10-27  133  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  134  	hdev->req_status =3D HCI_R=
EQ_PEND;
6a98e3836fa207 Marcel Holtmann 2021-10-27  135  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  136  	err =3D hci_cmd_sync_run(&=
req);
6a98e3836fa207 Marcel Holtmann 2021-10-27  137  	if (err < 0)
6a98e3836fa207 Marcel Holtmann 2021-10-27  138  		return ERR_PTR(err);
6a98e3836fa207 Marcel Holtmann 2021-10-27  139  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  140  	err =3D wait_event_interru=
ptible_timeout(hdev->req_wait_q,
6a98e3836fa207 Marcel Holtmann 2021-10-27  141  					       hdev->req_statu=
s !=3D HCI_REQ_PEND,
6a98e3836fa207 Marcel Holtmann 2021-10-27  142  					       timeout);
6a98e3836fa207 Marcel Holtmann 2021-10-27  143  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  144  	if (err =3D=3D -ERESTARTSY=
S)
6a98e3836fa207 Marcel Holtmann 2021-10-27  145  		return ERR_PTR(-EINTR);
6a98e3836fa207 Marcel Holtmann 2021-10-27  146  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  147  	switch (hdev->req_status) {
6a98e3836fa207 Marcel Holtmann 2021-10-27  148  	case HCI_REQ_DONE:
6a98e3836fa207 Marcel Holtmann 2021-10-27  149  		err =3D -bt_to_errno(hdev=
->req_result);
6a98e3836fa207 Marcel Holtmann 2021-10-27  150  		break;
6a98e3836fa207 Marcel Holtmann 2021-10-27  151  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  152  	case HCI_REQ_CANCELED:
6a98e3836fa207 Marcel Holtmann 2021-10-27  153  		err =3D -hdev->req_result;
6a98e3836fa207 Marcel Holtmann 2021-10-27  154  		break;
6a98e3836fa207 Marcel Holtmann 2021-10-27  155  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  156  	default:
6a98e3836fa207 Marcel Holtmann 2021-10-27  157  		err =3D -ETIMEDOUT;
6a98e3836fa207 Marcel Holtmann 2021-10-27  158  		break;
6a98e3836fa207 Marcel Holtmann 2021-10-27  159  	}
6a98e3836fa207 Marcel Holtmann 2021-10-27  160  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  161  	hdev->req_status =3D 0;
6a98e3836fa207 Marcel Holtmann 2021-10-27  162  	hdev->req_result =3D 0;
6a98e3836fa207 Marcel Holtmann 2021-10-27  163  	skb =3D hdev->req_skb;
6a98e3836fa207 Marcel Holtmann 2021-10-27  164  	hdev->req_skb =3D NULL;
6a98e3836fa207 Marcel Holtmann 2021-10-27  165  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  166  	bt_dev_dbg(hdev, "end: err=
 %d", err);
6a98e3836fa207 Marcel Holtmann 2021-10-27  167  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  168  	if (err < 0) {
6a98e3836fa207 Marcel Holtmann 2021-10-27  169  		kfree_skb(skb);
6a98e3836fa207 Marcel Holtmann 2021-10-27 @170  		return ERR_PTR(err);
6a98e3836fa207 Marcel Holtmann 2021-10-27  171  	}
6a98e3836fa207 Marcel Holtmann 2021-10-27  172  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  173  	if (!skb)
6a98e3836fa207 Marcel Holtmann 2021-10-27  174  		return ERR_PTR(-ENODATA);
6a98e3836fa207 Marcel Holtmann 2021-10-27  175  =

6a98e3836fa207 Marcel Holtmann 2021-10-27  176  	return skb;
6a98e3836fa207 Marcel Holtmann 2021-10-27  177  }
6a98e3836fa207 Marcel Holtmann 2021-10-27  178  EXPORT_SYMBOL(__hci_cmd_syn=
c_sk);
6a98e3836fa207 Marcel Holtmann 2021-10-27  179  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4002137659224412806==--

