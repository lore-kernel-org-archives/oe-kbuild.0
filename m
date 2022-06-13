Content-Type: multipart/mixed; boundary="===============6228281581672634920=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nfc/st21nfca/se.c:343 st21nfca_connectivity_event_received() warn: possible spectre second half. 'params_len'
Date: Mon, 13 Jun 2022 12:24:28 +0800
Message-ID: <202206131240.rND1EfVM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6228281581672634920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Martin Faltesek <mfaltesek@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Guenter Roeck <groeck@chromium.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: f2e19b36593caed4c977c2f55aeba7408aeb2132 nfc: st21nfca: fix incorre=
ct sizing calculations in EVT_TRANSACTION
date:   4 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m031-20220613 (https://download.01.org/0day-ci/arch=
ive/20220613/202206131240.rND1EfVM-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/nfc/st21nfca/se.c:343 st21nfca_connectivity_event_received() warn: =
possible spectre second half.  'params_len'

Old smatch warnings:
drivers/nfc/st21nfca/se.c:337 st21nfca_connectivity_event_received() warn: =
potential spectre issue 'skb->data' [r]

vim +/params_len +343 drivers/nfc/st21nfca/se.c

2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  291  =

2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  292  /*
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  293   * Returns:
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  294   * <=3D 0: driver handled the event, skb consumed
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  295   *    1: driver does not handle the event, please do standard pro=
cessing
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  296   */
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  297  int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev=
, u8 host,
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  298  				u8 event, struct sk_buff *skb)
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  299  {
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  300  	int r =3D 0;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  301  	struct device *dev =3D &hdev->ndev->dev;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  302  	struct nfc_evt_transaction *transaction;
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  303  	u32 aid_len;
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  304  	u8 params_len;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  305  =

2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  306  	pr_debug("connectivity gate event: %x\n", event);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  307  =

2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  308  	switch (event) {
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  309  	case ST21NFCA_EVT_CONNECTIVITY:
72c54c42b29439 drivers/nfc/st21nfca/se.c          Christophe Ricard 2015-12=
-23  310  		r =3D nfc_se_connectivity(hdev->ndev, host);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  311  	break;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  312  	case ST21NFCA_EVT_TRANSACTION:
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  313  		/* According to specification etsi 102 622
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03=
-31  314  		 * 11.2.2.4 EVT_TRANSACTION Table 52
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03=
-31  315  		 * Description	Tag	Length
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03=
-31  316  		 * AID		81	5 to 16
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03=
-31  317  		 * PARAMETERS	82	0 to 255
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  318  		 *
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  319  		 * The key differences are aid storage length is variably sized
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  320  		 * in the packet, but fixed in nfc_evt_transaction, and that th=
e aid_len
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  321  		 * is u8 in the packet, but u32 in the structure, and the tags =
in
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  322  		 * the packet are not included in nfc_evt_transaction.
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  323  		 *
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  324  		 * size in bytes: 1          1       5-16 1             1      =
     0-255
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  325  		 * offset:        0          1       2    aid_len + 2   aid_len=
 + 3 aid_len + 4
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  326  		 * member name:   aid_tag(M) aid_len aid  params_tag(M) params_=
len  params
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  327  		 * example:       0x81       5-16    X    0x82 0-255    X
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03=
-31  328  		 */
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  329  		if (skb->len < 2 || skb->data[0] !=3D NFC_EVT_TRANSACTION_AID_T=
AG)
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  330  			return -EPROTO;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  331  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  332  		aid_len =3D skb->data[1];
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01=
-11  333  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  334  		if (skb->len < aid_len + 4 || aid_len > sizeof(transaction->aid=
))
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  335  			return -EPROTO;
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01=
-11  336  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  337  		params_len =3D skb->data[aid_len + 3];
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  338  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  339  		/* Verify PARAMETERS tag is (82), and final check that there is=
 enough
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  340  		 * space in the packet to read everything.
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  341  		 */
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  342  		if ((skb->data[aid_len + 2] !=3D NFC_EVT_TRANSACTION_PARAMS_TAG=
) ||
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06 @343  		    (skb->len < aid_len + 4 + params_len))
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  344  			return -EPROTO;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  345  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  346  		transaction =3D devm_kzalloc(dev, sizeof(*transaction) + params=
_len, GFP_KERNEL);
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  347  		if (!transaction)
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  348  			return -ENOMEM;
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01=
-11  349  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  350  		transaction->aid_len =3D aid_len;
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  351  		transaction->params_len =3D params_len;
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01=
-11  352  =

f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  353  		memcpy(transaction->aid, &skb->data[2], aid_len);
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06=
-06  354  		memcpy(transaction->params, &skb->data[aid_len + 4], params_len=
);
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  355  =

26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02=
-01  356  		r =3D nfc_se_transaction(hdev->ndev, host, transaction);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  357  	break;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  358  	default:
a9e062d0599f49 drivers/nfc/st21nfca/se.c          Christophe Ricard 2015-10=
-25  359  		nfc_err(&hdev->ndev->dev, "Unexpected event on connectivity gat=
e\n");
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  360  		return 1;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  361  	}
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  362  	kfree_skb(skb);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  363  	return r;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  364  }
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  365  EXPORT_SYMBOL(st21nfca_connectivity_event_received);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01=
-27  366  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6228281581672634920==--

