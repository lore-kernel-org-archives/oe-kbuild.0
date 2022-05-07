Content-Type: multipart/mixed; boundary="===============0952951246893280519=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/eir.c:295:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Sun, 08 May 2022 05:15:02 +0800
Message-ID: <202205080518.sEFxGAWh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0952951246893280519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 01ce70b0a274bd76a5a311fb90d4d446d9bdfea1 Bluetooth: eir: Move EIR/A=
dv Data functions to its own file
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 01ce70b0a274bd76a5a311fb90d4d446d9bdfea1
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/bluetooth/eir.c:295:4: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
      ptr +=3D 3;
      ^
>> net/bluetooth/mgmt.c:9655:8: warning: Local variable 'flags' shadows out=
er argument [shadowArgument]
      u8 *flags =3D eir_get_data(eir, eir_len, EIR_FLAGS, NULL);
          ^
   net/bluetooth/mgmt.c:9621:52: note: Shadowed declaration
            u8 addr_type, u8 *dev_class, s8 rssi, u32 flags,
                                                      ^
   net/bluetooth/mgmt.c:9655:8: note: Shadow variable
      u8 *flags =3D eir_get_data(eir, eir_len, EIR_FLAGS, NULL);
          ^
>> net/bluetooth/mgmt.c:7825:72: warning: Parameter 'data' can be declared =
with const [constParameter]
   static bool tlv_data_is_valid(struct hci_dev *hdev, u32 adv_flags, u8 *d=
ata,
                                                                          ^
>> net/bluetooth/mgmt.c:2047:16: warning: Uninitialized variable: cmd->opco=
de [uninitvar]
     switch (cmd->opcode) {
                  ^
   net/bluetooth/mgmt.c:2820:12: warning: Uninitialized variable: cmd->opco=
de [uninitvar]
     if (cmd->opcode !=3D MGMT_OP_PAIR_DEVICE)
              ^

vim +295 net/bluetooth/eir.c

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  214  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  215  u8 eir_create_adv_da=
ta(struct hci_dev *hdev, u8 instance, u8 *ptr)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  216  {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  217  	struct adv_info *ad=
v =3D NULL;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  218  	u8 ad_len =3D 0, fl=
ags =3D 0;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  219  	u32 instance_flags;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  220  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  221  	/* Return 0 when th=
e current instance identifier is invalid. */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  222  	if (instance) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  223  		adv =3D hci_find_a=
dv_instance(hdev, instance);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  224  		if (!adv)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  225  			return 0;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  226  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  227  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  228  	instance_flags =3D =
hci_adv_instance_flags(hdev, instance);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  229  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  230  	/* If instance alre=
ady has the flags set skip adding it once
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  231  	 * again.
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  232  	 */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  233  	if (adv && eir_get_=
data(adv->adv_data, adv->adv_data_len, EIR_FLAGS,
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  234  				NULL))
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  235  		goto skip_flags;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  236  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  237  	/* The Add Advertis=
ing command allows userspace to set both the general
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  238  	 * and limited disc=
overable flags.
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  239  	 */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  240  	if (instance_flags =
& MGMT_ADV_FLAG_DISCOV)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  241  		flags |=3D LE_AD_G=
ENERAL;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  242  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  243  	if (instance_flags =
& MGMT_ADV_FLAG_LIMITED_DISCOV)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  244  		flags |=3D LE_AD_L=
IMITED;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  245  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  246  	if (!hci_dev_test_f=
lag(hdev, HCI_BREDR_ENABLED))
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  247  		flags |=3D LE_AD_N=
O_BREDR;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  248  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  249  	if (flags || (insta=
nce_flags & MGMT_ADV_FLAG_MANAGED_FLAGS)) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  250  		/* If a discovery =
flag wasn't provided, simply use the global
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  251  		 * settings.
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  252  		 */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  253  		if (!flags)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  254  			flags |=3D mgmt_g=
et_adv_discov_flags(hdev);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  255  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  256  		/* If flags would =
still be empty, then there is no need to
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  257  		 * include the "Fl=
ags" AD field".
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  258  		 */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  259  		if (flags) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  260  			ptr[0] =3D 0x02;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  261  			ptr[1] =3D EIR_FL=
AGS;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  262  			ptr[2] =3D flags;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  263  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  264  			ad_len +=3D 3;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  265  			ptr +=3D 3;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  266  		}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  267  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  268  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  269  skip_flags:
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  270  	if (adv) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  271  		memcpy(ptr, adv->a=
dv_data, adv->adv_data_len);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  272  		ad_len +=3D adv->a=
dv_data_len;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  273  		ptr +=3D adv->adv_=
data_len;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  274  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  275  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  276  	if (instance_flags =
& MGMT_ADV_FLAG_TX_POWER) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  277  		s8 adv_tx_power;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  278  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  279  		if (ext_adv_capabl=
e(hdev)) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  280  			if (adv)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  281  				adv_tx_power =3D=
 adv->tx_power;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  282  			else
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  283  				adv_tx_power =3D=
 hdev->adv_tx_power;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  284  		} else {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  285  			adv_tx_power =3D =
hdev->adv_tx_power;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  286  		}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  287  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  288  		/* Provide Tx Powe=
r only if we can provide a valid value for it */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  289  		if (adv_tx_power !=
=3D HCI_TX_POWER_INVALID) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  290  			ptr[0] =3D 0x02;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  291  			ptr[1] =3D EIR_TX=
_POWER;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  292  			ptr[2] =3D (u8)ad=
v_tx_power;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  293  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  294  			ad_len +=3D 3;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20 @295  			ptr +=3D 3;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  296  		}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  297  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  298  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  299  	return ad_len;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  300  }
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  301  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0952951246893280519==--

