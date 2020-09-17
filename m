Content-Type: multipart/mixed; boundary="===============2522702311617874876=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_request.c:1022:25: warning: Variable 'hdev->scanning_paused' is reassigned a value before the old one has been used.
Date: Thu, 17 Sep 2020 20:02:38 +0800
Message-ID: <202009172034.21hAYr66%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2522702311617874876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Abhishek Pandit-Subedi" <abhishekpandit@chromium.org>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5925fa68fe8244651b3f78a88c4af99190a88f0d
commit: 4f40afc6c76451daff7d0dcfc8a3d113ccf65bfc Bluetooth: Handle BR/EDR d=
evices during suspend
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   net/bluetooth/hci_request.c:1461:4: warning: Assignment of function para=
meter has no effect outside the function. Did you forget dereferencing it? =
[uselessAssignmentPtrArg]
      ptr +=3D 3;
      ^
>> net/bluetooth/hci_request.c:1022:25: warning: Variable 'hdev->scanning_p=
aused' is reassigned a value before the old one has been used. [redundantAs=
signment]
     hdev->scanning_paused =3D true;
                           ^
   net/bluetooth/hci_request.c:1018:25: note: Variable 'hdev->scanning_paus=
ed' is reassigned a value before the old one has been used.
     hdev->scanning_paused =3D false;
                           ^
   net/bluetooth/hci_request.c:1022:25: note: Variable 'hdev->scanning_paus=
ed' is reassigned a value before the old one has been used.
     hdev->scanning_paused =3D true;
                           ^
   net/bluetooth/hci_request.c:1764:42: warning: Local variable cp shadows =
outer variable [shadowVar]
     struct hci_cp_le_set_adv_set_rand_addr cp;
                                            ^
   net/bluetooth/hci_request.c:1678:38: note: Shadowed declaration
    struct hci_cp_le_set_ext_adv_params cp;
                                        ^
   net/bluetooth/hci_request.c:1764:42: note: Shadow variable
     struct hci_cp_le_set_adv_set_rand_addr cp;
                                            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D4f40afc6c76451daff7d0dcfc8a3d113ccf65bfc
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 4f40afc6c76451daff7d0dcfc8a3d113ccf65bfc
vim +1022 net/bluetooth/hci_request.c

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   969  =

9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   970  /* Call with hci_d=
ev_lock */
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   971  void hci_req_prepa=
re_suspend(struct hci_dev *hdev, enum suspended_state next)
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   972  {
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   973  	struct hci_conn *=
conn;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   974  	struct hci_reques=
t req;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   975  	u8 page_scan;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   976  	int disconnect_co=
unter;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   977  =

9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   978  	if (next =3D=3D h=
dev->suspend_state) {
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   979  		bt_dev_dbg(hdev,=
 "Same state before and after: %d", next);
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   980  		goto done;
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   981  	}
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   982  =

9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11   983  	hdev->suspend_sta=
te =3D next;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   984  	hci_req_init(&req=
, hdev);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   985  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   986  	if (next =3D=3D B=
T_SUSPEND_DISCONNECT) {
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   987  		/* Mark device a=
s suspended */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   988  		hdev->suspended =
=3D true;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   989  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   990  		/* Disable page =
scan */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   991  		page_scan =3D SC=
AN_DISABLED;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   992  		hci_req_add(&req=
, HCI_OP_WRITE_SCAN_ENABLE, 1, &page_scan);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   993  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   994  		/* Mark task nee=
ding completion */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   995  		set_bit(SUSPEND_=
SCAN_DISABLE, hdev->suspend_tasks);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   996  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   997  		/* Prevent disco=
nnects from causing scanning to be re-enabled */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   998  		hdev->scanning_p=
aused =3D true;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11   999  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1000  		/* Run commands =
before disconnecting */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1001  		hci_req_run(&req=
, suspend_req_complete);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1002  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1003  		disconnect_count=
er =3D 0;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1004  		/* Soft disconne=
ct everything (power off) */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1005  		list_for_each_en=
try(conn, &hdev->conn_hash.list, list) {
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1006  			hci_disconnect(=
conn, HCI_ERROR_REMOTE_POWER_OFF);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1007  			disconnect_coun=
ter++;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1008  		}
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1009  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1010  		if (disconnect_c=
ounter > 0) {
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1011  			bt_dev_dbg(hdev,
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1012  				   "Had %d dis=
connects. Will wait on them",
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1013  				   disconnect_=
counter);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1014  			set_bit(SUSPEND=
_DISCONNECTING, hdev->suspend_tasks);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1015  		}
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1016  	} else if (next =
=3D=3D BT_SUSPEND_COMPLETE) {
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1017  		/* Unpause to ta=
ke care of updating scanning params */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1018  		hdev->scanning_p=
aused =3D false;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1019  		/* Enable event =
filter for paired devices */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1020  		hci_req_set_even=
t_filter(&req);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1021  		/* Pause scan ch=
anges again. */
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11 @1022  		hdev->scanning_p=
aused =3D true;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1023  		hci_req_run(&req=
, suspend_req_complete);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1024  	} else {
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1025  		hdev->suspended =
=3D false;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1026  		hdev->scanning_p=
aused =3D false;
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1027  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1028  		hci_req_clear_ev=
ent_filter(&req);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1029  		hci_req_run(&req=
, suspend_req_complete);
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1030  	}
4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1031  =

4f40afc6c76451d Abhishek Pandit-Subedi 2020-03-11  1032  	hdev->suspend_sta=
te =3D next;
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11  1033  =

9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11  1034  done:
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11  1035  	clear_bit(SUSPEND=
_PREPARE_NOTIFIER, hdev->suspend_tasks);
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11  1036  	wake_up(&hdev->su=
spend_wait_q);
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11  1037  }
9952d90ea2885d7 Abhishek Pandit-Subedi 2020-03-11  1038  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2522702311617874876==--

