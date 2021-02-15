Content-Type: multipart/mixed; boundary="===============1856323936271514701=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 2/2] Make cmdq_en attribute writeable
Date: Mon, 15 Feb 2021 11:09:01 +0800
Message-ID: <202102151151.bHkII4er-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1856323936271514701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210215003249.GA12303@lupo-laptop>
References: <20210215003249.GA12303@lupo-laptop>
TO: Luca Porzio <porzio@gmail.com>

Hi Luca,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20210212]
[cannot apply to linus/master mmc/mmc-next v5.11-rc7 v5.11-rc6 v5.11-rc5 v5=
.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Luca-Porzio/Support-tempor=
arily-disable-of-the-CMDQ-mode/20210215-083730
base:    07f7e57c63aaa2afb4ea31edef05e08699a63a00
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> drivers/mmc/core/mmc.c:870:9: warning: Uninitialized variable: err [unin=
itvar]
    return err;
           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/mmc/core/mmc.c:885:26: warning: Either the condition '!card' is =
redundant or there is possible null pointer dereference: card. [nullPointer=
RedundantCheck]
    struct mmc_host *host =3D card->host;
                            ^
   drivers/mmc/core/mmc.c:889:6: note: Assuming that condition '!card' is n=
ot redundant
    if (!card || kstrtoul(buf, 0, &enable))
        ^
   drivers/mmc/core/mmc.c:885:26: note: Null pointer dereference
    struct mmc_host *host =3D card->host;
                            ^

vim +885 drivers/mmc/core/mmc.c

07a9ce0e702520 Luca Porzio 2021-02-15  797  =

07a9ce0e702520 Luca Porzio 2021-02-15  798  =

07a9ce0e702520 Luca Porzio 2021-02-15  799  /* Setup command queue mode and=
 CQE if underling hw supports it
07a9ce0e702520 Luca Porzio 2021-02-15  800   * and assuming force_disable_c=
mdq has not been set.
07a9ce0e702520 Luca Porzio 2021-02-15  801   */
07a9ce0e702520 Luca Porzio 2021-02-15  802  static int mmc_cmdq_setup(struc=
t mmc_host *host, struct mmc_card *card)
07a9ce0e702520 Luca Porzio 2021-02-15  803  {
07a9ce0e702520 Luca Porzio 2021-02-15  804  	int err;
07a9ce0e702520 Luca Porzio 2021-02-15  805  =

07a9ce0e702520 Luca Porzio 2021-02-15  806  	/* Check HW support */
07a9ce0e702520 Luca Porzio 2021-02-15  807  	if (!card->ext_csd.cmdq_suppor=
t || !(host->caps2 & MMC_CAP2_CQE))
07a9ce0e702520 Luca Porzio 2021-02-15  808  		card->force_disable_cmdq =3D =
true;
07a9ce0e702520 Luca Porzio 2021-02-15  809  =

07a9ce0e702520 Luca Porzio 2021-02-15  810  	/* Enable/Disable  CMDQ mode */
07a9ce0e702520 Luca Porzio 2021-02-15  811  	if (!card->ext_csd.cmdq_en && =
!card->force_disable_cmdq) {
07a9ce0e702520 Luca Porzio 2021-02-15  812  		err =3D mmc_cmdq_enable(card);
07a9ce0e702520 Luca Porzio 2021-02-15  813  		if (err && err !=3D -EBADMSG)
07a9ce0e702520 Luca Porzio 2021-02-15  814  			return err;
07a9ce0e702520 Luca Porzio 2021-02-15  815  		if (err) {
07a9ce0e702520 Luca Porzio 2021-02-15  816  			pr_warn("%s: Enabling CMDQ f=
ailed\n",
07a9ce0e702520 Luca Porzio 2021-02-15  817  			    mmc_hostname(card->host)=
);
07a9ce0e702520 Luca Porzio 2021-02-15  818  			card->ext_csd.cmdq_support =
=3D false;
07a9ce0e702520 Luca Porzio 2021-02-15  819  			card->ext_csd.cmdq_depth =3D=
 0;
07a9ce0e702520 Luca Porzio 2021-02-15  820  		}
07a9ce0e702520 Luca Porzio 2021-02-15  821  =

07a9ce0e702520 Luca Porzio 2021-02-15  822  	} else if (card->ext_csd.cmdq_=
en && card->force_disable_cmdq) {
07a9ce0e702520 Luca Porzio 2021-02-15  823  		err =3D mmc_cmdq_disable(card=
);
07a9ce0e702520 Luca Porzio 2021-02-15  824  		if (err) {
07a9ce0e702520 Luca Porzio 2021-02-15  825  			pr_warn("%s: Disabling CMDQ =
failed, error %d\n",
07a9ce0e702520 Luca Porzio 2021-02-15  826  			    mmc_hostname(card->host)=
, err);
07a9ce0e702520 Luca Porzio 2021-02-15  827  			err =3D 0;
07a9ce0e702520 Luca Porzio 2021-02-15  828  		}
07a9ce0e702520 Luca Porzio 2021-02-15  829  	}
07a9ce0e702520 Luca Porzio 2021-02-15  830  =

07a9ce0e702520 Luca Porzio 2021-02-15  831  	/*
07a9ce0e702520 Luca Porzio 2021-02-15  832  	 * In some cases (e.g. RPMB or=
 mmc_test), the Command Queue must be
07a9ce0e702520 Luca Porzio 2021-02-15  833  	 * disabled for a time, so a f=
lag is needed to indicate to re-enable the
07a9ce0e702520 Luca Porzio 2021-02-15  834  	 * Command Queue.
07a9ce0e702520 Luca Porzio 2021-02-15  835  	 */
07a9ce0e702520 Luca Porzio 2021-02-15  836  	card->reenable_cmdq =3D card->=
ext_csd.cmdq_en;
07a9ce0e702520 Luca Porzio 2021-02-15  837  =

07a9ce0e702520 Luca Porzio 2021-02-15  838  	/* Enable/Disable Host CQE */
07a9ce0e702520 Luca Porzio 2021-02-15  839  	if (!card->force_disable_cmdq)=
 {
07a9ce0e702520 Luca Porzio 2021-02-15  840  =

07a9ce0e702520 Luca Porzio 2021-02-15  841  		if (host->cqe_ops && !host->c=
qe_enabled) {
07a9ce0e702520 Luca Porzio 2021-02-15  842  			err =3D host->cqe_ops->cqe_e=
nable(host, card);
07a9ce0e702520 Luca Porzio 2021-02-15  843  			if (!err) {
07a9ce0e702520 Luca Porzio 2021-02-15  844  				host->cqe_enabled =3D true;
07a9ce0e702520 Luca Porzio 2021-02-15  845  =

07a9ce0e702520 Luca Porzio 2021-02-15  846  				if (card->ext_csd.cmdq_en) {
07a9ce0e702520 Luca Porzio 2021-02-15  847  					pr_info("%s: Command Queue=
 Engine enabled\n",
07a9ce0e702520 Luca Porzio 2021-02-15  848  					    mmc_hostname(host));
07a9ce0e702520 Luca Porzio 2021-02-15  849  				} else {
07a9ce0e702520 Luca Porzio 2021-02-15  850  					host->hsq_enabled =3D true;
07a9ce0e702520 Luca Porzio 2021-02-15  851  					pr_info("%s: Host Software=
 Queue enabled\n",
07a9ce0e702520 Luca Porzio 2021-02-15  852  					    mmc_hostname(host));
07a9ce0e702520 Luca Porzio 2021-02-15  853  				}
07a9ce0e702520 Luca Porzio 2021-02-15  854  			}
07a9ce0e702520 Luca Porzio 2021-02-15  855  		}
07a9ce0e702520 Luca Porzio 2021-02-15  856  =

07a9ce0e702520 Luca Porzio 2021-02-15  857  	} else {
07a9ce0e702520 Luca Porzio 2021-02-15  858  =

07a9ce0e702520 Luca Porzio 2021-02-15  859  		if (host->cqe_enabled) {
07a9ce0e702520 Luca Porzio 2021-02-15  860  			host->cqe_ops->cqe_disable(h=
ost);
07a9ce0e702520 Luca Porzio 2021-02-15  861  			host->cqe_enabled =3D false;
07a9ce0e702520 Luca Porzio 2021-02-15  862  			pr_info("%s: Command Queue E=
ngine disabled\n",
07a9ce0e702520 Luca Porzio 2021-02-15  863  			    mmc_hostname(host));
07a9ce0e702520 Luca Porzio 2021-02-15  864  		}
07a9ce0e702520 Luca Porzio 2021-02-15  865  =

07a9ce0e702520 Luca Porzio 2021-02-15  866  		host->hsq_enabled =3D false;
07a9ce0e702520 Luca Porzio 2021-02-15  867  		err =3D 0;
07a9ce0e702520 Luca Porzio 2021-02-15  868  	}
07a9ce0e702520 Luca Porzio 2021-02-15  869  =

07a9ce0e702520 Luca Porzio 2021-02-15 @870  	return err;
07a9ce0e702520 Luca Porzio 2021-02-15  871  }
07a9ce0e702520 Luca Porzio 2021-02-15  872  =

07a9ce0e702520 Luca Porzio 2021-02-15  873  =

07a9ce0e702520 Luca Porzio 2021-02-15  874  static ssize_t cmdq_en_show(str=
uct device *dev, struct device_attribute *attr, char *buf)
07a9ce0e702520 Luca Porzio 2021-02-15  875  {
07a9ce0e702520 Luca Porzio 2021-02-15  876  	struct mmc_card *card =3D mmc_=
dev_to_card(dev);
07a9ce0e702520 Luca Porzio 2021-02-15  877  =

07a9ce0e702520 Luca Porzio 2021-02-15  878  	return sprintf(buf, "%d\n", ca=
rd->ext_csd.cmdq_en);
07a9ce0e702520 Luca Porzio 2021-02-15  879  }
07a9ce0e702520 Luca Porzio 2021-02-15  880  =

07a9ce0e702520 Luca Porzio 2021-02-15  881  static ssize_t cmdq_en_store(st=
ruct device *dev, struct device_attribute *attr,
07a9ce0e702520 Luca Porzio 2021-02-15  882  				 const char *buf, size_t co=
unt)
07a9ce0e702520 Luca Porzio 2021-02-15  883  {
07a9ce0e702520 Luca Porzio 2021-02-15  884  	struct mmc_card *card =3D mmc_=
dev_to_card(dev);
07a9ce0e702520 Luca Porzio 2021-02-15 @885  	struct mmc_host *host =3D card=
->host;
07a9ce0e702520 Luca Porzio 2021-02-15  886  	unsigned long enable;
07a9ce0e702520 Luca Porzio 2021-02-15  887  	int err;
07a9ce0e702520 Luca Porzio 2021-02-15  888  =

07a9ce0e702520 Luca Porzio 2021-02-15  889  	if (!card || kstrtoul(buf, 0, =
&enable))
07a9ce0e702520 Luca Porzio 2021-02-15  890  		return -EINVAL;
07a9ce0e702520 Luca Porzio 2021-02-15  891  	if (!card->ext_csd.cmdq_suppor=
t)
07a9ce0e702520 Luca Porzio 2021-02-15  892  		return -EOPNOTSUPP;
07a9ce0e702520 Luca Porzio 2021-02-15  893  =

07a9ce0e702520 Luca Porzio 2021-02-15  894  	enable =3D !!enable;
07a9ce0e702520 Luca Porzio 2021-02-15  895  	if (enable =3D=3D card->ext_cs=
d.cmdq_en)
07a9ce0e702520 Luca Porzio 2021-02-15  896  		return count;
07a9ce0e702520 Luca Porzio 2021-02-15  897  =

07a9ce0e702520 Luca Porzio 2021-02-15  898  	mmc_get_card(card, NULL);
07a9ce0e702520 Luca Porzio 2021-02-15  899  	card->force_disable_cmdq =3D !=
enable;
07a9ce0e702520 Luca Porzio 2021-02-15  900  	err =3D mmc_cmdq_setup(host, c=
ard);
07a9ce0e702520 Luca Porzio 2021-02-15  901  	mmc_put_card(card, NULL);
07a9ce0e702520 Luca Porzio 2021-02-15  902  =

07a9ce0e702520 Luca Porzio 2021-02-15  903  	if (err)
07a9ce0e702520 Luca Porzio 2021-02-15  904  		return err;
07a9ce0e702520 Luca Porzio 2021-02-15  905  	else
07a9ce0e702520 Luca Porzio 2021-02-15  906  		return count;
07a9ce0e702520 Luca Porzio 2021-02-15  907  }
07a9ce0e702520 Luca Porzio 2021-02-15  908  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1856323936271514701==--

