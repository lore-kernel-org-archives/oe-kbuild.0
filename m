Content-Type: multipart/mixed; boundary="===============4638320877988918158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/pnvm.c:332 iwl_pnvm_load() error: uninitialized symbol 'len'.
Date: Wed, 23 Feb 2022 06:29:07 +0800
Message-ID: <202202230642.YsSCRAAM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4638320877988918158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   917bbdb107f8767cb78f24e7d6725a2f93b9effe
commit: 9dad325f9d57508b154f0bebbc341a8528e5729c iwlwifi: support loading t=
he reduced power table from UEFI
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220223/202202230642.YsSCRAAM-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/pnvm.c:332 iwl_pnvm_load() error: uni=
nitialized symbol 'len'.

vim +/len +332 drivers/net/wireless/intel/iwlwifi/fw/pnvm.c

cdda18fbbefafc6 Luca Coelho   2021-02-10  255  =

cdda18fbbefafc6 Luca Coelho   2021-02-10  256  int iwl_pnvm_load(struct iwl=
_trans *trans,
cdda18fbbefafc6 Luca Coelho   2021-02-10  257  		  struct iwl_notif_wait_da=
ta *notif_wait)
cdda18fbbefafc6 Luca Coelho   2021-02-10  258  {
cdda18fbbefafc6 Luca Coelho   2021-02-10  259  	u8 *data;
cdda18fbbefafc6 Luca Coelho   2021-02-10  260  	size_t len;
84c3c9952afbf7d Luca Coelho   2021-06-21  261  	struct pnvm_sku_package *pa=
ckage;
cdda18fbbefafc6 Luca Coelho   2021-02-10  262  	struct iwl_notification_wai=
t pnvm_wait;
cdda18fbbefafc6 Luca Coelho   2021-02-10  263  	static const u16 ntf_cmds[]=
 =3D { WIDE_ID(REGULATORY_AND_NVM_GROUP,
cdda18fbbefafc6 Luca Coelho   2021-02-10  264  						PNVM_INIT_COMPLETE_NTF=
Y) };
cdda18fbbefafc6 Luca Coelho   2021-02-10  265  	int ret;
cdda18fbbefafc6 Luca Coelho   2021-02-10  266  =

cdda18fbbefafc6 Luca Coelho   2021-02-10  267  	/* if the SKU_ID is empty, =
there's nothing to do */
cdda18fbbefafc6 Luca Coelho   2021-02-10  268  	if (!trans->sku_id[0] && !t=
rans->sku_id[1] && !trans->sku_id[2])
cdda18fbbefafc6 Luca Coelho   2021-02-10  269  		return 0;
cdda18fbbefafc6 Luca Coelho   2021-02-10  270  =

cdda18fbbefafc6 Luca Coelho   2021-02-10  271  	/*
cdda18fbbefafc6 Luca Coelho   2021-02-10  272  	 * If we already loaded (or=
 tried to load) it before, we just
cdda18fbbefafc6 Luca Coelho   2021-02-10  273  	 * need to set it again.
cdda18fbbefafc6 Luca Coelho   2021-02-10  274  	 */
cdda18fbbefafc6 Luca Coelho   2021-02-10  275  	if (trans->pnvm_loaded) {
cdda18fbbefafc6 Luca Coelho   2021-02-10  276  		ret =3D iwl_trans_set_pnvm=
(trans, NULL, 0);
cdda18fbbefafc6 Luca Coelho   2021-02-10  277  		if (ret)
cdda18fbbefafc6 Luca Coelho   2021-02-10  278  			return ret;
cdda18fbbefafc6 Luca Coelho   2021-02-10  279  		goto skip_parse;
cdda18fbbefafc6 Luca Coelho   2021-02-10  280  	}
cdda18fbbefafc6 Luca Coelho   2021-02-10  281  =

a1a6a4cf49eceb3 Luca Coelho   2021-02-11  282  	/* First attempt to get the=
 PNVM from BIOS */
84c3c9952afbf7d Luca Coelho   2021-06-21  283  	package =3D iwl_uefi_get_pn=
vm(trans, &len);
84c3c9952afbf7d Luca Coelho   2021-06-21  284  	if (!IS_ERR_OR_NULL(package=
)) {
84c3c9952afbf7d Luca Coelho   2021-06-21  285  		data =3D kmemdup(package->=
data, len, GFP_KERNEL);
84c3c9952afbf7d Luca Coelho   2021-06-21  286  =

84c3c9952afbf7d Luca Coelho   2021-06-21  287  		/* free package regardless=
 of whether kmemdup succeeded */
84c3c9952afbf7d Luca Coelho   2021-06-21  288  		kfree(package);
84c3c9952afbf7d Luca Coelho   2021-06-21  289  =

84c3c9952afbf7d Luca Coelho   2021-06-21  290  		if (data) {
84c3c9952afbf7d Luca Coelho   2021-06-21  291  			/* we need only the data =
size */
84c3c9952afbf7d Luca Coelho   2021-06-21  292  			len -=3D sizeof(*package);
a1a6a4cf49eceb3 Luca Coelho   2021-02-11  293  			goto parse;
84c3c9952afbf7d Luca Coelho   2021-06-21  294  		}
84c3c9952afbf7d Luca Coelho   2021-06-21  295  	}
a1a6a4cf49eceb3 Luca Coelho   2021-02-11  296  =

a1a6a4cf49eceb3 Luca Coelho   2021-02-11  297  	/* If it's not available, t=
ry from the filesystem */
cdda18fbbefafc6 Luca Coelho   2021-02-10  298  	ret =3D iwl_pnvm_get_from_f=
s(trans, &data, &len);
cdda18fbbefafc6 Luca Coelho   2021-02-10  299  	if (ret) {
82a08d0cd7b503b Johannes Berg 2021-01-15  300  		/*
82a08d0cd7b503b Johannes Berg 2021-01-15  301  		 * Pretend we've loaded it=
 - at least we've tried and
82a08d0cd7b503b Johannes Berg 2021-01-15  302  		 * couldn't load it at all=
, so there's no point in
82a08d0cd7b503b Johannes Berg 2021-01-15  303  		 * trying again over and o=
ver.
82a08d0cd7b503b Johannes Berg 2021-01-15  304  		 */
82a08d0cd7b503b Johannes Berg 2021-01-15  305  		trans->pnvm_loaded =3D tru=
e;
6972592850c00e5 Luca Coelho   2020-10-08  306  =

cdda18fbbefafc6 Luca Coelho   2021-02-10  307  		goto skip_parse;
1c58bed4b7f7551 Johannes Berg 2021-01-15  308  	}
b3e4c0f34c1752c Luca Coelho   2020-10-08  309  =

a1a6a4cf49eceb3 Luca Coelho   2021-02-11  310  parse:
cdda18fbbefafc6 Luca Coelho   2021-02-10  311  	iwl_pnvm_parse(trans, data,=
 len);
cdda18fbbefafc6 Luca Coelho   2021-02-10  312  =

cdda18fbbefafc6 Luca Coelho   2021-02-10  313  	kfree(data);
cdda18fbbefafc6 Luca Coelho   2021-02-10  314  =

cdda18fbbefafc6 Luca Coelho   2021-02-10  315  skip_parse:
9dad325f9d57508 Luca Coelho   2021-06-21  316  	data =3D NULL;
9dad325f9d57508 Luca Coelho   2021-06-21  317  	/* now try to get the reduc=
e power table, if not loaded yet */
9dad325f9d57508 Luca Coelho   2021-06-21  318  	if (!trans->reduce_power_lo=
aded) {
9dad325f9d57508 Luca Coelho   2021-06-21  319  		data =3D iwl_uefi_get_redu=
ced_power(trans, &len);
9dad325f9d57508 Luca Coelho   2021-06-21  320  		if (IS_ERR_OR_NULL(data)) {
9dad325f9d57508 Luca Coelho   2021-06-21  321  			/*
9dad325f9d57508 Luca Coelho   2021-06-21  322  			 * Pretend we've loaded i=
t - at least we've tried and
9dad325f9d57508 Luca Coelho   2021-06-21  323  			 * couldn't load it at al=
l, so there's no point in
9dad325f9d57508 Luca Coelho   2021-06-21  324  			 * trying again over and =
over.
9dad325f9d57508 Luca Coelho   2021-06-21  325  			 */
9dad325f9d57508 Luca Coelho   2021-06-21  326  			trans->reduce_power_loade=
d =3D true;
9dad325f9d57508 Luca Coelho   2021-06-21  327  =

9dad325f9d57508 Luca Coelho   2021-06-21  328  			goto skip_reduce_power;
9dad325f9d57508 Luca Coelho   2021-06-21  329  		}
9dad325f9d57508 Luca Coelho   2021-06-21  330  	}
9dad325f9d57508 Luca Coelho   2021-06-21  331  =

9dad325f9d57508 Luca Coelho   2021-06-21 @332  	ret =3D iwl_trans_set_reduc=
e_power(trans, data, len);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4638320877988918158==--

