Content-Type: multipart/mixed; boundary="===============4898051252698734163=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-sound:for-next 26/50] drivers/firmware/cirrus/cs_dsp.c:761 cs_dsp_coeff_write_ctrl() warn: variable dereferenced before check 'ctl' (see line 759)
Date: Fri, 26 Nov 2021 01:38:56 +0800
Message-ID: <202111260147.g6ZphXY3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4898051252698734163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
head:   2b9c8d2b3c89708d53b6124dc49c212dc5341840
commit: 86c6080407740937ed2ba0ccd181e947f77e2154 [26/50] firmware: cs_dsp: =
Perform NULL check in cs_dsp_coeff_write/read_ctrl
:::::: branch date: 6 hours ago
:::::: commit date: 8 days ago
config: openrisc-randconfig-m031-20211122 (https://download.01.org/0day-ci/=
archive/20211126/202111260147.g6ZphXY3-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/firmware/cirrus/cs_dsp.c:761 cs_dsp_coeff_write_ctrl() warn: variab=
le dereferenced before check 'ctl' (see line 759)
drivers/firmware/cirrus/cs_dsp.c:823 cs_dsp_coeff_read_ctrl() warn: variabl=
e dereferenced before check 'ctl' (see line 821)

Old smatch warnings:
drivers/firmware/cirrus/cs_dsp.c:1647 cs_dsp_create_regions() warn: passing=
 a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1683 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1689 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1713 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1735 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1788 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1794 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1800 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1826 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1848 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1870 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'

vim +/ctl +761 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c30 Simon Trimmer  2021-09-13  744  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  745  /**
f6bc909e7673c30 Simon Trimmer  2021-09-13  746   * cs_dsp_coeff_write_ctrl(=
) - Writes the given buffer to the given coefficient control
f6bc909e7673c30 Simon Trimmer  2021-09-13  747   * @ctl: pointer to coeffic=
ient control
f6bc909e7673c30 Simon Trimmer  2021-09-13  748   * @buf: the buffer to writ=
e to the given control
f6bc909e7673c30 Simon Trimmer  2021-09-13  749   * @len: the length of the =
buffer
f6bc909e7673c30 Simon Trimmer  2021-09-13  750   *
f6bc909e7673c30 Simon Trimmer  2021-09-13  751   * Must be called with pwr_=
lock held.
f6bc909e7673c30 Simon Trimmer  2021-09-13  752   *
f6bc909e7673c30 Simon Trimmer  2021-09-13  753   * Return: Zero for success=
, a negative number on error.
f6bc909e7673c30 Simon Trimmer  2021-09-13  754   */
f6bc909e7673c30 Simon Trimmer  2021-09-13  755  int cs_dsp_coeff_write_ctrl=
(struct cs_dsp_coeff_ctl *ctl, const void *buf, size_t len)
f6bc909e7673c30 Simon Trimmer  2021-09-13  756  {
f6bc909e7673c30 Simon Trimmer  2021-09-13  757  	int ret =3D 0;
f6bc909e7673c30 Simon Trimmer  2021-09-13  758  =

5065cfabec21a4a Charles Keepax 2021-11-17 @759  	lockdep_assert_held(&ctl->=
dsp->pwr_lock);
5065cfabec21a4a Charles Keepax 2021-11-17  760  =

86c608040774093 Charles Keepax 2021-11-17 @761  	if (!ctl)
86c608040774093 Charles Keepax 2021-11-17  762  		return -ENOENT;
86c608040774093 Charles Keepax 2021-11-17  763  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  764  	if (ctl->flags & WMFW_CTL_=
FLAG_VOLATILE)
f6bc909e7673c30 Simon Trimmer  2021-09-13  765  		ret =3D -EPERM;
f6bc909e7673c30 Simon Trimmer  2021-09-13  766  	else if (buf !=3D ctl->cac=
he)
f6bc909e7673c30 Simon Trimmer  2021-09-13  767  		memcpy(ctl->cache, buf, l=
en);
f6bc909e7673c30 Simon Trimmer  2021-09-13  768  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  769  	ctl->set =3D 1;
f6bc909e7673c30 Simon Trimmer  2021-09-13  770  	if (ctl->enabled && ctl->d=
sp->running)
f6bc909e7673c30 Simon Trimmer  2021-09-13  771  		ret =3D cs_dsp_coeff_writ=
e_ctrl_raw(ctl, buf, len);
f6bc909e7673c30 Simon Trimmer  2021-09-13  772  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  773  	return ret;
f6bc909e7673c30 Simon Trimmer  2021-09-13  774  }
f6bc909e7673c30 Simon Trimmer  2021-09-13  775  EXPORT_SYMBOL_GPL(cs_dsp_co=
eff_write_ctrl);
f6bc909e7673c30 Simon Trimmer  2021-09-13  776  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  777  static int cs_dsp_coeff_rea=
d_ctrl_raw(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
f6bc909e7673c30 Simon Trimmer  2021-09-13  778  {
f6bc909e7673c30 Simon Trimmer  2021-09-13  779  	struct cs_dsp *dsp =3D ctl=
->dsp;
f6bc909e7673c30 Simon Trimmer  2021-09-13  780  	void *scratch;
f6bc909e7673c30 Simon Trimmer  2021-09-13  781  	int ret;
f6bc909e7673c30 Simon Trimmer  2021-09-13  782  	unsigned int reg;
f6bc909e7673c30 Simon Trimmer  2021-09-13  783  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  784  	ret =3D cs_dsp_coeff_base_=
reg(ctl, &reg);
f6bc909e7673c30 Simon Trimmer  2021-09-13  785  	if (ret)
f6bc909e7673c30 Simon Trimmer  2021-09-13  786  		return ret;
f6bc909e7673c30 Simon Trimmer  2021-09-13  787  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  788  	scratch =3D kmalloc(len, G=
FP_KERNEL | GFP_DMA);
f6bc909e7673c30 Simon Trimmer  2021-09-13  789  	if (!scratch)
f6bc909e7673c30 Simon Trimmer  2021-09-13  790  		return -ENOMEM;
f6bc909e7673c30 Simon Trimmer  2021-09-13  791  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  792  	ret =3D regmap_raw_read(ds=
p->regmap, reg, scratch, len);
f6bc909e7673c30 Simon Trimmer  2021-09-13  793  	if (ret) {
f6bc909e7673c30 Simon Trimmer  2021-09-13  794  		cs_dsp_err(dsp, "Failed t=
o read %zu bytes from %x: %d\n",
f6bc909e7673c30 Simon Trimmer  2021-09-13  795  			   len, reg, ret);
f6bc909e7673c30 Simon Trimmer  2021-09-13  796  		kfree(scratch);
f6bc909e7673c30 Simon Trimmer  2021-09-13  797  		return ret;
f6bc909e7673c30 Simon Trimmer  2021-09-13  798  	}
f6bc909e7673c30 Simon Trimmer  2021-09-13  799  	cs_dsp_dbg(dsp, "Read %zu =
bytes from %x\n", len, reg);
f6bc909e7673c30 Simon Trimmer  2021-09-13  800  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  801  	memcpy(buf, scratch, len);
f6bc909e7673c30 Simon Trimmer  2021-09-13  802  	kfree(scratch);
f6bc909e7673c30 Simon Trimmer  2021-09-13  803  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  804  	return 0;
f6bc909e7673c30 Simon Trimmer  2021-09-13  805  }
f6bc909e7673c30 Simon Trimmer  2021-09-13  806  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  807  /**
f6bc909e7673c30 Simon Trimmer  2021-09-13  808   * cs_dsp_coeff_read_ctrl()=
 - Reads the given coefficient control into the given buffer
f6bc909e7673c30 Simon Trimmer  2021-09-13  809   * @ctl: pointer to coeffic=
ient control
f6bc909e7673c30 Simon Trimmer  2021-09-13  810   * @buf: the buffer to stor=
e to the given control
f6bc909e7673c30 Simon Trimmer  2021-09-13  811   * @len: the length of the =
buffer
f6bc909e7673c30 Simon Trimmer  2021-09-13  812   *
f6bc909e7673c30 Simon Trimmer  2021-09-13  813   * Must be called with pwr_=
lock held.
f6bc909e7673c30 Simon Trimmer  2021-09-13  814   *
f6bc909e7673c30 Simon Trimmer  2021-09-13  815   * Return: Zero for success=
, a negative number on error.
f6bc909e7673c30 Simon Trimmer  2021-09-13  816   */
f6bc909e7673c30 Simon Trimmer  2021-09-13  817  int cs_dsp_coeff_read_ctrl(=
struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
f6bc909e7673c30 Simon Trimmer  2021-09-13  818  {
f6bc909e7673c30 Simon Trimmer  2021-09-13  819  	int ret =3D 0;
f6bc909e7673c30 Simon Trimmer  2021-09-13  820  =

5065cfabec21a4a Charles Keepax 2021-11-17 @821  	lockdep_assert_held(&ctl->=
dsp->pwr_lock);
5065cfabec21a4a Charles Keepax 2021-11-17  822  =

86c608040774093 Charles Keepax 2021-11-17 @823  	if (!ctl)
86c608040774093 Charles Keepax 2021-11-17  824  		return -ENOENT;
86c608040774093 Charles Keepax 2021-11-17  825  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  826  	if (ctl->flags & WMFW_CTL_=
FLAG_VOLATILE) {
f6bc909e7673c30 Simon Trimmer  2021-09-13  827  		if (ctl->enabled && ctl->=
dsp->running)
f6bc909e7673c30 Simon Trimmer  2021-09-13  828  			return cs_dsp_coeff_read=
_ctrl_raw(ctl, buf, len);
f6bc909e7673c30 Simon Trimmer  2021-09-13  829  		else
f6bc909e7673c30 Simon Trimmer  2021-09-13  830  			return -EPERM;
f6bc909e7673c30 Simon Trimmer  2021-09-13  831  	} else {
f6bc909e7673c30 Simon Trimmer  2021-09-13  832  		if (!ctl->flags && ctl->e=
nabled && ctl->dsp->running)
f6bc909e7673c30 Simon Trimmer  2021-09-13  833  			ret =3D cs_dsp_coeff_rea=
d_ctrl_raw(ctl, ctl->cache, ctl->len);
f6bc909e7673c30 Simon Trimmer  2021-09-13  834  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  835  		if (buf !=3D ctl->cache)
f6bc909e7673c30 Simon Trimmer  2021-09-13  836  			memcpy(buf, ctl->cache, =
len);
f6bc909e7673c30 Simon Trimmer  2021-09-13  837  	}
f6bc909e7673c30 Simon Trimmer  2021-09-13  838  =

f6bc909e7673c30 Simon Trimmer  2021-09-13  839  	return ret;
f6bc909e7673c30 Simon Trimmer  2021-09-13  840  }
f6bc909e7673c30 Simon Trimmer  2021-09-13  841  EXPORT_SYMBOL_GPL(cs_dsp_co=
eff_read_ctrl);
f6bc909e7673c30 Simon Trimmer  2021-09-13  842  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4898051252698734163==--

