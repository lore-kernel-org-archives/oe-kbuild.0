Content-Type: multipart/mixed; boundary="===============1109337970131088720=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/6] Bluetooth: eir: Move EIR/Adv Data functions to its own file
Date: Wed, 16 Jun 2021 21:06:35 +0800
Message-ID: <202106162100.YZKeaYEf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1109337970131088720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210609222124.298336-2-luiz.dentz@gmail.com>
References: <20210609222124.298336-2-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: linux-bluetooth(a)vger.kernel.org

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20210615]
[cannot apply to bluetooth/master v5.13-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Luiz-Augusto-von-Dentz/Blu=
etooth-Add-helper-for-serialized-HCI-command-execution/20210616-164554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/bluetooth/eir.c:295:4: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
      ptr +=3D 3;
      ^

vim +295 net/bluetooth/eir.c

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  214  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  215  u8 eir_create_adv_da=
ta(struct hci_dev *hdev, u8 instance, u8 *ptr)
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  216  {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  217  	struct adv_info *ad=
v =3D NULL;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  218  	u8 ad_len =3D 0, fl=
ags =3D 0;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  219  	u32 instance_flags;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  220  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  221  	/* Return 0 when th=
e current instance identifier is invalid. */
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  222  	if (instance) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  223  		adv =3D hci_find_a=
dv_instance(hdev, instance);
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  224  		if (!adv)
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  225  			return 0;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  226  	}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  227  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  228  	instance_flags =3D =
hci_adv_instance_flags(hdev, instance);
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  229  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  230  	/* If instance alre=
ady has the flags set skip adding it once
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  231  	 * again.
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  232  	 */
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  233  	if (adv && eir_get_=
data(adv->adv_data, adv->adv_data_len, EIR_FLAGS,
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  234  				NULL))
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  235  		goto skip_flags;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  236  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  237  	/* The Add Advertis=
ing command allows userspace to set both the general
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  238  	 * and limited disc=
overable flags.
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  239  	 */
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  240  	if (instance_flags =
& MGMT_ADV_FLAG_DISCOV)
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  241  		flags |=3D LE_AD_G=
ENERAL;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  242  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  243  	if (instance_flags =
& MGMT_ADV_FLAG_LIMITED_DISCOV)
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  244  		flags |=3D LE_AD_L=
IMITED;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  245  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  246  	if (!hci_dev_test_f=
lag(hdev, HCI_BREDR_ENABLED))
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  247  		flags |=3D LE_AD_N=
O_BREDR;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  248  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  249  	if (flags || (insta=
nce_flags & MGMT_ADV_FLAG_MANAGED_FLAGS)) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  250  		/* If a discovery =
flag wasn't provided, simply use the global
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  251  		 * settings.
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  252  		 */
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  253  		if (!flags)
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  254  			flags |=3D mgmt_g=
et_adv_discov_flags(hdev);
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  255  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  256  		/* If flags would =
still be empty, then there is no need to
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  257  		 * include the "Fl=
ags" AD field".
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  258  		 */
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  259  		if (flags) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  260  			ptr[0] =3D 0x02;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  261  			ptr[1] =3D EIR_FL=
AGS;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  262  			ptr[2] =3D flags;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  263  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  264  			ad_len +=3D 3;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  265  			ptr +=3D 3;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  266  		}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  267  	}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  268  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  269  skip_flags:
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  270  	if (adv) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  271  		memcpy(ptr, adv->a=
dv_data, adv->adv_data_len);
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  272  		ad_len +=3D adv->a=
dv_data_len;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  273  		ptr +=3D adv->adv_=
data_len;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  274  	}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  275  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  276  	if (instance_flags =
& MGMT_ADV_FLAG_TX_POWER) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  277  		s8 adv_tx_power;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  278  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  279  		if (ext_adv_capabl=
e(hdev)) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  280  			if (adv)
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  281  				adv_tx_power =3D=
 adv->tx_power;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  282  			else
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  283  				adv_tx_power =3D=
 hdev->adv_tx_power;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  284  		} else {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  285  			adv_tx_power =3D =
hdev->adv_tx_power;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  286  		}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  287  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  288  		/* Provide Tx Powe=
r only if we can provide a valid value for it */
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  289  		if (adv_tx_power !=
=3D HCI_TX_POWER_INVALID) {
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  290  			ptr[0] =3D 0x02;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  291  			ptr[1] =3D EIR_TX=
_POWER;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  292  			ptr[2] =3D (u8)ad=
v_tx_power;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  293  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  294  			ad_len +=3D 3;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09 @295  			ptr +=3D 3;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  296  		}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  297  	}
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  298  =

fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  299  	return ad_len;
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  300  }
fb463d77766be9 Luiz Augusto von Dentz 2021-06-09  301  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1109337970131088720==--

