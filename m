Content-Type: multipart/mixed; boundary="===============7622900374462944476=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 1/3] bluetooth: msft: Handle MSFT Monitor Device Event
Date: Fri, 17 Dec 2021 14:58:25 +0800
Message-ID: <202112171439.KaggScQN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7622900374462944476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211216044839.v9.1.Ic0a40b84dee3825302890aaea690e73165c71820=
@changeid>
References: <20211216044839.v9.1.Ic0a40b84dee3825302890aaea690e73165c71820(=
a)changeid>
TO: Manish Mandlik <mmandlik@google.com>
TO: marcel(a)holtmann.org
TO: luiz.dentz(a)gmail.com
CC: chromeos-bluetooth-upstreaming(a)chromium.org
CC: linux-bluetooth(a)vger.kernel.org
CC: Manish Mandlik <mmandlik@google.com>
CC: "Miao-chen Chou" <mcchou@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi Manish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20211216]
[cannot apply to bluetooth/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manish-Mandlik/bluetooth-m=
sft-Handle-MSFT-Monitor-Device-Event/20211216-205227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021-20211216 (https://download.01.org/0day-ci/arch=
ive/20211217/202112171439.KaggScQN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bluetooth/msft.c:757 msft_vendor_evt() warn: inconsistent returns '&hde=
v->lock'.

vim +757 net/bluetooth/msft.c

e5af6a85decc8c1 Manish Mandlik         2021-12-16  713  =

3e54c5890c87a30 Luiz Augusto von Dentz 2021-12-01  714  void msft_vendor_ev=
t(struct hci_dev *hdev, void *data, struct sk_buff *skb)
145373cb1b1fcdb Miao-chen Chou         2020-04-03  715  {
145373cb1b1fcdb Miao-chen Chou         2020-04-03  716  	struct msft_data *=
msft =3D hdev->msft_data;
e5af6a85decc8c1 Manish Mandlik         2021-12-16  717  	u8 *evt_prefix;
e5af6a85decc8c1 Manish Mandlik         2021-12-16  718  	u8 *evt;
145373cb1b1fcdb Miao-chen Chou         2020-04-03  719  =

145373cb1b1fcdb Miao-chen Chou         2020-04-03  720  	if (!msft)
145373cb1b1fcdb Miao-chen Chou         2020-04-03  721  		return;
145373cb1b1fcdb Miao-chen Chou         2020-04-03  722  =

145373cb1b1fcdb Miao-chen Chou         2020-04-03  723  	/* When the extens=
ion has defined an event prefix, check that it
145373cb1b1fcdb Miao-chen Chou         2020-04-03  724  	 * matches, and ot=
herwise just return.
145373cb1b1fcdb Miao-chen Chou         2020-04-03  725  	 */
145373cb1b1fcdb Miao-chen Chou         2020-04-03  726  	if (msft->evt_pref=
ix_len > 0) {
e5af6a85decc8c1 Manish Mandlik         2021-12-16  727  		evt_prefix =3D ms=
ft_skb_pull(hdev, skb, 0, msft->evt_prefix_len);
e5af6a85decc8c1 Manish Mandlik         2021-12-16  728  		if (!evt_prefix)
145373cb1b1fcdb Miao-chen Chou         2020-04-03  729  			return;
145373cb1b1fcdb Miao-chen Chou         2020-04-03  730  =

e5af6a85decc8c1 Manish Mandlik         2021-12-16  731  		if (memcmp(evt_pr=
efix, msft->evt_prefix, msft->evt_prefix_len))
145373cb1b1fcdb Miao-chen Chou         2020-04-03  732  			return;
145373cb1b1fcdb Miao-chen Chou         2020-04-03  733  	}
145373cb1b1fcdb Miao-chen Chou         2020-04-03  734  =

145373cb1b1fcdb Miao-chen Chou         2020-04-03  735  	/* Every event sta=
rts at least with an event code and the rest of
145373cb1b1fcdb Miao-chen Chou         2020-04-03  736  	 * the data is var=
iable and depends on the event code.
145373cb1b1fcdb Miao-chen Chou         2020-04-03  737  	 */
145373cb1b1fcdb Miao-chen Chou         2020-04-03  738  	if (skb->len < 1)
145373cb1b1fcdb Miao-chen Chou         2020-04-03  739  		return;
145373cb1b1fcdb Miao-chen Chou         2020-04-03  740  =

e5af6a85decc8c1 Manish Mandlik         2021-12-16  741  	hci_dev_lock(hdev);
145373cb1b1fcdb Miao-chen Chou         2020-04-03  742  =

e5af6a85decc8c1 Manish Mandlik         2021-12-16  743  	evt =3D msft_skb_p=
ull(hdev, skb, 0, sizeof(*evt));
e5af6a85decc8c1 Manish Mandlik         2021-12-16  744  	if (!evt)
e5af6a85decc8c1 Manish Mandlik         2021-12-16  745  		return;
e5af6a85decc8c1 Manish Mandlik         2021-12-16  746  =

e5af6a85decc8c1 Manish Mandlik         2021-12-16  747  	switch (*evt) {
e5af6a85decc8c1 Manish Mandlik         2021-12-16  748  	case MSFT_EV_LE_MO=
NITOR_DEVICE:
e5af6a85decc8c1 Manish Mandlik         2021-12-16  749  		msft_monitor_devi=
ce_evt(hdev, skb);
e5af6a85decc8c1 Manish Mandlik         2021-12-16  750  		break;
e5af6a85decc8c1 Manish Mandlik         2021-12-16  751  =

e5af6a85decc8c1 Manish Mandlik         2021-12-16  752  	default:
e5af6a85decc8c1 Manish Mandlik         2021-12-16  753  		bt_dev_dbg(hdev, =
"MSFT vendor event 0x%02x", *evt);
e5af6a85decc8c1 Manish Mandlik         2021-12-16  754  		break;
e5af6a85decc8c1 Manish Mandlik         2021-12-16  755  	}
e5af6a85decc8c1 Manish Mandlik         2021-12-16  756  =

e5af6a85decc8c1 Manish Mandlik         2021-12-16 @757  	hci_dev_unlock(hde=
v);
145373cb1b1fcdb Miao-chen Chou         2020-04-03  758  }
e5e1e7fd470ccf2 Miao-chen Chou         2020-06-17  759  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7622900374462944476==--

