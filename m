Content-Type: multipart/mixed; boundary="===============2250203496479830760=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/2] bluetooth: Handle MSFT Monitor Device Event
Date: Sun, 05 Dec 2021 04:35:32 +0800
Message-ID: <202112050416.RYsEcWkk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2250203496479830760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211202231123.v7.1.Ic0a40b84dee3825302890aaea690e73165c71820=
@changeid>
References: <20211202231123.v7.1.Ic0a40b84dee3825302890aaea690e73165c71820(=
a)changeid>
TO: Manish Mandlik <mmandlik@google.com>
TO: marcel(a)holtmann.org
TO: luiz.dentz(a)gmail.com
CC: linux-bluetooth(a)vger.kernel.org
CC: chromeos-bluetooth-upstreaming(a)chromium.org
CC: Manish Mandlik <mmandlik@google.com>
CC: "Miao-chen Chou" <mcchou@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi Manish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20211203]
[cannot apply to bluetooth/master v5.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manish-Mandlik/bluetooth-H=
andle-MSFT-Monitor-Device-Event/20211203-151659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20211203 (https://download.01.org/0day-ci/ar=
chive/20211205/202112050416.RYsEcWkk-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bluetooth/msft.c:312 msft_le_cancel_monitor_advertisement_cb() error: d=
ereferencing freed memory 'handle_data'

vim +/handle_data +312 net/bluetooth/msft.c

ce81843be24e9d Manish Mandlik         2021-09-21  265  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  266  static void msft_le_=
cancel_monitor_advertisement_cb(struct hci_dev *hdev,
182ee45da083db Luiz Augusto von Dentz 2021-10-27  267  						    u8 status,=
 u16 opcode,
182ee45da083db Luiz Augusto von Dentz 2021-10-27  268  						    struct sk_=
buff *skb)
ce81843be24e9d Manish Mandlik         2021-09-21  269  {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  270  	struct msft_cp_le_c=
ancel_monitor_advertisement *cp;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  271  	struct msft_rp_le_c=
ancel_monitor_advertisement *rp;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  272  	struct adv_monitor =
*monitor;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  273  	struct msft_monitor=
_advertisement_handle_data *handle_data;
ce81843be24e9d Manish Mandlik         2021-09-21  274  	struct msft_data *m=
sft =3D hdev->msft_data;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  275  	int err;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  276  	bool pending;
eb96f195e598b7 Manish Mandlik         2021-12-02  277  	struct monitored_de=
vice *dev, *tmp;
ce81843be24e9d Manish Mandlik         2021-09-21  278  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  279  	if (status)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  280  		goto done;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  281  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  282  	rp =3D (struct msft=
_rp_le_cancel_monitor_advertisement *)skb->data;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  283  	if (skb->len < size=
of(*rp)) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  284  		status =3D HCI_ERR=
OR_UNSPECIFIED;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  285  		goto done;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  286  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  287  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  288  	hci_dev_lock(hdev);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  289  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  290  	cp =3D hci_sent_cmd=
_data(hdev, hdev->msft_opcode);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  291  	handle_data =3D msf=
t_find_handle_data(hdev, cp->handle, false);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  292  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  293  	if (handle_data) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  294  		monitor =3D idr_fi=
nd(&hdev->adv_monitors_idr,
182ee45da083db Luiz Augusto von Dentz 2021-10-27  295  				   handle_data->=
mgmt_handle);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  296  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  297  		if (monitor && mon=
itor->state =3D=3D ADV_MONITOR_STATE_OFFLOADED)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  298  			monitor->state =
=3D ADV_MONITOR_STATE_REGISTERED;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  299  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  300  		/* Do not free the=
 monitor if it is being removed due to
182ee45da083db Luiz Augusto von Dentz 2021-10-27  301  		 * suspend. It wil=
l be re-monitored on resume.
182ee45da083db Luiz Augusto von Dentz 2021-10-27  302  		 */
182ee45da083db Luiz Augusto von Dentz 2021-10-27  303  		if (monitor && !ms=
ft->suspending)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  304  			hci_free_adv_moni=
tor(hdev, monitor);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  305  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  306  		list_del(&handle_d=
ata->list);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  307  		kfree(handle_data);
eb96f195e598b7 Manish Mandlik         2021-12-02  308  =

eb96f195e598b7 Manish Mandlik         2021-12-02  309  		/* Clear any monit=
ored devices by this Adv Monitor */
eb96f195e598b7 Manish Mandlik         2021-12-02  310  		list_for_each_entr=
y_safe(dev, tmp, &hdev->monitored_devices,
eb96f195e598b7 Manish Mandlik         2021-12-02  311  					 list) {
eb96f195e598b7 Manish Mandlik         2021-12-02 @312  			if (dev->handle =
=3D=3D handle_data->mgmt_handle) {
eb96f195e598b7 Manish Mandlik         2021-12-02  313  				list_del(&dev->l=
ist);
eb96f195e598b7 Manish Mandlik         2021-12-02  314  				kfree(dev);
eb96f195e598b7 Manish Mandlik         2021-12-02  315  			}
eb96f195e598b7 Manish Mandlik         2021-12-02  316  		}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  317  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  318  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  319  	/* If remove all mo=
nitors is required, we need to continue the process
182ee45da083db Luiz Augusto von Dentz 2021-10-27  320  	 * here because the=
 earlier it was paused when waiting for the
182ee45da083db Luiz Augusto von Dentz 2021-10-27  321  	 * response from co=
ntroller.
182ee45da083db Luiz Augusto von Dentz 2021-10-27  322  	 */
182ee45da083db Luiz Augusto von Dentz 2021-10-27  323  	if (msft->pending_r=
emove_handle =3D=3D 0) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  324  		pending =3D hci_re=
move_all_adv_monitor(hdev, &err);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  325  		if (pending) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  326  			hci_dev_unlock(hd=
ev);
ce81843be24e9d Manish Mandlik         2021-09-21  327  			return;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  328  		}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  329  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  330  		if (err)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  331  			status =3D HCI_ER=
ROR_UNSPECIFIED;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  332  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  333  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  334  	hci_dev_unlock(hdev=
);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  335  =

182ee45da083db Luiz Augusto von Dentz 2021-10-27  336  done:
182ee45da083db Luiz Augusto von Dentz 2021-10-27  337  	if (!msft->suspendi=
ng)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  338  		hci_remove_adv_mon=
itor_complete(hdev, status);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  339  }
182ee45da083db Luiz Augusto von Dentz 2021-10-27  340  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2250203496479830760==--

