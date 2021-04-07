Content-Type: multipart/mixed; boundary="===============5001180566563772549=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bluetooth-next:master 2/5] drivers/bluetooth/virtio_bt.c:303:17: sparse: sparse: no generic selection for 'unsigned short virtio_cread_v'
Date: Wed, 07 Apr 2021 18:07:46 +0800
Message-ID: <202104071843.l6LiMBl9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5001180566563772549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-bluetooth(a)vger.kernel.org
TO: Marcel Holtmann <marcel@holtmann.org>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
head:   dc800a9106573bc39d15990ce57f1454d76c79cc
commit: 148a48f61393977fbeb2b9d41ac6ad3866a6990c [2/5] Bluetooth: Add suppo=
rt for virtio transport driver
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: powerpc-randconfig-s032-20210407 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-279-g6d5d9b42-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoo=
th-next.git/commit/?id=3D148a48f61393977fbeb2b9d41ac6ad3866a6990c
        git remote add bluetooth-next https://git.kernel.org/pub/scm/linux/=
kernel/git/bluetooth/bluetooth-next.git
        git fetch --no-tags bluetooth-next master
        git checkout 148a48f61393977fbeb2b9d41ac6ad3866a6990c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/virtio_bt.c:303:17: sparse: sparse: no generic selecti=
on for 'unsigned short virtio_cread_v'
>> drivers/bluetooth/virtio_bt.c:303:17: sparse: sparse: incompatible types=
 in comparison expression (different base types):
>> drivers/bluetooth/virtio_bt.c:303:17: sparse:    bad type *
>> drivers/bluetooth/virtio_bt.c:303:17: sparse:    unsigned short *
>> drivers/bluetooth/virtio_bt.c:303:17: sparse: sparse: no generic selecti=
on for 'unsigned short [addressable] virtio_cread_v'
   drivers/bluetooth/virtio_bt.c:336:17: sparse: sparse: no generic selecti=
on for 'unsigned short virtio_cread_v'
   drivers/bluetooth/virtio_bt.c:336:17: sparse: sparse: incompatible types=
 in comparison expression (different base types):
   drivers/bluetooth/virtio_bt.c:336:17: sparse:    bad type *
   drivers/bluetooth/virtio_bt.c:336:17: sparse:    unsigned short *
   drivers/bluetooth/virtio_bt.c:336:17: sparse: sparse: no generic selecti=
on for 'unsigned short [addressable] virtio_cread_v'

vim +303 drivers/bluetooth/virtio_bt.c

148a48f6139397 Marcel Holtmann 2021-04-06  240  =

