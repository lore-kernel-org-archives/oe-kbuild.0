Content-Type: multipart/mixed; boundary="===============5031883406858404027=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] Bluetooth: Add initial implementation of CIS connections
Date: Mon, 27 Jan 2020 11:49:47 +0300
Message-ID: <20200127084947.GK1870@kadam>
In-Reply-To: <20200117000137.29166-1-luiz.dentz@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5031883406858404027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luiz,


url:    https://github.com/0day-ci/linux/commits/Luiz-Augusto-von-Dentz/Blu=
etooth-Add-initial-implementation-of-CIS-connections/20200118-034643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/hci_event.c:3188 hci_cc_le_set_cig_params() warn: inconsisten=
t returns 'hdev->lock'.

Old smatch warnings:
net/bluetooth/hci_event.c:5567 hci_le_adv_report_evt() warn: potential spec=
tre issue 'ev->data' [r] (local cap)
net/bluetooth/hci_event.c:5569 hci_le_adv_report_evt() warn: possible spect=
re second half.  'rssi'

# https://github.com/0day-ci/linux/commit/88d6b37aa7d732b2392e953206c323156=
0035c3c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 88d6b37aa7d732b2392e953206c3231560035c3c
vim +3188 net/bluetooth/hci_event.c

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3150  static void hci_cc_=
le_set_cig_params(struct hci_dev *hdev, struct sk_buff *skb)
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3151  {
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3152  	struct hci_rp_le_s=
et_cig_params *rp =3D (void *) skb->data;
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3153  	struct hci_conn *c=
onn;
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3154  	int i =3D 0;
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3155  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3156  	BT_DBG("%s status =
0x%2.2x", hdev->name, rp->status);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3157  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3158  	hci_dev_lock(hdev);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3159  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3160  	rcu_read_lock();
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3161  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3162  	list_for_each_entr=
y_rcu(conn, &hdev->conn_hash.list, list) {
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3163  		if (conn->type !=
=3D ISO_LINK || conn->handle ||
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3164  		    conn->state =
=3D=3D BT_CONNECTED)
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3165  			continue;
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3166  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3167  		if (rp->status) {
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3168  			conn->state =3D =
BT_CLOSED;
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3169  			hci_connect_cfm(=
conn, rp->status);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3170  			hci_conn_del(con=
n);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3171  			return;
                                                                           =
     ^^^^^^^
goto unlock

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3172  		}
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3173  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3174  		conn->handle =3D =
__le16_to_cpu(rp->handle[i++]);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3175  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3176  		BT_DBG("%p handle=
 0x%4.4x", conn, conn->handle);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3177  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3178  		/* Create CIS if =
LE is already connected */
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3179  		if (conn->link->s=
tate =3D=3D BT_CONNECTED)
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3180  			hci_le_create_ci=
s(conn->link);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3181  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3182  		if (i =3D=3D rp->=
num_handles)
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3183  			break;
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3184  	}
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3185  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3186  	rcu_read_unlock();
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3187  =

88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16 @3188  	hci_dev_unlock(hde=
v);
88d6b37aa7d732 Luiz Augusto von Dentz 2020-01-16  3189  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5031883406858404027==--

