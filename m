Content-Type: multipart/mixed; boundary="===============7844540776750541562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mailbox/qcom-ipcc.c:207:25: warning: Parameter 'controller_dn' can be declared with const [constParameter]
Date: Sun, 01 May 2022 23:29:13 +0800
Message-ID: <202205012305.up4jVlhN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7844540776750541562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Huang Yiwei <quic_hyiwei@quicinc.com>
CC: Jassi Brar <jaswinder.singh@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: e9d50e4b4d04165097a71e20e0a77e7ad7053dd0 mailbox: qcom-ipcc: Dynami=
c alloc for channel arrangement
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e9d50e4b4d04165097a71e20e0a77e7ad7053dd0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/mailbox/qcom-ipcc.c:207:25: warning: Parameter 'controller_dn' c=
an be declared with const [constParameter]
       struct device_node *controller_dn)
                           ^

vim +/controller_dn +207 drivers/mailbox/qcom-ipcc.c

fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  205  =

e9d50e4b4d0416 Huang Yiwei           2021-11-22  206  static int qcom_ipcc_=
setup_mbox(struct qcom_ipcc *ipcc,
e9d50e4b4d0416 Huang Yiwei           2021-11-22 @207  				struct device_nod=
e *controller_dn)
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  208  {
e9d50e4b4d0416 Huang Yiwei           2021-11-22  209  	struct of_phandle_ar=
gs curr_ph;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  210  	struct device_node *=
client_dn;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  211  	struct mbox_controll=
er *mbox;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  212  	struct device *dev =
=3D ipcc->dev;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  213  	int i, j, ret;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  214  =

e9d50e4b4d0416 Huang Yiwei           2021-11-22  215  	/*
e9d50e4b4d0416 Huang Yiwei           2021-11-22  216  	 * Find out the numb=
er of clients interested in this mailbox
e9d50e4b4d0416 Huang Yiwei           2021-11-22  217  	 * and create channe=
ls accordingly.
e9d50e4b4d0416 Huang Yiwei           2021-11-22  218  	 */
e9d50e4b4d0416 Huang Yiwei           2021-11-22  219  	ipcc->num_chans =3D =
0;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  220  	for_each_node_with_p=
roperty(client_dn, "mboxes") {
e9d50e4b4d0416 Huang Yiwei           2021-11-22  221  		if (!of_device_is_a=
vailable(client_dn))
e9d50e4b4d0416 Huang Yiwei           2021-11-22  222  			continue;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  223  		i =3D of_count_phan=
dle_with_args(client_dn,
e9d50e4b4d0416 Huang Yiwei           2021-11-22  224  						"mboxes", "#mbo=
x-cells");
e9d50e4b4d0416 Huang Yiwei           2021-11-22  225  		for (j =3D 0; j < i=
; j++) {
e9d50e4b4d0416 Huang Yiwei           2021-11-22  226  			ret =3D of_parse_p=
handle_with_args(client_dn, "mboxes",
e9d50e4b4d0416 Huang Yiwei           2021-11-22  227  						"#mbox-cells", =
j, &curr_ph);
e9d50e4b4d0416 Huang Yiwei           2021-11-22  228  			of_node_put(curr_p=
h.np);
e9d50e4b4d0416 Huang Yiwei           2021-11-22  229  			if (!ret && curr_p=
h.np =3D=3D controller_dn) {
e9d50e4b4d0416 Huang Yiwei           2021-11-22  230  				ipcc->num_chans++;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  231  				break;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  232  			}
e9d50e4b4d0416 Huang Yiwei           2021-11-22  233  		}
e9d50e4b4d0416 Huang Yiwei           2021-11-22  234  	}
e9d50e4b4d0416 Huang Yiwei           2021-11-22  235  =

e9d50e4b4d0416 Huang Yiwei           2021-11-22  236  	/* If no clients are=
 found, skip registering as a mbox controller */
e9d50e4b4d0416 Huang Yiwei           2021-11-22  237  	if (!ipcc->num_chans)
e9d50e4b4d0416 Huang Yiwei           2021-11-22  238  		return 0;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  239  =

e9d50e4b4d0416 Huang Yiwei           2021-11-22  240  	ipcc->chans =3D devm=
_kcalloc(dev, ipcc->num_chans,
e9d50e4b4d0416 Huang Yiwei           2021-11-22  241  					sizeof(struct mb=
ox_chan), GFP_KERNEL);
e9d50e4b4d0416 Huang Yiwei           2021-11-22  242  	if (!ipcc->chans)
e9d50e4b4d0416 Huang Yiwei           2021-11-22  243  		return -ENOMEM;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  244  =

fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  245  	mbox =3D &ipcc->mbox;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  246  	mbox->dev =3D dev;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  247  	mbox->num_chans =3D =
ipcc->num_chans;
e9d50e4b4d0416 Huang Yiwei           2021-11-22  248  	mbox->chans =3D ipcc=
->chans;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  249  	mbox->ops =3D &ipcc_=
mbox_chan_ops;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  250  	mbox->of_xlate =3D q=
com_ipcc_mbox_xlate;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  251  	mbox->txdone_irq =3D=
 false;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  252  	mbox->txdone_poll =
=3D false;
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  253  =

fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  254  	return devm_mbox_con=
troller_register(dev, mbox);
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  255  }
fa74a0257f45c5 Manivannan Sadhasivam 2020-05-30  256  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7844540776750541562==--