148a48f6139397 Marcel Holtmann 2021-04-06  241  static int virtbt_probe(str=
uct virtio_device *vdev)
148a48f6139397 Marcel Holtmann 2021-04-06  242  {
148a48f6139397 Marcel Holtmann 2021-04-06  243  	vq_callback_t *callbacks[V=
IRTBT_NUM_VQS] =3D {
148a48f6139397 Marcel Holtmann 2021-04-06  244  		[VIRTBT_VQ_TX] =3D virtbt=
_tx_done,
148a48f6139397 Marcel Holtmann 2021-04-06  245  		[VIRTBT_VQ_RX] =3D virtbt=
_rx_done,
148a48f6139397 Marcel Holtmann 2021-04-06  246  	};
148a48f6139397 Marcel Holtmann 2021-04-06  247  	const char *names[VIRTBT_N=
UM_VQS] =3D {
148a48f6139397 Marcel Holtmann 2021-04-06  248  		[VIRTBT_VQ_TX] =3D "tx",
148a48f6139397 Marcel Holtmann 2021-04-06  249  		[VIRTBT_VQ_RX] =3D "rx",
148a48f6139397 Marcel Holtmann 2021-04-06  250  	};
148a48f6139397 Marcel Holtmann 2021-04-06  251  	struct virtio_bluetooth *v=
bt;
148a48f6139397 Marcel Holtmann 2021-04-06  252  	struct hci_dev *hdev;
148a48f6139397 Marcel Holtmann 2021-04-06  253  	int err;
148a48f6139397 Marcel Holtmann 2021-04-06  254  	__u8 type;
148a48f6139397 Marcel Holtmann 2021-04-06  255  =

148a48f6139397 Marcel Holtmann 2021-04-06  256  	if (!virtio_has_feature(vd=
ev, VIRTIO_F_VERSION_1))
148a48f6139397 Marcel Holtmann 2021-04-06  257  		return -ENODEV;
148a48f6139397 Marcel Holtmann 2021-04-06  258  =

148a48f6139397 Marcel Holtmann 2021-04-06  259  	type =3D virtio_cread8(vde=
v, offsetof(struct virtio_bt_config, type));
148a48f6139397 Marcel Holtmann 2021-04-06  260  =

148a48f6139397 Marcel Holtmann 2021-04-06  261  	switch (type) {
148a48f6139397 Marcel Holtmann 2021-04-06  262  	case VIRTIO_BT_CONFIG_TYPE=
_PRIMARY:
148a48f6139397 Marcel Holtmann 2021-04-06  263  	case VIRTIO_BT_CONFIG_TYPE=
_AMP:
148a48f6139397 Marcel Holtmann 2021-04-06  264  		break;
148a48f6139397 Marcel Holtmann 2021-04-06  265  	default:
148a48f6139397 Marcel Holtmann 2021-04-06  266  		return -EINVAL;
148a48f6139397 Marcel Holtmann 2021-04-06  267  	}
148a48f6139397 Marcel Holtmann 2021-04-06  268  =

148a48f6139397 Marcel Holtmann 2021-04-06  269  	vbt =3D kzalloc(sizeof(*vb=
t), GFP_KERNEL);
148a48f6139397 Marcel Holtmann 2021-04-06  270  	if (!vbt)
148a48f6139397 Marcel Holtmann 2021-04-06  271  		return -ENOMEM;
148a48f6139397 Marcel Holtmann 2021-04-06  272  =

148a48f6139397 Marcel Holtmann 2021-04-06  273  	vdev->priv =3D vbt;
148a48f6139397 Marcel Holtmann 2021-04-06  274  	vbt->vdev =3D vdev;
148a48f6139397 Marcel Holtmann 2021-04-06  275  =

148a48f6139397 Marcel Holtmann 2021-04-06  276  	INIT_WORK(&vbt->rx, virtbt=
_rx_work);
148a48f6139397 Marcel Holtmann 2021-04-06  277  =

148a48f6139397 Marcel Holtmann 2021-04-06  278  	err =3D virtio_find_vqs(vd=
ev, VIRTBT_NUM_VQS, vbt->vqs, callbacks,
148a48f6139397 Marcel Holtmann 2021-04-06  279  			      names, NULL);
148a48f6139397 Marcel Holtmann 2021-04-06  280  	if (err)
148a48f6139397 Marcel Holtmann 2021-04-06  281  		return err;
148a48f6139397 Marcel Holtmann 2021-04-06  282  =

148a48f6139397 Marcel Holtmann 2021-04-06  283  	hdev =3D hci_alloc_dev();
148a48f6139397 Marcel Holtmann 2021-04-06  284  	if (!hdev) {
148a48f6139397 Marcel Holtmann 2021-04-06  285  		err =3D -ENOMEM;
148a48f6139397 Marcel Holtmann 2021-04-06  286  		goto failed;
148a48f6139397 Marcel Holtmann 2021-04-06  287  	}
148a48f6139397 Marcel Holtmann 2021-04-06  288  =

148a48f6139397 Marcel Holtmann 2021-04-06  289  	vbt->hdev =3D hdev;
148a48f6139397 Marcel Holtmann 2021-04-06  290  =

148a48f6139397 Marcel Holtmann 2021-04-06  291  	hdev->bus =3D HCI_VIRTIO;
148a48f6139397 Marcel Holtmann 2021-04-06  292  	hdev->dev_type =3D type;
148a48f6139397 Marcel Holtmann 2021-04-06  293  	hci_set_drvdata(hdev, vbt);
148a48f6139397 Marcel Holtmann 2021-04-06  294  =

148a48f6139397 Marcel Holtmann 2021-04-06  295  	hdev->open  =3D virtbt_ope=
n;
148a48f6139397 Marcel Holtmann 2021-04-06  296  	hdev->close =3D virtbt_clo=
se;
148a48f6139397 Marcel Holtmann 2021-04-06  297  	hdev->flush =3D virtbt_flu=
sh;
148a48f6139397 Marcel Holtmann 2021-04-06  298  	hdev->send  =3D virtbt_sen=
d_frame;
148a48f6139397 Marcel Holtmann 2021-04-06  299  =

148a48f6139397 Marcel Holtmann 2021-04-06  300  	if (virtio_has_feature(vde=
v, VIRTIO_BT_F_VND_HCI)) {
148a48f6139397 Marcel Holtmann 2021-04-06  301  		__u16 vendor;
148a48f6139397 Marcel Holtmann 2021-04-06  302  =

148a48f6139397 Marcel Holtmann 2021-04-06 @303  		virtio_cread(vdev, struct=
 virtio_bt_config, vendor, &vendor);
148a48f6139397 Marcel Holtmann 2021-04-06  304  =

148a48f6139397 Marcel Holtmann 2021-04-06  305  		switch (vendor) {
148a48f6139397 Marcel Holtmann 2021-04-06  306  		case VIRTIO_BT_CONFIG_VEN=
DOR_ZEPHYR:
148a48f6139397 Marcel Holtmann 2021-04-06  307  			hdev->manufacturer =3D 1=
521;
148a48f6139397 Marcel Holtmann 2021-04-06  308  			hdev->setup =3D virtbt_s=
etup_zephyr;
148a48f6139397 Marcel Holtmann 2021-04-06  309  			hdev->shutdown =3D virtb=
t_shutdown_generic;
148a48f6139397 Marcel Holtmann 2021-04-06  310  			hdev->set_bdaddr =3D vir=
tbt_set_bdaddr_zephyr;
148a48f6139397 Marcel Holtmann 2021-04-06  311  			break;
148a48f6139397 Marcel Holtmann 2021-04-06  312  =

148a48f6139397 Marcel Holtmann 2021-04-06  313  		case VIRTIO_BT_CONFIG_VEN=
DOR_INTEL:
148a48f6139397 Marcel Holtmann 2021-04-06  314  			hdev->manufacturer =3D 2;
148a48f6139397 Marcel Holtmann 2021-04-06  315  			hdev->setup =3D virtbt_s=
etup_intel;
148a48f6139397 Marcel Holtmann 2021-04-06  316  			hdev->shutdown =3D virtb=
t_shutdown_generic;
148a48f6139397 Marcel Holtmann 2021-04-06  317  			hdev->set_bdaddr =3D vir=
tbt_set_bdaddr_intel;
148a48f6139397 Marcel Holtmann 2021-04-06  318  			set_bit(HCI_QUIRK_STRICT=
_DUPLICATE_FILTER, &hdev->quirks);
148a48f6139397 Marcel Holtmann 2021-04-06  319  			set_bit(HCI_QUIRK_SIMULT=
ANEOUS_DISCOVERY, &hdev->quirks);
148a48f6139397 Marcel Holtmann 2021-04-06  320  			set_bit(HCI_QUIRK_WIDEBA=
ND_SPEECH_SUPPORTED, &hdev->quirks);
148a48f6139397 Marcel Holtmann 2021-04-06  321  			break;
148a48f6139397 Marcel Holtmann 2021-04-06  322  =

148a48f6139397 Marcel Holtmann 2021-04-06  323  		case VIRTIO_BT_CONFIG_VEN=
DOR_REALTEK:
148a48f6139397 Marcel Holtmann 2021-04-06  324  			hdev->manufacturer =3D 9=
3;
148a48f6139397 Marcel Holtmann 2021-04-06  325  			hdev->setup =3D virtbt_s=
etup_realtek;
148a48f6139397 Marcel Holtmann 2021-04-06  326  			hdev->shutdown =3D virtb=
t_shutdown_generic;
148a48f6139397 Marcel Holtmann 2021-04-06  327  			set_bit(HCI_QUIRK_SIMULT=
ANEOUS_DISCOVERY, &hdev->quirks);
148a48f6139397 Marcel Holtmann 2021-04-06  328  			set_bit(HCI_QUIRK_WIDEBA=
ND_SPEECH_SUPPORTED, &hdev->quirks);
148a48f6139397 Marcel Holtmann 2021-04-06  329  			break;
148a48f6139397 Marcel Holtmann 2021-04-06  330  		}
148a48f6139397 Marcel Holtmann 2021-04-06  331  	}
148a48f6139397 Marcel Holtmann 2021-04-06  332  =

148a48f6139397 Marcel Holtmann 2021-04-06  333  	if (virtio_has_feature(vde=
v, VIRTIO_BT_F_MSFT_EXT)) {
148a48f6139397 Marcel Holtmann 2021-04-06  334  		__u16 msft_opcode;
148a48f6139397 Marcel Holtmann 2021-04-06  335  =

148a48f6139397 Marcel Holtmann 2021-04-06  336  		virtio_cread(vdev, struct=
 virtio_bt_config,
148a48f6139397 Marcel Holtmann 2021-04-06  337  			     msft_opcode, &msft_=
opcode);
148a48f6139397 Marcel Holtmann 2021-04-06  338  =

148a48f6139397 Marcel Holtmann 2021-04-06  339  		hci_set_msft_opcode(hdev,=
 msft_opcode);
148a48f6139397 Marcel Holtmann 2021-04-06  340  	}
148a48f6139397 Marcel Holtmann 2021-04-06  341  =

148a48f6139397 Marcel Holtmann 2021-04-06  342  	if (virtio_has_feature(vde=
v, VIRTIO_BT_F_AOSP_EXT))
148a48f6139397 Marcel Holtmann 2021-04-06  343  		hci_set_aosp_capable(hdev=
);
148a48f6139397 Marcel Holtmann 2021-04-06  344  =

148a48f6139397 Marcel Holtmann 2021-04-06  345  	if (hci_register_dev(hdev)=
 < 0) {
148a48f6139397 Marcel Holtmann 2021-04-06  346  		hci_free_dev(hdev);
148a48f6139397 Marcel Holtmann 2021-04-06  347  		err =3D -EBUSY;
148a48f6139397 Marcel Holtmann 2021-04-06  348  		goto failed;
148a48f6139397 Marcel Holtmann 2021-04-06  349  	}
148a48f6139397 Marcel Holtmann 2021-04-06  350  =

148a48f6139397 Marcel Holtmann 2021-04-06  351  	return 0;
148a48f6139397 Marcel Holtmann 2021-04-06  352  =

148a48f6139397 Marcel Holtmann 2021-04-06  353  failed:
148a48f6139397 Marcel Holtmann 2021-04-06  354  	vdev->config->del_vqs(vdev=
);
148a48f6139397 Marcel Holtmann 2021-04-06  355  	return err;
148a48f6139397 Marcel Holtmann 2021-04-06  356  }
148a48f6139397 Marcel Holtmann 2021-04-06  357  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5001180566563772549==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/z/1coWersgBAA==
--===============5001180566563772549==--

