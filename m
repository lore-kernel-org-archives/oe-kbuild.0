Content-Type: multipart/mixed; boundary="===============4828959435994228027=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 483/6579] net/bluetooth/mgmt.c:7476:2: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]
Date: Sat, 11 Dec 2021 13:21:11 +0800
Message-ID: <202112111326.Ahz37Scu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4828959435994228027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Brian Gix <brian.gix@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea922272cbe547bdf58da2aaf240d59782c6a009
commit: 177e77a30e469af96e301658facf6a12a6e9e200 [483/6579] Bluetooth: hci_=
sync: Convert MGMT_OP_READ_LOCAL_OOB_EXT_DATA
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
compiler: sparc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/bluetooth/mgmt.c:7476:2: warning: Assignment of function parameter h=
as no effect outside the function. [uselessAssignmentArg]
    err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
    ^
   net/bluetooth/mgmt.c:7865:45: warning: Opposite expression on both sides=
 of '&'. [oppositeExpression]
        ((phy_flags && (phy_flags ^ (phy_flags & -phy_flags)))))
                                               ^

vim +7476 net/bluetooth/mgmt.c

9713c17b086c1e Marcel Holtmann 2014-07-06  7366  =

177e77a30e469a Brian Gix       2021-10-27  7367  static void read_local_oob=
_ext_data_complete(struct hci_dev *hdev, void *data,
177e77a30e469a Brian Gix       2021-10-27  7368  					     int err)
40f66c05c36077 Johan Hedberg   2015-04-07  7369  {
40f66c05c36077 Johan Hedberg   2015-04-07  7370  	const struct mgmt_cp_read=
_local_oob_ext_data *mgmt_cp;
40f66c05c36077 Johan Hedberg   2015-04-07  7371  	struct mgmt_rp_read_local=
_oob_ext_data *mgmt_rp;
40f66c05c36077 Johan Hedberg   2015-04-07  7372  	u8 *h192, *r192, *h256, *=
r256;
177e77a30e469a Brian Gix       2021-10-27  7373  	struct mgmt_pending_cmd *=
cmd =3D data;
177e77a30e469a Brian Gix       2021-10-27  7374  	struct sk_buff *skb =3D c=
md->skb;
177e77a30e469a Brian Gix       2021-10-27  7375  	u8 status =3D mgmt_status=
(err);
40f66c05c36077 Johan Hedberg   2015-04-07  7376  	u16 eir_len;
40f66c05c36077 Johan Hedberg   2015-04-07  7377  =

177e77a30e469a Brian Gix       2021-10-27  7378  	if (!status) {
177e77a30e469a Brian Gix       2021-10-27  7379  		if (!skb)
177e77a30e469a Brian Gix       2021-10-27  7380  			status =3D MGMT_STATUS_=
FAILED;
177e77a30e469a Brian Gix       2021-10-27  7381  		else if (IS_ERR(skb))
177e77a30e469a Brian Gix       2021-10-27  7382  			status =3D mgmt_status(=
PTR_ERR(skb));
177e77a30e469a Brian Gix       2021-10-27  7383  		else
177e77a30e469a Brian Gix       2021-10-27  7384  			status =3D mgmt_status(=
skb->data[0]);
177e77a30e469a Brian Gix       2021-10-27  7385  	}
40f66c05c36077 Johan Hedberg   2015-04-07  7386  =

177e77a30e469a Brian Gix       2021-10-27  7387  	bt_dev_dbg(hdev, "status =
%u", status);
40f66c05c36077 Johan Hedberg   2015-04-07  7388  =

40f66c05c36077 Johan Hedberg   2015-04-07  7389  	mgmt_cp =3D cmd->param;
40f66c05c36077 Johan Hedberg   2015-04-07  7390  =

40f66c05c36077 Johan Hedberg   2015-04-07  7391  	if (status) {
40f66c05c36077 Johan Hedberg   2015-04-07  7392  		status =3D mgmt_status(s=
tatus);
40f66c05c36077 Johan Hedberg   2015-04-07  7393  		eir_len =3D 0;
40f66c05c36077 Johan Hedberg   2015-04-07  7394  =

40f66c05c36077 Johan Hedberg   2015-04-07  7395  		h192 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7396  		r192 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7397  		h256 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7398  		r256 =3D NULL;
177e77a30e469a Brian Gix       2021-10-27  7399  	} else if (!bredr_sc_enab=
led(hdev)) {
40f66c05c36077 Johan Hedberg   2015-04-07  7400  		struct hci_rp_read_local=
_oob_data *rp;
40f66c05c36077 Johan Hedberg   2015-04-07  7401  =

40f66c05c36077 Johan Hedberg   2015-04-07  7402  		if (skb->len !=3D sizeof=
(*rp)) {
40f66c05c36077 Johan Hedberg   2015-04-07  7403  			status =3D MGMT_STATUS_=
FAILED;
40f66c05c36077 Johan Hedberg   2015-04-07  7404  			eir_len =3D 0;
40f66c05c36077 Johan Hedberg   2015-04-07  7405  		} else {
40f66c05c36077 Johan Hedberg   2015-04-07  7406  			status =3D MGMT_STATUS_=
SUCCESS;
40f66c05c36077 Johan Hedberg   2015-04-07  7407  			rp =3D (void *)skb->dat=
a;
40f66c05c36077 Johan Hedberg   2015-04-07  7408  =

40f66c05c36077 Johan Hedberg   2015-04-07  7409  			eir_len =3D 5 + 18 + 18;
40f66c05c36077 Johan Hedberg   2015-04-07  7410  			h192 =3D rp->hash;
40f66c05c36077 Johan Hedberg   2015-04-07  7411  			r192 =3D rp->rand;
40f66c05c36077 Johan Hedberg   2015-04-07  7412  			h256 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7413  			r256 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7414  		}
40f66c05c36077 Johan Hedberg   2015-04-07  7415  	} else {
40f66c05c36077 Johan Hedberg   2015-04-07  7416  		struct hci_rp_read_local=
_oob_ext_data *rp;
40f66c05c36077 Johan Hedberg   2015-04-07  7417  =

40f66c05c36077 Johan Hedberg   2015-04-07  7418  		if (skb->len !=3D sizeof=
(*rp)) {
40f66c05c36077 Johan Hedberg   2015-04-07  7419  			status =3D MGMT_STATUS_=
FAILED;
40f66c05c36077 Johan Hedberg   2015-04-07  7420  			eir_len =3D 0;
40f66c05c36077 Johan Hedberg   2015-04-07  7421  		} else {
40f66c05c36077 Johan Hedberg   2015-04-07  7422  			status =3D MGMT_STATUS_=
SUCCESS;
40f66c05c36077 Johan Hedberg   2015-04-07  7423  			rp =3D (void *)skb->dat=
a;
40f66c05c36077 Johan Hedberg   2015-04-07  7424  =

40f66c05c36077 Johan Hedberg   2015-04-07  7425  			if (hci_dev_test_flag(h=
dev, HCI_SC_ONLY)) {
40f66c05c36077 Johan Hedberg   2015-04-07  7426  				eir_len =3D 5 + 18 + 1=
8;
40f66c05c36077 Johan Hedberg   2015-04-07  7427  				h192 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7428  				r192 =3D NULL;
40f66c05c36077 Johan Hedberg   2015-04-07  7429  			} else {
40f66c05c36077 Johan Hedberg   2015-04-07  7430  				eir_len =3D 5 + 18 + 1=
8 + 18 + 18;
40f66c05c36077 Johan Hedberg   2015-04-07  7431  				h192 =3D rp->hash192;
40f66c05c36077 Johan Hedberg   2015-04-07  7432  				r192 =3D rp->rand192;
40f66c05c36077 Johan Hedberg   2015-04-07  7433  			}
40f66c05c36077 Johan Hedberg   2015-04-07  7434  =

40f66c05c36077 Johan Hedberg   2015-04-07  7435  			h256 =3D rp->hash256;
40f66c05c36077 Johan Hedberg   2015-04-07  7436  			r256 =3D rp->rand256;
40f66c05c36077 Johan Hedberg   2015-04-07  7437  		}
40f66c05c36077 Johan Hedberg   2015-04-07  7438  	}
40f66c05c36077 Johan Hedberg   2015-04-07  7439  =

40f66c05c36077 Johan Hedberg   2015-04-07  7440  	mgmt_rp =3D kmalloc(sizeo=
f(*mgmt_rp) + eir_len, GFP_KERNEL);
40f66c05c36077 Johan Hedberg   2015-04-07  7441  	if (!mgmt_rp)
40f66c05c36077 Johan Hedberg   2015-04-07  7442  		goto done;
40f66c05c36077 Johan Hedberg   2015-04-07  7443  =

a31e5a4158d035 Kees Cook       2021-08-17  7444  	if (eir_len =3D=3D 0)
40f66c05c36077 Johan Hedberg   2015-04-07  7445  		goto send_rsp;
40f66c05c36077 Johan Hedberg   2015-04-07  7446  =

40f66c05c36077 Johan Hedberg   2015-04-07  7447  	eir_len =3D eir_append_da=
ta(mgmt_rp->eir, 0, EIR_CLASS_OF_DEV,
40f66c05c36077 Johan Hedberg   2015-04-07  7448  				  hdev->dev_class, 3);
40f66c05c36077 Johan Hedberg   2015-04-07  7449  =

40f66c05c36077 Johan Hedberg   2015-04-07  7450  	if (h192 && r192) {
40f66c05c36077 Johan Hedberg   2015-04-07  7451  		eir_len =3D eir_append_d=
ata(mgmt_rp->eir, eir_len,
40f66c05c36077 Johan Hedberg   2015-04-07  7452  					  EIR_SSP_HASH_C192, =
h192, 16);
40f66c05c36077 Johan Hedberg   2015-04-07  7453  		eir_len =3D eir_append_d=
ata(mgmt_rp->eir, eir_len,
40f66c05c36077 Johan Hedberg   2015-04-07  7454  					  EIR_SSP_RAND_R192, =
r192, 16);
40f66c05c36077 Johan Hedberg   2015-04-07  7455  	}
40f66c05c36077 Johan Hedberg   2015-04-07  7456  =

40f66c05c36077 Johan Hedberg   2015-04-07  7457  	if (h256 && r256) {
40f66c05c36077 Johan Hedberg   2015-04-07  7458  		eir_len =3D eir_append_d=
ata(mgmt_rp->eir, eir_len,
40f66c05c36077 Johan Hedberg   2015-04-07  7459  					  EIR_SSP_HASH_C256, =
h256, 16);
40f66c05c36077 Johan Hedberg   2015-04-07  7460  		eir_len =3D eir_append_d=
ata(mgmt_rp->eir, eir_len,
40f66c05c36077 Johan Hedberg   2015-04-07  7461  					  EIR_SSP_RAND_R256, =
r256, 16);
40f66c05c36077 Johan Hedberg   2015-04-07  7462  	}
40f66c05c36077 Johan Hedberg   2015-04-07  7463  =

40f66c05c36077 Johan Hedberg   2015-04-07  7464  send_rsp:
40f66c05c36077 Johan Hedberg   2015-04-07  7465  	mgmt_rp->type =3D mgmt_cp=
->type;
40f66c05c36077 Johan Hedberg   2015-04-07  7466  	mgmt_rp->eir_len =3D cpu_=
to_le16(eir_len);
40f66c05c36077 Johan Hedberg   2015-04-07  7467  =

40f66c05c36077 Johan Hedberg   2015-04-07  7468  	err =3D mgmt_cmd_complete=
(cmd->sk, hdev->id,
40f66c05c36077 Johan Hedberg   2015-04-07  7469  				MGMT_OP_READ_LOCAL_OOB=
_EXT_DATA, status,
40f66c05c36077 Johan Hedberg   2015-04-07  7470  				mgmt_rp, sizeof(*mgmt_=
rp) + eir_len);
40f66c05c36077 Johan Hedberg   2015-04-07  7471  	if (err < 0 || status)
40f66c05c36077 Johan Hedberg   2015-04-07  7472  		goto done;
40f66c05c36077 Johan Hedberg   2015-04-07  7473  =

40f66c05c36077 Johan Hedberg   2015-04-07  7474  	hci_sock_set_flag(cmd->sk=
, HCI_MGMT_OOB_DATA_EVENTS);
40f66c05c36077 Johan Hedberg   2015-04-07  7475  =

40f66c05c36077 Johan Hedberg   2015-04-07 @7476  	err =3D mgmt_limited_even=
t(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
40f66c05c36077 Johan Hedberg   2015-04-07  7477  				 mgmt_rp, sizeof(*mgmt=
_rp) + eir_len,
40f66c05c36077 Johan Hedberg   2015-04-07  7478  				 HCI_MGMT_OOB_DATA_EVE=
NTS, cmd->sk);
40f66c05c36077 Johan Hedberg   2015-04-07  7479  done:
177e77a30e469a Brian Gix       2021-10-27  7480  	if (skb && !IS_ERR(skb))
177e77a30e469a Brian Gix       2021-10-27  7481  		kfree_skb(skb);
177e77a30e469a Brian Gix       2021-10-27  7482  =

40f66c05c36077 Johan Hedberg   2015-04-07  7483  	kfree(mgmt_rp);
40f66c05c36077 Johan Hedberg   2015-04-07  7484  	mgmt_pending_remove(cmd);
40f66c05c36077 Johan Hedberg   2015-04-07  7485  }
40f66c05c36077 Johan Hedberg   2015-04-07  7486  =


:::::: The code at line 7476 was first introduced by commit
:::::: 40f66c05c360777e847033ddbe076d88123719d1 Bluetooth: Add local SSP OO=
B data to OOB ext data mgmt command

:::::: TO: Johan Hedberg <johan.hedberg@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4828959435994228027==--

