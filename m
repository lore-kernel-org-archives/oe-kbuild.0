Content-Type: multipart/mixed; boundary="===============3007328518711075821=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Bluetooth: btqca: sequential validation
Date: Thu, 09 Dec 2021 03:38:23 +0800
Message-ID: <202112090340.ohuHwTLx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3007328518711075821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1638952007-32222-1-git-send-email-quic_saluvala@quicinc.com>
References: <1638952007-32222-1-git-send-email-quic_saluvala@quicinc.com>
TO: Sai Teja Aluvala <quic_saluvala@quicinc.com>
TO: marcel(a)holtmann.org
TO: johan.hedberg(a)gmail.com
CC: mka(a)chromium.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-bluetooth(a)vger.kernel.org
CC: quic_hemantg(a)quicinc.com
CC: linux-arm-msm(a)vger.kernel.org
CC: quic_bgodavar(a)quicinc.com
CC: rjliao(a)codeaurora.org
CC: hbandi(a)codeaurora.org

Hi Sai,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on linux/master linus/master v5.16-rc4 next-202112=
08]
[cannot apply to bluetooth/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sai-Teja-Aluvala/Bluetooth=
-btqca-sequential-validation/20211208-162834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-m031-20211207 (https://download.01.org/0day-ci/archi=
ve/20211209/202112090340.ohuHwTLx-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/bluetooth/btqca.c:180 qca_send_patch_config_cmd() error: use kfree_=
skb() here instead of kfree(skb)

Old smatch warnings:
drivers/bluetooth/btqca.c:134 qca_read_fw_build_info() warn: potential spec=
tre issue 'build_label' [w] (local cap)

vim +180 drivers/bluetooth/btqca.c

c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  143  =

1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  144  int qca_send=
_patch_config_cmd(struct hci_dev *hdev, enum qca_btsoc_type soc_type)
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  145  {
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  146  	struct sk_b=
uff *skb;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  147  	int err =3D=
 0;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  148  	u8 cmd[5] =
=3D {EDL_PATCH_CONFIG_CMD, 0x01, 0, 0, 0};
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  149  	u8 rlen =3D=
 0x02;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  150  	struct edl_=
event_hdr *edl;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  151  	u8 rtype =
=3D EDL_PATCH_CONFIG_CMD;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  152  =

1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  153  	bt_dev_dbg(=
hdev, "QCA Patch config");
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  154  =

1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  155  	skb =3D __h=
ci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CONFIG_CMD_LEN,
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  156  			cmd, HCI_=
EV_VENDOR, HCI_INIT_TIMEOUT);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  157  	if (IS_ERR(=
skb)) {
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  158  		err =3D PT=
R_ERR(skb);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  159  		bt_dev_err=
(hdev, "Sending QCA Patch config failed (%d)", err);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  160  		return err;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  161  	}
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  162  	if (skb->le=
n !=3D rlen) {
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  163  		bt_dev_err=
(hdev, "QCA Patch config cmd size mismatch len %d", skb->len);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  164  		err =3D -E=
ILSEQ;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  165  		goto out;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  166  	}
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  167  	edl =3D (st=
ruct edl_event_hdr *)(skb->data);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  168  	if (!edl) {
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  169  		bt_dev_err=
(hdev, "QCA Patch config with no header");
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  170  		err =3D -E=
ILSEQ;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  171  		goto out;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  172  	}
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  173  	if (edl->cr=
esp !=3D EDL_PATCH_CONFIG_RES_EVT || edl->rtype !=3D rtype) {
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  174  		bt_dev_err=
(hdev, "QCA Wrong packet received %d %d", edl->cresp,
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  175  		 edl->rtyp=
e);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  176  		err =3D -E=
IO;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  177  		goto out;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  178  	}
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  179  out:
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08 @180  	kfree(skb);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  181  	if (err)
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  182  		bt_dev_err=
(hdev, "QCA Patch config cmd failed (%d)", err);
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  183  =

1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  184  	return err;
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  185  }
1d58d86c5374c4 Sai Teja Aluvala               2021-12-08  186  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3007328518711075821==--

