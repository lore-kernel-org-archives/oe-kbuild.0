Content-Type: multipart/mixed; boundary="===============7813732875623407294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/bluetooth/btqca.c:134 qca_read_fw_build_info() warn: potential spectre issue 'build_label' [w] (local cap)
Date: Sun, 12 Dec 2021 18:36:47 +0800
Message-ID: <202112121846.bqkWvNCh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7813732875623407294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: c0187b0bd3e94c48050687d87b2c3c9fbae98ae9 Bluetooth: btqca: Add supp=
ort to read FW build version for WCN3991 BTSoC
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121846.bqkWvNCh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/bluetooth/btqca.c:134 qca_read_fw_build_info() warn: potential spec=
tre issue 'build_label' [w] (local cap)

vim +/build_label +134 drivers/bluetooth/btqca.c

83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   96  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   97  static int q=
ca_read_fw_build_info(struct hci_dev *hdev)
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   98  {
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   99  	struct sk_b=
uff *skb;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  100  	struct edl_=
event_hdr *edl;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  101  	char cmd, b=
uild_label[QCA_FW_BUILD_VER_LEN];
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  102  	int build_l=
bl_len, err =3D 0;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  103  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  104  	bt_dev_dbg(=
hdev, "QCA read fw build info");
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  105  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  106  	cmd =3D EDL=
_GET_BUILD_INFO_CMD;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  107  	skb =3D __h=
ci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  108  				&cmd, 0,=
 HCI_INIT_TIMEOUT);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  109  	if (IS_ERR(=
skb)) {
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  110  		err =3D PT=
R_ERR(skb);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  111  		bt_dev_err=
(hdev, "Reading QCA fw build info failed (%d)",
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  112  			   err);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  113  		return err;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  114  	}
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  115  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  116  	edl =3D (st=
ruct edl_event_hdr *)(skb->data);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  117  	if (!edl) {
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  118  		bt_dev_err=
(hdev, "QCA read fw build info with no header");
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  119  		err =3D -E=
ILSEQ;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  120  		goto out;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  121  	}
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  122  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  123  	if (edl->cr=
esp !=3D EDL_CMD_REQ_RES_EVT ||
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  124  	    edl->rt=
ype !=3D EDL_GET_BUILD_INFO_CMD) {
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  125  		bt_dev_err=
(hdev, "QCA Wrong packet received %d %d", edl->cresp,
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  126  			   edl->r=
type);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  127  		err =3D -E=
IO;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  128  		goto out;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  129  	}
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  130  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  131  	build_lbl_l=
en =3D edl->data[0];
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  132  	if (build_l=
bl_len <=3D QCA_FW_BUILD_VER_LEN - 1) {
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  133  		memcpy(bui=
ld_label, edl->data + 1, build_lbl_len);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08 @134  		*(build_la=
bel + build_lbl_len) =3D '\0';
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  135  	}
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  136  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  137  	hci_set_fw_=
info(hdev, "%s", build_label);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  138  =

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  139  out:
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  140  	kfree_skb(s=
kb);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  141  	return err;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  142  }
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7813732875623407294==--

